local ESX = nil
local isDrifting = false
local currentGravityLevel = Config.DefaultGravityLevel

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if IsControlPressed(0, 21) and not isDrifting then -- Left Shift key
                isDrifting = true
                SetVehicleGravityAmount(vehicle, GetGravityLevel(currentGravityLevel))
                Citizen.SetTimeout(Config.DriftCooldown, function()
                    isDrifting = false
                    SetVehicleGravityAmount(vehicle, 0.98)
                end)
            end
        end
    end
end)

function GetGravityLevel(level)
    for _, gravityLevel in ipairs(Config.GravityLevels) do
        if gravityLevel.level == level then
            return gravityLevel.gravity
        end
    end
    return 0.98
end

RegisterNetEvent('driftGravitySystem:setGravityLevel')
AddEventHandler('driftGravitySystem:setGravityLevel', function(level)
    currentGravityLevel = level
end)