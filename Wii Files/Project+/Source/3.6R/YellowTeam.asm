######################################################
Green Team is Yellow Team [ilikepizza107, QuickLava]

Requires Team Coloured Shields V2 from RSBE01 to 
be removed, as well as edited info.pac + STGRESULT.pac
CLR0s, and at least one yellow costume per character
######################################################
word 0x00010200 @ $805A21F0   # search for Yellow costumes, not Green ones!
word 0x00010200 @ $806A0DA8   # choose yellow costumes in-game!
word 0x00010200 @ $806A0EAC   # CLR0 UI Elements, excluding the hand
word 0x00010200 @ $806A0EE0   # "?" texture on the CSS for Random uses Yellow, not Green!
word 0x01020300 @ $806A1004   # hand
word 0x02070000 @ $805A23AC   # in-battle UI (requires modified CLR0 colors in info.pac, specifically InfArrow_TopN_0, InfFace_TopN__0, InfMark_TopN__0, and InfPlynm_TopN__0)
op mr r4, r23 @ $8081DEEC     # \
op mr r4, r23 @ $8081DEF4     # / Yellow shields and death plumes
word 0x59454C4C @ $8045B62C   # \
word 0x4F572054 @ $8045B630   #  | YELLOW TEAM on the results screen
word 0x45414D00 @ $8045B634   # / 