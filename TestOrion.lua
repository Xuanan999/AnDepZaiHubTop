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

-----//Soucre Fast Attack
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

task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Setting_table.FastModeD == "Normal" then
				Faa:Set("ATTACK | 1 Wait | 1")
			elseif _G.Setting_table.FastModeD == "Fast" then
				Faa:Set("ATTACK | 2.5 Wait | 1")
			elseif _G.Setting_table.FastModeD == "Extra" then
				Faa:Set("ATTACK | INF Wait | 0")
			end
		end)
	end
end)

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

