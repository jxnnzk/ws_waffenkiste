local ESX

if WS.EsxExport then
    ESX = exports["es_extended"]:getSharedObject()
else
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

for _, data in pairs(WS.WeaponChests) do
    ESX.RegisterUsableItem(data.item, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then return end

        local weapon = data.weapon
        if not weapon or weapon == ""  then return end

        if xPlayer.hasWeapon(weapon) then
            Notify(source, WS.Messages.alreadyOwned)
            return
        end

        local item = xPlayer.getInventoryItem(data.item)
        if not item or item.count < 1 then return end

        xPlayer.removeInventoryItem(data.item, 1)
        xPlayer.addWeapon(data.weapon, 0)

        local label = ESX.GetWeaponLabel(weapon) or weapon
        Notify(source, WS.Messages.gotWeapon:format(label))
    end)
end