As of version 2.5 and Item Ex, whenever new items are added every stage in the build will need to be updated.

As we understand this is a lot to ask for those who make custom builds, we have set up two folders in  Project+ > pf > stage

There is the melee folder which has every stage in Project+ with the current Item Ex data.

There is also melee_No_Item_Ex which has just the stages that have actual updates, and not just changed Item Ex data. This folder is not loaded in P+, but just used for modders as reference.

If you do not update your stages with latest Item Ex data, they will still work, but just won't summon any new items.


To mass update your stagelist to the latest Item Ex data, you can add this plugin script to BrawlCrate Canary: https://github.com/markymawk/ItemEx

To ensure you are on BrawlCrate Canary, open up BrawlCrate go to Tools > Settings > Updater > Opt into BrawlCrate Canary

To add a plugin script to BrawlCrate, copy the release URL, then in BrawlCrate go to Tools > Settings > Updater > Manage Subscriptions > Add

The Plugins option will have an Item Ex option to batch update stages. It is recommended you backup your stage folder before using it.

Warning: Some very old stages may break if they have unusual import settings. If you see an alert that the texture scale is invalid or needs to be corrected, you should test the stage ingame. The following stages are known to break, and the auto updater will skip:

-STGBELLTOWER
-STGBELLTOWER_R_PS2_BELLTOWER
-STGPOKEFLOATS_L_POKEFLOATS2

These stages will always be manually updated by the Project+ development team and included in the melee_No_Item_Ex folder

