
-------//Soucre Ui
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "AnDepZai Hub (Blox-Fruit)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
-----//Tab Main Farm Menu
local Section = Tab:AddSection({
	Name = "Select Mode"
})

Tab:AddDropdown({
	Name = "Select Delay Fast",
	Default = "Normal",
	Options = {"Slow", "Normal", "Pro"},
	Callback = function(value)
	_G.FastAttackDelay = value
	end    
})

Tab:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(value)
    _G.FastAttack = value
    end
})

Tab:AddToggle({
    Name = "Bring Mob"
    Default = true,
    Callback = function(value)
    _G.BringNormal = value
    end
})

Tab:AddToggle({
	Name = "Auto Click (85% Kick)",
	Default = false,
	Callback = function(value)
    _G.click = value
    end
})
local Section = Tab:AddSection({
	Name = "Farm Level"
})
Tab:AddDropdown({
	Name = "Select Weapon",
	Default = "Melee",
	Options = {"Melee","Sword","Fruit"},
	Callback = function(value)
	_G.Select_Weapon = value
	end    
})


-----//HitBox
function Attack1Function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		for indexincrement = 1, 1 do
			local bladehit = getAllBladeHits(1)
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
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit,  indexincrement, "") 
				end
			end
		end
	end
end

-----//Soucre Fast Attack Delay
spawn(function()
	    while wait(.1) do
	        if _G.FastAttackDelay then
	            pcall(function()
	                if _G.FastAttackDelay == "Slow" then
	                    _G.FastAttackDelay = 0.2
	                elseif _G.FastAttackDelay == "Default" then
	                    _G.FastAttackDelay = 0.5
	                elseif _G.FastAttackDelay == "Normal" then
	                    _G.FastAttackDelay = 0.2
	                elseif _G.FastAttackDelay == "Pro" then
	                    _G.FastAttackDelay = 0
	                end
	            end)
	        end
	    end
	end)
	
	
	
	spawn(function()
	while true do
	if _G.FastAttack then
	pcall(function()
	CameraShakerR:Stop()
	CombatFramework.activeController.attacking = false
	CombatFramework.activeController.timeToNextAttack = 0
	CombatFramework.activeController.increment = 3
	CombatFramework.activeController.hitboxMagnitude = 100
	CombatFramework.activeController.blocking = false
	CombatFramework.activeController.timeToNextBlock = 0
	CombatFramework.activeController.focusStart = 0
	CombatFramework.activeController.humanoid.AutoRotate = true
	end)
	end
	task.wait()
	end
	end)
	
----//module
function GetBladeHit()
	    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
	    local CmrFwLib = CombatFrameworkLib[2]
	    local p13 = CmrFwLib.activeController
	    local weapon = p13.blades[1]
	    if not weapon then 
	        return weapon
	    end
	    while weapon.Parent ~= game.Players.LocalPlayer.Character do
	        weapon = weapon.Parent 
	    end
	    return weapon
	end
	function AttackHit()
	    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
	    local CmrFwLib = CombatFrameworkLib[2]
	    local plr = game.Players.LocalPlayer
	    for i = 1, 1 do
	        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
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
	            pcall(function()
	                CmrFwLib.activeController.timeToNextAttack = 1
	                CmrFwLib.activeController.attacking = false
	                CmrFwLib.activeController.blocking = false
	                CmrFwLib.activeController.timeToNextBlock = 0
	                CmrFwLib.activeController.increment = 3
	                CmrFwLib.activeController.hitboxMagnitude = 100
	                CmrFwLib.activeController.focusStart = 0
	                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBladeHit()))
	                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
	            end)
	        end
	    end
	end
	spawn(function()
	    while wait(.1) do
	        if _G.FastAttack then
	            pcall(function()
	                repeat task.wait(_G.FastAttackDelay)
	                    AttackHit()
	                until not _G.FastAttack
	            end)
	        end
	    end
	end)
----//Bring Mob
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function() CheckQuest()
		pcall(function()
			if _G.BringNormal then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.Auto_Farm_Level and StartMagnet and v.Name == Ms and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 250 then
						v.HumanoidRootPart.CFrame = PosMon
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(60,60,60)
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
					end
				end
			end
		end)
    end)
	end)


---//Soucre Auto Click
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.click then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)
-----//Select Weapon Soucre
task.spawn(function()
	while wait() do
		pcall(function()
			if _G.Select_Weapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Select_Weapon = v.Name
						end
					end
				end
			elseif _G.Select_Weapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Select_Weapon = v.Name
						end
					end
				end
			elseif _G.Select_Weapon == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Select_Weapon = v.Name
						end
					end
				end
			elseif _G.Select_Weapon == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Select_Weapon = v.Name
						end
					end
				end
			end
		end)
	end
    end)
