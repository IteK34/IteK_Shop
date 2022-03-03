Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

local blips = {
    {title="Épicerie", colour=2, id=52, x = 25.742, y = -1345.741, z = 28.497, heading = 269.00},
    {title="Épicerie", colour=2, id=52, x = -1221.6917, y = -908.2432, z = 11.3264, heading = 34.3346},
    {title="Épicerie", colour=2, id=52, x = 1164.9121, y = -323.5320, z = 68.2051, heading = 99.4284},
    {title="Épicerie", colour=2, id=52, x = 1134.1248, y = -982.4278, z = 45.4158, heading = 280.9229},
    {title="Épicerie", colour=2, id=52, x = -47.3156, y =-1758.6967, z = 28.4210, heading = 47.0666},
    {title="Épicerie", colour=2, id=52, x = 2555.5496, y = 380.8320, z = 107.6230, heading = 354.7616},
    {title="Épicerie", colour=2, id=52, x = 372.9843, y = 328.0479, z = 102.5664, heading = 258.4908},
    {title="Épicerie", colour=2, id=52, x = -1486.1849, y = -377.9953, z = 39.1634, heading = 140.8673},
    {title="Épicerie", colour=2, id=52, x = -706.0665, y = -914.5851, z = 18.2156, heading = 82.1365},
    {title="Épicerie", colour=2, id=52, x = -1819.4995, y = 793.4821, z = 137.0861, heading = 132.3013},
    {title="Épicerie", colour=2, id=52, x = -3040.5439, y = 583.9594, z = 6.9089, heading = 11.4733},
    {title="Épicerie", colour=2, id=52, x = 1392.5419, y = 3606.4106, z = 33.9809, heading = 197.8766},
    {title="Épicerie", colour=2, id=52, x = 1959.2020, y = 3741.5881, z = 31.3438, heading = 303.2496},
    {title="Épicerie", colour=2, id=52, x = 549.2612, y = 2669.7007, z = 41.1565, heading = 97.9101},
    {title="Épicerie", colour=2, id=52, x = 1728.6167, y =6416.7959, z = 34.0372, heading = 243.9244},

}

-- Menu --

local mainMenu = RageUI.CreateMenu("Superette", "SHOP")
local nourritures = RageUI.CreateSubMenu(mainMenu, "Nourritures", "SHOP")
local boissons = RageUI.CreateSubMenu(mainMenu, "Boissons", "SHOP")
local divers = RageUI.CreateSubMenu(mainMenu, "Divers", "SHOP")
local open = false

-- Glare --

mainMenu.Display.Glare = true
nourritures.Display.Glare = true
boissons.Display.Glare = true
divers.Display.Glare = true

-- Functions --

mainMenu.Closed = function() open = false end

function shop()
    if open then
        open = false
            RageUI.Visible(mainMenu, false)
        return
    else
        open = true
            RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Button("Nourritures", nil, {RightLabel = "→"}, true, {onActive = function() end}, nourritures)
                    RageUI.Button("Boissons", nil, {RightLabel = "→"}, true, {onActive = function() end}, boissons)
                    RageUI.Button("Divers", nil, {RightLabel = "→"}, true, {onActive = function() end}, divers)
                end)

                -- Nourritures --

                RageUI.IsVisible(nourritures, function()
                    RageUI.Button("Pain", nil, {RightLabel = Config.PriceBread}, true, {
                        onSelected = function()
                            TriggerServerEvent('{ IteK#0905 }:BuyBread')
                        end
                    })
                    RageUI.Button("Sandwich", nil, {RightLabel = Config.PriceSandwich}, true, {
                        onSelected = function()
                            TriggerServerEvent('{ IteK#0905 }:BuySandwich')
                        end
                    })
                end)

                -- Boissons --

                RageUI.IsVisible(boissons, function()
                    RageUI.Button("Eau", nil, {RightLabel = Config.PriceWater}, true, {
                        onSelected = function()
                            TriggerServerEvent('{ IteK#0905 }:BuyWater')
                        end
                    })
                    RageUI.Button("Coca-Cola", nil, {RightLabel = Config.PriceCola}, true, {
                        onSelected = function()
                            TriggerServerEvent('{ IteK#0905 }:BuyCola')
                        end
                    })
                end)

                -- Divers --

                RageUI.IsVisible(divers, function()
                    RageUI.Button("Téléphone", nil, {RightLabel = Config.PricePhone}, true, {
                        onSelected = function()
                            TriggerServerEvent('{ IteK#0905 }:BuyPhone')
                        end
                    })
                    RageUI.Button("Carte Sim", nil, {RightLabel = Config.PriceSim}, true, {
                        onSelected = function()
                            TriggerServerEvent('{ IteK#0905 }:BuySim')
                        end
                    })
                end)
            Citizen.Wait(0) -- Anti Crash
            end
        end)
    end
end

nourritures.Closed = function() end
boissons.Closed = function() end
divers.Closed = function() end

Citizen.CreateThread(function()
    while true do
      local wait = 1000
        for k,v in pairs(blips) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 2.0 then
                wait = 1
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler au vendeur")
                if IsControlJustPressed(1,51) then
                    shop()
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

-- Fin Functions --

-- Blips & Ped --

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


Citizen.CreateThread(function()
    local hash = GetHashKey("g_m_m_korboss_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    for _, infos in pairs(blips) do
    ped = CreatePed("PED_TYPE_CIVFEMALE", "g_m_m_korboss_01", infos.x, infos.y, infos.z, infos.heading, false, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, 1)
    end
end)
