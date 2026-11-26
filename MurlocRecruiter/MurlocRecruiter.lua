
--[[
MurlocRecruiter
===============

A simple randomized guild recruitment addon
for World of Warcraft.

  Created by: The Underfoot Clan
  Version:    1.1.0

  Underfoot Clan Development Team:
  Pox Underfoot   - Magical Engineering
  Warte Underfoot - Experimental Testing
  Roach Underfoot - Asset Acquisition
  Grace Underfoot - Quality Assurance

  "Our code is guaranteed to probably work.
  Our lawyers recommend no further guarantees."

  Guild-specific configuration is located in config.lua.

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

  -- Addon namespace
  local addonName, addon = ...

  -- Local output
  local function Print(message)
  DEFAULT_CHAT_FRAME:AddMessage(
    "|cff33ff99MurlocRecruiter:|r " .. message
  )
  end

  -- Load configuration from the shared addon namespace
  local config = addon and addon.config

  if not config then
    Print("Configuration unavailable. Check config.lua and TOC load order.")
    return
    end

    -- Configuration
    local guildName = config.guildName
    local cooldown = config.cooldown
    local maxChatLength = config.maxChatLength
    local ads = config.ads
    local invitations = config.invitations

    -- Guild name prefix
    local guildPrefix = "<" .. guildName .. "> "

    -- Runtime state
    local lastPost = nil
    local lastAd = 0
    local lastInvitation = 0

    -- Construct a complete recruitment message
    local function BuildMessage(ad, invitation)
    return guildPrefix .. ad .. " " .. invitation
    end

    -- Select a random advertisement and a random compatible invitation.
    -- Neither selection changes the posting history until a message is sent.
    local function PickMessage()
    local availableAds = {}

    for adIndex, ad in ipairs(ads) do
      local compatible = {}

      for invitationIndex, invitation in ipairs(invitations) do
        local message = BuildMessage(ad, invitation)

        if #message <= maxChatLength then
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

                      local invitationIndex =
                      invitationChoices[math.random(#invitationChoices)]

                      return entry.index, invitationIndex,
BuildMessage(
  ads[entry.index],
  invitations[invitationIndex]
)
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

            -- Display available commands
            local function ShowHelp()
            Print("Recruiting for <" .. guildName .. ">")
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

                  Print("Preview #" .. adIndex ..
                  " (invitation #" .. invitationIndex .. "):")

                  Print(message)
                  return
                  end

                  local chatType, channel = ResolveDestination(arg)

                  if not chatType then
                    Print("Unknown or invalid destination: " .. arg)
                    ShowHelp()
                    return
                    end

                    -- Enforce posting cooldown
                    local now = GetTime()

                    if lastPost then
                      local remaining = cooldown - (now - lastPost)

                      if remaining > 0 then
                        Print("Please wait " .. math.ceil(remaining) ..
                        " seconds before posting again.")
                        return
                        end
                        end

                        -- Select a recruitment message
                        local adIndex, invitationIndex, message = PickMessage()

                        if not message then
                          Print("No advertisement/invitation combination fits the chat limit.")
                          return
                          end

                          -- Send recruitment message
                          SendChatMessage(message, chatType, nil, channel)

                          -- Update posting history
                          lastAd = adIndex
                          lastInvitation = invitationIndex
                          lastPost = now
                          end

                          -- Local initialization notice
                          DEFAULT_CHAT_FRAME:AddMessage(
                            "|cff33ff99[" .. addonName .. "]|r v1.1.0 loaded! "
                            .. "Underfoot Clan Marketing Department operational. "
                            .. "Legal disclaimers pending."
                          )

                          Print("Configured guild: <" .. guildName .. ">")
