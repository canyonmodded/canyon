# Canyon [![Jenkins](https://img.shields.io/jenkins/build/https/ci.velocitypowered.com/job/Canyon)](http://canyonmodded.p0rtal.gay/job/Canyonmodded/) [![Discord](https://img.shields.io/discord/627985817020923937)](https://discord.gg/hj5m5z3) [![forthebadge](https://forthebadge.com/images/badges/contains-technical-debt.svg)](https://forthebadge.com)

Canyon is a fork of CraftBukkit for Minecraft Beta 1.7.3. It includes multiple
enhancements whilst also retaining compatibility with old Bukkit plugins and
mods as much as possible.

## Building

1. Clone the repo with `git clone --recursive https://github.com/canyonmodded/canyon.git`.
2. Go into the new `canyon` directory and run `./canyon p`.
3. Run `mvn clean package`.
4. Find the server JAR in `Canyon-Server/target`.

OR!

## Downloading

You can download them [Here.](http://canyonmodded.p0rtal.gay/job/Canyonmodded/)
Or check our discord when jenkins fails to login and properly build.

## Differences from CraftBukkit

Canyon features:

* Bug fixes.
* Select technological backports from modern Minecraft servers (such as Spigot
  and Paper). Canyon will not import "future" gameplay features as a default.
  We aim to retain and improve the Beta 1.7.3 gameplay experience.
* Performance enhancements (some backported from Spigot and Paper, others specific
  to Canyon).
* Code quality improvements.
* New APIs, to complete the Beta 1.7.3 modding story and adapt to the modern
  Java ecosystem.

To support these new features, Canyon depends on Java 8 and higher and integrates
modern libraries (such as the replacement for Google Collections, Google Guava).
Legacy Bukkit plugins are fully supported through the [Colorado](https://github.com/canyonmodded/colorado)
compatibility layer, which dynamically rewrites legacy plugins to adapt to new
Canyon internals (although we make it a goal to minimize disruptive changes to
the Minecraft core).

## Credits

* [Paper](https://papermc.io/): build system and some backports. Tacos, Taylor
  Swift, and cats are amazing.
* [Modification Station](https://discord.gg/8Qky5XY): advice, contributions,
  and testers. A great community to be in if you're interested in the old
  pre-release version of Minecraft, from pre-alpha to beta 1.8.
