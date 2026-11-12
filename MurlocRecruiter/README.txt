MURLOC RECRUITER
Version 1.0.0 | Full Metal Murloc
========================================

A small, manually triggered World of Warcraft recruitment addon.
Created by the Underfoot Clan for Full Metal Murloc.

WHAT IT DOES
------------
Each time you use /mrecruit, the addon chooses a random guild
advertisement and a separate random invitation ending. It avoids
repeating the immediately previous advertisement or invitation when
possible, and checks the combined message against a 255-byte limit.

The addon does NOT automatically post messages. You must issue a
command for each post. Please respect server and channel rules.

INSTALLATION
------------
1. Close WoW, or prepare to reload its interface.
2. Place these files in:

   World of Warcraft/Interface/AddOns/MurlocRecruiter/
       MurlocRecruiter.toc
       MurlocRecruiter.lua
       README.txt

3. Make sure the folder is named MurlocRecruiter.
4. Start WoW and enable the addon in the AddOns list if needed.
5. Look for the [MurlocRecruiter] loaded message in your chat window.

COMMANDS
--------
/mrecruit          Post to Guild chat (default)
/mrecruit g        Post to Guild chat
/mrecruit s        Post to Say
/mrecruit y        Post to Yell
/mrecruit 1        Post to numbered chat channel 1
/mrecruit 2        Post to numbered chat channel 2
/mrecruit preview  Show a random combined message only to yourself
/mrecruit help     Display the command list

For other numbered channels, use /mrecruit followed by the channel
number, such as /mrecruit 3. Channel numbering depends on which
channels your character has joined. Check the destination before posting.

CONFIGURATION
-------------
Open MurlocRecruiter.lua in a text editor.

Find the configuration section near the top:

    local cooldown = 30 -- Seconds between posts

To require 2.5 minutes between posts, change it to:

    local cooldown = 150 -- 2.5 minutes between posts

This is a minimum delay between manual posts, NOT a timer that
sends messages automatically. The cooldown resets when the addon
is reloaded or the client session restarts.

EDITING THE MESSAGES
--------------------
The 'ads' Lua table contains recruitment messages without the
closing invitation. The 'invitations' table contains the closing
phrases. The addon randomly combines one entry from each table.

To add an advertisement, insert another quoted Lua string in ads:

    "<Full Metal Murloc> recruiting! Experienced, friendly, and fun.",

To add an ending, insert another quoted string in invitations:

    "Whisper us for a guild invite!",

Keep the commas between entries and escape embedded double quotes
with a backslash (\"). Keep messages short enough that the combined
advertisement and ending fit within the chat length limit.

After editing, use /reload in WoW to load your changes.
Use /mrecruit preview to check the result without broadcasting it.

TROUBLESHOOTING
---------------
- No loaded message? Check the folder name, .toc filename, and AddOns
  list. The folder must be MurlocRecruiter, not MurlockRecruiter.
- No message posted? Check the cooldown and the destination channel.
- 'Please wait ... seconds'? The minimum interval has not elapsed.
- No combination fits? Shorten some advertisements or invitations.
- Lua error after editing? Check quotation marks, commas, and braces.
- Changes not showing? Type /reload.

ABOUT FULL METAL MURLOC
-----------------------
A friendly, inclusive, casual-welcoming guild with experienced WoW
players, plenty of adventures, and an exceptionally questionable
sense of humor. We take teamwork seriously, ourselves less so.

UNDERFOOT CLAN DEVELOPMENT TEAM
-------------------------------
Pox Underfoot   - Magical Engineering
Warte Underfoot - Experimental Testing
Roach Underfoot - Asset Acquisition
Grace Underfoot - Quality Assurance

"Our code is guaranteed to probably work.
 Our lawyers recommend no further guarantees."
