local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local PlayerJob = {}
local PlayerGang = {}
local floorsMenu = {}

AddEventHandler('onResourceStart', function(resource)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    PlayerGang = PlayerData.gang
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    PlayerGang = PlayerData.gang
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

CreateThread(function()
    for k, v in pairs(Config.ElevatorButton) do
        exports['qb-target']:AddBoxZone(v.name, v.location, v.width, v.length, {
            name = v.name,
            heading = v.heading,
            debugPoly = Config.PolyZone,
            minZ = v.minz,
            maxZ = v.maxz,
        }, {
            options = {
                {
                  type = "client",
                  action = function(entity) 
                    TriggerEvent('prime-elevator:callLift', k)
                  end,
                  icon = "fas fa-chevron-circle-up",
                  label = "Elevator",
                },
            },
            distance = 2.5
        })
    end
end)

local function openFloorsMenu(lift, floor)
    floorsMenu = {
        {
            header = Config.Elevators[lift].Name,
            text = Config.Language[Config.UseLanguage].CurrentFloor .. Config.Elevators[lift].Floors[floor].Label,
            isMenuHeader = true
        },
    }

    for j = 1, #Config.Elevators[lift].Floors, 1 do
        if j ~= floor then
            floorsMenu[#floorsMenu + 1] = {
                header = '' .. Config.Elevators[lift].Floors[j].Label ..'',
                txt = '' .. Config.Elevators[lift].Floors[j].FloorDesc ..'',
                params = {
                    event = 'prime-elevator:checkFloorPermission',
                    args = {
                        lift = lift,
                        floor = Config.Elevators[lift].Floors[j],
                    }
                }
            }
        end
	end
    exports['qb-menu']:openMenu(floorsMenu)
end

function IsAuthorized(lift)
    for a = 1, #Config.Elevators[lift].Group do
        if PlayerJob.name == Config.Elevators[lift].Group[a] or PlayerGang.name == Config.Elevators[lift].Group[a] then
            return true
        end
    end
    return false
end

local function changeFloor(data)
    local ped = PlayerPedId()

    QBCore.Functions.Progressbar("Call_The_Lift", Config.Language[Config.UseLanguage].Waiting, Config.WaitTime, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@apt_trans@elevator",
        anim = "elev_1",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "anim@apt_trans@elevator", "elev_1", 1.0)
        DoScreenFadeOut(500)
        Wait(1000)
        if Config.UseSoundEffect then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.Elevators[data.lift].Sound, 0.05)
        end
        SetEntityCoords(ped, data.floor.Coords.x, data.floor.Coords.y, data.floor.Coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, data.floor.ExitHeading)
        Wait(1000)
        DoScreenFadeIn(600)
        
    end)
end

RegisterNetEvent('prime-elevator:callLift', function(playerId)
    Wait(1000)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inLiftRange = false
    for k, v in pairs(Config.Elevators) do
        for i, b in pairs(Config.Elevators[k].Floors) do
            local liftDist = #(coords - b.Coords)
            if liftDist <= 10 then
                inLiftRange = true
                if liftDist <= 5.0 then
                    if not IsPedInAnyVehicle(playerPed) then
                        QBCore.Functions.GetPlayerData(function(PlayerData)
                            if PlayerData.metadata["isdead"] or isHandcuffed or PlayerData.metadata["inlaststand"] then
                                QBCore.Functions.Notify(Config.Language[Config.UseLanguage].Unable, 'error')
                            else
                                openFloorsMenu(k, i)
                            end
                        end)
                    end
                end
            end
        end
    end
    if not inLiftRange then
        Wait(1000)
    end
end)

RegisterNetEvent('prime-elevator:checkFloorPermission', function(data)
    if Config.Elevators[data.lift].Group then
        if data.floor.Restricted then
            if IsAuthorized(data.lift) then
                changeFloor(data)
            else
                QBCore.Functions.Notify(Config.Language[Config.UseLanguage].Restricted, "error")
            end
        else
            changeFloor(data)
        end
    else
        changeFloor(data)
    end
end)