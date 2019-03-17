# Assist
FFXI Windower addon that let's you tell your multiboxed alts to target your target without locking on.

## Installation
After downloading, extract to your Windower addons folder. Make sure the folder is called Assist, rather than -master or -v1.whatever. Your file structure should look like this:

    addons/Assist/assist.lua
    addons/Assist/lock_target_packet.lua

Once the addon is in your Windower addons folder, it won't show up in the Windower launcher. You need to add a line to your scripts/init.txt:

    lua load Assist

## Commands

    //assist me -- Will tell all alts to target your target.  
    //assist target <target_id> -- Set the target to the mob/player specified by <target_id>.
