##################################
[CM_Addons] Invisible Tech Rolls on frame 5 v2.0 [Eon, ilikepizza107, code menu add-on by mawwwk]
###################################
.include "Source/CM_Addons/AddonAliases.asm"

HOOK @ $807659C8
{
    cmpwi r3, 0 # Original op
    beq %end%

    lwz r3, 0x10(r30)
    lwz r3, 0x8(r3)
    lwz r12, 0x3C(r3)
    lwz r12, 0xA4(r12)
    mtctr r12
    bctrl
		cmpwi r3, 0
		bne %end%        # if == fighter
    lwz r3, 0x10(r30)    # \
    lwz r3, 0xD8(r3)    # | Access motionModule
    lwz r3, 0x8(r3)    # /
    lwz r12, 0x0(r3)    # Load motionModule VTable
    lwz r12, 0x5C(r12)    # Load pointer to getKind function
    mtctr r12        # \
    bctrl        # / Run the function, returns subtraction ID in r3
    cmpwi r3, 0xAF    # if subaction is a tech subaction
    blt display
    cmpwi r3, 0xB2
    ble techAnim
    cmpwi r3, 0xB8
    blt display
    cmpwi r3, 0xBB
    ble techAnim
    cmpwi r3, 0xBE
    blt display
    cmpwi r3, 0xC0
    ble techAnim
    cmpwi r3, 0xE6
    blt display
    cmpwi r3, 0xE9
    ble techAnim
    b display
techAnim:
    lwz r3, 0x10(r30)    # \
    lwz r3, 0xD8(r3)    # | Access motionModule
    lwz r3, 0x8(r3)    # /
    lhz r3, 0x40(r3)    # get top half of current frame number
    cmpwi r3, 0x40A0    # is in frame window (display if frame <5 or >20)
    blt display
    cmpwi r3, 0x41A0
    blt dontDisplay
display:
    li r4, 1
    b updateStatus
dontDisplay:
	lis r12, INVROLLS_INV_LINE_LOC_HI
	ori r12, r12, INVROLLS_INV_LINE_LOC_LO
	lwz r12, 0(r12)		# Get toggle state
	lbz r12, 0xB(r12)
	cmpwi r12, 0
	beq display
	
    li r4, 0
updateStatus:
    lwz r3, 0x10(r30)   # \
    lwz r3, 0xD8(r3)    # | Access shadowModule
    lwz r3, 0xA4(r3)    # /
    lwz r12, 0x0(r3)    # Load shadowModule VTable2
    lwz r12, 0x18(r12)  # Load pointer to setActiveStatus function
    mtctr r12
    bctrl
    mr r3, r4			# \ Restore registers
    cmpwi r3, 0			# /
}

#Disable cursor [Eon]
HOOK @ $8083A98C
{
	lis r4, INVROLLS_INV_LINE_LOC_HI
	ori r4, r4, INVROLLS_INV_LINE_LOC_LO
	lwz r4, 0(r4)
	lbz r4, 0xB(r4)		# Get toggle state
	cmpwi r4, 0
	beq end
	
	li r4, 0
	b %end%
	
end:
	li r4, 1 # Original op
}