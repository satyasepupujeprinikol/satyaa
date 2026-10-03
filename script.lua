local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("SATT_Universal_GUI") then
    PlayerGui.SATT_Universal_GUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SATT_Universal_GUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 99999

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 16, 26)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 260, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 80, 255)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 0, 35)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "SATT UNIVERSAL"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 13

local ScrollList = Instance.new("ScrollingFrame")
ScrollList.Parent = MainFrame
ScrollList.BackgroundTransparency = 1
ScrollList.Position = UDim2.new(0, 10, 0, 40)
ScrollList.Size = UDim2.new(1, -20, 1, -50)
ScrollList.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollList.ScrollBarThickness = 3

local UIList = Instance.new("UIListLayout")
UIList.Parent = ScrollList
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 6)

local sattMenuList = {
    {DisplayName = "Default Egg", Target = "Egg", Color = Color3.fromRGB(200, 200, 200), Type = "Name"},
    {DisplayName = "Basic Egg", Target = "BasicEgg", Color = Color3.fromRGB(180, 180, 180), Type = "Name"},
    {DisplayName = "Common Egg", Target = "CommonEgg", Color3.fromRGB(150, 200, 150), Type = "Name"},
    {DisplayName = "Rare Egg", Target = "RareEgg", Color3.fromRGB(50, 150, 255), Type = "Name"},
    {DisplayName = "Epic Egg", Target = "EpicEgg", Color3.fromRGB(163, 53, 238), Type = "Name"},
    {DisplayName = "Legendary Egg", Target = "LegendaryEgg", Color3.fromRGB(255, 165, 0), Type = "Name"},
    {DisplayName = "Mythic Egg", Target = "MythicEgg", Color3.fromRGB(255, 69, 0), Type = "Name"},
    {DisplayName = "Secret Egg", Target = "SecretEgg", Color3.fromRGB(255, 0, 255), Type = "Name"},
    {DisplayName = "Godly Egg", Target = "GodlyEgg", Color3.fromRGB(255, 215, 0), Type = "Name"},
    {DisplayName = "Golden Egg", Target = "GoldenEgg", Color3.fromRGB(255, 230, 50), Type = "Name"},
    {DisplayName = "Diamond Egg", Target = "DiamondEgg", Color3.fromRGB(0, 255, 255), Type = "Name"},
    {DisplayName = "Void Egg", Target = "VoidEgg", Color3.fromRGB(110, 0, 180), Type = "Name"},
    {DisplayName = "Event Egg", Target = "EventEgg", Color3.fromRGB(0, 255, 120), Type = "Name"},
    {DisplayName = "Special Actor Egg", Target = "ActorEgg", Color3.fromRGB(255, 100, 150), Type = "Name"},
 
    {DisplayName = "DESERT: EggSpawns", Target = "workspace.Encounters.Zone09.EggSpawns", Color = Color3.fromRGB(255, 180, 50), Type = "Path"},
    {DisplayName = "RUINS: AnimalSpawn", Target = "workspace.Encounters.Zone09.AnimalSpawn", Color = Color3.fromRGB(100, 200, 255), Type = "Path"},
    {DisplayName = "LiveNests Target", Target = "workspace.Encounters.Zone09.EggSpawns.LiveNests", Color = Color3.fromRGB(0, 255, 120), Type = "Path"}
}

for _, item in ipairs(sattMenuList) do
    local btn = Instance.new("TextButton")
    btn.Parent = ScrollList
    btn.BackgroundColor3 = Color3.fromRGB(28, 24, 40)
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = "  " .. item.DisplayName
    btn.TextColor3 = item.Color
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    
    local status = Instance.new("TextLabel")
    status.Parent = btn
    status.BackgroundTransparency = 1
    status.Position = UDim2.new(1, -85, 0, 0)
    status.Size = UDim2.new(0, 75, 1, 0)
    status.Font = Enum.Font.GothamMedium
    status.Text = item.Type == "Path" and "Copy Path" or "Copy"
    status.TextColor3 = Color3.fromRGB(140, 140, 160)
    status.TextSize = 9
    status.TextXAlignment = Enum.TextXAlignment.Right
    
    btn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(item.Target)
            status.Text = "COPIED!"
            status.TextColor3 = Color3.fromRGB(0, 255, 100)
            
            task.delay(1.2, function()
                status.Text = item.Type == "Path" and "Copy Path" or "Copy"
                status.TextColor3 = Color3.fromRGB(140, 140, 160)
            end)
        else
            status.Text = "ERROR"
            status.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)
end

ScrollList.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y)
print("[SATT Universal] Full Features Loaded Successfully!")