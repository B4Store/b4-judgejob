local QBCore = exports[Config.Core]:GetCoreObject()

Citizen.CreateThread(function()
    -- judge hammer
    exports[Config.Target]:AddBoxZone("judge_1", vector3(253.27, -1107.79, 30.08), 0.4, 0.2, { 
        name = "judge_1",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "b4-judge:client:judgehammer",
                icon = "fas fa-circle",
                label = "Judge Hammer",
                job = "judge",
            },
        },
        distance = 2.5
    })
    -- judge Duty
    exports[Config.Target]:AddBoxZone("judge_2", vector3(249.48, -1077.13, 29.29), 0.2, 0.6, {
        name = "judge_2",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:sign",
                icon = "fas fa-circle",
                label = "Judge Duty",
                job = "judge",
            },
        },
        distance = 2.5
    })
    -- judge elevator
    exports[Config.Target]:AddBoxZone("judge_3", vector3(253.39, -1082.97, 29.29), 0.4, 0.2, {
        name = "judge_3",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:elve:lift",
                icon = "fas fa-circle",
                label = "Judge Elevator",
                job = "judge",
            },
        },
        distance = 2.5
    })
    exports[Config.Target]:AddBoxZone("judge_4", vector3(253.39, -1082.97, 29.29), 0.4, 0.2, {
        name = "judge_4",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:elve:lift",
                icon = "fas fa-circle",
                label = "Judge Elevator",
                job = "judge",
            },
        },
        distance = 2.5
    })
    -- judge car
    exports[Config.Target]:AddTargetModel( `csb_vincent`, {
        options = {
            {
                type = "client",
                event = "b4-Judgegarage:client:OpenMenu",
                icon = "fas fa-circle",
                label = "Judge Car",
                job = "judge",
            },
        },
        distance = 1.5
    })
end)

-----------------------------------------------------------------------------------
--Signin/out Made by ( B4store )
-----------------------------------------------------------------------------------
-- event duty off
RegisterNetEvent('b4-judge:client:toggleOnDutyout', function()
    if onDuty then
        TriggerServerEvent("judge:server:UpdateCurrentCops")
        TriggerServerEvent("QBCore:ToggleDuty")
        TriggerEvent('b4-judgealerts:ToggleDuty', not onDuty)
        onDuty = false
    else
        QBCore.Functions.Notify('You are already out of service')
    end
end)
-- event duty on
RegisterNetEvent('b4-judge:client:toggleOnDutysign', function()
    if not onDuty then
        TriggerServerEvent("judge:server:UpdateCurrentCops")
        TriggerServerEvent("QBCore:ToggleDuty")
        TriggerServerEvent("B4-blips:server:updateBlips")
        TriggerEvent('b4-judgealerts:ToggleDuty', onDuty)
        onDuty = true
    else
        QBCore.Functions.Notify('You are already in service')
    end
end)
-- signim\out
RegisterNetEvent('judge:sign', function(data)
    exports[Config.Menu]:openMenu({
        {
            header = "Sign in/out 🧾",
            isMenuHeader = true,
        },
        {
            header = "Sign in",
            txt = "Go to your work judge !!",
            params = {
                event = "b4-judge:client:toggleOnDutysign"
            }
        },
        {
            header = "Sign out",
            txt = "Take reset and come back",
            params = {
                event = "b4-judge:client:toggleOnDutyout"
            }
        },
        {
            header = "Close ❌",
            txt = '',
            params = {
                event = 'b4-menu:closeMenu',
            }
        },
    })
end)
-----------------------------------------------------------------------------------
--Signin/out Made by ( B4store )
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--Sound System( B4store )
-----------------------------------------------------------------------------------
RegisterNetEvent('b4-judge:client:judgehammer', function()
	if Config.ElectricVehicleCharging then
		if IsHoldingElectricNozzle() then
			SetElectricNozzle("putback")
		else
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "judgehammer", 5.5)
            print ('judge_2')
		end
	else
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "judgehammer", 5.5)
        print ('judge_3')
	end
end)

RegisterNetEvent('b4-judge:client:judgehammer:special', function()
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "judgehammer", 5.5)
    print ('judge_1')
end)

-----------------------------------------------------------------------------------
--SoundSystem ( B4store )
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- ElevatorSystem ( B4store )
-----------------------------------------------------------------------------------
RegisterNetEvent('iDX:client:toFloor2', function()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    local coords = vector4(254.88, -1084.18, 36.13, 88.19)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
    Citizen.Wait(100)
    DoScreenFadeIn(1000)
end)

RegisterNetEvent('iDX:client:toFloor1', function()
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Citizen.Wait(10)
        end
    local coords = vector4(254.87, -1084.17, 29.29, 90.45)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
    Citizen.Wait(100)
    DoScreenFadeIn(1000)
end)

RegisterNetEvent('judge:elve:lift', function(data)
    exports[Config.Menu]:openMenu({
        {
            header = "🔨 Judge Lift (Choose Your Floor)",
            txt = "(Choose Your Floor 😎)",
            isMenuHeader = true
        },
        {
            id = 1,
            header = "Go To First Floor",
            txt = "# Left To Third Floor",
            icon = "fas fa-id-card",
            params = {
                event = "iDX:client:toFloor1",
            }
        },
        {
            id = 2,
            header = "Go To secound Floor",
            txt = "# Left To secound Floor",
            icon = "fas fa-id-card",
            params = {
                event = "iDX:client:toFloor2",
            }
        },
    })
end)
-----------------------------------------------------------------------------------
-- ElevatorSystem ( B4store )
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- VehicleSystem ( B4store )
-----------------------------------------------------------------------------------
RegisterNetEvent('b4-Judgegarage:client:OpenMenu', function()
    local player = QBCore.Functions.GetPlayerData()
    local PlayerJob = player.job
    if PlayerJob and (PlayerJob.name == 'judge') then
    exports[Config.Menu]:openMenu({
        {
            header = "judge Garage",
            icon = "fas fa-car",
            isMenuHeader = true
        },
        {
            header = "Judge Car",
            txt = "Mercedes-Benz (2022)",
            params = {
                event = "b4-Judgegarage:client:spawnvehicle",
                args = {
                    vehicle = Config.Vehicles,
                    JudgeGrade = {0, 1, 2, 3}
                }
            }
        },
    })
end
end)

RegisterNetEvent('b4-Judgegarage:client:spawnvehicle', function(dacca)
    local isused = QBCore.Functions.SpawnClear(Config.vehicle.coords, Config.vehicle.Coordsradius)
    local vehicle = dacca.vehicle
    local Grades = QBCore.Functions.GetPlayerData().job.grade.level
    local JudgeGrade = dacca.JudgeGrade

    if isused == true then
    for k, v in pairs(JudgeGrade) do
        print(v)
    if Grades == v then
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            local plate = QBCore.Functions.GetPlate(veh)

            SetEntityHeading(veh, Config.vehicle.heading)
            SetVehicleModKit(veh, 0)
            SetVehicleNumberPlateText(plate, "JD"..tostring(math.random(1, 1)))
            TriggerEvent("vehiclekeys:client:SetOwner", plate)
            TriggerServerEvent('b4-Judgegarage:server:SaveVehicle', plate, vehicle)
        end, Config.vehicle.coords, true)
    end
    end
    else
        QBCore.Functions.Notify('There Is Vehicle In The Way', 'error', 5000)
    end
end)

Citizen.CreateThread(function()
    QBCore.Functions.LoadModel(Config.ped.model)
    local ped = CreatePed(0, Config.ped.model, Config.ped.coords.x, Config.ped.coords.y, Config.ped.coords.z, Config.ped.coords.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', true)
    Wait(500)
end)
-----------------------------------------------------------------------------------
-- VehicleSystem ( B4store )
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- VoiceSystem ( B4store )
-----------------------------------------------------------------------------------
Citizen.CreateThread(function()
    exports[Config.Target]:AddBoxZone("voice_1", vector3(252.0, -1108.04, 30.08), 0.4, 0.6, {
        name = "voice_1",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:microphone",
                icon = "fas fa-microphone",
                label = "Microphone",
                job = "judge",
            },
        },
        distance = 2.5
    })
end)

Citizen.CreateThread(function()
    exports[Config.Target]:AddBoxZone("voice_2", vector3(254.03, -1100.06, 29.29), 0.2, 0.2, {
        name = "voice_2",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:microphone",
                icon = "fas fa-microphone",
                label = "Microphone",
                job = "all",
            },
        },
        distance = 2.5
    })
end)

Citizen.CreateThread(function()
    exports[Config.Target]:AddBoxZone("voice_3", vector3(247.48, -1100.05, 29.29), 0.2, 0.2, {
        name = "voice_3",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:microphone",
                icon = "fas fa-microphone",
                label = "Microphone",
                job = "all",
            },
        },
        distance = 2.5
    })
end)

Citizen.CreateThread(function()
    exports[Config.Target]:AddBoxZone("voice_4", vector3(245.57, -1104.79, 29.46), 0.2, 0.2, {
        name = "voice_4",
        useZ = "true",
    }, {
        options = {
            {
                type = "client",
                event = "judge:microphone",
                icon = "fas fa-microphone",
                label = "Microphone",
                job = "all",
            },
        },
        distance = 2.5
    })
end)

RegisterNetEvent('judge:microphone', function(data)
    exports[Config.Menu]:openMenu({
        {
            header = "Microphone System",
            isMenuHeader = true
        },
        {
            id = 1,
            header = "Turn Your Microphone (On 🎤)",
            icon = "fas fa-microphone",
            params = {
                event = "b4-judge:client:judgevoice:toggleon",
            }
        },
        {
            id = 2,
            header = "Turn Your Microphone (Off ❌)",
            icon = "fas fa-microphone-slash",
            params = {
                event = "b4-judge:client:judgevoice:toggleoff",
            }
        },
    })
end)

RegisterNetEvent('b4-judge:client:judgevoice:toggleon', function()
    exports[Config.Voice]:overrideProximityRange(50.0, true, IsToggleModOn)
    print ('judge_voice_on')
end)

RegisterNetEvent('b4-judge:client:judgevoice:toggleoff', function()
    exports[Config.Voice]:clearProximityOverride()
    print ('judge_voice_off')
end)
-----------------------------------------------------------------------------------
-- VoiceSystem ( B4store )
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- PrintSystem ( B4store )
-----------------------------------------------------------------------------------
print ('Discord.gg/b4s')
-----------------------------------------------------------------------------------
-- PrintSystem ( B4store )
-----------------------------------------------------------------------------------