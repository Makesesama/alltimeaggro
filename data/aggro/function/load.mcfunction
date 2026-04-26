# Track player deaths so we can detect respawn
scoreboard objectives add aggro_deaths deathCount

# Load tunables (y_range, dy) into storage for macro use in tick_dim
function aggro:config

# Start the refresh loop (replaces any pending schedule on /reload)
schedule function aggro:refresh 600t replace
