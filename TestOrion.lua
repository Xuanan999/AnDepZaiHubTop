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
	Options = {"Normal", "Fast", "Extra"},
	Callback = function(value)
	_G.Setting_table.FastModeD = value
	end    
})

Tab:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(value)
    Fast_Attack = value
    end
})
-----//Soucre Fast Attack Delay
coroutine.wrap(function()
	while task.wait(.1) do
		if DbFast and _G.Setting_table.DbFast then
			local ac = CombatFrameworkR.activeController
			if ac and ac.equipped then
				if FastAttack and _G.Setting_table.FastMode == "Normal" then
					AttackFunction()
					if _G.Setting_table.FastModeD == "Normal" then
						if tick() - cooldownfastattack > 1 then wait(1) cooldownfastattack = tick() end
					elseif _G.Setting_table.FastModeD == "Fast" then
						if tick() - cooldownfastattack > 2.5 then wait(1) cooldownfastattack = tick() end
					elseif _G.Setting_table.FastModeD == "Extra" then
						if tick() - cooldownfastattack > 3.5 then wait() cooldownfastattack = tick() end
					end
				elseif FastAttack and _G.Setting_table.FastMode == "ExTra" then
					AttackNoCD()
					if _G.Setting_table.FastModeD == "Normal" then
						if tick() - cooldownfastattack > 1 then wait(1) cooldownfastattack = tick() end
					elseif _G.Setting_table.FastModeD == "Fast" then
						if tick() - cooldownfastattack > 2.5 then wait(1) cooldownfastattack = tick() end
					elseif _G.Setting_table.FastModeD == "Extra" then
						if tick() - cooldownfastattack > 3.5 then wait() cooldownfastattack = tick() end
					end
				end
			end
		end
	end
end)()

coroutine.wrap(function()
	while task.wait(.1) do
		local ac = CombatFrameworkR.activeController
		if ac and ac.equipped then
			if FastAttack and Fast_Attack and _G.Setting_table.FastMode == "Normal" then
				AttackFunction()
				if _G.Setting_table.FastModeD == "Normal" then
					if tick() - cooldownfastattack > 1 then wait(1) cooldownfastattack = tick() end
				elseif _G.Setting_table.FastModeD == "Fast" then
					if tick() - cooldownfastattack > 2.5 then wait(1) cooldownfastattack = tick() end
				elseif _G.Setting_table.FastModeD == "Extra" then
					if tick() - cooldownfastattack > 3.5 then wait() cooldownfastattack = tick() end
				end
			elseif FastAttack and Fast_Attack and _G.Setting_table.FastMode == "ExTra" then
				AttackNoCD()
				if _G.Setting_table.FastModeD == "Normal" then
					if tick() - cooldownfastattack > 1 then wait(1) cooldownfastattack = tick() end
				elseif _G.Setting_table.FastModeD == "Fast" then
					if tick() - cooldownfastattack > 2.5 then wait(1) cooldownfastattack = tick() end
				elseif _G.Setting_table.FastModeD == "Extra" then
					if tick() - cooldownfastattack > 3.5 then wait() cooldownfastattack = tick() end
				end
			end
		end
	end
end)()
----//End 
----// Soucre Fast Attack
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
	local CombatFrameworkR = getupvalues(CombatFramework)[2]
	local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
	local RigControllerR = getupvalues(RigController)[2]
	local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
	local cooldownfastattack = tick()

	function CurrentWeapon()
		local ac = CombatFrameworkR.activeController
		local ret = ac.blades[1]
		if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
		pcall(function()
			while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
		end)
		if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
		return ret
	end
	
	function getAllBladeHitsPlayers(Sizes)
		local Hits = {}
		local Client = game.Players.LocalPlayer
		local Characters = game:GetService("Workspace").Characters:GetChildren()
		for i=1,#Characters do local v = Characters[i]
			local Human = v:FindFirstChildOfClass("Humanoid")
			if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
				table.insert(Hits,Human.RootPart)
			end
		end
		return Hits
	end
	
	function getAllBladeHits(Sizes)
		local Hits = {}
		local Client = game.Players.LocalPlayer
		local Enemies = game:GetService("Workspace").Enemies:GetChildren()
		for i=1,#Enemies do local v = Enemies[i]
			local Human = v:FindFirstChildOfClass("Humanoid")
			if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
				table.insert(Hits,Human.RootPart)
			end
		end
		return Hits
	end
	
	function AttackFunction()
		local ac = CombatFrameworkR.activeController
		if ac and ac.equipped then
			for indexincrement = 1, 1 do
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
----//end
