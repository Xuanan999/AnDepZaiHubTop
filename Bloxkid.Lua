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
	Default = false,
	Callback = function(Value)
	_G.FastAttack = Value
	end    
})


