# sinor-VehicleSpawner
- This Standalone script automatically spawns special vehicles on the server when at least one player is fully loaded into the world. It ensures proper vehicle networking and syncs vehicle states across all players, even if they join later.

# How It Works
- Vehicles spawn only after the first player is fully loaded into the world.
- The server saves vehicle health and syncs it for new players.
- Vehicles persist even if no players are nearby.

# Config
```lua
Config = {}
Config.respawnCommand = "respawnvehicles"
Config.SpecialVehiclesSpawn = {
    { vehicle = "adder", coords = vector4(-42.4, -1091.8, 26.42, 72.0) },
    { vehicle = "zentorno", coords = vector4(-30.4, -1080.8, 26.42, 90.0) }
-- add more here
}
```
# Installation
Open server.cfg and add the resource:

ensure sinor-VehicleSpawner


