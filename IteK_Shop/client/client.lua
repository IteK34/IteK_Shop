Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

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
            CamStop()
            RageUI.Visible(mainMenu, false)
        return
    else
        open = true
            CamActive()
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

Citizen.CreateThread(function()
    while true do
      local wait = 1000
        for k,v in pairs(Config.Position) do
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

function CamActive()
    cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
    SetCamCoord(cam, 25.0418, -1345.6079, 30.0002, 91.6392, true, 0)
    RenderScriptCams(500, 100, 1000, 1000, 100)
    PointCamAtCoord(cam, 22.2166, -1345.7028, 30.3170)
    DisplayRadar(false)
end

function CamStop()
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyAllCams(true)
    DisplayRadar(false)
end

nourritures.Closed = function() end
boissons.Closed = function() end
divers.Closed = function() end

-- Fin Functions --

-- Blips & Ped --

Citizen.CreateThread(function() 
    for k, v in pairs(Config.Position) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite  (blip, Config.blipsprite)
            SetBlipDisplay (blip, Config.blipdisplay)
            SetBlipScale   (blip, Config.blipscale)
            SetBlipColour  (blip, Config.blipcolour)
            SetBlipAsShortRange(blip, true) 
            BeginTextCommandSetBlipName('STRING') 
            AddTextComponentSubstringPlayerName(Config.blipname)
            EndTextCommandSetBlipName(blip) 
    end 
end)


Citizen.CreateThread(function()
    local hash = GetHashKey("g_m_m_korboss_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "g_m_m_korboss_01", 24.3528, -1345.7141, 28.4970, 269.0016, false, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, 1)
end)