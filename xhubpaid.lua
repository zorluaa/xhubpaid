local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Splix"))()

local window = library:new({textsize = 13.5,font = Enum.Font.RobotoMono,name = "xhub beta build",color = Color3.fromRGB(225,58,81)})

local tab = window:page({name = "Main"})
local tab1 = window:page({name = "Anti Aim"})
local tab2 = window:page({name = "Misc"})
local tab3 = window:page({name = "God mode"})

local section = tab:section({name = "Aiming",side = "left",size = 250})
local section1 = tab1:section({name = "Anti Aims",side = "left",size = 250})
local section2 = tab2:section({name = "Misc",side = "left",size = 250})
local section3 = tab3:section({name = "God Modes",side = "left",size = 250})

section1:toggle({name = "UnderGround AA",def = false,callback = function(value)
 local Toggled = false
local KeyCode = 'z'


function AA()
    local oldVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, -70, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, oldVelocity.Y, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, -70, oldVelocity.Z)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = 2.14
end

game:GetService('UserInputService').InputBegan:Connect(function(Key)
    if Key.KeyCode == Enum.KeyCode[KeyCode:upper()] and not game:GetService('UserInputService'):GetFocusedTextBox() then
        if Toggled then
            Toggled = false
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = 10

        elseif not Toggled then
            Toggled = true

            while Toggled do
                AA()
                task.wait()
            end
        end
    end
end)
  tog = value
  print(tog)
end})


section1:button({name = "Tp Anti Aim",callback = function()
    local Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
--
getgenv().Yes = nil
while getgenv().Yes == true  do
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(Position) + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))) * CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)))
end
   print('hot ui lib')
end})





--- silent aims
section:button({name = "Silent Aim",callback = function()
    -- Mattys

--- configuration


getgenv().Mattyy = true
getgenv().Matty = true

--- variables

local CC = game:GetService'Workspace'.CurrentCamera
local Plr
local enabled = false
local accomidationfactor = 0.131 -- 0.13123 --0.1572
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(3, 0, 1, 0)
    a.BackgroundTransparency = 0.4
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(30, 30)
    return(e)
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild("LowerTorso"), Color3.fromRGB(0, 76, 153), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("LowerTorso") end)
    
	local TextLabel = Instance.new("TextLabel", handler)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 14
	TextLabel.TextColor3 = Color3.new(3, 5, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name
	TextLabel.ZIndex = 10
	
	spawn(function()
        while wait() do
            if player.Character then
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
            end
        end
	end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    guimain[player.Name]:Destroy()
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(0.9, 0.9, 0.9)
    placemarker.Transparency = 10
    makemarker(placemarker, placemarker, Color3.fromRGB(51, 4, 34), 0.22, 0)
end)    

mouse.KeyDown:Connect(function(k)
    if k ~= "q" then return end
    if enabled then
        enabled = false
       -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        enabled = true 
        Plr = getClosestPlayerToCursor()
        --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end    
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer
end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild("UpperTorso") then
			placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character.UpperTorso.Position+(Plr.Character.UpperTorso.Velocity*accomidationfactor)
			return old(unpack(args))
		end
		return old(...)
	end)
	if getgenv.Mattyy == true then
	if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        game:GetService"RunService".Stepped:connect(function()
            if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
                placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
            else
                placemarker.CFrame = CFrame.new(0, 9999, 0)
            end
        end)
        
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
                return old(unpack(args))
            end
            return old(...)
        end)
    else
        game:GetService"RunService".Stepped:connect(function()
            if enabled and Plr.Character and Plr.Character:FindFirstChild("UpperTorso") then
                placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
            else
                placemarker.CFrame = CFrame.new(0, 9999, 0)
            end
        end)
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character.UpperTorso.Position+(Plr.Character.UpperTorso.Velocity*accomidationfactor)
                return old(unpack(args))
            end
            return old(...)
        end)
        if getgenv.Matty == true then
            if Plr.Character.Humanoid.Fall == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                game:GetService"RunService".Stepped:connect(function()
                    if enabled and Plr.Character and Plr.Character:FindFirstChild("UpperTorso") then
                        placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
                    else
                        placemarker.CFrame = CFrame.new(0, 9999, 0)
                    end
                end)
                local mt = getrawmetatable(game)
                local old = mt.__namecall
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(...)
                    local args = {...}
                    if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                        args[3] = Plr.Character.UpperTorso.Position+(Plr.Character.UpperTorso.Velocity*accomidationfactor)
                        return old(unpack(args))
                    end
                    return old(...)
                end)
            else
                game:GetService"RunService".Stepped:connect(function()
                    if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
                        placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
                    else
                        placemarker.CFrame = CFrame.new(0, 9999, 0)
                    end
                end)
                local mt = getrawmetatable(game)
                local old = mt.__namecall
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(...)
                    local args = {...}
                    if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                        args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
                        return old(unpack(args))
                    end
                    return old(...)
                end)
            end
        end
	end
end
   print('hot ui lib')
end})




----------------------------------------------------------------------------------
section2:button({name = "Fly (X)",callback = function()
    _G.Speed = 150
_G.Key = Enum.KeyCode.X

local UIS = game:GetService("UserInputService")
local OnRender = game:GetService("RunService").RenderStepped

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local Camera = workspace.CurrentCamera
local Root = Character:WaitForChild("HumanoidRootPart")

local C1, C2, C3;
local UntitledHood = {Flying = false, Forward = false, Backward = false, Left = false, Right = false}
C1 = UIS.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Keyboard then
        if Input.KeyCode == _G.Key then
            UntitledHood.Flying = not UntitledHood.Flying
            Root.Anchored = UntitledHood.Flying
        elseif Input.KeyCode == Enum.KeyCode.W then
            UntitledHood.Forward = true
        elseif Input.KeyCode == Enum.KeyCode.S then
            UntitledHood.Backward = true
        elseif Input.KeyCode == Enum.KeyCode.A then
            UntitledHood.Left = true
        elseif Input.KeyCode == Enum.KeyCode.D then
            UntitledHood.Right = true
        end
    end
end)

C2 = UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Keyboard then
        if Input.KeyCode == Enum.KeyCode.W then
            UntitledHood.Forward = false
        elseif Input.KeyCode == Enum.KeyCode.S then
            UntitledHood.Backward = false
        elseif Input.KeyCode == Enum.KeyCode.A then
            UntitledHood.Left = false
        elseif Input.KeyCode == Enum.KeyCode.D then
            UntitledHood.Right = false
        end
    end
end)

C3 = Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
    if UntitledHood.Flying then
        Root.CFrame = CFrame.new(Root.CFrame.Position, Root.CFrame.Position + Camera.CFrame.LookVector)
    end
end)

while true do 
    local Delta = OnRender:Wait()
    if UntitledHood.Flying then
        if UntitledHood.Forward then
            Root.CFrame = Root.CFrame + (Camera.CFrame.LookVector * (Delta * _G.Speed))
        end
        if UntitledHood.Backward then
            Root.CFrame = Root.CFrame + (-Camera.CFrame.LookVector * (Delta * _G.Speed))
        end
        if UntitledHood.Left then
            Root.CFrame = Root.CFrame + (-Camera.CFrame.RightVector * (Delta * _G.Speed))
        end
        if UntitledHood.Right then
            Root.CFrame = Root.CFrame + (Camera.CFrame.RightVector * (Delta * _G.Speed))
        end
    end
end
   print('hot ui lib')
end})





----------------



section3:button({name = "God Melee",callback = function()
    local localPlayer = game:GetService('Players').LocalPlayer;
				local localCharacter = localPlayer.Character;
				localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
				local newCharacter = localPlayer.CharacterAdded:Wait();
				local spoofFolder = Instance.new('Folder');
				spoofFolder.Name = 'FULLY_LOADED_CHAR';
				spoofFolder.Parent = newCharacter;
				newCharacter:WaitForChild('BodyEffects').Dead:Destroy();
				local spoofValue = Instance.new('BoolValue', newCharacter.BodyEffects);
				spoofValue.Name = 'Dead';
				wait()
				--godblock/godbullet
				local ps = game:GetService("Players")
				local lp = ps.LocalPlayer
				local char = lp.Character

				char.BodyEffects.Armor:Destroy()
				char.BodyEffects.Defense:Destroy()

				local Clone1 = Instance.new("IntValue")
				Clone1.Name = "Armor"
				Clone1.Parent = char.BodyEffects

				local Clone2 = Instance.new("NumberValue")
				Clone2.Name = "Defense"
				Clone2.Parent = char.BodyEffects
				wait()
				--walspeed
				local d = {}
				local e = {}
				local g = {}
				local h = {}
				local j = {}
				local k = {}
				local function l()
					local m = 3
					local n = checkcaller
					local o = getrawmetatable(game)
					setreadonly(o, false)
					local p = o.__index
					local q = o.__newindex
					local r = o.__namecall
					o.__index =
						newcclosure(
							function(s, t)
							if n() then
								return p(s, t)
							end
							if d[s] and d[s][t] then
								local u = d[s][t]
								if u["IsCallback"] == true then
									return u["Value"](s)
								else
									return u["Value"]
								end
							end
							if g[t] then
								local v = g[t]
								if v["IsCallback"] == true then
									return v["Value"](s)
								else
									return v["Value"]
								end
							end
							if j[s] and j[s][t] then
								return k[s][t]
							end
							return p(s, t)
						end
						)
					o.__newindex =
						newcclosure(
							function(w, x, y)
							if n() then
								return q(w, x, y)
							end
							if e[w] and e[w][x] then
								local z = e[w][x]
								if z["Callback"] == nil then
									return
								else
									z["Callback"](w, y)
									return
								end
							end
							if h[x] then
								local A = h[x]
								if A["Callback"] == nil then
									return
								else
									A["Callback"](w, y)
									return
								end
							end
							if j[w] and j[w][x] then
								local B = j[w][x]
								if type(y) ~= B["Type"] then
									error("bad argument #3 to '" .. x .. "' (" .. B["Type"] .. " expected, got " .. type(x) .. ")")
								end
								k[w][x] = y
								return
							end
							return q(w, x, y)
						end
						)
					local D = game.Players.LocalPlayer.Character.Humanoid
					local function A(_)
						local a0 = p(D, _)
						local a1 = type(a0)
						if not j[D] then
							j[D] = {}
						end
						if not k[D] then
							k[D] = {}
						end
						j[D][_] = {Type = a1}
						k[D][_] = p(D, _)
						local a2 = function()
							j[D][_] = nil
							k[D][_] = nil
						end
						return {remove = a2, Remove = a2}
					end
					A("WalkSpeed")
					A("JumpPower")
				end
				l()
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
				wait()
				while wait() do
					game.ReplicatedStorage.MainEvent:FireServer("Block", true)
					wait()
					for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
						if (v.Animation.AnimationId:match("rbxassetid://2788354405")) then
							v:Stop();
						end;
					end;
				end
				wait()
				while wait() do
					pcall(function()
						for i, v in pairs(game.Players:GetPlayers()) do
							if (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 1 then
								game.ReplicatedStorage.MainEvent:FireServer("Block", true)
							end
						end
					end)
				end
   print('hot ui lib')
end})





section3:button({name = "God Guns",callback = function()
    local localPlayer = game:GetService('Players').LocalPlayer;
                local localCharacter = localPlayer.Character;
                localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
                local newCharacter = localPlayer.CharacterAdded:Wait();
                local spoofFolder = Instance.new('Folder');
                spoofFolder.Name = 'FULLY_LOADED_CHAR';
                spoofFolder.Parent = newCharacter;
                newCharacter:WaitForChild('RagdollConstraints'):Destroy();
                local spoofValue = Instance.new('BoolValue', newCharacter);
                spoofValue.Name = 'RagdollConstraints';
                local name = game.Players.LocalPlayer.Name
                local lol =    game.Workspace:WaitForChild(name)
                local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
                lol.Parent = game.Workspace.Players
                game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
                game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
   print('hot ui lib')
end})
