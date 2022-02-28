ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Events --

RegisterNetEvent('{ IteK#0905 }:BuyBread')
AddEventHandler('{ IteK#0905 }:BuyBread', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local price = 2
  local money = xPlayer.getMoney()
    if money >= price then
      xPlayer.removeMoney(price)
      xPlayer.addInventoryItem('bread', 1)
      TriggerClientEvent('esx:showNotification', source, "Vous avez acheté ~g~x1 ~b~Pain~s~.")
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argents")
    end
end)

RegisterNetEvent('{ IteK#0905 }:BuySandwich')
AddEventHandler('{ IteK#0905 }:BuySandwich', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local price = 4
  local money = xPlayer.getMoney()
    if money >= price then
      xPlayer.removeMoney(price)
      xPlayer.addInventoryItem('sandwich', 1)
      TriggerClientEvent('esx:showNotification', source, "Vous avez acheté ~g~x1 ~b~Sandwich~s~.")
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argents")
    end
end)

RegisterNetEvent('{ IteK#0905 }:BuyWater')
AddEventHandler('{ IteK#0905 }:BuyWater', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local price = 2
  local money = xPlayer.getMoney()
    if money >= price then
      xPlayer.removeMoney(price)
      xPlayer.addInventoryItem('water', 1)
      TriggerClientEvent('esx:showNotification', source, "Vous avez acheté ~g~x1 ~b~Bouteille d\'Eau~s~.")
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argents")
    end
end)

RegisterNetEvent('{ IteK#0905 }:BuyCola')
AddEventHandler('{ IteK#0905 }:BuyCola', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local price = 4
  local money = xPlayer.getMoney()
    if money >= price then
      xPlayer.removeMoney(price)
      xPlayer.addInventoryItem('cola', 1)
      TriggerClientEvent('esx:showNotification', source, "Vous avez acheté ~g~x1 ~b~Canette de Coca-Cola~s~.")
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argents")
    end
end)

RegisterNetEvent('{ IteK#0905 }:BuyPhone')
AddEventHandler('{ IteK#0905 }:BuyPhone', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local price = 350
  local money = xPlayer.getMoney()
    if money >= price then
      xPlayer.removeMoney(price)
      xPlayer.addInventoryItem('phone', 1)
      TriggerClientEvent('esx:showNotification', source, "Vous avez acheté ~g~x1 ~b~Téléphone~s~.")
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argents")
    end
end)

RegisterNetEvent('{ IteK#0905 }:BuySim')
AddEventHandler('{ IteK#0905 }:BuySim', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local price = 15
  local money = xPlayer.getMoney()
    if money >= price then
      xPlayer.removeMoney(price)
      xPlayer.addInventoryItem('sim', 1)
      TriggerClientEvent('esx:showNotification', source, "Vous avez acheté ~g~x1 ~b~Sim~s~.")
    else
      TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d\'argents")
    end
end)