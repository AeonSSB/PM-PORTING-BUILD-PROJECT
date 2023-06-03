##################################################
Allow selection of same Costume ID [ilikepizza107]
##################################################
op li r0, 0 @ $8069A2C0 # for increasing costume IDs
op li r0, 0 @ $8069A3D0 # for decreasing costume IDs
op nop @ $80696FE0 # when initally hovering over the character
op nop @ $8069841C # ensure it stays at the same ID when switching from player -> CPU -> None

####################################################################
Allow character shading in Versus Matches [ilikepizza107, QuickLava]
####################################################################
op li r3, 1 @ $806d1c68