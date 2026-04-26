# Per-dimension aggro logic. @e selectors are dim-scoped, so we have to enter each dim explicitly.
execute in minecraft:overworld run function aggro:tick_dim with storage aggro:config
execute in minecraft:the_nether run function aggro:tick_dim with storage aggro:config
execute in minecraft:the_end run function aggro:tick_dim with storage aggro:config

# Per-player dimension-change detection (runs at the player's actual dim)
execute as @a at @s run function aggro:dim_check

# On player death/respawn: clear aggro tags in the player's current dimension
execute as @a[scores={aggro_deaths=1..}] at @s run function aggro:on_death
