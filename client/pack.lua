local isPacking = false
local N = exports['RxNotify']

lib.registerContext({
    id = 'pack_menu',
    title = _U('menu'),
    options = {
        {
            title = _U('pack'),
            description = _U('menu'),
            icon = 'fa-solid fa-briefcase',
            arrow = true,
            event = 'vw_drugs:client:checkDrugs',
            -- menu = 'option_menu',
        },        
    },
})

RegisterNetEvent('vw_drugs:packing', function()
    lib.showContext('pack_menu')
end)

function packDrugs(data, slot)
    TriggerEvent('vw_drugs:packing')
end
exports('packDrugs', packDrugs)
    
local optionMenu = {
    id = 'option_menu',
    title = _U('pack'),
    options = {
        
    },
}

AddEventHandler('vw_drugs:client:checkDrugs', function(args)
    optionMenu.options = {}
    for k, v in pairs(Config.ToPack) do
        print('Checking items')
        local isDisabled = false
        local itemAmt = exports.ox_inventory:GetItemCount(v.item)
        print(itemAmt)
        if itemAmt > 0 then
            if itemAmt < v.amt then 
                isDisabled = true 
            end
            optionMenu.options[#optionMenu.options + 1] = {
                title = v.label,
                description = _U('required_amount', v.amt),
                icon = v.icon,
                disabled = isDisabled,
                event = 'vw_drugs:client:startPacking',
                args = {input = v.item, amt = v.amt, output = v.result},
            }
        end
    end
    lib.registerContext(optionMenu)
    lib.showContext('option_menu')
end)

AddEventHandler('vw_drugs:client:startPacking', function(args)
    local success = lib.progressBar({
        duration = 20*1000,
        label = _U('packing'),
        useWhileDead = false,
        canCancel = true,
        disable = {move = true, combat = true, car = true},
        anim = {dict = 'mini@repair', clip = 'fixing_a_ped'}
    })
    if success then
        N:Notify(_U('packed'), _U('packed_success'), 'success')
        -- modify Item
        TriggerServerEvent('vw_drugs:giveItem', args.output, 1)
        TriggerServerEvent('vw_drugs:removeItem', 'plastic_bag', 1)
        TriggerServerEvent('vw_drugs:removeItem', args.input, args.amt)
    else
        N:Notify(_U('packed'), _U('packed_canceled'), "error")
    end
end)