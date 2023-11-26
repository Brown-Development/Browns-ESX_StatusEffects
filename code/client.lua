local ESX = exports['es_extended']:getSharedObject()
local drawEffects = false 
local status = nil
RegisterNetEvent('browns:updateStatus')
AddEventHandler('browns:updateStatus', function(data)
    local ply = PlayerPedId()
    local foodData = data.hunger
    local drinkData = data.thirst
    if not IsEntityDead(ply) then 
        if foodData <= Config.HungerAmount or drinkData <= Config.ThirstAmount then 
            status = true
            TriggerServerEvent('browns:status:updateNotify', status) 
            Citizen.Wait(100)
            drawEffects = true
        else
            status = false
            TriggerServerEvent('browns:status:updateNotify', status)
            Citizen.Wait(100)
            drawEffects = false 
        end
    else
        drawEffects = false 
    end
    DoEffect()
end)

function DoEffect()
    while true do 
        Citizen.Wait(1000)
        if drawEffects then 
            AnimpostfxPlay(Config.Effect, 1000, false)
            SendNUIMessage({
                play = 'playHeartbeat',
            })
        else
            SendNUIMessage({
                stop = 'stopHeartbeat',
            })
            break
        end
    end
end