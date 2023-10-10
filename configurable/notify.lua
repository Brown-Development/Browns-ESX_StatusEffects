RegisterNetEvent('browns:esx_statusNotify', function(header, msg, time, types)
    if Config.Notifications == 'ox_lib' then 
        lib.notify({
            title = header,
            description = msg,
            type = types,
            duration = time,
            position = 'top'
        })
    elseif Config.Notifications == 'okok' then 
        exports['okokNotify']:Alert(header, msg, time, types, true)
    elseif Config.Notifications == 'custom' then 
        -- add your notification logic here
    end
end)