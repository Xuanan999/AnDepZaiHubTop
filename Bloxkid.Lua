local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ConCac", HidePremium = false, SaveConfig = true, ConfigFolder = "AnDepZai Loader", IntroText = "AnDepZai"})

local Tab = Window:MakeTab({
	Name = "Main Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

------------//Tạo Tab
local Section = Tab:AddSection({
	Name = "Select Mode Farm"
})

Tab:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
	_G.Extra_Fast_Attack = Value
	end    
})
spawn(function()
        while task.wait() do
            if _G.Extra_Fast_Attack then
                pcall(function()
                    wait(0.2)
                    local AC = CbFw2.activeController
                    for i = 1,1 do 
                        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                            plr.Character,
                            {plr.Character.HumanoidRootPart},
                            60
                        )
                        local cac = {}
                        local hash = {}
                        for k, v in pairs(bladehit) do
                            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                                table.insert(cac, v.Parent.HumanoidRootPart)
                                hash[v.Parent] = true
                            end
                        end
                        bladehit = cac
                        if #bladehit > 0 then
                            local u8 = debug.getupvalue(AC.attack, 5)
                            local u9 = debug.getupvalue(AC.attack, 6)
                            local u7 = debug.getupvalue(AC.attack, 4)
                            local u10 = debug.getupvalue(AC.attack, 7)
                            local u12 = (u8 * 798405 + u7 * 727595) % u9
                            local u13 = u7 * 798405
                            (function()
                                u12 = (u12 * u9 + u13) % 1099511627776
                                u8 = math.floor(u12 / u9)
                                u7 = u12 - u8 * u9
                            end)()
                            u10 = u10 + 1
                            debug.setupvalue(AC.attack, 5, u8)
                            debug.setupvalue(AC.attack, 6, u9)
                            debug.setupvalue(AC.attack, 4, u7)
                            debug.setupvalue(AC.attack, 7, u10)
                            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
                            end
                        end
                    end
                end)
            end
        end
    end)

-----//Bring Mob Toggle
Tab:AddToggle({
	Name = "Bring Mob",
	Default = true,
	Callback = function(Value)
	BringMob = Value
	end    
})
----//Bring Mob
task.spawn(function()
	while true do task.wait()
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if BringMob then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 300 then
                        if InMyNetWork(v.HumanoidRootPart) then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                        end
                    end
                end
            end
        end)
    end
end)	


task.spawn(function()
    while task.wait() do
        pcall(function()
            if BringMob then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 300 then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                    end
                end
            end
        end)
    end
end)
function InMyNetWork(object)
    if isnetworkowner then
        return isnetworkowner(object)
    else
        if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then 
            return true
        end
        return false
    end
end


