# Skip if no player in this dimension — saves selector work in the Nether/End when empty
execute unless entity @p run return 0

# 1. First-time pipeline (Y-gated via $(y_range) from aggro:config): untagged mobs get
#    follow_range + aggro on the next tick after they load AND a player is vertically near.
#    Cave mobs far below stay quiet until you approach — keeps pathfinding cost off the TPS budget.
$execute as @e[type=#aggro:hostiles,tag=!aggro_init] at @s positioned ~-10000 ~-$(y_range) ~-10000 if entity @a[dx=20000,dy=$(dy),dz=20000] run attribute @s minecraft:follow_range base set $(follow_range)
$execute as @e[type=#aggro:hostiles,tag=!aggro_init] at @s positioned ~-10000 ~-$(y_range) ~-10000 if entity @a[dx=20000,dy=$(dy),dz=20000] at @s run damage @s 0 minecraft:player_attack by @p
$execute as @e[type=#aggro:hostiles,tag=!aggro_init] at @s positioned ~-10000 ~-$(y_range) ~-10000 if entity @a[dx=20000,dy=$(dy),dz=20000] run tag @s add aggro_set
$execute as @e[type=#aggro:hostiles,tag=!aggro_init] at @s positioned ~-10000 ~-$(y_range) ~-10000 if entity @a[dx=20000,dy=$(dy),dz=20000] run tag @s add aggro_init

# 2. Re-aggro path (refresh-driven). Same Y gate — only mobs with a chance of reaching
#    the player get the periodic damage tick. aggro_init is required so this only kicks in
#    after the first-time pipeline ran.
#    `positioned` shifts execution to a corner, the dx/dy/dz volume covers ±y_range Y and
#    effectively unlimited horizontal, then `at @s` resets so `@p` resolves from the mob's pos.
$execute as @e[type=#aggro:hostiles,tag=!aggro_set,tag=aggro_init] at @s positioned ~-10000 ~-$(y_range) ~-10000 if entity @a[dx=20000,dy=$(dy),dz=20000] at @s run damage @s 0 minecraft:player_attack by @p
$execute as @e[type=#aggro:hostiles,tag=!aggro_set,tag=aggro_init] at @s positioned ~-10000 ~-$(y_range) ~-10000 if entity @a[dx=20000,dy=$(dy),dz=20000] run tag @s add aggro_set
