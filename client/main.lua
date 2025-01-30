local managedVehicles = {}

local function manageVehicle(netId, health)
    local vehicle = NetworkGetEntityFromNetworkId(netId) 
    if DoesEntityExist(vehicle) then
        print("Managing vehicle with NetID:", netId)
        SetVehicleEngineHealth(vehicle, health)
        SetVehicleBodyHealth(vehicle, health)
        SetEntityAsMissionEntity(vehicle, true, true) 
        SetVehicleOnGroundProperly(vehicle) 
        table.insert(managedVehicles, vehicle) 
    else
    end
end

RegisterNetEvent("vehicleSpawner:manageVehicle", function(netId, health)
    print("Received vehicle management event for NetID:", netId)
    manageVehicle(netId, health)
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("vehicleSpawner:firstPlayerLoaded")
end)
