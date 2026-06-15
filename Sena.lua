-- Sena VIP Hub [SAFE ULTIMATE FIX - NO WHITE SCREEN]
-- Clean Matte Interface, Stable Neon Borders & Safe FPS Engine

repeat task.wait() until game:IsLoaded()

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui", 20)
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
if not PlayerGui then return end

-- Prevent Multiple UI Instances
if PlayerGui:FindFirstChild("SenaPremiumHub") then
    PlayerGui.SenaPremiumHub:Destroy()
end

-- 1. Main Screen Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SenaPremiumHub"
ScreenGui.Parent = PlayerGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 99999

-----------------------------------------
-- 📊 ACCURATE FPS COUNTER (Next to Chat)
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
            FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 128) -- Green
        elseif CurrentFPS >= 30 then
            FPSLabel.TextColor3 = Color3.fromRGB(255, 180, 0) -- Yellow
        else
            FPSLabel.TextColor3 = Color3.fromRGB(255, 50, 50) -- Red
        end
        FrameCount = 0
        TimeElapsed = 0
    end
end)

-----------------------------------------
-- 📱 MOBILE TOGGLE FLOATING BUTTON (S)
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
-- 🎨 STABLE NEON RED GLOWING PANEL
-----------------------------------------
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18) -- Smooth Matte Style
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -90)
MainFrame.Size = UDim2.new(0, 360, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Premium Glowing Border Edge
UIStroke.Name = "NeonGlowBorder"
UIStroke.Color = Color3.fromRGB(255, 40, 40)
UIStroke.Thickness = 2
UIStroke.Transparency = 0
UIStroke.Parent = MainFrame

-- Smooth Glowing Aura Loop
task.spawn(function()
    local info = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local tween = TweenService:Create(UIStroke, info, {Transparency = 0.5, Thickness = 1.5})
    tween:Play()
end)

-- Top Panel Header Bar
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

-- Inside Content Base Container
local ContentFrame = Instance.new("Frame")
local ContentCorner = Instance.new("UICorner")

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
ContentFrame.Position = UDim2.new(0, 15, 0, 55)
ContentFrame.Size = UDim2.new(1, -30, 1, -75)

ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Feature Align Layer Row
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

-- 🛠️ LUXURY SMOOTH SLIDER SWITCH (100% FIXED)
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
-- ⚙️ 100% SAFE MOBILE OPTIMIZATION ENGINE (NO BUG)
----------------------------------------------------
local IsEnabled = false
local OriginalSettings = {}

local function SaveGameGraphics()
    pcall(function()
        OriginalSettings.QualityLevel = settings().Rendering.QualityLevel
        OriginalSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
        OriginalSettings.Objects = {}
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                OriginalSettings.Objects[obj] = {
                    Material = obj.Material,
                    CastShadow = obj.CastShadow
                }
            end
        end
    end)
end

local function TurnOnFPS()
    pcall(function()
        -- Safe Rendering Tweaks
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        game:GetService("Lighting").GlobalShadows = false
        
        -- Safe Materials Only (Does not delete maps or cause white/red screens)
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            end
        end
    end)
    if setfpscap then setfpscap(240) end
end

local function TurnOffFPS()
    pcall(function()
        settings().Rendering.QualityLevel = OriginalSettings.QualityLevel or Enum.QualityLevel.Automatic
        game:GetService("Lighting").GlobalShadows = OriginalSettings.GlobalShadows ~= false
        
        if OriginalSettings.Objects then
            for obj, props in pairs(OriginalSettings.Objects) do
                if obj and obj.Parent and obj:IsA("BasePart") then
                    obj.Material = props.Material
                    obj.CastShadow = props.CastShadow
                end
            end
        end
    end)
    if setfpscap then setfpscap(60) end
end

-- Smooth Toggle Motion Trigger
ToggleContainer.MouseButton1Click:Connect(function()
    IsEnabled = not IsEnabled
    if IsEnabled then
        SaveGameGraphics()
        TurnOnFPS()
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(255, 40, 40) -- Neon Red Switch Active
        TweenService:Create(ToggleCircle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 27, 0, 3)}):Play()
    else
        TurnOffFPS()
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(45, 48, 55) -- Dark Matte Idle
        TweenService:Create(ToggleCircle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 3, 0, 3)}):Play()
    end
end)

-- Window Interactive Triggers
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)
sEnabled = not IsEnabled
    if IsEnabled then
        SaveGameGraphics()
        TurnOnFPS()
        -- Smooth Toggle Motion Fix for Mobile
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(220, 30, 30) -- Neon Red Active Bar
        ToggleCircle:TweenPosition(UDim2.new(0, 27, 0, 3), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
    else
        TurnOffFPS()
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(55, 58, 65) -- Default Dark Off Bar
        ToggleCircle:TweenPosition(UDim2.new(0, 3, 0, 3), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
    end
end)

-- Structural Windows Triggers
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)
