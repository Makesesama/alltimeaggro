# All Time Aggro

A Minecraft datapack that makes every hostile mob aggro on the nearest player at all times — regardless of distance, line of sight, or light level. If it's hostile, it's coming for you.

## What it does

- Sets `follow_range` to 128 blocks on every hostile mob (Y-gated to ±24 from a player to skip deep cave mobs)
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

## Configuration

Tunables live in `data/aggro/function/config.mcfunction`. Edit, save, then `/reload` in-game.

| Variable | Default | What it does |
| --- | --- | --- |
| `$y_range` | `24` | Vertical aggro window in blocks. Mobs only aggro if a player is within ±`y_range` Y. Lower = better TPS, fewer cave mobs swarming you from far below. |
| `$follow_range` | `128` | `follow_range` attribute set on each hostile. Pathfinding cost scales ~quadratically with this — keep modest. The periodic re-aggro tick handles longer-range targeting. |
| `$dy` | auto | Computed as `y_range * 2`. Don't edit. |

### Changing values in-game without /reload

The macros read from storage every tick, so you can override at runtime:

```
/data modify storage aggro:config y_range set value 16
/data modify storage aggro:config dy set value 32
/data modify storage aggro:config follow_range set value 64
```

Caveats:
- If you change `y_range`, set `dy` to `y_range * 2` manually.
- Runtime overrides are lost on `/reload` (config re-runs and resets to file defaults).
- `follow_range` only applies to *newly loaded* mobs. Existing mobs keep their old attribute until they unload.

## Verifying it's loaded

Run `/datapack list` — you should see `[file/alltimeaggro]` (or `[file/alltimeaggro.zip]`) in the enabled list. Hostile mobs within ~64 blocks of you should start pathing toward you immediately.

## Uninstalling

Run `/datapack disable "file/alltimeaggro"`, then delete the folder or zip from `datapacks/`.

Note: mobs already given the extended `follow_range` keep that attribute until they unload. To fully reset, kill affected mobs or reload the world.

## License

Do whatever you want with it.
