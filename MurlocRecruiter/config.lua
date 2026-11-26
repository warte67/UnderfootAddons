
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
        "recruiting! Friendly folks, veteran players, and casual adventures. All are welcome! Our jokes are terrible, but our company is excellent.",
        "recruiting! We do a little of everything, welcome everyone, and have 20+ years of experience making it look easy. Usually.",
        "recruiting! Casual-friendly, veteran-tested, and Murloc-approved. The Murlocs were unavailable for comment.",
        "recruiting! Friendly, inclusive, and experienced. We take care of our guildmates. The bosses are another matter.",
        "recruiting! New player? Veteran? Returning after 15 years? Come on in! We even remember where we parked the raid bosses.",
        "recruiting! A little questing, a little raiding, a little RP, and a LOT of questionable jokes. Friendly players welcome!",
        "recruiting! We've been playing WoW for 20+ years. We've learned that good friends are harder to find than legendary loot.",
        "recruiting! All skill levels welcome. Our veterans have decades of experience and are happy to share it. The bad jokes are free.",
        "recruiting! Casual atmosphere, experienced adventurers, and no pressure to be anything but yourself. We're still working on the jokes.",
        "recruiting! A friendly home for adventurers of all kinds. We provide encouragement, experience, and absolutely dreadful puns.",
        "recruiting! We believe Azeroth is better with friends. Especially friends who know how to resurrect you. All welcome!",
        "recruiting! We take friendship seriously, raiding competently, and Murloc impressions far too enthusiastically. Come join us!",
        "recruiting! No drama, no pressure, decades of experience. We know better. That doesn't always stop us.",
    },

    -- Random invitation endings
    invitations = {
        "Whisper us for an invite!",
        "Send a whisper and join the madness!",
        "Interested? Whisper for a guild invite!",
        "Whisper us! We promise to behave. Briefly.",
        "Send a whisper. The Murlocs are expecting you.",
        "Whisper for an invite. No paperwork required!",
        "Want in? Whisper us. We saved you a chair!",
        "Whisper for an invite. The initiation ritual is mostly ceremonial.",
        "Send a whisper. Our welcome committee is mostly harmless.",
        "Whisper us for an invite. The cookies are theoretical.",
        "Want to join? Whisper us. We don't bite. Usually.",
        "Whisper for an invite. No twenty-page application!",
        "Send us a whisper. Your adventure awaits!",
        "Whisper us to join. Murloc fluency not required.",
        "Interested? Whisper us. We'll make room!",
        "Whisper for an invite. Bad jokes included free!",
        "Send a whisper. Our guild door is always open!",
        "Whisper us to join. No gear inspection required.",
        "Want a friendly guild? Whisper us for an invite!",
        "Whisper for an invite. The Murlocs may have already approved your application!",
    },
}
