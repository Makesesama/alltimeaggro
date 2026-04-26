# Each player carries a tag matching their current dimension. If the player is in a
# dimension whose tag is missing, they just changed dimensions — fire dim_change.
execute if dimension minecraft:overworld unless entity @s[tag=aggro_dim_overworld] run function aggro:dim_change
execute if dimension minecraft:the_nether unless entity @s[tag=aggro_dim_nether] run function aggro:dim_change
execute if dimension minecraft:the_end unless entity @s[tag=aggro_dim_end] run function aggro:dim_change
