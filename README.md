# Smart Duel Disk

[![Build Status - Codemagic][]][Build status link] [![Twitter handle][]][Twitter link] [![Discord handle][]][Discord link]

Smart Duel Disk (SDD) is a mobile application used for playing the popular TCG named Yu-Gi-Oh!. Players can create a deck and duel against other duelists. During a duel, users are encouraged to wear their smart device on their arm and use it as a so called duel disk. The goal of this project is to make a completely digital product for playing Yu-Gi-Oh! the way Seto Kaiba does in [The Dark Side of Dimensions][DSoD].

## What about Project A.T.E.M.?

This project started as a mobile application where users can use their phone to look at a card and a 3D model of the character on the card would appear. The SDD won't have this functionality. Why? Because the SDD is going to be the core of a larger project. It will only be used to manage user decks and placing cards on the field. There will be a **Smart Duel Gazer** (SDG) which is going to be an extension of this project.

Let's say you summon a Blue-Eyes White Dragon in the SDD. The SDD will then send an event to the SDG to let it know that a BEWD has been summoned. The user performs the action using the SDD and the SDG will visualise this action.

The SDD runs on an Android/iOS device and is something you wear on your arm, like a duel disk. The SDG runs on AR glasses / an AR headset / Google Cardboard / ... which is something you wear on your head.

## How to install the app?

### Android

The app currently isn't published in the Play Store but luckily on Android it's possible to download and install the app without it. Head over to [the releases page][Releases] to download and install the latest version of the app.

### iOS

To be able to distribute the iOS application, we need an Apple Developer license. This costs 100 dollars and since we currently don't have an income we won't be able to distribute the iOS app. A Patreon account will be set up later to help finance the project.

## Getting involved

Because this project is too big for one person, I'll definitely need the help of the community to realise it. Everyone who wants to help will be able to, but I'm mostly looking for:

- (Mobile) Developers
- UI/UX designers
- 3D model designers / animators
- Yu-Gi-Oh! experts to help with deck building
  
If you're interested in helping out, send me a message on [our Discord server][Discord link].

If you need some assistance getting your dev environment set up, see our [Getting Started guide](./docs/getting_started.md).
Feel free to help improve the document if you struggle with something and want to share how you overcame it.

## Reporting bugs

If you ever encounter a bug, please let us know so it can be fixed. You can leave a bug report in the Bugs channel on [our Discord server][Discord link].

[Build Status - Codemagic]: https://api.codemagic.io/apps/5ff9dd8c7e8a84d7901732c4/5ff9dd8c7e8a84d7901732c3/status_badge.svg
[Build status link]: https://codemagic.io/apps/5ff9dd8c7e8a84d7901732c4/5ff9dd8c7e8a84d7901732c3/latest_build
[Twitter handle]: https://img.shields.io/twitter/follow/crowncorpbe.svg?style=social&label=Follow
[Twitter link]: https://twitter.com/intent/follow?screen_name=crowncorpbe
[Discord handle]: https://discordapp.com/api/guilds/751742244066820147/widget.png?style=shield
[Discord link]: https://discord.gg/XCcfcbBcjE
[DSoD]: https://yugioh.fandom.com/wiki/Yu-Gi-Oh!_The_Dark_Side_of_Dimensions
[Releases]: https://github.com/BramDC3/smart_duel_disk/releases
