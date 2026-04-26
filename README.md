# All Time Aggro

A Minecraft datapack that makes every hostile mob aggro on the nearest player at all times — regardless of distance, line of sight, or light level. If it's hostile, it's coming for you.

## What it does

- Sets `follow_range` to 512 blocks on every hostile mob
- Periodically pokes mobs with a zero-damage "player attack" so they treat the nearest player as their target
- Re-applies aggro every 30 seconds for mobs near players, so chunk reloads and target loss don't break the effect
- Resets aggro on player death and on dimension change
- Works in the Overworld, Nether, and End

Affected mobs are defined in `data/aggro/tags/entity_type/hostiles.json` — all vanilla hostiles including the Warden, Ender Dragon, and Wither.

## Requirements

- Minecraft **1.21.9 or newer** (pack format 101)
- Single-player or server worlds — both work

## Installation

### Option A: download the ZIP (recommended)

1. Grab `alltimeaggro.zip` from the [Releases](https://github.com/Makesesama/alltimeaggro/releases) page
2. Drop the zip into your world's `datapacks/` folder:
   - Singleplayer: `.minecraft/saves/<world>/datapacks/`
   - Server: `<server>/world/datapacks/`
3. In-game, run `/reload` (or rejoin the world)

### Option B: clone the repo

```sh
cd <your-world>/datapacks
git clone https://github.com/Makesesama/alltimeaggro.git
```

Then `/reload` in-game.

## Verifying it's loaded

Run `/datapack list` — you should see `[file/alltimeaggro]` (or `[file/alltimeaggro.zip]`) in the enabled list. Hostile mobs within ~64 blocks of you should start pathing toward you immediately.

## Uninstalling

Run `/datapack disable "file/alltimeaggro"`, then delete the folder or zip from `datapacks/`.

Note: mobs already given the extended `follow_range` keep that attribute until they unload. To fully reset, kill affected mobs or reload the world.

## License

Do whatever you want with it.
