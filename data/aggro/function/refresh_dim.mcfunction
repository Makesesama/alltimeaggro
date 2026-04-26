# Mark hostiles within 64 blocks of any player in this dim as "near"
execute as @a at @s run tag @e[type=#aggro:hostiles,distance=..64] add aggro_near

# Strip aggro_set only from hostiles far from every player (likely just chunk-loaded)
tag @e[type=#aggro:hostiles,tag=!aggro_near] remove aggro_set

# Clean up the temp tag
tag @e[type=#aggro:hostiles,tag=aggro_near] remove aggro_near
