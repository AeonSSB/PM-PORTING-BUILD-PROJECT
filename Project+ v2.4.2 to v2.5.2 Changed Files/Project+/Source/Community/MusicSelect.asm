#######################################
Select music for match on SSS [Squidgy]
#######################################
# Press a custom button while hovering over a stage to open the My Music screen
# Press the custom button to select the song and automatically start the match
# Press A to preview songs, or B to back out
# Only available in regular VS mode

# --CONTROL OPTIONS--
# Button to open song select
# button values : 21 (X), 20 (Y), 19 (Start/+)
.alias button = 19
# Button to select a song in song select
# selectButton values : 21 (X), 20 (Y), 23 (Start/+)
.alias selectButton = 23
# Recommended to use the same button for opening song select and picking a song, 
# but note that some buttons (such as Start) use a different number for each

# --CUSTOM ADDRESSES USED--
# 80002810 - we use this address for a flag that tells us what step we are on
# 80002818 - we use this address for the selected song ID
# 8000281C - we use this address for cursor X position
# 80002820 - we use this address for cursor Y position
# 80002824 - we use this address for SSS page
# 80002828 - we use this address to store the current mode
# 8000282C - this is where we store muSelectStageTask since it is not stored normally. This is used to...
# ...get the frame count, and we also use an offset from this to get cursor positions
# 80002830 - port 1 hidden alt
# 80002834 - port 2 hidden alt
# 80002838 - port 3 hidden alt
# 8000283C - port 4 hidden alt
# 80002840 - chosen stage alt, used to ensure replays load correct stage alt

# --FLAG STATES--
# 1 - going to My Music, 2 - My Music opened, 3 - song chosen, 4 - backing out of My Music, 
# 5 - returning from My Music, 6 - back to SSS, 7 - change to correct page

# macro to store selected hidden alt so it can load when picking songs
.macro storeHiddenAlt(<baseAddress>,<storeAddress>)
{
    lis r4, 0x9018                  # \ base address for port hidden alt status
    ori r4, r4, <baseAddress>       # /

    lis r10, 0x0004                 # \ offset to hidden alt status
    ori r10, r10, 0x3AD8            # |
    lwzx r4, r10 (r4)               # / store the status in r4

    lis r9, 0x8000                  # \ address where we WILL store port hidden alt
    ori r9, r9, <storeAddress>      # /

    stw r4, 0 (r9)                  # store status in our store location
}

# macro to retrieve any selected hidden alts
.macro retrieveHiddenAlt(<baseAddress>,<storeAddress>)
{
    lis r9, 0x8000                  # \ address where hidden alt is stored
    ori r9, r9, <storeAddress>      # |
    lwz r9, 0 (r9)                  # /

    lis r8, 0x9018                  # \ base address for port hidden alt status
    ori r8, r8, <baseAddress>       # /

    lis r10, 0x0004                 # \ offset to hidden alt status
    ori r10, r10, 0x3AD8            # |
    add r8, r10, r8                 # / final address

    stw r9, 0 (r8)                  # store hidden alt status
}

# macro to get the scene manager address
.macro getSceneManager()
{
    lis r12, 0x8002     # \ call getInstance/[gfSceneManager]
    ori r12, r12 0xd018 # |
    mtctr r12           # |
    bctrl               # / scene manager address placed in r3
}

# this hook makes our button work on SSS
HOOK @ $806b5864 # hook where we check if A is being pressed on SSS
{
    # check to ensure this only works in regular VS mode
    mr r9, r3   # store r3

    %getSceneManager()   # \ get scene manager
    mr r10, r3           # | place scene manager into r10
    lwz r3, 0x10 (r10)   # | load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)       # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqVsMelee" into r4
    ori r4, r4, 0x17E0  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings match, proceed
    beq versus          # / proceed

    lwz r3, 0x10 (r10)   # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqSpMelee" into r4
    ori r4, r4, 0x17F8  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings match, continue
    beq special         # / proceed

    lwz r3, 0x10 (r10)   # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqTraining" into r4
    ori r4, r4, 0x1870  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings don't match, skip
    beq training        # | proceed
    mr r3, r9           # | restore r3
    bne skip            # / skip

    versus:
    li r10, 1
    b continue

    special:
    li r10, 3
    b continue

    training:
    li r10, 12

    continue:
    mr r3, r9           # \ store r3
    %getSceneManager()  # | get scene manager
    mr r8, r3           # | store scene manager in r8
    mr r3, r9           # | restore r3
    lwz r8, 0x0280 (r8) # |check we are on Main Menu sequence
    cmpwi r8, 1         # |
    beq skip            # / if we are, skip

    rlwinm. r0, r3, 0, button, button # if button is being pressed, treat that as a valid stage select button
    bne goToMyMusic

    # this block here is to force-select the stage after picking a song
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r4, 0 (r9)     # |
    cmpwi r4, 0        # | if state flag isn't 0, check if we need to change pages
    bne checkPage      # /
    lwz r4, 0x8 (r9)   # \ otherwise, get stored song ID
    cmpwi r4, 0        # | if song ID isn't 0, automatically start the stage
    bne startStage     # /

    skip:
    rlwinm. r0, r3, 0, 23, 23 # original line
    b %end%

    checkPage:
    cmpwi r4, 7         # \ if the state flag isn't 7, just do original code
    bne skip            # /
    lbz r4, 0x14 (r9)   # \ get the selected page we stored
    lis r6, 0x8049      # |
    ori r6, r6, 0x6000  # | this is where selected page is normally stored
    subi r4, r4, 1      # | subtract 1, because we are telling it what page we are on, not what we want to change to
    stb r4, 0 (r6)      # / storing value here forces page to change on button press

    # this block here is also for forcing stage selection
    startStage:
    li r3, 0x100
    rlwinm. r0, r3, 0, 23, 23 # force register button press
    b %end%

    goToMyMusic:
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    li r4, 1           # |
    stw r4, 0 (r9)     # / if we pressed the button, set the flag indicating to go to My Music

    #li r4, 1            # \ set the mode we will jump to from My Music - 1 is VS, 2 is tourney, 3 is special versus
    stw r10, 0x18 (r9)   # / right now is always 1, this could be expanded to work with other modes
}

# additional hook to ensure button works on CSS (prevents a crash with MMU enabled)
HOOK @ $806b5780
{
    # check to ensure this only works in regular VS mode
    mr r9, r3   # store r3

    %getSceneManager()  # \ get scene manager
    mr r10, r3          # | place scene manager in r3
    lwz r3, 0x10 (r10)   # | load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqVsMelee" into r4
    ori r4, r4, 0x17E0  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings match, continue
    mr r3, r9           # | restore r3
    beq continue        # / proceed

    lwz r3, 0x10 (r10)   # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqSpMelee" into r4
    ori r4, r4, 0x17F8  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings match, continue
    beq continue        # / proceed

    lwz r3, 0x10 (r10)   # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)       # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqTraining" into r4
    ori r4, r4, 0x1870  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings don't match, skip
    beq continue        # | continue
    mr r3, r9           # | restore r3
    bne skip            # / skip

    continue:
    mr r3, r9           # \ store r3
    %getSceneManager()  # | get scene manager
    mr r8, r3           # | store scene manager in r8
    mr r3, r9           # | restore r3
    lwz r8, 0x0280 (r8) # |check we are on Main Menu sequence
    cmpwi r8, 1         # |
    beq skip            # / if we are, skip

    rlwinm. r0, r3, 0, button, button # if button is being pressed, treat that as a valid stage select button
    bne %end%

    # this block here is to force-select the stage after picking a song
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r4, 0 (r9)     # |
    cmpwi r4, 0        # | if state flag isn't 0, skip
    bne skip           # /
    lwz r4, 0x8 (r9)   # \ otherwise, get stored song ID
    cmpwi r4, 0        # | if song ID isn't 0, automatically start the stage
    bne startStage     # /

    skip:
    rlwinm. r0, r3, 0, 23, 23 # original line
    b %end%

    # this block here is also for forcing stage selection
    startStage:
    li r3, 0x100
    rlwinm. r0, r3, 0, 23, 23 # force register button press
    b %end%
}

# additional hook to ensure button works on CSS (prevents a crash with MMU enabled)
HOOK @ $806b589c
{
    # check to ensure this only works in regular VS mode
    mr r9, r3   # store r3

    %getSceneManager()  # \ get scene manager
    mr r10, r3          # | place scene manager in r3
    lwz r3, 0x10 (r10)   # | load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqVsMelee" into r4
    ori r4, r4, 0x17E0  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings match, continue
    mr r3, r9           # | restore r3
    beq continue        # / proceed

    lwz r3, 0x10 (r10)   # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqSpMelee" into r4
    ori r4, r4, 0x17F8  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings match, continue
    beq continue        # / proceed

    lwz r3, 0x10 (r10)   # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)       # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqTraining" into r4
    ori r4, r4, 0x1870  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings don't match, skip
    beq continue        # | continue
    mr r3, r9           # | restore r3
    bne skip            # / skip

    continue:
    mr r3, r9           # \ store r3
    %getSceneManager()  # | get scene manager
    mr r8, r3           # | store scene manager in r8
    mr r3, r9           # | restore r3
    lwz r8, 0x0280 (r8) # |check we are on Main Menu sequence
    cmpwi r8, 1         # |
    beq skip            # / if we are, skip

    rlwinm. r0, r3, 0, button, button # if button is being pressed, treat that as a valid stage select button
    bne %end%

    # this block here is to force-select the stage after picking a song
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r4, 0 (r9)     # |
    cmpwi r4, 0        # | if state flag isn't 0, skip
    bne skip           # /
    lwz r4, 0x8 (r9)   # \ otherwise, get stored song ID
    cmpwi r4, 0        # | if song ID isn't 0, automatically start the stage
    bne startStage     # /

    skip:
    rlwinm. r0, r3, 0, 23, 23 # original line
    b %end%

    # this block here is also for forcing stage selection
    startStage:
    li r3, 0x100
    rlwinm. r0, r3, 0, 23, 23 # force register button press
    b %end%
}

# This hook is used to get the address for muSelectStageTask and store it for later
HOOK @ $806b6178 # moveCursor
{
    lwz r3, 0x0200 (r30) # original instruction

    mr r10, r3  # store r3 in r10

    %getSceneManager()      # \ get scene manager
    mr r9, r3               # | store scene manager in r9
    
    lwz r3, 0x10 (r9)       # \ load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)          # / load address of currentSequence name into r3

    lis r4, 0x8070          # \ load address of string "sqMenuMain" into r4
    ori r4, r4, 0x17B0      # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0             # \ if strings match, skip
    mr r3, r10              # | restore r3
    beq %end%               # / skip

    mr r3, r10              # \ restore r3
    lwz r10, 0x0280 (r9)    # | check we are on Main Menu sequence
    cmpwi r10, 1            # |
    beq %end%               # / if we are, skip

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r10, 0x1C (r9)  # | 
    cmpwi r10, 0        # | if we have already stored the address, just skip
    bne %end%           # /

    stw r30, 0x1C (r9)  # store muSelectStageTask
}

# this hook makes it so that turn order is kept intact when stage selection option is set to taking turns
HOOK @ $80055584 # gmSetRuleSelStage - when we set which player is in control
{
    lis r8, 0x8000     # \
    ori r8, r8, 0x2810 # |
    lwz r8, 0 (r8)     # | get flag
    cmpwi r8, 7        # | if flag is 7 (coming from My Music), skip changing which player is in control
    beq %end%          # /

    stb r7, 0 (r5) # original line, sets which player is in control
}

# macro for the code that sends us to My Music
.macro goToMyMusic(<register>,<case>)
{
    lwz r0, 0x0008 (<register>) # original code

    cmpwi r0, 0x7 # if we are not changing stages, check if we're returning from My Music
    bne %end%

    %getSceneManager()  # \ get scene manager
    lwz r9, 0x0284 (r3) # | offset 284 from scene manager stores stage builder/regular stage
    cmpwi r9, 3         # | 3 means stage builder, 1 means regular
    bne flagCheck       # / if it's not a stage builder stage, go to flag check
    
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # / get stored values

    li r7, 0            # \ reset all stored values to 0
    stw r7, 0 (r9)      # |
    stw r7, 0x8 (r9)    # |
    stw r7, 0xC (r9)    # |
    stw r7, 0x10 (r9)   # |
    stw r7, 0x14 (r9)   # |
    stw r7, 0x18 (r9)   # |
    stw r7, 0x1C (r9)   # |
    stw r7, 0x20 (r9)   # |
    stw r7, 0x24 (r9)   # |
    stw r7, 0x28 (r9)   # |
    stw r7, 0x2C (r9)   # |
    sth r7, 0x30 (r9)   # /
    b %end%             # go to end

    flagCheck:
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r3, 0 (r9)     # | get flag
    cmpwi r3, 1        # | if flag isn't 1 (going to My Music), jump to end
    bne %end%          # /

    lwz r4, 0x1C (r9)   # \ load muSelectStageTask
    lwz r4, 0x200 (r4)  # | offset 200 contains cursor information
    lfs f4, 0x3C (r4)   # | offset to X position
    stfs f4, 0xC (r9)   # / store cursor X position

    lfs f4, 0x40 (r4)   # \ offset to y position
    stfs f4, 0x10 (r9)  # / store cursor Y position

    lis r4, 0x8049	    # \
    ori r4, r4, 0x6000	# | address where the SSS page is
    lbz r4, 0 (r4)	    # |
    stb r4, 0x14 (r9)	# / store current page

    # store hidden alts if any were selected
    %storeHiddenAlt(0x0b40, 0x2830)
    %storeHiddenAlt(0x0b9C, 0x2834)
    %storeHiddenAlt(0x0bf8, 0x2838)
    %storeHiddenAlt(0x0c54, 0x283C)

    # if we're on SSS and flag is 1, go to main menu
    li r0, <case> # set switch/case to pick main menu option
}

# this hook makes it so our button sends us to My Music instead of starting the match - VS
HOOK @ $806dcb50 # hook for transitioning to a match
{
    %goToMyMusic(r15, 0x10)
}

# this hook makes it so our button sends us to My Music instead of starting the match - Special
HOOK @ $806deaac # hook for transitioning to a match
{
    %goToMyMusic(r30, 0x10)
}

# this hook makes it so our button sends us to My Music instead of starting the match - Training
HOOK @ $806f1574 # hook for transitioning to a match
{
    %goToMyMusic(r15, 0xb)
}

# This hook is necessary to make training mode respect ASL selection when going to My Music
HOOK @ $806f1914 # hook when transitioning to a training match
{
    lis r6, 0x8000      # \
    ori r6, r6, 0x2810  # |
    lwz r6, 0 (r6)      # | get flag
    cmpwi r6, 1         # | if flag isn't 1 (going to My Music), just run original code
    bne done            # /

    li r5, 1    # set parameter 3 for the setNextSequence function to 1 (go to versus menu instead of solo), because for some reason this fixes ASL issues
    b %end%

    done:
    li r5, 0xC  # original code
}

# this hook makes it so we get warped to My Music instead of just the main menu
HOOK @ $806cc058 # The instruction for when we go to main menu
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r4, 0 (r4)      # | get flag
    cmpwi r4, 1         # | if flag isn't 1 (going to My Music), just run original code
    bne done            # /

    li r3, 12 # otherwise, force it to go to My Music
    
    done:
    stw	r3, 0x03D0 (r31) # original code
}

# this hook makes it so that the icons, thumbnails, and other elements don't display when we go to My Music
HOOK @ $806b10d0 # when we call dispPage in muSelectStageTask:initProcWithScreen
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r4, 0 (r4)      # | get flag
    cmpwi r4, 1         # | if flag isn't 1 (going to My Music), just run original code
    bne done            # /

    lis r12, 0x806b     # jump to address after dispPage call
    ori r12, r12 0x10dc
    mtctr r12
    bctr

    done:
    lwz r4, 0x0228 (r26) # original code
}

# this hook makes the tracklist open and hides elements when we go to My Music
HOOK @ $8117de68 # My Music function that runs every frame
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r4, 0 (r4)      # | get flag
    cmpwi r4, 1         # |
    bne done            # / if flag isn't 1, just do original code

    # lis r8, 0x8150
    # ori r8, r8, 0x9ea0 # store address used for cursor and SSS icon
	
    mr r9, r3

    %getSceneManager()      # \ get scene manager
    lis r4, 0x806A          # |
    ori r4, r4 0xDBE4       # | store address of string "muMenuMain" in r4
    lis r12, 0x8002         # | call searchScene
    ori r12, r12, 0xd3f4    # |
    mtctr r12               # |
    bctrl                   # | r3 is now muMenuMain
    lwz r8, 0x38c (r3)      # | offset 0x38c of muMenuMain is muProcOptSong
    lwz r8, 0x694 (r8)      # / offset 0x694 of muProcOptSong is muSelectStageTask

    lwz r3, 0x0050 (r8)   # \ hides cursor
    lwz r4, 0x0200 (r8)   # |
    lwz r12, 0 (r3)       # |
    lwz r4, 0x0010 (r4)   # |
    lwz r12, 0x003C (r12) # |
    mtctr r12             # |
    bctrl                 # /

    lwz r3, 0x0214 (r8)    # \ hides highlights around the SSS icon
    lwz r4, 0x0204 (r8)    # |
    lwz r12, 0 (r3)        # |
    lwz r4, 0x0010 (r4)    # |
    lwz r12, 0x003C (r12)  # |
    mtctr r12              # |
    bctrl                  # /

    lis r3, 0x0000
    ori r3, r3, 0x0003
    stw r3, 0x0224 (r8) # flip the flag to disable cursor

    lis r3, 0x0000
    ori r3, r3, 0x0001
    stw r3, 0x0274 (r8) # flip flag to open track list

    lis r3, 0x8000     # \
    ori r3, r3, 0x2810 # |
    li r4, 2           # |
    stw r4, 0 (r3)     # / set our flag to 2, meaning My Music is opened

    mr r3, r9 # restore r3

    done:
    lwz r0, 0x0664 (r3) # original code
}

# this hook forces My Music to open the correct tracklist
HOOK @ $8117defc # manipulate this instruction so that the correct track list is displayed
{
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # /

    # store ASL input for replays
    lis r7, 0x800C          # \ Get ASL input
    lhz r7, -0x615E (r7)    # |
    sth r7, 0x30 (r9)       # / store it for later

    lis r7, 0x805a      # \ load the chosen stage ID instead of a default
    lwz r7, 0xE0 (r7)   # | 0x805a00e0 - GameGlobal
    lwz r7, 0x14 (r7)   # | offset 0x14 - gmSelStageData
    lhz r7, 0x22 (r7)   # | offset 0x22 - stage ID
    b %end%             # /

    done:
    li r7, 66 # original line
}

# this hook makes our button work on the track list
HOOK @ $8117f030 # when checking what button is pressed with tracklist open
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r7, 0 (r4)      # | get flag
    cmpwi r7, 2         # |
    bne done            # / if flag isn't 2 (on My Music from SSS)

    rlwinm. r0, r29, 0, selectButton, selectButton # if button is being pressed, treat that as a valid select button
    bne buttonPressed

    done:
    rlwinm. r0, r29, 0, 22, 22 # otherwise, just do original code
    b %end%

    buttonPressed:
    li r7, 3
    stw r7, 0 (r4) # set flag to 3
    cmpwi r0, 1 # force the check to fail, so it counts as pressing A
}

# this hook stores the chosen song ID when we choose a song
HOOK @ $8117f07c # when playing a song on my music
{
    li r6, 1 # original line

    lis r8, 0x8000     # \
    ori r8, r8, 0x2810 # |
    lwz r7, 0 (r8)     # | get flag
    cmpwi r7, 3        # |
    bne %end%          # / if flag isn't 3, skip

    li r7, 4
    stw r7, 0 (r8) # set flag to 4, meaning we are returning to SSS

    lis r8, 0x8000     # \ storing song ID for stage to use
    ori r8, r8, 0x2810 # | address where we will store song ID
    stw r30, 0x8 (r8)  # / set stored song ID to the one we are playing - r30 stores current song ID at this point
}

# this hook is to make it so pressing our button will keep the song playing even if it is already playing
HOOK @ $8117f03c # when checking if a song is already playing on My Music when we hit A
{
    lis r8, 0x8000      # \
    ori r8, r8, 0x2810  # |
    lwz r7, 0 (r8)      # | get flag
    cmpwi r7, 3         # |
    bne done            # / if flag isn't 3, skip
    li r0, 0 # force to count as not playing

    done:
    cmpwi r0, 0 # original code
}

# this hook is to ensure that pressing our button will trigger the song selection
HOOK @ $8117f060 # another when we press A on track list
{
    lis r8, 0x8000      # \
    ori r8, r8, 0x2810  # |
    lwz r7, 0 (r8)      # | get flag
    cmpwi r7, 3         # |
    bne done            # / if flag isn't 3, skip
    li r0, 0 # force to count as not playing

    done:
    cmplw r30, r0 # original line
}

# this hook is so that when we back out, we'll return to SSS
HOOK @ $8117e670 # exit/[muProcOptSong] (when exiting My Music)
{
    lis r8, 0x8000     		# \
    ori r8, r8, 0x2810 		# |
    lwz r7, 0 (r8)     		# | get flag
    cmpwi r7, 4        		# |
    bne done			    # / if flag isn't 4, skip

    li r7, 5
    stw r7, 0 (r8) 		# set flag to 5, returning from My Music

    # Old scene change code, no longer used, could be useful reference
    #lis r9, 0x805b		    # \ tell scene manager to change scenes to vs
    #ori r9, r9, 0x5030		# | load scene manager into r9
    #li r10, 0x0		    # |
    #stb r10, 0x002C (r9)	# |
    #stb r10, 0x002D (r9)	# |
    #stb r10, 0x002E (r9)	# |
    #stb r10, 0x002F (r9) 	# | set some flags that need to be 0
    #lis r9, 0x805b		    # | 
    #ori r9, r9, 0x8ba0		# | load scene manager into r9
    #li r10, 0x1		    # |
    #stw r10, 0x0284 (r9) 	# | this flag determines what screen we go to from main - 0x1 is VS
    #li r10, 0x2		    # |
    #stw r10, 0x0288 (r9) 	# / set flag used by scene manager to 2, triggering scene change

    mr r10, r3              # \ change scenes - store r3 first
    %getSceneManager()      # | get scene manager
    mr r9, r3               # | put scene manager in r9
    mr r3, r10              # | restore r3
    lwz r9, 0x4 (r9)        # | this offset gives us the flag to determine what scene to change to
    lwz r10, 0x18 (r8)      # | load the scene number we stored - right now is always 0x1
    stw r10, 0x0AB0 (r9)    # /

    done:
    mr r31, r3 			# original line
}

# this hook is to force the tracklist to close when an option is chosen
HOOK @ $8117e4b0 # check if B is pressed when My Music tracklist is open
{
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r8, 0 (r9)      # | get flag
    cmpwi r8, 4         # |
    bne done            # / if flag isn't 4, skip

    li r0, 0x20 # count as we are pressing B
    cmpwi r0, 0
    b %end%

    done:
    rlwinm. r0, r3, 0, 26, 26 # original line
}

# this hook is to ensure we back all the way out to SSS when B is pressed, and to play the correct sound based on the button pressed
HOOK @ $8117e4e4 # when setting the sound ID for the button pressed while My Music tracklist is open
{
    li r4, 2            # original line, sets sound ID to backing out sound

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r8, 0 (r9)      # | get flag
    cmpwi r8, 2         # |
    bne nextCheck       # / if flag isn't 2 (pressed B), check if it's 4

    li r8, 4
    stw r8, 0 (r9)      # | set flag to 4

    # clear stored ASL input
    li r8, 0
    sth r8, 0x30 (r9)

    # This fixes an issue where looking at the songs for a stage alt would force that alt to load when the stage was selected
    li r9, 0            # \
    lis r8, 0x8053      # |
    ori r8, r8, 0xe000  # | this address stores the chosen stage ID, which is used to determine if we should reload or not
    sth r9, 0x0FB8 (r8) # / by setting it to 0, the game will see no stage as loaded, and reload the file

    b %end%

    nextCheck:
    cmpwi r8, 4     # \
    bne %end%       # | if flag isn't 4 (pressed custom button), skip
    li r4, 1        # / otherwise, set sound ID to confirmation sound (we selected a song instead of backing out)
}

# this hook makes sure we go back to SSS from My Music
HOOK @ $806b5670 # check if B is pressed on My Music screen
{
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r9, 0 (r9)      # | get flag
    cmpwi r9, 4         # |
    bne done            # / if flag isn't 4, just do original code

    # this snippet makes it so we pause the frames while we return to SSS
    lis r3, 0x805A      # \ get gfApplication
    lwz r3, -0x54 (r3)  # | gfApplication stored in r3
    addi r3, r3, 0xD0   # | gfApplication + 0xD0 = gfKeepFrameBuffer stored in r3
    lis r12, 0x8002     # | call startKeepFrameBuffer (mislabled in symbol map)
    ori r12, r12 0x4e20 # |
    mtctr r12           # |
    bctrl               # /

    li r0, 0x200 # count as we are pressing B
    cmpwi r0, 0
    b %end%

    done:
    rlwinm. r0, r0, 0, 22, 22 # original line
}

# this hook makes it so the cursor doesn't display for a split second when backing out of My Music
HOOK @ $806b4290 # where we restore the cursor in selectingProc/[muSelectStageTask]
{
    lwz r3, 0x0050 (r27) # original line

    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r4, 0 (r4)      # | get flag
    cmpwi r4, 4         # |
    bne %end%           # / if flag is not 4, just do original code

    lis r12, 0x806b     # jump to address after Insert call
    ori r12, r12, 0x42b0
    mtctr r12
    bctr
}

# these hooks make it so we don't play a second backing out sound when we back out from music selection
HOOK @ $806b567c # loading sound ID in buttonProc:muSelectStageTask (for My Music)
{
    li r4, 2            # original lines

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r9, 0 (r9)      # | get flag
    cmpwi r9, 4         # | check that flag is 4
    bne %end%           # / if not, end

    lis r12, 0x806b     # jump to address after playSE call
    ori r12, r12 0x5698
    mtctr r12
    bctr
}

# same as above, but for process:muMenuMain
HOOK @ $806cea08
{
    li r4, 2            # original lines

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r9, 0 (r9)      # | get flag
    cmpwi r9, 4         # | check that flag is 4
    bne %end%           # / if not, end

    lis r12, 0x806c     # jump to address after playSE call
    ori r12, r12 0xea24
    mtctr r12
    bctr
}

# this hook makes it so we play a normal confirmation sound instead of the stage select sound when opening the music select
HOOK @ $806b5cec # loading sound ID in buttonProc:muSelectStageTask (for SSS)
{
    li r4, 19 # original line

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r9, 0 (r9)      # | get flag
    cmpwi r9, 1         # | check that flag is 1
    bne %end%           # / if not, end

    # this snippet makes it so we pause the frames while we go to My Music, so that the "Ready to Fight" text doesn't display
    mr r9, r3
    lis r3, 0x805A      # \ get gfApplication
    lwz r3, -0x54 (r3)  # | gfApplication stored in r3
    addi r3, r3, 0xD0   # | gfApplication + 0xD0 = gfKeepFrameBuffer stored in r3
    lis r12, 0x8002     # | call startKeepScreen (mislabled in symbol map)
    ori r12, r12 0x4e20 # |
    mtctr r12           # |
    bctrl               # /
    mr r3, r9

    li r4, 1 # play normal confirm sound instead
}

# this hook makes it so we don't play the audience cheer when opening the music select
HOOK @ $806b46bc # loading sound ID in selectingProc:muSelectStageTask (for SSS)
{
    li r4, 22 # original line

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r9, 0 (r9)      # | get flag
    cmpwi r9, 1         # | check that flag is 1
    bne %end%           # / if not, end

    lis r12, 0x806b     # jump to address after playSE call
    ori r12, r12, 0x46d4
    mtctr r12
    bctr
}

# macro for the code that sends us to My Music
.macro returnFromMyMusic(<register1>,<register2>)
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)     # | get flag
    cmpwi r10, 5        # | if flag isn't 5 (returning from My Music), jump to end
    bne done            # /

    # otherwise, load SSS
    li <register1>, 0x5

    li r10, 6           # \
    stw r10, 0 (r5)     # / set our flag to 6

    mr r10, r3              # \ store r3
    %getSceneManager()      # | get scene manager
    mr r5, r3               # | put scene manager in r5
    mr r3, r10              # | restore r3
    li r10, 1               # | set flag to 1
    stw r10, 0x0284 (r5)    # / setting this flag to 1 will make it go to SSS

    done:
    stw <register1>, 0xc (<register2>) # original line
}

# this hook makes it so we go to SSS after backing out from My Music - VS
HOOK @ $806dcbc8 # when transitioning to VS, we set this to tell the game to go to SSS after mem change
{
    %returnFromMyMusic(r24, r15)
}

# this hook makes it so we go to SSS after backing out from My Music - Special
HOOK @ $806deb64 # when transitioning to Special, we set this to tell the game to go to SSS after mem change
{
    %returnFromMyMusic(r21, r30)
}

# this hook makes it so we go to SSS after backing out from My Music - Training
HOOK @ $806f15ac # when transitioning to Training, we set this to tell the game to go to SSS after mem change
{
    %returnFromMyMusic(r29, r15)
}

# this hook is used to ensure addresses correctly indicate we're on SSS after returning from My Music
HOOK @ $806be64c # runs every frame on process/[scMemoryChange]
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)     # | get flag
    cmpwi r10, 6        # | if flag isn't 6, go to end
    bne done            # /

    li r10, 7           # \
    stw r10, 0 (r5)     # / set our flag to 7 - set pages

    li r0, 1            # this flag indicates what screen we're on after this, 1 in this case means SSS
    b %end%

    done:
    li r0, 0 # original line
}

# this hook makes the game think we are changing pages when returning to SSS from My Music, and also retrieves hidden alts
HOOK @ $806b58c8 # every frame, if we pressed a button, check that we were pressing page button on SSS
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)
    cmpwi r10, 7        # if flag is not 7, go to end
    bne done

    # if any hidden alts were selected, retrieve them
    %retrieveHiddenAlt(0x0b40, 0x2830)
    %retrieveHiddenAlt(0x0b9C, 0x2834)
    %retrieveHiddenAlt(0x0bf8, 0x2838)
    %retrieveHiddenAlt(0x0c54, 0x283C)

    lwz r10, 0x14 (r5)  # | get stored page

    li r10, 0           # \
    stw r10, 0x14 (r5)  # / set selected page back to 0
    
    li r0, 5        # force button to count as pressed so we change pages
    
    done:
    cmplwi r0, 7 # original code line
}

# this hook makes it so the page change sound doesn't play when returning to SSS from My Music
HOOK @ $806b5a24 # when setting the sound ID for the page change sound
{
    li r4, 35           # original line

    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r6, 0 (r5)
    cmpwi r6, 7         # if flag is not 7, go to end
    bne %end%

    li r6, 0
    stw r6, 0 (r5)      # set flag to 0 - we are done

    lis r12, 0x806b     # jump to address after playSE call
    ori r12, r12, 0x5a3c
    mtctr r12
    bctr
}

# this hook checks if we are changing pages, and if so, doesn't set the flag to go to music select
HOOK @ $806b58d0 # just after checking if we are changing pages
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)
    cmpwi r10, 1        # if flag is not 1, go to end
    bne done

    li r10, 0           # \
    stw r10, 0 (r5)     # / set our flag to 0 - we changed pages, didn't select a stage

    done:
    lis r3, 0x806C # original line
}

# this hook is used to restore the cursor position when returning to SSS from My Music
HOOK @ $806c8e80 # runs every frame on SSS
{
    lis r9, 0x8000      # \ get muSelectStageTask
    ori r9, r9, 0x2810  # |
    lwz r8, 0x1C (r9)   # |
    cmpwi r8, 0         # |
    beq done            # | if we don't have an address stored yet, just skip
    lwz r8, 0x250 (r8)  # | offset 250 contains the frame count
    cmpwi r8, 10        # |
    bne done            # / only perform new code if SSS has been up for 10 frames

    lwz r8, 0x1C (r9)   # \ get muSelectStageTask
    lwz r8, 0x200 (r8)  # | offset 200 is cursor stuff
    lwz r10, 0xC (r9)   # | our x address
    cmpwi r10, 0        # |
    beq checkY          # / if X address is not set, check Y

    lfs f10, 0xC (r9)   # \
    stfs f10, 0x3C (r8) # | set cursor X to stored X value
    li r10, 0           # |
    stw r10, 0xC (r9)   # / set stored X to 0

    checkY:
    lwz r10, 0x10 (r9)  # \
    cmpwi r10, 0        # | if Y address is not set, original code
    beq done            # /

    lfs f10, 0x10 (r9)  # \
    stfs f10, 0x40 (r8) # | set cursor Y to stored Y value
    li r10, 0           # |
    stw r10, 0x10 (r9)  # / set stored Y to 0

    done:
    mr r31, r3 # original code
}

# this hook forces the song ID to be the one we selected
HOOK @ $8010f9e4 # hook just before calling setBgmId when loading stage
{
    lis r10, 0x8000         # \
    ori r10, r10, 0x2810    # |
    lwz r7, 0x8 (r10)       # | get song ID
    cmpwi r7, 0             # |
    beq done                # / if stored song ID is set to 0, jump to original line

    mr r6, r7               # set r6 (param4 for setBgmId) to song ID, which will force it to be picked
    li r7, 0
    stw r7, 0x8 (r10)       # set stored song ID to 0
    stw r7, 0x1C (r10)      # set stored address for muSelectStageTask to 0 as well, since we are done

    done:
    mr r4, r28 # original line
}

# this hook ensures the correct ASL input is used for replays
HOOK @ $80764f10 # just before checking the ASL input for replays
{
    stfs f1, 0x0038 (r30) # original line

    lis r9, 0x8000           # \
    ori r9, r9, 0x2810       # |
    lhz r10, 0x30 (r9)       # | get stored ASL input
    cmpwi r10, 0             # |
    beq %end%                # / if no stored ASL input, end

    # set stage alt correctly for replays
    lis r8, 0x800C           # \ store ASL input at 800B9EA2
    sth r10, -0x615E (r8)    # /

    li r10, 0               # clear stored ASL input
    sth r10, 0x30 (r9)
}

# this hook resets all of our stored values when we return to the main menu
HOOK @ $806dce4c # hook in sqVsMelee/setNext when we are changing to main menu
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r6, 0 (r5)      # |
    cmpwi r6, 1         # | if flag is 1 (going to My Music), jump to end
    beq done            # /

    li r7, 0            # \ reset all stored values to 0
    stw r7, 0 (r5)      # |
    stw r7, 0x8 (r5)    # |
    stw r7, 0xC (r5)    # |
    stw r7, 0x10 (r5)   # |
    stw r7, 0x14 (r5)   # |
    stw r7, 0x18 (r5)   # |
    stw r7, 0x1C (r5)   # |
    stw r7, 0x20 (r5)   # |
    stw r7, 0x24 (r5)   # |
    stw r7, 0x28 (r5)   # |
    stw r7, 0x2C (r5)   # |
    sth r7, 0x30 (r5)   # /

    done:
    stb	r30, 0x0448 (r3) # original line
}

# fixes the code not working on expansion stages if build doesn't have salty runback fix
op NOP @ $8010F9C0

####################################################
CSS Selections Preserved in Special Versus [Squidgy]
####################################################
op nop @ $806de9e8 # nop so we always enter the if

# needs this so rules settings don't break
HOOK @ $806de9f0 # set all necessary values
{
    stw	r0, 0x0008 (r31) # original line
    stw r0, 0x11 (r31)
}

op nop @ $806de9f4 # nop so we still set up SSS stuff, normally it would skip it when we go in the if

# this sets up the SSS stuff
HOOK @ $806dea1c
{
    stw r3, -0x5B08 (r4) # original line, sets SSS stuff

    lis r12, 0x806d     # jump to address to end function
    ori r12, r12 0xea34
    mtctr r12
    bctr
}

##############################################
CSS Selections Preserved in Training [Squidgy]
##############################################
op b 0x24 @ $806f14d8