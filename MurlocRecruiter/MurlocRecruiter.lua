
--[[
MurlocRecruiter
===============

A simple randomized guild recruitment addon
for World of Warcraft.

  Created by: The Underfoot Clan
  Guild:      Full Metal Murloc
  Version:    1.0.0

  Underfoot Clan Development Team:
  Pox Underfoot   - Magical Engineering
  Warte Underfoot - Experimental Testing
  Roach Underfoot - Asset Acquisition
  Grace Underfoot - Quality Assurance

  "Our code is guaranteed to probably work.
  Our lawyers recommend no further guarantees."

  Usage:
  /mrecruit         Guild (default)
  /mrecruit g       Guild
  /mrecruit s       Say
  /mrecruit y       Yell
  /mrecruit 1       Channel 1
  /mrecruit 2       Channel 2
  /mrecruit preview Preview an ad locally
  /mrecruit help    Show commands
]]

local addonName = "MurlocRecruiter"

-- Configuration
local cooldown = 150 -- Seconds between posts  (2.5 minutes between adds)
local maxChatLength = 255
local lastPost = nil
local lastAd = 0
local lastInvitation = 0

-- Recruitment advertisements (without invitations)
local ads = {
  "<Full Metal Murloc> recruiting! Friendly folks, veteran players, and casual adventures. All are welcome! Our jokes are terrible, but our company is excellent.",
  "<Full Metal Murloc> recruiting! We do a little of everything, welcome everyone, and have 20+ years of experience making it look easy. Usually.",
  "<Full Metal Murloc> recruiting! Casual-friendly, veteran-tested, and Murloc-approved. The Murlocs were unavailable for comment.",
  "<Full Metal Murloc> recruiting! Friendly, inclusive, and experienced. We take care of our guildmates. The bosses are another matter.",
  "<Full Metal Murloc> recruiting! New player? Veteran? Returning after 15 years? Come on in! We even remember where we parked the raid bosses.",
  "<Full Metal Murloc> recruiting! A little questing, a little raiding, a little RP, and a LOT of questionable jokes. Friendly players welcome!",
  "<Full Metal Murloc> recruiting! We've been playing WoW for 20+ years. We've learned that good friends are harder to find than legendary loot.",
  "<Full Metal Murloc> recruiting! All skill levels welcome. Our veterans have decades of experience and are happy to share it. The bad jokes are free.",
  "<Full Metal Murloc> recruiting! Casual atmosphere, experienced adventurers, and no pressure to be anything but yourself. Pants still recommended.",
  "<Full Metal Murloc> recruiting! A friendly home for adventurers of all kinds. We provide encouragement, experience, and absolutely dreadful puns.",
  "<Full Metal Murloc> recruiting! We believe Azeroth is better with friends. Especially friends who know how to resurrect you. All welcome!",
  "<Full Metal Murloc> recruiting! We take friendship seriously, raiding competently, and Murloc impressions far too enthusiastically. Come join us!",
  "<Full Metal Murloc> recruiting! No drama, no pressure, decades of experience. We know better. That doesn't always stop us.",
}

-- Random invitation endings
local invitations = {
  "Whisper us for an invite!",
  "Send a whisper and join the madness!",
  "Interested? Whisper for a guild invite!",
  "Whisper us! We promise to behave. Briefly.",
  "Send a whisper. The Murlocs are expecting you.",
  "Whisper for an invite. No paperwork required!",
  "Want in? Whisper us. We saved you a chair!",
  "Whisper for an invite. Pants remain optional.",
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
}

-- Local output
local function Print(message)
  DEFAULT_CHAT_FRAME:AddMessage(
    "|cff33ff99MurlocRecruiter:|r " .. message
  )
end

-- Pick a random index without immediately repeating the previous one.
local function PickIndex(count, previous)
  if count == 0 then
    return nil
  end

  if count == 1 then
    return 1
  end

  if previous < 1 or previous > count then
    return math.random(count)
  end

  local index = math.random(count - 1)
  if index >= previous then
    index = index + 1
  end

  return index
end

-- Select a random advertisement and a random compatible invitation.
-- Neither selection changes the posting history until a message is sent.
local function PickMessage()
  local availableAds = {}

  for adIndex, ad in ipairs(ads) do
    local compatible = {}
    for invitationIndex, invitation in ipairs(invitations) do
      if #ad + 1 + #invitation <= maxChatLength then
        compatible[#compatible + 1] = invitationIndex
      end
    end
    if #compatible > 0 then
      availableAds[#availableAds + 1] = {
        index = adIndex,
        invitations = compatible
      }
    end
  end

  if #availableAds == 0 then
    return nil
  end

  -- Avoid repeating the last ad if another valid ad exists.
  local adChoices = {}
  for _, entry in ipairs(availableAds) do
    if entry.index ~= lastAd or #availableAds == 1 then
      adChoices[#adChoices + 1] = entry
    end
  end

  local entry = adChoices[math.random(#adChoices)]
  local invitationChoices = {}
  for _, index in ipairs(entry.invitations) do
    if index ~= lastInvitation or #entry.invitations == 1 then
      invitationChoices[#invitationChoices + 1] = index
    end
  end

  local invitationIndex = invitationChoices[math.random(#invitationChoices)]
  return entry.index, invitationIndex,
    ads[entry.index] .. " " .. invitations[invitationIndex]
end

-- Resolve requested destination
local function ResolveDestination(arg)
  if arg == "" or arg == "g" or arg == "guild" then
    return "GUILD", nil
  end

  if arg == "s" or arg == "say" then
    return "SAY", nil
  end

  if arg == "y" or arg == "yell" then
    return "YELL", nil
  end

  local number = tonumber(arg)
  if number then
    if number < 1 or number ~= math.floor(number) then
      return nil, nil
    end

    local name = GetChannelName(number)
    if not name or name == 0 then
      return nil, nil
    end

    return "CHANNEL", number
  end

  return nil, nil
end

local function ShowHelp()
  Print("Available commands:")
  Print("/mrecruit - Post to Guild")
  Print("/mrecruit g - Post to Guild")
  Print("/mrecruit s - Post to Say")
  Print("/mrecruit y - Post to Yell")
  Print("/mrecruit 1 - Post to channel 1")
  Print("/mrecruit 2 - Post to channel 2")
  Print("/mrecruit preview - Preview an ad and invitation locally")
  Print("/mrecruit help - Show this help")
end

-- Main command
SLASH_MURLOCRECRUITER1 = "/mrecruit"

SlashCmdList["MURLOCRECRUITER"] = function(msg)
  local arg = (msg or ""):lower()
  arg = arg:match("^%s*(.-)%s*$")

  if arg == "help" or arg == "?" then
    ShowHelp()
    return
  end

  if arg == "preview" then
    local adIndex, invitationIndex, message = PickMessage()
    if not message then
      Print("No advertisement/invitation combination fits the chat limit.")
      return
    end

    Print("Preview #" .. adIndex .. " (invitation #" .. invitationIndex .. "):")
    Print(message)
    return
  end

  local chatType, channel = ResolveDestination(arg)
  if not chatType then
    Print("Unknown or invalid destination: " .. arg)
    ShowHelp()
    return
  end

  local now = GetTime()
  if lastPost then
    local remaining = cooldown - (now - lastPost)
    if remaining > 0 then
      Print("Please wait " .. math.ceil(remaining) .. " seconds before posting again.")
      return
    end
  end

  local adIndex, invitationIndex, message = PickMessage()
  if not message then
    Print("No advertisement/invitation combination fits the chat limit.")
    return
  end

  SendChatMessage(message, chatType, nil, channel)
  lastAd = adIndex
  lastInvitation = invitationIndex
  lastPost = now
end

-- Local initialization notice
DEFAULT_CHAT_FRAME:AddMessage(
  "|cff33ff99[" .. addonName .. "]|r v1.0.0 loaded! "
  .. "Underfoot Clan Marketing Department operational. "
  .. "Legal disclaimers pending."
)
