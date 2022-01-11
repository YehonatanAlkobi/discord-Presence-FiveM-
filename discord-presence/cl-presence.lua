--all rights reserved to "chick"
local QBCore = nil

function FirstToUpper(input)
    return (input:gsub("^%l", string.upper))
end

CreateThread(function()
    UpdateDiscordRichPresence("Selecting Character")
    
    while not QBCore do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
        Wait(500)
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData then
        local plyID = GetPlayerServerId(PlayerId())
        local plyName = (FirstToUpper(PlayerData.charinfo.firstname) .. " " .. FirstToUpper(PlayerData.charinfo.lastname))
        UpdateDiscordRichPresence("[" .. plyID .. "] " .. plyName .. " (" .. PlayerData.citizenid .. ")")
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    UpdateDiscordRichPresence("Selecting Character")
end)

function UpdateDiscordRichPresence(msg)
    SetDiscordAppId(--appID)
    SetDiscordRichPresenceAsset("whitelistlogo")
    SetRichPresence(msg)
    SetDiscordRichPresenceAssetSmall("whitelistlogo")
    SetDiscordRichPresenceAssetSmallText("discord.gg/nsUReEpKtt")
end