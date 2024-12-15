getgenv().ceramp = {
    Target = {
        ["Bind"] = Enum.KeyCode.C,
        ["Prediction1"] = 0.0145, --// camlock prediction
        ["Prediction2"] = 0.137, --// silent aim prediction

        ["Enabled"] = false,
        ["TargetPart"] = "UpperTorso",

        ["ClosetPart"] = true,
        ["Partz"] = {"Head","HumanoidRootPart"},
        ["Shake"] = 0,
        ["Smoothing"] = 0.110,
        ["JumpOffset"] = 0.15

    },
    Checks = {
        ["DisableOnTargetDeath"] = true,
        ["DisableOnPlayerDeath"] = true,
        ["CheckKoStatus"] = true,
        ["AntiGroundShots"] = true,
    },
    Spin = {
        ["Enabled"] = true,
        ["SpinSpeed"] = 4900, --// Spin Speed For 360
        ["Degrees"] = 360, --// Leave At 360 To Do a 360..
        ["Bind"] = Enum.KeyCode.V, --// Bind to Do 360

    },
    Visuals = {
        ['DistanceESP'] = false,
        ['WeaponESP'] = false,
        ['HealthBar'] = false,
        ['NameESP'] = false,


    },
}

-- this is not the source below this is the skibidi 

if (not getgenv().Loaded) then
    local userInputService = game:GetService("UserInputService")


    for , con in next, getconnections(workspace.CurrentCamera.Changed) do
        task.wait()
          con:Disable()
      end
      for , con in next, getconnections(workspace.CurrentCamera:GetPropertyChangedSignal("CFrame")) do
         task.wait()
          con:Disable()
      end

    
    local function CheckAnti(Plr) -- // Anti-aim detection
        if Plr.Character.HumanoidRootPart.Velocity.Y < -70 then
            return true
        elseif Plr and (Plr.Character.HumanoidRootPart.Velocity.X > 450 or Plr.Character.HumanoidRootPart.Velocity.X < -35) then
            return true
        elseif Plr and Plr.Character.HumanoidRootPart.Velocity.Y > 60 then
            return true
        elseif Plr and (Plr.Character.HumanoidRootPart.Velocity.Z > 35 or Plr.Character.HumanoidRootPart.Velocity.Z < -35) then
            return true
        else
            return false
        end
    end
    
    local MouseMethod = {
        Version = "V2",
        MethodType = "UpdateMousePosI", 
        AllowedPlaceIDs = {
            2788229376, -- Da Hood
            7213786345, -- Da Hood VC
            9825515356, -- Hood Customs
            5602055394, -- Hood Modded
            7951883376, -- Hood Modded VC
            12927359803, -- Dah Aim Trainer
            12867571492, -- KatanaHood
            11867820563, -- Dae Hood
            17344804827, -- yeno hood
            17897702920 -- og hood
        }
    }
    
    --// Method Check \\--
    if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then -- // Da Hood
        MouseMethod.MethodType = "UpdateMousePosI"
            MainRemote = game:GetService("ReplicatedStorage").MainEvent
    elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then -- // Hood Modded
        MouseMethod.MethodType = "MousePos"
            MainRemote = game:GetService("ReplicatedStorage").Bullets 
    elseif game.PlaceId == 12867571492 then -- // Katana Hood
        MouseMethod.MethodType = "UpdateMousePos"
            MainRemote = game:GetService("ReplicatedStorage").MainEvent
    elseif game.PlaceId == 11867820563 then -- // Dae Hood
        MouseMethod.MethodType = "UpdateMousePos"
            MainRemote = game:GetService("ReplicatedStorage").MainEvent
    elseif game.PlaceId == 17344804827 then -- // yeno Hood
        MouseMethod.MethodType = "UpdateMousePos"
            MainRemote = game:GetService("ReplicatedStorage").MainEvent
    elseif game.PlaceId == 17897702920 then  -- // og hood
        MouseMethod.MethodType = "UpdateMousePos" -- // og hood
            MainRemote = game:GetService("ReplicatedStorage").MainEvent
            
    end

    print("MethodType:", MouseMethod.MethodType)
    
    function MainEventLocate()
        for _,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if v.Name == "MainEvent" then
                return v
            end
        end
    end
    
    local Locking = false
    local Players = game:GetService("Players")
    local Client = Players.LocalPlayer
    local Plr = nil -- Initialize Plr here
    
    -- 360 on bind
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local Toggle = false -- Initialize Toggle to false
    
    local function OnKeyPress(Input, GameProcessedEvent)
        if Input.KeyCode == getgenv().ceramp.Target.Bind and not GameProcessedEvent then 
            Toggle = not Toggle
        elseif Input.KeyCode == getgenv().ceramp.Macro.SpeedGlitchKey then
            if getgenv().ceramp.Macro.Enabled then 
                getgenv().ceramp.Macro.SpeedGlitch = not getgenv().ceramp.Macro.SpeedGlitch
                if getgenv().ceramp.Macro.SpeedGlitch then
                    repeat
                        game:GetService("RunService").Heartbeat:Wait()
                        keypress(0x49)
                        game:GetService("RunService").Heartbeat:Wait()
                        keypress(0x4F)
                        game:GetService("RunService").Heartbeat:Wait()
                        keyrelease(0x49)
                        game:GetService("RunService").Heartbeat:Wait()
                        keyrelease(0x4F)
                        game:GetService("RunService").Heartbeat:Wait()
                    until not getgenv().ceramp.Macro.SpeedGlitch
                end
            end
        end
    end
    
    UserInputService.InputBegan:Connect(OnKeyPress)
    
    UserInputService.InputBegan:Connect(function(keygo, ok)
        if (not ok) then
            if (keygo.KeyCode == getgenv().ceramp.Target.Bind) then
                Locking = not Locking
                if Locking then
                    Plr = getClosestPlayerToCursor()
                elseif not Locking then
                    if Plr then
                        Plr = nil
                    end
                end
            end
        end
    end)
    
    function getClosestPlayerToCursor()
        local closestDist = math.huge
        local closestPlr = nil
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= Client and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local screenPos, cameraVisible = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if cameraVisible then
                    local distToMouse = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if distToMouse < closestDist then
                        closestPlr = v
                        closestDist = distToMouse
                    end
                end
            end
        end
        return closestPlr
    end
    
    function getClosestPartToCursor(Player)
        local closestPart, closestDist = nil, math.huge
        if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Head") and Player.Character.Humanoid.Health ~= 0 and Player.Character:FindFirstChild("HumanoidRootPart") then
            for i, part in pairs(Player.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local screenPos, cameraVisible = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                    local distToMouse = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if distToMouse < closestDist and table.find(getgenv().ceramp.Target.Partz, part.Name) then
                        closestPart = part
                        closestDist = distToMouse
                    end
                end
            end
            return closestPart
        end
    end
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if Plr and Plr.Character then
            if getgenv().ceramp.Target.ClosetPart == true and getgenv().ceramp.Target.Enabled == false then
                getgenv().ceramp.Target.TargetPart = tostring(getClosestPartToCursor(Plr))
            elseif getgenv().ceramp.Target.Enabled == true and getgenv().ceramp.Target.ClosetPart == false then
                getgenv().ceramp.Target.TargetPart = getgenv().ceramp.Target.TargetPart
            end
        end
    end)
    
    local function getVelocity(Player)
        local Old = Player.Character.HumanoidRootPart.Position
        wait(0.145)
        local Current = Player.Character.HumanoidRootPart.Position
        return (Current - Old) / 0.145
    end
    
    local function GetShakedVector3(Setting)
        return Vector3.new(math.random(-Setting * 1e9, Setting * 1e9), math.random(-Setting * 1e9, Setting * 1e9), math.random(-Setting * 1e9, Setting * 1e9)) / 1e9;
    end
    
    local v = nil
    game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        if Plr ~= nil and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
            v = getVelocity(Plr)
        end
    end)
    
    local mainevent = game:GetService("ReplicatedStorage").MainEvent
    
    Client.Character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and child:FindFirstChild("MaxAmmo") then
            child.Activated:Connect(function()
                if Plr and Plr.Character then
                    local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().ceramp.Target.TargetPart].Position + Vector3.new(0, getgenv().ceramp.Target.JumpOffset, 0) or Plr.Character[getgenv().ceramp.Target.TargetPart].Position
                    if not CheckAnti(Plr) then
                        mainevent:FireServer(MouseMethod.MethodType, Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().ceramp.Target.Prediction2))
                    else
                        mainevent:FireServer(MouseMethod.MethodType, Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().ceramp.Target.Prediction2))
                    end
                end
            end)
        end
    end)
    
    Client.CharacterAdded:Connect(function(character)
        character.ChildAdded:Connect(function(child)
            if child:IsA("Tool") and child:FindFirstChild("MaxAmmo") then
                child.Activated:Connect(function()
                    if Plr and Plr.Character then
                        local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().ceramp.Target.TargetPart].Position + Vector3.new(0, getgenv().ceramp.Target.JumpOffset, 0) or Plr.Character[getgenv().ceramp.Target.TargetPart].Position
                        if not CheckAnti(Plr) then
                            mainevent:FireServer(MouseMethod.MethodType, Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().ceramp.Target.Prediction2))
                        else
                            mainevent:FireServer(MouseMethod.MethodType, Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().ceramp.Target.Prediction2))
                        end
                    end
                end)
            end
        end)
    end)
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if Plr ~= nil and Plr.Character then
            local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().ceramp.Target.TargetPart].Position + Vector3.new(0, getgenv().ceramp.Target.JumpOffset, 0) or Plr.Character[getgenv().ceramp.Target.TargetPart].Position
            if not CheckAnti(Plr) then
                local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().ceramp.Target.Prediction1) + GetShakedVector3(getgenv().ceramp.Target.Shake))
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, getgenv().ceramp.Target.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            else
                local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().ceramp.Target.Prediction1) + GetShakedVector3(getgenv().ceramp.Target.Shake))
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, getgenv().ceramp.Target.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            end
        end
        if getgenv().ceramp.Checks.CheckKoStatus == true and Plr and Plr.Character then
            local KOd = Plr.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if Plr.Character.Humanoid.Health < 1 or KOd or Grabbed then
                if Locking == true then
                    Plr = nil
                    Locking = false
                end
            end
        end
        if getgenv().ceramp.Checks.DisableOnTargetDeath == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
            if Plr.Character.Humanoid.health < 1 then
                if Locking == true then
                    Plr = nil
                    Locking = false
                end
            end
        end
        if getgenv().ceramp.Checks.DisableOnPlayerDeath == true and Client.Character and Client.Character:FindFirstChild("Humanoid") and Client.Character.Humanoid.health < 1 then
            if Locking == true then
                Plr = nil
                Locking = false
            end
        end
        if getgenv().ceramp.Checks.AntiGroundShots == true and Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
            pcall(function()
                local TargetVelv5 = Plr.Character.HumanoidRootPart
        TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, math.abs(TargetVelv5.Velocity.Y * 0.36),
         TargetVelv5.Velocity.Z)
                TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X, math.abs(TargetVelv5.Velocity.Y * 0.36), TargetVelv5.Velocity.Z)
            end)
        end
    end)
    
    if getgenv().ceramp.Spin.Enabled == true then
        
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        local Toggle = getgenv().ceramp.Spin.Enabled
        local RotationSpeed = getgenv().ceramp.Spin.SpinSpeed
        local Bind = getgenv().ceramp.Spin.Bind
        
        local function OnKeyPress(Input, GameProcessedEvent)
            if Input.KeyCode == Bind and not GameProcessedEvent then 
                Toggle = not Toggle
            end
        end
        
        UserInputService.InputBegan:Connect(OnKeyPress)
        
        local LastRenderTime = 0
        local TotalRotation = 0
        
        local function RotateCamera()
            if Toggle then
                local CurrentTime = tick()
                local TimeDelta = math.min(CurrentTime - LastRenderTime, 0.01)
                LastRenderTime = CurrentTime
        
                local RotationAngle = RotationSpeed * TimeDelta
                local Rotation = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(RotationAngle))
                Camera.CFrame = Camera.CFrame * Rotation
        
                TotalRotation = TotalRotation + RotationAngle
                if TotalRotation >= getgenv().ceramp.Spin.Degrees then 
                    Toggle = false
                    TotalRotation = 0
                end
            end
        end
        
        RunService.RenderStepped:Connect(RotateCamera)
        end
    
    getgenv().Loaded = true -- end of the script
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "ceramp",
            Text = "Updated Table",
            Duration = 0.001
        })
    end
    
    --// ESP 
    
    
    if getgenv().ceramp.Visuals.DistanceESP == true then
        local c = workspace.CurrentCamera
        local ps = game:GetService("Players")
        local lp = ps.LocalPlayer
        local rs = game:GetService("RunService")
        
        local function getdistancefc(part)
            return (part.Position - c.CFrame.Position).Magnitude
        end
        
        local function esp(p,cr)
            local h = cr:WaitForChild("Humanoid")
            local hrp = cr:WaitForChild("LeftLowerLeg")
        
            local text = Drawing.new("Text")
            text.Visible = false
            text.Center = true 
            text.Outline = true 
            text.Font = 2
            text.Color = Color3.fromRGB(255,255,255)
            text.Size = 13
        
            local c1 
            local c2 
            local c3 
        
            local function dc()
                text.Visible = false
                text:Remove()
                if c1 then
                    c1:Disconnect()
                    c1 = nil 
                end
                if c2 then
                    c2:Disconnect()
                    c2 = nil 
                end
                if c3 then
                    c3:Disconnect()
                    c3 = nil 
                end
            end
        
            c2 = cr.AncestryChanged:Connect(function(_,parent)
                if not parent then
                    dc()
                end
            end)
        
            c3 = h.HealthChanged:Connect(function(v)
                if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
                    dc()
                end
            end)
        
            c1 = rs.RenderStepped:Connect(function()
                local hrp_pos,hrp_os = c:WorldToViewportPoint(hrp.Position)
                if hrp_os then
                    text.Position = Vector2.new(hrp_pos.X,hrp_pos.Y)
                    text.Text = '['..tostring(math.floor(getdistancefc(hrp)))..'m]'
                    text.Visible = true 
                else
                    text.Visible = false 
                end
            end)
        end
        
        local function p_added(p)
            if p.Character then
                esp(p,p.Character)
            end
            p.CharacterAdded:Connect(function(cr)
                esp(p,cr)
            end)
        end
        
        
        for i,p in next, ps:GetPlayers() do 
            if p ~= lp then
                p_added(p)
            end
        end
        
        ps.PlayerAdded:Connect(p_added)
         end
    --// WeaponESP \\--
    
    if getgenv().ceramp.Visuals.WeaponESP == true then
        local c = workspace.CurrentCamera
    local ps = game:GetService("Players")
    local lp = ps.LocalPlayer
    local rs = game:GetService("RunService")
    
    local function ftool(cr)
        for a,b in next, cr:GetChildren() do 
            if b.ClassName == 'Tool' then
                return tostring(b.Name)
            end
        end
        return 'empty'
    end
    
    local function esp(p,cr)
        local h = cr:WaitForChild("Humanoid")
        local hrp = cr:WaitForChild("HumanoidRootPart")
    
        local text = Drawing.new('Text')
        text.Visible = false
        text.Center = true
        text.Outline = true
        text.Color = Color3.new(1,1,1)
        text.Font = 2
        text.Size = 13
    
        local c1 
        local c2
        local c3 
    
        local function dc()
            text.Visible = false
            text:Remove()
            if c3 then
                c1:Disconnect()
                c2:Disconnect()
                c3:Disconnect()
                c1 = nil 
                c2 = nil
                c3 = nil
            end
        end
    
        c2 = cr.AncestryChanged:Connect(function(_,parent)
            if not parent then
                dc()
            end
        end)
    
        c3 = h.HealthChanged:Connect(function(v)
            if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
                dc()
            end
        end)
    
        c1 = rs.Heartbeat:Connect(function()
            local hrp_pos,hrp_os = c:WorldToViewportPoint(hrp.Position)
            if hrp_os then
                text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
                text.Text = ' '..tostring(ftool(cr))..' '
                text.Visible = true
            else
                text.Visible = false
            end
        end)
    
    end
    
    local function p_added(p)
        if p.Character then
            esp(p,p.Character)
        end
        p.CharacterAdded:Connect(function(cr)
            esp(p,cr)
        end)
    end
    
    for a,b in next, ps:GetPlayers() do 
        if b ~= lp then
            p_added(b)
        end
    end
    
    ps.PlayerAdded:Connect(p_added)
    end
    
    --// Box & Health ESP \\--
    
    if getgenv().ceramp.Visuals.HealthBar == true then
    
        local Settings = {
            Box_Color = Color3.fromRGB(255, 0, 0),
            Box_Thickness = 0.1,
        }
        
        local Team_Check = {
            TeamCheck = false, -- if TeamColor is on this won't matter...
            Green = Color3.fromRGB(0, 255, 0),
            Red = Color3.fromRGB(255, 0, 0)
        }
        local TeamColor = true
        
        --// SEPARATION
        local player = game:GetService("Players").LocalPlayer
        
        local function NewQuad(thickness, color)
            local quad = Drawing.new("Quad")
            quad.Visible = false
            quad.PointA = Vector2.new(0,0)
            quad.PointB = Vector2.new(0,0)
            quad.PointC = Vector2.new(0,0)
            quad.PointD = Vector2.new(0,0)
            quad.Color = color
            quad.Filled = false
            quad.Thickness = thickness
            quad.Transparency = 1
            return quad
        end
        
        local function NewLine(thickness, color)
            local line = Drawing.new("Line")
            line.Visible = false
            line.From = Vector2.new(0, 0)
            line.To = Vector2.new(0, 0)
            line.Color = color 
            line.Thickness = thickness
            line.Transparency = 1
            return line
        end
        
        local function Visibility(state, lib)
            for u, x in pairs(lib) do
                x.Visible = state
            end
        end
        
        local function ToColor3(col) --Function to convert, just cuz c;
            local r = col.r --Red value
            local g = col.g --Green value
            local b = col.b --Blue value
            return Color3.new(r,g,b); --Color3 datatype, made of the RGB inputs
        end
        
        local black = Color3.fromRGB(0, 0 ,0)
        local function ESP(plr)
            local library = {
                --//Box and Black Box(black border)
                black = NewQuad(Settings.Box_Thickness*2, black),
                box = NewQuad(Settings.Box_Thickness, Settings.Box_Color),
                --//Bar and Green Health Bar (part that moves up/down)
                healthbar = NewLine(3, black),
                greenhealth = NewLine(1.5, black)
            }
        
            local function Colorize(color)
                for u, x in pairs(library) do
                    if x ~= library.healthbar and x ~= library.greenhealth then
                        x.Color = color
                    end
                end
            end
        
            local function Updater()
                local connection
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                        local HumPos, OnScreen = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                        if OnScreen then
                            local head = camera:WorldToViewportPoint(plr.Character.Head.Position)
                            local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                            
                            local function Size(item)
                                item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY*2)
                                item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2)
                                item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)
                                item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY*2)
                            end
                            Size(library.box)
                            Size(library.black)
        
        
                            --// Health Bar
                            local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)).magnitude 
                            local healthoffset = plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth * d
        
                            library.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                            library.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2 - healthoffset)
        
                            library.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                            library.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY*2)
        
                            local green = Color3.fromRGB(0, 255, 0)
                            local red = Color3.fromRGB(255, 0, 0)
        
                            library.greenhealth.Color = red:lerp(green, plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth);
        
                            if Team_Check.TeamCheck then
                                if plr.TeamColor == player.TeamColor then
                                    Colorize(Team_Check.Green)
                                else 
                                    Colorize(Team_Check.Red)
                                end
                            else 
                                
                            end
                            if TeamColor == true then
                                Colorize(plr.TeamColor.Color)
                            end
                            Visibility(true, library)
                        else 
                            Visibility(false, library)
                        end
                    else 
                        Visibility(false, library)
                        if game.Players:FindFirstChild(plr.Name) == nil then
                            connection:Disconnect()
                        end
                    end
                end)
            end
            coroutine.wrap(Updater)()
        end
        
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= player.Name then
                coroutine.wrap(ESP)(v)
            end
        end
        
        game.Players.PlayerAdded:Connect(function(newplr)
            if newplr.Name ~= player.Name then
                coroutine.wrap(ESP)(newplr)
            end
        end)
        end
        
        --// NameESP \\--
    
        if getgenv().ceramp.Visuals.NameESP == true then
            local c = workspace.CurrentCamera
        local ps = game:GetService("Players")
        local lp = ps.LocalPlayer
        local rs = game:GetService("RunService")
        
        local function esp(p,cr)
            local h = cr:WaitForChild("Humanoid")
            local hrp = cr:WaitForChild("Head")
        
            local text = Drawing.new("Text")
            text.Visible = false
            text.Center = true
            text.Outline = true 
            text.Font = 2
            text.Color = Color3.fromRGB(255,255,255)
            text.Size = 13
        
            local c1
            local c2
            local c3
        
            local function dc()
                text.Visible = false
                text:Remove()
                if c1 then
                    c1:Disconnect()
                    c1 = nil 
                end
                if c2 then
                    c2:Disconnect()
                    c2 = nil 
                end
                if c3 then
                    c3:Disconnect()
                    c3 = nil 
                end
            end
        
            c2 = cr.AncestryChanged:Connect(function(_,parent)
                if not parent then
                    dc()
                end
            end)
        
            c3 = h.HealthChanged:Connect(function(v)
                if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
                    dc()
                end
            end)
        
            c1 = rs.RenderStepped:Connect(function()
                local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
                if hrp_onscreen then
                    text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
                    text.Text = p.Name
                    text.Visible = true
                else
                    text.Visible = false
                end
            end)
        end
        
        local function p_added(p)
            if p.Character then
                esp(p,p.Character)
            end
            p.CharacterAdded:Connect(function(cr)
                esp(p,cr)
            end)
        end
        
        for i,p in next, ps:GetPlayers() do 
            if p ~= lp then
                p_added(p)
            end
        end
        
        ps.PlayerAdded:Connect(p_added)
        end
    
        --// end of esp 
    
    
    --  silent prediction 

    if ceramp.Silent.SpecificDis.Enabled then
        if Plr and Plr.Character then
            local part = ceramp.HitBox.Part
            local magnitude = (Client.Character[part].Position - Plr.Character[part].Position).Magnitude
            if magnitude < ceramp.Silent.Detection.Close then
                ceramp.Silent.Prediction = ceramp.Silent.SpecificDis.Prediction.Close
            elseif magnitude < ceramp.Silent.Detection.Mid then
                ceramp.Silent.Prediction = ceramp.Silent.SpecificDis.Prediction.Mid
            elseif magnitude < ceramp.Silent.Detection.Far then
                ceramp.Silent.Prediction = ceramp.Silent.SpecificDis.Prediction.Far
            end
        end
    end

    