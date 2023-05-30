--------------------------------------------------------------------------------------------
-------------------------------------- MADE BY TAALA ---------------------------------------
-------------------------------------- YOU NEED HELP? JOIN MY DISCORD ----------------------
--------------------------------------------------------------------------------------------

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESx = obj end)
        Citizen.Wait(0)
    end
end)

ESX = exports["es_extended"]:getSharedObject()

if Config.EnablePuhdista then
    Registercommand(Config.Puhdista, function()
        if huumePositive then
            huumePositive = false -- älä laita true ei toimi muute <3
            huumeTimer = 0
            lib.notify(source, {
                description = 'Puhdistit suusi kokonaan..',
                position = 'center-right',
                icon = 'cannabis',
                type = 'success'
            })
        elseif not huumePositive then
            lib.notify(source, {
                description = 'Sinun suusi onjo saatan puhas..',
                position = 'center-right',
                icon = 'cannabis',
                type = 'error'
            })
        end
    end)
end

Registercommand(Config.Puhdista, function()
    local playerCoords = GetEntityCoords(plyPed)
    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        local targetId = GetPlayerServerId(player)
        local distance = #(playerCoords-GetEntityCoords(targetPed))
        id targetPed ~= plyPed then
            if distance <= huumeTestDistance then
                TriggerServerEvent('t-pdrugtest:TestPlayer', targetId)
            elseif
                lib.notify(source, {
                    description = 'Nyt jokin meni pieleen..',
                    position = 'center-right',
                    icon = 'user-objected',
                    type = 'error'
               })
            end
        end
    end
end)

RegisterNetEvent('t-pdrugtest:TestHandler')
AddEventHandler('t-pdrugtest:TestHandler', function(tester)
    if huumePositive then
        TriggerServerEvent('t-pdrugtest:TestCallback', tester, true)
    elseif not huumePositive then
        TriggerServerEvent('t-pdrugtest:TestCallback', tester, false)
    end
end)

function HuumeThread()
    plyPed = PlayerPedId()
    if isPedDrug(plyPed) then
        huumetTimer = Config.HuumePeseentyy
    else
        huumePositive = true
        huumetTimer = Config.HuumePeseentyy
        Citizen.CreateThread(HuumeThreadTimer)
    end
end

function  HuumeThreadTimer()
    while huumePositive do 
        Citizen.Wait(1000)
        if huumeTimer == 0 then
            huumePositive = false
        else 
            huumeTimer = huumeTimer - 1
        end
    end
end
            
--------------------------------------------------------------------------------------------
-------------------------------------- MADE BY TAALA ---------------------------------------
-------------------------------------- YOU NEED HELP? JOIN MY DISCORD ----------------------
--------------------------------------------------------------------------------------------