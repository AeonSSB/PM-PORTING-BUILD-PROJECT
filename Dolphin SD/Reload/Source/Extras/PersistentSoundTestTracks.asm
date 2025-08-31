#######################################################################################################
Sound Test and My Music Choices Persist Between Menus (Standalone Ver.) v1.2.0 [QuickLava]
# Alternate Version of "Menu Music Sticks Between Menu Transitions"
# Makes it so that starting a song from the Sound Test or My Music sub-menus registers
# that song as the active menu song, preventing it from being re-rolled when moving between menus.
# Importantly, this code does not preserve unique sub-menu songs (eg. Rotation or Stage Builder themes)
# when returning to the Main Menu; use the "Menu Music Sticks Between Menu Transitions" code instead
# if that behavior is desired.
#######################################################################################################
# Register Sound Test / My Music Song Selection as Active Menu Track
HOOK @ $80073F64    # 0x1B4 bytes into symbol "playBGM/[sndSystem]/snd_system.o" @ 0x80073DB0
{
  lis r11, 0x805A            # \
  lwz r12, 0x0060(r11)       # / Get pointer to gfSceneManager!
  lwz r12, 0x04(r12)         # Load current scene pointer...
  lhz r12, 0x02(r12)         # ... and grab the bottom half of its name string address.
  cmplwi r12, 0xFDB0         # If it doesn't match the bottom half of the muMenuMain string address...
  bne exit                   # ... then we're not on Main Menu, so exit.
                             # Otherwise, we're either entering Main Menu or starting a My Music/Sound Test song!
  lwz r12, 0x01D8(r11)       # Get pointer to sndBGMRateSystem...
  stw r29, 0x190(r12)        # ... and store the requested song as the active Menu track!
                             # Additionally, we may need to do some extra work to accommodate the TLST system.
  lis r11, 0x8054            # Set up top half of address register...
  lhz r12, -0x0E00(r11)      # ... try to grab the top half of the loaded TLST's magic from 0x8053F200...
  cmplwi r12, 0x544C         # ... and check that it's value is what we expect.
  bne exit                   # If it isn't, the TLST system isn't active, so we can skip the below.
  li r12, 0x0026             # Otherwise though, a TLST *is* loaded! In which case, set up the Menu TLST ID...
  sth r12, -0x1048(r11)      # \ ... and store it over the load check ID (to avoid reloading the TLST)...
  sth r12, -0x1080(r11)      # / ... and over the ID in ASL_DATA, for use in preserving the active TLST via the following PULSE!
exit:
  lwz r0, 0x24(r1)           # Restore Original Instruction
}
# Menu Track of 0x00 Force Accepts Next Re-Roll, Randomizing Non-Menu BGM Forces Menu Track to 0x00!
HOOK @ $800793F8    # 0x1BC bytes into symbol "setBgmId/[sndBgmRateSystem]/snd_bgmsys.o" @ 0x8007923C
{
  cmplwi r29, 0x2A           # Check if we re-rolled Menu Music...
  beq rolledMenuBGM          # ... and if so, jump to the relevant section.
rolledNonMenuBGM:            # Otherwise, we rolled for stage BGM!
  li r0, 0x00                # \
  stw r0, 0x190(r28)         # / Zero out registered Menu Track to flag it for the below portion!
  b exit                     # Exit.
rolledMenuBGM:               # If we're rolling Menu Music though...
  lwz r0, 0x190(r28)         # \
  cmplwi r0, 0x00            # / ... check if registered Menu Track is zero'd out.
  bne exit                   # If not, exit...
  stw r3, 0x190(r28)         # ... but if so, store newly rolled track to register it!
exit:
  addi r11, r1, 0x30         # Restore Original Instruction
}
# Fallback to Force Menu Music if we Leave Sound Test without Picking a Track
# Note: Unnecessary for builds which don't use the TLST system (though provides useful functionality even in that environment).
HOOK @ $80078DDC    # 0x30 bytes into symbol "isSeLoaded/[sndSystem]/snd_system.o" @ 0x80078DAC
{
  mr r28, r3                 # Restore Original Instruction
  beq %END%                  # If the game's previous comparison to -1 passed, just exit.
  cmplwi r4, 0x2A            # \
  bne exit                   # / If we're not rolling for menu music, exit early!
  lis r11, 0x805A            # \
  lwz r12, 0x01D0(r11)       # / Grab the sndSystem pointer...
  lwz r12, 0x06E0(r12)       # ... then grab the pointer to the currently playing song.
  cmplwi r12, 0x00           # Check if it's null...
  bne exit                   # ... and if not, something's playing, so continue as normal.
  li r0, 0x00                # \
  stw r0, 0x190(r3)          # / Otherwise, zero out the active Menu Track to trigger a reroll!
                             # We may also have to force a TLST reload if that system is active.
  lis r11, 0x8054            # Set up top half of address register...
  lhz r0, -0x0E00(r11)       # ... try to grab the top half of the loaded TLST's magic from 0x8053F200...
  cmplwi r0, 0x544C          # ... and check that it's value is what we expect.
  bne exit                   # If not, no TLST is loaded, so just jump down to storing our new value.
  li r3, 0x26		         # \
  addi r12, r11, -0x2000     # |
  mtctr r12                  # | Force load Menu TLST!
  bctrl                      # /
  mr r3, r28                 # \
  mr r4, r29                 # | Restore Function Arg Regs
  mr r5, r30                 # /
exit:
  addis r0, r5, 0x1          # \
  cmplwi r0, 0xFFFF          # / Recreate Original CR State
}
# Restore Cleared TLST ID when leaving SSS Sound Test to Avoid TLST Reload
# Note: Unnecessary for builds which don't use the TLST system.
PULSE
{
  lis r11, 0x8054            # Set up top half of address register...
  lhz r12, -0x0E00(r11)      # ... try to grab the top half of the loaded TLST's magic from 0x8053F200...
  cmplwi r12, 0x544C         # ... and check that it's value is what we expect.
  bnelr                      # If it isn't, the TLST system isn't active, so we can skip the below.
  lhz r12 -0x1048(r11)       # Grab the copy of the ID used for deciding whether to block a TLST reload...
  cmplwi r12, 0x00           # ... and check if it's currently zero'd out.
  bnelr+                     # If it's not zero, we don't need to do anything extra, so exit.
  lhz r12, -0x1080(r11)      # Otherwise, grab the previous TLST ID from ASL_DATA... 
  cmplwi r12, 0x0026         # ... and check if it's 0x26, the Menu ID.
  bnelr+                     # If it isn't, we don't need to force-restore it, so skip.
  sth r12 -0x1048(r11)       # Otherwise though, store it over the actual ID to prevent discarding the active TLST!
exit:
  blr
}
# Thwart Forced Changing of Menu Music from BootToCSS.asm
# Note: Unnecessary if you remove the `op b 0x10 @ $80078E14` line in that file instead!
HOOK @ $80078E24    # 0x78 bytes into symbol "isSeLoaded/[sndSystem]/snd_system.o" @ 0x80078DAC
{
  cmpwi r30, 0x0             # Check if r30 was zero...
  bne store                  # ... and if it wasn't, we wanted to overwrite the active Menu Track, so just store.
  lwz r3, 0x190(r28)         # Otherwise, we need to respect current track; load its ID...
  stw r3, 0x178(r28)         # ... and store it over the track to use next.
store:
  stw r3, 0x190(r28)         # Restore Original Instruction
}
