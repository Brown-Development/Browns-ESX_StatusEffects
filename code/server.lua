local ESX = exports['es_extended']:getSharedObject()
RegisterNetEvent('browns:database:updateStatusServer', function()
    local src = source 
    local player = ESX.GetPlayerFromId(src)
    local identifier = player.getIdentifier()
    local statusData = {}
    for _, status in ipairs(player.variables.status) do
        table.insert(statusData, {
            name = status.name,
            val = status.val,
            percent = status.percent
        })

    end
    local existingEnt = MySQL.query.await('SELECT statuses FROM browns_status_effects WHERE identifier = ?', {
        identifier
    })
    while not existingEnt[1] do 
        Citizen.Wait(1000)
    end
    MySQL.update.await('UPDATE browns_status_effects SET statuses = ? WHERE identifier = ?', {
        json.encode(statusData), identifier
    })
end)
RegisterNetEvent('browns:status:updateNotify', function(bool)
    local src = source 
    local player = ESX.GetPlayerFromId(src)
    local identifier = player.getIdentifier()
    if bool then 
        local notifyOn = MySQL.query.await('SELECT notify FROM browns_status_effects WHERE identifier = ?', {
            identifier
        })
        local alterOn = notifyOn[1]
        if tostring(alterOn.notify) ~= 'true' then 
            MySQL.update.await('UPDATE browns_status_effects SET notify = ? WHERE identifier = ?', {
                'true', identifier
            })
            TriggerClientEvent('browns:esx_statusNotify', src, Config.Title, Config.Message, 1000 * Config.Duration, Config.Type)
        else
        end
    else
        local notifyOff = MySQL.query.await('SELECT notify FROM browns_status_effects WHERE identifier = ?', {
            identifier
        })
        local alterOff = notifyOff[1]
        if tostring(alterOff.notify) ~= 'false' then 
            MySQL.update.await('UPDATE browns_status_effects SET notify = ? WHERE identifier = ?', {
                'false', identifier
            })
        else
        end
    end
end)
