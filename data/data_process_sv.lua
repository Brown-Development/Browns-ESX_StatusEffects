RegisterNetEvent('browns:statusBeginProcessData', function()
    local ESX = exports['es_extended']:getSharedObject()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.identifier
    local result = MySQL.query.await('SELECT statuses FROM browns_status_effects WHERE identifier = ?', { identifier })
    if result[1] then 
        local metadata = json.decode(result[1].statuses)
        local settings = {} 
        for _, meta in ipairs(metadata) do 
            if meta.name then 
                settings[meta.name] = {
                    percent = meta.percent
                }
            end
        end
        local hungerValue = math.floor(tonumber(settings['hunger'].percent))
        local thirstValue = math.floor(tonumber(settings['thirst'].percent))
        local data = { hunger = hungerValue, thirst = thirstValue }
        TriggerClientEvent('browns:updateStatus', src, data)  
    else
    end
end)