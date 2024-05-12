---//hitBox
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
	Name = "Select Delay Fast",
	Default = "Normal",
	Options = {"Slow", "Normal", "Pro"},
	Callback = function(Value)
    _G.FastAttackDelay = Value
	end    
})
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
	
Tab:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
	_G.FastAttack = Value
	end    
})
-----//Bring Mob Toggle
Tab:AddToggle({
	Name = "Bring Mob",
	Default = true,
	Callback = function(Value)
   _G.BringMob = Value
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
            if _G.BringMob then
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
            if _G.BringMob then
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

Tab:AddToggle({
	Name = "Auto Click (85% Kick)",
	Default = true,
	Callback = function(Value)
	_G.click = Value
	end    
})
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

Tab:AddDropdown({
	Name = "Select Item Farm",
	Default = "Melee",
	Options = {"Melee","Sword","Fruit"},
	Callback = function(Value)
    _G.Select_Weapon = Value
	end    
})
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
   
Tab:AddDropdown({
	Name = "Select Mode Farm",
	Default = "Farm Theo Lever",
	Options = { "Farm Theo Lever","Farm speed","Farm Không Nhiệm Vụ","Farm Gần nhất"},
	_G.Select_Mode_Farm
	end    
})
spawn(function()
    while wait() do
        if _G.Auto_Farm_Level then
			if _G.Select_Mode_Farm == "Farm Theo Lever" then
				pcall(function()
					if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
						StartMagnet = false
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
					end
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						StartMagnet = false
						CheckQuest()
						repeat wait() topos(CFrameQuest) until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Farm_Level
						if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
							wait(1.2)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
							wait(0.5)
						end
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						CheckQuest()
						if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									if v.Name == Ms then
										repeat wait()
											if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
												EquipWeapon(_G.Select_Weapon)
												AutoHaki()
												PosMon = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid.WalkSpeed = 0
												v.Head.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50,50,50)
												StartMagnet = true
												topos(v.HumanoidRootPart.CFrame * MethodFarm)
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											else
												StartMagnet = false
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
											end
										until not _G.Auto_Farm_Level or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
									end
								end
							end
						else
							StartMagnet = false
							if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame * CFrame.new(0,20,0))
							else	
								topos(CFrameMon)
							end
						end
					end
				end)
			elseif _G.Select_Mode_Farm == "Farm speed" then
				pcall(function()
					if game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == SPAWNPOINT then
						if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
							StartMagnet = false
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							StartMagnet = false
							CheckQuest()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							CheckQuest()
							if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										if v.Name == Ms then
											repeat wait()
												if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
													EquipWeapon(_G.Select_Weapon)
													AutoHaki()
													PosMon = v.HumanoidRootPart.CFrame
													v.HumanoidRootPart.CanCollide = false
													v.Humanoid.WalkSpeed = 0
													v.Head.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(50,50,50)
													StartMagnet = true
													topos(v.HumanoidRootPart.CFrame * MethodFarm)
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												else
													StartMagnet = false
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
												end
											until not _G.Auto_Farm_Level or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
								end
							else
								StartMagnet = false
								if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
									topos(game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame * CFrame.new(0,20,0))
								else	
									topos(CFrameMon)
								end
							end
						end
					else
						repeat task.wait()
							game.Players.LocalPlayer.Character.Head:Destroy()
							wait(0.5)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
						until game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == SPAWNPOINT 
					end
                end)
            elseif _G.Select_Mode_Farm == "Farm Không Nhiệm Vụ" then
				pcall(function()
                	CheckQuest()
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								if v.Name == Ms then
									if v.Humanoid.Health > 0 then
										repeat wait()
											EquipWeapon(_G.Select_Weapon)
											AutoHaki()
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid.WalkSpeed = 0
											v.Head.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50,50,50)
											StartMagnet = true
											topos(v.HumanoidRootPart.CFrame * MethodFarm)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										until not _G.Auto_Farm_Level or v.Humanoid.Health <= 0 or not v.Parent
									end
								end
							end
						end
					else
						StartMagnet = false
						if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame * CFrame.new(0,20,0))
						else	
							topos(CFrameMon)
						end
					end
				end)
elseif _G.Select_Mode_Farm == "Farm Gần nhất" then
  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
  if v.Name and v:FindFirstChild("Humanoid") then
  if v.Humanoid.Health > 0 then
  repeat game:GetService("RunService").Heartbeat:wait()
  EquipWeapon(_G.Select_Weapon)
  if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
  local args = {
   [1] = "Buso"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end
  PosMon = v.HumanoidRootPart.CFrame
 v.HumanoidRootPart.CanCollide = false
 v.Humanoid.WalkSpeed = 0
 v.Head.CanCollide = false
 v.HumanoidRootPart.Size = Vector3.new(60,60,60)
 StartMagnet = false
 topos(v.HumanoidRootPart.CFrame * MethodFarm)
 game:GetService'VirtualUser':CaptureController()
 game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
  StartMagnet = true
  PosMon = v.HumanoidRootPart.CFrame
  until not _G.Auto_Farm_Level or not v.Parent or v.Humanoid.Health == 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
  end
		end
    end
end
end
end
end)

   
Tab:AddToggle({
	Name = "Farm Level",
	Default = false,
	Callback = function(Value)
	_G.Auto_Farm_Level = Value
    _G.click = Value
    StopTween(_G.Auto_Farm_Level)
	end    
})
function EquipWeaponSword()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

function EquipWeaponMelee()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Melee" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end
-----//Soucre 
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function() CheckQuest()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Level and MasteryBFStartMagnetActive and v.Name == Ms and (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonMasteryFruit
					v.HumanoidRootPart.CanCollide = false
					v.HumanoidRootPart.Size = Vector3.new(50,50,50)
					if v.Humanoid:FindFirstChild("Animator") then
						v.Humanoid.Animator:Destroy()
					end
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
				end
			end
		end)
    end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function() CheckQuest()
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.Auto_Farm_Level and MasteryGunStartMagnetActive and v.Name == Ms and (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).magnitude <= 350 then
					v.HumanoidRootPart.CFrame = PosMonMasteryGun
					v.HumanoidRootPart.CanCollide = false
					v.HumanoidRootPart.Size = Vector3.new(50,50,50)
					if v.Humanoid:FindFirstChild("Animator") then
						v.Humanoid.Animator:Destroy()
					end
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
				end
			end
		end)
    end)
end)
