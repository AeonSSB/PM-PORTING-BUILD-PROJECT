#########################################################
[Legacy TE] Masquerade Costume Flags V2 [ds22, DukeItOut]
#########################################################
op subi r0, r31, 0x32 @ $8084CD48
* 02AD817C 003200FF

############################################################################################
[Legacy TE] Set Masquerade Costume Count to Zero to have up to 50 costumes v1.1c [DukeItOut]
v1.1a - Updated to Support 128 Unique Costume IDs per character
v1.1b - Fixed 128 ID Support for Kirby Hats
v1.1c - Normalized Wario-Man IDs.
############################################################################################
HOOK @ $8084CFFC
{
  andi. r12, r0, 0xFFFE
  beq- masqueradeBypass
  lis r12, 0x8084
  ori r12, r12, 0xD004
  mtctr r12
  bctr 
masqueradeBypass:
  and. r0, r3, r0
}
op rlwinm r5, r23, 0, 25, 31  @ $8084D00C # \ 
op rlwinm r5, r8,  0, 25, 31  @ $8084DED4 # | Changed to support 128 costume IDs per char.
op rlwinm r3, r0,  0, 25, 31  @ $8081C3D4 # / 

byte 0x34		     @ $8045A374	// '4'
byte[4] 0x30, 0x34, 0x64, 0 @ $806A17D8 // "04d"
half 0xBB9 		     @ $800E1F0E

byte 50				@ $800E1F27
byte 50				@ $800E8B0B
byte 50				@ $800E8C07
byte 50 		    @ $80692DA7
byte 50 		    @ $80692507

op rlwinm r6, r23, 0, 26, 31 @ $8084D518
op rlwinm r6, r23, 0, 26, 31 @ $8084D814
op rlwinm r6, r23, 0, 26, 31 @ $8084DAF0
op rlwinm r5, r23, 0, 26, 31 @ $8084DED4
op rlwinm r0, r23, 0, 26, 31 @ $8084CC28
op rlwinm r5, r23, 0, 26, 31 @ $8084CB6C
op rlwinm r0, r6, 2, 26, 29 @ $8082A830
op rlwinm r0, r6, 2, 26, 29 @ $8082AB20
op rlwinm r0, r6, 0, 28, 31 @ $8082AB3C
op rlwinm r0, r6, 0, 28, 31 @ $8082AB5C
op rlwinm r0, r6, 0, 28, 31 @ $8082AB6C
op rlwinm r0, r6, 0, 28, 31 @ $8082AB8C
op rlwinm r0, r6, 0, 28, 31 @ $8082ABAC
op rlwinm r0, r6, 0, 28, 31 @ $8082ABBC
op rlwinm r0, r6, 0, 28, 31 @ $8082ABDC
op rlwinm r0, r6, 0, 28, 31 @ $8082ABFC
op rlwinm r0, r6, 0, 28, 31 @ $8082AC0C
op rlwinm r0, r6, 0, 28, 31 @ $8082A84C
op rlwinm r0, r6, 0, 28, 31 @ $8082A86C
op rlwinm r0, r6, 0, 28, 31 @ $8082A87C
op rlwinm r0, r6, 0, 28, 31 @ $8082A89C
op rlwinm r0, r6, 0, 28, 31 @ $8082A8BC
op rlwinm r0, r6, 0, 28, 31 @ $8082A8CC
op rlwinm r0, r6, 0, 28, 31 @ $8082A8EC
op rlwinm r0, r6, 0, 28, 31 @ $8082A90C
op rlwinm r0, r6, 0, 28, 31 @ $8082A91C

################################################################
[Brawl-Themed Project+] Stage Select Screen Supports 50CC [QuickLava]
################################################################
# Stage Select Stock Icons 50CC Fix
byte 50 @ $806B2FFF
# Overwrites the old constants the game used as the frames for Random Icons with 50CC compliant ones.
# First value should be left as is, second value should be the first plus how many colored random icons you need!
float[2] 9051.0f, 9055.0f @ $806B91B0

###################################################################
[Legacy TE] Upload Character Masquerade Data At Startup [DukeItOut]
###################################################################
string "/info/costumeslots/%02d.masq" @ $80546FE0
HOOK @ $8002D508
{
  stwu r1, -0xF0(r1)
  mflr r0
  stw r0, 0xF4(r1)
  stw r31, 0x0C(r1)
  stw r30, 0x10(r1)
  stw r29, 0x14(r1)
  stw r28, 0x18(r1)
  stw r3, 0x24(r1)
  stw r4, 0x28(r1)
  stw r5, 0x2C(r1)
  lis r31, 0x8045			# \
  ori r31, r31, 0x5450		# /
  stw r31, 0x1C(r1)
  lis r31, 0x8054			# \ Where to write the masquerade files to
  ori r31, r31, 0x7000		# /
  stw r31, 0x20(r1)
  li r29, 0x0

loc_0x44:
  addi r3, r1, 0x60
  lis r4, 0x8054  			# \ Pointer to the string, above.
  ori r4, r4, 0x6FE0		# /
  mr r5, r29
  lis r12, 0x803F  			# \
  ori r12, r12, 0x89FC		# | sprintf
  mtctr r12					# |
  bctrl 					# /
  lwz r5, 0x20(r1)
  addi r3, r1, 0x30
  addi r4, r1, 0x60
  li r6, 0x0
  li r7, 0x0
  lis r12, 0x8002			# \
  ori r12, r12, 0x239C		# | set the read parameter
  mtctr r12					# |
  bctrl 					# /
  addi r3, r1, 0x30
  lis r12, 0x8001			# \
  ori r12, r12, 0xBF0C		# | load the file
  mtctr r12					# | 
  bctrl 					# /
  lwz r30, 0x1C(r1)
  lwz r31, 0x20(r1)
  cmplwi r29, 39			# clone engine slots skip the below
  bgt+ loc_0xB4
  stwu r31, 0x10(r30)		# Store the address in the character information area
  stw r30, 0x1C(r1)
loc_0xB4:
  addi r31, r31, 102		# Each file is 102 bytes
  stw r31, 0x20(r1)
  addi r29, r29, 0x1
  cmplwi r29, 42			# 42 characters in total + Pokemon Trainer's slot
  ble+ loc_0x44
  lwz r3, 0x24(r1)
  lwz r4, 0x28(r1)
  lwz r5, 0x2C(r1)
  lwz r0, 0xF4(r1)
  lwz r31, 0x0C(r1)
  lwz r30, 0x10(r1)
  lwz r29, 0x14(r1)
  lwz r28, 0x18(r1)
  mtlr r0
  addi r1, r1, 0xF0
  lbz r0, 0x278(r3)			# Original operation
}