##########################################
Momentum Shifts Revert Physics [DukeItOut]
##########################################
HOOK @ $80867A98		  # Most contexts trigger this, but we may not want to try modifying all of those without testing for necessity!
{
    lwz r12, 0x7C(r29)    # \ Check if this character was exiting jumpsquat
    lhz r3, 0x6(r12)      # |
    cmpwi r3, 0xA         # | If it was, do not run this code, a different compensation was achieved.
    beq- skipReversion    # /
	lwz r0, 0x38(r12)	  # Get the current action
	cmpwi r0, 0x21		  # \ Check if this character is entering air dodge
	beq- reversion	  	  # / If so, we want to revert the Y position.

	
	
revertDJCcheck:
	cmpwi r0, 0x33		  # \ Check if this character is entering an aerial attack
	bne+ skipReversion	  # / Only air dodges and DJCs are going to be targeted here
	cmpwi r3, 0xC		  # \ Check if this is exiting a mid-air jump
	bne+ skipReversion	  # /
	lwz r11, 0x14(r29)	  # \
	lwz r11, 0x40(r11)	  # | Check if animation frame is 0. Takes advantage of float 0 and int 0 being equal.
	cmpwi r11, 0		  # | This triggers every frame of an aerial attack otherwise, which isn't ideal to modify.
	bne skipReversion	  # /
	lwz r11, 0x08(r29)    # \ Get the character ID
	lwz r11, 0x110(r11)	  # /
	cmpwi r11, 0x04		  # \ Is it Yoshi?
	beq- reversion		  # /
	cmpwi r11, 0x0A		  # \ Is it Ness?
	beq- reversion		  # /
	cmpwi r11, 0x1A		  # \ Is it Lucas?
	bne+ skipReversion	  # /

reversion:	
	lwz r3, 0x1C(r29)	# \
	lwz r3, 0x28(r3)	# | Get collision info
	lwz r3, 0x10(r3)	# /
	lbz r3, 0x75(r3)	# Collision contact status
	andi. r0, r3, 0x80	# Touching floor?
	bne+ skipReversion
	lwz r12, 0x7C(r29)	# \ Check if we dropped from ledge
	lhz r3, 0x06(r12)	# |
	cmpwi r3, 0x75		# | If it was, let's just treat it like before to not affect windows too much.
	bne+ updatePos		# |
	lwz r3, 0x38(r12)	# |
	cmpwi r3, 0x0E		# |
	bne- skipReversion	# /
updatePos:
    lwz r12, 0x18(r29)    
    lfs f0, 0x1C(r12)    # Prev Y pos
    stfs f0, 0x10(r12)    # Current Y pos
		
	
skipReversion:
   
    li r0, -1			# Original operation
}

HOOK @ $8077FE18        # When done from outside of a PSA and getting ready to land
{
	mr r4, r3			# Preserve this
	lwz r12, 0x08(r31)
	lwz r12, 0x3C(r12)
	lwz r12, 0xA4(r12)
	mtctr r12
	bctrl				# Get object type
	cmpwi r3, 0
	bne- normal
	
	
	
	lwz r3, 0x1C(r31)	# \
	lwz r3, 0x28(r3)	# | Get collision info
	lwz r3, 0x10(r3)	# /
	lbz r3, 0x75(r3)	# Collision contact status
	andi. r0, r3, 0x80	# Touching floor?
	bne+ normal
	lwz r12, 0x7C(r31)	# \ Check if we dropped from ledge
	lhz r3, 0x06(r12)	# |
	cmpwi r3, 0x75		# | If it was, let's just treat it like before to not affect windows too much.
	bne+ updatePos		# |
	lwz r3, 0x38(r12)	# |
	cmpwi r3, 0x0E		# |
	bne- normal			# /
updatePos:
    lwz r12, 0x18(r31)    
    lfs f0, 0x1C(r12)     # Prev Y pos
    stfs f0, 0x10(r12)    # Current Y pos
normal:
	mr r3, r4
    lwz r12, 0x0(r4)    # Original operation
 
}

HOOK @ $80792F24        # When done inside of a PSA
{
	mr r4, r3
	
	lwz r12, 0x08(r31)
	lwz r12, 0x3C(r12)
	lwz r12, 0xA4(r12)
	mtctr r12
	bctrl				# Get object type
	cmpwi r3, 0
	bne- normal
	
	lwz r3, 0x1C(r31)	# \
	lwz r3, 0x28(r3)	# | Get collision info
	lwz r3, 0x10(r3)	# /
	lbz r3, 0x75(r3)	# Collision contact status
	andi. r0, r3, 0x80	# Touching floor?
	bne+ normal
	
	
    lwz r12, 0x18(r31)    
    lfs f0, 0x1C(r12)     # Prev Y pos
    stfs f0, 0x10(r12)    # Current Y pos
	
normal:
	mr r3, r4
    lwz r12, 0x0(r3)    # Original operation
}


#############################################
Jumps Calculate One Frame Earlier [DukeItOut]
#############################################
#
# Fakes out the physics delay by calculating
# gravity, jump speed and position in advance
#
# Also makes jumping out of water easier
# by increasing jump height in that context
#############################################
HOOK @ $8086BD34	# Grounded or Swimming
{
	lfs f0, 0x24(r1)	 # Desired movement Y speed. Some branches don't have this set.
    lwz r29, 0xD0(r30)   # \ Retrieve the gravity for the character
    lfs f31, 0x70(r29)   # /
	
	lwz r29, 0x7C(r30)	 # \ Get previous action
	lhz r29, 0x06(r29)	 # /

	cmpwi r29, 0xBA		 # Check if we are trying to leap out of water

	
    lwz r29, 0x18(r30)   # \
    lfs f1, 0x1C(r29)    # | Simulate one frame of vertical movement
    fadds f1, f0, f1     # |
	bne+ notSwimming	 # |
	fadds f1, f0, f1	 # | We want to make it easier to get out of the water, so let's boost it a bit!
notSwimming:			 # |
	fsubs f1, f1, f31	 # |
    stfs f1, 0x10(r29)   # / 
    fsubs f1, f0, f31    # \ Jump/Hop "Velocity" now calculates as if it is the second frame, because . . . .
    stfs f1, 0x24(r1)    # /
	
    lis r29, 0x80AE      # Original operation
}

HOOK @ $8086BE60	# Mid-Air Jump
{
    lwz r31, 0xD0(r30)   # \ Retrieve the gravity for the character
    lfs f31, 0x70(r31)   # / 

	lwz r31, 0x18(r30)   # \
    lfs f0, 0x1C(r31)    # | Simulate one frame of vertical movement
    fadds f0, f0, f1     # |
	fsubs f0, f0, f31	 # |
    stfs f0, 0x10(r31)   # /

    fsubs f1, f1, f31    # Jump/Hop "Velocity" now calculates as if it is the second frame, because . . . .
    lis r31, 0x80AE      # Original operation
}
