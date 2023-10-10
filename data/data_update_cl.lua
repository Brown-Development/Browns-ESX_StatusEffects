Citizen.CreateThread(function()
    local ESX = exports['es_extended']:getSharedObject()
    while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(0)
    end
    Citizen.Wait(10000)
    while true do 
        Citizen.Wait(1000 * Config.GenerateData)
        TriggerServerEvent('browns:database:updateStatusServer')
    end
end)