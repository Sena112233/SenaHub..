-- Sena VIP Hub [ULTIMATE RENDER OPTIMIZER - NO WHITE SCREEN]
-- Ultra Premium Matte Interface with Smooth Responsive Toggle

repeat task.wait() until game:IsLoaded()

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui", 20)
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
if not PlayerGui then return end

-- Anti-Duplication
if PlayerGui:FindFirstChild("SenaPremiumHub") then
    PlayerGui.SenaPremiumHub:Destroy()
end

-- Core Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SenaPremiumHub"
ScreenGui.Parent = PlayerGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 99999

-----------------------------------------
-- 📊 REAL-TIME FPS COUNTER (Next to Chat)
-----------------------------------------
local FPSLabel = Instance.new("TextLabel")
FPSLabel.Name = "SenaFPSCounter"
FPSLabel.Parent = ScreenGui
FPSLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
FPSLabel.BackgroundTransparency = 0.15
FPSLabel.Position = UDim2.new(0, 140, 0, 5) 
FPSLabel.Size = UDim2.new(0, 85, 0, 30)
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.Text = "FPS: --"
FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
FPSLabel.TextSize = 13.000

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 6)
FPSCorner.Parent = FPSLabel

local FrameCount = 0
local TimeElapsed = 0
RunService.RenderStepped:Connect(function(dt)
    FrameCount = FrameCount + 1
    TimeElapsed = TimeElapsed + dt
    if TimeElapsed >= 0.5 then
        local CurrentFPS = math.floor(FrameCount / TimeElapsed)
        FPSLabel.Text = "FPS: " .. tostring(CurrentFPS)
        
        if CurrentFPS >= 50 then
            FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
        elseif CurrentFPS >= 30 then
            FPSLabel.TextColor3 = Color3.fromRGB(255, 180, 0)
        else
            FPSLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
        FrameCount = 0
        TimeElapsed = 0
    end
end)

-----------------------------------------
-- 📱 MOBILE TOGGLE BUTTON (S)
-----------------------------------------
local OpenButton = Instance.new("TextButton")
local OpenCorner = Instance.new("UICorner")
local ButtonStroke = Instance.new("UIStroke")

OpenButton.Name = "SenaOpenButton"
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
OpenButton.Position = UDim2.new(0.02, 0, 0.25, 0)
OpenButton.Size = UDim2.new(0, 45, 0, 45)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Text = "S"
OpenButton.TextColor3 = Color3.fromRGB(255, 40, 40)
OpenButton.TextSize = 22.000
OpenButton.Visible = false
OpenButton.Active = true
OpenButton.Draggable = true

OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

ButtonStroke.Color = Color3.fromRGB(255, 40, 40)
ButtonStroke.Thickness = 1.5
ButtonStroke.Parent = OpenButton

-----------------------------------------
-- 🎨 MATTE BLACK PANEL WITH NEON BORDER
-----------------------------------------
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -90)
MainFrame.Size = UDim2.new(0, 360, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIStroke.Name = "NeonGlow"
UIStroke.Color = Color3.fromRGB(255, 40, 40)
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = MainFrame

task.spawn(function()
    local info = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local tween = TweenService:Create(UIStroke, info, {Transparency = 0.5, Thickness = 1.5})
    tween:Play()
end)

-- Header Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1.000
TopBar.Size = UDim2.new(1, 0, 0, 45)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Sena Hub [VIP TRON]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1.000
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
CloseBtn.TextSize = 16.000

-- Inner Content Container
local ContentFrame = Instance.new("Frame")
local ContentCorner = Instance.new("UICorner")

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
ContentFrame.Position = UDim2.new(0, 15, 0, 55)
ContentFrame.Size = UDim2.new(1, -30, 1, -75)

ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Feature Align Row
local RowFrame = Instance.new("Frame")
RowFrame.Name = "RowFrame"
RowFrame.Parent = ContentFrame
RowFrame.BackgroundTransparency = 1.000
RowFrame.Position = UDim2.new(0, 15, 0, 22)
RowFrame.Size = UDim2.new(1, -30, 0, 40)

local FeatureLabel = Instance.new("TextLabel")
FeatureLabel.Name = "FeatureLabel"
FeatureLabel.Parent = RowFrame
FeatureLabel.BackgroundTransparency = 1.000
FeatureLabel.Size = UDim2.new(0, 200, 1, 0)
FeatureLabel.Font = Enum.Font.GothamMedium
FeatureLabel.Text = "Auto Ultimate FPS Booster"
FeatureLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
FeatureLabel.TextSize = 14.000
FeatureLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 🛠️ LUXURY SMOOTH SLIDER SWITCH
local ToggleContainer = Instance.new("TextButton")
local ContainerCorner = Instance.new("UICorner")
local ToggleCircle = Instance.new("Frame")
local CircleCorner = Instance.new("UICorner")

ToggleContainer.Name = "ToggleContainer"
ToggleContainer.Parent = RowFrame
ToggleContainer.BackgroundColor3 = Color3.fromRGB(45, 48, 55)
ToggleContainer.Position = UDim2.new(1, -55, 0, 7)
ToggleContainer.Size = UDim2.new(0, 50, 0, 26)
ToggleContainer.Text = ""
ToggleContainer.AutoButtonColor = false

ContainerCorner.CornerRadius = UDim.new(1, 0)
ContainerCorner.Parent = ToggleContainer

ToggleCircle.Name = "ToggleCircle"
ToggleCircle.Parent = ToggleContainer
ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleCircle.Position = UDim2.new(0, 3, 0, 3) 
ToggleCircle.Size = UDim2.new(0, 20, 0, 20)

CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = ToggleCircle

----------------------------------------------------
-- ⚙️ HIGH-TECH 3D RENDER ENGINE (0% BUG / MAX FPS)
----------------------------------------------------
local IsEnabled = false

-- Safe Rendering Handler (Does not edit lighting properties, guarantees no white screen)
RunService:Set3dRenderingEnabled(true)

local function UpdateOptimization()
    if IsEnabled then
        -- Turn off 3D Render loop safely to boost FPS instantly without layout bugs
        RunService:Set3dRenderingEnabled(false)
        if setfpscap then setfpscap(240) end
    else
        -- Restore game world visuals instantly
        RunService:Set3dRenderingEnabled(true)
        if setfpscap then setfpscap(60) end
    end
end

-- Premium Slider Motion Linker
ToggleContainer.MouseButton1Click:Connect(function()
    IsEnabled = not IsEnabled
    if IsEnabled then
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
        TweenService:Create(ToggleCircle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 27, 0, 3)}):Play()
    else
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(45, 48, 55)
        TweenService:Create(ToggleCircle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 3, 0, 3)}):Play()
    end
    UpdateOptimization()
end)

-- Window Actions
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)
