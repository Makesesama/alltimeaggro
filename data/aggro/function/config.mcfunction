# Tunables. Edit these to taste, then /reload in-game.
scoreboard objectives add aggro dummy

# Vertical aggro window: mobs only aggro if a player is within ±y_range vertically.
# 32 ≈ one chunk above/below. Raise for more aggression, lower for better TPS.
scoreboard players set $y_range aggro 24

# Mob follow_range attribute (blocks). Vanilla is ~16-40 depending on mob; higher
# values make pathfinding more expensive (cost scales ~quadratically).
# 128 is a good balance with the periodic re-aggro damage tick handling longer-range targeting.
scoreboard players set $follow_range aggro 128

# Derived: dy = y_range * 2 (full height of the volume box used by `if entity`)
scoreboard players operation $dy aggro = $y_range aggro
scoreboard players operation $dy aggro += $y_range aggro

# Stash all in storage so tick_dim can read them via macros
execute store result storage aggro:config y_range int 1 run scoreboard players get $y_range aggro
execute store result storage aggro:config dy int 1 run scoreboard players get $dy aggro
execute store result storage aggro:config follow_range int 1 run scoreboard players get $follow_range aggro
