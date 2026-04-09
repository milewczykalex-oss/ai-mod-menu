-- COMPLETE CONTROL PANEL with FLY + SUPER SPEED + AUTO PLATFORM (FIXED)
-- Press F to toggle fly | Press G to toggle super speed | Press H to toggle auto-platform

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Settings
local flying = false
local superSpeed = false
local autoPlatform = false
local flySpeed = 50
local runSpeed = 50
local originalWalkSpeed = 16

local bodyVelocity = nil
local platformFolder = nil
local currentJumpConnection = nil

-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 280)
frame.Position = UDim2.new(0, 10, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 32)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ CONTROL PANEL"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14
titleText.Font = Enum.Font.GothamBold
titleText.Parent = titleBar

-- Drag functionality
local dragging = false
local dragStart
local frameStart

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        frameStart = frame.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- ============ FLY SECTION ============
local flySection = Instance.new("Frame")
flySection.Size = UDim2.new(0.9, 0, 0, 70)
flySection.Position = UDim2.new(0.05, 0, 0, 42)
flySection.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
flySection.BackgroundTransparency = 0.5
flySection.BorderSizePixel = 0
flySection.Parent = frame

local flySectionCorner = Instance.new("UICorner")
flySectionCorner.CornerRadius = UDim.new(0, 8)
flySectionCorner.Parent = flySection

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0.4, 0, 0, 32)
flyButton.Position = UDim2.new(0.05, 0, 0, 8)
flyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
flyButton.Text = "🔴 FLY: OFF"
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.TextSize = 12
flyButton.Font = Enum.Font.GothamBold
flyButton.BorderSizePixel = 0
flyButton.Parent = flySection

local flyBtnCorner = Instance.new("UICorner")
flyBtnCorner.CornerRadius = UDim.new(0, 6)
flyBtnCorner.Parent = flyButton

local flySpeedLabel = Instance.new("TextLabel")
flySpeedLabel.Size = UDim2.new(0.4, 0, 0, 20)
flySpeedLabel.Position = UDim2.new(0.55, 0, 0, 8)
flySpeedLabel.BackgroundTransparency = 1
flySpeedLabel.Text = "Speed: " .. flySpeed
flySpeedLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
flySpeedLabel.TextSize = 12
flySpeedLabel.Font = Enum.Font.GothamBold
flySpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
flySpeedLabel.Parent = flySection

local flySliderBg = Instance.new("Frame")
flySliderBg.Size = UDim2.new(0.9, 0, 0, 6)
flySliderBg.Position = UDim2.new(0.05, 0, 0, 50)
flySliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
flySliderBg.BorderSizePixel = 0
flySliderBg.Parent = flySection

local flySliderBgCorner = Instance.new("UICorner")
flySliderBgCorner.CornerRadius = UDim.new(1, 0)
flySliderBgCorner.Parent = flySliderBg

local flySliderFill = Instance.new("Frame")
flySliderFill.Size = UDim2.new(0.5, 0, 1, 0)
flySliderFill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
flySliderFill.BorderSizePixel = 0
flySliderFill.Parent = flySliderBg

local flySliderFillCorner = Instance.new("UICorner")
flySliderFillCorner.CornerRadius = UDim.new(1, 0)
flySliderFillCorner.Parent = flySliderFill

local flySliderButton = Instance.new("Frame")
flySliderButton.Size = UDim2.new(0, 14, 0, 14)
flySliderButton.Position = UDim2.new(0.5, -7, 0, -4)
flySliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flySliderButton.BorderSizePixel = 0
flySliderButton.Parent = flySliderBg

local flySliderBtnCorner = Instance.new("UICorner")
flySliderBtnCorner.CornerRadius = UDim.new(1, 0)
flySliderBtnCorner.Parent = flySliderButton

-- ============ SUPER SPEED SECTION ============
local speedSection = Instance.new("Frame")
speedSection.Size = UDim2.new(0.9, 0, 0, 70)
speedSection.Position = UDim2.new(0.05, 0, 0, 120)
speedSection.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
speedSection.BackgroundTransparency = 0.5
speedSection.BorderSizePixel = 0
speedSection.Parent = frame

local speedSectionCorner = Instance.new("UICorner")
speedSectionCorner.CornerRadius = UDim.new(0, 8)
speedSectionCorner.Parent = speedSection

local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0.4, 0, 0, 32)
speedButton.Position = UDim2.new(0.05, 0, 0, 8)
speedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
speedButton.Text = "🔴 SPEED: OFF"
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.TextSize = 12
speedButton.Font = Enum.Font.GothamBold
speedButton.BorderSizePixel = 0
speedButton.Parent = speedSection

local speedBtnCorner = Instance.new("UICorner")
speedBtnCorner.CornerRadius = UDim.new(0, 6)
speedBtnCorner.Parent = speedButton

local speedValueLabel = Instance.new("TextLabel")
speedValueLabel.Size = UDim2.new(0.4, 0, 0, 20)
speedValueLabel.Position = UDim2.new(0.55, 0, 0, 8)
speedValueLabel.BackgroundTransparency = 1
speedValueLabel.Text = "Speed: " .. runSpeed
speedValueLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
speedValueLabel.TextSize = 12
speedValueLabel.Font = Enum.Font.GothamBold
speedValueLabel.TextXAlignment = Enum.TextXAlignment.Left
speedValueLabel.Parent = speedSection

local speedSliderBg = Instance.new("Frame")
speedSliderBg.Size = UDim2.new(0.9, 0, 0, 6)
speedSliderBg.Position = UDim2.new(0.05, 0, 0, 50)
speedSliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
speedSliderBg.BorderSizePixel = 0
speedSliderBg.Parent = speedSection

local speedSliderBgCorner = Instance.new("UICorner")
speedSliderBgCorner.CornerRadius = UDim.new(1, 0)
speedSliderBgCorner.Parent = speedSliderBg

local speedSliderFill = Instance.new("Frame")
speedSliderFill.Size = UDim2.new(0.5, 0, 1, 0)
speedSliderFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
speedSliderFill.BorderSizePixel = 0
speedSliderFill.Parent = speedSliderBg

local speedSliderFillCorner = Instance.new("UICorner")
speedSliderFillCorner.CornerRadius = UDim.new(1, 0)
speedSliderFillCorner.Parent = speedSliderFill

local speedSliderButton = Instance.new("Frame")
speedSliderButton.Size = UDim2.new(0, 14, 0, 14)
speedSliderButton.Position = UDim2.new(0.5, -7, 0, -4)
speedSliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedSliderButton.BorderSizePixel = 0
speedSliderButton.Parent = speedSliderBg

local speedSliderBtnCorner = Instance.new("UICorner")
speedSliderBtnCorner.CornerRadius = UDim.new(1, 0)
speedSliderBtnCorner.Parent = speedSliderButton

-- ============ AUTO PLATFORM SECTION ============
local platformSection = Instance.new("Frame")
platformSection.Size = UDim2.new(0.9, 0, 0, 55)
platformSection.Position = UDim2.new(0.05, 0, 0, 198)
platformSection.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
platformSection.BackgroundTransparency = 0.5
platformSection.BorderSizePixel = 0
platformSection.Parent = frame

local platformSectionCorner = Instance.new("UICorner")
platformSectionCorner.CornerRadius = UDim.new(0, 8)
platformSectionCorner.Parent = platformSection

local platformButton = Instance.new("TextButton")
platformButton.Size = UDim2.new(0.9, 0, 0, 32)
platformButton.Position = UDim2.new(0.05, 0, 0, 12)
platformButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
platformButton.Text = "🔴 PLATFORM: OFF"
platformButton.TextColor3 = Color3.fromRGB(255, 255, 255)
platformButton.TextSize = 12
platformButton.Font = Enum.Font.GothamBold
platformButton.BorderSizePixel = 0
platformButton.Parent = platformSection

local platformBtnCorner = Instance.new("UICorner")
platformBtnCorner.CornerRadius = UDim.new(0, 6)
platformBtnCorner.Parent = platformButton

-- ============ SLIDER FUNCTIONS ============
local minSpeed = 10
local maxSpeed = 200

local function updateFlyUI()
    local percent = (flySpeed - minSpeed) / (maxSpeed - minSpeed)
    flySliderFill.Size = UDim2.new(percent, 0, 1, 0)
    flySliderButton.Position = UDim2.new(percent, -7, 0, -4)
    flySpeedLabel.Text = "Speed: " .. math.floor(flySpeed)
end

local function updateSpeedUI()
    local percent = (runSpeed - minSpeed) / (maxSpeed - minSpeed)
    speedSliderFill.Size = UDim2.new(percent, 0, 1, 0)
    speedSliderButton.Position = UDim2.new(percent, -7, 0, -4)
    speedValueLabel.Text = "Speed: " .. math.floor(runSpeed)
    
    if superSpeed and humanoid then
        humanoid.WalkSpeed = runSpeed
    end
end

-- Fly slider dragging
local flyDragging = false
flySliderBg.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        flyDragging = true
        local clickX = math.clamp(input.Position.X - flySliderBg.AbsolutePosition.X, 0, flySliderBg.AbsoluteSize.X)
        local percent = clickX / flySliderBg.AbsoluteSize.X
        flySpeed = minSpeed + (percent * (maxSpeed - minSpeed))
        updateFlyUI()
    end
end)

local speedDragging = false
speedSliderBg.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        speedDragging = true
        local clickX = math.clamp(input.Position.X - speedSliderBg.AbsolutePosition.X, 0, speedSliderBg.AbsoluteSize.X)
        local percent = clickX / speedSliderBg.AbsoluteSize.X
        runSpeed = minSpeed + (percent * (maxSpeed - minSpeed))
        updateSpeedUI()
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if flyDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local clickX = math.clamp(input.Position.X - flySliderBg.AbsolutePosition.X, 0, flySliderBg.AbsoluteSize.X)
        local percent = clickX / flySliderBg.AbsoluteSize.X
        flySpeed = minSpeed + (percent * (maxSpeed - minSpeed))
        updateFlyUI()
    end
    
    if speedDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local clickX = math.clamp(input.Position.X - speedSliderBg.AbsolutePosition.X, 0, speedSliderBg.AbsoluteSize.X)
        local percent = clickX / speedSliderBg.AbsoluteSize.X
        runSpeed = minSpeed + (percent * (maxSpeed - minSpeed))
        updateSpeedUI()
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        flyDragging = false
        speedDragging = false
    end
end)

-- ============ AUTO PLATFORM FUNCTIONS (FIXED) ============
local function createPlatform(position)
    -- Create a folder to store platforms if it doesn't exist
    if not platformFolder or not platformFolder.Parent then
        platformFolder = Instance.new("Folder")
        platformFolder.Name = "AutoPlatforms"
        platformFolder.Parent = workspace
    end
    
    -- Create the platform part
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(5, 0.5, 5)
    platform.Position = Vector3.new(position.X, position.Y - 3, position.Z)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright blue")
    platform.Material = Enum.Material.Neon
    platform.Transparency = 0.3
    platform.Name = "Platform"
    platform.Parent = platformFolder
    
    -- Add a slight glow effect
    local selectionBox = Instance.new("SelectionBox")
    selectionBox.Adornee = platform
    selectionBox.Color3 = Color3.fromRGB(0, 150, 255)
    selectionBox.Transparency = 0.5
    selectionBox.LineThickness = 0.05
    selectionBox.Parent = platform
    
    -- Auto-remove platform after 5 seconds
    game:GetService("Debris"):AddItem(platform, 5)
    
    print("Platform spawned at:", platform.Position)
    return platform
end

-- Fixed jump detection using Humanoid.Jumping event
local function setupJumpDetection(char)
    local hum = char:WaitForChild("Humanoid")
    
    -- Disconnect old connection if it exists
    if currentJumpConnection then
        currentJumpConnection:Disconnect()
        currentJumpConnection = nil
    end
    
    -- Connect new jump detection
    currentJumpConnection = hum.Jumping:Connect(function()
        if autoPlatform then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                createPlatform(root.Position)
            end
        end
    end)
    
    return hum
end

local function enableAutoPlatform()
    if autoPlatform then return end
    autoPlatform = true
    
    -- Setup jump detection on current character
    local char = player.Character
    if char then
        setupJumpDetection(char)
    end
    
    platformButton.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    platformButton.Text = "🟢 PLATFORM: ON"
    print("Auto-Platform ON - Platforms will spawn when you jump")
end

local function disableAutoPlatform()
    if not autoPlatform then return end
    autoPlatform = false
    
    -- Disconnect jump connection
    if currentJumpConnection then
        currentJumpConnection:Disconnect()
        currentJumpConnection = nil
    end
    
    platformButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    platformButton.Text = "🔴 PLATFORM: OFF"
    print("Auto-Platform OFF")
end

-- ============ FLY FUNCTIONS ============
local function startFly()
    if flying then return end
    flying = true
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 100000
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = rootPart
    
    humanoid.PlatformStand = true
    flyButton.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    flyButton.Text = "🟢 FLY: ON"
    print("Fly ON - Speed: " .. flySpeed)
end

local function stopFly()
    if not flying then return end
    flying = false
    
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    
    humanoid.PlatformStand = false
    flyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    flyButton.Text = "🔴 FLY: OFF"
    print("Fly OFF")
end

-- ============ SUPER SPEED FUNCTIONS ============
local function enableSuperSpeed()
    if superSpeed then return end
    superSpeed = true
    originalWalkSpeed = humanoid.WalkSpeed
    humanoid.WalkSpeed = runSpeed
    speedButton.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    speedButton.Text = "🟢 SPEED: ON"
    print("Super Speed ON - Speed: " .. runSpeed)
end

local function disableSuperSpeed()
    if not superSpeed then return end
    superSpeed = false
    humanoid.WalkSpeed = originalWalkSpeed
    speedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    speedButton.Text = "🔴 SPEED: OFF"
    print("Super Speed OFF")
end

-- ============ MOVEMENT UPDATE ============
local function updateFly()
    if not flying or not bodyVelocity then return end
    
    local moveDirection = Vector3.new(0, 0, 0)
    local camera = workspace.CurrentCamera
    local uis = game:GetService("UserInputService")
    
    if uis:IsKeyDown(Enum.KeyCode.W) then
        moveDirection = moveDirection + camera.CFrame.LookVector
    end
    if uis:IsKeyDown(Enum.KeyCode.S) then
        moveDirection = moveDirection - camera.CFrame.LookVector
    end
    if uis:IsKeyDown(Enum.KeyCode.A) then
        moveDirection = moveDirection - camera.CFrame.RightVector
    end
    if uis:IsKeyDown(Enum.KeyCode.D) then
        moveDirection = moveDirection + camera.CFrame.RightVector
    end
    if uis:IsKeyDown(Enum.KeyCode.Space) then
        moveDirection = moveDirection + Vector3.new(0, 1, 0)
    end
    if uis:IsKeyDown(Enum.KeyCode.LeftControl) then
        moveDirection = moveDirection - Vector3.new(0, 1, 0)
    end
    
    if moveDirection.Magnitude > 0 then
        moveDirection = moveDirection.Unit * flySpeed
    end
    
    bodyVelocity.Velocity = moveDirection
end

-- ============ BUTTON CLICKS ============
flyButton.MouseButton1Click:Connect(function()
    character = player.Character
    if character then
        rootPart = character:WaitForChild("HumanoidRootPart")
        humanoid = character:WaitForChild("Humanoid")
        
        if flying then
            stopFly()
        else
            startFly()
        end
    end
end)

speedButton.MouseButton1Click:Connect(function()
    character = player.Character
    if character then
        humanoid = character:WaitForChild("Humanoid")
        
        if superSpeed then
            disableSuperSpeed()
        else
            enableSuperSpeed()
        end
    end
end)

platformButton.MouseButton1Click:Connect(function()
    if autoPlatform then
        disableAutoPlatform()
    else
        enableAutoPlatform()
    end
end)

-- ============ CHARACTER RESPAWN HANDLER (FIXED) ============
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    wait(0.5)
    
    if superSpeed then
        humanoid.WalkSpeed = runSpeed
    end
    
    if autoPlatform then
        setupJumpDetection(newChar)
    end
end)

-- ============ HEARTBEAT LOOP ============
game:GetService("RunService").Heartbeat:Connect(function()
    updateFly()
end)

-- ============ KEYBOARD SHORTCUTS ============
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        character = player.Character
        if character then
            rootPart = character:WaitForChild("HumanoidRootPart")
            humanoid = character:WaitForChild("Humanoid")
            
            if flying then
                stopFly()
            else
                startFly()
            end
        end
    end
    
    if input.KeyCode == Enum.KeyCode.G then
        character = player.Character
        if character then
            humanoid = character:WaitForChild("Humanoid")
            
            if superSpeed then
                disableSuperSpeed()
            else
                enableSuperSpeed()
            end
        end
    end
    
    if input.KeyCode == Enum.KeyCode.H then
        if autoPlatform then
            disableAutoPlatform()
        else
            enableAutoPlatform()
        end
    end
end)

-- Initialize UI
updateFlyUI()
updateSpeedUI()

print("=== COMPLETE CONTROL PANEL LOADED ===")
print("F - Toggle FLY")
print("G - Toggle SUPER SPEED")
print("H - Toggle AUTO PLATFORM")
