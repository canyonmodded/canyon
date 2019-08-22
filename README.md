# Canyon

Canyon is a fork of CraftBukkit for Minecraft Beta 1.7.3. It includes multiple
enhancements whilst also retaining compatibility with old Bukkit plugins.

## Legality

Canyon is simply a set of patches applied on top of existing CraftBukkit source.
In order to build Canyon, you will need to find a proper copy of the _relocated_
Minecraft Beta 1.7.3 JAR used by CraftBukkit (not merely a 1.7.3 beta server JAR).

This is the same approach taken by the Spigot project, and they haven't been
DMCAed... so here we go.

Provided you have this dependency, you'll be able to apply the patches in this
repository and compile Canyon using Maven.

## Differences from CraftBukkit

Canyon features:

* Bug fixes.
* Select backports from modern Minecraft servers (such as Spigot and Paper).
  Much has come out of the modern Minecraft era and it would be nice to bring
  it back to Beta 1.7.3.
* Performance enhancements.
* Code quality improvements.
* New APIs, to complete the Beta 1.7.3 modding story and adapt to the modern
  Java ecosystem.

To support these new features, Canyon depends on Java 8 and higher and integrates
modern libraries (such as the replacement for Google Collections, Google Guava).

## Credits

* [Paper](https://papermc.io/): build system, backports