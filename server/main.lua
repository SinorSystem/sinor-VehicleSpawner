local spawnedVehicles = {} 
local hasSpawnedVehicles = false 

local function spawnVehicles()
    if hasSpawnedVehicles then return end 
        for _, data in pairs(Config.SpecialVehiclesSpawn) do
            local vehicleHash = GetHashKey(data.vehicle)
            local vehicle = CreateVehicle(vehicleHash, data.coords.x, data.coords.y, data.coords.z, data.coords.w, true, false)
        while not DoesEntityExist(vehicle) do
        Wait(100) 
    end
        local netId = NetworkGetNetworkIdFromEntity(vehicle)
            if netId then
                table.insert(spawnedVehicles, netId)
                TriggerClientEvent("vehicleSpawner:manageVehicle", -1, netId, 1000) 
            else
        end
    end
    hasSpawnedVehicles = true
end

RegisterNetEvent("vehicleSpawner:firstPlayerLoaded", function()
    if not hasSpawnedVehicles then
        spawnVehicles()
    end
end)

RegisterCommand("respawnVehicles", function(source, args, rawCommand)
    print(" Respawning vehicles...")
    hasSpawnedVehicles = false 
    spawnVehicles()
end, true)
