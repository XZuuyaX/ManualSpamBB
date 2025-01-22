local a = game.Players.LocalPlayer
local b = a:WaitForChild("PlayerGui")

local c = Instance.new("ScreenGui", b)
c.ResetOnSpawn = false

local d = Instance.new("TextButton", c)
d.Size = UDim2.new(0, 100, 0, 50)
d.Position = UDim2.new(0, 10, 0, 10)
d.Text = "Open Menu"
d.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
d.TextColor3 = Color3.new(1, 1, 1)
d.Draggable = true

local e = Instance.new("Frame", c)
e.Size = UDim2.new(0, 200, 0, 300)
e.Position = UDim2.new(0, 10, 0, 70)
e.Visible = false
e.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
e.Draggable = true

local f = Instance.new("TextButton", e)
f.Size = UDim2.new(0, 180, 0, 50)
f.Position = UDim2.new(0, 10, 0, 10)
f.Text = "Unlock Position"
f.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
f.TextColor3 = Color3.new(1, 1, 1)

local g = Instance.new("TextButton", e)
g.Size = UDim2.new(0, 180, 0, 50)
g.Position = UDim2.new(0, 10, 0, 70)
g.Text = "Set Click Spot"
g.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
g.TextColor3 = Color3.new(1, 1, 1)

local h = Instance.new("TextBox", e)
h.Size = UDim2.new(0, 180, 0, 50)
h.Position = UDim2.new(0, 10, 0, 130)
h.PlaceholderText = "Click per detik"
h.Text = ""
h.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
h.TextColor3 = Color3.new(1, 1, 1)

local i = Instance.new("TextButton", e)
i.Size = UDim2.new(0, 180, 0, 50)
i.Position = UDim2.new(0, 10, 0, 190)
i.Text = "Show AutoClicker"
i.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
i.TextColor3 = Color3.new(1, 1, 1)

local j = Instance.new("TextButton", c)
j.Size = UDim2.new(0, 100, 0, 50)
j.Position = UDim2.new(0.5, -50, 0.5, -25)
j.Text = "Auto Click OFF"
j.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
j.TextColor3 = Color3.new(1, 1, 1)
j.Visible = false
j.Draggable = true

local k = Instance.new("TextLabel", j)
k.Size = UDim2.new(1, 0, 0.3, 0)
k.Position = UDim2.new(0, 0, -0.3, 0)
k.Text = "MadeByXZuuyaX"
k.TextScaled = true
k.BackgroundTransparency = 1
k.TextColor3 = Color3.new(1, 1, 1)

local l = false
local m = UDim2.new(0.5, 0, 0.5, 0)
local n = 1
local o = false

d.MouseButton1Click:Connect(function()
    e.Visible = not e.Visible
    d.Text = e.Visible and "Close Menu" or "Open Menu"
end)

f.MouseButton1Click:Connect(function()
    l = not l
    e.Active = not l
    j.Active = not l
    f.Text = l and "Lock Position" or "Unlock Position"
end)

g.MouseButton1Click:Connect(function()
    local p = game:GetService("UserInputService")
    local q
    local r = true

    g.Text = "Selecting Spot..."
    j.Visible = false

    q = p.InputBegan:Connect(function(s)
        if s.UserInputType == Enum.UserInputType.Touch and r then
            local t = s.Position
            m = UDim2.new(0, t.X, 0, t.Y)
            r = false
            g.Text = "Set Click Spot"
            j.Position = m
            j.Visible = true
            q:Disconnect()
        end
    end)
end)

h.FocusLost:Connect(function(u)
    if u then
        local v = tonumber(h.Text)
        if v and v > 0 then
            n = v
        else
            h.Text = "Invalid Input"
        end
    end
end)

i.MouseButton1Click:Connect(function()
    j.Visible = not j.Visible
    i.Text = j.Visible and "Hide AutoClicker" or "Show AutoClicker"
end)

j.MouseButton1Click:Connect(function()
    o = not o
    if o then
        j.Text = "Auto Click ON"
        j.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        spawn(function()
            while o do
                wait(1 / n)
                local w = game:GetService("VirtualInputManager")
                w:SendMouseButtonEvent(
                    m.X.Offset,
                    m.Y.Offset,
                    0,
                    true,
                    game,
                    1
                )
                w:SendMouseButtonEvent(
                    m.X.Offset,
                    m.Y.Offset,
                    0,
                    false,
                    game,
                    1
                )
            end
        end)
    else
        j.Text = "Auto Click OFF"
        j.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

local a = Instance.new("ScreenGui")
local b = Instance.new("Frame")
local c = Instance.new("TextLabel")
local d = Instance.new("TextLabel")
local e = Instance.new("UICorner")

a.Name = "PingFpsGUI"
a.Parent = game.CoreGui

b.Name = "PingFpsFrame"
b.Parent = a
b.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
b.BorderSizePixel = 2
b.BorderColor3 = Color3.fromRGB(255, 0, 0)
b.Size = UDim2.new(0, 150, 0, 50)
b.Position = UDim2.new(0, 10, 1, -60)

e.CornerRadius = UDim.new(0, 8)
e.Parent = b

c.Name = "PingLabel"
c.Parent = b
c.Text = "Ping: Loading..."
c.Size = UDim2.new(1, 0, 0.5, 0)
c.Position = UDim2.new(0, 0, 0, 0)
c.TextColor3 = Color3.fromRGB(255, 255, 255)
c.TextScaled = true
c.BackgroundTransparency = 1

d.Name = "FpsLabel"
d.Parent = b
d.Text = "FPS: Loading..."
d.Size = UDim2.new(1, 0, 0.5, 0)
d.Position = UDim2.new(0, 0, 0.5, 0)
d.TextColor3 = Color3.fromRGB(255, 255, 255)
d.TextScaled = true
d.BackgroundTransparency = 1

local function f()
    while true do
        local g = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        c.Text = "Ping: " .. g .. " ms"
        wait(1)
    end
end

local function h()
    local i = 0
    local j = 0
    local k = tick()

    while true do
        j = j + 1
        local l = tick()

        if l - k >= 1 then
            i = j
            d.Text = "FPS: " .. i
            j = 0
            k = l
        end
        wait(0.03)
    end
end

spawn(f)
spawn(h)
