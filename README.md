# Smart Duel Disk

[![Build Status - Codemagic][]][Build status link] [![Twitter handle][]][Twitter link] [![Discord handle][]][Discord link]

Smart Duel Disk (SDD) is a mobile application used for playing the popular TCG named Yu-Gi-Oh!. Players can create a deck and duel against other duelists. During a duel, users are encouraged to wear their smart device on their arm and use it as a so called duel disk. The goal of this project is to make a completely digital product for playing Yu-Gi-Oh! the way Seto Kaiba does in [The Dark Side of Dimensions][DSoD]. This app is also used to stay up-to-date with the latest news about the project, for tournaments, for statistics, ...

## What about Project A.T.E.M.?

This project started as a mobile application where users can use their phone to look at a card and a 3D model of the character on the card would appear. The SDD won't have this functionality. Why? Because the SDD is going to be the core of a larger project. It will only be used to manage user decks and placing cards on the field. There is a [Smart Duel Gazer][Smart Duel Gazer] (SDG) project which is used to enhance the experience using augmented reality.

Let's say you're playing a Yu-Gi-Oh! duel and you summon a Blue-Eyes White Dragon (BEWD) in the Smart Duel Disk (SDD). The SDD will then send an event to the Smart Duel Server (SDS) to let it know that a BEWD has been summoned. The SDS will then send an event to the SDG, informing it that a BEWD has been summoned in a specific zone on the field. To keep it short: the user performs an action using the SDD and the SDG will visualise it using 3D models and/or VFX.

The SDD runs on an Android/iOS device and is something you wear on your arm, like a duel disk. The SDG runs on AR glasses / an AR headset / ... which is something you wear on your head.

## How to install the app?

iPhone users:
 - Download & install Apple's TestFlight (https://apps.apple.com/en/app/testflight/id899247664)
 - Donwload the Smart Duel Disk via TestFlight: https://testflight.apple.com/join/eBlsGP1I

Android users: https://play.google.com/store/apps/details?id=com.crowncorp.smartdueldisk

## Getting involved

Because this project is too big for one person, I'll definitely need the help of the community to realise it. Everyone who wants to help will be able to, but I'm mostly looking for:

- Mobile, Web & Unity Developers
- UI/UX designers
- 3D model designers / animators
  
If you're interested in helping out, send me a message on [our Discord server][Discord link].

If you need some assistance getting your dev environment set up, see our [Getting Started guide](./docs/getting_started.md).
Feel free to help improve the document if you struggle with something and want to share how you overcame it.

## Reporting bugs

If you ever encounter a bug, please let us know so it can be fixed. You can leave a bug report in the Bugs channel on [our Discord server][Discord link].

## Getting started

1. Download the latest version of Flutter at [flutter.dev][Flutter install]
2. Install the dependencies
   ```sh
   flutter pub get
   ```
3. Run the app
   ```sh
   flutter run
   ```

[Build Status - Codemagic]: https://api.codemagic.io/apps/5ff9dd8c7e8a84d7901732c4/5ff9dd8c7e8a84d7901732c3/status_badge.svg
[Build status link]: https://codemagic.io/apps/5ff9dd8c7e8a84d7901732c4/5ff9dd8c7e8a84d7901732c3/latest_build
[Twitter handle]: https://img.shields.io/twitter/follow/crowncorpbe.svg?style=social&label=Follow
[Twitter link]: https://twitter.com/intent/follow?screen_name=crowncorpbe
[Discord handle]: https://discordapp.com/api/guilds/751742244066820147/widget.png?style=shield
[Discord link]: https://discord.gg/XCcfcbBcjE
[DSoD]: https://yugioh.fandom.com/wiki/Yu-Gi-Oh!_The_Dark_Side_of_Dimensions
[Smart Duel Gazer]: https://github.com/BramDC3/smart_duel_gazer
[Releases]: https://github.com/BramDC3/smart_duel_disk/releases
[Flutter install]: https://flutter.dev/docs/get-started/install
