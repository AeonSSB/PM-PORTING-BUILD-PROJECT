#####################################
[CM: Code Menu] FPS Code [UnclePunch]
#####################################
HOOK @ $80023D5C                # Address = $(ba + 0x00023D5C)
{
	lbz r3, -0x3bcc(r13)
	addi r3, r3, 0x1
	stb r3, -0x3bcc(r13)
	lbz r0, 0x8(r31)
	nop
}
HOOK @ $80023D7C                # Address = $(ba + 0x00023D7C)
{
	lbz r3, -0x3bcb(r13)
	addi r3, r3, 0x1
	stb r3, -0x3bcb(r13)
	cmpwi r3, 0x3c
	blt loc_0x00A
	lbz r3, -0x3bcc(r13)
	sth r3, -0x3bca(r13)
	li r3, 0x0
	stb r3, -0x3bcc(r13)
	stb r3, -0x3bcb(r13)
loc_0x00A:
	lwz r0, 0x14(r1)
}

###############################
[CM: Code Menu] Print Code Menu
###############################
HOOK @ $80017928                # Address = $(ba + 0x00017928)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stfd f3, -0x28(r1)
	stfd f4, -0x30(r1)
	stfd f5, -0x38(r1)
	stfd f6, -0x40(r1)
	stfd f7, -0x48(r1)
	stfd f8, -0x50(r1)
	stfd f9, -0x58(r1)
	stfd f10, -0x60(r1)
	stfd f11, -0x68(r1)
	stfd f12, -0x70(r1)
	stfd f13, -0x78(r1)
	stwu r1, -0xf4(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x804e
	lwz r31, 0x34(r31)
	lis r28, 0x804e
	lwzu r30, 0x74(r28)
	or r29, r31, r30
	cmpwi r29, 0x4
	blt loc_0x071
	lis r29, 0x805b
	ori r29, r29, 0x6d20
	lis r5, 0x804e
	lwzu r4, 0x298(r5)
	cmpwi r4, 0x0
	bne loc_0x02E
	li r6, 0x1
	stw r6, 0x0(r5)
	lis r30, 0x804e
	ori r30, r30, 0x268
	li r6, 0x30
	addi r3, r30, 0x0
	addi r4, r29, 0x0
	addi r5, r6, 0x0
	lis r0, 0x803f
	ori r0, r0, 0x602c
	mtctr r0
	bctrl
loc_0x02E:
	lis r4, 0x3f80
	stw r4, 0x0(r29)
	li r4, 0x0
	stw r4, 0x4(r29)
	li r4, 0x0
	stw r4, 0x8(r29)
	li r4, 0x0
	stw r4, 0xc(r29)
	li r4, 0x0
	stw r4, 0x10(r29)
	lis r4, 0x3f80
	stw r4, 0x14(r29)
	li r4, 0x0
	stw r4, 0x18(r29)
	li r4, 0x0
	stw r4, 0x1c(r29)
	li r4, 0x0
	stw r4, 0x20(r29)
	li r4, 0x0
	stw r4, 0x24(r29)
	lis r4, 0x3f80
	stw r4, 0x28(r29)
	lis r4, 0xc280
	stw r4, 0x2c(r29)
	lis r0, 0x8001
	ori r0, r0, 0x9fa4
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0x8de4
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0xa5c0
	mtctr r0
	bctrl
	li r3, 0x80
	li r4, 0x1
	li r5, 0x4
	lis r0, 0x801f
	ori r0, r0, 0x1088
	mtctr r0
	bctrl
	lis r3, 0xcc01
	lis r6, 0x3f00
	lis r4, 0xc580
	lis r5, 0x4580
	li r7, 0xff
	stw r4, -0x8000(r3)
	stw r5, -0x8000(r3)
	stw r6, -0x8000(r3)
	stw r7, -0x8000(r3)
	lis r4, 0x4580
	stw r4, -0x8000(r3)
	stw r5, -0x8000(r3)
	stw r6, -0x8000(r3)
	stw r7, -0x8000(r3)
	lis r5, 0xc580
	stw r4, -0x8000(r3)
	stw r5, -0x8000(r3)
	stw r6, -0x8000(r3)
	stw r7, -0x8000(r3)
	lis r4, 0xc580
	stw r4, -0x8000(r3)
	stw r5, -0x8000(r3)
	stw r6, -0x8000(r3)
	stw r7, -0x8000(r3)
loc_0x071:
	cmpwi r31, 0x4
	bne loc_0x114
	lis r30, 0x805b
	ori r30, r30, 0x6df8
	lis r31, 0x3eb2
	ori r31, r31, 0xb8c2
	stw r31, 0x0(r30)
	lis r31, 0x804e
	lwz r31, 0x0(r31)
	lis r30, 0x804e
	ori r30, r30, 0x320
	addi r3, r30, 0x0
	li r4, 0x0
	li r5, 0x9
	lis r0, 0x8006
	ori r0, r0, 0xa964
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0x9fa4
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0x8de4
	mtctr r0
	bctrl
	lis r3, 0x804e
	ori r3, r3, 0x368
	lis r4, 0x8049
	ori r4, r4, 0x7e44
	stw r4, 0x0(r3)
	lis r25, 0x804e
	ori r25, r25, 0x7a4
	lis r29, 0xc348
	lis r28, 0xc316
	lwz r26, 0xc(r31)
	lwz r24, 0x0(r31)
	add r24, r31, r24
	lbz r24, 0x7(r24)
	cmpw r24, r26
	ble loc_0x09C
	mr r26, r24
	b loc_0x0A0
loc_0x09C:
	addi r27, r24, 0xa
	cmpw r27, r26
	bge loc_0x0A0
	mr r26, r27
loc_0x0A0:
	stw r26, 0xc(r31)
	cmpwi r26, 0xf
	ble loc_0x0BD
	subi r27, r26, 0xf
	mulli r27, r27, -0x12
	li r24, 0x0
	cmpwi r27, 0x0
	beq loc_0x0B4
	cmpwi r27, 0x0
	bge loc_0x0AC
	lis r24, 0x8000
	neg r27, r27
loc_0x0AC:
	cntlzw r26, r27
	subi r26, r26, 0x8
	rlwnm r27, r27, r26, 9, 31      # (Mask: 0x007fffff)
	or r24, r24, r27
	subi r26, r26, 0x96
	neg r26, r26
	rlwinm r26, r26, 23, 1, 0       # (Mask: 0xffffffff)
	or r24, r24, r26
loc_0x0B4:
	lis r27, 0x804e
	ori r27, r27, 0x648
	stw r24, 0x0(r27)
	lfs f0, 0x0(r27)
	stw r28, 0x0(r27)
	lfs f1, 0x0(r27)
	fadds f0, f0, f1
	stfs f0, 0x0(r27)
	lwz r28, 0x0(r27)
loc_0x0BD:
	stw r29, 0x2c(r30)
	stw r28, 0x30(r30)
	lis r29, 0x3d75
	ori r29, r29, 0xc28f
	stw r29, 0x50(r30)
	addi r28, r31, 0x10
	li r3, 0x1
	cmpwi r3, 0x0
	beq loc_0x113
loc_0x0C6:
	lbz r26, 0x2(r28)
	lbz r27, 0x4(r28)
	lwzx r27, r25, r27
	stw r27, 0x8(r30)
	stw r27, 0xc(r30)
	stw r27, 0x10(r30)
	stw r27, 0x14(r30)
	lhz r4, 0x5(r28)
	add r4, r4, r28
	cmpwi r26, 0x5
	bne loc_0x0DF
	lwz r27, 0xc(r28)
	lhz r26, 0x0(r28)
	mulli r27, r27, 0x4
	subf r26, r27, r26
	mtxer r27
	lswx r5, r26, r28
	lis r3, 0x804e
	ori r3, r3, 0x648
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	b loc_0x0F9
loc_0x0DF:
	cmpwi r26, 0x2
	bne loc_0x0EA
	lfs f1, 0x8(r28)
	lis r3, 0x804e
	ori r3, r3, 0x648
	cmpw cr1, r1, r1
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	b loc_0x0F9
loc_0x0EA:
	lwz r5, 0x8(r28)
	cmpwi r26, 0x0
	bne loc_0x0F2
	lwz r26, 0x18(r28)
	addi r27, r26, 0x1c
	rlwinm r5, r5, 2, 0, 31         # (Mask: 0xffffffff)
	lhzx r5, r27, r5
	add r5, r5, r26
loc_0x0F2:
	lis r3, 0x804e
	ori r3, r3, 0x648
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
loc_0x0F9:
	mr r26, r3
	lis r27, 0x804e
	ori r27, r27, 0x647
	cmpwi r26, 0x0
	ble loc_0x107
loc_0x0FE:
	lbzu r4, 0x1(r27)
	addi r3, r30, 0x0
	lis r0, 0x8006
	ori r0, r0, 0xfe50
	mtctr r0
	bctrl
	subi r26, r26, 0x1
	cmpwi r26, 0x0
	bgt+ loc_0x0FE
loc_0x107:
	lis r3, 0xc348
	lfs f0, 0x30(r30)
	lis r4, 0x4190
	stw r4, -0x10(r1)
	lfs f1, -0x10(r1)
	fadd f0, f0, f1
	stw r3, 0x2c(r30)
	stfs f0, 0x30(r30)
	lhz r3, 0x0(r28)
	lhzux r3, r28, r3
	cmpwi r3, 0x0
	bne+ loc_0x0C6
loc_0x113:
	b loc_0x193
loc_0x114:
	cmpwi r30, 0x0
	beq loc_0x12A
	lis r29, 0x805b
	ori r29, r29, 0x6df8
	li r31, 0x0
	stw r30, 0x0(r29)
	stw r31, 0x0(r28)
	lis r3, 0x805b
	ori r3, r3, 0x6d20
	lis r4, 0x804e
	ori r4, r4, 0x268
	li r30, 0x30
	addi r5, r30, 0x0
	lis r0, 0x803f
	ori r0, r0, 0x602c
	mtctr r0
	bctrl
	li r3, 0x0
	lis r4, 0x804e
	ori r4, r4, 0x298
	stw r3, 0x0(r4)
	b loc_0x193
loc_0x12A:
	lis r0, 0x8002
	ori r0, r0, 0xe844
	mtctr r0
	bctrl
	lis r31, 0x804e
	lwz r31, 0xee0(r31)
	cmpwi r31, 0x1
	bne loc_0x193
	li r31, 0x0
	lwz r23, -0x42ac(r13)
	lwz r22, -0x42a8(r13)
	stw r31, -0x42ac(r13)
	stw r31, -0x42a8(r13)
	lis r31, 0x804e
	ori r31, r31, 0x6c8
	lis r4, 0x4650
	ori r4, r4, 0x533a
	stw r4, 0x0(r31)
	lis r4, 0x2025
	ori r4, r4, 0x3264
	stw r4, 0x4(r31)
	li r4, 0x0
	stw r4, 0x8(r31)
	lis r30, 0x805a
	lhz r30, 0x856(r30)
	lis r3, 0x804e
	ori r3, r3, 0x648
	addi r4, r31, 0x0
	addi r5, r30, 0x0
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	lis r31, 0x804e
	ori r31, r31, 0x647
	mr r26, r3
	lis r29, 0x804e
	ori r29, r29, 0x320
	addi r3, r29, 0x0
	li r4, 0x0
	li r5, 0x9
	lis r0, 0x8006
	ori r0, r0, 0xa964
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0x9fa4
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0x8de4
	mtctr r0
	bctrl
	lis r3, 0x804e
	ori r3, r3, 0x368
	lis r4, 0x8049
	ori r4, r4, 0x7e44
	stw r4, 0x0(r3)
	lis r3, 0x805b
	ori r3, r3, 0x71f0
	li r4, 0x0
	lis r0, 0x801f
	ori r0, r0, 0x51dc
	mtctr r0
	bctrl
	lis r28, 0x805b
	ori r28, r28, 0x6df8
	lfs f1, 0x0(r28)
	lis r28, 0x3ea8
	ori r28, r28, 0xf5c3
	stw r28, -0x10(r1)
	lfs f2, -0x10(r1)
	fmuls f2, f2, f1
	stfs f2, 0x50(r29)
	lis r28, 0xc325
	lis r27, 0xc2e6
	stw r28, 0x2c(r29)
	stw r27, 0x30(r29)
	lis r28, 0x805a
	lhz r28, 0x856(r28)
	cmpwi r30, 0x3c
	bge loc_0x180
	lis r30, 0xff00
	ori r30, r30, 0xff
	b loc_0x182
loc_0x180:
	lis r30, 0x66
	ori r30, r30, 0xffff
loc_0x182:
	stw r30, 0x8(r29)
	stw r30, 0xc(r29)
	stw r30, 0x10(r29)
	stw r30, 0x14(r29)
	stw r23, -0x42ac(r13)
	stw r22, -0x42a8(r13)
	cmpwi r26, 0x0
	ble loc_0x193
loc_0x18A:
	lbzu r4, 0x1(r31)
	addi r3, r29, 0x0
	lis r0, 0x8006
	ori r0, r0, 0xfe50
	mtctr r0
	bctrl
	subi r26, r26, 0x1
	cmpwi r26, 0x0
	bgt+ loc_0x18A
loc_0x193:
	lmw r3, 0x8(r1)
	addi r1, r1, 0xf4
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lfd f3, -0x28(r1)
	lfd f4, -0x30(r1)
	lfd f5, -0x38(r1)
	lfd f6, -0x40(r1)
	lfd f7, -0x48(r1)
	lfd f8, -0x50(r1)
	lfd f9, -0x58(r1)
	lfd f10, -0x60(r1)
	lfd f11, -0x68(r1)
	lfd f12, -0x70(r1)
	lfd f13, -0x78(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	nop
}

####################
Unattested Code 0
####################
* 42000000 80000000             # Set Base Address: ba = 0x80000000
* 2119969C 9421FFF0             # 32-Bit If Equal: If Val @ $(ba + 0x0119969C) == 0x9421FFF0
* 42000000 80000000             # Set Base Address: ba = 0x80000000

###############################
[CM: Code Menu] Prime Code Menu
###############################
HOOK @ $8119969C                # Address = $(ba + 0x0119969C)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lwz r29, 0x54(r3)
	cmpwi r29, 0x1
	bne loc_0x015
	lwz r29, 0x40(r3)
	cmpwi r29, 0x8
	bne loc_0x015
	lis r30, 0x804e
	lwzu r31, 0x34(r30)
	cmpwi r31, 0x4
	beq loc_0x015
	lis r30, 0x804e
	ori r30, r30, 0x34
	li r31, 0x1
	stw r31, 0x0(r30)
loc_0x015:
	lis r30, 0x804e
	ori r30, r30, 0x40
	li r31, 0x0
	cmpwi r29, 0x4e
	bne loc_0x01A
loc_0x01A:
	stw r31, 0x0(r30)
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	stwu r1, -0x10(r1)
}

####################
Unattested Code 1
####################
* E0000000 80008000             # Full Terminator: ba = 0x80000000, po = 0x80000000

#################################
[CM: Code Menu] Control Code Menu
#################################
HOOK @ $80029574                # Address = $(ba + 0x00029574)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stfd f3, -0x28(r1)
	stfd f4, -0x30(r1)
	stfd f5, -0x38(r1)
	stfd f6, -0x40(r1)
	stfd f7, -0x48(r1)
	stfd f8, -0x50(r1)
	stfd f9, -0x58(r1)
	stfd f10, -0x60(r1)
	stfd f11, -0x68(r1)
	stfd f12, -0x70(r1)
	stfd f13, -0x78(r1)
	stwu r1, -0xf4(r1)
	stmw r3, 0x8(r1)
	lis r3, 0x2530
	ori r3, r3, 0x3258
	lis r28, 0x804e
	ori r28, r28, 0x6c8
	stw r3, 0x0(r28)
	li r3, 0x0
	stw r3, 0x4(r28)
	lis r25, 0x804e
	ori r25, r25, 0x1e1
	lis r26, 0x8058
	ori r26, r26, 0x82dc
	mr r31, r25
	lwzu r27, 0x4(r26)
	cmpwi r27, 0x0
	beq loc_0x047
	addi r27, r27, 0x1fc
	lwz r3, 0x44(r27)
	subi r3, r3, 0x1
	cmplwi r3, 0x78
	bge loc_0x047
	mulli r3, r3, 0x2
	addi r3, r3, 0x70
	lhzx r3, r27, r3
	cmplwi r3, 0x78
	bge loc_0x047
	mulli r3, r3, 0x124
	lis r30, 0x9017
	ori r30, r30, 0x2e20
	add r30, r30, r3
	li r24, 0x0
	lhz r29, 0x0(r30)
	cmpwi r29, 0x0
	beq loc_0x047
loc_0x036:
	cmpwi r24, 0x4
	bgt loc_0x044
	lbz r29, 0x0(r30)
	mr r3, r31
	mr r4, r28
	mr r5, r29
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	add r31, r31, r3
	lhzu r29, 0x1(r30)
	b loc_0x045
loc_0x044:
	li r29, 0x0
loc_0x045:
	cmpwi r29, 0x0
	bne+ loc_0x036
loc_0x047:
	li r3, 0x0
	stb r3, 0x0(r31)
	lis r3, 0x804e
	ori r3, r3, 0x12dc
	subi r4, r25, 0x1
	stw r4, 0x0(r3)
	addi r25, r25, 0x18
	mr r31, r25
	lwzu r27, 0x4(r26)
	cmpwi r27, 0x0
	beq loc_0x075
	addi r27, r27, 0x1fc
	lwz r3, 0x44(r27)
	subi r3, r3, 0x1
	cmplwi r3, 0x78
	bge loc_0x075
	mulli r3, r3, 0x2
	addi r3, r3, 0x70
	lhzx r3, r27, r3
	cmplwi r3, 0x78
	bge loc_0x075
	mulli r3, r3, 0x124
	lis r30, 0x9017
	ori r30, r30, 0x2e20
	add r30, r30, r3
	li r24, 0x0
	lhz r29, 0x0(r30)
	cmpwi r29, 0x0
	beq loc_0x075
loc_0x064:
	cmpwi r24, 0x4
	bgt loc_0x072
	lbz r29, 0x0(r30)
	mr r3, r31
	mr r4, r28
	mr r5, r29
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	add r31, r31, r3
	lhzu r29, 0x1(r30)
	b loc_0x073
loc_0x072:
	li r29, 0x0
loc_0x073:
	cmpwi r29, 0x0
	bne+ loc_0x064
loc_0x075:
	li r3, 0x0
	stb r3, 0x0(r31)
	lis r3, 0x804e
	ori r3, r3, 0x1488
	subi r4, r25, 0x1
	stw r4, 0x0(r3)
	addi r25, r25, 0x18
	mr r31, r25
	lwzu r27, 0x4(r26)
	cmpwi r27, 0x0
	beq loc_0x0A3
	addi r27, r27, 0x1fc
	lwz r3, 0x44(r27)
	subi r3, r3, 0x1
	cmplwi r3, 0x78
	bge loc_0x0A3
	mulli r3, r3, 0x2
	addi r3, r3, 0x70
	lhzx r3, r27, r3
	cmplwi r3, 0x78
	bge loc_0x0A3
	mulli r3, r3, 0x124
	lis r30, 0x9017
	ori r30, r30, 0x2e20
	add r30, r30, r3
	li r24, 0x0
	lhz r29, 0x0(r30)
	cmpwi r29, 0x0
	beq loc_0x0A3
loc_0x092:
	cmpwi r24, 0x4
	bgt loc_0x0A0
	lbz r29, 0x0(r30)
	mr r3, r31
	mr r4, r28
	mr r5, r29
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	add r31, r31, r3
	lhzu r29, 0x1(r30)
	b loc_0x0A1
loc_0x0A0:
	li r29, 0x0
loc_0x0A1:
	cmpwi r29, 0x0
	bne+ loc_0x092
loc_0x0A3:
	li r3, 0x0
	stb r3, 0x0(r31)
	lis r3, 0x804e
	ori r3, r3, 0x1634
	subi r4, r25, 0x1
	stw r4, 0x0(r3)
	addi r25, r25, 0x18
	mr r31, r25
	lwzu r27, 0x4(r26)
	cmpwi r27, 0x0
	beq loc_0x0D1
	addi r27, r27, 0x1fc
	lwz r3, 0x44(r27)
	subi r3, r3, 0x1
	cmplwi r3, 0x78
	bge loc_0x0D1
	mulli r3, r3, 0x2
	addi r3, r3, 0x70
	lhzx r3, r27, r3
	cmplwi r3, 0x78
	bge loc_0x0D1
	mulli r3, r3, 0x124
	lis r30, 0x9017
	ori r30, r30, 0x2e20
	add r30, r30, r3
	li r24, 0x0
	lhz r29, 0x0(r30)
	cmpwi r29, 0x0
	beq loc_0x0D1
loc_0x0C0:
	cmpwi r24, 0x4
	bgt loc_0x0CE
	lbz r29, 0x0(r30)
	mr r3, r31
	mr r4, r28
	mr r5, r29
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	add r31, r31, r3
	lhzu r29, 0x1(r30)
	b loc_0x0CF
loc_0x0CE:
	li r29, 0x0
loc_0x0CF:
	cmpwi r29, 0x0
	bne+ loc_0x0C0
loc_0x0D1:
	li r3, 0x0
	stb r3, 0x0(r31)
	lis r3, 0x804e
	ori r3, r3, 0x17e0
	subi r4, r25, 0x1
	stw r4, 0x0(r3)
	addi r25, r25, 0x18
	lis r31, 0x804e
	lwz r28, 0x4(r31)
	addi r31, r31, 0x7dc
	cmplw r31, r28
	bne loc_0x574
	lis r28, 0x804e
	lwz r28, 0xf1c(r28)
	cmpwi r28, 0x0
	bne loc_0x0EE
	lis r28, 0x804e
	ori r28, r28, 0x29c
	li r31, 0x1
	stw r31, 0x0(r28)
	lis r3, 0x8067
	ori r3, r3, 0x2f40
	li r4, 0x8
	li r5, 0x0
	lis r0, 0x8000
	ori r0, r0, 0xd234
	mtctr r0
	bctrl
	b loc_0x0FC
loc_0x0EE:
	lis r28, 0x804e
	lwzu r31, 0x29c(r28)
	cmpwi r31, 0x1
	bne loc_0x0FC
	lis r3, 0x8067
	ori r3, r3, 0x2f40
	li r4, 0x8
	li r5, 0x1
	lis r0, 0x8000
	ori r0, r0, 0xd234
	mtctr r0
	bctrl
	li r31, 0x0
	stw r31, 0x0(r28)
loc_0x0FC:
	lis r28, 0x804e
	lwzu r19, 0x34(r28)
	lis r31, 0x805b
	ori r31, r31, 0xacc4
	lis r25, 0x804d
	ori r25, r25, 0xe4a8
	li r15, 0x0
	li r18, 0x0
	li r17, 0x0
	li r16, 0x0
	cmpwi r16, 0x4
	bge loc_0x11F
loc_0x108:
	lhzu r24, 0x8(r25)
	lwzu r30, 0x40(r31)
	cmplwi r24, 0x2000
	blt loc_0x10D
	li r24, 0x0
loc_0x10D:
	andi. r24, r24, 0x1000
	or r15, r15, r30
	or r15, r15, r24
	andi. r24, r30, 0x64
	cmpwi r24, 0x60
	ble loc_0x116
	cmpwi r19, 0x4
	beq loc_0x116
	li r19, 0x2
loc_0x116:
	lbz r30, 0x2c(r31)
	extsb r30, r30
	add r18, r18, r30
	lbz r30, 0x2d(r31)
	extsb r30, r30
	add r17, r17, r30
	addi r16, r16, 0x1
	cmpwi r16, 0x4
	blt+ loc_0x108
loc_0x11F:
	li r16, 0x0
	cmpwi r16, 0x4
	bge loc_0x12C
loc_0x122:
	addi r31, r31, 0x40
	lbz r30, 0x2c(r31)
	extsb r30, r30
	add r18, r18, r30
	lbz r30, 0x2d(r31)
	extsb r30, r30
	add r17, r17, r30
	addi r16, r16, 0x1
	cmpwi r16, 0x4
	blt+ loc_0x122
loc_0x12C:
	lis r31, 0x804f
	ori r31, r31, 0x6ee0
	li r29, 0x1
	li r24, 0x0
	cmpwi r24, 0x4
	bge loc_0x15A
loc_0x132:
	lhzu r27, 0x9a0(r31)
	lis r26, 0x804e
	ori r26, r26, 0x1b0
	lbz r25, 0x28(r31)
	cmpwi r25, 0x2
	bne loc_0x143
	lhz r27, 0x2a(r31)
	andi. r23, r27, 0xc003
	cmpwi r23, 0x0
	beq loc_0x142
	andi. r23, r27, 0x2200
	cmpwi r23, 0x2200
	bne loc_0x142
	cmpwi r19, 0x4
	beq loc_0x142
	li r19, 0x2
loc_0x142:
	b loc_0x149
loc_0x143:
	andi. r23, r27, 0x1900
	cmpwi r23, 0x1900
	bne loc_0x149
	cmpwi r19, 0x4
	beq loc_0x149
	li r19, 0x2
loc_0x149:
	mulli r25, r25, 0x10
	add r26, r26, r25
	cmpwi r27, 0x0
	ble loc_0x157
loc_0x14D:
	andi. r25, r27, 0x1
	cmpwi r25, 0x0
	beq loc_0x153
	lbz r25, 0x0(r26)
	rlwnm r25, r29, r25, 15, 31     # (Mask: 0x0001ffff)
	or r15, r15, r25
loc_0x153:
	addi r26, r26, 0x1
	rlwinm r27, r27, 31, 15, 31     # (Mask: 0x0003fffe)
	cmpwi r27, 0x0
	bgt+ loc_0x14D
loc_0x157:
	addi r24, r24, 0x1
	cmpwi r24, 0x4
	blt+ loc_0x132
loc_0x15A:
	lis r27, 0x805c
	lwzu r29, -0x75f8(r27)
	cmpwi r19, 0x1
	bne loc_0x163
	li r19, 0x0
	andi. r24, r15, 0x1100
	cmpwi r24, 0x0
	beq loc_0x163
	li r19, 0x2
loc_0x163:
	lis r30, 0x804e
	lwz r30, 0x758(r30)
	cmpwi r30, 0x1
	bne loc_0x170
	lis r30, 0x804e
	lwz r30, 0xc48(r30)
	cmpwi r30, 0x0
	beq loc_0x170
	lis r30, 0x804e
	lwz r30, 0x34(r30)
	cmpwi r30, 0x0
	bne loc_0x170
	li r19, 0x0
loc_0x170:
	cmpwi r19, 0x2
	bne loc_0x17E
	lis r30, 0x804e
	ori r30, r30, 0x6c
	li r19, 0x4
	stw r29, 0x0(r30)
	lis r29, 0x804e
	ori r29, r29, 0x74
	lis r31, 0x805b
	lwz r31, 0x6df8(r31)
	stw r31, 0x0(r29)
	lis r30, 0x804e
	ori r30, r30, 0x44
	stw r15, 0x0(r30)
loc_0x17E:
	lis r29, 0x804e
	lwzu r30, 0x44(r29)
	ori r23, r30, 0xffe0
	and r23, r15, r23
	stw r23, 0x0(r29)
	andc r15, r15, r30
	stw r19, 0x0(r28)
	cmpwi r19, 0x4
	bne loc_0x31F
	lis r30, 0xffff
	ori r30, r30, 0xffff
	lis r29, 0x804e
	ori r29, r29, 0x48
	li r16, 0x0
	cmpwi r16, 0x8
	bge loc_0x192
loc_0x18E:
	stwu r30, 0x4(r29)
	addi r16, r16, 0x1
	cmpwi r16, 0x8
	blt+ loc_0x18E
loc_0x192:
	lis r31, 0x805b
	ori r31, r31, 0xacf0
	li r30, 0x0
	li r16, 0x0
	cmpwi r16, 0x8
	bge loc_0x19C
loc_0x198:
	sthu r30, 0x40(r31)
	addi r16, r16, 0x1
	cmpwi r16, 0x8
	blt+ loc_0x198
loc_0x19C:
	li r31, 0x1
	stw r31, 0x0(r27)
	li r14, 0x0
	andi. r4, r15, 0x10
	cmpwi r4, 0x0
	beq loc_0x1AD
	lis r7, 0x804e
	lwzu r4, 0x24(r7)
	lis r8, 0x804e
	lwzu r6, 0x28(r8)
	li r5, 0x3
	cmpw r4, r5
	ble loc_0x1AA
	stw r5, 0x0(r7)
loc_0x1AA:
	cmpw r6, r5
	ble loc_0x1AD
	stw r5, 0x0(r8)
loc_0x1AD:
	andi. r4, r15, 0x8
	cmpwi r4, 0x0
	beq loc_0x1B1
	li r17, 0x41
loc_0x1B1:
	andi. r4, r15, 0x4
	cmpwi r4, 0x0
	beq loc_0x1B6
	lis r17, 0xffff
	ori r17, r17, 0xffbf
loc_0x1B6:
	lis r7, 0x804e
	lwzu r6, 0x24(r7)
	srawi r3, r17, 31
	add r8, r17, r3
	xor r8, r8, r3
	subi r6, r6, 0x1
	cmpwi r8, 0x41
	blt loc_0x1C9
	cmpwi r6, 0x0
	bgt loc_0x1C8
	cmpwi r6, 0x0
	bge loc_0x1C3
	li r6, 0xa
loc_0x1C3:
	addi r6, r6, 0x6
	li r14, 0x2
	cmpwi r17, 0x41
	blt loc_0x1C8
	li r14, 0x1
loc_0x1C8:
	b loc_0x1CA
loc_0x1C9:
	li r6, 0x0
loc_0x1CA:
	stw r6, 0x0(r7)
	andi. r4, r15, 0x2
	cmpwi r4, 0x0
	beq loc_0x1CF
	li r18, 0x32
loc_0x1CF:
	andi. r4, r15, 0x1
	cmpwi r4, 0x0
	beq loc_0x1D4
	lis r18, 0xffff
	ori r18, r18, 0xffce
loc_0x1D4:
	lis r7, 0x804e
	lwzu r6, 0x28(r7)
	srawi r3, r18, 31
	add r8, r18, r3
	xor r8, r8, r3
	subi r6, r6, 0x1
	cmpwi r8, 0x32
	blt loc_0x1E7
	cmpwi r6, 0x0
	bgt loc_0x1E6
	cmpwi r6, 0x0
	bge loc_0x1E1
	li r6, 0xa
loc_0x1E1:
	addi r6, r6, 0x6
	li r14, 0x6
	cmpwi r18, 0x32
	blt loc_0x1E6
	li r14, 0x5
loc_0x1E6:
	b loc_0x1E8
loc_0x1E7:
	li r6, 0x0
loc_0x1E8:
	stw r6, 0x0(r7)
	andi. r4, r15, 0x400
	cmpwi r4, 0x0
	beq loc_0x1ED
	li r14, 0x8
loc_0x1ED:
	andi. r4, r15, 0x800
	cmpwi r4, 0x0
	beq loc_0x1F1
	li r14, 0x9
loc_0x1F1:
	andi. r4, r15, 0x100
	cmpwi r4, 0x0
	beq loc_0x1F5
	li r14, 0x3
loc_0x1F5:
	andi. r4, r15, 0x200
	cmpwi r4, 0x0
	beq loc_0x1F9
	li r14, 0x4
loc_0x1F9:
	andi. r4, r15, 0x1000
	cmpwi r4, 0x0
	beq loc_0x1FD
	li r14, 0x7
loc_0x1FD:
	lis r4, 0x804e
	lwz r4, 0x0(r4)
	lwz r5, 0x0(r4)
	add r5, r5, r4
	lbz r7, 0x2(r5)
	cmpwi r14, 0x1
	bne loc_0x206
	lhz r6, 0xc(r5)
	b loc_0x209
loc_0x206:
	cmpwi r14, 0x2
	bne loc_0x211
	lhz r6, 0xe(r5)
loc_0x209:
	lbz r9, 0x4(r5)
	xori r9, r9, 0x4
	stb r9, 0x4(r5)
	stw r6, 0x0(r4)
	add r8, r6, r4
	lbz r9, 0x4(r8)
	xori r9, r9, 0x4
	stb r9, 0x4(r8)
loc_0x211:
	cmpwi r14, 0x5
	bne loc_0x245
	cmpwi r7, 0x2
	bgt loc_0x245
	cmpwi r7, 0x0
	bne loc_0x21F
	lwz r6, 0x8(r5)
	addi r6, r6, 0x1
	lwz r8, 0x14(r5)
	cmpw r6, r8
	ble loc_0x21D
	li r6, 0x0
loc_0x21D:
	stw r6, 0x8(r5)
	b loc_0x238
loc_0x21F:
	cmpwi r7, 0x1
	bne loc_0x22E
	lwz r6, 0x8(r5)
	lwz r9, 0x1c(r5)
	add r6, r6, r9
	lwz r9, 0x14(r5)
	cmpw r6, r9
	ble loc_0x22C
	lbz r8, 0x3(r5)
	andi. r8, r8, 0x80
	beq loc_0x22B
	lwz r9, 0x18(r5)
loc_0x22B:
	mr r6, r9
loc_0x22C:
	stw r6, 0x8(r5)
	b loc_0x238
loc_0x22E:
	lfs f2, 0x8(r5)
	lfs f1, 0x1c(r5)
	fadd f1, f2, f1
	lfs f2, 0x14(r5)
	fcmpu cr0, f1, f2
	ble loc_0x237
	lfs f2, 0x18(r5)
	stfs f2, 0x8(r5)
	b loc_0x238
loc_0x237:
	stfs f1, 0x8(r5)
loc_0x238:
	lwz r6, 0x8(r5)
	lbz r8, 0x4(r5)
	lwz r9, 0x10(r5)
	lwz r11, 0x8(r4)
	rlwinm r10, r8, 29, 31, 31      # (Mask: 0x00000008)
	andi. r8, r8, 0xfff7
	cmpw r6, r9
	beq loc_0x242
	addi r11, r11, 0x1
	ori r8, r8, 0x8
loc_0x242:
	subf r11, r10, r11
	stb r8, 0x4(r5)
	stw r11, 0x8(r4)
loc_0x245:
	cmpwi r14, 0x3
	bne loc_0x279
	cmpwi r7, 0x2
	bgt loc_0x279
	cmpwi r7, 0x0
	bne loc_0x253
	lwz r6, 0x8(r5)
	addi r6, r6, 0x1
	lwz r8, 0x14(r5)
	cmpw r6, r8
	ble loc_0x251
	li r6, 0x0
loc_0x251:
	stw r6, 0x8(r5)
	b loc_0x26C
loc_0x253:
	cmpwi r7, 0x1
	bne loc_0x262
	lwz r6, 0x8(r5)
	lwz r9, 0x1c(r5)
	add r6, r6, r9
	lwz r9, 0x14(r5)
	cmpw r6, r9
	ble loc_0x260
	lbz r8, 0x3(r5)
	andi. r8, r8, 0x80
	beq loc_0x25F
	lwz r9, 0x18(r5)
loc_0x25F:
	mr r6, r9
loc_0x260:
	stw r6, 0x8(r5)
	b loc_0x26C
loc_0x262:
	lfs f2, 0x8(r5)
	lfs f1, 0x1c(r5)
	fadd f1, f2, f1
	lfs f2, 0x14(r5)
	fcmpu cr0, f1, f2
	ble loc_0x26B
	lfs f2, 0x18(r5)
	stfs f2, 0x8(r5)
	b loc_0x26C
loc_0x26B:
	stfs f1, 0x8(r5)
loc_0x26C:
	lwz r6, 0x8(r5)
	lbz r8, 0x4(r5)
	lwz r9, 0x10(r5)
	lwz r11, 0x8(r4)
	rlwinm r10, r8, 29, 31, 31      # (Mask: 0x00000008)
	andi. r8, r8, 0xfff7
	cmpw r6, r9
	beq loc_0x276
	addi r11, r11, 0x1
	ori r8, r8, 0x8
loc_0x276:
	subf r11, r10, r11
	stb r8, 0x4(r5)
	stw r11, 0x8(r4)
loc_0x279:
	cmpwi r14, 0x6
	bne loc_0x2AC
	cmpwi r7, 0x2
	bgt loc_0x2AC
	cmpwi r7, 0x0
	bne loc_0x286
	lwz r6, 0x8(r5)
	subi r6, r6, 0x1
	cmpwi r6, 0x0
	bge loc_0x284
	lwz r6, 0x14(r5)
loc_0x284:
	stw r6, 0x8(r5)
	b loc_0x29F
loc_0x286:
	cmpwi r7, 0x1
	bne loc_0x295
	lwz r6, 0x8(r5)
	lwz r9, 0x1c(r5)
	subf r6, r9, r6
	lwz r9, 0x18(r5)
	cmpw r6, r9
	bge loc_0x293
	lbz r8, 0x3(r5)
	andi. r8, r8, 0x80
	beq loc_0x292
	lwz r9, 0x14(r5)
loc_0x292:
	mr r6, r9
loc_0x293:
	stw r6, 0x8(r5)
	b loc_0x29F
loc_0x295:
	lfs f2, 0x8(r5)
	lfs f1, 0x1c(r5)
	fsub f1, f2, f1
	lfs f2, 0x18(r5)
	fcmpu cr0, f1, f2
	bge loc_0x29E
	lfs f2, 0x14(r5)
	stfs f2, 0x8(r5)
	b loc_0x29F
loc_0x29E:
	stfs f1, 0x8(r5)
loc_0x29F:
	lwz r6, 0x8(r5)
	lbz r8, 0x4(r5)
	lwz r9, 0x10(r5)
	lwz r11, 0x8(r4)
	rlwinm r10, r8, 29, 31, 31      # (Mask: 0x00000008)
	andi. r8, r8, 0xfff7
	cmpw r6, r9
	beq loc_0x2A9
	addi r11, r11, 0x1
	ori r8, r8, 0x8
loc_0x2A9:
	subf r11, r10, r11
	stb r8, 0x4(r5)
	stw r11, 0x8(r4)
loc_0x2AC:
	lis r6, 0x804e
	ori r6, r6, 0x94
	cmpwi r14, 0x8
	bne loc_0x2C3
	lbz r9, 0x4(r5)
	lwz r8, 0x8(r4)
	rlwinm r10, r9, 29, 31, 31      # (Mask: 0x00000008)
	andi. r9, r9, 0xfff7
	subf r8, r10, r8
	stb r9, 0x4(r5)
	stw r8, 0x8(r4)
	cmpwi r7, 0x2
	bgt loc_0x2BC
	lwz r8, 0x10(r5)
	stw r8, 0x8(r5)
	b loc_0x2C3
loc_0x2BC:
	cmpwi r7, 0x3
	bne loc_0x2C3
	lhz r8, 0x10(r5)
	add r8, r8, r4
	lwz r9, 0x0(r6)
	stwu r8, 0x4(r9)
	stw r9, 0x0(r6)
loc_0x2C3:
	cmpwi r14, 0x9
	bne loc_0x2C8
	lwz r8, 0x0(r6)
	stwu r4, 0x4(r8)
	stw r8, 0x0(r6)
loc_0x2C8:
	lwz r9, 0x0(r6)
	lwz r8, 0x0(r9)
	cmpw r9, r6
	beq loc_0x2EE
	subi r9, r9, 0x4
	stw r9, 0x0(r6)
	li r3, 0x1
	addi r9, r8, 0x10
	cmpwi r3, 0x0
	beq loc_0x2ED
loc_0x2D2:
	lbz r10, 0x2(r9)
	lbz r12, 0x3(r9)
	andi. r12, r12, 0x1
	bne loc_0x2E9
	lbz r12, 0x4(r9)
	lwz r11, 0x8(r8)
	rlwinm r3, r12, 29, 31, 31      # (Mask: 0x00000008)
	andi. r12, r12, 0xfff7
	subf r11, r3, r11
	stb r12, 0x4(r9)
	stw r11, 0x8(r8)
	cmpwi r10, 0x2
	bgt loc_0x2E2
	lwz r11, 0x10(r9)
	stw r11, 0x8(r9)
	b loc_0x2E9
loc_0x2E2:
	cmpwi r10, 0x3
	bne loc_0x2E9
	lhz r11, 0x10(r9)
	add r11, r11, r8
	lwz r12, 0x0(r6)
	stwu r11, 0x4(r12)
	stw r12, 0x0(r6)
loc_0x2E9:
	lhz r3, 0x0(r9)
	add r9, r9, r3
	cmpwi r3, 0x0
	bne+ loc_0x2D2
loc_0x2ED:
	b loc_0x2C8
loc_0x2EE:
	cmpwi r14, 0x3
	bne loc_0x2F8
	cmpwi r7, 0x3
	bne loc_0x2F8
	lhz r6, 0x10(r5)
	add r8, r4, r6
	neg r6, r6
	stw r6, 0x4(r8)
	lis r6, 0x804e
	stw r8, 0x0(r6)
loc_0x2F8:
	cmpwi r14, 0x4
	bne loc_0x314
	lwz r6, 0x4(r4)
	cmpwi r6, 0x0
	bne loc_0x2FF
	li r14, 0x7
	b loc_0x314
loc_0x2FF:
	add r8, r4, r6
	lis r6, 0x804e
	stw r8, 0x0(r6)
	lwz r6, 0x0(r8)
	add r6, r6, r8
	lbz r9, 0x4(r6)
	rlwinm r10, r9, 29, 31, 31      # (Mask: 0x00000008)
	lwz r11, 0x8(r8)
	andi. r9, r9, 0xfff7
	subf r11, r10, r11
	lwz r10, 0x8(r4)
	li r12, 0x0
	andi. r10, r10, 0x1f
	cmpwi r10, 0x0
	beq loc_0x30F
	li r12, 0x1
loc_0x30F:
	add r11, r11, r12
	rlwinm r12, r12, 3, 0, 31       # (Mask: 0xffffffff)
	stw r11, 0x8(r8)
	or r9, r9, r12
	stb r9, 0x4(r6)
loc_0x314:
	cmpwi r14, 0x7
	bne loc_0x31F
	li r6, 0x3
	lis r8, 0x804e
	ori r8, r8, 0x34
	stw r6, 0x0(r8)
	lis r3, 0x804e
	lwz r3, 0x6c(r3)
	lis r4, 0x805b
	ori r4, r4, 0x8a08
	stw r3, 0x0(r4)
loc_0x31F:
	lis r31, 0x805b
	ori r31, r31, 0xacc4
	lis r30, 0x804e
	ori r30, r30, 0x48
	li r16, 0x0
	cmpwi r16, 0x8
	bge loc_0x32F
loc_0x326:
	lwzu r29, 0x4(r30)
	lwzu r28, 0x40(r31)
	and r27, r28, r29
	stw r27, 0x0(r30)
	andc r28, r28, r29
	stw r28, 0x0(r31)
	addi r16, r16, 0x1
	cmpwi r16, 0x8
	blt+ loc_0x326
loc_0x32F:
	li r26, 0x0
	cmpwi r26, 0x1
	bne loc_0x33F
	lis r31, 0x805b
	ori r31, r31, 0xacc4
	lis r30, 0xffff
	ori r30, r30, 0xeeff
	li r16, 0x0
	cmpwi r16, 0x8
	bge loc_0x33F
loc_0x339:
	lwzu r28, 0x40(r31)
	and r28, r28, r30
	stw r28, 0x0(r31)
	addi r16, r16, 0x1
	cmpwi r16, 0x8
	blt+ loc_0x339
loc_0x33F:
	lis r30, 0x804e
	lwz r30, 0x758(r30)
	cmpwi r30, 0x1
	bne loc_0x34C
	lis r30, 0x804e
	lwz r30, 0xc48(r30)
	cmpwi r30, 0x1
	bne loc_0x34C
	lis r30, 0x804e
	lwz r30, 0x34(r30)
	cmpwi r30, 0x0
	bne loc_0x34C
	b loc_0x394
loc_0x34C:
	lis r29, 0x8058
	lwzu r31, 0x4000(r29)
	lis r30, 0x804e
	lwz r30, 0x34(r30)
	andi. r26, r15, 0x10
	cmpwi r30, 0x4
	bne loc_0x354
	li r26, 0x0
loc_0x354:
	lis r27, 0x804e
	lwzu r28, 0x2c(r27)
	lis r30, 0xefef
	ori r30, r30, 0xffff
	cmpwi r26, 0x0
	beq loc_0x36C
	subi r28, r28, 0x1
	cmpwi r28, 0x0
	bgt loc_0x36B
	cmpwi r28, 0x0
	bge loc_0x360
	li r28, 0xc
loc_0x360:
	andis. r31, r31, 0xffef
	addi r28, r28, 0x4
	li r25, 0x0
	cmpwi r25, 0x20
	bge loc_0x36B
loc_0x365:
	lhzx r24, r29, r25
	andi. r24, r24, 0xffef
	sthx r24, r29, r25
	addi r25, r25, 0x8
	cmpwi r25, 0x20
	blt+ loc_0x365
loc_0x36B:
	b loc_0x36D
loc_0x36C:
	li r28, 0x0
loc_0x36D:
	stw r28, 0x0(r27)
	cmpwi r19, 0x4
	bne loc_0x372
	lis r30, 0xffff
	ori r30, r30, 0xffff
loc_0x372:
	li r28, 0x0
	cmpwi r28, 0x20
	beq loc_0x37B
loc_0x375:
	lwzx r31, r29, r28
	or r31, r30, r31
	stwx r31, r29, r28
	addi r28, r28, 0x8
	cmpwi r28, 0x20
	bne+ loc_0x375
loc_0x37B:
	lis r31, 0x804e
	lwz r31, 0xd48(r31)
	lis r30, 0x8058
	ori r30, r30, 0x3fff
	stb r31, 0x0(r30)
	lis r31, 0x804e
	lwz r31, 0xd84(r31)
	lis r30, 0x8058
	ori r30, r30, 0x3ffd
	stb r31, 0x0(r30)
	lis r31, 0x804e
	lwz r31, 0xe18(r31)
	lis r30, 0x8058
	ori r30, r30, 0x3ff9
	stb r31, 0x0(r30)
	lis r31, 0x804e
	lwz r31, 0xdd4(r31)
	lis r30, 0x8058
	ori r30, r30, 0x3ff7
	stb r31, 0x0(r30)
	lis r31, 0x804e
	lwz r31, 0xe6c(r31)
	lis r30, 0x8058
	ori r30, r30, 0x3ffb
	stb r31, 0x0(r30)
loc_0x394:
	lis r19, 0x804e
	lwz r19, 0x34(r19)
	cmpwi r19, 0x3
	bne loc_0x3DB
	lis r31, 0x804e
	lwz r31, 0xc48(r31)
	cmpwi r31, 0x2
	bne loc_0x3DB
	lis r25, 0x804e
	ori r25, r25, 0xc40
	lis r24, 0x804e
	ori r24, r24, 0xa6c
	lis r23, 0x804e
	ori r23, r23, 0xa24
	lwz r8, 0x8(r25)
	lbz r9, 0x4(r25)
	lwz r4, 0x8(r24)
	lbz r5, 0x4(r24)
	lwz r6, 0x8(r23)
	lbz r7, 0x4(r23)
	lis r30, 0x804e
	lwz r30, 0x4(r30)
	lis r31, 0x804e
	ori r31, r31, 0x94
	lwz r3, 0x0(r31)
	stwu r30, 0x4(r3)
	stw r3, 0x0(r31)
loc_0x3AF:
	lwz r29, 0x0(r31)
	lwz r30, 0x0(r29)
	cmpw r29, r31
	beq loc_0x3D5
	subi r29, r29, 0x4
	stw r29, 0x0(r31)
	li r3, 0x1
	addi r29, r30, 0x10
	cmpwi r3, 0x0
	beq loc_0x3D4
loc_0x3B9:
	lbz r28, 0x2(r29)
	lbz r26, 0x3(r29)
	andi. r26, r26, 0x1
	bne loc_0x3D0
	lbz r26, 0x4(r29)
	lwz r27, 0x8(r30)
	rlwinm r3, r26, 29, 31, 31      # (Mask: 0x00000008)
	andi. r26, r26, 0xfff7
	subf r27, r3, r27
	stb r26, 0x4(r29)
	stw r27, 0x8(r30)
	cmpwi r28, 0x2
	bgt loc_0x3C9
	lwz r27, 0x10(r29)
	stw r27, 0x8(r29)
	b loc_0x3D0
loc_0x3C9:
	cmpwi r28, 0x3
	bne loc_0x3D0
	lhz r27, 0x10(r29)
	add r27, r27, r30
	lwz r26, 0x0(r31)
	stwu r27, 0x4(r26)
	stw r26, 0x0(r31)
loc_0x3D0:
	lhz r3, 0x0(r29)
	add r29, r29, r3
	cmpwi r3, 0x0
	bne+ loc_0x3B9
loc_0x3D4:
	b loc_0x3AF
loc_0x3D5:
	stw r8, 0x8(r25)
	stb r9, 0x4(r25)
	stw r4, 0x8(r24)
	stb r5, 0x4(r24)
	stw r6, 0x8(r23)
	stb r7, 0x4(r23)
loc_0x3DB:
	lis r25, 0x804e
	lwz r25, 0x758(r25)
	cmpwi r19, 0x4
	beq loc_0x45C
	cmpwi r25, 0x1
	bne loc_0x45C
	lis r20, 0x804e
	lwz r20, 0x644(r20)
	lwzu r21, 0x4(r20)
	cmpwi r21, 0x0
	beq loc_0x45C
loc_0x3E6:
	lwz r24, 0x38(r21)
	lwz r30, 0x34(r21)
	cmpwi r24, 0x3
	bgt loc_0x3FA
	cmpwi r24, 0x0
	blt loc_0x3FA
	rlwinm r4, r24, 2, 0, 31        # (Mask: 0xffffffff)
	lis r3, 0x804e
	ori r3, r3, 0x12c
	lwzx r3, r3, r4
	lwz r5, 0x8(r3)
	cmpwi r5, 0x1
	bne loc_0x3FA
	lbz r30, 0x7(r30)
	lis r29, 0x805b
	ori r29, r29, 0xacc4
	mulli r30, r30, 0x40
	lwzux r30, r29, r30
	andi. r30, r30, 0xfff0
	stw r30, 0x0(r29)
loc_0x3FA:
	cmpwi r24, 0x3
	bgt loc_0x42A
	cmpwi r24, 0x0
	blt loc_0x42A
	rlwinm r4, r24, 2, 0, 31        # (Mask: 0xffffffff)
	lis r3, 0x804e
	ori r3, r3, 0x11c
	lwzx r3, r3, r4
	lwz r5, 0x8(r3)
	lwz r30, 0x34(r21)
	cmpwi r5, 0x1
	bne loc_0x42A
	andi. r31, r15, 0xf
	cmpwi r31, 0x0
	beq loc_0x42A
	cmpwi r24, 0x3
	bgt loc_0x42A
	cmpwi r24, 0x0
	blt loc_0x42A
	rlwinm r4, r24, 2, 0, 31        # (Mask: 0xffffffff)
	lis r3, 0x804e
	ori r3, r3, 0x10c
	lwzx r3, r3, r4
	lfs f1, 0x8(r3)
	lis r29, 0x8061
	ori r29, r29, 0x5520
	rlwinm r28, r24, 2, 0, 31       # (Mask: 0xffffffff)
	add r29, r29, r28
	lwz r29, 0x4c(r29)
	fctiwz f0, f1
	stfd f0, -0x30(r1)
	lwz r28, -0x2c(r1)
	stw r28, 0x18(r29)
	addi r31, r28, 0x1
	stw r31, 0x1c(r29)
	lwz r29, 0x3c(r21)
	lwz r29, 0x60(r29)
	lwz r29, 0xd8(r29)
	lwz r29, 0x38(r29)
	lwz r29, 0x40(r29)
	stfs f1, 0xc(r29)
	lwz r3, 0x3c(r21)
	lis r0, 0x8083
	ori r0, r0, 0xae24
	mtctr r0
	bctrl
	lwz r3, 0x0(r3)
	stfs f1, 0x24(r3)
loc_0x42A:
	cmpwi r19, 0x3
	bne loc_0x44B
	cmpwi r24, 0x3
	bgt loc_0x44B
	cmpwi r24, 0x0
	blt loc_0x44B
	rlwinm r4, r24, 2, 0, 31        # (Mask: 0xffffffff)
	lis r3, 0x804e
	ori r3, r3, 0xec
	lwzx r3, r3, r4
	lwz r5, 0x8(r3)
	stw r5, 0x10(r3)
	lwz r30, 0x34(r21)
	rlwinm r5, r5, 2, 0, 31         # (Mask: 0xffffffff)
	lbz r4, 0x0(r30)
	addi r5, r5, 0x1e
	lwz r31, 0x18(r3)
	lhzx r5, r31, r5
	cmpw r4, r5
	beq loc_0x44B
	li r31, 0x0
	stb r5, 0x0(r30)
	lis r29, 0x4
	ori r29, r29, 0x3ad8
	lis r28, 0x805a
	lwz r28, 0xe0(r28)
	lwz r28, 0x10(r28)
	add r28, r28, r29
	lwz r29, 0x38(r21)
	mulli r29, r29, 0x5c
	stwx r31, r28, r29
	stb r31, 0x5(r30)
	stb r31, 0x6(r30)
loc_0x44B:
	cmpwi r24, 0x3
	bgt loc_0x459
	cmpwi r24, 0x0
	blt loc_0x459
	rlwinm r4, r24, 2, 0, 31        # (Mask: 0xffffffff)
	lis r3, 0x804e
	ori r3, r3, 0xfc
	lwzx r3, r3, r4
	lwz r3, 0x8(r3)
	cmpwi r3, 0x1
	bne loc_0x459
	lwz r31, 0x0(r21)
	lis r30, 0x4270
	stw r30, 0x19c(r31)
loc_0x459:
	lwzu r21, 0x8(r20)
	cmpwi r21, 0x0
	bne+ loc_0x3E6
loc_0x45C:
	cmpwi r19, 0x3
	bne loc_0x461
	lis r4, 0x804e
	lwzu r3, 0x30(r4)
	stw r3, 0x4(r4)
loc_0x461:
	lis r29, 0x805c
	lwz r29, -0x4040(r29)
	lis r30, 0x804e
	ori r30, r30, 0x3c
	cmpwi r29, 0x2
	bne loc_0x468
	stw r29, 0x0(r30)
loc_0x468:
	lis r31, 0x804e
	lwz r31, 0xa74(r31)
	cmpwi r31, 0x1
	beq loc_0x46E
	li r31, 0x0
	stw r31, 0x0(r30)
loc_0x46E:
	cmpwi r19, 0x3
	bne loc_0x53F
	lis r30, 0x804e
	ori r30, r30, 0xab0
	lwz r31, 0x8(r30)
	cmpwi r31, 0x1
	bne loc_0x53F
	li r31, 0x0
	lbz r29, 0x4(r30)
	stw r31, 0x8(r30)
	andi. r29, r29, 0xfff7
	stb r29, 0x4(r30)
	lis r3, 0x804e
	lwz r3, 0x758(r3)
	cmpwi r3, 0x0
	bne loc_0x53F
	lis r31, 0x804e
	ori r31, r31, 0x164
	lis r30, 0x804e
	ori r30, r30, 0x178
	lis r27, 0x804e
	ori r27, r27, 0x180
	li r3, 0x0
	stw r3, 0x0(r30)
	stw r3, 0x4(r30)
	lis r4, 0x4e03
	ori r4, r4, 0x41de
	stw r4, 0x0(r27)
	lis r4, 0xe6bb
	ori r4, r4, 0xaa41
	stw r4, 0x4(r27)
	lis r4, 0x6419
	ori r4, r4, 0xb3ea
	stw r4, 0x8(r27)
	lis r4, 0xe8f5
	ori r4, r4, 0x3bd9
	stw r4, 0xc(r27)
	li r3, 0x2a
	li r4, 0x1
	stw r3, 0x18(r27)
	stw r4, 0x1c(r27)
	lis r0, 0x801e
	ori r0, r0, 0x1b34
	mtctr r0
	bctrl
	mr r29, r3
	mr r28, r4
	lis r3, 0x804e
	ori r3, r3, 0x164
	li r4, 0x2a
	lis r0, 0x8015
	ori r0, r0, 0x2b5c
	mtctr r0
	bctrl
	lis r4, 0x804e
	lwz r4, 0x7d4(r4)
	addi r4, r4, 0x100
	lis r0, 0x8015
	ori r0, r0, 0x2c4c
	mtctr r0
	bctrl
	addi r3, r30, 0x0
	addi r4, r31, 0x0
	addi r5, r29, 0x0
	addi r6, r28, 0x0
	li r7, 0x2a
	li r8, 0x0
	li r9, 0x0
	lis r0, 0x8015
	ori r0, r0, 0x3610
	mtctr r0
	bctrl
	lwz r3, 0x0(r30)
	stw r3, 0x10(r27)
	lwz r3, 0x1c(r3)
	addi r3, r3, 0x20
	stw r3, 0x14(r27)
	subi r3, r27, 0x340
	lis r0, 0x8003
	ori r0, r0, 0xd1cc
	mtctr r0
	bctrl
	lis r26, 0x804e
	ori r26, r26, 0x6e8
	lis r25, 0x804e
	ori r25, r25, 0x648
	addi r3, r29, 0x0
	addi r4, r28, 0x0
	addi r5, r25, 0x0
	lis r0, 0x801e
	ori r0, r0, 0x1d80
	mtctr r0
	bctrl
	lwz r19, 0x0(r25)
	lwz r24, 0x4(r25)
	lwz r23, 0x8(r25)
	lwz r22, 0xc(r25)
	lwz r21, 0x10(r25)
	lwz r20, 0x14(r25)
	addi r21, r21, 0x1
	li r3, 0x64
	mr r4, r20
	divwu r20, r4, r3
	mullw r20, r20, r3
	subf r20, r20, r4
	lis r4, 0x2f50
	ori r4, r4, 0x726f
	stw r4, 0x0(r26)
	lis r4, 0x6a65
	ori r4, r4, 0x6374
	stw r4, 0x4(r26)
	lis r4, 0x2b2f
	ori r4, r4, 0x7270
	stw r4, 0x8(r26)
	lis r4, 0x2f72
	ori r4, r4, 0x705f
	stw r4, 0xc(r26)
	lis r4, 0x2530
	ori r4, r4, 0x3264
	stw r4, 0x10(r26)
	lis r4, 0x2530
	ori r4, r4, 0x3264
	stw r4, 0x14(r26)
	lis r4, 0x2530
	ori r4, r4, 0x3264
	stw r4, 0x18(r26)
	lis r4, 0x5f25
	ori r4, r4, 0x3032
	stw r4, 0x1c(r26)
	lis r4, 0x6425
	ori r4, r4, 0x3032
	stw r4, 0x20(r26)
	lis r4, 0x645f
	ori r4, r4, 0x2530
	stw r4, 0x24(r26)
	lis r4, 0x3264
	ori r4, r4, 0x2e62
	stw r4, 0x28(r26)
	lis r4, 0x696e
	stw r4, 0x2c(r26)
	lis r3, 0x804e
	ori r3, r3, 0x648
	addi r4, r26, 0x0
	addi r5, r20, 0x0
	addi r6, r21, 0x0
	addi r7, r22, 0x0
	addi r8, r23, 0x0
	addi r9, r24, 0x0
	addi r10, r19, 0x0
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	lis r26, 0x804e
	ori r26, r26, 0x648
	lwz r25, 0x2c(r27)
	lwz r24, 0x28(r27)
	li r23, 0x2000
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r23, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	mr r23, r1
	addi r1, r3, 0x1f00
	mr r22, r3
	li r4, 0x0
	lis r3, 0x804e
	ori r3, r3, 0x75c
	stw r26, 0x0(r3)
	stw r4, 0x4(r3)
	stw r25, 0x8(r3)
	stw r24, 0xc(r3)
	stw r4, 0x10(r3)
	stw r4, 0x14(r3)
	lis r0, 0x8001
	ori r0, r0, 0xd740
	mtctr r0
	bctrl
	mr r1, r23
	addi r3, r22, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	mr r3, r31
	li r4, 0x0
	lis r0, 0x8015
	ori r0, r0, 0x2bdc
	mtctr r0
	bctrl
	lwz r25, 0x28(r27)
	addi r3, r25, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	lwz r25, 0x0(r30)
	addi r3, r25, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
loc_0x53F:
	lis r31, 0x8058
	lbz r31, 0x3ff9(r31)
	cmpwi r31, 0x2
	bne loc_0x548
	li r30, 0x1
	lis r29, 0x804e
	ori r29, r29, 0x2a4
	stw r30, 0x0(r29)
	b loc_0x557
loc_0x548:
	lis r29, 0x804e
	lwzu r30, 0x2a4(r29)
	cmpwi r30, 0x1
	bne loc_0x557
	li r30, 0x0
	stw r30, 0x0(r29)
	lis r3, 0x8067
	ori r3, r3, 0x2f40
	li r4, 0x0
	li r5, 0x1
	lis r0, 0x8000
	ori r0, r0, 0xd234
	mtctr r0
	bctrl
	addi r31, r31, 0x1
loc_0x557:
	lis r31, 0x8058
	lbz r31, 0x3ffd(r31)
	cmpwi r31, 0x2
	bne loc_0x560
	li r30, 0x1
	lis r29, 0x804e
	ori r29, r29, 0x2a0
	stw r30, 0x0(r29)
	b loc_0x574
loc_0x560:
	lis r29, 0x804e
	lwzu r30, 0x2a0(r29)
	cmpwi r30, 0x1
	bne loc_0x574
	li r30, 0x0
	stw r30, 0x0(r29)
	li r31, 0x1
	cmpwi r31, 0x5
	bgt loc_0x574
loc_0x569:
	lis r3, 0x8067
	ori r3, r3, 0x2f40
	mr r4, r31
	li r5, 0x1
	lis r0, 0x8000
	ori r0, r0, 0xd234
	mtctr r0
	bctrl
	addi r31, r31, 0x1
	cmpwi r31, 0x5
	ble+ loc_0x569
loc_0x574:
	lmw r3, 0x8(r1)
	addi r1, r1, 0xf4
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lfd f3, -0x28(r1)
	lfd f4, -0x30(r1)
	lfd f5, -0x38(r1)
	lfd f6, -0x40(r1)
	lfd f7, -0x48(r1)
	lfd f8, -0x50(r1)
	lfd f9, -0x58(r1)
	lfd f10, -0x60(r1)
	lfd f11, -0x68(r1)
	lfd f12, -0x70(r1)
	lfd f13, -0x78(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	blr
	nop
}

##############################
[CM: Code Menu] Stop Announcer
##############################
HOOK @ $809580B4                # Address = $(ba + 0x009580B4)
{
	lis r4, 0x804e
	lwz r4, 0x904(r4)
	cmpwi r4, 0x2
	blt loc_0x005
	blr
loc_0x005:
	stwu r1, -0x20(r1)
	nop
}

##################################
[CM: Code Menu] Endless Friendlies
##################################
HOOK @ $809489EC                # Address = $(ba + 0x009489EC)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r25, 0xffff
	ori r25, r25, 0xffff
	lis r31, 0x804e
	lwz r31, 0x904(r31)
	cmpwi r31, 0x2
	blt loc_0x02E
	lis r31, 0x804e
	lwzu r30, 0x13c(r31)
	cmpwi r30, 0x0
	beq loc_0x022
	li r25, 0x1
	lwz r29, 0x48(r3)
	addi r29, r29, 0x1
	lis r28, 0x804e
	ori r28, r28, 0x23c
	mulli r27, r29, 0x4
	addi r26, r3, 0x5d
	stwx r26, r28, r27
	rlwinm r28, r30, 8, 24, 31      # (Mask: 0xff000000)
	cmpw r28, r29
	bne loc_0x01D
	li r25, 0x0
loc_0x01D:
	rlwinm r28, r30, 16, 24, 31     # (Mask: 0x00ff0000)
	cmpw r28, r29
	bne loc_0x021
	li r25, 0x0
loc_0x021:
	b loc_0x02E
loc_0x022:
	lis r29, 0x805b
	lwz r29, 0x50ac(r29)
	lwz r29, 0x10(r29)
	cmpwi r29, 0x0
	beq loc_0x029
	lwz r29, 0x8(r29)
	b loc_0x02B
loc_0x029:
	lis r29, 0xffff
	ori r29, r29, 0xffff
loc_0x02B:
	cmpwi r29, 0xa
	bne loc_0x02E
	li r25, 0x0
loc_0x02E:
	cmpwi r25, 0x0
	bne loc_0x033
	lbz r29, 0x5d(r3)
	andi. r29, r29, 0xfff7
	stb r29, 0x5d(r3)
loc_0x033:
	cmpwi r25, 0x1
	bne loc_0x038
	lbz r29, 0x5d(r3)
	ori r29, r29, 0x8
	stb r29, 0x5d(r3)
loc_0x038:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	lbz r0, 0x5d(r3)
	nop
}

##########################
[CM: DrawDI] Set Hit Start
##########################
HOOK @ $808761E8                # Address = $(ba + 0x008761E8)
{
	bctrl
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	li r14, 0x1
	lis r3, 0x804e
	lwz r3, 0x644(r3)
	rlwinm r4, r3, 16, 16, 31       # (Mask: 0xffff0000)
	cmplwi r4, 0xcccc
	bne loc_0x00F
	li r14, 0x0
loc_0x00F:
	cmpwi r14, 0x0
	beq loc_0x018
	lwz r14, 0x0(r3)
	cmpw r14, r30
	beq loc_0x017
loc_0x014:
	lwzu r14, 0x8(r3)
	cmpw r14, r30
	bne+ loc_0x014
loc_0x017:
	lwz r14, 0x4(r3)
loc_0x018:
	cmpwi r14, 0x0
	beq loc_0x053
	lwz r29, 0x8(r14)
	lwz r29, 0x0(r29)
	stw r29, 0x4(r14)
	lwz r29, 0xc(r14)
	lwz r28, 0xc(r29)
	lwz r27, 0x10(r29)
	stw r28, 0x24(r14)
	stw r27, 0x28(r14)
	lwz r29, 0xc(r31)
	stw r29, 0x1c(r14)
	lwz r29, 0x10(r31)
	stw r29, 0x20(r14)
	lwz r15, 0x64(r14)
	lwz r29, 0x0(r15)
	li r3, 0x0
	stw r3, 0xc(r29)
	stw r3, 0x14(r29)
	addi r3, r29, 0x14
	stw r3, 0x0(r29)
	lwz r28, 0x24(r14)
	lwz r27, 0x28(r14)
	lwz r4, 0x10(r29)
	lwz r3, 0x0(r29)
	subf r3, r29, r3
	cmplw r3, r4
	bge loc_0x03B
	lwz r3, 0xc(r29)
	addi r3, r3, 0x1
	stw r3, 0xc(r29)
	lwz r3, 0x0(r29)
	stwu r28, 0x4(r3)
	stwu r27, 0x4(r3)
	stw r3, 0x0(r29)
loc_0x03B:
	lwz r29, 0x4(r15)
	li r3, 0x0
	stw r3, 0xc(r29)
	stw r3, 0x14(r29)
	addi r3, r29, 0x14
	stw r3, 0x0(r29)
	lwz r29, 0x8(r15)
	lis r3, 0x66
	ori r3, r3, 0xffff
	stw r3, 0x8(r29)
	li r3, 0x0
	stw r3, 0xc(r29)
	stw r3, 0x14(r29)
	addi r3, r29, 0x14
	stw r3, 0x0(r29)
	lwz r29, 0xc(r15)
	lis r3, 0xffff
	ori r3, r3, 0xff
	stw r3, 0x8(r29)
	li r3, 0x0
	stw r3, 0xc(r29)
	stw r3, 0x14(r29)
	addi r3, r29, 0x14
	stw r3, 0x0(r29)
loc_0x053:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	nop
}

##############################
[CM: DrawDI] Add to SDI Buffer
##############################
HOOK @ $80876C84                # Address = $(ba + 0x00876C84)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	li r12, 0x1
	lis r3, 0x804e
	lwz r3, 0x644(r3)
	rlwinm r4, r3, 16, 16, 31       # (Mask: 0xffff0000)
	cmplwi r4, 0xcccc
	bne loc_0x00E
	li r12, 0x0
loc_0x00E:
	cmpwi r12, 0x0
	beq loc_0x017
	lwz r12, 0x0(r3)
	cmpw r12, r30
	beq loc_0x016
loc_0x013:
	lwzu r12, 0x8(r3)
	cmpw r12, r30
	bne+ loc_0x013
loc_0x016:
	lwz r12, 0x4(r3)
loc_0x017:
	cmpwi r12, 0x0
	beq loc_0x02B
	stfs f0, 0x24(r12)
	stfs f2, 0x28(r12)
	lwz r12, 0x64(r12)
	lwz r12, 0x0(r12)
	lwz r4, 0x10(r12)
	lwz r3, 0x0(r12)
	subf r3, r12, r3
	cmplw r3, r4
	bge loc_0x029
	lwz r3, 0xc(r12)
	addi r3, r3, 0x1
	stw r3, 0xc(r12)
	lwz r3, 0x0(r12)
	stfsu f0, 0x4(r3)
	stfsu f2, 0x4(r3)
	stw r3, 0x0(r12)
loc_0x029:
	li r3, 0x1
	stw r3, 0x14(r12)
loc_0x02B:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	stfs f2, 0x14(r1)
}

###############################
[CM: DrawDI] Add To ASDI Buffer
###############################
HOOK @ $80876FEC                # Address = $(ba + 0x00876FEC)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	li r15, 0x1
	lis r3, 0x804e
	lwz r3, 0x644(r3)
	rlwinm r4, r3, 16, 16, 31       # (Mask: 0xffff0000)
	cmplwi r4, 0xcccc
	bne loc_0x00E
	li r15, 0x0
loc_0x00E:
	cmpwi r15, 0x0
	beq loc_0x017
	lwz r15, 0x0(r3)
	cmpw r15, r31
	beq loc_0x016
loc_0x013:
	lwzu r15, 0x8(r3)
	cmpw r15, r31
	bne+ loc_0x013
loc_0x016:
	lwz r15, 0x4(r3)
loc_0x017:
	cmpwi r15, 0x0
	beq loc_0x038
	lwz r14, 0x64(r15)
	lwz r30, 0x4(r14)
	lwz r4, 0x10(r30)
	lwz r3, 0x0(r30)
	subf r3, r30, r3
	cmplw r3, r4
	bge loc_0x027
	lwz r3, 0xc(r30)
	addi r3, r3, 0x1
	stw r3, 0xc(r30)
	lwz r3, 0x0(r30)
	stfsu f1, 0x4(r3)
	stfsu f3, 0x4(r3)
	stw r3, 0x0(r30)
loc_0x027:
	li r3, 0x1
	stw r3, 0x14(r30)
	fadds f3, f0, f1
	stfs f3, 0x24(r15)
	stfs f2, 0x28(r15)
	lwz r4, 0x10(r30)
	lwz r3, 0x0(r30)
	subf r3, r30, r3
	cmplw r3, r4
	bge loc_0x038
	lwz r3, 0xc(r30)
	addi r3, r3, 0x1
	stw r3, 0xc(r30)
	lwz r3, 0x0(r30)
	stfsu f3, 0x4(r3)
	stfsu f2, 0x4(r3)
	stw r3, 0x0(r30)
loc_0x038:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	lfs f3, 0x18(r1)
	nop
}

###################################
[CM: DrawDI] Set Trajectory Buffers
###################################
HOOK @ $80877B48                # Address = $(ba + 0x00877B48)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stfd f3, -0x28(r1)
	stfd f4, -0x30(r1)
	stfd f5, -0x38(r1)
	stfd f6, -0x40(r1)
	stfd f7, -0x48(r1)
	stfd f8, -0x50(r1)
	stfd f9, -0x58(r1)
	stfd f10, -0x60(r1)
	stfd f11, -0x68(r1)
	stfd f12, -0x70(r1)
	stfd f13, -0x78(r1)
	stfd f14, -0x80(r1)
	stfd f15, -0x88(r1)
	stfd f16, -0x90(r1)
	stfd f17, -0x98(r1)
	stfd f18, -0xa0(r1)
	stfd f19, -0xa8(r1)
	stfd f20, -0xb0(r1)
	stfd f21, -0xb8(r1)
	stfd f22, -0xc0(r1)
	stfd f23, -0xc8(r1)
	stfd f24, -0xd0(r1)
	stfd f25, -0xd8(r1)
	stfd f26, -0xe0(r1)
	stfd f27, -0xe8(r1)
	stfd f28, -0xf0(r1)
	stfd f29, -0xf8(r1)
	stwu r1, -0x174(r1)
	stmw r3, 0x8(r1)
	li r14, 0x1
	lis r3, 0x804e
	lwz r3, 0x644(r3)
	rlwinm r4, r3, 16, 16, 31       # (Mask: 0xffff0000)
	cmplwi r4, 0xcccc
	bne loc_0x02C
	li r14, 0x0
loc_0x02C:
	cmpwi r14, 0x0
	beq loc_0x035
	lwz r14, 0x0(r3)
	cmpw r14, r29
	beq loc_0x034
loc_0x031:
	lwzu r14, 0x8(r3)
	cmpw r14, r29
	bne+ loc_0x031
loc_0x034:
	lwz r14, 0x4(r3)
loc_0x035:
	cmpwi r14, 0x0
	beq loc_0x0BC
	lis r28, 0x805c
	lbz r28, -0x75f5(r28)
	lfs f7, 0x2c(r14)
	lfs f9, 0x30(r14)
	lfs f10, 0x1c(r14)
	lfs f11, 0x20(r14)
	lwz r15, 0x64(r14)
	lwz r31, 0x8(r15)
	lis r3, 0x66
	ori r3, r3, 0xffff
	stw r3, 0x8(r31)
	li r3, 0x0
	stw r3, 0xc(r31)
	stw r3, 0x14(r31)
	addi r3, r31, 0x14
	stw r3, 0x0(r31)
	li r25, 0x0
	cmpwi r25, 0x2
	bge loc_0x0BC
loc_0x04A:
	lfs f5, 0x24(r14)
	lfs f6, 0x28(r14)
	lwz r30, 0x4(r14)
	li r3, 0x0
	stw r3, -0x10(r1)
	lfs f8, -0x10(r1)
	lwz r3, -0x41a8(r13)
	lfs f19, 0x158(r3)
	lfs f20, 0x15c(r3)
	lfs f17, 0x160(r3)
	lfs f18, 0x164(r3)
	cmpwi r30, 0x1f4
	ble loc_0x058
	li r30, 0x1f4
loc_0x058:
	cmpwi r30, 0x0
	ble loc_0x09C
loc_0x05A:
	lwz r4, 0x10(r31)
	lwz r3, 0x0(r31)
	subf r3, r31, r3
	cmplw r3, r4
	bge loc_0x066
	lwz r3, 0xc(r31)
	addi r3, r3, 0x1
	stw r3, 0xc(r31)
	lwz r3, 0x0(r31)
	stfsu f5, 0x4(r3)
	stfsu f6, 0x4(r3)
	stw r3, 0x0(r31)
loc_0x066:
	fmuls f0, f10, f10
	fmuls f2, f11, f11
	fadds f12, f0, f2
	fmr f1, f12
	lis r0, 0x8003
	ori r0, r0, 0xdb58
	mtctr r0
	bctrl
	fmuls f0, f1, f12
	lis r3, 0xbd50
	ori r3, r3, 0xe560
	stw r3, -0x10(r1)
	lfs f2, -0x10(r1)
	fadds f2, f0, f2
	fdivs f0, f2, f0
	lis r3, 0xbf80
	stw r3, -0x10(r1)
	lfs f2, -0x10(r1)
	fadds f0, f0, f2
	fmuls f12, f10, f0
	fmuls f13, f11, f0
	fadds f10, f10, f12
	fadds f11, f11, f13
	fadds f5, f5, f10
	fadds f6, f6, f8
	fadds f6, f6, f11
	fadds f8, f8, f7
	fcmpu cr0, f8, f9
	bge loc_0x084
	fmr f8, f9
loc_0x084:
	li r3, 0x1
	fcmpu cr0, f6, f17
	ble loc_0x08D
	lis r4, 0x4019
	ori r4, r4, 0x999a
	stw r4, -0x10(r1)
	lfs f12, -0x10(r1)
	fcmpu cr0, f11, f12
	bgt loc_0x094
loc_0x08D:
	fcmpu cr0, f5, f19
	blt loc_0x094
	fcmpu cr0, f5, f20
	bgt loc_0x094
	fcmpu cr0, f6, f18
	blt loc_0x094
	li r3, 0x0
loc_0x094:
	cmpwi r3, 0x1
	bne loc_0x099
	lis r3, 0xff00
	ori r3, r3, 0xff
	stw r3, 0x8(r31)
loc_0x099:
	subi r30, r30, 0x1
	cmpwi r30, 0x0
	bgt+ loc_0x05A
loc_0x09C:
	li r3, 0x1
	stw r3, 0x14(r31)
	lwz r31, 0x10(r14)
	lfs f10, 0x8(r31)
	lfs f11, 0xc(r31)
	cmpwi r28, 0x0
	beq loc_0x0AE
	lwz r31, 0x10(r15)
	lis r3, 0x6e00
	ori r3, r3, 0x94ff
	stw r3, 0x8(r31)
	li r3, 0x0
	stw r3, 0xc(r31)
	stw r3, 0x14(r31)
	addi r3, r31, 0x14
	stw r3, 0x0(r31)
	li r28, 0x0
	b loc_0x0B9
loc_0x0AE:
	cmpwi r25, 0x0
	bne loc_0x0B9
	lwz r31, 0xc(r15)
	lis r3, 0xffff
	ori r3, r3, 0xff
	stw r3, 0x8(r31)
	li r3, 0x0
	stw r3, 0xc(r31)
	stw r3, 0x14(r31)
	addi r3, r31, 0x14
	stw r3, 0x0(r31)
loc_0x0B9:
	addi r25, r25, 0x1
	cmpwi r25, 0x2
	blt+ loc_0x04A
loc_0x0BC:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x174
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lfd f3, -0x28(r1)
	lfd f4, -0x30(r1)
	lfd f5, -0x38(r1)
	lfd f6, -0x40(r1)
	lfd f7, -0x48(r1)
	lfd f8, -0x50(r1)
	lfd f9, -0x58(r1)
	lfd f10, -0x60(r1)
	lfd f11, -0x68(r1)
	lfd f12, -0x70(r1)
	lfd f13, -0x78(r1)
	lfd f14, -0x80(r1)
	lfd f15, -0x88(r1)
	lfd f16, -0x90(r1)
	lfd f17, -0x98(r1)
	lfd f18, -0xa0(r1)
	lfd f19, -0xa8(r1)
	lfd f20, -0xb0(r1)
	lfd f21, -0xb8(r1)
	lfd f22, -0xc0(r1)
	lfd f23, -0xc8(r1)
	lfd f24, -0xd0(r1)
	lfd f25, -0xd8(r1)
	lfd f26, -0xe0(r1)
	lfd f27, -0xe8(r1)
	lfd f28, -0xf0(r1)
	lfd f29, -0xf8(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	psq_l f31, 0x88(r1), 0, 0
	nop
}

##################################
[CM: Code Menu] Constant Overrides
##################################
HOOK @ $80023D60                # Address = $(ba + 0x00023D60)
{
	lis r4, 0x804e
	lwz r4, 0x198c(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x7aa8
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x19c8(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x7aec
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1a04(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x7ae8
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1a3c(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x7b10
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1a80(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8354
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1ab4(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8358
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1aec(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8420
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1b34(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8444
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1b78(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x845c
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1bb8(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8460
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1bf4(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8478
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1c34(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8484
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1c74(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8510
	stw r4, 0x0(r5)
	lis r4, 0x804e
	lwz r4, 0x1cbc(r4)
	lis r5, 0x80b8
	ori r5, r5, 0x8534
	stw r4, 0x0(r5)
	cmpwi r0, 0x0
}

######################
[CM: DBZMode] DBZ Mode
######################
HOOK @ $807C1A20                # Address = $(ba + 0x007C1A20)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stwu r1, -0x9c(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x804e
	lwz r31, 0x1f2c(r31)
	cmpwi r31, 0x1
	bne loc_0x03D
	lwz r27, 0xd8(r27)
	lwz r3, 0x64(r27)
	lis r4, 0x2200
	ori r4, r4, 0x2
	lis r0, 0x807a
	ori r0, r0, 0xcd44
	mtctr r0
	bctrl
	lwz r27, 0x5c(r27)
	lfs f1, 0x38(r27)
	lwz r31, 0x64(r26)
	lfs f2, 0x8(r31)
	lis r30, 0x804e
	ori r30, r30, 0x2014
	lfs f0, 0x8(r30)
	fmuls f1, f1, f0
	fadds f1, f1, f2
	lis r30, 0x804e
	ori r30, r30, 0x1f60
	lfs f2, 0x8(r30)
	fneg f0, f2
	fcmpu cr0, f1, f0
	bge loc_0x026
	fmr f1, f0
loc_0x026:
	fcmpu cr0, f1, f2
	ble loc_0x029
	fmr f1, f2
loc_0x029:
	stfs f1, 0x8(r31)
	lfs f1, 0x3c(r27)
	lwz r31, 0x58(r26)
	lfs f2, 0xc(r31)
	lis r30, 0x804e
	ori r30, r30, 0x2054
	lfs f0, 0x8(r30)
	fmuls f1, f1, f0
	fadds f1, f1, f2
	lis r30, 0x804e
	ori r30, r30, 0x1f9c
	lfs f2, 0x8(r30)
	fneg f0, f2
	fcmpu cr0, f1, f0
	bge loc_0x039
	fmr f1, f0
loc_0x039:
	fcmpu cr0, f1, f2
	ble loc_0x03C
	fmr f1, f2
loc_0x03C:
	stfs f1, 0xc(r31)
loc_0x03D:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x9c
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	addi r11, r1, 0x30
	nop
}

#################################
[CM: DBZMode] Force Death Off Top
#################################
HOOK @ $8083ADE0                # Address = $(ba + 0x0083ADE0)
{
	lis r4, 0x804e
	lwz r4, 0x1f2c(r4)
	cmpwi r4, 0x1
	bne loc_0x028
	cmpwi r3, -0x1
	bne loc_0x028
	lwz r3, 0x70(r31)
	lis r4, 0x1200
	ori r4, r4, 0x1
	lis r0, 0x807a
	ori r0, r0, 0xccdc
	mtctr r0
	bctrl
	cmpwi r3, 0x0
	bne loc_0x026
	lwz r3, 0x20(r31)
	lis r0, 0x8074
	ori r0, r0, 0x628
	mtctr r0
	bctrl
	cmpwi r3, 0x5
	beq loc_0x026
	lis r3, 0x804e
	ori r3, r3, 0x648
	lwz r4, 0x18(r31)
	lis r0, 0x8072
	ori r0, r0, 0xfa9c
	mtctr r0
	bctrl
	li r5, 0x0
	stw r5, -0x10(r1)
	lfs f1, -0x10(r1)
	fmr f2, f1
	lis r0, 0x8073
	ori r0, r0, 0xb8dc
	mtctr r0
	bctrl
	b loc_0x028
loc_0x026:
	lis r3, 0xffff
	ori r3, r3, 0xffff
loc_0x028:
	cmpwi r3, -0x1
}

##################################
[CM: Code Menu] Alt Stage Behavior
##################################
HOOK @ $8010F990                # Address = $(ba + 0x0010F990)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r3, 0x804e
	lwz r3, 0x9d8(r3)
	cmpwi r3, 0x2
	bne loc_0x013
	li r3, 0x0
	lis r4, 0x800b
	ori r4, r4, 0x9ea2
	sth r3, 0x0(r4)
	lis r4, 0x815e
	ori r4, r4, 0x8422
	sth r3, 0x0(r4)
	b loc_0x03B
loc_0x013:
	cmpwi r3, 0x1
	bne loc_0x03B
	lis r4, 0x804e
	lwzu r3, 0x254(r4)
	cmpwi r3, 0x1
	bne loc_0x024
	lis r6, 0x805a
	lwz r6, 0xbc(r6)
	li r5, 0x5
	divwu r3, r6, r5
	mullw r3, r3, r5
	subf r3, r3, r6
	lis r5, 0x804e
	ori r5, r5, 0x250
	stw r3, 0x0(r5)
	li r3, 0x0
	stw r3, 0x0(r4)
loc_0x024:
	lis r5, 0x804e
	lwz r5, 0x250(r5)
	cmpwi r5, 0x0
	bne loc_0x029
	li r6, 0x0
loc_0x029:
	cmpwi r5, 0x1
	bne loc_0x02C
	li r6, 0x40
loc_0x02C:
	cmpwi r5, 0x2
	bne loc_0x02F
	li r6, 0x20
loc_0x02F:
	cmpwi r5, 0x3
	bne loc_0x032
	li r6, 0x10
loc_0x032:
	cmpwi r5, 0x4
	bne loc_0x035
	li r6, 0x800
loc_0x035:
	lis r4, 0x800b
	ori r4, r4, 0x9ea2
	sth r6, 0x0(r4)
	lis r4, 0x815e
	ori r4, r4, 0x8422
	sth r6, 0x0(r4)
loc_0x03B:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	mr r29, r5
}

##################################
[CM: Code Menu] Crowd Cheer Toggle
##################################
HOOK @ $8081AD54                # Address = $(ba + 0x0081AD54)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x804e
	lwz r31, 0xc08(r31)
	cmpwi r31, 0x0
	bne loc_0x014
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	li r3, 0x0
	blr
loc_0x014:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	stwu r1, -0x30(r1)
	nop
}

##############################
[CM: Code Menu] Staling Toggle
##############################
HOOK @ $808E00A4                # Address = $(ba + 0x008E00A4)
{
	lis r6, 0x804e
	lwz r6, 0x1cf8(r6)
	cmpwi r6, 0x1
	bne loc_0x005
	li r0, 0x8
loc_0x005:
	cmpwi r6, 0x2
	bne loc_0x008
	li r0, 0x0
loc_0x008:
	lis r6, 0x808e
	rlwinm. r0, r0, 29, 31, 31      # (Mask: 0x00000008)
	nop
}

##################################################
[CM: Control Codes] Save Rotation Queue For Replay
##################################################
HOOK @ $806D1770                # Address = $(ba + 0x006D1770)
{
	lis r3, 0x805b
	lwz r3, 0x50ac(r3)
	lwz r3, 0x10(r3)
	cmpwi r3, 0x0
	beq loc_0x007
	lwz r3, 0x8(r3)
	b loc_0x009
loc_0x007:
	lis r3, 0xffff
	ori r3, r3, 0xffff
loc_0x009:
	cmpwi r3, 0xa
	bne loc_0x010
	lis r3, 0x804e
	lwz r3, 0x13c(r3)
	lis r4, 0x804e
	lwz r4, 0x7d4(r4)
	stw r3, 0x454(r4)
loc_0x010:
	blr
}

###############################
[CM: Control Codes] Start Match
###############################
HOOK @ $806CF15C                # Address = $(ba + 0x006CF15C)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x805b
	lwz r31, 0x50ac(r31)
	lwz r31, 0x10(r31)
	cmpwi r31, 0x0
	beq loc_0x00E
	lwz r31, 0x8(r31)
	b loc_0x010
loc_0x00E:
	lis r31, 0xffff
	ori r31, r31, 0xffff
loc_0x010:
	cmpwi r31, 0x6
	bne loc_0x019
	lis r31, 0x804e
	lwz r31, 0x7d4(r31)
	lwz r31, 0x454(r31)
	lis r30, 0x804e
	ori r30, r30, 0x13c
	stw r31, 0x0(r30)
	b loc_0x051
loc_0x019:
	lis r31, 0x804e
	lwz r31, 0x904(r31)
	cmpwi r31, 0x1
	blt loc_0x04D
	lis r14, 0x9018
	ori r14, r14, 0xfbc
	li r15, 0x1
	cmpwi r15, 0x5
	bge loc_0x04C
loc_0x022:
	lbz r31, 0x0(r14)
	lis r30, 0x804e
	ori r30, r30, 0x13c
	li r29, 0x0
	lbz r28, 0x0(r30)
	cmpwi r29, 0x4
	bge loc_0x030
loc_0x029:
	cmpw r28, r15
	bne loc_0x02C
	b loc_0x032
loc_0x02C:
	lbzu r28, 0x1(r30)
	addi r29, r29, 0x1
	cmpwi r29, 0x4
	blt+ loc_0x029
loc_0x030:
	lis r29, 0xffff
	ori r29, r29, 0xffff
loc_0x032:
	cmpwi r31, 0x0
	beq loc_0x041
	cmpwi r29, 0x0
	bge loc_0x041
	lis r30, 0x804e
	ori r30, r30, 0x13c
	lbz r28, 0x0(r30)
	cmpwi r28, 0x0
	bne loc_0x03D
	stb r15, 0x0(r30)
	b loc_0x041
loc_0x03D:
	lwz r28, 0x1(r30)
	rlwinm r28, r28, 24, 8, 24      # (Mask: 0xffff8000)
	stw r28, 0x1(r30)
	stb r15, 0x1(r30)
loc_0x041:
	cmpwi r31, 0x0
	bne loc_0x048
	cmpwi r29, 0x0
	blt loc_0x048
	lwz r28, 0x0(r30)
	rlwinm r28, r28, 8, 0, 24       # (Mask: 0x80ffffff)
	stw r28, 0x0(r30)
loc_0x048:
	addi r14, r14, 0x5c
	addi r15, r15, 0x1
	cmpwi r15, 0x5
	blt+ loc_0x022
loc_0x04C:
	b loc_0x051
loc_0x04D:
	li r31, 0x0
	lis r30, 0x804e
	ori r30, r30, 0x13c
	stw r31, 0x0(r30)
loc_0x051:
	li r31, 0x48
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r31, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	lis r31, 0x804e
	ori r31, r31, 0x644
	stw r3, 0x0(r31)
	li r31, 0x0
	stw r31, 0x0(r3)
	stw r31, 0x4(r3)
	lis r30, 0x804e
	lwzu r31, 0x38(r30)
	cmpwi r31, 0x1
	bne loc_0x0C7
	li r31, 0x0
	stw r31, 0x0(r30)
	lis r31, 0x804e
	lwz r31, 0x980(r31)
	cmpwi r31, 0x0
	bne loc_0x0BB
	lis r30, 0x805a
	lwz r30, 0xe0(r30)
	lwz r30, 0x24(r30)
	addi r30, r30, 0x810
	lis r29, 0x804e
	ori r29, r29, 0x648
	li r28, 0x0
	lwz r24, 0x24(r30)
	lwz r23, 0x20(r30)
	lis r31, 0x8049
	lwz r31, 0x5d04(r31)
	li r4, 0x16
	li r3, 0x1
	cmpwi r4, 0x0
	ble loc_0x08F
loc_0x07B:
	subi r4, r4, 0x1
	lbzx r26, r31, r4
	cmpwi r26, 0x1f
	blt loc_0x083
	subi r25, r26, 0x17
	rlwnm r25, r3, r25, 0, 31       # (Mask: 0xffffffff)
	and r25, r25, r23
	b loc_0x085
loc_0x083:
	rlwnm r25, r3, r26, 0, 31       # (Mask: 0xffffffff)
	and r25, r25, r24
loc_0x085:
	cmpwi r25, 0x0
	beq loc_0x08D
	cmpwi r26, 0x14
	beq loc_0x08D
	cmpwi r26, 0xe
	beq loc_0x08D
	stbx r26, r29, r28
	addi r28, r28, 0x1
loc_0x08D:
	cmpwi r4, 0x0
	bgt+ loc_0x07B
loc_0x08F:
	lis r31, 0x8049
	lwz r31, 0x5d08(r31)
	li r4, 0x16
	li r3, 0x1
	cmpwi r4, 0x0
	ble loc_0x0A9
loc_0x095:
	subi r4, r4, 0x1
	lbzx r26, r31, r4
	cmpwi r26, 0x1f
	blt loc_0x09D
	subi r25, r26, 0x17
	rlwnm r25, r3, r25, 0, 31       # (Mask: 0xffffffff)
	and r25, r25, r23
	b loc_0x09F
loc_0x09D:
	rlwnm r25, r3, r26, 0, 31       # (Mask: 0xffffffff)
	and r25, r25, r24
loc_0x09F:
	cmpwi r25, 0x0
	beq loc_0x0A7
	cmpwi r26, 0x14
	beq loc_0x0A7
	cmpwi r26, 0xe
	beq loc_0x0A7
	stbx r26, r29, r28
	addi r28, r28, 0x1
loc_0x0A7:
	cmpwi r4, 0x0
	bgt+ loc_0x095
loc_0x0A9:
	cmpwi r28, 0x0
	bne loc_0x0AD
	stw r28, 0x0(r29)
	li r28, 0x1
loc_0x0AD:
	mr r3, r28
	lis r0, 0x8003
	ori r0, r0, 0xfc7c
	mtctr r0
	bctrl
	lis r30, 0x805a
	lwz r30, 0xe0(r30)
	lbzx r3, r29, r3
	lwz r30, 0x8(r30)
	lis r0, 0x800a
	ori r0, r0, 0xf614
	mtctr r0
	bctrl
	sth r3, 0x1a(r30)
loc_0x0BB:
	lis r30, 0x805a
	lwz r30, 0xe0(r30)
	lbzx r3, r29, r3
	lwz r30, 0x8(r30)
	lhz r3, 0x1a(r30)
	addi r4, r30, 0x1c
	addi r5, r30, 0x5c
	li r6, 0x0
	lis r0, 0x8010
	ori r0, r0, 0xf960
	mtctr r0
	bctrl
loc_0x0C7:
	li r31, 0x1
	lis r30, 0x804e
	ori r30, r30, 0x758
	stw r31, 0x0(r30)
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	lis r29, 0x8070
}

#########################################################
[CM: Control Codes] Order Rotation Queue By Match Placing
#########################################################
HOOK @ $806D4C14                # Address = $(ba + 0x006D4C14)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stwu r1, -0x8c(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x805b
	lwz r31, 0x50ac(r31)
	lwz r31, 0x10(r31)
	cmpwi r31, 0x0
	beq loc_0x00F
	lwz r31, 0x8(r31)
	b loc_0x011
loc_0x00F:
	lis r31, 0xffff
	ori r31, r31, 0xffff
loc_0x011:
	cmpwi r31, 0xa
	bne loc_0x0A4
	lis r31, 0x804e
	lwz r31, 0x904(r31)
	cmpwi r31, 0x4
	bne loc_0x02F
	li r30, 0x0
	lis r14, 0x804e
	ori r14, r14, 0x13c
	li r31, 0x0
	lbz r29, 0x0(r14)
	cmpwi r31, 0x4
	bge loc_0x025
loc_0x01E:
	cmpw r29, r30
	bne loc_0x021
	b loc_0x027
loc_0x021:
	lbzu r29, 0x1(r14)
	addi r31, r31, 0x1
	cmpwi r31, 0x4
	blt+ loc_0x01E
loc_0x025:
	lis r31, 0xffff
	ori r31, r31, 0xffff
loc_0x027:
	lis r31, 0x804e
	ori r31, r31, 0x13c
	lbz r29, 0x0(r31)
	lwz r30, 0x0(r31)
	rlwinm r30, r30, 8, 0, 24       # (Mask: 0x80ffffff)
	stw r30, 0x0(r31)
	stb r29, -0x1(r14)
	b loc_0x0A4
loc_0x02F:
	cmpwi r31, 0x2
	blt loc_0x0A4
	lis r18, 0x804e
	ori r18, r18, 0x144
	li r15, 0x1
	cmpwi r15, 0x5
	bge loc_0x078
loc_0x036:
	lis r3, 0x8062
	ori r3, r3, 0x9a00
	subi r4, r15, 0x1
	lis r0, 0x8081
	ori r0, r0, 0x5c40
	mtctr r0
	bctrl
	cmpwi r3, -0x1
	ble loc_0x075
	mr r22, r3
	mr r4, r3
	lis r3, 0x8062
	ori r3, r3, 0x9a00
	lis r5, 0xffff
	ori r5, r5, 0xffff
	lis r0, 0x8081
	ori r0, r0, 0x4f20
	mtctr r0
	bctrl
	lwz r21, 0x60(r3)
	lwz r21, 0xd8(r21)
	lwz r3, 0x38(r21)
	li r4, 0x0
	lis r0, 0x8076
	ori r0, r0, 0x9cb8
	mtctr r0
	bctrl
	fctiwz f1, f1
	stfd f1, -0x30(r1)
	lwz r17, -0x2c(r1)
	lis r3, 0x8062
	ori r3, r3, 0x9a00
	mr r4, r22
	lis r0, 0x8081
	ori r0, r0, 0x59e4
	mtctr r0
	bctrl
	lis r0, 0x8081
	ori r0, r0, 0xc540
	mtctr r0
	bctrl
	neg r16, r3
	lis r31, 0x804e
	lwz r31, 0x904(r31)
	cmpwi r31, 0x2
	bne loc_0x06A
	stb r16, 0x0(r18)
	sth r17, 0x1(r18)
	stb r15, 0x3(r18)
	addi r18, r18, 0x4
	addi r19, r19, 0x1
	b loc_0x075
loc_0x06A:
	cmpwi r31, 0x3
	bne loc_0x075
	subi r16, r16, 0x7f
	neg r16, r16
	subi r17, r17, 0x7d0
	neg r17, r17
	stb r16, 0x0(r18)
	sth r17, 0x1(r18)
	stb r15, 0x3(r18)
	addi r18, r18, 0x4
	addi r19, r19, 0x1
loc_0x075:
	addi r15, r15, 0x1
	cmpwi r15, 0x5
	blt+ loc_0x036
loc_0x078:
	lis r3, 0x804e
	ori r3, r3, 0x144
	mr r4, r19
	li r5, 0x4
	lis r6, 0x804e
	ori r6, r6, 0x154
	lis r0, 0x803f
	ori r0, r0, 0x8acc
	mtctr r0
	bctrl
	lis r14, 0x804e
	ori r14, r14, 0x13b
	lis r18, 0x804e
	ori r18, r18, 0x143
	cmpwi r19, 0x0
	ble loc_0x08D
loc_0x088:
	lbzu r31, 0x4(r18)
	stbu r31, 0x1(r14)
	subi r19, r19, 0x1
	cmpwi r19, 0x0
	bgt+ loc_0x088
loc_0x08D:
	li r30, 0x0
	lis r14, 0x804e
	ori r14, r14, 0x13c
	li r31, 0x0
	lbz r29, 0x0(r14)
	cmpwi r31, 0x4
	bge loc_0x09B
loc_0x094:
	cmpw r29, r30
	bne loc_0x097
	b loc_0x09D
loc_0x097:
	lbzu r29, 0x1(r14)
	addi r31, r31, 0x1
	cmpwi r31, 0x4
	blt+ loc_0x094
loc_0x09B:
	lis r31, 0xffff
	ori r31, r31, 0xffff
loc_0x09D:
	lis r31, 0x804e
	ori r31, r31, 0x13c
	lbz r29, 0x1(r31)
	lwz r30, 0x1(r31)
	rlwinm r30, r30, 8, 0, 24       # (Mask: 0x80ffffff)
	stw r30, 0x1(r31)
	stb r29, -0x1(r14)
loc_0x0A4:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x8c
	lfd f0, -0x10(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	li r18, 0x0
}

#############################
[CM: Control Codes] End Match
#############################
HOOK @ $806D4850                # Address = $(ba + 0x006D4850)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	li r31, 0x0
	lis r30, 0x804e
	ori r30, r30, 0x758
	stw r31, 0x0(r30)
	lis r26, 0x804e
	ori r26, r26, 0x254
	li r23, 0x1
	stw r23, 0x0(r26)
	li r26, 0x0
	lis r23, 0x804e
	ori r23, r23, 0x240
	lwz r24, 0x0(r23)
	cmpwi r24, 0x0
	beq loc_0x019
	lbz r25, 0x0(r24)
	andi. r25, r25, 0xfff7
	stb r25, 0x0(r24)
	stw r26, 0x0(r23)
loc_0x019:
	lwz r24, 0x4(r23)
	cmpwi r24, 0x0
	beq loc_0x020
	lbz r25, 0x0(r24)
	andi. r25, r25, 0xfff7
	stb r25, 0x0(r24)
	stw r26, 0x4(r23)
loc_0x020:
	lwz r24, 0x8(r23)
	cmpwi r24, 0x0
	beq loc_0x027
	lbz r25, 0x0(r24)
	andi. r25, r25, 0xfff7
	stb r25, 0x0(r24)
	stw r26, 0x8(r23)
loc_0x027:
	lwz r24, 0xc(r23)
	cmpwi r24, 0x0
	beq loc_0x02E
	lbz r25, 0x0(r24)
	andi. r25, r25, 0xfff7
	stb r25, 0x0(r24)
	stw r26, 0xc(r23)
loc_0x02E:
	lis r14, 0x805b
	lwz r14, 0x50ac(r14)
	lwz r14, 0x10(r14)
	cmpwi r14, 0x0
	beq loc_0x035
	lwz r14, 0x8(r14)
	b loc_0x037
loc_0x035:
	lis r14, 0xffff
	ori r14, r14, 0xffff
loc_0x037:
	cmpwi r14, 0xa
	bne loc_0x094
	mr r16, r14
	lis r29, 0x8058
	lwzu r28, 0x4084(r29)
	lis r31, 0x804e
	lwz r31, 0xa2c(r31)
	cmpwi r31, 0x1
	bne loc_0x042
	li r28, 0x0
	li r16, 0xd
loc_0x042:
	lis r31, 0x804e
	lwz r31, 0x904(r31)
	cmpwi r31, 0x0
	ble loc_0x054
	lwz r31, 0x24(r3)
	lwz r31, 0x8c(r31)
	cmpwi r31, 0x13
	bne loc_0x04B
	b loc_0x054
loc_0x04B:
	cmpwi r31, 0x19
	bne loc_0x04E
	b loc_0x054
loc_0x04E:
	lwz r28, 0x0(r29)
	li r31, 0x1
	lis r30, 0x804e
	ori r30, r30, 0x38
	stw r31, 0x0(r30)
	li r16, 0x1
loc_0x054:
	lis r30, 0x805b
	ori r30, r30, 0xacc4
	lis r26, 0x804e
	lhz r26, 0xa(r26)
	lis r25, 0x804e
	lhz r25, 0xe(r25)
	li r23, 0x0
	li r31, 0x0
	cmpwi r31, 0x8
	bge loc_0x06A
loc_0x05E:
	lwzu r27, 0x40(r30)
	and r24, r27, r26
	cmpw r24, r26
	bne loc_0x063
	li r23, 0x10
loc_0x063:
	and r24, r27, r25
	cmpw r24, r25
	bne loc_0x067
	li r23, 0x20
loc_0x067:
	addi r31, r31, 0x1
	cmpwi r31, 0x8
	blt+ loc_0x05E
loc_0x06A:
	lis r27, 0x804e
	ori r27, r27, 0x38
	li r26, 0x0
	lis r31, 0x804e
	lbz r31, 0xc(r31)
	rlwinm r31, r31, 1, 0, 31       # (Mask: 0xffffffff)
	xor r31, r31, r23
	cmpwi r31, 0x20
	bne loc_0x076
	li r16, 0xd
	li r28, 0x0
	stw r26, 0x0(r27)
loc_0x076:
	lis r31, 0x804e
	lbz r31, 0x8(r31)
	xor r31, r31, r23
	cmpwi r31, 0x10
	bne loc_0x07E
	li r16, 0x1
	lwz r28, 0x0(r29)
	stw r26, 0x0(r27)
loc_0x07E:
	lis r31, 0x805b
	lwz r31, 0x50ac(r31)
	lwz r31, 0x10(r31)
	stw r16, 0x8(r31)
	cmpw r14, r16
	beq loc_0x093
	li r30, 0x0
	lis r27, 0x8058
	ori r27, r27, 0x8003
	lis r26, 0x8058
	ori r26, r26, 0x8300
	li r31, 0x0
	cmpwi r31, 0x4
	bge loc_0x093
loc_0x08C:
	stw r30, 0x99(r27)
	stw r30, 0x68(r26)
	addi r27, r27, 0xa0
	addi r26, r26, 0x70
	addi r31, r31, 0x1
	cmpwi r31, 0x4
	blt+ loc_0x08C
loc_0x093:
	stw r28, 0x0(r29)
loc_0x094:
	lis r15, 0x804e
	lwz r15, 0x644(r15)
	addi r3, r15, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	cmpwi r14, 0xa
	bne loc_0x164
	li r29, 0x0
	lis r30, 0x804e
	lwzu r31, 0x3c(r30)
	stw r29, 0x0(r30)
	cmpwi r31, 0x2
	bne loc_0x164
	lis r31, 0x804e
	ori r31, r31, 0x164
	lis r30, 0x804e
	ori r30, r30, 0x178
	lis r27, 0x804e
	ori r27, r27, 0x180
	li r3, 0x0
	stw r3, 0x0(r30)
	stw r3, 0x4(r30)
	lis r4, 0x4e03
	ori r4, r4, 0x41de
	stw r4, 0x0(r27)
	lis r4, 0xe6bb
	ori r4, r4, 0xaa41
	stw r4, 0x4(r27)
	lis r4, 0x6419
	ori r4, r4, 0xb3ea
	stw r4, 0x8(r27)
	lis r4, 0xe8f5
	ori r4, r4, 0x3bd9
	stw r4, 0xc(r27)
	li r3, 0x2a
	li r4, 0x1
	stw r3, 0x18(r27)
	stw r4, 0x1c(r27)
	lis r0, 0x801e
	ori r0, r0, 0x1b34
	mtctr r0
	bctrl
	mr r29, r3
	mr r28, r4
	lis r3, 0x804e
	ori r3, r3, 0x164
	li r4, 0x2a
	lis r0, 0x8015
	ori r0, r0, 0x2b5c
	mtctr r0
	bctrl
	lis r4, 0x804e
	lwz r4, 0x7d4(r4)
	addi r4, r4, 0x100
	lis r0, 0x8015
	ori r0, r0, 0x2c4c
	mtctr r0
	bctrl
	addi r3, r30, 0x0
	addi r4, r31, 0x0
	addi r5, r29, 0x0
	addi r6, r28, 0x0
	li r7, 0x2a
	li r8, 0x0
	li r9, 0x0
	lis r0, 0x8015
	ori r0, r0, 0x3610
	mtctr r0
	bctrl
	lwz r3, 0x0(r30)
	stw r3, 0x10(r27)
	lwz r3, 0x1c(r3)
	addi r3, r3, 0x20
	stw r3, 0x14(r27)
	subi r3, r27, 0x340
	lis r0, 0x8003
	ori r0, r0, 0xd1cc
	mtctr r0
	bctrl
	lis r26, 0x804e
	ori r26, r26, 0x6e8
	lis r25, 0x804e
	ori r25, r25, 0x648
	addi r3, r29, 0x0
	addi r4, r28, 0x0
	addi r5, r25, 0x0
	lis r0, 0x801e
	ori r0, r0, 0x1d80
	mtctr r0
	bctrl
	lwz r19, 0x0(r25)
	lwz r24, 0x4(r25)
	lwz r23, 0x8(r25)
	lwz r22, 0xc(r25)
	lwz r21, 0x10(r25)
	lwz r20, 0x14(r25)
	addi r21, r21, 0x1
	li r3, 0x64
	mr r4, r20
	divwu r20, r4, r3
	mullw r20, r20, r3
	subf r20, r20, r4
	lis r4, 0x2f50
	ori r4, r4, 0x726f
	stw r4, 0x0(r26)
	lis r4, 0x6a65
	ori r4, r4, 0x6374
	stw r4, 0x4(r26)
	lis r4, 0x2b2f
	ori r4, r4, 0x7270
	stw r4, 0x8(r26)
	lis r4, 0x2f72
	ori r4, r4, 0x705f
	stw r4, 0xc(r26)
	lis r4, 0x2530
	ori r4, r4, 0x3264
	stw r4, 0x10(r26)
	lis r4, 0x2530
	ori r4, r4, 0x3264
	stw r4, 0x14(r26)
	lis r4, 0x2530
	ori r4, r4, 0x3264
	stw r4, 0x18(r26)
	lis r4, 0x5f25
	ori r4, r4, 0x3032
	stw r4, 0x1c(r26)
	lis r4, 0x6425
	ori r4, r4, 0x3032
	stw r4, 0x20(r26)
	lis r4, 0x645f
	ori r4, r4, 0x2530
	stw r4, 0x24(r26)
	lis r4, 0x3264
	ori r4, r4, 0x2e62
	stw r4, 0x28(r26)
	lis r4, 0x696e
	stw r4, 0x2c(r26)
	lis r3, 0x804e
	ori r3, r3, 0x648
	addi r4, r26, 0x0
	addi r5, r20, 0x0
	addi r6, r21, 0x0
	addi r7, r22, 0x0
	addi r8, r23, 0x0
	addi r9, r24, 0x0
	addi r10, r19, 0x0
	crxor 6, 6, 6
	lis r0, 0x803f
	ori r0, r0, 0x89fc
	mtctr r0
	bctrl
	lis r26, 0x804e
	ori r26, r26, 0x648
	lwz r25, 0x2c(r27)
	lwz r24, 0x28(r27)
	li r23, 0x2000
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r23, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	mr r23, r1
	addi r1, r3, 0x1f00
	mr r22, r3
	li r4, 0x0
	lis r3, 0x804e
	ori r3, r3, 0x75c
	stw r26, 0x0(r3)
	stw r4, 0x4(r3)
	stw r25, 0x8(r3)
	stw r24, 0xc(r3)
	stw r4, 0x10(r3)
	stw r4, 0x14(r3)
	lis r0, 0x8001
	ori r0, r0, 0xd740
	mtctr r0
	bctrl
	mr r1, r23
	addi r3, r22, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	mr r3, r31
	li r4, 0x0
	lis r0, 0x8015
	ori r0, r0, 0x2bdc
	mtctr r0
	bctrl
	lwz r25, 0x28(r27)
	addi r3, r25, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	lwz r25, 0x0(r30)
	addi r3, r25, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
loc_0x164:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	mr r31, r3
	nop
}

########################
[CM: Control Codes] Draw
########################
HOOK @ $8000E588                # Address = $(ba + 0x0000E588)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stfd f3, -0x28(r1)
	stfd f4, -0x30(r1)
	stfd f5, -0x38(r1)
	stfd f6, -0x40(r1)
	stfd f7, -0x48(r1)
	stfd f8, -0x50(r1)
	stfd f9, -0x58(r1)
	stfd f10, -0x60(r1)
	stfd f11, -0x68(r1)
	stfd f12, -0x70(r1)
	stfd f13, -0x78(r1)
	stfd f14, -0x80(r1)
	stfd f15, -0x88(r1)
	stfd f16, -0x90(r1)
	stfd f17, -0x98(r1)
	stfd f18, -0xa0(r1)
	stfd f19, -0xa8(r1)
	stfd f20, -0xb0(r1)
	stwu r1, -0x12c(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x804e
	lwz r31, 0x758(r31)
	cmpwi r31, 0x1
	bne loc_0x0D3
	lis r31, 0x804e
	lwz r31, 0xea8(r31)
	cmpwi r31, 0x1
	bne loc_0x0D3
	li r31, 0x14
	lis r0, 0x8001
	ori r0, r0, 0x9fa4
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0x8de4
	mtctr r0
	bctrl
	lis r0, 0x8001
	ori r0, r0, 0xa5c0
	mtctr r0
	bctrl
	li r3, 0x1
	li r4, 0x3
	li r5, 0x0
	lis r0, 0x801f
	ori r0, r0, 0x4774
	mtctr r0
	bctrl
	li r3, 0x7
	li r4, 0x0
	li r5, 0x1
	li r6, 0x7
	li r7, 0x0
	lis r0, 0x801f
	ori r0, r0, 0x3fd8
	mtctr r0
	bctrl
	li r4, 0x0
	addi r3, r31, 0x0
	lis r0, 0x801f
	ori r0, r0, 0x12ac
	mtctr r0
	bctrl
	lis r30, 0x805c
	lwz r30, -0x75f8(r30)
	lis r20, 0x804e
	lwz r20, 0x644(r20)
	lwzu r21, 0x4(r20)
	cmpwi r21, 0x0
	beq loc_0x0D3
loc_0x04E:
	lwz r31, 0x8(r21)
	lwz r31, 0x0(r31)
	or r31, r31, r30
	cmpwi r31, 0x0
	ble loc_0x0D0
	lwz r24, 0x64(r21)
	cmpwi r30, 0x0
	beq loc_0x08E
	lwz r31, 0x8(r24)
	lis r3, 0x66
	ori r3, r3, 0xffff
	stw r3, 0x8(r31)
	li r3, 0x0
	stw r3, 0xc(r31)
	stw r3, 0x14(r31)
	addi r3, r31, 0x14
	stw r3, 0x0(r31)
	lwz r31, 0x34(r21)
	lwz r29, 0x38(r21)
	lis r0, 0x8004
	ori r0, r0, 0xa750
	mtctr r0
	bctrl
	lbz r31, 0x7(r31)
	mulli r29, r29, 0x4
	mulli r31, r31, 0x40
	lis r27, 0x805b
	ori r27, r27, 0xacf0
	addi r29, r29, 0xa
	lhzx r31, r27, r31
	sthx r31, r3, r29
	lwz r31, 0x18(r21)
	mr r3, r31
	lis r0, 0x8004
	ori r0, r0, 0x8250
	mtctr r0
	bctrl
	lfs f12, 0x10(r31)
	lfs f13, 0x14(r31)
	lwz r25, 0x14(r21)
	lfs f14, 0x8(r25)
	lfs f15, 0xc(r25)
	stfs f12, 0x8(r25)
	stfs f13, 0xc(r25)
	lwz r31, 0x10(r21)
	lwz r26, 0x1c(r21)
	lwz r29, 0x8(r31)
	stw r26, 0x8(r31)
	lwz r26, 0x20(r21)
	lwz r27, 0xc(r31)
	stw r26, 0xc(r31)
	lis r3, 0x80b8
	ori r3, r3, 0x97bc
	lwz r4, -0x4(r20)
	li r18, 0xc0de
	andi. r18, r18, 0xffff
	lis r0, 0x8087
	ori r0, r0, 0x78d8
	mtctr r0
	bctrl
	stw r29, 0x8(r31)
	stw r27, 0xc(r31)
	stfs f14, 0x8(r25)
	stfs f15, 0xc(r25)
loc_0x08E:
	lwzu r22, 0x0(r24)
	li r23, 0x0
	cmpwi r23, 0x4
	bge loc_0x0B2
loc_0x092:
	lwz r5, 0x14(r22)
	cmpwi r5, 0x1
	bne loc_0x0AE
	lwz r5, 0xc(r22)
	cmpwi r5, 0x2
	blt loc_0x0AE
	lwz r3, 0x4(r22)
	li r4, 0x1
	lis r0, 0x801f
	ori r0, r0, 0x1088
	mtctr r0
	bctrl
	lwz r3, 0xc(r22)
	lwz r4, 0x8(r22)
	lis r5, 0xcc01
	li r6, 0x0
	addi r8, r22, 0x14
	cmpwi r3, 0x0
	ble loc_0x0AE
loc_0x0A5:
	lwzu r7, 0x4(r8)
	stw r7, -0x8000(r5)
	lwzu r7, 0x4(r8)
	stw r7, -0x8000(r5)
	stw r6, -0x8000(r5)
	stw r4, -0x8000(r5)
	subi r3, r3, 0x1
	cmpwi r3, 0x0
	bgt+ loc_0x0A5
loc_0x0AE:
	lwzu r22, 0x4(r24)
	addi r23, r23, 0x1
	cmpwi r23, 0x4
	blt+ loc_0x092
loc_0x0B2:
	cmpwi r30, 0x0
	beq loc_0x0D0
	lwz r5, 0x14(r22)
	cmpwi r5, 0x1
	bne loc_0x0D0
	lwz r5, 0xc(r22)
	cmpwi r5, 0x2
	blt loc_0x0D0
	lwz r3, 0x4(r22)
	li r4, 0x1
	lis r0, 0x801f
	ori r0, r0, 0x1088
	mtctr r0
	bctrl
	lwz r3, 0xc(r22)
	lwz r4, 0x8(r22)
	lis r5, 0xcc01
	li r6, 0x0
	addi r8, r22, 0x14
	cmpwi r3, 0x0
	ble loc_0x0D0
loc_0x0C7:
	lwzu r7, 0x4(r8)
	stw r7, -0x8000(r5)
	lwzu r7, 0x4(r8)
	stw r7, -0x8000(r5)
	stw r6, -0x8000(r5)
	stw r4, -0x8000(r5)
	subi r3, r3, 0x1
	cmpwi r3, 0x0
	bgt+ loc_0x0C7
loc_0x0D0:
	lwzu r21, 0x8(r20)
	cmpwi r21, 0x0
	bne+ loc_0x04E
loc_0x0D3:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x12c
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lfd f3, -0x28(r1)
	lfd f4, -0x30(r1)
	lfd f5, -0x38(r1)
	lfd f6, -0x40(r1)
	lfd f7, -0x48(r1)
	lfd f8, -0x50(r1)
	lfd f9, -0x58(r1)
	lfd f10, -0x60(r1)
	lfd f11, -0x68(r1)
	lfd f12, -0x70(r1)
	lfd f13, -0x78(r1)
	lfd f14, -0x80(r1)
	lfd f15, -0x88(r1)
	lfd f16, -0x90(r1)
	lfd f17, -0x98(r1)
	lfd f18, -0xa0(r1)
	lfd f19, -0xa8(r1)
	lfd f20, -0xb0(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	addi r1, r1, 0x30
	nop
}

##################################
[CM: Control Codes] Load Code Menu
##################################
HOOK @ $8002D4F4                # Address = $(ba + 0x0002D4F4)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x804e
	ori r31, r31, 0x648
	lis r30, 0x804e
	ori r30, r30, 0x660
	stw r30, 0x0(r31)
	li r30, 0x0
	stw r30, 0x4(r31)
	stw r30, 0x8(r31)
	stw r30, 0x10(r31)
	lis r30, 0x804e
	stw r30, 0xc(r31)
	lis r30, 0xffff
	ori r30, r30, 0xffff
	stw r30, 0x14(r31)
	addi r30, r31, 0x18
	lis r4, 0x5072
	ori r4, r4, 0x6f6a
	stw r4, 0x0(r30)
	lis r4, 0x6563
	ori r4, r4, 0x742b
	stw r4, 0x4(r30)
	lis r4, 0x2f70
	ori r4, r4, 0x662f
	stw r4, 0x8(r30)
	lis r4, 0x6d65
	ori r4, r4, 0x6e75
	stw r4, 0xc(r30)
	lis r4, 0x332f
	ori r4, r4, 0x6461
	stw r4, 0x10(r30)
	lis r4, 0x7461
	ori r4, r4, 0x2e63
	stw r4, 0x14(r30)
	lis r4, 0x6d6e
	ori r4, r4, 0x7500
	stw r4, 0x18(r30)
	mr r3, r31
	lis r0, 0x8001
	ori r0, r0, 0xcbf4
	mtctr r0
	bctrl
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	stwu r1, -0x20(r1)
	nop
}

#####################################################################################
[CM: Control Codes] Update Heap Address Cache
# Updates the Code Menu's Heap Address Cache whenever a memory layout change happens.
#####################################################################################
HOOK @ $806BE080                # Address = $(ba + 0x006BE080)
{
	lis r11, 0x8002
	ori r11, r11, 0x49cc
	mtctr r11
	lis r11, 0x804e
	ori r11, r11, 0x7d4
	li r12, 0x4
	addi r10, r11, 0x5
loc_0x007:
	addic. r12, r12, -0x4
	lbzu r3, -0x1(r10)
	bctrl
	stwx r3, r11, r12
	bne loc_0x007
	lis r0, 0x8006
	ori r0, r0, 0xcaa8
	mtctr r0
	bctrl
	nop
}

############################################
[CM: Control Codes] Add New Character Buffer
############################################
HOOK @ $8081F4B4                # Address = $(ba + 0x0081F4B4)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stfd f3, -0x28(r1)
	stfd f4, -0x30(r1)
	stfd f5, -0x38(r1)
	stfd f6, -0x40(r1)
	stfd f7, -0x48(r1)
	stfd f8, -0x50(r1)
	stfd f9, -0x58(r1)
	stfd f10, -0x60(r1)
	stfd f11, -0x68(r1)
	stfd f12, -0x70(r1)
	stfd f13, -0x78(r1)
	stwu r1, -0xf4(r1)
	stmw r3, 0x8(r1)
	lis r28, 0x804e
	lwz r28, 0x758(r28)
	mr r22, r31
	cmpwi r28, 0x1
	bne loc_0x138
	lbz r30, 0xa(r22)
	addi r29, r22, 0x34
	rlwinm r30, r30, 3, 0, 31       # (Mask: 0xffffffff)
	lwzx r3, r29, r30
	li r14, 0x10
loc_0x01F:
	lwz r31, 0x60(r3)
	lis r30, 0x804e
	lwz r30, 0x644(r30)
	lwz r23, 0x0(r30)
	cmpwi r23, 0x0
	beq loc_0x02B
loc_0x025:
	cmpw r23, r31
	bne loc_0x028
	b loc_0x138
loc_0x028:
	lwzu r23, 0x8(r30)
	cmpwi r23, 0x0
	bne+ loc_0x025
loc_0x02B:
	mr r24, r3
	lwz r25, 0xd8(r31)
	li r30, 0x0
	lis r29, 0x804e
	lwz r29, 0x644(r29)
	lwz r3, 0x0(r29)
	cmpw r3, r30
	beq loc_0x036
loc_0x033:
	lwzu r3, 0x8(r29)
	cmpw r3, r30
	bne+ loc_0x033
loc_0x036:
	stw r31, 0x0(r29)
	stw r30, 0x8(r29)
	stw r30, 0xc(r29)
	li r30, 0x88
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r30, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x4(r29)
	mr r23, r3
	mr r3, r24
	lis r0, 0x8083
	ori r0, r0, 0xae38
	mtctr r0
	bctrl
	stw r3, 0x18(r23)
	lis r3, 0x8062
	ori r3, r3, 0x9a00
	lis r0, 0x8081
	ori r0, r0, 0x5ad0
	mtctr r0
	bctrl
	stw r3, 0x38(r23)
	stw r24, 0x3c(r23)
	mulli r29, r3, 0x5c
	lis r30, 0x9018
	ori r30, r30, 0xfb8
	add r30, r30, r29
	stw r30, 0x34(r23)
	cmpwi r3, 0x3
	bgt loc_0x073
	cmpwi r3, 0x0
	blt loc_0x073
	rlwinm r4, r3, 2, 0, 31         # (Mask: 0xffffffff)
	lis r29, 0x804e
	ori r29, r29, 0xec
	lwzx r29, r29, r4
	lbz r30, 0x0(r30)
	lwz r3, 0x18(r29)
	addi r26, r3, 0x1f
	li r28, 0x0
	lbz r27, 0x0(r26)
	cmpwi r28, 0x2d
	bge loc_0x06F
loc_0x068:
	cmpw r27, r30
	bne loc_0x06B
	b loc_0x071
loc_0x06B:
	lbzu r27, 0x4(r26)
	addi r28, r28, 0x1
	cmpwi r28, 0x2d
	blt+ loc_0x068
loc_0x06F:
	lis r28, 0xffff
	ori r28, r28, 0xffff
loc_0x071:
	stw r28, 0x8(r29)
	stw r28, 0x10(r29)
loc_0x073:
	mr r3, r31
	li r4, 0xbcf
	li r5, 0x0
	lis r0, 0x8079
	ori r0, r0, 0x6c6c
	mtctr r0
	bctrl
	fneg f1, f1
	stfs f1, 0x2c(r23)
	mr r3, r31
	li r4, 0xbd0
	li r5, 0x0
	lis r0, 0x8079
	ori r0, r0, 0x6c6c
	mtctr r0
	bctrl
	fneg f1, f1
	stfs f1, 0x30(r23)
	lwz r29, 0x64(r25)
	lwz r29, 0x20(r29)
	lwz r29, 0xc(r29)
	stw r29, 0x0(r23)
	lwzu r28, 0xe0(r29)
	stw r28, 0x4(r23)
	stw r29, 0x8(r23)
	lwz r29, 0xc(r25)
	stw r29, 0xc(r23)
	lwz r28, 0x7c(r25)
	lwz r29, 0x7c(r28)
	stw r29, 0x10(r23)
	lwz r29, 0x5c(r25)
	lwz r29, 0x14c(r29)
	stw r29, 0x14(r23)
	li r29, 0x24
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r29, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x64(r23)
	mr r29, r3
	addi r28, r29, 0x4
	li r27, 0x30
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r27, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x0(r28)
	li r4, 0x0
	li r5, 0xb0
	lis r6, 0x33cc
	ori r6, r6, 0x33ff
	stw r5, 0x4(r3)
	subi r5, r27, 0x8
	stw r5, 0x10(r3)
	stw r6, 0x8(r3)
	stw r4, 0xc(r3)
	stw r4, 0x14(r3)
	addi r4, r3, 0x14
	stw r4, 0x0(r3)
	lis r27, 0x805b
	lwz r27, 0x50ac(r27)
	lwz r27, 0x10(r27)
	lwz r27, 0x0(r27)
	lis r28, 0x8070
	ori r28, r28, 0x2b60
	cmpw r27, r28
	bne loc_0x0C4
	li r27, 0x298
	b loc_0x0C5
loc_0x0C4:
	li r27, 0x1018
loc_0x0C5:
	addi r28, r29, 0x0
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r27, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x0(r28)
	li r4, 0x0
	li r5, 0xb0
	lis r6, 0xff99
	ori r6, r6, 0xff
	stw r5, 0x4(r3)
	subi r5, r27, 0x8
	stw r5, 0x10(r3)
	stw r6, 0x8(r3)
	stw r4, 0xc(r3)
	stw r4, 0x14(r3)
	addi r4, r3, 0x14
	stw r4, 0x0(r3)
	lis r27, 0x805b
	lwz r27, 0x50ac(r27)
	lwz r27, 0x10(r27)
	lwz r27, 0x0(r27)
	lis r28, 0x8070
	ori r28, r28, 0x2b60
	cmpw r27, r28
	bne loc_0x0E7
	li r27, 0x298
	b loc_0x0E8
loc_0x0E7:
	li r27, 0x1018
loc_0x0E8:
	addi r28, r29, 0x8
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r27, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x0(r28)
	li r4, 0x0
	li r5, 0xb0
	lis r6, 0x66
	ori r6, r6, 0xffff
	stw r5, 0x4(r3)
	subi r5, r27, 0x8
	stw r5, 0x10(r3)
	stw r6, 0x8(r3)
	stw r4, 0xc(r3)
	stw r4, 0x14(r3)
	addi r4, r3, 0x14
	stw r4, 0x0(r3)
	addi r28, r29, 0xc
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r27, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x0(r28)
	li r4, 0x0
	li r5, 0xb0
	lis r6, 0xffff
	ori r6, r6, 0xff
	stw r5, 0x4(r3)
	subi r5, r27, 0x8
	stw r5, 0x10(r3)
	stw r6, 0x8(r3)
	stw r4, 0xc(r3)
	stw r4, 0x14(r3)
	addi r4, r3, 0x14
	stw r4, 0x0(r3)
	addi r28, r29, 0x10
	li r3, 0x2a
	lis r0, 0x8002
	ori r0, r0, 0x4430
	mtctr r0
	bctrl
	addi r4, r27, 0x0
	lis r0, 0x8020
	ori r0, r0, 0x4e5c
	mtctr r0
	bctrl
	stw r3, 0x0(r28)
	li r4, 0x0
	li r5, 0xb0
	lis r6, 0x6e00
	ori r6, r6, 0x94ff
	stw r5, 0x4(r3)
	subi r5, r27, 0x8
	stw r5, 0x10(r3)
	stw r6, 0x8(r3)
	stw r4, 0xc(r3)
	stw r4, 0x14(r3)
	addi r4, r3, 0x14
	stw r4, 0x0(r3)
	li r28, 0x0
	stw r28, 0x14(r29)
	lwz r30, 0x5c(r22)
	cmpw r30, r14
	bne loc_0x138
	lwz r3, 0x3c(r22)
	li r14, 0x0
	b loc_0x01F
loc_0x138:
	lmw r3, 0x8(r1)
	addi r1, r1, 0xf4
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lfd f3, -0x28(r1)
	lfd f4, -0x30(r1)
	lfd f5, -0x38(r1)
	lfd f6, -0x40(r1)
	lfd f7, -0x48(r1)
	lfd f8, -0x50(r1)
	lfd f9, -0x58(r1)
	lfd f10, -0x60(r1)
	lfd f11, -0x68(r1)
	lfd f12, -0x70(r1)
	lfd f13, -0x78(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	lfd f31, 0x58(r1)
	nop
}

###########################################
[CM: Control Codes] Delete Character Buffer
###########################################
HOOK @ $8082F3F4                # Address = $(ba + 0x0082F3F4)
{
	lis r31, 0x804e
	lwz r31, 0x758(r31)
	cmpwi r31, 0x1
	bne loc_0x03E
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lwz r4, 0x60(r4)
	lis r28, 0x804e
	lwz r28, 0x644(r28)
	lwz r31, 0x0(r28)
	cmpw r31, r4
	beq loc_0x017
loc_0x011:
	lwzu r31, 0x8(r28)
	cmpwi r31, 0x0
	bne loc_0x015
	b loc_0x037
loc_0x015:
	cmpw r31, r4
	bne+ loc_0x011
loc_0x017:
	lwz r31, 0x4(r28)
	lwz r30, 0x64(r31)
	subi r29, r30, 0x4
	lwzu r3, 0x4(r29)
	cmpwi r3, 0x0
	beq loc_0x024
loc_0x01D:
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	lwzu r3, 0x4(r29)
	cmpwi r3, 0x0
	bne+ loc_0x01D
loc_0x024:
	addi r3, r30, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	addi r3, r31, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	li r30, 0x1
	cmpwi r30, 0x0
	beq loc_0x037
loc_0x031:
	lwzu r30, 0x8(r28)
	lwz r29, 0x4(r28)
	stw r30, -0x8(r28)
	stw r29, -0x4(r28)
	cmpwi r30, 0x0
	bne+ loc_0x031
loc_0x037:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
loc_0x03E:
	li r31, 0x0
}

########################################################
[CM: Control Codes] Delete Character Buffer on Transform
########################################################
HOOK @ $808205BC                # Address = $(ba + 0x008205BC)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stfd f0, -0x10(r1)
	stfd f1, -0x18(r1)
	stfd f2, -0x20(r1)
	stfd f3, -0x28(r1)
	stfd f4, -0x30(r1)
	stfd f5, -0x38(r1)
	stfd f6, -0x40(r1)
	stfd f7, -0x48(r1)
	stfd f8, -0x50(r1)
	stfd f9, -0x58(r1)
	stfd f10, -0x60(r1)
	stfd f11, -0x68(r1)
	stfd f12, -0x70(r1)
	stfd f13, -0x78(r1)
	stwu r1, -0xf4(r1)
	stmw r3, 0x8(r1)
	mr r22, r4
	lbz r28, 0xa(r3)
	addi r30, r3, 0x34
	rlwinm r29, r4, 3, 0, 31        # (Mask: 0xffffffff)
	rlwinm r28, r28, 3, 0, 31       # (Mask: 0xffffffff)
	lwzx r3, r30, r29
	lwzx r4, r30, r28
	lwz r31, 0x60(r3)
	mr r24, r3
	lwz r4, 0x60(r4)
	lis r28, 0x804e
	lwz r28, 0x644(r28)
	lwz r23, 0x0(r28)
	cmpw r23, r4
	beq loc_0x02A
loc_0x024:
	lwzu r23, 0x8(r28)
	cmpwi r23, 0x0
	bne loc_0x028
	b loc_0x04A
loc_0x028:
	cmpw r23, r4
	bne+ loc_0x024
loc_0x02A:
	lwz r23, 0x4(r28)
	lwz r30, 0x64(r23)
	subi r29, r30, 0x4
	lwzu r3, 0x4(r29)
	cmpwi r3, 0x0
	beq loc_0x037
loc_0x030:
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	lwzu r3, 0x4(r29)
	cmpwi r3, 0x0
	bne+ loc_0x030
loc_0x037:
	addi r3, r30, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	addi r3, r23, 0x0
	lis r0, 0x8002
	ori r0, r0, 0x632c
	mtctr r0
	bctrl
	li r30, 0x1
	cmpwi r30, 0x0
	beq loc_0x04A
loc_0x044:
	lwzu r30, 0x8(r28)
	lwz r29, 0x4(r28)
	stw r30, -0x8(r28)
	stw r29, -0x4(r28)
	cmpwi r30, 0x0
	bne+ loc_0x044
loc_0x04A:
	lmw r3, 0x8(r1)
	addi r1, r1, 0xf4
	lfd f0, -0x10(r1)
	lfd f1, -0x18(r1)
	lfd f2, -0x20(r1)
	lfd f3, -0x28(r1)
	lfd f4, -0x30(r1)
	lfd f5, -0x38(r1)
	lfd f6, -0x40(r1)
	lfd f7, -0x48(r1)
	lfd f8, -0x50(r1)
	lfd f9, -0x58(r1)
	lfd f10, -0x60(r1)
	lfd f11, -0x68(r1)
	lfd f12, -0x70(r1)
	lfd f13, -0x78(r1)
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	stb r4, 0xb(r3)
	nop
}

####################
Unattested Code 2
####################
* 064E0778 00000010             # String Write (16 characters) @ $(ba + 0x004E0778):
* 30313233 34353637             # 	   "01234567 ...
* 38394142 43444546             # 	... 89ABCDEF" (Note: Not Null-Terminated!)

#########################################
[CM: Tag Based Costumes] recordActiveTags
#########################################
HOOK @ $806A0718                # Address = $(ba + 0x006A0718)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lwz r30, -0x34(r3)
	lbz r29, 0x57(r3)
	lis r28, 0x804e
	ori r28, r28, 0x773
	andi. r29, r29, 0x7
	stbx r30, r28, r29
	lis r30, 0x804e
	ori r30, r30, 0x25b
	li r28, 0x1
	stbx r28, r30, r29
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	mflr r0
}

######################################
[CM: Tag Based Costumes] setTagCostume
######################################
HOOK @ $8084D0D4                # Address = $(ba + 0x0084D0D4)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r31, 0x804e
	lwz r31, 0xb00(r31)
	cmpwi r31, 0x2
	beq loc_0x083
	cmpwi r31, 0x0
	bne loc_0x018
	lis r30, 0x804e
	lbz r30, 0x258(r30)
	lis r29, 0x804e
	lbz r29, 0x25b(r29)
	cmpwi r30, 0x1
	bne loc_0x017
	cmpwi r29, 0x1
	bne loc_0x016
	li r31, 0x1
loc_0x016:
	b loc_0x018
loc_0x017:
	li r31, 0x1
loc_0x018:
	lis r30, 0x805b
	lwz r30, 0x50ac(r30)
	lwz r30, 0x10(r30)
	lwz r30, 0x0(r30)
	lis r29, 0x8070
	ori r29, r29, 0x2b60
	cmpw r30, r29
	bne loc_0x021
	li r31, 0x0
loc_0x021:
	cmpwi r31, 0x1
	bne loc_0x07B
	lis r31, 0x804e
	ori r31, r31, 0x788
	stw r4, 0x0(r31)
	lis r29, 0x804e
	ori r29, r29, 0x774
	lbzx r29, r29, r8
	cmpwi r29, 0x78
	bge loc_0x071
	mr r30, r4
	lis r31, 0x804e
	ori r31, r31, 0x648
	lis r4, 0x413a
	ori r4, r4, 0x2f50
	stw r4, 0x0(r31)
	lis r4, 0x726f
	ori r4, r4, 0x6a65
	stw r4, 0x4(r31)
	lis r4, 0x6374
	ori r4, r4, 0x2b2f
	stw r4, 0x8(r31)
	lis r4, 0x7066
	stw r4, 0xc(r31)
	lis r3, 0x804e
	ori r3, r3, 0x656
	mr r4, r30
	lis r0, 0x803f
	ori r0, r0, 0xa280
	mtctr r0
	bctrl
	subi r20, r7, 0x7
	mulli r31, r29, 0x124
	lis r30, 0x9017
	ori r30, r30, 0x2e20
	lhzux r31, r30, r31
	li r27, 0x24
	stbu r27, 0x1(r20)
	lis r27, 0x804e
	ori r27, r27, 0x778
	cmpwi r31, 0x0
	beq loc_0x057
loc_0x04B:
	li r29, 0x14
	cmpwi r29, 0x21
	bge loc_0x054
loc_0x04E:
	rlwnm r28, r31, r29, 28, 31     # (Mask: 0x0000000f)
	lbzx r28, r27, r28
	stbu r28, 0x1(r20)
	addi r29, r29, 0x4
	cmpwi r29, 0x21
	blt+ loc_0x04E
loc_0x054:
	lhzu r31, 0x2(r30)
	cmpwi r31, 0x0
	bne+ loc_0x04B
loc_0x057:
	lis r31, 0x2e70
	ori r31, r31, 0x6163
	stw r31, 0x1(r20)
	li r31, 0x0
	stw r31, 0x5(r20)
	lis r4, 0x804e
	ori r4, r4, 0x6f8
	lis r29, 0x7200
	lis r3, 0x804e
	ori r3, r3, 0x648
	stw r29, 0x0(r4)
	lis r0, 0x803e
	ori r0, r0, 0xbeb8
	mtctr r0
	bctrl
	cmpwi r3, 0x0
	beq loc_0x071
	lis r0, 0x803e
	ori r0, r0, 0xbe8c
	mtctr r0
	bctrl
	lis r31, 0x804e
	ori r31, r31, 0x788
	lis r30, 0x804e
	ori r30, r30, 0x656
	stw r30, 0x0(r31)
loc_0x071:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	lis r4, 0x804e
	lwz r4, 0x788(r4)
	b loc_0x082
loc_0x07B:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
loc_0x082:
	b loc_0x08A
loc_0x083:
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
loc_0x08A:
	li r9, 0xff
}

####################################################
[CM: Tag Based Costumes] reloadCostumeAfterTagSelect
####################################################
HOOK @ $8094641C                # Address = $(ba + 0x0094641C)
{
	lbz r3, 0x2(r31)
	lis r4, 0x804e
	ori r4, r4, 0x25c
	lbzx r6, r3, r4
	cmpwi r6, 0x1
	bne loc_0x010
	li r6, 0x0
	stbx r6, r4, r3
	lis r6, 0x804e
	lwz r6, 0x758(r6)
	cmpwi r6, 0x1
	beq loc_0x00E
	li r3, 0x7f
	b loc_0x00F
loc_0x00E:
	lbz r3, 0x5b(r30)
loc_0x00F:
	b %END%
loc_0x010:
	lbz r3, 0x5b(r30)
}

############################################
[CM: Tag Based Costumes] teamBattleTagReload
############################################
HOOK @ $8068A4A0                # Address = $(ba + 0x0068A4A0)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r28, 0x804e
	ori r28, r28, 0x258
	lwz r27, 0x5c8(r31)
	stw r27, 0x0(r28)
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	mr r3, r31
}

####################################################
[CM: Tag Based Costumes] updateTagsWhenOptionChanged
####################################################
HOOK @ $8001735C                # Address = $(ba + 0x0001735C)
{
	stw r0, -0x4(r1)
	mflr r0
	stw r0, 0x4(r1)
	mfctr r0
	stw r0, -0x8(r1)
	stwu r1, -0x84(r1)
	stmw r3, 0x8(r1)
	lis r28, 0x804e
	lwz r28, 0x260(r28)
	lis r27, 0x804e
	lwz r27, 0xb00(r27)
	cmpw r28, r27
	beq loc_0x014
	lis r30, 0x804e
	ori r30, r30, 0x25c
	li r29, 0x1
	stb r29, 0x0(r30)
	stb r29, 0x1(r30)
	stb r29, 0x2(r30)
	stb r29, 0x3(r30)
loc_0x014:
	lis r28, 0x804e
	ori r28, r28, 0x260
	lis r27, 0x804e
	lwz r27, 0xb00(r27)
	stw r27, 0x0(r28)
	lmw r3, 0x8(r1)
	addi r1, r1, 0x84
	lwz r0, -0x8(r1)
	mtctr r0
	lwz r0, 0x4(r1)
	mtlr r0
	lwz r0, -0x4(r1)
	cmpwi r24, 0x1
}

################################################################################
[CM: _DashAttackItemGrab] vBrawl Item Grab Restoration Toggle v1.0.0 [QuickLava]
################################################################################
HOOK @ $808E0094                # Address = $(ba + 0x008E0094)
{
	bl data_0x00D
	word 0x80FB240C                 # ..$.      | DATA_EMBED (0x30 bytes)
	word 0x00070100                 # ....
	word 0x80FB2394                 # ..#.
	word 0x80FC2798                 # ..'.
	word 0x000A0400                 # ....
	word 0x80FB2DE4                 # ..-.
	word 0x80FC27A0                 # ..'.
	word 0x00070100                 # ....
	word 0x80FADAC4                 # ....
	word 0x80FC27A8                 # ..'.
	word 0x000F0000                 # ....
	word 0x00000000                 # ....
data_0x00D:
	lis r30, 0x804e
	lwz r30, 0x1d44(r30)
	cmplwi r30, 0x0
	lis r11, 0x2
	li r12, 0x0
	li r30, 0xc
	bne loc_0x015
	li r30, 0x4
loc_0x015:
	mtxer r30
	mflr r30
	li r31, 0x0
loc_0x018:
	lswx r10, r30, r31
	stswi r11, r10, 8
	addi r31, r31, 0xc
	cmplwi r31, 0x30
	blt loc_0x018
	mr r30, r3
	nop
}

##################################################
[CM: _JumpsquatOverride] Jumpsquat Length Modifier
##################################################
HOOK @ $808734F8                # Address = $(ba + 0x008734F8)
{
	lis r11, 0x804e
	lwz r12, 0x1d9c(r11)
	cmplwi r12, 0x0
	beq loc_0x028
	lwz r11, 0x1e4c(r11)
	mr r0, r11
	addic. r12, r12, -0x1
	beq loc_0x01E
	add r0, r11, r3
	addic. r12, r12, -0x1
	beq loc_0x01E
	subf r0, r11, r3
	addic. r12, r12, -0x1
	beq loc_0x01E
	mullw r0, r11, r3
	addic. r12, r12, -0x1
	beq loc_0x01E
	divwu r0, r3, r11
	addic. r12, r12, -0x1
	beq loc_0x01E
	subf r0, r3, r11
	cmpwi r0, 0x0
	bge loc_0x018
	neg r0, r0
loc_0x018:
	addic. r12, r12, -0x1
	beq loc_0x01E
	lwz r3, -0x4364(r13)
	divwu r0, r3, r11
	mullw r0, r0, r11
	subf r0, r0, r3
loc_0x01E:
	lis r11, 0x804e
	lwz r12, 0x1e8c(r11)
	cmpw r0, r12
	bge loc_0x023
	mr r0, r12
loc_0x023:
	lwz r12, 0x1ed4(r11)
	cmpw r0, r12
	ble loc_0x027
	mr r0, r12
loc_0x027:
	mr r3, r0
loc_0x028:
	xoris r3, r3, 0x8000
}

