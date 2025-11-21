###########################################################
Grab trade effects [Eon, code menu variant by mawwwk]
###########################################################
.include "Source/CM_Addons/AddonAliases.asm"

.macro lwi(<reg>, <val>)
{
    .alias  temp_Hi = <val> / 0x10000
    .alias  temp_Lo = <val> & 0xFFFF
    lis     <reg>, temp_Hi
    ori     <reg>, <reg>, temp_Lo
}
.macro lwd(<reg>, <addr>)
{
    .alias  temp_Lo = <addr> & 0xFFFF
    .alias  temp_Hi_ = <addr> / 0x10000
    .alias  temp_r = temp_Lo / 0x8000
    .alias  temp_Hi = temp_Hi_ + temp_r
    lis     <reg>, temp_Hi
    lwz     <reg>, temp_Lo(<reg>)
}

# 0 = default, 1 = grabs recoil (trade), 2 = Manaphy Heart Swap effect

HOOK @ $8077055c
{
  %lwd(r31, GRABTRDE_BEHAVIOR_LOC)  # \
  lwz r31, 0x8(r31)                 # / Get selected behavior from the code menu!
  cmpwi r31, 0                  #
  beq defaultGrab 				# Default behavior if codemenuVar = 0
  bne grabsClank				# Go to clank behavior otherwise
  
defaultGrab:		
  lis r31, 0x8079				# \ original op: bl 0x807977c8
  ori r31, r31, 0x77C8
  mtctr r31
  bctrl					   		# /
  b %END%

grabsClank:
  mr r31, r3 #captured main
  lis r12, 0x8079
  ori r12, r12, 0x77B8
  mtctr r12 
  bctrl #getCatchModule
  lfs f1, 0x54(r3)				# \ if distances between grabs different then just jump to end,
  lfs f2, 0x54(r30)				#   they didnt grab each other,
  fcmpo cr0, f1, f2 			# / this is done since target of grab never gets cleared, but distance is reset every frame
  bne end
  lwz r4, 0x30(r3) 				# gets who the opponent has grabbed
  
  lwz r3, 0x10(r30) 			# compare to self id
  lwz r3, 0x8(r3)
  lwz r3, 0x28(r3)
  cmpw r3, r4 					# if self id and target's target id match then they grabbed you
  bne end
  
  lwz r3, 0x10(r30)
  lwz r3, 0xD8(r3)
  lwz r3, 0x70(r3)
  lwz r12, 0x0(r3)
  lwz r12, 0x48(r12)
  mtctr r12
  bctrl 
  cmpwi r3, 0x34 #grab 
  beq recoil
  cmpwi r3, 0x36 #dashgrab 
  beq recoil
  cmpwi r3, 0x38 #pivotgrab
  bne end
  
recoil:
  %lwd(r3, GRABTRDE_BEHAVIOR_LOC)  # \
  lwz r3, 0x8(r3)                  # / Get selected behavior from the code menu!
  cmpwi r3, 2                	   # If (code menu var == 2), go to Heart Swap effect instead
  beq heartSwap

  lwz r5, 0x10(r30)
  lwz r3, 0xD8(r5)
  lwz r3, 0x70(r3)
  li r4, 0x3B
  lwz r12, 0x0(r3)
  lwz r12, 0x14(r12)
  mtctr r12
  bctrl 
  #set RA-Basic[7] to 1 when grab-trade occurs
  lwz r3, 0x10(r30)
  lwz r3, 0xD8(r3)
  lwz r3, 0x64(r3)
  li r4, 1

  lis r5, 0x1000
  ori r5, r5, 0x0007
  lwz r12, 0x0(r3)
  lwz r12, 0x1C(r12)
  mtctr r12
  bctrl
  b recoilEnd
  
heartSwap:
  mr r3, r31
  lis r4, 0x1000
  lis r12, 0x8079
  ori r12, r12, 0x76D8
  mtctr r12 
  bctrl 
  mr r31, r3
  #set RA-Basic[7] to 1 when grab-trade occurs
  lwz r3, 0x10(r30)
  lwz r3, 0xD8(r3)
  lwz r3, 0x64(r3)
  lis r4, 0x1000
  lwz r12, 0x0(r3)
  lwz r12, 0x18(r12)
  mtctr r12
  bctrl 
  mr r5, r3
  lis r3, 0x80B8
  lwz r3, 0x7C28(r3)
  lwz r3, 0x154(r3)
  li r4, 1
  mr r6, r31
  li r7, 1
  li r8, 540		# Timer for swap (frames?)
  lis r12, 0x8082
  ori r12, r12, 0x4090
  mtctr r12 
  bctrl

recoilEnd:
  lis r12, 0x8077
  ori r12, r12, 0x05B4
  mtctr r12
  bctr
  
end:
  mr r3, r31
  lis r12, 0x8079
  ori r12, r12, 0x77C8
  mtctr r12 
  bctrl
}