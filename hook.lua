getgenv().Hook = {
    ['StartUP'] = {
        ["FPSUnlocker"] = true, --// self explantory.

    ['Settings'] = {
        ["Intro"] = true, --// do want you heart desires fatass.
        ["IntroID"] = "rbxassetid://18525425729" --// dont touch fatass big bitch.

        },
    },

    ['Aimbot'] = {
        ["Keybind"] = Enum.KeyCode.C, --// keybind to lock on.
        ["Camlock"] = 0.1664398, --// Camlock Prediction Retard.
        
        ["Enabled"] = false, --// toggler dumbass.
        ["Shake"] = 0, --// shake value fat fuck.
        
        ["Smoothing"] = 0.080,
        ["Style"] = "Sine", --// https://create.roblox.com/docs/reference/engine/enums/EasingStyle
        ["Direction"] = "InOut", --// https://create.roblox.com/docs/reference/engine/enums/EasingDirection

        ["Enabled"] = true, --// toggler 
        ["SinglePart"] = "Head", --// singular hit part

        ["Basic"] = false, 
        ["NearestParts"] = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"},


    },

    ['Silent'] = {
        ["Prediction"] = 0.125, --// silentAim Prediction.
        ["Detection"] = {Close = 60, Mid = 65, Far = math.huge}, --// close med or far change for fighting dumbass.
    },

    ['SpecificDis'] = {
        ["Enabled"] = false, 
            ["Prediction"] = {Close = 0.116243115666, Mid = 0.1188237, Far = 0.1224451,} --// distance retard.


    },

    ['Offsets'] = {
        ["Jump"] = {Smoothing = -0.15}, --// jump offset retard 
        ["Fall"] = {Smoothing = 0.20}, --// fall offset dumbass retard.
    },  

    ['Checks'] = {
        ["TargetDeath"] = false,
        ["PlayerDeath"] = false, --// Disable on players death
        ["UnlockOnPlayersKO"] = true, --// self explantory retard ass nigga.
        ["AntiGroundShots"] = true, --// its not possible to NOT HIT THE UFKCING GROUND.
        
    },
    
    ['Spin'] = {
        ["Enabled"] = true,
        ["SpinSpeed"] = 10000, --// spin speed fucking dumbass.
        ["Degrees"] = 360, --// i dont fucking know retard u should know dumbass.
        ["Keybind"]= Enum.KeyCode.V, --// keybind to spin retarded ass nigga.
    },

    ["Visuals"] = {
        ["DistanceESP"] = false, --// distance esp to see the distance dumbass.
        ["WeaponESP"] = false, --// see what tool a person has in the hand dumbass.
        ["HealthBar"] = false, --// see a fat nigga health ugly bitch.
        ["NameESP"] = false, --// See a person real name.

        
    
        
        

    },
}

-- // hoodcustomsbypass

for _, con in next, getconnections(workspace.CurrentCamera.Changed) do
    task.wait()
      con:Disable()
  end
  for _, con in next, getconnections(workspace.CurrentCamera:GetPropertyChangedSignal("CFrame")) do
     task.wait()
      con:Disable()
  end 
  
  -- // Game Load Check // --
  
  if not game:IsLoaded() then
      game.Loaded:Wait()
  end
  
  
  Hook = getgenv().Hook
  local UserInputService = game:GetService("UserInputService")
  local RunService = game:GetService("RunService")
  local NoclipMacro, Macro, PanicMode, TriggerBot, Desync, FreezePos, FrameSkip, FakeSpike = false, false, false, false, false, false, false, false
  
  
  if Hook.StartUP.FPSUnlocker then
      setfpscap(9999)
  end
  
  
  if Hook.StartUP.Settings.Intro then
      local cam = workspace.CurrentCamera
      local x = cam.ViewportSize.X
      local y = cam.ViewportSize.Y
      local newx = math.floor(x * 0.5)
      local newy = math.floor(y * 0.5)
  
      local SpashScreen = Instance.new("ScreenGui")
      local Image = Instance.new("ImageLabel")
      SpashScreen.Name = "SpashScreen"
      SpashScreen.Parent = game.CoreGui
      SpashScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      Image.Name = "Image"
      Image.Parent = SpashScreen
      Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Image.BackgroundTransparency = 1
      Image.Position = UDim2.new(0, newx, 0, newy)
      Image.Size = UDim2.new(0, 825, 0, 377)
      Image.Image = Hook.StartUP.Settings.IntroID
      Image.ImageTransparency = 1
      Image.AnchorPoint = Vector2.new(0.5, 0.5)
  
      local Blur = Instance.new("BlurEffect")
      Blur.Parent = game.Lighting
      Blur.Size = 0
      Blur.Name = tostring(math.random(1, 123123))
  
      local function gui(last, sex, t, s, inorout)
          local TI = TweenInfo.new(t or 1, s or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
          local Tweening = game:GetService("TweenService"):Create(last, TI, sex)
          Tweening:Play()
      end
  
      gui(Image, {ImageTransparency = 0}, 0.3)
      gui(Blur, {Size = 20}, 0.3)
      wait(3)
      gui(Image, {ImageTransparency = 1}, 0.3)
      gui(Blur, {Size = 0}, 0.3)
      wait(0.3)
  end


--// anti curve fatass

function AntiCurve()
    local character = game.Players.LocalPlayer.Character
    if getgenv().Hook.Start.AntiCurve and character and character.PrimaryPart then
        local characterCf = character.PrimaryPart.CFrame
        local target = self.Character.HumanoidRootPart
        local targetPos = target.Position
        local charPos = character.PrimaryPart.Position
        character:SetPrimaryPartCFrame(CFrame.lookAt(charPos, v3(targetPos.X, charPos.Y, targetPos.Z)))
        wait()
        character:SetPrimaryPartCFrame(characterCf)
    end
end


  -- // hoodcustomsbypass
  
  for _, con in next, getconnections(workspace.CurrentCamera.Changed) do
    task.wait()
      con:Disable()
  end
  for _, con in next, getconnections(workspace.CurrentCamera:GetPropertyChangedSignal("CFrame")) do
     task.wait()
      con:Disable()
  end 
  
  -- // Game Load Check // --
  
  if not game:IsLoaded() then
      game.Loaded:Wait()
  end
  

  
  local Games = {
      [2788229376] = {Name = "Da Hood", Argument = "UpdateMousePos", Remote = "MainEvent", BodyEffects = "K.O",},
      [9825515356] = {Name = "Hood Customs", Argument = "GetMousePos", Remote = "MainEvent"},
      [5602055394] = {Name = "Hood Modded", Argument = "MousePos", Remote = "Bullets"},
      [9183932460] = {Name = "Untitled Hood", Argument = "UpdateMousePos", Remote = ".gg/untitledhood"},
      [14412355918] = {Name = "Da Downhill", Argument = "MOUSE", Remote = "MAINEVENT"},
      [14412601883] = {Name = "Hood Bank", Argument = "MOUSE", Remote = "MAINEVENT"},
      [14412436145] = {Name = "Da Uphill", Argument = "MOUSE", Remote = "MAINEVENT"},
      [14487637618] = {Name = "Da Hood Bot Aim Trainer", Argument = "MOUSE", Remote = "MAINEVENT"},
      [11143225577] = {Name = "1v1 Hood Aim Trainer", Argument = "UpdateMousePos", Remote = "MainEvent"},
      [14413712255] = {Name = "Hood Aim", Argument = "MOUSE", Remote = "MAINEVENT"},
      [14472848239] = {Name = "Moon Hood", Argument = "MoonUpdateMousePos", Remote = "MainEvent"},
  }
  
  
  local VirtualInputManager = game:GetService("VirtualInputManager")
  
  
  
  
  
  local userInputService = game:GetService("UserInputService")
  
   -- // Anti-aim detection

  local function CheckAnti(Plr) 
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

  --// Silent Prediction

if Hook.Silent.SpecificDis.Enabled then
    if Plr and Plr.Character then
        local part = Hook.HitBox.Part
        local magnitude = (Client.Character[part].Position - Plr.Character[part].Position).Magnitude
        if magnitude < Hook.Silent.Detection.Close then
            Hook.Silent.Prediction.Detection = Hook.Silent.SpecificDis.Prediction.Close
        elseif magnitude < Hook.Silent.Detection.Mid then
            Hook.Silent.Prediction.Detection = Hook.Silent.SpecificDis.Prediction.Mid
        elseif magnitude < Hook.Silent.Detection.Far then
            Hook.Silent.Prediction.Detection = Hook.Silent.SpecificDis.Prediction.Far
        end
    end
end

  
  local function getnamecall()
       if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 or game.PlaceId == 16033173781 or game.PlaceId == 16158576873 then 
          return "UpdateMousePosI"
      elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
          return "MousePos"
      elseif game.PlaceId == 9825515356 then
          return "GetMousePos"
      end
  end
  
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
  
  -- 360 on Keybind
  local UserInputService = game:GetService("UserInputService")
  local RunService = game:GetService("RunService")
  local Camera = workspace.CurrentCamera
  local Toggle = false -- Initialize Toggle to false
  
  local function OnKeyPress(Input, GameProcessedEvent)
      if Input.KeyCode == getgenv().Hook.Aimbot.Keybind and not GameProcessedEvent then 
          Toggle = not Toggle
      elseif Input.KeyCode == getgenv().Hook.Macro.SpeedGlitchKey then
          if getgenv().Hook.Macro.Enabled then 
              getgenv().Hook.Macro.SpeedGlitch = not getgenv().Hook.Macro.SpeedGlitch
              if getgenv().Hook.Macro.SpeedGlitch then
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
                  until not getgenv().Hook.Macro.SpeedGlitch
              end
          end
      end
  end
  
  UserInputService.InputBegan:Connect(OnKeyPress)
  
  UserInputService.InputBegan:Connect(function(keygo, ok)
      if (not ok) then
          if (keygo.KeyCode == getgenv().Hook.Aimbot.Keybind) then
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
                  if distToMouse < closestDist and table.find(getgenv().Hook.Aimbot.NearestParts, part.Name) then
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
          if getgenv().Hook.Aimbot.NearestPart == true and getgenv().Hook.Aimbot.Basic == false then
              getgenv().Hook.Aimbot.SinglePart = tostring(getClosestPartToCursor(Plr))
          elseif getgenv().Hook.Aimbot.Basic == true and getgenv().Hook.Aimbot.NearestPart == false then
              getgenv().Hook.Aimbot.SinglePart = getgenv().Hook.Aimbot.SinglePart
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
                  local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position + Vector3.new(0, getgenv().Hook.Aimbot.JumpOffset, 0) or Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position
                  if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 or game.PlaceId == 16033173781 or game.PlaceId == 16158576873 then 
                      mainevent:FireServer("UpdateMousePosI", Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().Hook.Silent.Prediction))
                  else
                      mainevent:FireServer("UpdateMousePos", Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().Hook.Silent.Prediction))
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
                      local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position + Vector3.new(0, getgenv().Hook.Aimbot.JumpOffset, 0) or Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position
                      if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 or game.PlaceId == 16033173781 or game.PlaceId == 16158576873 then 
                          mainevent:FireServer("UpdateMousePosI", Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().Hook.Silent.Prediction))
                      else
                          mainevent:FireServer("UpdateMousePos", Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().Hook.Silent.Prediction))
                      end
                  end
              end)
          end
      end)
  end)
  
  Client.CharacterAdded:Connect(function(character)
      character.ChildAdded:Connect(function(child)
          if child:IsA("Tool") and child:FindFirstChild("MaxAmmo") then
              child.Activated:Connect(function()
                  if Plr and Plr.Character then
                      local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position + vector3.new(25, 100, 25, getgenv().Hook.Aimbot.JumpOffset, 0) or Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position
                      if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 or game.PlaceId == 16033173781 or game.PlaceId == 16158576873 then 
                          mainevent:FireServer("GetMousePosI", Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().Hook.Silent.Prediction))
                      else
                          mainevent:FireServer("GetMousePos", Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().Hook.Silent.Prediction))
                      end
                  end
              end)
          end
      end)
  end)
  
  game:GetService("RunService").RenderStepped:Connect(function()
      if Plr ~= nil and Plr.Character then
          local Position = Plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position + Vector3.new(0, getgenv().Hook.Aimbot.JumpOffset, 0) or Plr.Character[getgenv().Hook.Aimbot.SinglePart].Position
          if not CheckAnti(Plr) then
              local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Position + ((Plr.Character.HumanoidRootPart.Velocity) * getgenv().Hook.Aimbot.Camlock) + GetShakedVector3(getgenv().Hook.Aimbot.Shake))
              workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, getgenv().Hook.Aimbot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
          else
              local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Position + ((Plr.Character.Humanoid.MoveDirection * Plr.Character.Humanoid.WalkSpeed) * getgenv().Hook.Aimbot.Camlock) + GetShakedVector3(getgenv().Hook.Aimbot.CameraShake))
              workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, getgenv().Hook.Aimbot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
          end
      end

      if getgenv().Hook.Checks.UnlockOnPlayersKO == true and Plr and Plr.Character then
          local KOd = Plr.Character:WaitForChild("BodyEffects")["K.O"].Value
          local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
          if Plr.Character.Humanoid.Health < 1 or KOd or Grabbed then
              if Locking == true then
                  Plr = nil
                  Locking = false
              end
          end
      end
      if getgenv().Hook.Checks.TargetDeath == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
          if Plr.Character.Humanoid.health < 1 then
              if Locking == true then
                  Plr = nil
                  Locking = false
              end
          end
      end
      if getgenv().Hook.Checks.PlayerDeath  == true and Client.Character and Client.Character:FindFirstChild("Humanoid") and Client.Character.Humanoid.health < 1 then
          if Locking == true then
              Plr = nil
              Locking = false
          end
      end
      if getgenv().Hook.Checks.AntiGroundShots == true and Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
              pcall(function()
                  local AimbotVelv5 = Plr.Character.HumanoidRootPart
          AimbotVelv5.Velocity = Vector3.new(AimbotVelv5.Velocity.X, math.abs(AimbotVelv5.Velocity.Y * 0.36),
           AimbotVelv5.Velocity.Z)
                  AimbotVelv5.AssemblyLinearVelocity = Vector3.new(AimbotVelv5.Velocity.X, math.abs(AimbotVelv5.Velocity.Y * 0.36), AimbotVelv5.Velocity.Z)
              end)
          end
      end)
  
  if getgenv().Hook.Spin.Enabled == true then
      
      local Players = game:GetService("Players")
      local UserInputService = game:GetService("UserInputService")
      local RunService = game:GetService("RunService")
      local Camera = workspace.CurrentCamera
      local Toggle = getgenv().Hook.Spin.Enabled
      local RotationSpeed = getgenv().Hook.Spin.SpinSpeed
      local Keybind = getgenv().Hook.Spin.Keybind
      
      local function OnKeyPress(Input, GameProcessedEvent)
          if Input.KeyCode == Keybind and not GameProcessedEvent then 
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
              if TotalRotation >= getgenv().Hook.Spin.Degrees then 
                  Toggle = false
                  TotalRotation = 0
              end
          end
      end
      
      RunService.RenderStepped:Connect(RotateCamera)
      end
  
  
      if Misc.Resovler == true then 
      
          while true do
              
              heartbeat:Wait()
      
              
              if target == true then
                  
                  local targetPlayer = game.Players[targetplr]
                  if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                      local character = targetPlayer.Character.HumanoidRootPart
      
                      
                      local lastPosition = character.Position
                      task.wait()
      
                      
                      local currentPosition = character.Position
      
                      
                      local velocity = (currentPosition - lastPosition) * 0
      
                      
                      character.AssemblyLinearVelocity = velocity
                      character.Velocity = velocity
                  end
              end
          end
      end
      
  
  
   --// ESP 
      
      
   if getgenv().Hook.Visuals.DistanceESP == true then
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
  
  if getgenv().Hook.Visuals.WeaponESP == true then
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
  
  if getgenv().Hook.Visuals.HealthBar == true then
  
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
  
      if getgenv().Hook.Visuals.NameESP == true then
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

