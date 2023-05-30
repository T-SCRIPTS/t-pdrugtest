--------------------------------------------------------------------------------------------
-------------------------------------- MADE BY TAALA ---------------------------------------
-------------------------------------- YOU NEED HELP? JOIN MY DISCORD ----------------------
--------------------------------------------------------------------------------------------

RegisterNetEvent('t-pdrugtest:TestPlayerv')
AddEventHandler('t-pdrugtest:TestPlayer', function(tested)
    TriggerClientEvent("t-pdrugtest:TestHandler", tested, source)
    if Config.Norifypaska then
        TriggerClientEvent("t-pdrugtest:TestNotify", tested, Config.Text.GettingTestedMsg .. GetPlayerName(source))
    end
end)

RegisterNetEvent("t-pdrugtest:TestCallback")
AddEventHandler("t-pdrugtest:TestCallback", function(tester, result)
    if result then
        lib.notify(source, {
            description = 'Henkilö on käyttänyt huumeita',
            position = 'center-right',
            icon = 'user-secret',
            type = 'error'
        })
    else
        lib.notify(source, {
            description = 'Pelaaja ei ole käyttänyt huumeita',
            position = 'center-right',
            icon = 'user-secret',
            type = 'success'
        })
    end
end)

--------------------------------------------------------------------------------------------
-------------------------------------- MADE BY TAALA ---------------------------------------
-------------------------------------- YOU NEED HELP? JOIN MY DISCORD ----------------------
--------------------------------------------------------------------------------------------