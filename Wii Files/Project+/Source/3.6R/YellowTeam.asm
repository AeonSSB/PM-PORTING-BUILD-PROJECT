######################################################
Add Yellow Team [ilikepizza107, QuickLava, Eon]

Requires Team Coloured Shields V2 from RSBE01 to 
be removed, as well as edited info.pac + STGRESULT.pac
CLR0s, and at least one yellow costume per character
######################################################
#Yellow Team
###TODO###
#Fix victory screen - crashes and then wouldnt refer to them right etc
#UI element has to be added on top of other team flags instead of replacing, file stuff i dont touch that idk what im doing
#probably alternate modes break since i only fixed stock counting end condition to count team 4

#fourth team colour things
byte 0x02 @ $805A21F3 # search for Yellow costumes
byte 0x02 @ $806A0DAB # choose yellow costumes in-game!
byte 0x02 @ $806A0EAF # CLR0 UI Elements, excluding the hand
byte 0x02 @ $806A0EE3 # "?" texture on the CSS for Random uses Yellow
byte 0x03 @ $806A1007 # hand
byte[2] 0x6, 0x8 @ $806A0F42 #flagMotionData, second doesnt get handled too well coz uses team as index too
byte[2] 0x2, 0x7 @ $805A23AE #in battle ui
#actually allow team 4 to be chosen
op cmpwi r29, 0x4 @ $806998B8   #inc team
op li r29, 3 @ $80699c24        #dec team


#make it so stock counting actually uses team 4 correctly
CODE @ $80954D4C 
{
    stwu r1, -0x70(r1)
    mflr r0 
    stw r0, 0x74(r1)
    stw r31, 0x6C(r1)
}
op addi r5, r1, 0x20 @ $809550AC
CODE @ $80955168 
{
    lwz r0, 0x74(r1)
    lwz r31, 0x6C(r1)
    mtlr r0
    addi r1, r1, 0x70
}
#actually use the extra bytes of space
HOOK @ $80957dd4
{
    stw r0, 0x8(r6) # original
    stw r0, 0xC(r5) # \use the extra word on each for fourth team 
    stw r0, 0xC(r6) # /
}

Team Coloured Shields Proper V2 + yellow team [ds22, Eon]
HOOK @ $8081DEEC
{
    cmpwi r23, 2
    beq teamGreen
    cmpwi r23, 3
    beq teamYellow
    mr r4, r23
    b %end%
teamGreen:
    li r4, 3
    b %end%
teamYellow:
    li r4, 2
}
op mr r4, r23 @ $8081DEF4

YELLOW TEAM on victory screen
HOOK @ $800e7c84
{
    cmpwi r0, 0xC
    beq yellow
    lwzx r5, r5, r0
    b %end%
yellow:
    bl data
    mflr r5
    addi r5, r5, 0x14
data:
    blrl
}
    .GOTO->skip
    string "YELLOW TEAM"
skip:
    .RESET

HOOK @ $800e98f4
{
    stb r0, 0x16(r1)
    li r0, 0 #this is where i would load yellow teams place, if they had one
    stb r0, 0x17(r1)
}    