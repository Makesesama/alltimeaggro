# Consume the death counter for this player
scoreboard players reset @s aggro_deaths

# Wipe aggro tags in the player's current dimension so every loaded hostile re-aggros.
# Called via `execute as @a[...] at @s`, so @e is scoped to the respawn dimension.
tag @e[type=#aggro:hostiles] remove aggro_set
