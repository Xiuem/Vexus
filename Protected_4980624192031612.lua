print("Whitelist")
--//Mấy Ah Đừng Deobf Hub Em Được Không Công Em Đi Skid\\--
getgenv().Team = "Marines"

spawn(function()
    while true do
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local replicatedStorage = game:GetService("ReplicatedStorage")
            local chooseTeamGui = player.PlayerGui:FindFirstChild("ChooseTeam", true)
            local remote = replicatedStorage:FindFirstChild("Remotes"):FindFirstChild("CommF_")

            if chooseTeamGui and chooseTeamGui.Visible and remote then
                remote:InvokeServer("SetTeam", getgenv().Team)
            end
        end)
        wait(1)
    end
end)
repeat wait() until game.Players.LocalPlayer.Team
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Player = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
local CommF = Remotes:WaitForChild("CommF_", 5) 
local PlayerGui = Player:WaitForChild("PlayerGui", 5)
local MainGui = PlayerGui:WaitForChild("Main", 5)
local lastNotificationTime = 0
local notificationCooldown = 10
local currentTime = tick()
if currentTime - lastNotificationTime >= notificationCooldown then
    game.StarterGui:SetCore("SendNotification", {
        Title = "    Vexus [ Evo ]",
        Text = "   Waiting game to loaded",
        Duration = 5
    })
    lastNotificationTime = currentTime
end
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Plr = Players.LocalPlayer
local Connection = {}
local Highlight_Folder = Instance.new("Folder")
Highlight_Folder.Name = "Highlight_Folder"
Highlight_Folder.Parent = CoreGui

local function CreateHighlight(Target)
    if not Target.Character then return end

    if Highlight_Folder:FindFirstChild(Target.Name) then
        Highlight_Folder[Target.Name]:Destroy()
    end

    local Highlight = Instance.new("Highlight")
    Highlight.Name = Target.Name
    Highlight.FillColor = Color3.fromRGB(0, 255, 145)
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.FillTransparency = 0.7
    Highlight.OutlineColor = Color3.fromRGB(0, 255, 145)
    Highlight.Parent = Highlight_Folder
    Highlight.Adornee = Target.Character

    if Connection[Target] then Connection[Target]:Disconnect() end
    Connection[Target] = Target.CharacterAdded:Connect(function(NewCharacter)
        Highlight.Adornee = NewCharacter
    end)
end

CreateHighlight(Plr)

Plr.AncestryChanged:Connect(function(_, parent)
    if not parent then
        if Connection[Plr] then Connection[Plr]:Disconnect() end
        if Highlight_Folder:FindFirstChild(Plr.Name) then
            Highlight_Folder[Plr.Name]:Destroy()
        end
    end
				end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectContainer = ReplicatedStorage:FindFirstChild("Effect") and ReplicatedStorage.Effect:FindFirstChild("Container")
if EffectContainer then
    local Death = EffectContainer:FindFirstChild("Death")
    if Death then
        local success, result = pcall(require, Death)
        if success and type(result) == "function" then
            hookfunction(result, function() end)
        end
    end
    local Respawn = EffectContainer:FindFirstChild("Respawn")
    if Respawn then
        local success, result = pcall(require, Respawn)
        if success and type(result) == "function" then
            hookfunction(result, function() end)
        end
    end
end
local GuideModule = ReplicatedStorage:FindFirstChild("GuideModule")
if GuideModule then
    local success, module = pcall(require, GuideModule)
    if success and module and type(module.ChangeDisplayedNPC) == "function" then
        hookfunction(module.ChangeDisplayedNPC, function() end)
    end
end
hookfunction(require(game:GetService("ReplicatedStorage").Modules.CombatUtil).IsGunReloading, function() 
    return false 
				end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Util = ReplicatedStorage:WaitForChild("Util", 5)
if Util then
    local CameraShaker = Util:FindFirstChild("CameraShaker")
    if CameraShaker then
        require(CameraShaker):Stop()
    end
end
local placeId = game.PlaceId
local worldMap = {
    [2753915549] = true,
    [4442272183] = true,
    [7449423635] = true
}
if worldMap[placeId] then
    if placeId == 2753915549 then
        World1 = true
    elseif placeId == 4442272183 then
        World2 = true
    elseif placeId == 7449423635 then
        World3 = true
    end
else
    game.Players.LocalPlayer:Kick("Not Support Game")
end
repeat
    wait()
until game.Players.LocalPlayer.Character
function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel >= 1 and MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel >= 10 and MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel >= 15 and MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel >= 30 and MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel >= 40 and MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel >= 60 and MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel >= 75 and MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel >= 90 and MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel >= 100 and MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif MyLevel >= 120 and MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel >= 150 and MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel >= 175 and MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel >= 190 and MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel >= 210 and MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel >= 250 and MyLevel <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif MyLevel >= 275 and MyLevel <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif MyLevel >= 300 and MyLevel <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel >= 325 and MyLevel <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel >= 375 and MyLevel <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel >= 400 and MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel >= 450 and MyLevel <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif MyLevel >= 475 and MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif MyLevel >= 525 and MyLevel <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif MyLevel >= 550 and MyLevel <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif MyLevel >= 625 and MyLevel <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel >= 700 and MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif MyLevel >= 725 and MyLevel <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel >= 775 and MyLevel <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif MyLevel >= 800 and MyLevel <= 874 then
            Mon = "Factory Staff"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif MyLevel >= 875 and MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif MyLevel >= 900 and MyLevel <= 949 then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif MyLevel >= 950 and MyLevel <= 974 then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif MyLevel >= 975 and MyLevel <= 999 then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif MyLevel >= 1000 and MyLevel <= 1049 then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif MyLevel >= 1050 and MyLevel <= 1099 then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif MyLevel >= 1100 and MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif MyLevel >= 1125 and MyLevel <= 1174 then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif MyLevel >= 1175 and MyLevel <= 1199 then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif MyLevel >= 1200 and MyLevel <= 1249 then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif MyLevel >= 1250 and MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel >= 1275 and MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end             
        elseif MyLevel >= 1300 and MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel >= 1325 and MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel >= 1350 and MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
            if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif MyLevel >= 1375 and MyLevel <= 1424 then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif MyLevel >= 1425 and MyLevel <= 1449 then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif MyLevel >= 1450 then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054, 240, -10146)
            CFrameMon = CFrame.new(-3291, 252, -10501)
        end
    elseif World3 then
        if MyLevel >= 1500 and MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif MyLevel >= 1525 and MyLevel <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif MyLevel >= 1575 and MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "DragonCrewQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375)
            CFrameMon = CFrame.new(6920.71435546875, 56.15597152709961, -942.5044555664062)
        elseif MyLevel >= 1600 and MyLevel <= 1624 then 
            Mon = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375)
            CFrameMon = CFrame.new(6817.91259765625, 484.804443359375, 513.4141235351562)
        elseif MyLevel >= 1625 and MyLevel <= 1649 then
            Mon = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 1
            NameMon = "Hydra Enforcer"
            CFrameQuest = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125)
            CFrameMon = CFrame.new(4584.69287109375, 1002.6435546875, 705.7958984375)
        elseif MyLevel >= 1650 and MyLevel <= 1699 then 
            Mon = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            LevelQuest = 2
            NameMon = "Venomous Assailant"
            CFrameQuest = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125)
            CFrameMon = CFrame.new(4638.78564453125, 1078.94091796875, 881.8002319335938)        
        elseif MyLevel >= 1700 and MyLevel <= 1724 then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif MyLevel >= 1725 and MyLevel <= 1774 then
            Mon = "Marine Rear Admiral"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif MyLevel >= 1775 and MyLevel <= 1799 then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif MyLevel >= 1800 and MyLevel <= 1824 then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif MyLevel >= 1825 and MyLevel <= 1849 then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif MyLevel >= 1850 and MyLevel <= 1899 then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
            CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif MyLevel >= 1900 and MyLevel <= 1924 then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif MyLevel >= 1925 and MyLevel <= 1974 then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif MyLevel >= 1975 and MyLevel <= 1999 then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif MyLevel >= 2000 and MyLevel <= 2024 then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif MyLevel >= 2025 and MyLevel <= 2049 then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif MyLevel >= 2050 and MyLevel <= 2074 then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif MyLevel >= 2075 and MyLevel <= 2099 then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif MyLevel >= 2100 and MyLevel <= 2124 then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif MyLevel >= 2125 and MyLevel <= 2149 then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif MyLevel >= 2150 and MyLevel <= 2199 then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif MyLevel >= 2200 and MyLevel <= 2224 then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif MyLevel >= 2225 and MyLevel <= 2249 then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif MyLevel >= 2250 and MyLevel <= 2274 then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif MyLevel >= 2275 and MyLevel <= 2299 then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif MyLevel >= 2300 and MyLevel <= 2324 then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif MyLevel >= 2325 and MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif MyLevel >= 2350 and MyLevel <= 2374 then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif MyLevel >= 2375 and MyLevel <= 2399 then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif MyLevel >= 2400 and MyLevel <= 2424 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif MyLevel >= 2425 and MyLevel <= 2449 then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)            
        elseif MyLevel >= 2450 and MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif MyLevel >= 2475 and MyLevel <= 2524 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
        elseif MyLevel >= 2525 and MyLevel <= 2550 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375)
        elseif MyLevel >= 2550 and MyLevel <= 2574 then
            Mon = "Serpent Hunter"
            LevelQuest = 1
            NameQuest = "TikiQuest3"
            NameMon = "Serpent Hunter"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16521.0625, 106.09285, 1488.78467, 0.469467044, 0, 0.882950008, 0, 1, 0, -0.882950008, 0, 0.469467044)
        elseif MyLevel >= 2575 then
            Mon = "Skull Slayer"
            LevelQuest = 2
            NameQuest = "TikiQuest3"
            NameMon = "Skull Slayer"
            CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16855.043, 122.457253, 1478.15308, -0.999392271, 0, -0.0348687991, 0, 1, 0, 0.0348687991, 0, -0.999392271)
        end
    end
end
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end        
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end        
        local num = 0
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)            
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait(0.1)
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(1)
                    break
                end
            end
        end
    end
    function Teleport() 
        while true do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
            wait(2)
        end
    end
    Teleport()
			end			
function MaterialMon()
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    local function shouldRequestEntrance(targetPosition, distanceThreshold)
        local distance = (humanoidRootPart.Position - targetPosition).Magnitude
        if distance >= distanceThreshold then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", targetPosition)
        end
    end
    if World1 then
        if SelectMaterial == "Angel Wings" then
            MMon = { "Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God" }
            MPos = CFrame.new(-4698, 845, -1912)
            SP = "Default"
            local targetPosition = Vector3.new(-4607.82275, 872.54248, -1667.55688)
            shouldRequestEntrance(targetPosition, 10000)
        elseif SelectMaterial == "Leather + Scrap Metal" then
            MMon = { "Brute", "Pirate" }
            MPos = CFrame.new(-1145, 15, 4350)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = { "Military Soldier", "Military Spy", "Magma Admiral" }
            MPos = CFrame.new(-5815, 84, 8820)
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = { "Fishman Warrior", "Fishman Commando", "Fishman Lord" }
            MPos = CFrame.new(61123, 19, 1569)
            SP = "Default"
            local targetPosition = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
            shouldRequestEntrance(targetPosition, 17000)
        end
    elseif World2 then
        if SelectMaterial == "Leather + Scrap Metal" then
            MMon = { "Marine Captain" }
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            MMon = { "Magma Ninja", "Lava Pirate" }
            MPos = CFrame.new(-5428, 78, -5959)
            SP = "Default"
        elseif SelectMaterial == "Ectoplasm" then
            MMon = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" }
            MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
            SP = "Default"
            local targetPosition = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
            shouldRequestEntrance(targetPosition, 18000)
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = { "Water Fighter" }
            MPos = CFrame.new(-3385, 239, -10542)
            SP = "Default"
        elseif SelectMaterial == "Radioactive Material" then
            MMon = { "Factory Staff" }
            MPos = CFrame.new(295, 73, -56)
            SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
            MMon = { "Vampire" }
            MPos = CFrame.new(-6033, 7, -1317)
            SP = "Default"
        end
    elseif World3 then
        if SelectMaterial == "Leather + Scrap Metal" then
            MMon = { "Jungle Pirate", "Forest Pirate" }
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            SP = "Default"
        elseif SelectMaterial == "Fish Tail" then
            MMon = { "Fishman Raider", "Fishman Captain" }
            MPos = CFrame.new(-10993, 332, -8940)
            SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = { "Chocolate Bar Battler", "Cocoa Warrior" }
            MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
            SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
            MMon = { "Dragon Crew Warrior" }
            MPos = CFrame.new(6594, 383, 139)
            SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
            MMon = { "Pistol Billionaire" }
            MPos = CFrame.new(-469, 74, 5904)
            SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
            MMon = { "Mythological Pirate" }
            MPos = CFrame.new(-13545, 470, -6917)
            SP = "Default"
        end
    end
end
local lastHakiTime = 0
local hakiCooldown = 1
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        local currentTime = tick()
        if currentTime - lastHakiTime >= hakiCooldown then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            lastHakiTime = currentTime
        end
    end
end
local lastUnEquipTime = 0
local unEquipCooldown = 0.5
function UnEquipWeapon(Weapon)
    local currentTime = tick()
    if currentTime - lastUnEquipTime >= unEquipCooldown then
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            getgenv().NotAutoEquip = true
            game.Players.LocalPlayer.Character[Weapon].Parent = game.Players.LocalPlayer.Backpack
            getgenv().NotAutoEquip = false
        end
        lastUnEquipTime = currentTime
    end
end
local lastEquipTime = 0
local equipCooldown = 0.5
function EquipWeapon(ToolSe)
    local currentTime = tick()
    if currentTime - lastEquipTime >= equipCooldown then        
        if not getgenv().NotAutoEquip then
            local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            if tool then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
            end
        end
        lastEquipTime = currentTime
    end
end
function BTP(p)
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character.HumanoidRootPart
    local humanoid = player.Character.Humanoid
    local playerGui = player.PlayerGui.Main
    local targetPosition = p.Position
    local lastPosition = humanoidRootPart.Position
    repeat
        humanoid.Health = 0
        humanoidRootPart.CFrame = p
        playerGui.Quest.Visible = false
        if (humanoidRootPart.Position - lastPosition).Magnitude > 1 then
            lastPosition = humanoidRootPart.Position
            humanoidRootPart.CFrame = p
        end
        task.wait(0.5)
    until (p.Position - humanoidRootPart.Position).Magnitude <= 2000
end
function BTPZ(v209)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        rootPart.CFrame = v209
    end
end
local lastTweenTime = 0
local tweenCooldown = 0.5
function fastpos(Pos)
    local currentTime = tick()
    if currentTime - lastTweenTime >= tweenCooldown then
        local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local Speed = 1000        
        local tween = game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
            { CFrame = Pos }
        )
        tween:Play()
        lastTweenTime = currentTime
    end
end
local lastTPBTime = 0
local tpbCooldown = 0.5
function TPB(pos, boat)
    local currentTime = tick()
    if currentTime - lastTPBTime >= tpbCooldown then
        local tween_s = game:GetService("TweenService")
        local distance = (boat.CFrame.Position - pos.Position).Magnitude
        local speed = getgenv().SpeedBoat
        local info = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
        if distance <= 25 then
            return {Stop = function() end}
        else
            local tween = tween_s:Create(boat, info, {CFrame = pos})
            tween:Play()
            lastTPBTime = currentTime
            return {
                Stop = function()
                    tween:Cancel()
                end
            }
        end
    end
end
local lastEquipTime = 0
local equipCooldown = 0.2
function EquipAllWeapon()
    pcall(function()
        local currentTime = tick()
        if currentTime - lastEquipTime >= equipCooldown then
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
                    local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name)
                    if ToolHumanoid then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid)
                    end
                end
            end
            lastEquipTime = currentTime
        end
    end)
end
function CheckNearestTeleporter(aI)
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    local vcspos = aI.Position
    local min = math.huge
    local min2 = math.huge
    local y = game.PlaceId
    local World1, World2, World3
    if y == 2753915549 then
        World1 = true
    elseif y == 4442272183 then
        World2 = true
    elseif y == 7449423635 then
        World3 = true
    end
    local TableLocations = {}
    if World3 then
        TableLocations = {
            ["Mansion"] = Vector3.new(-12471, 374, -7551),
            ["Hydra"] = Vector3.new(5659, 1013, -341),
            ["Caslte On The Sea"] = Vector3.new(-5092, 315, -3130),
            ["Floating Turtle"] = Vector3.new(-12001, 332, -8861),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Temple Of Time"] = Vector3.new(28286, 14897, 103)
        }
    elseif World2 then
        TableLocations = {
            ["Flamingo Mansion"] = Vector3.new(-317, 331, 597),
            ["Flamingo Room"] = Vector3.new(2283, 15, 867),
            ["Cursed Ship"] = Vector3.new(923, 125, 32853),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    elseif World1 then
        TableLocations = {
            ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
            ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
            ["Under Water Island"] = Vector3.new(61164, 5, 1820),
            ["Under Water Island Entrace"] = Vector3.new(3865, 5, -1926)
        }
    end
    local TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    local choose
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    local min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if min2 <= min3 then
        return choose
    end
end   
local moonTextures = {
    "http://www.roblox.com/asset/?id=9709135895",
    "http://www.roblox.com/asset/?id=9709139597",
    "http://www.roblox.com/asset/?id=9709143733",
    "http://www.roblox.com/asset/?id=9709149052", -- Next Night
    "http://www.roblox.com/asset/?id=9709149431", -- Full Moon
    "http://www.roblox.com/asset/?id=9709149680",
    "http://www.roblox.com/asset/?id=9709150086",
    "http://www.roblox.com/asset/?id=9709150401"
}

local function GetMoonTexture()
    local sky = game.Lighting:FindFirstChildOfClass("Sky")
    return sky and sky.MoonTextureId or nil
end

local function CheckMoon()
    local moonreal = GetMoonTexture()
    
    if moonreal == moonTextures[5] then
        return "Full Moon"
    elseif moonreal == moonTextures[4] then
        return "Next Night"
    else
        return "Bad Moon"
    end
end

local function getServerTime()
    local ClockTime = game.Lighting.ClockTime
    local Hours = math.floor(ClockTime)
    local Minutes = math.floor((ClockTime - Hours) * 60)
    return string.format("%02d:%02d", Hours, Minutes)
end

local function function6()
    return math.floor(game.Lighting.ClockTime)
end

local function function8()
    local currentTime = game.Lighting.ClockTime
    local moonStatus = CheckMoon()

    if moonStatus == "Full Moon" then
        if currentTime <= 5 then
            return tostring(function6()) .. " (Will End Moon In " .. math.floor(5 - currentTime) .. " Minutes)"
        elseif currentTime > 5 and currentTime < 12 then
            return tostring(function6()) .. " (Fake Moon)"
        elseif currentTime > 12 and currentTime < 18 then
            return tostring(function6()) .. " (Will Full Moon In " .. math.floor(18 - currentTime) .. " Minutes)"
        elseif currentTime > 18 and currentTime <= 24 then
            return tostring(function6()) .. " (Will End Moon In " .. math.floor(30 - currentTime) .. " Minutes)"
        end
    elseif moonStatus == "Next Night" then
        if currentTime < 12 then
            return tostring(function6()) .. " (Will Full Moon In " .. math.floor(18 - currentTime) .. " Minutes)"
        elseif currentTime >= 12 then
            return tostring(function6()) .. " (Will Full Moon In " .. math.floor(30 - currentTime) .. " Minutes)"
        end
    end

    return tostring(function6())
			end
function CheckAcientOneStatus()
            if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                return "You have yet to achieve greatness"
            end
            local v227 = nil
            local v228 = nil
            local v229 = nil
            v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
            if v229 == 1 then
                return "Required Train More"
            elseif v229 == 2 or v229 == 4 or v229 == 7 then
                return "Can Buy Gear With " .. v227 .. "\198\146"
            elseif v229 == 3 then
                return "Required Train More"
            elseif v229 == 5 then
                return "You Are Done Your Race."
            elseif v229 == 6 then
                return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
            end
            if v229 ~= 8 then
                if v229 == 0 then
                    return "Ready For Trial"
                else
                    return "You have yet to achieve greatness"
                end
            end
            return "Remaining " .. 10 - v228 .. " training sessions."
											end			
function requestEntrance(aJ)
    local args = {"requestEntrance", aJ}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))    
    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)    
    task.wait(0.5)
end   
function topos(Tween_Pos)
    pcall(function()
        if game:GetService("Players").LocalPlayer 
            and game:GetService("Players").LocalPlayer.Character 
            and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") 
            and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
            and game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 
            and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart then
            if not TweenSpeed then
                TweenSpeed = 350
            end
            DefualtY = Tween_Pos.Y
            TargetY = Tween_Pos.Y
            targetCFrameWithDefualtY = CFrame.new(Tween_Pos.X, DefualtY, Tween_Pos.Z)
            targetPos = Tween_Pos.Position
            oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            Distance = (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
            if Distance <= 300 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tween_Pos
            end
            local aM = CheckNearestTeleporter(Tween_Pos)
            if aM then
                pcall(function()
                    tween:Cancel()
                end)
                requestEntrance(aM)
            end
            b1 = CFrame.new(
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                DefualtY,
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
            )
            IngoreY = true
            if IngoreY and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                    DefualtY,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                )
                local tweenfunc = {}
                local aN = game:GetService("TweenService")
                local aO = TweenInfo.new(
                    (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude / TweenSpeed,
                    Enum.EasingStyle.Linear
                )
                tween = aN:Create(
                    game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                    aO,
                    {CFrame = targetCFrameWithDefualtY}
                )
                tween:Play()
                function tweenfunc:Stop()
                    tween:Cancel()
                end
                tween.Completed:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                    TargetY,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                )
            else
                local tweenfunc = {}
                local aN = game:GetService("TweenService")
                local aO = TweenInfo.new(
                    (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude / TweenSpeed,
                    Enum.EasingStyle.Linear
                )
                tween = aN:Create(
                    game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                    aO,
                    {CFrame = Tween_Pos}
                )
                tween:Play()
                function tweenfunc:Stop()
                    tween:Cancel()
                end
                tween.Completed:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                    TargetY,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                )
            end
            if not tween then
                return tween
            end
            return tweenfunc
        end
    end)
end
function StopTween(target)
    pcall(function()
        if not target then
            getgenv().StopTween = true            
            if tween then
                tween:Cancel()
                tween = nil
            end            
            local player = game:GetService("Players").LocalPlayer
            local character = player and player.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Anchored = true
                task.wait(0.1)
                humanoidRootPart.CFrame = humanoidRootPart.CFrame
                humanoidRootPart.Anchored = false
            end
            local bodyClip = humanoidRootPart and humanoidRootPart:FindFirstChild("BodyClip")
            if bodyClip then
                bodyClip:Destroy()
            end
            getgenv().StopTween = false
            getgenv().Clip = false
        end
    end)
end
spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().TeleportIsland or 
               getgenv().AutoFarm or 
               getgenv().AutoMaterial or 
               getgenv().MasteryFarm or 
               getgenv().AutoGetMelee or 
               getgenv().TeleportToFruit or 
               getgenv().AutoNewWorld or 
               getgenv().AutoThirdSea or 
               getgenv().AutoFactory or 
               getgenv().AutoPirateRaid or 
               getgenv().AutoEliteHunter or 
               getgenv().AutoTouchPadHaki or 
               getgenv().AutoRipIndra or 
               getgenv().AutoSoulReaper or 
               getgenv().AutoDoughKing or 
               getgenv().AutoDarkbeard or 
               getgenv().AutoObservationHakiV2 or 
               getgenv().AutoObservation or 
               getgenv().AutoFarmBoss or 
               getgenv().AutoFarmAllBoss or 
               getgenv().Auto_Dungeon or 
               getgenv().SailBoat or 
               getgenv().RelzFishBoat or 
               getgenv().RelzPirateBrigade or 
               getgenv().RelzPirateGrandBrigade or 
               getgenv().AutoTerrorshark or 
               getgenv().AutoSeaBest or 
               getgenv().AutoFrozenDimension or 
               getgenv().KillLevi or
               getgenv().UpgradeRaceV2 or
               getgenv().AutoCyborg or
               getgenv().AutoGhoul or
               getgenv().QuestTrain_2 or
               getgenv().TeleportMigare or
               getgenv().Tweentohighestpoint or
               getgenv().TeleportToGear or
               getgenv().AutoTrialRace or
               getgenv().AutoKillPlayerAfterTrial or
               getgenv().AutoRainbowHaki or
               getgenv().AutoSkullGuitar or
               getgenv().AutoGetCDK or
               getgenv().AutoTushita or
               getgenv().AutoSaber or
               getgenv().TeleportPlayer
            then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
            else
                local bodyClip = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
                if bodyClip then
                    bodyClip:Destroy()
                end
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().TeleportIsland or 
               getgenv().AutoFarm or 
               getgenv().AutoMaterial or 
               getgenv().MasteryFarm or 
               getgenv().AutoGetMelee or 
               getgenv().TeleportToFruit or 
               getgenv().AutoNewWorld or 
               getgenv().AutoThirdSea or 
               getgenv().AutoFactory or 
               getgenv().AutoPirateRaid or 
               getgenv().AutoEliteHunter or 
               getgenv().AutoTouchPadHaki or 
               getgenv().AutoRipIndra or 
               getgenv().AutoSoulReaper or 
               getgenv().AutoDoughKing or 
               getgenv().AutoDarkbeard or 
               getgenv().AutoObservationHakiV2 or 
               getgenv().AutoObservation or 
               getgenv().AutoFarmBoss or 
               getgenv().AutoFarmAllBoss or 
               getgenv().Auto_Dungeon or 
               getgenv().SailBoat or 
               getgenv().RelzFishBoat or 
               getgenv().RelzPirateBrigade or 
               getgenv().RelzPirateGrandBrigade or 
               getgenv().AutoTerrorshark or 
               getgenv().AutoSeaBest or 
               getgenv().AutoFrozenDimension or 
               getgenv().KillLevi or
               getgenv().UpgradeRaceV2 or
               getgenv().AutoCyborg or
               getgenv().AutoGhoul or
               getgenv().QuestTrain_2 or
               getgenv().TeleportMigare or
               getgenv().Tweentohighestpoint or
               getgenv().TeleportToGear or
               getgenv().AutoTrialRace or
               getgenv().AutoKillPlayerAfterTrial or
               getgenv().AutoRainbowHaki or
               getgenv().AutoSkullGuitar or
               getgenv().AutoGetCDK or
               getgenv().AutoTushita or
               getgenv().AutoSaber or
               getgenv().TeleportPlayer
            then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    local lastCall = 0
    local callInterval = 1
    while wait() do
        if (getgenv().AutoFarm or getgenv().Kill_Trial_V4) and tick() - lastCall > callInterval then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end)
            lastCall = tick()
        end
    end
end)
spawn(function()
    local lastPosUpdate = tick()
    while task.wait(0.1) do
        if getgenv().AutoSeaBest and CheckSeaBeast() then
            local currentTime = tick()
            if currentTime - lastPosUpdate >= 0.5 then
                Pos = CFrame.new(math.random(-600, 600), math.random(0, 300), math.random(-600, 600))
                lastPosUpdate = currentTime
            end
        end
    end
end)
local player = game.Players.LocalPlayer
local function IsEntityAlive(entity)
    if not entity then return false end
    local humanoid = entity:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end
local function GetEnemiesInRange(character, range)
    local enemies = game:GetService("Workspace").Enemies:GetChildren()
    local players = game:GetService("Players"):GetPlayers()
    local targets = {}
    local playerPos = character:GetPivot().Position
    for _, enemy in ipairs(enemies) do
        local rootPart = enemy:FindFirstChild("HumanoidRootPart")
        if rootPart and IsEntityAlive(enemy) then
            local distance = (rootPart.Position - playerPos).Magnitude
            if distance <= range then
                table.insert(targets, enemy)
            end
        end
    end
    for _, otherPlayer in ipairs(players) do
        if otherPlayer ~= player and otherPlayer.Character then
            local rootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if rootPart and IsEntityAlive(otherPlayer.Character) then
                local distance = (rootPart.Position - playerPos).Magnitude
                if distance <= range then
                    table.insert(targets, otherPlayer.Character)
                end
            end
        end
    end
    return targets
end
function AttackNoCoolDown()
    local character = player.Character
    if not character then return end
    
    local equippedWeapon
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            equippedWeapon = item
            break
        end
    end
    if not equippedWeapon then return end
    
    local enemiesInRange = GetEnemiesInRange(character, 60)
    if #enemiesInRange == 0 then return end  -- Nếu không có kẻ địch thì không làm gì cả

    -- Nếu vũ khí có LeftClickRemote (tấn công vật lý)
    if equippedWeapon:FindFirstChild("LeftClickRemote") then
        local attackCount = 1  
        for _, enemy in ipairs(enemiesInRange) do
            local rootPart = enemy:FindFirstChild("HumanoidRootPart")
            if rootPart then
                coroutine.wrap(function()  -- Chạy song song giúp tăng tốc đánh mà không lag
                    local direction = (rootPart.Position - character:GetPivot().Position).Unit
                    equippedWeapon.LeftClickRemote:FireServer(direction, attackCount)
                end)()
                attackCount = attackCount + 1
            end
        end
    else
        -- Nếu vũ khí không có LeftClickRemote (chiêu thức, kỹ năng)
        local targets, mainTarget = {}, nil
        for _, enemy in ipairs(enemiesInRange) do
            if not enemy:GetAttribute("IsBoat") then
                local head = enemy:FindFirstChild("Head")
                if head then
                    table.insert(targets, { enemy, head })
                    if not mainTarget then mainTarget = head end
                end
            end
        end
        
        if mainTarget then
            local storage = game:GetService("ReplicatedStorage")
            local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
            local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")

            coroutine.wrap(function()
                pcall(function()
                    attackEvent:FireServer(0.05)  -- Giảm delay xuống còn 0.05s để đánh nhanh hơn
                    hitEvent:FireServer(mainTarget, targets)
                end)
            end)()
        end
    end
end
print("Tr4sh Hub☄️")
Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Window = Fluent:CreateWindow({
    Title = "Vexus [ Evo ]",
    SubTitle = "by #hg.Hoang0",
    TabWidth = 155,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})
Rm = Window:AddTab({ Title = "Mirage - Race", Icon = "bitcoin" })		
PullIs = Rm:AddParagraph({
    Title = "Pull lever - Mirage Island",
    Content = "Checking..."
})

local previousStatus = ""

spawn(function()
    while wait(1) do
        pcall(function()
            local leverStatus = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor")
            local leverText = "Pull Lever: " .. (leverStatus and "🟢" or "🔴")

            local mirageIslandExists = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") ~= nil
            local mirageText = "Mirage Island: " .. (mirageIslandExists and "🟢" or "🔴")

            local newContent = leverText .. "\n" .. mirageText
            if newContent ~= previousStatus then
                PullIs:SetDesc(newContent)
                previousStatus = newContent
            end
        end)
    end
end)
Toggle = Rm:AddToggle("Toggle", { Title = "Teleport To Highest Point", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().Tweentohighestpoint = Value
    if not Value then
        return
    end
    spawn(function()
        while getgenv().Tweentohighestpoint do
            local HighestPoint = tweento_highestpoint()
            if HighestPoint and HighestPoint:FindFirstChild("CFrame") then
                local targetPos = HighestPoint.CFrame * CFrame.new(0, 211.88, 0)
                local currentPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                if currentPos and (targetPos.Position - currentPos).magnitude > 5 then
                    topos(targetPos)
                end
            end
            wait(0.5)
        end
    end)
				end)
Toggle = Rm:AddToggle("Toggle", { Title = "Teleport To Migare Island", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().TeleportMigare = Value
    StopTween(getgenv().TeleportMigare)
end)
spawn(function()
    pcall(function()
        while wait(0.5) do
            if getgenv().TeleportMigare and World3 then
                local island = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if island and island:FindFirstChild("Center") then
                    local targetPos = island.Center.Position
                    local currentPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    if currentPos and (Vector3.new(targetPos.X, 500, targetPos.Z) - currentPos).magnitude > 5 then
                        topos(CFrame.new(targetPos.X, 500, targetPos.Z))
                    end
                end
            end
        end
    end)
				end)				
Toggle = Rm:AddToggle("Toggle", { Title = "Lock Moon And On Race V3", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().LockMoonAndOnRaceV3 = Value
    if not Value then
        return
    end
    spawn(function()
        while getgenv().LockMoonAndOnRaceV3 and wait(0.5) do
            pcall(function()
                if World3 then
                    local moonDir = game.Lighting:GetMoonDirection()
                    if moonDir and moonDir.Magnitude > 0 then
                        local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                        game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
                    end
                end
            end)
        end
    end)
    spawn(function()
        while getgenv().LockMoonAndOnRaceV3 and wait(3) do
            pcall(function()
                if World3 then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                end
            end)
        end
    end)
end)
Toggle = Rm:AddToggle("Toggle", { Title = "Teleport To Blue Gear", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().TeleportToGear = Value
    StopTween(getgenv().TeleportToGear)
end)
spawn(function()
    while task.wait(0.1) do
        if not getgenv().TeleportToGear or not World3 then continue end
        local MysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
        if not MysticIsland then continue end
        for _, v in ipairs(MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.Material == Enum.Material.Neon then
                topos(v.CFrame)
                break
            end
        end
    end
				end)				
Rm:AddParagraph({
    Title = "Upgrade Race",
    Content = "",
				})				
Toggle = Rm:AddToggle("Toggle", {Title = "Auto Upgrade Race V2", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().UpgradeRaceV2 = Value
end)
spawn(function()
    pcall(function()
        while task.wait(0.2) do
            if not getgenv().UpgradeRaceV2 or not World2 then
                continue
            end            
            local player = game:GetService("Players").LocalPlayer
            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local backpack = player.Backpack
            local raceData = player.Data.Race            
            if raceData:FindFirstChild("Evolved") then
                continue
            end
            local alchemistStatus = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
            if alchemistStatus == 0 then
                local targetPos = CFrame.new(-2779.83521, 72.9661407, -3574.02002)
                if humanoidRootPart and (targetPos.Position - humanoidRootPart.Position).Magnitude > 4 then
                    topos(targetPos)
                else
                    task.wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                end
            elseif alchemistStatus == 1 then
                if not (backpack:FindFirstChild("Flower 1") or player.Character:FindFirstChild("Flower 1")) then
                    topos(game:GetService("Workspace").Flower1.CFrame)
                elseif not (backpack:FindFirstChild("Flower 2") or player.Character:FindFirstChild("Flower 2")) then
                    topos(game:GetService("Workspace").Flower2.CFrame)
                elseif not (backpack:FindFirstChild("Flower 3") or player.Character:FindFirstChild("Flower 3")) then
                    local zombie = game:GetService("Workspace").Enemies:FindFirstChild("Zombie")
                    if zombie then
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Zombie" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                                repeat
                                    task.wait()
                                    EquipWeapon(getgenv().SelectWeapon)
                                    AutoHaki()
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                until backpack:FindFirstChild("Flower 3") or v.Humanoid.Health <= 0 or not v.Parent or not getgenv().UpgradeRaceV2
                            end
                        end
                    else
                        topos(CFrame.new(-5685.923, 48.48, -853.237))
                    end
                end
            elseif alchemistStatus == 2 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
            end
        end
    end)
				end)				
Toggle = Rm:AddToggle("Toggle", {Title = "Auto Upgrade Race V3", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().UpgradeRaceV3 = Value

    if Value then
        Fluent:Notify({
            Title = "[ Evo ]",
            Content = "Coming Soon",
            Duration = 3
        })
    end
end)
Toggle = Rm:AddToggle("Toggle", {Title = "Teleport Ancient Clock", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().TeleportAcientClock = Value
    StopTween(getgenv().TeleportAcientClock)
end)
spawn(function()
    while true do
        wait(0.5)
        if getgenv().TeleportAcientClock then
            topos(CFrame.new(29549, 15069, -88))
        end
    end
				end)
Rm:AddButton({
    Title = "Teleport To Trial Door",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        if not player or not player:FindFirstChild("Data") or not player.Data:FindFirstChild("Race") then
            return
        end
        local race = player.Data.Race.Value
        local positions = {
            Human  = CFrame.new(29221.822, 14890.975, -205.991),
            Skypiea = CFrame.new(28960.158, 14919.624, 235.039),
            Fishman = CFrame.new(28231.175, 14890.975, -211.641),
            Cyborg  = CFrame.new(28502.681, 14895.975, -423.727),
            Ghoul   = CFrame.new(28674.244, 14890.676, 445.431),
            Mink    = CFrame.new(29012.341, 14890.975, -380.149)
        }
        if positions[race] and typeof(topos) == "function" then
            topos(positions[race])
        end
    end
})
Toggle = Rm:AddToggle("Toggle", {Title = "Auto Trial Race", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoTrialRace = Value
    StopTween(getgenv().AutoTrialRace)
end)
spawn(function()
    local player = game:GetService("Players").LocalPlayer
    local race = player.Data.Race
    local virtualInput = game:GetService("VirtualInputManager")
    while getgenv().AutoTrialRace do
        wait(0.5)
        if race.Value == "Human" then
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                    pcall(function()
                        repeat
                            wait()
                            enemy.Humanoid.Health = 0
                            enemy.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(player, "SimulationRadius", math.huge)
                        until not getgenv().AutoTrialRace or not enemy.Parent or enemy.Humanoid.Health <= 0
                    end)
                end
            end
        elseif race.Value == "Skypiea" then
            local skyTrial = game:GetService("Workspace").Map.SkyTrial.Model
            if skyTrial then
                for _, obj in pairs(skyTrial:GetDescendants()) do
                    if obj.Name == "snowisland_Cylinder.081" then
                        BTPZ(obj.CFrame)
                        break
                    end
                end
            end
        elseif race.Value == "Fishman" then
            local seaBeast = game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1")
            if seaBeast then
                local root = seaBeast:FindFirstChild("HumanoidRootPart")
                if root then
                    topos(root.CFrame)
                    local backpack = player.Backpack
                    local function equipTool(toolType)
                        for _, tool in pairs(backpack:GetChildren()) do
                            if tool:IsA("Tool") and tool.ToolTip == toolType then
                                player.Character.Humanoid:EquipTool(tool)
                                wait(0.2)
                                virtualInput:SendKeyEvent(true, 122, false, game)
                                virtualInput:SendKeyEvent(false, 122, false, game)
                                wait(0.2)
                                virtualInput:SendKeyEvent(true, 120, false, game)
                                virtualInput:SendKeyEvent(false, 120, false, game)
                                wait(0.2)
                                virtualInput:SendKeyEvent(true, 99, false, game)
                                virtualInput:SendKeyEvent(false, 99, false, game)
                            end
                        end
                    end
                    equipTool("Melee")
                    equipTool("Blox Fruit")
                    equipTool("Sword")
                    equipTool("Gun")
                end
            end
        elseif race.Value == "Cyborg" then
            topos(CFrame.new(28654, 14898.7832, -30))
        elseif race.Value == "Ghoul" then
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                    pcall(function()
                        repeat
                            wait()
                            enemy.Humanoid.Health = 0
                            enemy.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(player, "SimulationRadius", math.huge)
                        until not getgenv().AutoTrialRace or not enemy.Parent or enemy.Humanoid.Health <= 0
                    end)
                end
            end
        elseif race.Value == "Mink" then
            for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                if obj.Name == "StartPoint" then
                    topos(obj.CFrame * CFrame.new(0, 10, 0))
                    break
                end
            end
        end
    end
				end)			
Dropdown = Rm:AddDropdown("DropdownFarm", {
    Title = "Select Weapon",
    Values = {"Melee","Sword"},
    Multi = false,
})
Dropdown:SetValue("Melee")
Dropdown:OnChanged(function(value)
    getgenv().SelectWeaponKill = value
end)
task.spawn(function()
    local lastWeapon = nil
    while task.wait(0.5) do
        pcall(function()
            if getgenv().SelectWeaponKill == lastWeapon then
                return
            end
            lastWeapon = getgenv().SelectWeaponKill
            local weaponFound = nil
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == getgenv().SelectWeaponKill then
                    weaponFound = v.Name
                    break
                end
            end
            if weaponFound then
                getgenv().SelectWeaponKill = weaponFound
            end
        end)
    end
				end)				
Toggle = Rm:AddToggle("Toggle", {Title = "Auto Kill Player After Trial V4", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoKillPlayerAfterTrial = Value
    StopTween(getgenv().AutoKillPlayerAfterTrial)
end)
spawn(function()
    while task.wait(0.2) do
        if getgenv().AutoKillPlayerAfterTrial and World3 then
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end                
                for _, v in ipairs(game.Workspace.Characters:GetChildren()) do
                    if v.Name ~= player.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        local humanoid = v.Humanoid
                        local rootPart = v.HumanoidRootPart
                        if humanoid.Health > 0 and (char.HumanoidRootPart.Position - rootPart.Position).Magnitude <= 230 then
                            task.spawn(function()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeaponKill)
                                topos(rootPart.CFrame * CFrame.new(1, 1, 2))
                                rootPart.Size = Vector3.new(60, 60, 60)
                                rootPart.CanCollide = false
                                if v:FindFirstChild("Head") then
                                    v.Head.CanCollide = false
                                end
                                humanoid.WalkSpeed = 0
                                sethiddenproperty(player, "SimulationRadius", math.huge)
                                while getgenv().AutoKillPlayerAfterTrial and humanoid.Health > 0 and v.Parent and rootPart and humanoid do
                                    task.wait(0.1)
                                end
                            end)
                        end
                    end
                end
            end)
        end
    end
				end)			
Rm:AddParagraph({
    Title = "Ancient One Status",
    Content = "" .. tostring(CheckAcientOneStatus())
				})				
local Toggle = Rm:AddToggle("Toggle", {Title = "Auto Finish Train Quest", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().Race_1 = Value
    getgenv().QuestTrain_2 = Value
    if not Value then
        StopTween(getgenv().QuestTrain_2)
    end
end)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if getgenv().Race_1 and game.Players.LocalPlayer.Character then
                local char = game.Players.LocalPlayer.Character
                if char:FindFirstChild("RaceTransformed") and char.RaceTransformed.Value then
                    getgenv().QuestTrain_2 = false
                    topos(CFrame.new(-9507.03125, 713.654968, 6186.39453))
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait(0.5) do 
        pcall(function()
            if getgenv().QuestTrain_2 and World3 and game.Players.LocalPlayer.Character then
                local enemies = workspace:FindFirstChild("Enemies")
                if enemies then
                    for _, v in pairs(enemies:GetChildren()) do
                        if v:IsA("Model") and (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait(0.1)
                                    AutoHaki()
                                    EquipWeapon(getgenv().SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    getgenv().BonesBring = true
                                until not getgenv().QuestTrain_2 or v.Parent == nil or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                if BypassTP then
                    local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local distance = (playerPos - BonePos.Position).Magnitude
                    if distance > 1500 then
                        BTP(BonePos)
                    else
                        topos(BonePos)
                    end
                else
                    topos(BonePos)
                end
                UnEquipWeapon(getgenv().SelectWeapon)
                getgenv().BonesBring = false
                topos(CFrame.new(-9507.03125, 713.654968, 6186.39453))
                local replicated = game:GetService("ReplicatedStorage")
                for _, v in pairs(replicated:GetChildren()) do 
                    if v:IsA("Model") and (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                        if v:FindFirstChild("HumanoidRootPart") then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if getgenv().Race_1 and game.Players.LocalPlayer.Character then
                local char = game.Players.LocalPlayer.Character
                if char:FindFirstChild("RaceTransformed") and not char.RaceTransformed.Value then
                    getgenv().QuestTrain_2 = true
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if getgenv().Race_1 and game.Players.LocalPlayer.Character then
                local char = game.Players.LocalPlayer.Character
                if char:FindFirstChild("RaceEnergy") and char.RaceEnergy.Value >= 1 and not char.RaceTransformed.Value then
                    local be = game:GetService("VirtualInputManager")
                    be:SendKeyEvent(true, "Y", false, game)
                    task.wait(0.1)
                    be:SendKeyEvent(false, "Y", false, game)
                end
            end
        end)
    end
				end)				
Toggle = Rm:AddToggle("Toggle", {Title = "Auto Buy Gear", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().AutoBuyGear = Value    
end)
spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if getgenv().AutoBuyGear and World3 then
                local args = {"UpgradeRace", "Buy"}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            else
                repeat task.wait(1) until getgenv().AutoBuyGear
            end
        end
    end)
				end)				
				
Shop = Window:AddTab({ Title = "Shopping", Icon = "cast" })
melees = {
    ["Black Leg"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end,
    ["Electro"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end,
    ["Fishman Karate"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end,
    ["Dragon Claw"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end,
    ["Superhuman"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end,
    ["Death Step"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end,
    ["Sharkman Karate"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end,
    ["Electric Claw"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end,
    ["Dragon Talon"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end,
    ["Godhuman"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end,
    ["Sanguine Art"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
}

Chon_Melee = Shop:AddDropdown("Chon_Melee", {
    Title = "Fighting Style",
    Description = "",
    Values = {"Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman", "Sanguine Art" },
    Multi = false,
    Default = false,
})
Chon_Melee:SetValue("")
Chon_Melee:OnChanged(function(Value)
    getgenv().FightingStyle = Value
    if melees[Value] then
        melees[Value]()
    end
				end)
hg = {
    ["Sky Jump"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
								end,
    ["Buso Haki"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
        end,
    ["Observation"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
        end,
    ["Soru"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
							end
}

Chon_hg = Shop:AddDropdown("Chon_hg", {
    Title = "Abilites",
    Description = "",
    Values = {"Sky Jump", "Buso Haki", "Observation", "Soru"},
    Multi = false,
    Default = false,
})
Chon_hg:SetValue("")
Chon_hg:OnChanged(function(Value)
    getgenv().Abilites = Value
    if hg[Value] then
        hg[Value]()
    end
				end)
Race = {
    ["Refund Stat (2500F)"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
								end,
    ["Reroll Race (3000F)"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
								end,
    ["Ghould Race"] = function()
        local args1 = {[1] = "Ectoplasm", [2] = "BuyCheck", [3] = 4}
        local args2 = {[1] = "Ectoplasm", [2] = "Change", [3] = 4}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))        
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
								end,
    ["Cyborg Race"] = function()
        if not isBuying then
            isBuying = true
            local args = {[1] = "CyborgTrainer", [2] = "Buy"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                        
            wait(0.5)
            isBuying = false
							end
						end
}

Chon_Race = Shop:AddDropdown("Chon_Race", {
    Title = "Misc",
    Description = "",
    Values = {"Refund Stat (2500F)", "Reroll Race (3000F)", "Ghould Race", "Cyborg Race"},
    Multi = false,
    Default = false,
})
Chon_Race:SetValue("")
Chon_Race:OnChanged(function(Value)
    getgenv().Race = Value
    if Race[Value] then
        Race[Value]()
    end
				end)				
Items = {
    ["Volcanic Magnet"] = function()
        local args = {
            [1]="CraftItem",
            [2]="Craft",
            [3]="Volcanic Magnet"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end,
    ["T-Rex Skull"] = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "TRexSkull"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end,
    ["Dino Hood"] = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "DinoHood"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
}

Chon_Item = Shop:AddDropdown("Chon_Item", {
    Title = "Craft",
    Description = "",
    Values = {"Volcanic Magnet", "T-Rex Skull", "Dino Hood"},
    Multi = false,
    Default = false,
})
Chon_Item:SetValue("")
Chon_Item:OnChanged(function(Value)
    getgenv().Race = Value
    if Items[Value] then
        Items[Value]()
    end
				end)				
Toggle = Shop:AddToggle("Toggle", {Title = "Auto Trade Bone", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().AutoTradeBone = Value
end)
spawn(function()
    local canSendRequest = true
    local debounceTime = 1
    while task.wait(0.5) do
        if getgenv().AutoTradeBone and World3 and canSendRequest then
            canSendRequest = false
            local args = {
                [1] = "Bones",
                [2] = "Buy",
                [3] = 1,
                [4] = 1
            }
            local commF = game:GetService("ReplicatedStorage").Remotes.CommF_
            if commF then
                local success, result = pcall(function()
                    commF:InvokeServer(unpack(args))
                end)
                if not success then
                end
            end
            wait(debounceTime)
            canSendRequest = true
        end
    end
end)
Toggle = Shop:AddToggle("Toggle", {Title = "Auto Buy Legendary Sword", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().AutoBuyLegendarySword = Value
end)
spawn(function()
    local lastCallTime = 0
    while task.wait(1) do
        if getgenv().AutoBuyLegendarySword and World2 then
            local currentTime = tick()            
            if currentTime - lastCallTime >= 2 then
                lastCallTime = currentTime                
                pcall(function()
                    local args1 = { "LegendarySwordDealer", "1" }
                    local args2 = { "LegendarySwordDealer", "2" }
                    local args3 = { "LegendarySwordDealer", "3" }                    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args3))                    
                end)
            end
        end
    end
end)
Toggle = Shop:AddToggle("Toggle", {
    Title = "Auto Buy Haki Color",
    Default = false })
Toggle:OnChanged(function(Value)
    getgenv().Auto_Buy_Enchancement = Value
end)
spawn(function()
    local lastCallTime = 0
    while true do
        if getgenv().Auto_Buy_Enchancement then
            local currentTime = tick()
            if currentTime - lastCallTime >= 2 then
                lastCallTime = currentTime
                local args = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                }
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end)
            end
        end
        wait(0.1)
    end
				end)				
Toggle = Shop:AddToggle("Toggle", {Title = "Random Fruit", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().RandomFruit = Value
end)
spawn(function()
     while task.wait(0.2) do
         if getgenv().RandomFruit then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
          end 
     end
					end)			
Shop:AddButton({
    Title = "Buy Bribe",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
    end
})
sex = {
    "WildDares",
    "BossBuild",
    "GetPranked",
    "Sub2OfficialNoobie",
    "Sub2Daigrock",
    "Sub2NoobMaster123",
    "Bluxxy",
    "JCWK",
    "Enyu_is_Pro",
    "Sub2Fer999",
    "kittgaming",
    "TheGreatAce",
    "StrawHatMaine",
    "TantaiGaming",
    "Axiore",
    "SUB2GAMERROBOT_EXP1",
    "MagicBus",
    "StarcodeHEO",
    "Sub2CaptainMaui",
    "FIGHT4FRUIT",
    "EARN_FRUITS",
}
Shop:AddButton({
    Title = "Redeem Code",
    Callback = function()
        function RedeemCode(Value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Value)
        end
        local delayBetweenRequests = 0.5
        for i, v in pairs(sex) do
            spawn(function()
                RedeemCode(v)
                wait(delayBetweenRequests)
            end)
        end
    end
				})			
Settings = Window:AddTab({ Title = "Settings Farm", Icon = "box" })
Dropdown = Settings:AddDropdown("DropdownFarm", {
    Title = "Select Weapon",
    Values = {"Melee","Sword","Blox Fruit"},
    Multi = false,
})
Dropdown:SetValue("Melee")
Dropdown:OnChanged(function(value)
    getgenv().SelectWeapon = value
end)
task.spawn(function()
    local lastWeapon = nil
    while task.wait(0.5) do
        pcall(function()
            if getgenv().SelectWeapon == lastWeapon then
                return
            end
            lastWeapon = getgenv().SelectWeapon
            local weaponFound = nil
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == getgenv().SelectWeapon then
                    weaponFound = v.Name
                    break
                end
            end
            if weaponFound then
                getgenv().SelectWeapon = weaponFound
            end
        end)
    end
				end)
Dropdown = Settings:AddDropdown("Dropdown", {
        Title = "Fast Attack Speed",
        Values = {"0", "0.1", "0.10"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("0")

    Dropdown:OnChanged(function(Value)
        getgenv().FastAttackDelay = Value
    end)

spawn(function()
    while wait(.1) do
        if getgenv().FastAttackDelay then
            pcall(function()
                if getgenv().FastAttackDelay == "0" then
                    getgenv().FastAttackDelay = 0.0000001
                elseif getgenv().FastAttackDelay == "0.1" then
                    getgenv().FastAttackDelay = 0.1
                elseif getgenv().FastAttackDelay == "0.10" then
                    getgenv().FastAttackDelay = 0.10		
                end
            end)
        end
    end
				end)				
	getgenv().FastAttack = false
Toggle = Settings:AddToggle("Toggle", {Title = "Fast Attack", Default = true})
local FastAttackTask
local function FastAttackLoop()
    while getgenv().FastAttack do
        if type(AttackNoCoolDown) == "function" then
            AttackNoCoolDown()
        end
        task.wait(getgenv().FastAttackDelay)
    end
end
Toggle:OnChanged(function(Value)
    getgenv().FastAttack = Value
    if Value and not FastAttackTask then
        FastAttackTask = task.spawn(FastAttackLoop)
    end
    if not Value and FastAttackTask then
        FastAttackTask = nil
    end
				end)			
Toggle = Settings:AddToggle("Toggle", {Title = "Bring Mob", Default = true})
Toggle:OnChanged(function(Value)
    getgenv().BringMonster = Value
end)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            CheckQuest()
            local enemies = Workspace.Enemies:GetChildren()
            local MonsterCount = 0
            for _, enemy in ipairs(enemies) do
                if MonsterCount >= 2 then
                    break
                end                
                if getgenv().BringMonster and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                    local humanoid = enemy:FindFirstChild("Humanoid")
                    local rootPart = enemy:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if getgenv().StartMagnet and (enemy.Name == MonFarm or enemy.Name == Mon) and humanoid.Health > 0 and distance <= 350 then
                            if enemy.Name == "Factory Staff" and PosMon and (rootPart.Position - PosMon.Position).Magnitude <= 5000 then
                                if rootPart.Parent then
                                    rootPart.CanCollide = false
                                    rootPart.Size = Vector3.new(60, 60, 60)
                                    rootPart.CFrame = PosMon
                                    enemy.Head.CanCollide = false
                                    local animator = humanoid:FindFirstChild("Animator")
                                    if animator then
                                        pcall(function()
                                            animator:Destroy()
                                        end)
                                    end
                                    sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                                    MonsterCount = MonsterCount + 1
                                end
                            elseif (enemy.Name == MonFarm or enemy.Name == Mon) and PosMon and (rootPart.Position - PosMon.Position).Magnitude <= 4500 then
                                if rootPart.Parent then
                                    rootPart.CanCollide = false
                                    rootPart.Size = Vector3.new(60, 60, 60)
                                    rootPart.CFrame = PosMon
                                    enemy.Head.CanCollide = false
                                    local animator = humanoid:FindFirstChild("Animator")
                                    if animator then
                                        pcall(function()
                                            animator:Destroy()
                                        end)
                                    end
                                    sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                                    MonsterCount = MonsterCount + 1
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
				end)	
Toggle = Settings:AddToggle("Toggle", {Title = "Enable Aura Haki", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AUTOHAKI = Value
end)
spawn(function()
    local canUseHaki = true
    local debounceTime = 2
    while task.wait(0.1) do
        if getgenv().AUTOHAKI then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") and canUseHaki then
                canUseHaki = false
                local args = {
                    [1] = "Buso"
                }
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end)
                wait(debounceTime)
                canUseHaki = true
            end
        end
    end
				end)		
Toggle = Settings:AddToggle("Toggle", { Title = "Auto Turn On Race V4", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoTurnOnV4 = Value
end)
task.spawn(function()
    local lastCheckTime = 0
    while true do
        task.wait(0.1)
        if getgenv().AutoTurnOnV4 then
            local currentTime = tick()
            if currentTime - lastCheckTime >= 0.5 then
                lastCheckTime = currentTime
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("RaceEnergy") and
                   character.RaceEnergy.Value >= 1 and
                   not character.RaceTransformed.Value then
                    local be = game:GetService("VirtualInputManager")
                    be:SendKeyEvent(true, "Y", false, game)
                    task.wait(0.1)
                    be:SendKeyEvent(false, "Y", false, game)
                end
            end
        end
    end
end)
Toggle = Settings:AddToggle("Toggle", {Title = "Auto Turn On Race V3", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoTurnOnV3 = Value
end)
task.spawn(function()
    local prevState = false    
    while true do
        task.wait(0.1)        
        pcall(function()
            if getgenv().AutoTurnOnV3 ~= prevState then
                if getgenv().AutoTurnOnV3 then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
                prevState = getgenv().AutoTurnOnV3
            end
        end)
    end
				end)
Toggle = Settings:AddToggle("Toggle", {Title = "Reset Teleport", Default = false })
Toggle:OnChanged(function(Value)
    BypassTP = Value 
end)
Toggle = Settings:AddToggle("Bypass TP", { Title = "Stop Reset Teleport When Have Legendary", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().StopTP = Value
end)
spawn(function()
	while task.wait(1) do
		if getgenv().StopTP then
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
				BypassTP = false
			end
		end
	end
	end)				
Toggle = Settings:AddToggle("Toggle", { Title = "Auto Summon Cake Prince", Description = "", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AutoSpawnCP = Value
end)
local lastSpawnTime = 0
local spawnCooldown = 1
spawn(function() 
    while task.wait() do
        if getgenv().AutoSpawnCP and tick() - lastSpawnTime >= spawnCooldown then
            lastSpawnTime = tick()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
        end
    end
				end)	
Toggle = Settings:AddToggle("Toggle", {Title = "Enable Anti AFK", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AntiAFK = Value 
end)
task.spawn(function()
    while true do
        if getgenv().AntiAFK then
            local vu = game:GetService("VirtualUser")
            local player = game:GetService("Players").LocalPlayer
            player.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
        game:GetService("RunService").Heartbeat:wait()
    end
				end)	
Toggle = Settings:AddToggle("Toggle", {Title = "Enable Hide Mob", Default = false })
Toggle:OnChanged(function(Value)
     getgenv().HideMob = Value		
end)
spawn(function()
    while task.wait() do
        if getgenv().HideMob then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "MeshPart" then
                        v.Transparency = 1
                    end
                end
                for i, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.Name == "Head" then
                        v.Transparency = 1
                    end
                end
                for i, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "Accessory" then
                        v.Handle.Transparency = 1
                    end
                end
                for i, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "Decal" then
                        v.Transparency = 1
                    end
                end
            end)
        end
    end
				end)						
Toggle = Settings:AddToggle("Toggle", {Title = "Disables Dame Text", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().RemoveText = Value
    game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not getgenv().RemoveText
end)
Toggle = Settings:AddToggle("Toggle", {Title = "Disables Notification", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().RemoveNotification = Value
    game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = not getgenv().RemoveNotification
end)
Toggle = Settings:AddToggle("Toggle", {Title = "Spin Position", Description = "Spin Position When Farm", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().SpinPos = Value
end)
spawn(function()
    while wait() do
        if getgenv().SpinPos then
            Pos = CFrame.new(0, PosY, -20)
            wait(0.1)
            Pos = CFrame.new(-20, PosY, 0)
            wait(0.1)
            Pos = CFrame.new(0, PosY, 20)
            wait(0.1)
            Pos = CFrame.new(20, PosY, 0)
        else
            Pos = CFrame.new(0, PosY, 0)
        end
    end
end)
Slider = Settings:AddSlider("Slider", {
     Title = "Farm Distance",
     Default = 15,
     Min = 0,
     Max = 30,
     Rounding = 5,
     Callback = function(Value)
         PosY = Value
    end
})
Toggle = Settings:AddToggle("Toggle", {Title = "Auto Reduce Lag Farm Safely", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().ReduceLag = Value
end)
spawn(function()
    while wait(0.1) do
        if getgenv().ReduceLag then
            for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                if v and (v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds") then
                    pcall(function()
                        v:Destroy()
                    end)
                end
            end
        end
    end
end)
Toggle = Settings:AddToggle("Toggle", {Title = "Anti Cheat Farming", Description = "", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().ResetFlags = Value
end)
spawn(function()
    while task.wait(5) do
        pcall(function()
            if getgenv().ResetFlags then
                local player = game:GetService("Players").LocalPlayer                
                for _, v in pairs(player.Character:GetDescendants()) do
                    if v:IsA("LocalScript") then
                        local scriptsToRemove = {
                            "General", "Shiftlock", "FallDamage", "4444", 
                            "CamBob", "JumpCD", "Looking", "Run"
                        }
                        if table.find(scriptsToRemove, v.Name) then
                            v:Destroy()
                        end
                    end
                end
                for _, v in pairs(player.PlayerScripts:GetDescendants()) do
                    if v:IsA("LocalScript") then
                        local scriptsToRemove = {
                            "RobloxMotor6DBugFix", "Clans", "Codes", "CustomForceField",
                            "MenuBloodSp", "PlayerList"
                        }
                        if table.find(scriptsToRemove, v.Name) then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end
				end)												
Ge = Window:AddTab({ Title = "General", Icon = "crown" })
BoneCake = Ge:AddParagraph({
    Title = "Status Bone - Cake Prince",
    Content = "Loading..."
})

spawn(function()
    while wait(1) do
        pcall(function()
            local cakePrince = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            local killStatus = "Cake Prince: 🟢"
            if string.len(cakePrince) >= 86 then
                local killCount = string.sub(cakePrince, 39, 41)
                killStatus = "Dimension: " .. killCount
            end

            local bones = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
            local boneStatus = "Your Bone: " .. bones

            BoneCake:SetDesc(killStatus .. "\n" .. boneStatus)
        end)
    end
end)
Dropdown = Ge:AddDropdown("DropdownFarm", {
    Title = "Select Method Farm",
    Values = {"Level", "Bone", "Katakuri"},
    Multi = false,
})
Dropdown:SetValue("")
Dropdown:OnChanged(function(Value)
FarmMode = Value
end)
spawn(function()
    local canRun = true
    local debounceTime = 0.5
    while wait(debounceTime) do
        if getgenv().AutoFarm and FarmMode == "Level" then
            if canRun then
                canRun = false
                spawn(function()
                    local player = game:GetService("Players").LocalPlayer
                    local questTitle = player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    local questVisible = player.PlayerGui.Main.Quest.Visible
                    local humanoidRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if not string.find(questTitle, NameMon) then
                        getgenv().StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if not questVisible then
                        getgenv().StartMagnet = false
                        CheckQuest()
                        if BypassTP then
                            local distance = (humanoidRoot.Position - CFrameQuest.Position).Magnitude
                            if distance > 1500 then
                                BTP(CFrameQuest * CFrame.new(0, 20, 5))
                            elseif distance < 1500 then
                                topos(CFrameQuest)
                            end
                        else
                            topos(CFrameQuest)
                        end
                        if (humanoidRoot.Position - CFrameQuest.Position).Magnitude <= 20 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    elseif questVisible then
                        CheckQuest()
                        local enemies = game:GetService("Workspace").Enemies:GetChildren()
                        for _, v in pairs(enemies) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                                if v.Humanoid.Health > 0 and v.Name == Mon then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat
                                            task.wait(0.1)
                                            AutoHaki()
                                            EquipWeapon(getgenv().SelectWeapon)
                                            PosMon = v.HumanoidRootPart.CFrame
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            getgenv().StartMagnet = true
                                            sethiddenproperty(player, "SimulationRadius", math.huge)
                                        until not getgenv().AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    else
                                        getgenv().StartMagnet = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        end
                    end
                end)
                task.wait(0.5)
                canRun = true
            end
        end
    end
end)
local Bone = {
    ["Reborn Skeleton"] = CFrame.new(-8769.58984, 142.13063, 6055.27637),
    ["Living Zombie"] = CFrame.new(-10156.4531, 138.652481, 5964.5752),
    ["Demonic Soul"] = CFrame.new(-9525.17188, 172.13063, 6152.30566),
    ["Posessed Mummy"] = CFrame.new(-9570.88281, 5.81831884, 6187.86279)
}
spawn(function()
    while task.wait(0.2) do
        if getgenv().BonesBring then
            pcall(function()
                for _, v in ipairs(game.Workspace.Enemies:GetChildren()) do
                    if Bone[v.Name] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                        v.HumanoidRootPart.CFrame = Bone[v.Name]
                        v.Head.CanCollide = false
                        v.Humanoid.Sit = false
                        v.Humanoid:ChangeState(11)
                        task.wait(0.1)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        local animator = v.Humanoid:FindFirstChild("Animator")
                        if animator then
                            animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end)
        end
    end
end)
BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
spawn(function()
    while wait(0.1) do
        if FarmMode == "Bone" and getgenv().AutoFarm and World3 then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies:GetChildren()
                local foundEnemy = false
                for _, v in pairs(enemies) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            foundEnemy = true
                            repeat wait(0.1)
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                getgenv().BonesBring = true
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end                
                if not foundEnemy then
                    if BypassTP then
                        local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        if (playerPos - BonePos.Position).Magnitude > 1500 then
                            BTP(BonePos)
                        else
                            topos(BonePos)
                        end
                    else
                        topos(BonePos)
                    end
                    UnEquipWeapon(getgenv().SelectWeapon)
                    getgenv().BonesBring = false
                    topos(CFrame.new(-9515, 164, 5786))                    
                    for _, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end
            end)
        end
    end
end)
local Cake = {
    ["Cookie Crafter"] = CFrame.new(-2333.28052, 37.8239059, -12093.2861),
    ["Cake Guard"] = CFrame.new(-1575.56433, 37.8238907, -12416.2529),
    ["Baking Staff"] = CFrame.new(-1872.35742, 37.8239517, -12899.4248),
    ["Head Baker"] = CFrame.new(-2223.1416, 53.5283203, -12854.752)
}
spawn(function()
    while task.wait(0.2) do
        if getgenv().CakeBring then
            pcall(function()
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if Cake[v.Name] then
                        local targetCFrame = Cake[v.Name]
                        if targetCFrame then
                            v.HumanoidRootPart.CFrame = targetCFrame
                        end
                        v.Head.CanCollide = false
                        v.Humanoid.Sit = false
                        v.Humanoid:ChangeState(11)
                        task.wait(0.1)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        if v.Humanoid:FindFirstChild('Animator') then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait(0.1) do
        if FarmMode == "Katakuri" and getgenv().AutoFarm and World3 then
            pcall(function()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")                
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if getgenv().AutoFarm and v.Name == "Cake Prince" 
                                and v:FindFirstChild("HumanoidRootPart") 
                                and v:FindFirstChild("Humanoid") 
                                and v.Humanoid.Health > 0 then                                
                                repeat 
                                    game:GetService("RunService").Heartbeat:wait()
                                    AutoHaki()
                                    EquipWeapon(getgenv().SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 
                            and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position 
                            - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then                            
                            topos(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") 
                        or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") 
                        or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") 
                        or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then                        
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" 
                                    or v.Name == "Baking Staff" or v.Name == "Head Baker") 
                                    and v:FindFirstChild("HumanoidRootPart") 
                                    and v:FindFirstChild("Humanoid") 
                                    and v.Humanoid.Health > 0 then                                    
                                    repeat 
                                        game:GetService("RunService").Heartbeat:wait()
                                        AutoHaki()
                                        EquipWeapon(getgenv().SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        getgenv().CakeBring = true
                                    until not getgenv().AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        local CakePos = CFrame.new(-2077, 252, -12373)
                        if BypassTP then
                            BTP(CakePos)
                        else
                            topos(CakePos)
                        end
                    end
                end
            end)
        end
    end
				end)
Toggle = Ge:AddToggle("Toggle", {Title = "Auto Travel Dressrosa", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoNewWorld = Value
    StopTween(getgenv().AutoNewWorld)
end)
spawn(function()
    while task.wait(0.1) do
        if getgenv().AutoNewWorld and World1 then
            spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local workspace = game:GetService("Workspace")
                local replicatedStorage = game:GetService("ReplicatedStorage")
                local myLevel = player.Data.Level.Value
                if myLevel >= 700 and World1 then
                    local iceDoor = workspace.Map.Ice.Door
                    if iceDoor.CanCollide == false and iceDoor.Transparency == 1 then
                        local cframe1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                        repeat
                            topos(cframe1)
                            task.wait(0.1)
                        until (cframe1.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 3 or not getgenv().AutoNewWorld
                        task.wait(1.1)
                        replicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                        task.wait(0.1)
                        EquipWeapon("Key")
                        local targetCFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                        repeat
                            topos(targetCFrame)
                            task.wait(0.1)
                        until (targetCFrame.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 3 or not getgenv().AutoNewWorld
                        task.wait(0.1)
                    else
                        if workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                            for _, v in pairs(workspace.Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                    local oldCFrameSecond = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(0.05)
                                        AutoHaki()
                                        EquipWeapon(getgenv().SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = oldCFrameSecond
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not getgenv().AutoNewWorld or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            if replicatedStorage:FindFirstChild("Ice Admiral") then
                                topos(replicatedStorage:FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            else
                                replicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Toggle = Ge:AddToggle("Toggle", {Title = "Auto Travel Zou", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoThirdSea = Value
    StopTween(getgenv().AutoThirdSea)
end)
spawn(function()
    while task.wait(0.1) do
        if getgenv().AutoThirdSea and World2 then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local replicatedStorage = game:GetService("ReplicatedStorage")
                local workspaceEnemies = game:GetService("Workspace").Enemies
                if player.Data.Level.Value >= 1500 and World2 then
                    getgenv().AutoFarm = false
                    if replicatedStorage.Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then
                        topos(CFrame.new(-1926.322, 12.82, 1738.309))                        
                        if (CFrame.new(-1926.322, 12.82, 1738.309).Position - player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            task.wait(1.1)
                            replicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                        end
                        task.wait(1.3)
                        if workspaceEnemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                            for _, v in pairs(workspaceEnemies:GetChildren()) do
                                if v.Name == "rip_indra" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    local oldCFrameThird = v.HumanoidRootPart.CFrame                                    
                                    repeat
                                        task.wait(0.05)
                                        AutoHaki()
                                        EquipWeapon(getgenv().SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CFrame = oldCFrameThird                                              
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        replicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")                                        
                                    until not getgenv().AutoThirdSea or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        elseif not workspaceEnemies:FindFirstChild("rip_indra") and 
                               (CFrame.new(-26880.934, 22.849, 473.19).Position - player.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                            topos(CFrame.new(-26880.934, 22.849, 473.19))
                        end
                    end
                end
            end)
        end
    end
				end)				
Toggle = Ge:AddToggle("Toggle", {Title = "Auto Touch Pad Haki", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoTouchPadHaki = Value
    StopTween(getgenv().AutoTouchPadHaki)
end)
spawn(function()
    while task.wait(1) do
        pcall(function()
            if getgenv().AutoTouchPadHaki and World3 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky")
                task.wait(0.5)
                local target1 = CFrame.new(-5420.16602, 1084.9657, -2666.8208)
                repeat
                    topos(target1)
                    task.wait(0.2)
                until getgenv().StopTween == true or getgenv().AutoTouchPadHaki == false or
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target1.Position).Magnitude <= 10
                task.wait(0.5)                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
                task.wait(0.5)
                local target2 = CFrame.new(-5414.41357, 309.865753, -2212.45776)
                repeat
                    topos(target2)
                    task.wait(0.2)
                until getgenv().StopTween == true or getgenv().AutoTouchPadHaki == false or
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target2.Position).Magnitude <= 10
                task.wait(0.5)                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White")
                task.wait(0.5)
                local target3 = CFrame.new(-4971.47559, 331.565765, -3720.02954)
                repeat
                    topos(target3)
                    task.wait(0.2)
                until getgenv().StopTween == true or getgenv().AutoTouchPadHaki == false or
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target3.Position).Magnitude <= 10
                task.wait(0.5)               
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 600))
                task.wait(1)
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 600))
            end
        end)
    end
				end)								
Toggle = Ge:AddToggle("Toggle", { Title = "Start Farm", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoFarm = Value
    StopTween(getgenv().AutoFarm)

    if Value then
        Fluent:Notify({
            Title = "Start Farm",
            Content = FarmMode,
            Duration = 5
        })
    end
end)
Ge:AddParagraph({
     Title = "Mastery Farm",
     Content = ""
					})				
Slider = Ge:AddSlider("Slider", {
     Title = "Select Health [ % ]",
     Default = 30,
     Min = 0,
     Max = 100,
     Rounding = 5,
     Callback = function(Value)
         getgenv().Kill_At = Value
    end
})
Dropdown = Ge:AddDropdown("DropdownFarm", {
    Title = "Select Method Farm Mastery",
    Values = {"Blox Fruit", "Gun"},
    Multi = false,
})
Dropdown:SetValue("Blox Fruit")
Dropdown:OnChanged(function(Value)
FarmMode2 = Value
end)
spawn(function()
    while task.wait() do
        if FarmMode2 == "Blox Fruit" and getgenv().MasteryFarm then
            pcall(function()
                QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    UseSkill = false
                    Skillaimbot = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    UseSkill = false
                    CheckQuest()
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 2000 then
                            BTP(CFrameQuest)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 2000 then
                            topos(CFrameQuest)
                        else
                            topos(CFrameQuest)
                        end
                    end
                    repeat task.wait()
                        topos(CFrameQuest)
                    until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not getgenv().MasteryFarm
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        wait(0.1)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == Mon then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        HealthMs = v.Humanoid.MaxHealth * getgenv().Kill_At / 100
                                        repeat task.wait()
                                            if v.Humanoid.Health <= HealthMs then
                                                AutoHaki()
                                                EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                                                v.HumanoidRootPart.CanCollide = false
                                                PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                PosMon = v.HumanoidRootPart.CFrame
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                UseSkill = true
                                                Skillaimbot = true
                                            else
                                                UseSkill = false
                                                Skillaimbot = false
                                                AutoHaki()
                                                EquipWeapon(getgenv().SelectWeapon)
                                                MonFarm = v.Name
                                                PosMon = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                            end
                                            getgenv().StartMagnet = true
                                        until not getgenv().MasteryFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        UseSkill = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        end
                    else
                        topos(CFrameMon)
                        UseSkill = false
                        Skillaimbot = false
                        Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon)

                        if Mob then
                            topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10))
                        else
                            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if UseSkill then
            pcall(function()
                CheckQuest()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        MasBF = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        MasBF = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        if getgenv().SkillZ then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if getgenv().SkillX then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if getgenv().SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                        if getgenv().SkillV then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        if getgenv().SkillF then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if UseSkill then
                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    if v.Name == "NotificationTemplate" then
                        if string.find(v.Text, "Skill locked!") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if UseSkill then
                local args = {
                    [1] = PosMonMasteryFruit.Position
                }
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
            end
        end)
    end)
end)    
spawn(function()
    pcall(function()
        while task.wait() do
            if FarmMode2 == "Gun" and getgenv().MasteryFarm then
                QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then                      
                    Skillaimbot = false          
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    CheckQuest()
                        if BypassTP then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 2000 then
						        BTP(CFrameQuest)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 2000 then
                                topos(CFrameQuest)
                            else
                                topos(CFrameQuest)
                            end
                        else                                 
                             topos(CFrameQuest)
                        end
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        task.wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        pcall(function()
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Mon then
                                    repeat task.wait()
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            HealthMin = v.Humanoid.MaxHealth * getgenv().Kill_At/100
                                            if v.Humanoid.Health <= HealthMin then
                                                EquipWeapon(SelectWeaponGun)
                                                Skillaimbot = true
                                                AimSkill = v.Engine.CFrame * CFrame.new(0, -15, 0)
                                                AimBotSkillPosition = AimSkill.Position
                                                MonFarm = v.Name                
                                                PosMon = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(2,2,1)
                                                v.Head.CanCollide = false                                                
                                                local args = {
                                                    [1] = v.HumanoidRootPart.Position,
                                                    [2] = v.HumanoidRootPart
                                                }
                                                game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                                task.wait(.1)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                                                task.wait(.1)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                                            else
                                                AutoHaki()
                                                EquipWeapon(getgenv().SelectWeapon)
                                                MonFarm = v.Name                
                                                PosMon = v.HumanoidRootPart.CFrame
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false    
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            end
                                            getgenv().StartMagnet = true 
                                            PosMonMasteryGun = v.HumanoidRootPart.CFrame
                                        else
                                            getgenv().StartMagnet = true 
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    until v.Humanoid.Health <= 0 or not getgenv().MasteryFarm or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end)
                    else
                       topos(CFrameMon)
                        Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                        if Mob then
                            topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                        else
                            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                            end
                        end
                    end 
                end
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        if getgenv().MasteryFarm then
            while task.wait() do
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end
    end)
end)
local plr = game:GetService("Players").LocalPlayer
spawn(function()
     pcall(function()
         while task.wait() do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v:IsA("Tool") then
                    if v:FindFirstChild("RemoteFunctionShoot") then 
                        SelectWeaponGun = v.Name
                    end
                end
            end
        end
    end)
end)
Toggle = Ge:AddToggle("Toggle", { Title = "Auto Farm Mastery", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().MasteryFarm = Value
    StopTween(getgenv().MasteryFarm)
end)
Ge:AddParagraph({
     Title = "Material Farm",
     Content = ""
					})				
local MaterialList = {}
if World1 then
    MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then
    MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then
    MaterialList = {"Leather + Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end
MaterialListMon = Ge:AddDropdown("MaterialListMon", {
    Title = "Select Material",
    Values = MaterialList,
    Multi = false
})
MaterialListMon:OnChanged(function(Value)
    getgenv().SelectMaterial = Value
end)
Toggle = Ge:AddToggle("Toggle", {Title = "Start Farm Material", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().AutoMaterial = Value
    if not Value then StopTween() end
end)
spawn(function()
    local function processEnemy(v, EnemyName)
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if v.Name == EnemyName then
                repeat
                    task.wait(0.1)
                    AutoHaki()
                    EquipWeapon(getgenv().SelectWeapon)
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid.WalkSpeed = 0
                    v.Head.CanCollide = false
                    topos(v.HumanoidRootPart.CFrame * Pos)
                    getgenv().StartMagnet = true
                    MonFarm = v.Name
                    PosMon = v.HumanoidRootPart.CFrame
                until not getgenv().AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
                UnEquipWeapon(getgenv().SelectWeapon)
            end
        end
    end
    local function handleEnemySpawns()
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            for _, EnemyName in ipairs(MMon) do
                if string.find(v.Name, EnemyName) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                        topos(v.CFrame * Pos)
                    end
                end
            end
        end
    end
    while task.wait(0.1) do
        if getgenv().AutoMaterial then
            pcall(function()
                if getgenv().SelectMaterial then
                    MaterialMon(getgenv().SelectMaterial)
                    topos(MPos)
                end
                for _, EnemyName in ipairs(MMon) do
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        processEnemy(v, EnemyName)
                    end
                end
                handleEnemySpawns()
            end)
        end
    end
				end)	
Ge:AddParagraph({
     Title = "Boss Farm",
     Content = ""
					})			
if World1 then
    tableBoss = {
        "The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", 
        "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", 
        "Wysper", "Thunder God", "Cyborg", "Saber Expert"
    }
elseif World2 then
    tableBoss = {
        "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", 
        "Cursed Captain", "Darkbeard", "Order", "Awakened Ice Admiral", "Tide Keeper"
    }
elseif World3 then
    tableBoss = {
        "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", 
        "Beautiful Pirate", "rip_indra True Form", "Longma", "Soul Reaper", 
        "Cake Queen", "Cake Prince", "Dough King"
    }
end
Dropdown = Ge:AddDropdown("Dropdown", {
    Title = "Select Boss",
    Values = tableBoss,
    Multi = false,
})
Dropdown:OnChanged(function(Value)
    getgenv().SelectBoss = Value
end)
Toggle = Ge:AddToggle("Toggle", {Title = "Auto Farm Boss", Default = getgenv().AutoFarmBoss })
Toggle:OnChanged(function(Value)
    getgenv().AutoFarmBoss = Value
    StopTween(getgenv().AutoFarmBoss)
end)
spawn(function()
    while task.wait(0.2) do
        if getgenv().AutoFarmBoss and getgenv().BypassTP then
            pcall(function()
                local workspaceEnemies = game:GetService("Workspace").Enemies
                local selectBoss = getgenv().SelectBoss
                local selectWeapon = getgenv().SelectWeapon
                local playerRoot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local boss = workspaceEnemies:FindFirstChild(selectBoss)
                if boss then
                    for _, v in pairs(workspaceEnemies:GetChildren()) do
                        if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                            local humanoid = v.Humanoid
                            local humanoidRootPart = v.HumanoidRootPart
                            if humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(getgenv().SelectWeapon)
                                    if humanoidRootPart.CanCollide then
                                        humanoidRootPart.CanCollide = false
                                    end
                                    if humanoid.WalkSpeed ~= 0 then
                                        humanoid.WalkSpeed = 0
                                    end
                                    if humanoidRootPart.Size ~= Vector3.new(80, 80, 80) then
                                        humanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    end
                                    topos(humanoidRootPart.CFrame * Pos)
                                until not getgenv().AutoFarmBoss or not v.Parent or humanoid.Health <= 0
                            end
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild(selectBoss) then
                    local bossReplicated = game.ReplicatedStorage:FindFirstChild(selectBoss)
                    local bossRoot = bossReplicated.HumanoidRootPart
                    if (bossRoot.CFrame.Position - playerRoot.Position).Magnitude <= 1500 then
                        topos(bossRoot.CFrame)
                    else
                        BTP(bossRoot.CFrame)
                    end
                end
            end)
        end
    end
				end)										
				
Hold = Window:AddTab({ Title = "Setting Hold Skill", Icon = "hand" })
Hold:AddParagraph({
     Title = "Mastery Farm",
     Content = ""
					})
Toggle = Hold:AddToggle("Toggle", {Title = "Skill Z", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().SkillZ = Value
end)
Toggle = Hold:AddToggle("Toggle", {Title = "Skill X", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().SkillX = Value
end)
Toggle = Hold:AddToggle("Toggle", {Title = "Skill C", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().SkillC = Value
end)
Toggle = Hold:AddToggle("Toggle", {Title = "Skill V", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().SkillV = Value
end)
Toggle = Hold:AddToggle("Toggle", {Title = "Skill F", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().SkillF = Value
				end)					
Hold:AddParagraph({
     Title = "Sea Event",
     Content = ""
					})
Toggle = Hold:AddToggle("Toggle", {
    Title = "Select Use Fruit",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().UseSeaFruitSkill = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Select Use Melee",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().UseSeaMeleeSkill = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Select Use Sword",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().UseSeaSwordSkill = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Select Use Gun",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().UseSeaGunSkill = value
				end)
Hold:AddParagraph({
    Title = "Prehistoric Island",
    Content = ""
})
Toggle = Hold:AddToggle("Toggle", {
    Title = "Auto Use Skill Melee",
    Default = false
})
Toggle:OnChanged(function(v402)
    getgenv().UseMelee = v402
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Auto Use Skill Sword",
    Default = false
})
Toggle:OnChanged(function(v403)
    getgenv().UseSword = v403
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Auto Use Skill Gun",
    Default = false
})
Toggle:OnChanged(function(v404)
    getgenv().UseGun = v404
				end)
Hold:AddParagraph({
    Title = "Skill Fruit",
    Content = ""
})
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Fruit Z",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillFruitZ = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Fruit X",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillFruitX = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Fruit C",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillFruitC = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Fruit V",
    Default = false
})
Toggle:OnChanged(function(value)
    getgenv().SkillFruitV = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Fruit F",
    Default = false
})
Toggle:OnChanged(function(value)
    getgenv().SkillFruitF = value
end)
Hold:AddParagraph({
    Title = "Skill Melee",
    Content = ""
})
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Melee Z",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillMeleeZ = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Melee X",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillMeleeX = value
end)
Toggle = Hold:AddToggle("Toggle", {
    Title = "Skill Melee C",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillMeleeC = value
end)
Hold:AddParagraph({
    Title = "Skill Sword And Gun",
    Content = ""
})
Toggle = Hold:AddToggle("Toggle", {
    Title = "Sword And Gun Skill Z",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillSwordZ = value
    getgenv().SkillGunZ = value
end) 
Toggle = Hold:AddToggle("Toggle", {
    Title = "Sword And Gun Skill X",
    Default = true
})
Toggle:OnChanged(function(value)
    getgenv().SkillSwordX = value
    getgenv().SkillGunX = value
				end)
Misc = Window:AddTab({ Title = "Miscellanea", Icon = "divide" })			

Ac = Window:AddTab({ Title = "Account Details", Icon = "copy" })					
Ac:AddParagraph({
    Title = "Name",
    Content = "Name : "..game.Players.LocalPlayer.Name.."",
								})
Ac:AddParagraph({
    Title = "Level",
    Content = "Level : "..game:GetService("Players").LocalPlayer.Data.Level.Value.."",
				})					
Ac:AddParagraph({
    Title = "Race",
    Content = "Race : "..game:GetService("Players").LocalPlayer.Data.Race.Value.."",
				})						
Ac:AddParagraph({
    Title = "Beli",
    Content = "Beli : "..game:GetService("Players").LocalPlayer.Data.Beli.Value.."",
				})						
Ac:AddParagraph({
    Title = "Fragments",
    Content = "Fragments : "..game:GetService("Players").LocalPlayer.Data.Fragments.Value.."",
				})		
Ac:AddParagraph({
    Title = "Bounty",
    Content = "Bounty/Honor : "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value.."",
				})						
Ac:AddParagraph({
    Title = "Devil Fruit",
    Content = "Devil Fruit : "..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.."",
				})						
GodHuman = Ac:AddParagraph({
     Title = "GodHuman",
     Content = ""
					})
spawn(function()
	while wait() do
		pcall(function()
			if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 1 then
				GodHuman:SetDesc("GodHuman 🟢")
			else
				GodHuman:SetDesc("God Human 🔴")
			end
		end)
	end
	end)				
function CheckMaterialCount()
    local materials = {}
    for _, item in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if item["Type"] == "Material" then
            table.insert(materials, item.Name .. " : " .. item["Count"])
        end
    end
    return table.concat(materials, "\n")
end
materialStatus = Ac:AddParagraph({
    Title = "Material Inventory :",
    Content = CheckMaterialCount()
})

spawn(function()
    while wait(5) do
        materialStatus:SetDesc(CheckMaterialCount())
    end
end)
Fr = Window:AddTab({ Title = "Fruit - Raid", Icon = "bar-chart" })			
Toggle = Fr:AddToggle("Toggle", {Title = "Random Fruit", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().RandomFruit = Value
end)
spawn(function()
     while task.wait(0.2) do
         if getgenv().RandomFruit then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
          end 
     end
					end)				
Toggle = Fr:AddToggle("Toggle", {Title = "Auto Store Fruit", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoStoreFruit = Value
end)    
spawn(function()
    while task.wait(0.2) do
        if getgenv().AutoStoreFruit then
            pcall(function()
                if getgenv().AutoStoreFruit then
                    local player = game:GetService("Players").LocalPlayer
                    local character = player.Character
                    local backpack = player.Backpack
                    local fruits = {
                        {"Rocket Fruit", "Rocket-Rocket"},
                        {"Spin Fruit", "Spin-Spin"},
                        {"Blade Fruit", "Blade-Blade"},
                        {"Spring Fruit", "Spring-Spring"},
                        {"Bomb Fruit", "Bomb-Bomb"},
                        {"Smoke Fruit", "Smoke-Smoke"},
                        {"Spike Fruit", "Spike-Spike"},
                        {"Flame Fruit", "Flame-Flame"},
                        {"Falcon Fruit", "Falcon-Falcon"},
                        {"Ice Fruit", "Ice-Ice"},
                        {"Sand Fruit", "Sand-Sand"},
                        {"Dark Fruit", "Dark-Dark"},
                        {"Diamond Fruit", "Diamond-Diamond"},
                        {"Light Fruit", "Light-Light"},
                        {"Rubber Fruit", "Rubber-Rubber"},
                        {"Barrier Fruit", "Barrier-Barrier"},
                        {"Ghost Fruit", "Ghost-Ghost"},
                        {"Magma Fruit", "Magma-Magma"},
                        {"Quake Fruit", "Quake-Quake"},
                        {"Buddha Fruit", "Buddha-Buddha"},
                        {"Love Fruit", "Love-Love"},
                        {"Spider Fruit", "Spider-Spider"},
                        {"Sound Fruit", "Sound-Sound"},
                        {"Phoenix Fruit", "Phoenix-Phoenix"},
                        {"Portal Fruit", "Portal-Portal"},
                        {"Rumble Fruit", "Rumble-Rumble"},
                        {"Pain Fruit", "Pain-Pain"},
                        {"Blizzard Fruit", "Blizzard-Blizzard"},
                        {"Gravity Fruit", "Gravity-Gravity"},
                        {"Mammoth Fruit", "Mammoth-Mammoth"},
                        {"T-Rex Fruit", "T-Rex-T-Rex"},
                        {"Dough Fruit", "Dough-Dough"},
                        {"Shadow Fruit", "Shadow-Shadow"},
                        {"Venom Fruit", "Venom-Venom"},
                        {"Gas Fruit", "Gas-Gas"},
                        {"Control Fruit", "Control-Control"},
                        {"Spirit Fruit", "Spirit-Spirit"},
                        {"Leopard Fruit", "Leopard-Leopard"},
                        {"Yeti Fruit", "Yeti-Yeti"},
                        {"Kitsune Fruit", "Kitsune-Kitsune"},
                        {"Dragon Fruit", "Dragon-Dragon"},
                    }
                    for _, fruit in ipairs(fruits) do
                        local fruitName, serverName = fruit[1], fruit[2]
                        if character:FindFirstChild(fruitName) or backpack:FindFirstChild(fruitName) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", serverName, backpack:FindFirstChild(fruitName))
                        end
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)
FruitList = {
  "Rocket-Rocket",
  "Spin-Spin",
  "Blade-Blade",
  "Spring-Spring",
  "Bomb-Bomb",
  "Smoke-Smoke",
  "Spike-Spike",
  "Flame-Flame",
  "Falcon-Falcon",
  "Ice-Ice",
  "Sand-Sand",
  "Dark-Dark",
  "Diamond-Diamond",
  "Light-Light",
  "Rubber-Rubber",
  "Barrier-Barrier",
  "Ghost-Ghost",
  "Magma-Magma",
  "Quake-Quake",
  "Buddha-Buddha",
  "Love-Love",
  "Spider-Spider",
  "Sound-Sound",
  "Phoenix-Phoenix",
  "Portal-Portal",
  "Rumble-Rumble",
  "Pain-Pain",
  "Blizzard-Blizzard",
  "Gravity-Gravity",
  "T-Rex-T-Rex",
  "Mammoth-Mammoth",
  "Dough-Dough",
  "Shadow-Shadow",
  "Venom-Venom",
  "Gas-Gas",
  "Control-Control",
  "Spirit-Spirit",
  "Leopard-Leopard",
  "Yeti-Yeti",
  "Kitsune-Kitsune",
  "Dragon-Dragon"
 }
Dropdown = Fr:AddDropdown("Dropdown", {
    Title = "Blox Fruit Sniper Shop",
    Values = FruitList,
    Multi = false,
})
Dropdown:OnChanged(function(Value)
    getgenv().SelectFruit = Value
end)    
Toggle = Fr:AddToggle("Toggle", {Title = "Buy Blox Fruit Sniper Shop", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoBuyFruitSniper = Value
end)
spawn(function()
    pcall(function()
        while task.wait(1) do
            if getgenv().AutoBuyFruitSniper then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
            end
        end
    end)
				end)					
ShopDevilSell = {}
local fruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")

for _, fruit in next, fruits do
    if fruit.OnSale then
        table.insert(ShopDevilSell, "- " .. fruit.Name) -- Thêm dấu '-' trước mỗi tên trái
    end
end
Toggle = Fr:AddToggle("Toggle", {Title = "Teleport To Fruit", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().TeleportToFruit = Value
    StopTween(getgenv().TeleportToFruit)
end)

spawn(function()
    while task.wait(0.2) do
        if getgenv().TeleportToFruit then
            local foundFruit = false
            for _, v in ipairs(Workspace:GetChildren()) do
                if v:IsA("Model") and string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    topos(v.Handle.CFrame)
                    foundFruit = true
                    break
                end
            end
            if not foundFruit then
                Fluent:Notify({
                    Title = "No Fruit Found",
                    Content = "",
                    Duration = 5
                })
            end
        end
    end
end)
Fr:AddParagraph({
    Title = "Normal Stock :",
    Content = "Fruits On Sale :\n" .. table.concat(ShopDevilSell, "\n") -- Xuống dòng mỗi trái cây
				})
Fr:AddParagraph({
    Title = "Raids",
    Content = "",
				})				
Dropdown = Fr:AddDropdown("Dropdown", {
    Title = "Select Raid",
    Values = {
        "Dark", "Sand", "Magma", "Rumble", "Flame", 
        "Ice", "Light", "Quake", "Buddha", "Spider", 
        "Phoenix", "Dough"
    },
    Multi = false,
})
Dropdown:OnChanged(function(Value)
    getgenv().SelectChip = Value
end)
Input = Fr:AddInput("Input", {
        Title = "Range Attack",
        Default = "150",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            getgenv().Range = tonumber(Value) or 150
        end
								})
Toggle = Fr:AddToggle("Toggle", {Title = "Get Fruit In Inventory Low Beli", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().AutoGetFruit = Value
end)
spawn(function()
    while task.wait(.1) do
        pcall(function()
            if getgenv().AutoGetFruit then
                local fruits = {"Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", 
                                "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark", 
                                "Ghost-Ghost", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Barrier-Barrier"}

                for _, fruit in ipairs(fruits) do
                    local args = {
                        [1] = "LoadFruit",
                        [2] = fruit
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
				end)				
Toggle = Fr:AddToggle("Toggle", {Title = "Auto Raid", Description = "Adjust attack range in range attack", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().Auto_Dungeon = Value
end)
function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
            then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
            then
                return v
            end
        end
    end
end

function getNextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if IsIslandRaid(v) and (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return IsIslandRaid(v)
        end
    end
end

function attackNearbyEnemies()
	   local range = getgenv().Range or 150
    local enemies = {}
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance <= range then
                table.insert(enemies, v)
            end
        end
    end

    for _, enemy in pairs(enemies) do
        repeat
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                EquipWeapon(getgenv().SelectWeapon)
                topos(enemy.HumanoidRootPart.CFrame * Pos)
                wait(0.1)
            end
        until not enemy:FindFirstChild("Humanoid") or enemy.Humanoid.Health <= 0
    end
end

spawn(function()
    while wait() do
        if getgenv().Auto_Dungeon then
            attackNearbyEnemies()
            if getNextIsland() then
                spawn(topos(getNextIsland().CFrame * CFrame.new(0, 60, 0)), 1)
            end
        end
    end
end)
spawn(function()
    while task.wait(1) do
        pcall(function()
            if getgenv().Auto_Dungeon then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    local specialMicrochip = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") 
                                            or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")
                    if specialMicrochip then
                        if World2 then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait(1) do
        if getgenv().Auto_Dungeon then
            pcall(function()
                local args = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = getgenv().SelectChip
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
spawn(function()
    while wait(1) do
        pcall(function()
            if getgenv().Auto_Dungeon then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    local specialMicrochip = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") 
                                            or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")
                    if specialMicrochip then
                        if World2 then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
				end)	
Toggle = Fr:AddToggle("Toggle", {Title = "Auto Awaken Fruit", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().AutoAwaken = Value
end)
spawn(function()
    pcall(function()
        while wait(1) do
            if getgenv().AutoAwaken then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end
        end
    end)
end)
if World2 then
Fr:AddButton({
    Title = "Teleport To Lab",
    Description = "",
    Callback = function()
        topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
    end
})
end
if World3 then
Fr:AddButton({
    Title = "Teleport To Lab",
    Description = "",
    Callback = function()
        topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
    end
})
end				
Pl = Window:AddTab({ Title = "Plus", Icon = "fan" })			
Sound = Instance.new("Sound")
Sound.Parent = game:GetService("Workspace") 
Sound.Looped = true
Sound.Volume = 3

NhacList = {
    ["Deep Science"] = "rbxassetid://1837946662",
    ["Mất Kết Nối"] = "rbxassetid://101663254075442",
    ["Một Cú Lừa"] = "rbxassetid://107107621753490",
    ["Ghé Qua"] = "rbxassetid://4567890123",
				["Cute Baby"] = "rbxassetid://124304850520490"
}

CurrentMusic = ""

Nhac = Pl:AddDropdown("Nhac", {
    Title = "Select Song",
    Description = "",
    Values = {"Deep Science", "Mất Kết Nối", "Một Cú Lừa", "Ghé Qua"},
    Multi = false,
    Default = false,
})
Nhac:SetValue("")

Toggle = Pl:AddToggle("Toggle", {Title = "Play Song", Default = false})

Nhac:OnChanged(function(Value)
    if NhacList[Value] then
        Sound.SoundId = NhacList[Value]
        CurrentMusic = Value
    end
end)

Toggle:OnChanged(function(Value)
    getgenv().PlayMusic = Value
    if getgenv().PlayMusic and CurrentMusic ~= "" then
        Sound:Play()
        Fluent:Notify({
            Title = "Playing Song",
            Content = CurrentMusic,
            Duration = 5
        })
    else
        Sound:Stop()
    end
				end)

Sea = Window:AddTab({ Title = "Sea Event", Icon = "beer" })			

Vc = Window:AddTab({ Title = "Volcano Event", Icon = "focus" })

Dit = Window:AddTab({ Title = "Quest - Item", Icon = "award" })
Lc = Window:AddTab({ Title = "Local Player", Icon = "ruler" })		
Lc:AddButton({
    Title = "Stop Tween",
    Callback = function()
        StopTween()
    end
				})
Lc:AddButton({
        Title = "Reset Character",
        Description = "",
        Callback = function()            
game.Players.LocalPlayer.Character.Head:Destroy()
        end
								})				
Lc:AddButton({
        Title = "Open Devil Fruit Shop",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
      	game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
        end
								})				
Lc:AddButton({
    Title = "Open Title",
    Callback = function()
        local args = {"getTitles"}
        local success, result = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        if success then
            game.Players.LocalPlayer.PlayerGui.Main.Titles.Visible = true
        end
    end
				})				
Lc:AddButton({
        Title = "Remove Fog",
        Description = "",
        Callback = function()
        game:GetService("Lighting").BaseAtmosphere:Destroy()
        end
								})				
Lc:AddButton({
    Title = "Boost FPS",
    Callback = function()
        FPSBooster()
    end
})
function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain    
    sethiddenproperty(l, "Technology", 2)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"    
    local function optimizePart(v)
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end    
    for i, v in pairs(w:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("MeshPart") then
            optimizePart(v)
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
			end				
local canChangeTeam = true
local debounceTime = 2
Lc:AddButton({
    Title = "Change Team To Pirates",
    Callback = function()
        if not canChangeTeam then
            return
        end
        canChangeTeam = false
        task.wait(debounceTime)
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end)
        canChangeTeam = true
    end
})
local canChangeTeam = true
local debounceTime = 2
Lc:AddButton({
    Title = "Change Team To Marines",
    Callback = function()
        if not canChangeTeam then
            return
        end
        canChangeTeam = false
        task.wait(debounceTime)
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
        end)
        canChangeTeam = true
    end
				})
Dropdown = Lc:AddDropdown("Dropdown", {
    Title = "Select Stats",
    Values = {"Melee", "Defense", "Sword", "Gun", "Fruit"},
    Multi = false,
})
Dropdown:SetValue("Melee")
Dropdown:OnChanged(function(Value)
StatsMode = Value
end)
spawn(function()
    while true do
        wait(0.5)
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Data") and player.Data:FindFirstChild("Points") then
            if player.Data.Points.Value >= PointStats and getgenv().AutoStats then
                local statTypes = {
                    Melee = "Melee",
                    Defense = "Defense",
                    Sword = "Sword",
                    Gun = "Gun",
                    Fruit = "Demon Fruit"
                }                
                local selectedStat = statTypes[StatsMode]
                if selectedStat then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", selectedStat, PointStats)
                end
            end
        end
    end
end)
Slider = Lc:AddSlider("Slider", {
        Title = "Point Stats",
        Description = "",
        Default = 3,
        Min = 3,
        Max = 99,
        Rounding = 0,
        Callback = function(value)
        PointStats = value
    end
})
Toggle = Lc:AddToggle("Toggle", { Title = "Auto Stats", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AutoStats = Value
				end)			
local Toggle = Lc:AddToggle("Toggle", {Title = "Auto Set Spawn Point", Default = false })
local lastSetState = false
Toggle:OnChanged(function(Value)
    getgenv().Set = Value
    if Value ~= lastSetState then
        lastSetState = Value
        if Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end)
        end
    end
				end)
Toggle = Lc:AddToggle("Toggle", {Title = "Auto Rejoin On Kick", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AutoRejoinKick = Value
    if Value then
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end)
    else
        if getgenv().rejoin then
            getgenv().rejoin:Disconnect()
            getgenv().rejoin = nil
        end
    end
				end)
Toggle = Lc:AddToggle("Toggle", {Title = "Stop When Have God's Chalice & Fist Of Darkness", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().StopChest = Value
end)
spawn(function()
    while task.wait(0.5) do
        if getgenv().StopChest then
            local player = game.Players.LocalPlayer
            if not player then continue end       
            local backpack = player:FindFirstChild("Backpack")
            local character = player.Character            
            if backpack and character then
                if backpack:FindFirstChild("Fist of Darkness") or character:FindFirstChild("Fist of Darkness") or 
                   backpack:FindFirstChild("God's Chalice") or character:FindFirstChild("God's Chalice") then
                    getgenv().AutoFarmChest = false
                    if ToggleChest and typeof(ToggleChest.Set) == "function" then
                        ToggleChest:Set(false)
                    end
                    break
                end
            end
        end
    end
				end)					
Toggle = Lc:AddToggle("Toggle", {Title = "No Clip", Default = true })
Toggle:OnChanged(function(v)
    getgenv().NoClip = v
    if getgenv().NoClipConnection then getgenv().NoClipConnection:Disconnect() end
    if v then
        getgenv().NoClipConnection = game:GetService("RunService").Stepped:Connect(function()
            for _, p in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end)
    else
        for _, p in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
				end)				
Toggle = Lc:AddToggle("Toggle", {Title = "Enable White Screen", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().WhiteScreen = Value
    if getgenv().WhiteScreen == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif getgenv().WhiteScreen == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
				end)			

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommF_Remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
Lc:AddButton({
    Title = "Travel Main",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("TravelMain")
        end)
        if not success then
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Lc:AddButton({
    Title = "Travel Dressrosa",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("TravelDressrosa")
        end)
        if not success then            
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Lc:AddButton({
    Title = "Travel Zou",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("TravelZou")
        end)
        if not success then
        end
    end
				})
if World1 then
    Dropdown = Lc:AddDropdown("Dropdown", {
        Title = "Select Island",
        Values = {
            "WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village", 
            "Desert", "Snow Island", "MarineFord", "Colosseum", "Sky Island 1", 
            "Sky Island 2", "Sky Island 3", "Prison", "Magma Village", 
            "Under Water Island", "Fountain City", "Shank Room", "Mob Island"
        },
        Multi = false,
        Default = false,
    })
    Dropdown:SetValue("")
    Dropdown:OnChanged(function(Value)
        getgenv().SelectIsland = Value
    end)
end
if World2 then
    Dropdown = Lc:AddDropdown("Dropdown", {
        Title = "Select Island",
        Values = {
            "The Cafe", "Frist Spot", "Dark Area", "Flamingo Mansion", "Flamingo Room", 
            "Green Zone", "Factory", "Colossuim", "Zombie Island", "Two Snow Mountain", 
            "Punk Hazard", "Cursed Ship", "Ice Castle", "Forgotten Island", 
            "Ussop Island", "Mini Sky Island"
        },
        Multi = false,
        Default = false,
    })
    Dropdown:SetValue("")
    Dropdown:OnChanged(function(Value)
        getgenv().SelectIsland = Value
    end)
end
if World3 then
    Dropdown = Lc:AddDropdown("Dropdown", {
        Title = "Select Island",
        Values = {
            "Mansion", "Port Town", "Great Tree", "Castle On The Sea", "MiniSky", 
            "Hydra Island", "Floating Turtle", "Haunted Castle", "Ice Cream Island", 
            "Peanut Island", "Cake Island", "Cocoa Island", "Candy Island", "Tiki Outpost"
        },
        Multi = false,
        Default = false,
    })
    Dropdown:SetValue("")
    Dropdown:OnChanged(function(Value)
        getgenv().SelectIsland = Value
    end)
end    
Toggle = Lc:AddToggle("Toggle", {Title = "Tween To Island", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().TeleportIsland = Value
    if getgenv().TeleportIsland == true then
        repeat task.wait()
            if getgenv().SelectIsland == "WindMill" then
                topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
            elseif getgenv().SelectIsland == "Marine" then
                topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
            elseif getgenv().SelectIsland == "Middle Town" then
                topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
            elseif getgenv().SelectIsland == "Jungle" then
                topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
            elseif getgenv().SelectIsland == "Pirate Village" then
                topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
            elseif getgenv().SelectIsland == "Desert" then
                topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
            elseif getgenv().SelectIsland == "Snow Island" then
                topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
            elseif getgenv().SelectIsland == "MarineFord" then
                topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
            elseif getgenv().SelectIsland == "Colosseum" then
                topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
            elseif getgenv().SelectIsland == "Sky Island 1" then
                topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
            elseif getgenv().SelectIsland == "Sky Island 2" then  
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif getgenv().SelectIsland == "Sky Island 3" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif getgenv().SelectIsland == "Prison" then
                topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
            elseif getgenv().SelectIsland == "Magma Village" then
                topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
            elseif getgenv().SelectIsland == "Under Water Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif getgenv().SelectIsland == "Fountain City" then
                topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
            elseif getgenv().SelectIsland == "Shank Room" then
                topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
            elseif getgenv().SelectIsland == "Mob Island" then
                topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
            elseif getgenv().SelectIsland == "The Cafe" then
                topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
            elseif getgenv().SelectIsland == "Frist Spot" then
                topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
            elseif getgenv().SelectIsland == "Dark Area" then
                topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
            elseif getgenv().SelectIsland == "Flamingo Mansion" then
                topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
            elseif getgenv().SelectIsland == "Flamingo Room" then
                topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
            elseif getgenv().SelectIsland == "Green Zone" then
                topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
            elseif getgenv().SelectIsland == "Factory" then
                topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
            elseif getgenv().SelectIsland == "Colossuim" then
                topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
            elseif getgenv().SelectIsland == "Zombie Island" then
                topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
            elseif getgenv().SelectIsland == "Two Snow Mountain" then
                topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
            elseif getgenv().SelectIsland == "Punk Hazard" then
                topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
            elseif getgenv().SelectIsland == "Cursed Ship" then
                topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
            elseif getgenv().SelectIsland == "Ice Castle" then
                topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
            elseif getgenv().SelectIsland == "Forgotten Island" then
                topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
            elseif getgenv().SelectIsland == "Ussop Island" then
                topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
            elseif getgenv().SelectIsland == "Mini Sky Island" then
                topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
            elseif getgenv().SelectIsland == "Great Tree" then
                topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
            elseif getgenv().SelectIsland == "Castle On The Sea" then
                topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
            elseif getgenv().SelectIsland == "MiniSky" then
                topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
            elseif getgenv().SelectIsland == "Port Town" then
                topos(CFrame.new(-95, 11, 5455))
            elseif getgenv().SelectIsland == "Hydra Island" then
                topos(CFrame.new(5433, 1062, 290))
            elseif getgenv().SelectIsland == "Floating Turtle" then
                topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
            elseif getgenv().SelectIsland == "Mansion" then
                topos(CFrame.new(-12551, 337, -7476))
            elseif getgenv().SelectIsland == "Haunted Castle" then
                topos(CFrame.new(-9516, 142, 5537))
            elseif getgenv().SelectIsland == "Ice Cream Island" then
                topos(CFrame.new(-874, 66, -10915))
            elseif getgenv().SelectIsland == "Peanut Island" then
                topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
            elseif getgenv().SelectIsland == "Cake Island" then
                topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
            elseif getgenv().SelectIsland == "Cocoa Island" then
                topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
            elseif getgenv().SelectIsland == "Candy Island" then
                topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
            elseif getgenv().SelectIsland == "Tiki Outpost" then
                topos(CFrame.new(-16101.1885, 12.8422165, 380.942291, 0.194113985, 1.39194061e-08, -0.980978966, -9.82904691e-09, 1, 1.22443504e-08, 0.980978966, 7.26528837e-09, 0.194113985))
            end
        until not getgenv().TeleportIsland
    end
				end)			
Lc:AddParagraph({
        Title = "Visual & Pvp",
        Content = ""
								})				
local RunService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local IslandESP = false
local updateConnection
function UpdateIslandESP()
    if not player or not player.Character or not player.Character:FindFirstChild("Head") then return end
    local headPosition = player.Character.Head.Position
    local locations = game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()
    for _, v in ipairs(locations) do
        if v.Name ~= "Sea" then
            if IslandESP then
                local bill = v:FindFirstChild("NameEsp")
                if not bill then
                    bill = Instance.new("BillboardGui")
                    bill.Name = "NameEsp"
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    bill.Parent = v
                    local name = Instance.new("TextLabel", bill)
                    name.Font = Enum.Font.GothamBold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Parent = bill
                end                
                local textLabel = bill:FindFirstChildOfClass("TextLabel")
                if textLabel then
                    local distance = (headPosition - v.Position).Magnitude / 3
                    textLabel.Text = string.format("%s\n%d Distance", v.Name, math.floor(distance + 0.5))
                end
            else
                local existingBill = v:FindFirstChild("NameEsp")
                if existingBill then
                    existingBill:Destroy()
                end
            end
        end
    end
end
Toggle = Lc:AddToggle("Toggle", {Title = "ESP Island", Default = false })
Toggle:OnChanged(function(Value)
    IslandESP = Value
    if IslandESP then
        if not updateConnection then
            updateConnection = RunService.Heartbeat:Connect(UpdateIslandESP)
        end
    else
        if updateConnection then
            updateConnection:Disconnect()
            updateConnection = nil
        end
        for _, v in ipairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            local existingBill = v:FindFirstChild("NameEsp")
            if existingBill then
                existingBill:Destroy()
            end
        end
    end
end)
local RunService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local DevilFruitESP = false
local updateConnection
local Number = math.random(1, 1000000)
function UpdateDevilChams()
    if not player or not player.Character or not player.Character:FindFirstChild("Head") then return end
    local headPosition = player.Character.Head.Position
    for _, v in ipairs(game.Workspace:GetChildren()) do
        pcall(function()
            if v:IsA("Model") and string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                local handle = v.Handle
                if DevilFruitESP then
                    local bill = handle:FindFirstChild("NameEsp" .. Number)
                    if not bill then
                        bill = Instance.new("BillboardGui")
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = handle
                        bill.AlwaysOnTop = true
                        bill.Parent = handle
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        name.Parent = bill
                    end
                    local textLabel = bill:FindFirstChildOfClass("TextLabel")
                    if textLabel then
                        local distance = (headPosition - handle.Position).Magnitude / 3
                        textLabel.Text = string.format("%s\n%d Distance", v.Name, math.floor(distance + 0.5))
                    end
                else
                    local existingBill = handle:FindFirstChild("NameEsp" .. Number)
                    if existingBill then
                        existingBill:Destroy()
                    end
                end
            end
        end)
    end
end
Toggle = Lc:AddToggle("Toggle", {Title = "ESP Fruit", Default = false })
Toggle:OnChanged(function(Value)
    DevilFruitESP = Value
    if DevilFruitESP then
        if not updateConnection then
            updateConnection = RunService.Heartbeat:Connect(UpdateDevilChams)
        end
    else
        if updateConnection then
            updateConnection:Disconnect()
            updateConnection = nil
        end
        for _, v in ipairs(game.Workspace:GetChildren()) do
            if v:IsA("Model") and string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                local handle = v.Handle
                local existingBill = handle:FindFirstChild("NameEsp" .. Number)
                if existingBill then
                    existingBill:Destroy()
                end
            end
        end
    end
end)
local RunService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local ESPPlayer = false
local updateConnection
local Number = math.random(1, 1000000)
function UpdatePlayerChams()
    if not player or not player.Character or not player.Character:FindFirstChild("Head") then return end
    local headPosition = player.Character.Head.Position
    for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
        pcall(function()
            if v ~= player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
                local head = v.Character.Head
                local humanoid = v.Character.Humanoid
                local bill = head:FindFirstChild("NameEsp" .. Number)
                if ESPPlayer then
                    if not bill then
                        bill = Instance.new("BillboardGui")
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = head
                        bill.AlwaysOnTop = true
                        bill.Parent = head
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.Parent = bill
                    end
                    local textLabel = bill:FindFirstChildOfClass("TextLabel")
                    if textLabel then
                        local distance = math.floor((headPosition - head.Position).Magnitude / 3 + 0.5)
                        local healthPercent = math.floor((humanoid.Health / humanoid.MaxHealth) * 100 + 0.5)
                        textLabel.Text = string.format("%s\n%d Distance\nHealth: %d%%", v.Name, distance, healthPercent)
                        if v.Team == player.Team then
                            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                        else
                            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                else
                    if bill then
                        bill:Destroy()
                    end
                end
            end
        end)
    end
end
Toggle = Lc:AddToggle("Toggle", {Title = "ESP Player", Default = false })
Toggle:OnChanged(function(Value)
    ESPPlayer = Value
    if ESPPlayer then
        if not updateConnection then
            updateConnection = RunService.Heartbeat:Connect(UpdatePlayerChams)
        end
    else
        if updateConnection then
            updateConnection:Disconnect()
            updateConnection = nil
        end
        for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
                local head = v.Character.Head
                local existingBill = head:FindFirstChild("NameEsp" .. Number)
                if existingBill then
                    existingBill:Destroy()
                end
            end
        end
    end
end)
local Playerslist = {}
for i, player in ipairs(game.Players:GetPlayers()) do
    Playerslist[i] = player.Name
end    
Dropdown = Lc:AddDropdown("Dropdown", {
     Title = "Select Player PVP",
     Values = Playerslist,
     Multi = false,
     Default = false,
})
Dropdown:OnChanged(function(Value)
   getgenv().SelectPlayer = Value
end)
Toggle = Lc:AddToggle("MyToggle", {
    Title = "Teleport Player",
    Default = false
})
Toggle:OnChanged(function(Value)
    getgenv().TeleportPlayer = Value
    if getgenv().TeleportPlayer then
        task.spawn(function()
            while getgenv().TeleportPlayer do
                local player = game:GetService("Players"):FindFirstChild(getgenv().SelectPlayer)
                if player and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        topos(hrp.CFrame)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)
Toggle = Lc:AddToggle("Toggle", {Title = "Auto Aimbot", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().Aimbot = Value
end)        
spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if getgenv().Aimbot and getgenv().SelectPlayer then
                local player = game.Players:FindFirstChild(getgenv().SelectPlayer)
                local localPlayer = game.Players.LocalPlayer
                local character = localPlayer.Character
                local tool = character and character:FindFirstChildOfClass("Tool")
                if player and player.Character and tool then
                    local remoteEvent = tool:FindFirstChild("RemoteEvent")
                    local mousePos = tool:FindFirstChild("MousePos")
                    local target = player.Character:FindFirstChild("HumanoidRootPart")
                    if remoteEvent and mousePos and target then
                        remoteEvent:FireServer(target.Position)
                    end
                end
            end
        end
    end)
end)
Toggle = Lc:AddToggle("Toggle", {Title = "Auto Aimbot Gun", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().AimbotGun = Value
end)        
spawn(function()
    while task.wait(0.1) do
        if getgenv().AimbotGun and SelectWeaponGun then
            local player = game:GetService("Players").LocalPlayer
            local character = player and player.Character
            local weapon = character and character:FindFirstChild(SelectWeaponGun)
            local targetPlayer = game:GetService("Players"):FindFirstChild(getgenv().SelectPlayer)
            local targetCharacter = targetPlayer and targetPlayer.Character
            local targetHumanoidRootPart = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
            if weapon and targetHumanoidRootPart then
                pcall(function()
                    weapon.Cooldown.Value = 0
                    local args = {
                        [1] = targetHumanoidRootPart.Position,
                        [2] = targetHumanoidRootPart
                    }
                    weapon.RemoteFunctionShoot:InvokeServer(unpack(args))
                    local virtualUser = game:GetService("VirtualUser")
                    virtualUser:Button1Down(Vector2.new(1280, 672))
                end)
            end
        end
    end
end)
Toggle = Lc:AddToggle("Toggle", {Title = "Safe Modes", Default = false })
Toggle:OnChanged(function(Value)
    getgenv().SafeMode = Value
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if getgenv().SafeMode then
                local CharacterPlayer = game.Players.LocalPlayer.Character
                if CharacterPlayer and CharacterPlayer:FindFirstChild("Humanoid") and CharacterPlayer:FindFirstChild("HumanoidRootPart") then
                    local HealthMinPlayer = CharacterPlayer.Humanoid.MaxHealth * (getgenv().Safe / 100)
                    if CharacterPlayer.Humanoid.Health <= HealthMinPlayer then
                        while getgenv().SafeMode and CharacterPlayer.Humanoid.Health <= HealthMinPlayer do
                            task.wait(0.1)
                            CharacterPlayer.HumanoidRootPart.CFrame = CharacterPlayer.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
                        end
                    end
                end
            end
        end)
    end
end)
Slider = Lc:AddSlider("Slider", {
    Title = "Safe Mode At",
    Default = 30,
    Min = 0,
    Max = 100,
    Rounding = 5,
    Callback = function(Value)
        getgenv().Safe = Value
    end
})
Toggle = Lc:AddToggle("Toggle", { Title = "Walk On Water", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().WalkWater = Value    
    local waterPlane = game:GetService("Workspace").Map["WaterBase-Plane"]
    if getgenv().WalkWater then
        waterPlane.Size = Vector3.new(1000, 112, 1000)
    else
        waterPlane.Size = Vector3.new(1000, 80, 1000)
    end
				end)				
Slider = Lc:AddSlider("Slider", {
        Title = "Player Speed",
        Description = "",
        Default = 2,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier",Value)
        end
    })
----------------------------------------------------------------------------------------------------
--//Image Button\\--
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local existingGui = playerGui:FindFirstChild("CustomScreenGui")
if existingGui then
    existingGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomScreenGui"
ScreenGui.Parent = playerGui

local Button = Instance.new("ImageButton")
Button.Name = "CustomButton"
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 55, 0, 50)
Button.Draggable = false
Button.Position = UDim2.new(0.181441245, 0, 0.476932675, 0)
Button.BackgroundTransparency = 1
Button.Image = "rbxassetid://109092504321879"

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.4, 0)
UICorner.Parent = Button

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Button
UIStroke.Thickness = 2 
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 0

local imageLoaded = false
ContentProvider:PreloadAsync({Button.Image}, function()
    imageLoaded = true
end)

Button.MouseButton1Click:Connect(function()
    if not imageLoaded then
        return
    end
    local VirtualInputManager = game:GetService("VirtualInputManager")
    if VirtualInputManager then
        task.defer(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
        end)
    end
				end)
----------------------------------------------------------------------------------------------------
--//Webhooks\\--
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local executor = identifyexecutor and identifyexecutor() or "Unknown"
local placeId = game.PlaceId
local jobId = game.JobId

local WebhookURL = "Url"

function GetFullMoonStatus()
    local moonTextures = {
        ["http://www.roblox.com/asset/?id=9709149431"] = "🌕 Full Moon (100%)",
        ["http://www.roblox.com/asset/?id=9709149052"] = "🌔 75%",
        ["http://www.roblox.com/asset/?id=9709143733"] = "🌓 50%",
        ["http://www.roblox.com/asset/?id=9709150401"] = "🌒 25%",
        ["http://www.roblox.com/asset/?id=9709149680"] = "🌑 15%"
    }
    local moonId = Lighting:FindFirstChild("Sky") and Lighting.Sky.MoonTextureId or "Unknown"
    return moonTextures[moonId] or "🌑 0%"
end

function GetMirageIslandStatus()
    return game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and "🟢 Mirage Island Spawned 🌴" or "🔴 Mirage Island Not Spawned"
end

local function SendWebhook()
    if not WebhookURL or WebhookURL == "" then
        warn("Lol")
        return
    end

    local UserInfo = string.format(
        "**Name:** %s\n**Beli:** %s\n**Fragments:** %s\n**Race:** %s\n**Bounty/Honor:** %s",
        Player.Name,
        Player.Data:FindFirstChild("Beli").Value,
        Player.Data:FindFirstChild("Fragments").Value,
        Player.Data:FindFirstChild("Race").Value,
        Player.leaderstats["Bounty/Honor"].Value
    )

    local FruitInfo = string.format("**Fruit:** %s", Player.Data:FindFirstChild("DevilFruit").Value)

    local SystemInfo = string.format(
        "**Executor:** %s\n**HWID:** %s\n**Place ID:** %s\n**Job ID:** %s",
        executor,
        hwid,
        placeId,
        jobId
    )

    local FullMoon = GetFullMoonStatus()
    local MirageIsland = GetMirageIslandStatus()

    local Message = {
        username = "Vexus Webhook Log",
        avatar_url = "https://cdn.discordapp.com/avatars/953286441935458334/c92613b3beb9db7b4f5a8a21e9f39b13.png?width=473&height=473",
        embeds = {{
            title = ":sushi: **Player Status**",
            color = tonumber(0xffffff),
            fields = {
                {name = "User Info", value = UserInfo, inline = true},
                {name = "Fruit Info", value = FruitInfo, inline = true},
                {name = "System Info", value = SystemInfo, inline = false},
                {name = "Full Moon:", value = "`" .. FullMoon .. "`", inline = true},
                {name = "Mirage Island:", value = "`" .. MirageIsland .. "`", inline = true}
            }
        }}
    }

    local Response = http_request({
        Url = WebhookURL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(Message)
    })

    print("Webhook Sent!", Response)
end

SendWebhook()
----------------------------------------------------------------------------------------------------
local targetPlayers = {
    ["red_game43"] = true,
    ["rip_indra"] = true,
    ["Axiore"] = true,
    ["Polkster"] = true,
    ["wenlocktoad"] = true,
    ["Daigrock"] = true,
    ["toilamvidamme"] = true,
    ["oofficialnoobie"] = true,
    ["Uzoth"] = true,
    ["Azarth"] = true,
    ["arlthmetic"] = true,
    ["Death_King"] = true,
    ["Lunoven"] = true,
    ["TheGreateAced"] = true,
    ["rip_fud"] = true,
    ["drip_mama"] = true,
    ["layandikit12"] = true,
    ["Hingoi"] = true
}
spawn(function()
    while true do
        wait(1)
        for _, v in pairs(game.Players:GetPlayers()) do
            if targetPlayers[v.Name] then
                Hop()
                break
            end
        end
    end
				end)