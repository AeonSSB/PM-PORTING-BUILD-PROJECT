##############################################################
[CM_Addons] Volume Balance Control v1.0.0 [QuickLava]
##############################################################
.include "Source/CM_Addons/AddonAliases.asm"

.alias SET_VOL_BALANCE        = 0x80076F30
.alias CODE_MENU_STATE_LOC_HI = 0x804E
.alias CODE_MENU_STATE_LOC_LO = 0x0034
.alias CODE_MENU_STATE_OPEN   = 0x4

.macro lwi(<reg>, <val>)
{
    .alias  temp_Hi = <val> / 0x10000
    .alias  temp_Lo = <val> & 0xFFFF
    lis     <reg>, temp_Hi
    ori     <reg>, <reg>, temp_Lo
}

HOOK @ $801CAD70    # 0x68 bytes into symbol "Update/[nw4r3snd11SoundPlayerFv]/snd_SoundPlayer.o"
{
  lis r11, CODE_MENU_STATE_LOC_HI          # \
  lwz r12, CODE_MENU_STATE_LOC_LO(r11)     # |
  cmplwi r12, CODE_MENU_STATE_OPEN         # / If Code Menu isn't currently open, skip code!
  
  lwz r11, VOLBLNCE_VALUE_LOC_LO(r11)      # Get address of Value line.
  lis r12, 0x805A                          #
  lwz r12, 0xE0(r12)                       #
  lwz r12, 0x24(r12)                       #
  addi r12, r12, 0x810                     #
  lfs f2, 0x14(r11)                        # Grab the max value of the value line, since we'll need it in a moment.
  bne+ loadValueFromSettings               #
writeValueToSettings:
  psq_l f1, 0x08(r11), 1, 0                # Grab current value (for the SE volume side of the ratio)...
  fsubs f2, f2, f1                         # ... then subtract the current value from the max to get the BGM side.
  psq_st f2, 0x18(r12), 1, 4               # Then, store it over the current setting in the menu struct!
  lwz r3, -0x4250(r13)                     # \
  %lwi(r12, SET_VOL_BALANCE)               # |
  mtctr r12                                # | Finally, call setVolBalance to update the actual sound system!
  bctrl                                    # /
  b exit                                   # Then we're done! Jump to exit.
loadValueFromSettings:
  lbz r0, 0x04(r11)                        # \
  andi. r0, r0, 0xF7                       # |
  stb r0, 0x04(r11)                        # / Un-set the changed bit of the menu line's color, since we're setting its default here.
  psq_l f1, 0x18(r12), 1, 4                # Load current ratio setting.
  fsubs f1, f2, f1                         # Subtract the current setting from the max to get SE volume...
  psq_st f1, 0x08(r11), 1, 0               # \
  psq_st f1, 0x10(r11), 1, 0               # / And store it over both the current value and the default in the code menu line!
  
exit:
  lwz r0, 0x24(r1)                         # Restore Original Instruction
}