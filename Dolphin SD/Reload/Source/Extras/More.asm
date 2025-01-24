#.include source/Extras/CostumeAddition.asm # If trying to add more than 15 costumes, use this code to load all costumes from the result portraits, instead of the CSS file.
											# Note that in its current state, this code lags on console when multiple people try to scroll through the CSS at the same time.
											# Troubleshooting for this code will not be supported until it is further updated in the future!
#.include source/Extras/AI/AiDebug.asm 		# Displays AI debug for CPU in P1 slot. Incompatible with CodeMenu.asm (In RSBE01.txt). One or the other must be ignored with # in front of .include

#.include source/Extras/USBGecko.asm 		# Adds support for Gecko codes passed in by a USB Gecko

#####################################
Disable DPad on the SSS [PyotrLuzhin]
#####################################
* 046B6058 48000058

########################################################
R Press on SSS advances page [ilikepizza107, QuickLava]
########################################################
HOOK @ $806B5864
{
    rlwinm. r0, r3, 0, 26, 26    # 0x20 (R button pressed)
    beq noMatch                  # if R is not pressed, jump down to noMatch
    lis r12, 0x806B              # \ 
    ori r12, r12, 0x58E8         # | load address 806B05E8 into r12
    mtctr r12                    # /
    bctrl                        # jump to 806B05E8

noMatch:
    rlwinm. r0, r3, 0, 23, 23    # 0x100 (A button pressed)
}