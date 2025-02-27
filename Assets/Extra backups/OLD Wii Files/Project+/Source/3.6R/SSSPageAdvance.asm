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