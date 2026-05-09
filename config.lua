WS = {}

WS.EsxExport = true

WS.WeaponChests = {
    {
        item = "weapon_chest_pistol",
        weapon = "weapon_pistol" -- Waffe die man bekommt
    },
    {
        item = "weapon_chest_smg",
        weapon = "weapon_smg"
    },
}

WS.Messages = {
    alreadyOwned = "Du besitzt diese Waffe bereits.",
    gotWeapon = "Du hast eine %s erhalten."
}

function Notify(source, msg)
    TriggerClientEvent("ws_notify", source, "info", "Information", msg, 5000)
end
