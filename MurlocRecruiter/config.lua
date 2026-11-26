
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
    cooldown = 300, -- Seconds between posts (5 minutes)
    maxChatLength = 255,   -- Maximum chat message length

    -- Recruitment advertisements
    -- The guild name is automatically prepended.

    ads = {

        -- Generic

        "is recruiting! A large, friendly social leveling guild focused on helping guildmates, relaxed dungeon runs, and eventually casual raiding. No drama, just good company.",

        "invites you to enjoy the journey, not just the destination. Friendly guildmates, shared adventures, relaxed dungeon runs, and casual raiding down the road.",

        "believes the journey to 60 should be just as enjoyable as what comes afterward. Come enjoy social leveling, friendly conversation, and adventures together.",

        "is looking for more friends to share the adventure! Level at your own pace, enjoy friendly conversation, and make some lasting friendships along the way.",

        "isn't in a race to level 60. We're enjoying the scenery, making friends, running dungeons, and occasionally remembering which quest we're on.",


        -- Community and friendship

        "is looking for friendly adventurers! We're a large social leveling guild where helping one another is part of the adventure. No drama, just good company.",

        "welcomes players of all experience levels! Whether you're new to Azeroth or returning after years away, there's always room for another friend.",

        "believes good guildmates are worth more than epic loot. Come enjoy friendly groups, shared adventures, and a relaxed social atmosphere.",

        "is looking for more friends, not just more names on the roster. Join a welcoming community that enjoys playing together and helping one another.",

        "offers a friendly place to call home in Azeroth. Social leveling, helpful guildmates, relaxed dungeon runs, and plenty of good conversation.",


        -- Enjoying the journey

        "believes the best adventures aren't measured in experience points. Come make friends, explore Azeroth, and enjoy the journey together.",

        "invites you to slow down and enjoy Azeroth. There's plenty of time for leveling, dungeon runs, friendly conversation, and making memories.",

        "is looking for adventurers who enjoy the journey as much as the destination. Level at your own pace with friendly folks along the way.",

        "welcomes questers, explorers, crafters, dungeon enthusiasts, and anyone who simply enjoys good company while playing WoW.",

        "knows that getting to level 60 is only part of the adventure. The friendships we make along the way are what keep us coming back.",


        -- Dungeons and future raiding

        "is building a friendly community for social leveling, relaxed dungeon runs, and future casual raiding. Come grow with us!",

        "enjoys tackling challenges together without turning every dungeon into a competitive sporting event. Friendly players of all experience levels welcome!",

        "is recruiting for today's adventures and tomorrow's raids. We're enjoying the leveling experience and building friendships along the way.",

        "welcomes adventurers who enjoy group content without unnecessary pressure. We're here to learn, laugh, help each other, and eventually raid together.",

        "is looking for folks who enjoy a good dungeon run, even when things don't go exactly according to plan. Patience and friendship go a long way.",


        -- Relaxed and drama-free

        "believes WoW should be a welcome escape from everyday responsibilities, not another one. Come enjoy a friendly, relaxed gaming community.",

        "is a place to unwind, level, chat, and share adventures. We value friendly players, cooperation, and keeping the drama out of our downtime.",

        "welcomes casual adventurers, busy adults, and anyone who appreciates a guild that understands real life comes first.",

        "is looking for good people who enjoy good company. No rush to endgame, no unnecessary pressure, and no need to prove yourself.",

        "believes a successful evening in Azeroth is one you enjoyed. Experience points and shiny new equipment are simply added bonuses.",


        -- A little Underfoot humor

        "is looking for adventurers with a friendly attitude and a reasonable tolerance for bad jokes. Navigation skills are entirely optional.",

        "believes dungeon runs should involve laughter, teamwork, and preferably fewer corpse runs than actual boss encounters.",

        "welcomes experienced veterans, enthusiastic newcomers, and adventurers who occasionally forget why they entered a particular cave.",

        "has plans for casual raiding, relaxed dungeon runs, and world domination. That last item is still under committee review.",

        "believes your downtime shouldn't feel like overtime. Come enjoy friendly company, shared adventures, and absolutely no quarterly performance reviews.",


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
