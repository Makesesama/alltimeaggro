# Reset the player's dimension tag to match where they are now
tag @s remove aggro_dim_overworld
tag @s remove aggro_dim_nether
tag @s remove aggro_dim_end
execute if dimension minecraft:overworld run tag @s add aggro_dim_overworld
execute if dimension minecraft:the_nether run tag @s add aggro_dim_nether
execute if dimension minecraft:the_end run tag @s add aggro_dim_end

# Force every hostile in the new dimension to re-aggro on the next tick.
# @e is dim-scoped to the player's current dimension here.
tag @e[type=#aggro:hostiles] remove aggro_set
