
RegisterNetEvent('vw_drugs:giveItem', function(item, amount)
    local src = source
    local xPlayer = exports.qbx_core:GetPlayer(src)
    if xPlayer then
        xPlayer.Functions.AddItem(item, amount)
    end
end)

RegisterNetEvent('vw_drugs:removeItem', function(item, amount)
    local src = source
    local xPlayer = exports.qbx_core:GetPlayer(src)
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, amount)
    end
end)