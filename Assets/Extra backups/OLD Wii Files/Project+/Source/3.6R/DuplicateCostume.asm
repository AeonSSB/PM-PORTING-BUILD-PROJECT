##################################################
Allow selection of same Costume ID [QuickLava]
##################################################
op cmpwi r29, 0x7FFF @ $80696FD8
op cmpwi r5, 0x7FFF @ $80698414
op cmpwi r27, 0x7FFF @ $806984B4
op cmpwi r26, 0x7FFF @ $8069A3C8
op cmpwi r26, 0x7FFF @ $8069A2B8
op blr @ $80684DCC
op li r3, 1 @ $806D1C68

####################################################################
Allow character shading in Versus Matches [ilikepizza107, QuickLava]
####################################################################
op li r3, 1 @ $806d1c68