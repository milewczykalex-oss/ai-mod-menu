-- UPDATED TABBED CONTROL PANEL with UPDATE TAB
-- Press INSERT to hide/show menu
-- Version 2.0

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Mod states
local mods = {
    fly = false,
    superSpeed = false,
    autoPlatform = false,
    infiniteJump = false,
    noclip = false,
    godMode = false,
    invisible = false,
    rainbow = false,
    teleport = false,
    killAll = false,
    freezePlayers = false,
    lightMode = false,
    nightMode = false,
    speedTrail = false
}

-- Settings
local flySpeed = 50
local runSpeed = 50
local bodyVel = nil
local platformFolder = nil
local rainbowConnection = nil
local noclipConnection = nil
local platformConnection = nil
local trailObject = nil
local originalWalkSpeed = 16

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "WorkingMenu"
gui.Parent = player.PlayerGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 520)
main.Position = UDim2.new(0.5, -210, 0.5, -260)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BackgroundTransparency = 0.05
main.Visible = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

-- Title Bar (draggable)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ CONTROL PANEL v2.0"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
end)

-- Drag functionality
local dragStart = nil
local dragFrameStart = nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        dragFrameStart = main.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragStart and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(dragFrameStart.X.Scale, dragFrameStart.X.Offset + delta.X, dragFrameStart.Y.Scale, dragFrameStart.Y.Offset + delta.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = nil
    end
end)

-- Tab Buttons (5 tabs now)
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 45)
tabBar.Position = UDim2.new(0, 0, 0, 40)
tabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
tabBar.Parent = main

local tab1 = Instance.new("TextButton")
tab1.Size = UDim2.new(0.2, 0, 1, 0)
tab1.Position = UDim2.new(0, 0, 0, 0)
tab1.BackgroundColor3 = Color3.fromRGB(80, 100, 150)
tab1.Text = "🎮 GAME"
tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1.TextSize = 11
tab1.Font = Enum.Font.GothamBold
tab1.Parent = tabBar

local tab2 = Instance.new("TextButton")
tab2.Size = UDim2.new(0.2, 0, 1, 0)
tab2.Position = UDim2.new(0.2, 0, 0, 0)
tab2.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab2.Text = "🏃 MOVE"
tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2.TextSize = 11
tab2.Font = Enum.Font.GothamBold
tab2.Parent = tabBar

local tab3 = Instance.new("TextButton")
tab3.Size = UDim2.new(0.2, 0, 1, 0)
tab3.Position = UDim2.new(0.4, 0, 0, 0)
tab3.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab3.Text = "👁️ VISUAL"
tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
tab3.TextSize = 11
tab3.Font = Enum.Font.GothamBold
tab3.Parent = tabBar

local tab4 = Instance.new("TextButton")
tab4.Size = UDim2.new(0.2, 0, 1, 0)
tab4.Position = UDim2.new(0.6, 0, 0, 0)
tab4.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab4.Text = "🌍 WORLD"
tab4.TextColor3 = Color3.fromRGB(255, 255, 255)
tab4.TextSize = 11
tab4.Font = Enum.Font.GothamBold
tab4.Parent = tabBar

local tab5 = Instance.new("TextButton")
tab5.Size = UDim2.new(0.2, 0, 1, 0)
tab5.Position = UDim2.new(0.8, 0, 0, 0)
tab5.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab5.Text = "📢 UPDATE"
tab5.TextColor3 = Color3.fromRGB(255, 255, 255)
tab5.TextSize = 11
tab5.Font = Enum.Font.GothamBold
tab5.Parent = tabBar

-- Content frames
local gameContent = Instance.new("ScrollingFrame")
gameContent.Size = UDim2.new(0.95, 0, 0.75, 0)
gameContent.Position = UDim2.new(0.025, 0, 0.19, 0)
gameContent.BackgroundTransparency = 1
gameContent.ScrollBarThickness = 6
gameContent.CanvasSize = UDim2.new(0, 0, 0, 600)
gameContent.Parent = main

local moveContent = Instance.new("ScrollingFrame")
moveContent.Size = UDim2.new(0.95, 0, 0.75, 0)
moveContent.Position = UDim2.new(0.025, 0, 0.19, 0)
moveContent.BackgroundTransparency = 1
moveContent.ScrollBarThickness = 6
moveContent.CanvasSize = UDim2.new(0, 0, 0, 350)
moveContent.Visible = false
moveContent.Parent = main

local visualContent = Instance.new("ScrollingFrame")
visualContent.Size = UDim2.new(0.95, 0, 0.75, 0)
visualContent.Position = UDim2.new(0.025, 0, 0.19, 0)
visualContent.BackgroundTransparency = 1
visualContent.ScrollBarThickness = 6
visualContent.CanvasSize = UDim2.new(0, 0, 0, 500)
visualContent.Visible = false
visualContent.Parent = main

local worldContent = Instance.new("ScrollingFrame")
worldContent.Size = UDim2.new(0.95, 0, 0.75, 0)
worldContent.Position = UDim2.new(0.025, 0, 0.19, 0)
worldContent.BackgroundTransparency = 1
worldContent.ScrollBarThickness = 6
worldContent.CanvasSize = UDim2.new(0, 0, 0, 400)
worldContent.Visible = false
worldContent.Parent = main

-- UPDATE TAB (no scrolling, just info)
local updateContent = Instance.new("Frame")
updateContent.Size = UDim2.new(0.95, 0, 0.75, 0)
updateContent.Position = UDim2.new(0.025, 0, 0.19, 0)
updateContent.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
updateContent.BackgroundTransparency = 0.3
updateContent.Visible = false
updateContent.Parent = main

local updateCorner = Instance.new("UICorner")
updateCorner.CornerRadius = UDim.new(0, 10)
updateCorner.Parent = updateContent

-- Layouts
local gameLayout = Instance.new("UIListLayout")
gameLayout.Padding = UDim.new(0, 8)
gameLayout.Parent = gameContent

local moveLayout = Instance.new("UIListLayout")
moveLayout.Padding = UDim.new(0, 8)
moveLayout.Parent = moveContent

local visualLayout = Instance.new("UIListLayout")
visualLayout.Padding = UDim.new(0, 8)
visualLayout.Parent = visualContent

local worldLayout = Instance.new("UIListLayout")
worldLayout.Padding = UDim.new(0, 8)
worldLayout.Parent = worldContent

-- Button creation helper
local function createButton(parent, text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92, 0, 0, 45)
    btn.Position = UDim2.new(0.04, 0, 0, 0)
    btn.BackgroundColor3 = color or Color3.fromRGB(60, 60, 80)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(80, 140, 80) and btn.BackgroundColor3 ~= Color3.fromRGB(140, 80, 80) then
            btn.BackgroundColor3 = Color3.fromRGB(75, 75, 95)
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(80, 140, 80) and btn.BackgroundColor3 ~= Color3.fromRGB(140, 80, 80) then
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end)
    
    return btn
end

local function createSlider(parent, labelText, minVal, maxVal, initialVal, onChange)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.92, 0, 0, 60)
    container.Position = UDim2.new(0.04, 0, 0, 0)
    container.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    container.BackgroundTransparency = 0.5
    container.Parent = parent
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 25)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = labelText .. ": " .. initialVal
    label.TextColor3 = Color3.fromRGB(255, 200, 100)
    label.TextSize = 11
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(0.9, 0, 0, 6)
    sliderBg.Position = UDim2.new(0.05, 0, 0, 40)
    sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = container
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(1, 0)
    sliderBgCorner.Parent = sliderBg
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((initialVal - minVal) / (maxVal - minVal), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    fill.BorderSizePixel = 0
    fill.Parent = sliderBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local dragging = false
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
            local percent = clickX / sliderBg.AbsoluteSize.X
            local val = minVal + (percent * (maxVal - minVal))
            fill.Size = UDim2.new(percent, 0, 1, 0)
            label.Text = labelText .. ": " .. math.floor(val)
            onChange(val)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
            local percent = clickX / sliderBg.AbsoluteSize.X
            local val = minVal + (percent * (maxVal - minVal))
            fill.Size = UDim2.new(percent, 0, 1, 0)
            label.Text = labelText .. ": " .. math.floor(val)
            onChange(val)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return container
end

-- ============ UPDATE TAB CONTENT ============
local function createUpdateLabel(parent, text, yPos, color)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.9, 0, 0, 30)
    label.Position = UDim2.new(0.05, 0, 0, yPos)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    return label
end

-- Version title
local versionTitle = Instance.new("TextLabel")
versionTitle.Size = UDim2.new(1, 0, 0, 40)
versionTitle.Position = UDim2.new(0, 0, 0, 10)
versionTitle.BackgroundTransparency = 1
versionTitle.Text = "📢 UPDATE v2.0 - WHAT'S NEW"
versionTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
versionTitle.TextSize = 16
versionTitle.Font = Enum.Font.GothamBold
versionTitle.Parent = updateContent

-- Update entries
local update1 = Instance.new("TextLabel")
update1.Size = UDim2.new(0.95, 0, 0, 40)
update1.Position = UDim2.new(0.025, 0, 0, 60)
update1.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
update1.BackgroundTransparency = 0.5
update1.Text = "✨ NEW: SPEED TRAIL - Leaves a trail behind you!"
update1.TextColor3 = Color3.fromRGB(100, 255, 100)
update1.TextSize = 12
update1.Font = Enum.Font.GothamBold
update1.Parent = updateContent

local update1Corner = Instance.new("UICorner")
update1Corner.CornerRadius = UDim.new(0, 6)
update1Corner.Parent = update1

local update2 = Instance.new("TextLabel")
update2.Size = UDim2.new(0.95, 0, 0, 40)
update2.Position = UDim2.new(0.025, 0, 0, 110)
update2.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
update2.BackgroundTransparency = 0.5
update2.Text = "🪟 IMPROVED: Larger UI with 5 tabs (added UPDATE tab)"
update2.TextColor3 = Color3.fromRGB(100, 255, 100)
update2.TextSize = 12
update2.Font = Enum.Font.GothamBold
update2.Parent = updateContent

local update2Corner = Instance.new("UICorner")
update2Corner.CornerRadius = UDim.new(0, 6)
update2Corner.Parent = update2

local update3 = Instance.new("TextLabel")
update3.Size = UDim2.new(0.95, 0, 0, 40)
update3.Position = UDim2.new(0.025, 0, 0, 160)
update3.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
update3.BackgroundTransparency = 0.5
update3.Text = "🪄 FIXED: Auto-Platform now works perfectly when jumping!"
update3.TextColor3 = Color3.fromRGB(100, 255, 100)
update3.TextSize = 12
update3.Font = Enum.Font.GothamBold
update3.Parent = updateContent

local update3Corner = Instance.new("UICorner")
update3Corner.CornerRadius = UDim.new(0, 6)
update3Corner.Parent = update3

local update4 = Instance.new("TextLabel")
update4.Size = UDim2.new(0.95, 0, 0, 40)
update4.Position = UDim2.new(0.025, 0, 0, 210)
update4.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
update4.BackgroundTransparency = 0.5
update4.Text = "🖱️ FIXED: Click Teleport - Turn on, then click anywhere!"
update4.TextColor3 = Color3.fromRGB(100, 255, 100)
update4.TextSize = 12
update4.Font = Enum.Font.GothamBold
update4.Parent = updateContent

local update4Corner = Instance.new("UICorner")
update4Corner.CornerRadius = UDim.new(0, 6)
update4Corner.Parent = update4

local update5 = Instance.new("TextLabel")
update5.Size = UDim2.new(0.95, 0, 0, 40)
update5.Position = UDim2.new(0.025, 0, 0, 260)
update5.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
update5.BackgroundTransparency = 0.5
update5.Text = "⚡ IMPROVED: Better performance and smoother flying"
update5.TextColor3 = Color3.fromRGB(100, 255, 100)
update5.TextSize = 12
update5.Font = Enum.Font.GothamBold
update5.Parent = updateContent

local update5Corner = Instance.new("UICorner")
update5Corner.CornerRadius = UDim.new(0, 6)
update5Corner.Parent = update5

local update6 = Instance.new("TextLabel")
update6.Size = UDim2.new(0.95, 0, 0, 40)
update6.Position = UDim2.new(0.025, 0, 0, 310)
update6.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
update6.BackgroundTransparency = 0.5
update6.Text = "🎨 NEW: Rainbow Mode - Your character cycles colors!"
update6.TextColor3 = Color3.fromRGB(100, 255, 100)
update6.TextSize = 12
update6.Font = Enum.Font.GothamBold
update6.Parent = updateContent

local update6Corner = Instance.new("UICorner")
update6Corner.CornerRadius = UDim.new(0, 6)
update6Corner.Parent = update6

-- Keyboard shortcuts info
local shortcutsTitle = Instance.new("TextLabel")
shortcutsTitle.Size = UDim2.new(1, 0, 0, 30)
shortcutsTitle.Position = UDim2.new(0, 0, 0, 370)
shortcutsTitle.BackgroundTransparency = 1
shortcutsTitle.Text = "⌨️ KEYBOARD SHORTCUTS"
shortcutsTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
shortcutsTitle.TextSize = 14
shortcutsTitle.Font = Enum.Font.GothamBold
shortcutsTitle.Parent = updateContent

local shortcut1 = Instance.new("TextLabel")
shortcut1.Size = UDim2.new(0.9, 0, 0, 25)
shortcut1.Position = UDim2.new(0.05, 0, 0, 405)
shortcut1.BackgroundTransparency = 1
shortcut1.Text = "• INSERT - Hide/Show Menu"
shortcut1.TextColor3 = Color3.fromRGB(180, 180, 220)
shortcut1.TextSize = 11
shortcut1.Font = Enum.Font.Gotham
shortcut1.TextXAlignment = Enum.TextXAlignment.Left
shortcut1.Parent = updateContent

local shortcut2 = Instance.new("TextLabel")
shortcut2.Size = UDim2.new(0.9, 0, 0, 25)
shortcut2.Position = UDim2.new(0.05, 0, 0, 430)
shortcut2.BackgroundTransparency = 1
shortcut2.Text = "• F - Toggle Fly"
shortcut2.TextColor3 = Color3.fromRGB(180, 180, 220)
shortcut2.TextSize = 11
shortcut2.Font = Enum.Font.Gotham
shortcut2.TextXAlignment = Enum.TextXAlignment.Left
shortcut2.Parent = updateContent

local shortcut3 = Instance.new("TextLabel")
shortcut3.Size = UDim2.new(0.9, 0, 0, 25)
shortcut3.Position = UDim2.new(0.05, 0, 0, 455)
shortcut3.BackgroundTransparency = 1
shortcut3.Text = "• G - Toggle Super Speed"
shortcut3.TextColor3 = Color3.fromRGB(180, 180, 220)
shortcut3.TextSize = 11
shortcut3.Font = Enum.Font.Gotham
shortcut3.TextXAlignment = Enum.TextXAlignment.Left
shortcut3.Parent = updateContent

-- ============ PLATFORM FUNCTION ============
local function spawnPlatform()
    if not mods.autoPlatform then return end
    if not rootPart then return end
    
    if not platformFolder or not platformFolder.Parent then
        platformFolder = Instance.new("Folder")
        platformFolder.Name = "AutoPlatforms"
        platformFolder.Parent = workspace
    end
    
    local plat = Instance.new("Part")
    plat.Size = Vector3.new(5, 0.5, 5)
    plat.Position = Vector3.new(rootPart.Position.X, rootPart.Position.Y - 3, rootPart.Position.Z)
    plat.Anchored = true
    plat.BrickColor = BrickColor.new("Bright blue")
    plat.Material = Enum.Material.Neon
    plat.Transparency = 0.3
    plat.Name = "JumpPlatform"
    plat.Parent = platformFolder
    
    local pointLight = Instance.new("PointLight")
    pointLight.Color = Color3.fromRGB(0, 100, 255)
    pointLight.Range = 10
    pointLight.Brightness = 2
    pointLight.Parent = plat
    
    game:GetService("Debris"):AddItem(plat, 5)
end

-- ============ TELEPORT FUNCTION ============
local mouse = player:GetMouse()
local teleportActive = false

local function teleportToMouse()
    if not teleportActive then return end
    if not mouse then return end
    if not rootPart then return end
    
    local targetPos = mouse.Hit.p
    rootPart.CFrame = CFrame.new(targetPos)
    print("Teleported to:", targetPos)
end

-- ============ GAME TAB ============
local flyBtn = createButton(gameContent, "🔴 FLY: OFF", Color3.fromRGB(60, 60, 80))
flyBtn.MouseButton1Click:Connect(function()
    mods.fly = not mods.fly
    if mods.fly then
        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(1, 1, 1) * 100000
        bodyVel.Parent = rootPart
        humanoid.PlatformStand = true
        flyBtn.Text = "🟢 FLY: ON"
        flyBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if bodyVel then bodyVel:Destroy() end
        humanoid.PlatformStand = false
        flyBtn.Text = "🔴 FLY: OFF"
        flyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(gameContent, "Fly Speed", 20, 200, 50, function(val)
    flySpeed = val
end)

local speedBtn = createButton(gameContent, "🔴 SUPER SPEED: OFF", Color3.fromRGB(60, 60, 80))
speedBtn.MouseButton1Click:Connect(function()
    mods.superSpeed = not mods.superSpeed
    if mods.superSpeed then
        originalWalkSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = runSpeed
        speedBtn.Text = "🟢 SUPER SPEED: ON"
        speedBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        humanoid.WalkSpeed = originalWalkSpeed
        speedBtn.Text = "🔴 SUPER SPEED: OFF"
        speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(gameContent, "Run Speed", 16, 200, 50, function(val)
    runSpeed = val
    if mods.superSpeed then humanoid.WalkSpeed = runSpeed end
end)

-- Auto Platform Button
local platformBtn = createButton(gameContent, "🔴 AUTO PLATFORM: OFF", Color3.fromRGB(60, 60, 80))
platformBtn.MouseButton1Click:Connect(function()
    mods.autoPlatform = not mods.autoPlatform
    
    if mods.autoPlatform then
        if platformConnection then platformConnection:Disconnect() end
        platformConnection = humanoid.Jumping:Connect(function()
            spawnPlatform()
        end)
        platformBtn.Text = "🟢 AUTO PLATFORM: ON"
        platformBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Auto-Platform ENABLED - Jump to spawn platforms!")
    else
        if platformConnection then platformConnection:Disconnect() end
        platformConnection = nil
        platformBtn.Text = "🔴 AUTO PLATFORM: OFF"
        platformBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Auto-Platform DISABLED")
    end
end)

-- Teleport Button
local teleportBtn = createButton(gameContent, "🔴 CLICK TELEPORT: OFF", Color3.fromRGB(60, 60, 80))
teleportBtn.MouseButton1Click:Connect(function()
    teleportActive = not teleportActive
    
    if teleportActive then
        teleportBtn.Text = "🟢 CLICK TELEPORT: ON"
        teleportBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Teleport ENABLED - Click anywhere to teleport!")
    else
        teleportBtn.Text = "🔴 CLICK TELEPORT: OFF"
        teleportBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Teleport DISABLED")
    end
end)

mouse.Button1Down:Connect(function()
    if teleportActive then
        teleportToMouse()
    end
end)

local jumpBtn = createButton(gameContent, "🔴 INFINITE JUMP: OFF", Color3.fromRGB(60, 60, 80))
jumpBtn.MouseButton1Click:Connect(function()
    mods.infiniteJump = not mods.infiniteJump
    if mods.infiniteJump then
        humanoid.JumpPower = 70
        jumpBtn.Text = "🟢 INFINITE JUMP: ON"
        jumpBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        humanoid.JumpPower = 50
        jumpBtn.Text = "🔴 INFINITE JUMP: OFF"
        jumpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(gameContent, "Jump Power", 30, 150, 70, function(val)
    humanoid.JumpPower = val
end)

-- ============ MOVEMENT TAB ============
local noclipBtn = createButton(moveContent, "🔴 NOCLIP: OFF", Color3.fromRGB(60, 60, 80))
noclipBtn.MouseButton1Click:Connect(function()
    mods.noclip = not mods.noclip
    if mods.noclip then
        if noclipConnection then noclipConnection:Disconnect() end
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            if mods.noclip and character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        noclipBtn.Text = "🟢 NOCLIP: ON"
        noclipBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if noclipConnection then noclipConnection:Disconnect() end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        noclipBtn.Text = "🔴 NOCLIP: OFF"
        noclipBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(moveContent, "Gravity", 0, 200, 50, function(val)
    workspace.Gravity = val * 2
end)

local resetGravityBtn = createButton(moveContent, "🌍 RESET GRAVITY", Color3.fromRGB(80, 80, 120))
resetGravityBtn.MouseButton1Click:Connect(function()
    workspace.Gravity = 98.1
    print("Gravity reset")
end)

-- ============ VISUAL TAB ============
local godBtn = createButton(visualContent, "🔴 GOD MODE: OFF", Color3.fromRGB(60, 60, 80))
godBtn.MouseButton1Click:Connect(function()
    mods.godMode = not mods.godMode
    if mods.godMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        godBtn.Text = "🟢 GOD MODE: ON"
        godBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        humanoid.MaxHealth = 100
        humanoid.Health = 100
        godBtn.Text = "🔴 GOD MODE: OFF"
        godBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

local healBtn = createButton(visualContent, "❤️ HEAL", Color3.fromRGB(80, 120, 80))
healBtn.MouseButton1Click:Connect(function()
    humanoid.Health = humanoid.MaxHealth
    print("Healed!")
end)

-- Speed Trail Button (NEW)
local trailBtn = createButton(visualContent, "🔴 SPEED TRAIL: OFF", Color3.fromRGB(60, 60, 80))
trailBtn.MouseButton1Click:Connect(function()
    mods.speedTrail = not mods.speedTrail
    if mods.speedTrail then
        trailObject = Instance.new("Trail")
        trailObject.Lifetime = 0.5
        trailObject.Color = ColorSequence.new(Color3.fromRGB(255, 100, 100))
        trailObject.Parent = rootPart
        trailBtn.Text = "🟢 SPEED TRAIL: ON"
        trailBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Speed Trail ENABLED")
    else
        if trailObject then trailObject:Destroy() end
        trailBtn.Text = "🔴 SPEED TRAIL: OFF"
        trailBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Speed Trail DISABLED")
    end
end)

local invisibleBtn = createButton(visualContent, "🔴 INVISIBLE: OFF", Color3.fromRGB(60, 60, 80))
invisibleBtn.MouseButton1Click:Connect(function()
    mods.invisible = not mods.invisible
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = mods.invisible and 1 or 0
            end
        end
    end
    invisibleBtn.Text = mods.invisible and "🟢 INVISIBLE: ON" or "🔴 INVISIBLE: OFF"
    invisibleBtn.BackgroundColor3 = mods.invisible and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
end)

createSlider(visualContent, "Transparency", 0, 1, 0, function(val)
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = val
            end
        end
    end
end)

local rainbowBtn = createButton(visualContent, "🔴 RAINBOW MODE: OFF", Color3.fromRGB(60, 60, 80))
rainbowBtn.MouseButton1Click:Connect(function()
    mods.rainbow = not mods.rainbow
    if mods.rainbow then
        local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255)}
        local idx = 1
        if rainbowConnection then rainbowConnection:Disconnect() end
        rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if mods.rainbow and character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = colors[idx % #colors + 1]
                    end
                end
                idx = idx + 1
                task.wait(0.1)
            end
        end)
        rainbowBtn.Text = "🟢 RAINBOW MODE: ON"
        rainbowBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if rainbowConnection then rainbowConnection:Disconnect() end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Color = Color3.fromRGB(255, 255, 255)
                end
            end
        end
        rainbowBtn.Text = "🔴 RAINBOW MODE: OFF"
        rainbowBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

-- ============ WORLD TAB ============
local killBtn = createButton(worldContent, "💀 KILL ALL PLAYERS", Color3.fromRGB(140, 60, 60))
killBtn.MouseButton1Click:Connect(function()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherChar = otherPlayer.Character
            if otherChar and otherChar:FindFirstChild("Humanoid") then
                otherChar.Humanoid.Health = 0
            end
        end
    end
    print("Killed all other players")
end)

local freezeBtn = createButton(worldContent, "🔴 FREEZE PLAYERS: OFF", Color3.fromRGB(60, 60, 80))
freezeBtn.MouseButton1Click:Connect(function()
    mods.freezePlayers = not mods.freezePlayers
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherChar = otherPlayer.Character
            if otherChar and otherChar:FindFirstChild("Humanoid") then
                otherChar.Humanoid.WalkSpeed = mods.freezePlayers and 0 or 16
            end
        end
    end
    freezeBtn.Text = mods.freezePlayers and "🟢 FREEZE PLAYERS: ON" or "🔴 FREEZE PLAYERS: OFF"
    freezeBtn.BackgroundColor3 = mods.freezePlayers and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
end)

local lightBtn = createButton(worldContent, "🔴 LIGHT MODE: OFF", Color3.fromRGB(60, 60, 80))
lightBtn.MouseButton1Click:Connect(function()
    if mods.nightMode then
        mods.nightMode = false
        nightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        nightBtn.Text = "🔴 NIGHT MODE: OFF"
    end
    mods.lightMode = not mods.lightMode
    local lighting = game:GetService("Lighting")
    if mods.lightMode then
        lighting.Brightness = 2
        lighting.ExposureCompensation = 2
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lightBtn.Text = "🟢 LIGHT MODE: ON"
        lightBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        lighting.Brightness = 1
        lighting.ExposureCompensation = 0
        lighting.Ambient = Color3.fromRGB(0, 0, 0)
        lightBtn.Text = "🔴 LIGHT MODE: OFF"
        lightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

local nightBtn = createButton(worldContent, "🔴 NIGHT MODE: OFF", Color3.fromRGB(60, 60, 80))
nightBtn.MouseButton1Click:Connect(function()
    if mods.lightMode then
        mods.lightMode = false
        lightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        lightBtn.Text = "🔴 LIGHT MODE: OFF"
    end
    mods.nightMode = not mods.nightMode
    local lighting = game:GetService("Lighting")
    if mods.nightMode then
        lighting.Brightness = 0.2
        lighting.ExposureCompensation = -2
        lighting.Ambient = Color3.fromRGB(0, 0, 0)
        nightBtn.Text = "🟢 NIGHT MODE: ON"
        nightBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        lighting.Brightness = 1
        lighting.ExposureCompensation = 0
        nightBtn.Text = "🔴 NIGHT MODE: OFF"
        nightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

-- ============ FLY MOVEMENT LOOP ============
game:GetService("RunService").Heartbeat:Connect(function()
    if mods.fly and bodyVel then
        local moveDir = Vector3.new(0, 0, 0)
        local cam = workspace.CurrentCamera
        local input = game:GetService("UserInputService")
        
        if input:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if input:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if input:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if input:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if input:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if input:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        
        if moveDir.Magnitude > 0 then
            bodyVel.Velocity = moveDir.Unit * flySpeed
        else
            bodyVel.Velocity = Vector3.new(0, 0, 0)
        end
    end
end)

-- ============ CHARACTER RESPAWN HANDLER ============
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    task.wait(0.5)
    
    if mods.superSpeed then
        humanoid.WalkSpeed = runSpeed
    end
    if mods.godMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
    end
    if mods.autoPlatform then
        if platformConnection then platformConnection:Disconnect() end
        platformConnection = humanoid.Jumping:Connect(function()
            spawnPlatform()
        end)
    end
    if mods.fly then
        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(1, 1, 1) * 100000
        bodyVel.Parent = rootPart
        humanoid.PlatformStand = true
    end
    if mods.speedTrail then
        trailObject = Instance.new("Trail")
        trailObject.Lifetime = 0.5
        trailObject.Color = ColorSequence.new(Color3.fromRGB(255, 100, 100))
        trailObject.Parent = rootPart
    end
end)

-- ============ TAB SWITCHING ============
local function switchTab(tab)
    gameContent.Visible = (tab == "game")
    moveContent.Visible = (tab == "move")
    visualContent.Visible = (tab == "visual")
    worldContent.Visible = (tab == "world")
    updateContent.Visible = (tab == "update")
    
    tab1.BackgroundColor3 = (tab == "game") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab2.BackgroundColor3 = (tab == "move") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab3.BackgroundColor3 = (tab == "visual") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab4.BackgroundColor3 = (tab == "world") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab5.BackgroundColor3 = (tab == "update") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
end

tab1.MouseButton1Click:Connect(function() switchTab("game") end)
tab2.MouseButton1Click:Connect(function() switchTab("move") end)
tab3.MouseButton1Click:Connect(function() switchTab("visual") end)
tab4.MouseButton1Click:Connect(function() switchTab("world") end)
tab5.MouseButton1Click:Connect(function() switchTab("update") end)

-- ============ KEYBOARD SHORTCUTS ============
game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if input.KeyCode == Enum.KeyCode.Insert then
        main.Visible = not main.Visible
    end
    
    if input.KeyCode == Enum.KeyCode.F then
        mods.fly = not mods.fly
        if mods.fly then
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.MaxForce = Vector3.new(1, 1, 1) * 100000
            bodyVel.Parent = rootPart
            humanoid.PlatformStand = true
            flyBtn.Text = "🟢 FLY: ON"
            flyBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        else
            if bodyVel then bodyVel:Destroy() end
            humanoid.PlatformStand = false
            flyBtn.Text = "🔴 FLY: OFF"
            flyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
    
    if input.KeyCode == Enum.KeyCode.G then
        mods.superSpeed = not mods.superSpeed
        if mods.superSpeed then
            originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = runSpeed
            speedBtn.Text = "🟢 SUPER SPEED: ON"
            speedBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        else
            humanoid.WalkSpeed = originalWalkSpeed
            speedBtn.Text = "🔴 SUPER SPEED: OFF"
            speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
end)

print("=== CONTROL PANEL v2.0 LOADED ===")
print("INSERT - Hide/Show Menu")
print("F - Toggle Fly")
print("G - Toggle Super Speed")
print("")
print("📢 NEW UPDATE TAB - Check out what's new!")
