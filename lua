-- attendre le joueur
local player = game.Players.LocalPlayer
repeat task.wait() until player
 
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
 
----------------
-- LOADING
----------------
 
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(0,420,0,140)
loadingFrame.Position = UDim2.new(0.5,-210,0.5,-70)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
 
local barBG = Instance.new("Frame", loadingFrame)
barBG.Size = UDim2.new(0,360,0,25)
barBG.Position = UDim2.new(0.5,-180,0.65,0)
barBG.BackgroundColor3 = Color3.fromRGB(20,20,20)
 
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
 
local text = Instance.new("TextLabel", loadingFrame)
text.Size = UDim2.new(1,0,0,40)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(255,255,255)
text.TextScaled = true
text.Text = "Loading 0/100"
 
-- loading ~20 secondes
for i = 1,100 do
    bar.Size = UDim2.new(i/100,0,1,0)
    text.Text = "Loading "..i.."/100"
    task.wait(0.2)
end
 
loadingFrame:Destroy()
 
----------------
-- MENU
----------------
 
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,260,0,220)
frame.Position = UDim2.new(0.5,-130,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.Active = true
frame.Draggable = true
 
local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0,8)
 
----------------
-- TOGGLES
----------------
 
local function createToggle(name)
 
    local button = Instance.new("TextButton")
    button.Parent = frame
    button.Size = UDim2.new(1,0,0,40)
    button.BackgroundColor3 = Color3.fromRGB(40,40,40)
    button.TextColor3 = Color3.new(1,1,1)
    button.TextScaled = true
 
    local state = false
    button.Text = name.." OFF"
 
    button.MouseButton1Click:Connect(function()
        state = not state
 
        if state then
            button.Text = name.." ON"
            button.BackgroundColor3 = Color3.fromRGB(0,150,0)
        else
            button.Text = name.." OFF"
            button.BackgroundColor3 = Color3.fromRGB(40,40,40)
        end
    end)
end
 
createToggle("Freeze")
createToggle("Auto Accept")
createToggle("Auto Farm Coins")
 
----------------
-- MESSAGE BAS
----------------
 
local info = Instance.new("TextLabel")
info.Parent = frame
info.Size = UDim2.new(1,0,0,30)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.fromRGB(200,200,200)
info.TextScaled = true
info.Text = "The freeze one is down rn working on it stay tunned !"
 
----------------
-- FLECHE HIDE
----------------
 
local hideButton = Instance.new("TextButton", frame)
hideButton.Size = UDim2.new(0,30,0,30)
hideButton.Position = UDim2.new(1,-35,0,5)
hideButton.Text = ">"
hideButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
hideButton.TextColor3 = Color3.new(1,1,1)
 
----------------
-- BOUTON OPEN
----------------
 
local openButton = Instance.new("TextButton", gui)
openButton.Size = UDim2.new(0,70,0,35)
openButton.Position = UDim2.new(0,20,0.5,0)
openButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
openButton.TextColor3 = Color3.new(1,1,1)
openButton.Text = "Open"
openButton.Visible = false
 
hideButton.MouseButton1Click:Connect(function()
    frame.Visible = false
    openButton.Visible = true
end)
 
openButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    openButton.Visible = false
end)
