local N = exports['RxNotify']


RegisterNetEvent('vw_drugs:progress', function(zone)
    
    local data = Config.HarvestLocations[zone]
    local weight = exports.ox_inventory:GetPlayerWeight()
    local maxWeight = exports.ox_inventory:GetPlayerMaxWeight()
    -- data does not exist
    if not data then 
        print("No Data")
        return
    end
    local ty = data.type

    if (maxWeight - weight) > 0 then
        if ty == 'r' then
            local success = lib.progressBar({
                duration = data.time,
                label = _U('harvesting'),
                useWhileDead = false,
                canCancel = true,
                disable = {move = true, combat = true, car = true},
                anim = {dict = 'mini@repair', clip = 'fixing_a_ped'}
            })
            if success then
                N:Notify(_U('harvest'), _U('harvest_success'), 'success')
                -- add Item
                TriggerServerEvent('vw_drugs:giveItem', data.giveItem, data.giveAmount)
            else
                N:Notify(_U('harvest'), _U('harvest_canceled'), "error")
            end
        elseif ty == 'p' then 
            local able = true
            for i, value in ipairs(data.removeItems) do 
                local itemCount = exports.ox_inventory:GetItemCount(value)
                if itemCount < data.removeAmount[i] then 
                    able = false
                end
            end
            if able then
                local success = lib.progressBar({
                    duration = data.time,
                    label = _U('processing'),
                    useWhileDead = false,
                    canCancel = true,
                    disable = {move = true, combat = true, car = true},
                    anim = {dict = 'mini@repair', clip = 'fixing_a_ped'}
                })
                if success then
                    N:Notify(_U('process'), _U('process_success'), 'success')
                    -- add Item
                    for i, value in ipairs(data.removeItems) do
                        TriggerServerEvent('vw_drugs:removeItem', value, data.removeAmount[i])
                    end
                    TriggerServerEvent('vw_drugs:giveItem', data.giveItem, data.giveAmount)
                else
                    N:Notify(_U('process'), _U('process_canceled'), "error")
                end
            else
                N:Notify(_U('process'), _U('missing_items'), 'error')
            end
        end
    else
        N:Notify(_U('process'), _U('inv_full'), "error")
    end

    

end)

CreateThread(function()
    for k, v in pairs(Config.HarvestLocations) do
        -- k = zone
        exports['ox_target']:addBoxZone({
            coords = v.coords,
            size = vec3(2, 2, 2),
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'drugs_' .. k,
                    label = v.label,
                    icon = 'fas fa-seedling',
                    distance = 3.0,
                    onSelect = function()
                        TriggerEvent("vw_drugs:progress", k)
                    end
                }
            }
        })
    end
end)