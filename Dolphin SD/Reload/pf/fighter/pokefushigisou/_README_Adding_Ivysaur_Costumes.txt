=======================================================================================
Guide for Adding Ivysaur Costumes
=======================================================================================

Ivysaur uses custom motion trails for certain attacks involving her vines, custom gfx depending on leaf color, and custom gfx depending on bulb explosion.

All costumes will default to the colors that the default Ivy costume uses.

Sub Actions 0x65, 0x66, and 0x1C2 (all GFX Tab), as well as Sub Routines 0x13B20, 0x14590, 0x14610, 0x1FE9C, and 0x203CC control leaf colors

Sub Action 0x3C (GFX Tab) controls the Flash Light Effect for Nair

Sub Routine 0x146F8, 0x17690, and 0x17EA8 controls the vine motion trails

Sub Action 0x50 (GFX Tab) controls the leaf motion trails

Sub Action 0x5D (GFX Tab) controls the up smash explosion colors

Sub Routine 0x226EC controls the overlay effect color and sweetspot gfx for landing moves that heal Ivy

Sub Action 0x70 (Main Tab) is similar to Sub Routine 0x226EC, but it controls the overlay effect color and gfx for landing a pummel on Ivy

Sub Action 0x1CF, 0x1D0, (all GFX Tab) controls the overlay effect color for Ivy when using neutral special

Sub Action 0x1D7 (GFX Tab) controls the color of the glow when Ivy uses up special

Mage Ivy uses Darkness on-hit effects for certain hitboxes, located in Sub Actions 0x5D, 0x65, and 0x66, as well as Article 1, Sub Action 0 (all Main Tab)

Sub Routine 0x27EB4 controls the colors of Ivy's neutral special charge in the bulb.

Article 0, Sub Action 0 (GFX Tab) controls the leaf effects and motion trail of the projectile Ivy throws when side special is pressed.

Article 1, Sub Action 0 (Main Tab) controls the seed model used for Ivy's down special

Article 1, Sub Action 0 (GFX Tab) controls the gfx for the seed when it's traveling

Article 1, Sub Action 2 (GFX Tab) controls the gfx for the seed when it hits something

Sub Routine 0x2625C controls the leaves that appear when the seed hits something

If you have any questions, please feel free to ask in the #modding-discussion channel of the Project+ Discord.







