local holdingUp = false
local store = ""
local blipRobbery = nil
local tooFarCust = false
local entitys = {}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
Citizen.CreateThread(function()
	while true do
	AddRelationshipGroup('Merryweather')
	RequestModel(-1275859404)

	if #entitys < Stores.npcMax then
		for k,v in pairs(Stores.npcNum) do
			x = v.x + math.random(0,Stores.maxX)
			y = v.y + math.random(0,Stores.maxY)
			z = v.z + math.random(0,Stores.maxZ)
			--h = v.h + math.random(0,Stores.)
			merryped1 = CreatePed(30, -1275859404, x, y, z, v.h, true, false)
			SetPedArmour(merryped1, 500)
			SetPedAsEnemy(merryped1, true)
			SetPedRelationshipGroupHash(merryped1, 'Merryweather')
			GiveWeaponToPed(merryped1, GetHashKey(v.weaponsName), 550, false, true)
			TaskCombatPed(merryped1, GetPlayerPed(-1))
			SetPedCombatAbility(merryped1, 2)
			SetPedAccuracy(merryped1, 100)
			SetPedCombatRange(merryped1, 2)
			SetPedCombatMovement(merryped1, 3)
			SetPedDropsWeaponsWhenDead(merryped1, false)
			table.insert(entitys, merryped1)
		end
	end
	if #entitys >= Stores.npcMax then
		for i, entity in pairs(entitys) do
			if IsPedDeadOrDying(entity, 1) == 1 then
				table.remove(entitys, i)
			end
		end
	end
	Citizen.Wait(Stores.timeout)
	end
end)
Citizen.CreateThread(function()
	print(Stores.npcNum[1].x, Stores.npcNum[1].y, Stores.npcNum[1].z)
	local blip = AddBlipForCoord(Stores.npcNum[1].x, Stores.npcNum[1].y, Stores.npcNum[1].z)

	zoneblip = AddBlipForRadius(Stores.npcNum[1].x, Stores.npcNum[1].y, Stores.npcNum[1].z, 80*25.0)
	SetBlipSprite(zoneblip, 1)
	SetBlipColour(zoneblip, 1)
	SetBlipAlpha(zoneblip, 120)
	--↑光圈圓圈
	
	SetBlipSprite (blip, Stores.sprite)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.9)
	SetBlipColour (blip, Stores.color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Stores.name)
	EndTextCommandSetBlipName(blip)
end)
