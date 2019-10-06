# Canyon [![Jenkins](https://img.shields.io/jenkins/build/https/ci.canyonmodded.com/job/canyon)](https://ci.canyonmodded.com/job/canyon) [![Discord](https://img.shields.io/discord/627985817020923937)](https://discord.gg/hj5m5z3) [![forthebadge](https://forthebadge.com/images/badges/contains-technical-debt.svg)](https://forthebadge.com)

Canyon is a fork of CraftBukkit for Minecraft Beta 1.7.3. It includes multiple
enhancements whilst also retaining compatibility with old Bukkit plugins and
mods as much as possible.

## Legality

Canyon is simply a set of patches applied on top of existing CraftBukkit source.
In order to build Canyon, you will need to find a proper copy of the _relocated_
Minecraft Beta 1.7.3 JAR used by CraftBukkit (not merely a 1.7.3 beta server JAR).
This is the same approach taken by the Spigot project.

Provided you have this dependency, you'll be able to apply the patches in this
repository and compile Canyon using Maven.

It is my intention to provide fully free CraftBukkit-compatible mappings, but this
project will take time.

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
* [Modification Station](https://discord.gg/Q2VguhU): advice, contributions,
  and testers. A great community to be in if you're interested in the old
  pre-release version of Minecraft, from pre-alpha to beta 1.8.
