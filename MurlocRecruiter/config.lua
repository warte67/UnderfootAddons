
--[[
MurlocRecruiter Configuration
=============================

Guild-specific configuration for MurlocRecruiter.

Created by: The Underfoot Clan
]]

local addonName, addon = ...

addon.config = {

    -- Guild configuration
    guildName = "Downtime", -- Guild Name

    -- Posting configuration
    cooldown = 150,       -- Seconds between posts
    maxChatLength = 255,   -- Maximum chat message length

    -- Recruitment advertisements
    -- The guild name is automatically prepended.

    ads = {
        "recruiting! A relaxed social leveling guild for folks who enjoy good company, shared adventures, and eventually some casual raiding.",
        "recruiting! Enjoy the journey, not just the destination. Social leveling, friendly conversation, and relaxed raiding down the road.",
        "recruiting! New players, returning veterans, and experienced adventurers welcome. Come enjoy Azeroth at your own pace!",
        "recruiting! Social leveling today, casual raiding tomorrow. Good company every step of the way.",
        "recruiting! Because WoW is supposed to be fun, not a second job. Come level, laugh, and adventure with us!",
        "recruiting! Looking for friendly folks who enjoy questing, dungeons, conversation, and the occasional spectacularly bad decision.",
        "recruiting! Real life comes first. Azeroth comes second. Questionable jokes come somewhere in between.",
        "recruiting! A social leveling guild with casual raiding in our future. No rush, no pressure, just good company.",
        "recruiting! Whether you're chasing quests, crafting gear, or just enjoying guild chat, there's room for you here.",
        "recruiting! We believe the journey to level 60 should be just as enjoyable as what comes afterward.",
        "recruiting! Friendly adventurers wanted. Experience optional, sense of humor appreciated, pants strongly recommended.",
        "recruiting! Come for the leveling, stay for the friendships. Eventually we'll find some raid bosses to annoy.",
        "recruiting! Casual players, dedicated altoholics, dungeon enthusiasts, and professional procrastinators welcome!",
        "recruiting! Looking for a guild where you can relax after a long day? That's rather the point of Downtime.",
        "recruiting! Shared adventures, friendly faces, relaxed progression, and absolutely no performance reviews.",
        "recruiting! We have ambitions of casual raiding. First, however, we should probably finish leveling.",
        "recruiting! Enjoy questing, helping others, and laughing at the occasional corpse run? You might fit right in.",
        "recruiting! A guild for people who enjoy playing together without turning their leisure time into an obligation.",
        "recruiting! Good friends, good adventures, and questionable navigation skills. Getting there is half the fun.",
        "recruiting! Take a break from the daily grind and enjoy some Downtime. Social leveling and future casual raiding await!",
    },

    -- Random invitation endings
    invitations = {
        "Whisper us for an invite!",
        "Send a whisper and join the madness!",
        "Interested? Whisper for a guild invite!",
        "Whisper us! We promise to behave. Briefly.",
        "Need some Downtime? Send us a whisper!",
        "Whisper for an invite. No paperwork required!",
        "Want in? Whisper us. We saved you a chair!",
        "Whisper for an invite. No interview required!",
        "Send a whisper. Our welcome committee is mostly harmless.",
        "Whisper us for an invite. The cookies are theoretical.",
        "Want to join? Whisper us. We don't bite. Usually.",
        "Whisper for an invite. No twenty-page application!",
        "Send us a whisper. Your adventure awaits!",
        "Whisper us to join. No attendance sheet required.",
        "Interested? Whisper us. We'll make room!",
        "Whisper for an invite. Bad jokes included free!",
        "Send a whisper. Our guild door is always open!",
        "Whisper us to join. No gear inspection required.",
        "Want a friendly guild? Whisper us for an invite!",
        "Whisper for an invite. Your Downtime starts here!",
    },

}
