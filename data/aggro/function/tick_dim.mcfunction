# Skip if no player in this dimension — saves selector work in the Nether/End when empty
execute unless entity @p run return 0

# 1. First-time pipeline (no Y gate): untagged mobs always get follow_range + aggro on the
#    next tick after they load. They get all three tags in one shot.
execute as @e[type=#aggro:hostiles,tag=!aggro_init] run attribute @s minecraft:follow_range base set 512
execute as @e[type=#aggro:hostiles,tag=!aggro_init] at @s run damage @s 0 minecraft:player_attack by @p
execute as @e[type=#aggro:hostiles,tag=!aggro_init] at @s run tag @s add aggro_set
execute as @e[type=#aggro:hostiles,tag=!aggro_init] run tag @s add aggro_init

# 2. Re-aggro path (refresh-driven). Y-gated to ±32 — only mobs with a chance of reaching
#    the player get the periodic damage tick. aggro_init is required so this only kicks in
#    after the first-time pipeline ran.
#    `positioned` shifts execution to a corner, the dx/dy/dz volume covers ±32 Y and effectively
#    unlimited horizontal, then `at @s` resets so `@p` resolves from the mob's actual position.
execute as @e[type=#aggro:hostiles,tag=!aggro_set,tag=aggro_init] at @s positioned ~-10000 ~-32 ~-10000 if entity @a[dx=20000,dy=64,dz=20000] at @s run damage @s 0 minecraft:player_attack by @p
execute as @e[type=#aggro:hostiles,tag=!aggro_set,tag=aggro_init] at @s positioned ~-10000 ~-32 ~-10000 if entity @a[dx=20000,dy=64,dz=20000] run tag @s add aggro_set
