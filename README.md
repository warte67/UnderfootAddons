# UnderfootAddons

**World of Warcraft addons from the Underfoot Clan.**

*Useful tools. Questionable methods. Surprisingly few explosions.*

UnderfootAddons is a growing collection of small World of Warcraft addons created to make everyday gameplay a little more convenient—and occasionally a little more entertaining.

Our first project was built for **<Full Metal Murloc>**, a friendly, inclusive guild with plenty of veteran WoW experience and a healthy appreciation for terrible jokes.

## Addon catalog

### MurlocRecruiter

A lightweight, manually triggered guild recruitment addon for **Full Metal Murloc**.

**Features**

- Randomly selects a recruitment advertisement and a separate invitation ending.
- Avoids immediately repeating either selection.
- Supports Guild, Say, Yell, and numbered chat channels.
- Offers local previews without posting to chat.
- Enforces a configurable cooldown between posts.
- Displays a local startup message when loaded.

**Commands**

| Command | Action |
| --- | --- |
| `/mrecruit` | Post to guild chat (default) |
| `/mrecruit g` | Post to guild chat |
| `/mrecruit s` | Post to Say |
| `/mrecruit y` | Post to Yell |
| `/mrecruit 1` | Post to channel 1 |
| `/mrecruit 2` | Post to channel 2 |
| `/mrecruit preview` | Preview a random advertisement locally |
| `/mrecruit help` | Show available commands |

The addon **does not automatically post on a timer**. A player must initiate each message. Please respect your server's chat and recruitment rules.


## Download

**[Download UnderfootAddons (ZIP)](https://github.com/warte67/UnderfootAddons/archive/refs/heads/master.zip)**

Download the ZIP, extract it, and copy the desired addon folder
(e.g., `MurlocRecruiter`) into your WoW `Interface/AddOns/`
directory.

You do not need Git or a GitHub account to download the addons.


## Installation

1. Download or clone this repository.
2. Find the addon folder you want to install (for example, `MurlocRecruiter`).
3. Copy that folder into your WoW installation's `Interface/AddOns/` directory.
4. Make sure `MurlocRecruiter.toc` and `MurlocRecruiter.lua` are directly inside `Interface/AddOns/MurlocRecruiter/`—not nested in an extra folder.
5. Launch WoW or type `/reload` if the game is running.
6. For MurlocRecruiter, enter `/mrecruit help` to get started.

Example installation layout:

```text
World of Warcraft/
└── Interface/
    └── AddOns/
        └── MurlocRecruiter/
            ├── MurlocRecruiter.toc
            ├── MurlocRecruiter.lua
            └── README.txt        (optional)
```

> **Compatibility:** MurlocRecruiter was developed for the WoW Forever client. Compatibility with other WoW clients or versions has not been verified.

## Configuration

MurlocRecruiter can be customized by editing `MurlocRecruiter.lua`:

- **`cooldown`** — minimum number of seconds between posts; use `150` for 2.5 minutes.
- **`ads`** — recruitment message templates, without the final whisper invitation.
- **`invitations`** — randomized endings that explicitly invite readers to whisper for an invite.

After changing the Lua file, type `/reload` in game. Use `/mrecruit preview` to inspect the resulting messages before posting.

## Future addons

MurlocRecruiter is just the beginning. Additional Underfoot creations may join this repository as they're developed. Each addon will have its own folder and documentation.

## The Underfoot Clan Development Team

| Team member | Official responsibility |
| --- | --- |
| **Pox Underfoot** | Magical Engineering |
| **Warte Underfoot** | Experimental Testing |
| **Roach Underfoot** | Asset Acquisition |
| **Grace Underfoot** | Quality Assurance (and frequent objections) |

## Disclaimer

> Our code is guaranteed to probably work.  
> Our lawyers recommend no further guarantees.

Made for fun, friends, and adventures in Azeroth. **MRGLGLGL!**
