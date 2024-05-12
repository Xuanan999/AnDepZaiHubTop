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

Tab:AddDropdown({
	Name = "Select Fast Attack",
	Default = "Normal",
	Options = {"Fast", "Normal", "Slow"},
	Callback = function(Value)
	_G.FastType = Value
	end    
})
    coroutine.wrap(function()
while task.wait(0) do
local ac = CombatFrameworkR.activeController
if ac and ac.equipped then
    task.wait(0.04)
    if FastAttack or _G.FastAttack then
        yakmefan()
        if _G.FastType == "Normal" then
            if tick() - cooldownfastattack > .9 then wait(.1) cooldownfastattack = tick() end
        elseif _G.FastType == "Fast" then
            if tick() - cooldownfastattack > 1.5 then wait(.01) cooldownfastattack = tick() end
        elseif _G.FastType == "Slow" then
            if tick() - cooldownfastattack > .3 then wait(.7) cooldownfastattack = tick() end
        end
        setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    end
end
end
end)()
_G.FastType = "Fast" 
local Time = 0.04
task.spawn(function()
    while _G.FastAttack do task.wait()
    require(game.ReplicatedStorage.Util.CameraShaker):Stop()
    Bruh = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
    Ryu = debug.getupvalues(Bruh)[2]
    task.spawn(function()
        while true do task.wait()
            if _G.FastAttack then
                if typeof(Ryu) == "table" then
                    pcall(function()
                        --Ryu.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                        Ryu.activeController.timeToNextAttack = 0
                        Ryu.activeController.active = false
                        Ryu.activeController.timeToNextBlock = 0
                        Ryu.activeController.focusStart = 0
                        Ryu.activeController.increment = 4
                        Ryu.activeController.blocking = false
                        Ryu.activeController.attacking = false
                        Ryu.activeController.humanoid.AutoRotate = false
                        end)
                    end
                end
            end
        end)
    end
end)

Tab:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
	_G.FastAttack = Value
	end    
})
function CurrentWeapon()
local ac = CombatFrameworkR.activeController
local ret = ac.blades[1]
if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
pcall(function()
while ret.Parent ~= game.Players.LocalPlayer.Character do ret = ret.Parent end
end)
if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
return ret
end

function getAllBladeHits(Sizes)
    local Hits = {}
    local Client = game.Players.LocalPlayer
    local Characters = workspace.Characters:GetChildren()
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for i = 1, #Enemies do
    local v = Enemies[i]
    local Human = v:FindFirstChildOfClass("Humanoid")
    if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) <= Sizes + 5 then
        table.insert(Hits, Human.RootPart)
    end
    end
    for i = 1,#Characters do local v = Characters[i]
        if v ~= game.Players.LocalPlayer.Character then
            local Human = v:FindFirstChildOfClass("Humanoid")
            if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) <= Sizes + 5 then
                table.insert(Hits,Human.RootPart)
            end
        end
    end
    return Hits
end
function yakmefan()
local ac = CombatFrameworkR.activeController
if ac and ac.equipped then
 for Ryuen = 1, 1 do
    local bladehit = getAllBladeHits(60)
    if #bladehit > 0 then
        local AcAttack8 = debug.getupvalue(ac.attack, 5)
        local AcAttack9 = debug.getupvalue(ac.attack, 6)
        local AcAttack7 = debug.getupvalue(ac.attack, 4)
        local AcAttack10 = debug.getupvalue(ac.attack, 7)
        local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
        local NumberAc13 = AcAttack7 * 798405
        (function() 
            NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
            AcAttack8 = math.floor(NumberAc12 / AcAttack9)
            AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
        end)()
        AcAttack10 = AcAttack10 + 1
        debug.setupvalue(ac.attack, 5, AcAttack8)
        debug.setupvalue(ac.attack, 6, AcAttack9)
        debug.setupvalue(ac.attack, 4, AcAttack7)
        debug.setupvalue(ac.attack, 7, AcAttack10)
        for k, v in pairs(ac.animator.anims.basic) do
            v:Play(0.01,0.01,0.01)
        end  
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
            game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "") 
        end
    end
end
end
end

function AttackPlayers()
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        for i = 1, 1 do
            local bladehit = getAllBladeHitsPlayers(60)
            if #bladehit > 0 then
                local AcAttack8 = debug.getupvalue(ac.attack, 5)
                local AcAttack9 = debug.getupvalue(ac.attack, 6)
                local AcAttack7 = debug.getupvalue(ac.attack, 4)
                local AcAttack10 = debug.getupvalue(ac.attack, 7)
                local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                local NumberAc13 = AcAttack7 * 798405
                (function()
                    NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                    AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                    AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                end)()
                AcAttack10 = AcAttack10 + 1
                debug.setupvalue(ac.attack, 5, AcAttack8)
                debug.setupvalue(ac.attack, 6, AcAttack9)
                debug.setupvalue(ac.attack, 4, AcAttack7)
                debug.setupvalue(ac.attack, 7, AcAttack10)
                for k, v in pairs(ac.animator.anims.basic) do
                    v:Play(0.01,0.01,0.01)
                end                 
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "") 
                end
            end
        end
    end
end

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


