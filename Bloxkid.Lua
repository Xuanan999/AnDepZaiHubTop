local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "AnDepZai Hub | Blox-Fruit"
    SubTitle = "By An",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 400),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main"}),
}

local Options = Fluent.Options

do
------------//Tạo Tab
local listfastattack = {"Fast", "Normal", "Slow"}

    local DropdownDelayAttack = Tabs.Main:AddDropdown("DropdownDelayAttack", {
        Title = "Select Fast Attack",
        Description = "Select Fast Attack Farm",
        Values = listfastattack,
        Multi = false,
        Default = 1,
    })
    DropdownDelayAttack:SetValue("Normal")
    DropdownDelayAttack:OnChanged(function(value)
    _G.FastType = value
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


local ToggleFastAttack = Tabs.Main:AddToggle("ToggleFastAttack", {Title = "Fast Attack",Description = "Open or False", Default = true })
ToggleMirage:OnChanged(function(Value)
 _G.FastAttack = Value
end) 

 Options.ToggleFastAttack:SetValue(false)


