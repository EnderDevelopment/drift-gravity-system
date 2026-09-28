local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('driftGravitySystem:getGravityLevel', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.Sync.fetchScalar('SELECT gravity_level FROM drift_gravity WHERE player_id = @player_id', {
        ['@player_id'] = xPlayer.identifier
    })
    if result then
        cb(result)
    else
        cb(Config.DefaultGravityLevel)
    end
end)

RegisterNetEvent('driftGravitySystem:saveGravityLevel')
AddEventHandler('driftGravitySystem:saveGravityLevel', function(level)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE drift_gravity SET gravity_level = @gravity_level WHERE player_id = @player_id', {
        ['@gravity_level'] = level,
        ['@player_id'] = xPlayer.identifier
    }, function(rowsChanged)
        if rowsChanged == 0 then
            MySQL.Async.execute('INSERT INTO drift_gravity (player_id, gravity_level) VALUES (@player_id, @gravity_level)', {
                ['@player_id'] = xPlayer.identifier,
                ['@gravity_level'] = level
            })
        end
    end)
end)