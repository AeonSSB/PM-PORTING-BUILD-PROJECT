###############################################################
[Project+] Tiebreaker v2.0 - Enforces Sudden Death Clause [Eon]
###############################################################
HOOK @ $8095617c 
{
	#original command
	stw r0, 0x27C(r3)

	#if staling enabled = if singleplayer mode, dont enable
	lis r7, 0x80b8
	lwz r7, 0x7C28(r7)
	lwz r7, 0x6E(r7)
	andi. r7, r7, 0x8
	beq %end%
	#if items enabled = casuals, dont enable
	lis r7, 0x805A
	lwz r7, 0xE0(r7)
	lwz r7, 0x08(r7)
	lbz r7, 0x16(r7)
	cmpwi r7, 0
	bne %end%

    sth r0, 0x27C(r3) #stores stockcount in top half of victory condition word
    lhz r0, 0x2C(r3)  #loads percentage 
    li r7, 1000
    sub r0, r7, r0
    sth r0, 0x27E(r3) #stores 1000 - percentage into bottom half so that a player at 0 has a higher value than a player at 100.
}

HOOK @ $809559d4
{
    mr r3, r19         #calls function to recieve players current damage
    lwz r12, 0xC(r19)
    lwz r12, 0x14(r12)
    mtctr r12
    bctrl
    fctiwz f1, f1         #converts float result to int
    stfd f1, 0x8(r1)
    lwz r0, 0xC(r1)

    sth r0, 0x8(r20)     #stores percentage into unused space near results stockcount 
originalcommand:
    subi    r3, r27, 1
    cmpw r0, r3
}