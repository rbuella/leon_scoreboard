local isScoreboardActive = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 57) and IsInputDisabled(0) then
			if isScoreboardActive then
				isScoreboardActive = false
				SetNuiFocus(false)
				SendNUIMessage({action = 'disable'})
				Citizen.Wait(500)
			else
				TriggerEvent("leonmaximus:closeAllUI")
				Citizen.Wait(100)
				ESX.TriggerServerCallback('leon_scoreboard:get_all_data', function(data)
					isScoreboardActive = true
					SetNuiFocus(true, true)
					SendNUIMessage({action = 'enable', serverdata = data})
					Citizen.Wait(500)
				end)
			end
		end
	end
end)

RegisterNetEvent('leonmaximus:closeAllUI')
AddEventHandler('leonmaximus:closeAllUI', function()
	isScoreboardActive = false
	SetNuiFocus(false)
	SendNUIMessage({action = 'disable'})
end)

RegisterNetEvent('leonmaximus:updatePing')
AddEventHandler('leonmaximus:updatePing', function(connectedPlayers)
	SendNUIMessage({
		action  = 'updatePing',
		players = connectedPlayers
	})
end)