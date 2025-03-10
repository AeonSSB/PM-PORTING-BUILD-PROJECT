Stage Select Screen Table Data

.BA<-TABLE_STAGES
.BA->$80495D00
.BA<-TABLE_1
.BA->$80495D04
.BA<-TABLE_2
.BA->$80495D08
.BA<-TABLE_3
.BA->$80495D0C
.BA<-TABLE_4
.BA->$80495D10
.BA<-TABLE_5
.BA->$80495D14
.GOTO->SkipStageTables

TABLE_1:
	byte[20] |
0x0A, | # Metroid Lab
0x15, | # Wario Land
0x02, | # Delfino's Secret
0x05, | # Bowser's Castle
0x58, | # Golden Temple
0x67, | # Dead Line
0x04, | # Metal Cavern
0x1C, | # Green Hill Zone
0x23, | # Dream Land
0x00, | # Battlefield
0x1A, | # Smashville
0x28, | # Pokemon Stadium 2
0x01, | # Final Destination
0x4E, | # Tiny FD
0x1E, | # Sky Sanctuary Zone
0x20, | # Yoshi's Story
0x4F, | # Rumble Falls
0x50, | # Temple of Time
0x18, | # Fountain of Dreams
0x21  | # Frigate Husk

TABLE_2:
	byte[30] |
0x3D, | # Delfino Plaza
0x03, | # Luigi's Mansion
0x3E, | # Mushroomy Kingdom
0x4D, | # Bowser's Castle (PM)
0x2D, | # Mario Circuit
0x07, | # Rumble Falls (Brawl)
0x3F, | # Bridge of Eldin
0x08, | # Pirate Ship
0x40, | # Skyloft
0x35, | # Norfair
0x0B, | # Frigate Orpheon
0x0C, | # Yoshi's Island (Brawl)
0x0D, | # Halberd
0x0E, | # Lylat Cruise
0x41, | # Pokemon Stadium 2 (Brawl)
0x10, | # Spear Pillar
0x11, | # Port Town Aero Dive
0x14, | # Castle Siege
0x39, | # WarioWare, Inc.
0x16, | # Distant Planet
0x42, | # New Pork City
0x12, | # Summit
0x17, | # Skyworld
0x43, | # 75m
0x44, | # Mario Bros.
0x13, | # Flat Zone 2
0x1D, | # PictoChat
0x2F, | # Hanenbow
0x1B, | # Shadow Moses Island
0x45  | # Green Hill Zone (Brawl)

TABLE_3:
	byte[30] |
0x24, | # Peach's Castle (64)
0x06, | # Kongo Jungle
0x09, | # Hyrule Castle
0x46, | # Super Happy Tree
0x47, | # Sector Z
0x2E, | # Peach's Castle (Melee)
0x34, | # Kongo Falls
0x30, | # Great Bay
0x31, | # Yoshi's Island (Melee)
0x25, | # Corneria
0x3B, | # Rainbow Cruise
0x33, | # Jungle Japes
0x1F, | # Temple
0x4B, | # Green Greens
0x49, | # Venom
0x4A, | # Brinstar
0x22, | # Onett
0x4C, | # Mute City
0x48, | # Pokemon Stadium
0x3A, | # Mushroom Kingdom (Melee)
0x32, | # Brinstar Depths
0x19, | # Fourside
0x26, | # Big Blue
0x3C, | # Poke Floats
0x36, | # Mushroom Kingdom II
0x27, | # Planet Zebes
0x37, | # Icicle Mountain
0x2C, | # Flat Zone
0x0F, | # Saffron City
0x38  | # Mushroom Kingdom (64)

TABLE_4:
	byte[28] |
0x51, | # Metal Cavern (64)
0x52, | # Kingdom Adventure
0x53, | # Subspace
0x54, | # Bob-Omb Battlefield
0x55, | # Mushroom Gorge
0x56, | # Minecart Madness
0x57, | # Oil Drum Alley
0x59, | # Crateria
0x5A, | # Yoshi's Cookie
0x5B, | # Yoshi's Story (Beta)
0x5C, | # Cookie Country
0x5D, | # White Wafers
0x5E, | # Sky Islands
0x5F, | # Sky Temple
0x60, | # Another Dimension
0x61, | # Planet Papetoon
0x62, | # Sprout Tower
0x63, | # Poke Floats 2
0x64, | # Aeropolis
0x65, | # Wario's Castle
0x66, | # Waluigi Land
0x68, | # Radical Highway
0x69, | # Dracula's Castle
0x6A, | # Spiral Mountain
0x6B, | # Clanker's Cavern
0x6C, | # Venus Lighthouse
0x6D, | # Lunar Horizon
0x2B  | # Training Room

TABLE_5:	# Unused

TABLE_STAGES:
# Table of icon<->stage slot associations
half[110] |	# Stage Count + 2
| # OLD SLOTS
0x0101, 0x0202, 0x0303, 0x0404, | # Battlefield, Final Destination, Delfino's Secret, Luigi's Mansion
0x0505, 0x0606, 0x0707, 0x0808, | # Metal Cavern, Bowser's Castle, Kongo Jungle, Rumble Falls (Brawl)
0x0909, 0x330A, 0x492C, 0x0C0C, | # Pirate Ship, Hyrule Castle, Metroid Lab, Frigate Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410, | # Yoshi's Island (Brawl), Halberd, Lylat Cruise, Saffron City
0x1511, 0x1612, 0x1713, 0x1814, | # Spear Pillar, Port Town Aero Dive, Summit, Flat Zone 2
0x1915, 0x1C16, 0x1D17, 0x1E18, | # Castle Siege, Wario Land, Distant Planet, Skyworld
0x1F19, 0x201A, 0x211B, 0x221C, | # Fountain of Dreams, Fourside, Smashville, Shadow Moses Island
0x231D, 0x241E, 0x4326, 0x2932, | # Green Hill Zone, PictoChat, Sky Sanctuary, Temple
0x2A33, 0x816F, 0x2C35, 0x2D36, | # Yoshi's Story, Frigate Husk, Onett, Dream Land
0x2F37, 0x3038, 0x3139, 0x323A, | # Peach's Castle (64), Corneria, Big Blue, Planet Zebes
0x2E3B, 0xFF64, 0xFF64, 0x373C, | # Pokemon Stadium 2, NOTHING, NOTHING, Training Room
| # NEW SLOTS
0x4023, 0x4124, 0x4225, 0x251F, | # Flat Zone, Mario Circuit, Peach's Castle (Melee), Hanenbow
0x4427, 0x4528, 0x4629, 0x2B34, | # Great Bay, Yoshi's Island (Melee), Brinstar Depths, Jungle Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E, | # Kongo Falls, Norfair, Mushroom Kingdom II, Icicle Mountain
0x4C2F, 0x4D30, 0x4E31, 0x4F3D, | # Mushroom Kingdom (64), WarioWare, Mushroom Kingdom (Melee), Rainbow Cruise
0x503E, 0x513F, 0x5240, 0x5341,	| # Poke Floats, Delfino Plaza, Mushroomy Kingdom, Bridge of Eldin
0x5442, 0x5543, 0x5644, 0x5745,	| # Skyloft, Pokemon Stadium 2 (Brawl), New Pork City, 75m
0x5846,	0x5947, 0x5A48, 0x5B49,	| # Mario Bros., Green Hill Zone (Brawl), Super Happy Tree, Sector Z
0x5C4A, 0x5D4B, 0x5E4C, 0x5F4D,	| # Pokemon Stadium, Venom, Brinstar, Green Greens
0x604E, 0x8371, 0x8472, 0x6351, | # Mute City, Bowser's Castle (PM), Tiny FD, Rumble Falls
0x857A, 0x6553, 0x8270, 0x806E, | # Temple of Time, Metal Cavern (64), Kingdom Adventure, Subspace
0x6755, 0x6856, 0x6957, 0x6A58, | # Bob-Omb Battlefield, Mushroom Gorge, Minecart Madness, Oil Drum Alley
0x472A, 0x6B59, 0x6C5A, 0x6D5B, | # Golden Temple, Crateria, Yoshi's Cookie, Yoshi's Story (Beta)
0x6E5C, 0x6F5D, 0x705E, 0x715F, | # Cookie Country, White Wafers, Sky Islands, Sky Temple
0x7260, 0x7361, 0x7462, 0x7563, | # Another Dimension, Planet Papetoon, Sprout Tower, Poke Floats 2
0x7664, 0x7765, 0x7866, 0x7967, | # Aeropolis, Wario's Castle, Waluigi Land, Dead Line
0x7A68, 0x7B69, 0x7C6A, 0x7D6B, | # Radical Highway, Dracula's Castle, Spiral Mountain, Clanker's Cavern
0x7E6C, 0x7F6D			  		| # Venus Lighthouse, Lunar Horizon


SkipStageTables:
.RESET

byte 20 @ $806B929C # Page 1
byte 30 @ $806B92A4 # Page 2
byte 30 @ $80496002 # Page 3
byte 28 @ $80496003 # Page 4
byte 00 @ $80496004 # Page 5 (Unused)
byte 108 @ $800AF673 # Stage Count