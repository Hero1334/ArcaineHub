
local StandGui = {}
local UILIB ={}
local self = setmetatable({}, UILIB)
if game["CoreGui"]:FindFirstChild("StandGui") then
game:GetService("Debris"):AddItem(game["CoreGui"]:FindFirstChild("StandGui"),1)
task.wait(2.5)
StandGui["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
StandGui["1"]["IgnoreGuiInset"] = true;
StandGui["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
StandGui["1"]["Name"] = [[StandGui]];
StandGui["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
else
StandGui["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
StandGui["1"]["IgnoreGuiInset"] = true;
StandGui["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
StandGui["1"]["Name"] = [[StandGui]];
StandGui["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
end

StandGui["2"] = Instance.new("Frame",StandGui["1"]);
StandGui["2"]["Size"] = UDim2.new(0,175,0,230);
StandGui["2"]["Position"] = UDim2.new(0,30,0,80);
StandGui["2"]["BackgroundColor3"] = Color3.new(.55,0,.55);
StandGui["2"]["Active"] = true
StandGui["2"]["Draggable"] = true

StandGui["3"] = Instance.new("UICorner",StandGui["2"]);
StandGui["3"]["CornerRadius"] = UDim.new(0,20,0,8);

StandGui["4"] = Instance.new("ScrollingFrame",StandGui["2"]);
StandGui["4"]["Position"] = UDim2.new(0,14,0,30);
StandGui["4"]["Size"] = UDim2.new(0,150,0,180);
StandGui["4"]["BackgroundColor3"] = Color3.new(.5,0,.5);
StandGui["4"]["Active"] = true;
StandGui["4"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;

StandGui["5"] = Instance.new("UIGridLayout");
StandGui["5"]["Parent"] = StandGui["4"];
StandGui["5"]["CellPadding"] = UDim2.new(0,30,0,12);
StandGui["5"]["CellSize"] = UDim2.new(0,145,0,25);
--UIGridLayout.FillDirectionMaxCells = 1
StandGui["2b"] = Instance.new("Frame",StandGui["2"])
StandGui["2b"]["Active"] = false
--StandGui["2b"]["Draggable"] = true
StandGui["2b"]["Size"] = UDim2.new(0,175,0,25)

StandGui["2b"]["BackgroundColor"] = StandGui["2"]["BackgroundColor"]
StandGui["3b"] = StandGui["3"]:Clone()
StandGui["3b"]["Parent"] = StandGui["2b"]

StandGui["6"] = Instance.new("TextButton",StandGui["2b"]);
StandGui["6"]["BackgroundTransparency"] = 1;
StandGui["6"]["Size"] = UDim2.new(0,40,0,20);
StandGui["6"]["Text"] = [[-]]
StandGui["6"]["Position"] = UDim2.new(0,105,0,7)
StandGui["6"]["TextScaled"] = [[true]]
StandGui["6"]["TextColor"] = BrickColor.new(255,255,255)
StandGui["6"]["TextWrapped"] = [[true]]


local GuiActive = true
StandGui["6"].MouseButton1Click:Connect(function()
if GuiActive then
GuiActive = false
StandGui["6"]["Text"] = [[+]]
StandGui["2"]["BackgroundTransparency"] = 1
StandGui["4"]["Visible"] = false

else
GuiActive = true
StandGui["6"]["Text"] = [[-]]
StandGui["2"]["BackgroundTransparency"] = 0
StandGui["4"]["Visible"] = true
--StandGui["2b"]["Active"] = false
--StandGui["2"]["Position"] = StandGui["2b"]["Position"]
end
end)

function self.NewButton(name, callback)
local ScrollingFrame = game["CoreGui"]:FindFirstChild("StandGui").Frame:FindFirstChild("ScrollingFrame")
local Button1 = Instance.new("TextButton")
if not ScrollingFrame then Warn("ScrollingFrame not Found") return end
Button1.Parent = ScrollingFrame
Button1.Font = Enum.Font.SourceSans
Button1.TextScaled = true
Button1.TextWrapped = true
Button1.Text = name
Button1.BackgroundColor3 = Color3.new(1.6,0,.6)
local UICorner = Instance.new("UICorner",Button1)
UICorner.CornerRadius = UDim.new(0,45,0,8)
Button1.MouseButton1Click:Connect(callback)
end
