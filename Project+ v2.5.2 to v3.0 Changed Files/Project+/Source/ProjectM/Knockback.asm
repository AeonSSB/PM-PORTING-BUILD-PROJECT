##################################################
Knockback Reduced 1/3 while Crouching v2.2 [Magus]
##################################################
HOOK @ $80769FCC
{
  lwz r3,  0x3C(r23)
  lwz r12, 0x7C(r3)
  lwz r12, 0x38(r12)
  cmpwi r12, 0x11;  blt+ %END%				# \ Only reduce knockback if in action 0x11 (entering crouch) or 0x12 (crouching) 
  cmpwi r12, 0x12;  bgt+ %END%				# /
  lis r12, 0x80B8;  ori r12, r12, 0x8348	# \ An address that holds the value 1/3 in float format
  lfs f1, 0(r12)							# /
  fmuls f27, f27, f1
}

########################################
Subtractive Knockback Armor v1.1 [Magus]
########################################
HOOK @ $8076A4A0
{
  cmpwi r30, 0x4; beq- %END%
  cmpwi r30, 0x2
}
HOOK @ $80769FD0
{
  lwz r12, 0x44(r3)
  lwz r11, 0x48(r12)
  cmpwi r11, 0x4;  bne+ loc_0x30
  lfs f1, 0x4C(r12)
  fsubs f27, f27, f1
  lis r12, 0x80		# \
  stw r12, 0x10(r2)	# | 
  lfs f1, 0x10(r2)	# /
  fcmpo cr0, f27, f1;  bge- loc_0x30
  fmr f27, f1
loc_0x30:
  lwz r3, 216(r3)
}
HOOK @ $807BBED4
{
  cmpwi r0, 0x4;  beq- %END%
  cmpwi r0, 0x2
}
HOOK @ $807BBF04
{
  cmpwi r0, 0x4;  bne+ loc_0x18
  lis r12, 0x80			# \
  stw r12, 0x10(r2)		# |
  lfs f3, 0x10(r2)		# /
  b %END%
loc_0x18:
  lfs f3, 8(r3)
}

###########################################################################
Melee KB Stacking and Stacks After 10th Frame of KB v1.3 [Magus, DukeItOut]
#
# 1.1: made it so the Char ID check doesn't cause a memory leak
# 1.2: made knockback stacking not randomly fail to apply to high knockback
# 1.3: made a more robust character check that isn't dependent on char ID
###########################################################################
op b 0x1AC @ $8085C8D4
HOOK @ $8076D3B0
{
  mfcr r12				# We need to keep the condition registers for later
  stw r12, 0x14(r2)
  stw r3, 0x18(r2)
  
  lfs f4,  0x24(r1)		# Original operation, gets new Y knockback velocity (f0 contains X knockback velocity)
  
  lwz r12, 0x8(r18)
  lwz r12, 0x3C(r12)
  lwz r12, 0xA4(r12)
  mtctr r12
  bctrl
  cmpwi r3, 0; bne- loc_0x118 # check if the object hit is a character. Other objects don't get knockback stacking!

  lwz r12, 0x70(r18)
  lwz r12, 0x20(r12)	# LA
  lwz r12, 0xC(r12)		# Basic
  lwz r4, 0x138(r12)	# 78
  cmpwi r4, 9
  li r4, 1
  stw r4, 0x138(r12)	# force to reset to 1
					ble- loc_0x118	# if LA-Basic[78] was less than 10, then let the knockback get replaced entirely
  cmpwi r28, 0x4;  beq+ loc_0x74 # Normal damage 
  cmpwi r28, 0x5;  beq+ loc_0x74 # This check isn't in PM. High knockback tumbles can randomly be this.
  cmpwi r28, 0x7;  beq+ loc_0x74 # Elemental damage
  cmpwi r28, 0xF;  beq- loc_0x74 # Frozen characters
  b loc_0x118

loc_0x74:
  lwz r12, 0x88(r18)
  lwz r12, 0x14(r12)
  lwz r12, 0x4C(r12)
  li r4, 0x0		# \
  stw r4, 0x10(r2)	# | Force f1 to be zero for a comparisson
  lfs f1, 0x10(r2)	# /
  lfs f2, 0x8(r12)	# Current X Knockback
  lfs f3, 0xC(r12)	# Current Y Knockback

# X calculations

  fcmpo cr0, f2, f1;  beq+ loc_0xD4	# if X Knockback is currently 0, do nothing
					  blt- loc_0xB8	# if it is less, branch
					  
	# Positive current X knockback				  
  fcmpo cr0, f0, f1;  ble- loc_0xD0	# if the current value is less than or equal to 0, then stack
  fcmpo cr0, f2, f0;  ble+ loc_0xD4	# if the current X Knockback is less than or equal to the current setting, then do not modify
  fmr f0, f2		# Replace with X Knockback
  b loc_0xD4
  
	# Negative current X knockback 
loc_0xB8:		
  fcmpo cr0, f0, f1;  bge- loc_0xD0 # if the current value is greater than or equal to 0, then stack
  fcmpo cr0, f2, f0;  bge+ loc_0xD4 # if the current X Knockback is greater than or equal to the current setting, then do not modify
  fmr f0, f2		# Replace with X Knockback
  b loc_0xD4

loc_0xD0:
  fadds f0, f0, f2	# Add existing X Knockback

# Y calculations

loc_0xD4:			
  fcmpo cr0, f3, f1;  beq+ loc_0x114 # if Y knockback is currently 0, do nothing
					  blt- loc_0xF8  # if it is less, branch
					  
	# Positive current Y knockback
  fcmpo cr0, f4, f1;  ble- loc_0x110 # if the current hitbox value is less than or equal to 0, then stack
  fcmpo cr0, f3, f4;  ble+ loc_0x114 # if the current Y Knockback is less than or equal to the current setting, then do not modify
  fmr f4, f3		# Replace with Y Knockback
  b loc_0x114
  
	# Negative current Y knockback
loc_0xF8:
  fcmpo cr0, f4, f1;  bge- loc_0x110 # if the current value is greater than or equal to 0, then stack
  fcmpo cr0, f3, f4;  bge+ loc_0x114 # if the current Y Knockback is greater than or equal to the current setting, then do not modify
  fmr f4, f3		# Replace with Y Knockback
  b loc_0x114		

loc_0x110:
  fadds f4, f4, f3	# Add existing Y Knockback

loc_0x114:
  stfs f0, 0xC(r20)	# Resaves the X knockback. Y knockback gets saved by Brawl shortly after this code.

loc_0x118:
  lwz r12, 0x14(r2)
  lwz r3, 0x18(r2)
  mtcr r12
}
HOOK @ $80913194
{
  lwz r12, 0x50(r21);  lbz r12, 0x1C(r12)
  rlwinm r12, r12, 25, 31, 31
  cmpwi r12, 0x1;  beq- loc_0x3C
  lwz r12, 0x14(r21);  lhz r12, 0x5A(r12) 	# \ Skip incrementing if in the animation for being paralyzed
  cmpwi r12, 0xA9;  beq- loc_0x3C			# /
  lwz r12, 0x70(r21);  
  lwz r12, 0x20(r12)	# LA
  lwz r12, 0xC(r12)		# Basic
  lwz r4, 0x138(r12)	# 78
  addi r4, r4, 0x1		# Increment counter since last hit
  stw r4, 0x138(r12)	# 78
loc_0x3C:
  lis r4, 0x1000
}