####################################################
Green Team is Yellow Team [ilikepizza107, QuickLava]
####################################################
word 0x00010200 @ $805A21F0   # search for Yellow costumes, not Green ones!
word 0x00010200 @ $806A0DA8   # choose yellow costumes in-game!
word 0x00010200 @ $806A0EAC   # CLR0 UI Elements, excluding the hand
word 0x00010200 @ $806A0EE0   # "?" texture on the CSS for Random uses Yellow, not Green!
word 0x01020300 @ $806A1004   # hand
word 0x02070000 @ $805A23AC   # in-battle UI (requires modified CLR0 colors in info.pac, specifrically InfArrow_TopN_0, InfFace_TopN__0, InfMark_TopN__0, and InfPlynm_TopN__0)


