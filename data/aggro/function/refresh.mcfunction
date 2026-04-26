# Per-dimension refresh
execute in minecraft:overworld run function aggro:refresh_dim
execute in minecraft:the_nether run function aggro:refresh_dim
execute in minecraft:the_end run function aggro:refresh_dim

# Re-arm the timer (30s)
schedule function aggro:refresh 600t replace
