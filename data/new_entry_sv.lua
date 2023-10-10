AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then 
        MySQL.update.await('UPDATE browns_status_effects SET notify = ? WHERE adjust = ?', {
            'false', 'true'
        })
        local players = MySQL.query.await('SELECT * FROM users')
        for i = 1, #players do
            local inserts = players[i]
            local selectExistingData = MySQL.query.await('SELECT * FROM browns_status_effects WHERE identifier = ?', {
                inserts.identifier
            })
            if not selectExistingData[1] then 
                MySQL.insert.await('INSERT INTO browns_status_effects (statuses, identifier) VALUES (?, ?)', {
                    inserts.browns_stockstatus, inserts.identifier
                })
            end
        end
        GenerateNewData()
    end
end)
function GenerateNewData()
    while true do
        Citizen.Wait(1000 * Config.NewPlayerCheck)
        local players = MySQL.query.await('SELECT * FROM users')
        for i = 1, #players do
            local inserts = players[i]
            local selectExistingData = MySQL.query.await('SELECT * FROM browns_status_effects WHERE identifier = ?', {
                inserts.identifier
            })
            if not selectExistingData[1] then 
                MySQL.insert.await('INSERT INTO browns_status_effects (statuses, identifier) VALUES (?, ?)', {
                    inserts.browns_stockstatus, inserts.identifier
                })
            else
            end
        end
    end
end

