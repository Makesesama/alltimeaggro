# Track player deaths so we can detect respawn
scoreboard objectives add aggro_deaths deathCount

# Start the refresh loop (replaces any pending schedule on /reload)
schedule function aggro:refresh 600t replace
