getgenv().values = {}  
local library = {} 
local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Signal.lua"))() 
local ConfigSave = Signal.new("ConfigSave") 
local ConfigLoad = Signal.new("ConfigLoad") 

local txt = game:GetService("TextService")
local TweenService = game:GetService("TweenService") 
function library:Tween(...) TweenService:Create(...):Play() end 
local cfglocation = "DOOMHVH/" 
makefolder("DOOMHVH") 


-- caching 
local Vec2 = Vector2.new 
local Vec3 = Vector3.new 
local CF = CFrame.new 
local INST = Instance.new 
local COL3 = Color3.new 
local COL3RGB = Color3.fromRGB 
local COL3HSV = Color3.fromHSV 
local CLAMP = math.clamp 
local DEG = math.deg 
local FLOOR = math.floor 
local ACOS = math.acos 
local RANDOM = math.random 
local ATAN2 = math.atan2 
local HUGE = math.huge 
local RAD = math.rad 
local MIN = math.min 
local POW = math.pow 
local UDIM2 = UDim2.new 
local CFAngles = CFrame.Angles 

local FIND = string.find -- doom#1337
local LEN = string.len -- doom#1337
local SUB = string.sub -- doom#1337
local GSUB = string.gsub -- doom#1337
local RAY = Ray.new -- doom#1337

local INSERT = table.insert -- doom#1337
local TBLFIND = table.find -- doom#1337
local TBLREMOVE = table.remove -- doom#1337
local TBLSORT = table.sort -- doom#1337

-- i see those pastes lying around
																																																																												-- Bad 9672 & WetIDreamz 0001 & zeox 9999												

function rgbtotbl(rgb) -- doom#1337
	return {R = rgb.R, G = rgb.G, B = rgb.B} -- doom#1337
end -- doom#1337
function tbltorgb(tbl) -- doom#1337
	return COL3(tbl.R, tbl.G, tbl.B) -- doom#1337
end -- doom#1337
local function deepCopy(original) -- doom#1337
	local copy = {} -- doom#1337
	for k, v in pairs(original) do -- doom#1337
		if type(v) == "table" then -- doom#1337
			v = deepCopy(v) -- doom#1337
		end -- doom#1337
		copy[k] = v -- doom#1337
	end -- doom#1337
	return copy -- doom#1337
end -- doom#1337
function library:ConfigFix(cfg) -- doom#1337
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg..".txt")) -- doom#1337
	for i,Tabs in pairs(copy) do -- doom#1337
		for i,Sectors in pairs(Tabs) do -- doom#1337
			for i,Elements in pairs(Sectors) do -- doom#1337
				if Elements.Color ~= nil then -- doom#1337
					local a = Elements.Color -- doom#1337
					Elements.Color = tbltorgb(a) -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	return copy -- doom#1337
end -- doom#1337
function library:SaveConfig(cfg) -- doom#1337
	local copy = deepCopy(values) -- doom#1337
	for i,Tabs in pairs(copy) do -- doom#1337
		for i,Sectors in pairs(Tabs) do -- doom#1337
			for i,Elements in pairs(Sectors) do -- doom#1337
				if Elements.Color ~= nil then -- doom#1337
					Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B} -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	writefile(cfglocation..cfg..".txt", game:GetService("HttpService"):JSONEncode(copy)) -- doom#1337
end -- doom#1337

function library:New(name) -- doom#1337
	local menu = {} -- doom#1337

	local Ova = INST("ScreenGui") -- doom#1337
	local Menu = INST("ImageLabel") -- doom#1337
	local TextLabel = INST("TextLabel") -- doom#1337
	local TabButtons = INST("Frame") -- doom#1337
	local UIListLayout = INST("UIListLayout") -- doom#1337
	local Tabs = INST("Frame") -- doom#1337

	Ova.Name = "electric boogalo" -- doom#1337
	Ova.ResetOnSpawn = false -- doom#1337
	Ova.ZIndexBehavior = "Global" -- doom#1337
	Ova.DisplayOrder = 420133769 -- doom#1337

	local UIScale = INST("UIScale") -- doom#1337
	UIScale.Parent = Ova -- doom#1337

	function menu:SetScale(scale) -- doom#1337
		UIScale.Scale = scale -- doom#1337
	end -- doom#1337

	local but = INST("TextButton") -- doom#1337
	but.Modal = true -- doom#1337
	but.Text = "" -- doom#1337
	but.BackgroundTransparency = 1 -- doom#1337
	but.Parent = Ova -- doom#1337

	local cursor = INST("ImageLabel") -- doom#1337
	cursor.Name = "cursor" -- doom#1337
	cursor.Parent = Ova -- doom#1337
	cursor.BackgroundTransparency = 1 -- doom#1337
	cursor.Size = UDIM2(0,17,0,17) -- doom#1337
	cursor.Image = "rbxassetid://518398610" -- doom#1337
	cursor.ZIndex = 1000 -- doom#1337
	cursor.ImageColor3 = COL3RGB(255,255,255) -- doom#1337

	local Players = game:GetService("Players") -- doom#1337
	local LocalPlayer = Players.LocalPlayer -- doom#1337
	local Mouse = LocalPlayer:GetMouse() -- doom#1337

	game:GetService("RunService").RenderStepped:connect(function() -- doom#1337
		cursor.Visible = Ova.Enabled -- doom#1337
		cursor.Position = UDIM2(0,Mouse.X-3,0,Mouse.Y+1) -- doom#1337
	end) -- doom#1337

	Menu.Name = "Menu" -- doom#1337
	Menu.Parent = Ova -- doom#1337
	Menu.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
	Menu.Position = UDIM2(0.5, -300, 0.5, -300) -- doom#1337
	Menu.Size = UDIM2(0, 600, 0, 610) -- doom#1337
	Menu.Image = "http://www.roblox.com/asset/?id=7265208537" -- doom#1337
	Menu.BorderSizePixel = 0 -- doom#1337

	library.uiopen = true -- doom#1337

	game:GetService("UserInputService").InputBegan:Connect(function(key) -- doom#1337
		if key.KeyCode == Enum.KeyCode.Insert then -- doom#1337
			Ova.Enabled = not Ova.Enabled -- doom#1337
			library.uiopen = Ova.Enabled -- doom#1337
		end -- doom#1337
	end) -- doom#1337

	local KeybindList = INST("ScreenGui") -- doom#1337
	do -- doom#1337
		local TextLabel = INST("TextLabel") -- doom#1337
		local Frame = INST("Frame") -- doom#1337
		local UIListLayout = INST("UIListLayout") -- doom#1337

		KeybindList.Name = "KeybindList" -- doom#1337
		KeybindList.ZIndexBehavior = Enum.ZIndexBehavior.Global -- doom#1337
		KeybindList.Enabled = false -- doom#1337

		TextLabel.Parent = KeybindList -- doom#1337
		TextLabel.BackgroundColor3 = COL3RGB(30, 30, 39) -- doom#1337
		TextLabel.BorderColor3 = COL3RGB(255, 37, 110) -- doom#1337
		TextLabel.Position = UDIM2(0, 1, 0.300000012, 0) -- doom#1337
		TextLabel.Size = UDIM2(0, 155, 0, 24) -- doom#1337
		TextLabel.ZIndex = 2 -- doom#1337
		TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
		TextLabel.Text = "keybinds" -- doom#1337
		TextLabel.TextColor3 = COL3RGB(255, 37, 110) -- doom#1337
		TextLabel.TextSize = 14.000 -- doom#1337

		Frame.Parent = TextLabel -- doom#1337
		Frame.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
		Frame.BackgroundTransparency = 1.000 -- doom#1337
		Frame.Position = UDIM2(0, 0, 1, 1) -- doom#1337
		Frame.Size = UDIM2(1, 0, 1, 0) -- doom#1337

		UIListLayout.Parent = Frame -- doom#1337
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

		KeybindList.Parent = game.CoreGui -- doom#1337
	end -- doom#1337

	function keybindadd(text) -- doom#1337
		if not KeybindList.TextLabel.Frame:FindFirstChild(text) then -- doom#1337
			local TextLabel = INST("TextLabel") -- doom#1337
			TextLabel.BackgroundColor3 = COL3RGB(30, 30, 39) -- doom#1337
			TextLabel.BorderColor3 = COL3RGB(255, 37, 110) -- doom#1337
			TextLabel.BorderSizePixel = 0 -- doom#1337
			TextLabel.Size = UDIM2(0, 155, 0, 24) -- doom#1337
			TextLabel.ZIndex = 2 -- doom#1337
			TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
			TextLabel.Text = text -- doom#1337
			TextLabel.TextColor3 = COL3RGB(255, 255, 255) -- doom#1337
			TextLabel.TextSize = 14.000 -- doom#1337
			TextLabel.Name = text -- doom#1337
			TextLabel.Parent = KeybindList.TextLabel.Frame -- doom#1337
		end -- doom#1337
	end -- doom#1337

	function keybindremove(text) -- doom#1337
		if KeybindList.TextLabel.Frame:FindFirstChild(text) then -- doom#1337
			KeybindList.TextLabel.Frame:FindFirstChild(text):Destroy() -- doom#1337
		end -- doom#1337
	end -- doom#1337

	function library:SetKeybindVisible(Joe) -- doom#1337
		KeybindList.Enabled = Joe -- doom#1337
	end -- doom#1337

	library.dragging = false -- doom#1337
	do -- doom#1337
		local UserInputService = game:GetService("UserInputService") -- doom#1337
		local a = Menu -- doom#1337
		local dragInput -- doom#1337
		local dragStart -- doom#1337
		local startPos -- doom#1337
		local function update(input) -- doom#1337
			local delta = input.Position - dragStart -- doom#1337
			a.Position = UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) -- doom#1337
		end -- doom#1337
		a.InputBegan:Connect(function(input) -- doom#1337
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then -- doom#1337
				library.dragging = true -- doom#1337
				dragStart = input.Position -- doom#1337
				startPos = a.Position -- doom#1337

				input.Changed:Connect(function() -- doom#1337
					if input.UserInputState == Enum.UserInputState.End then -- doom#1337
						library.dragging = false -- doom#1337
					end -- doom#1337
				end) -- doom#1337
			end -- doom#1337
		end) -- doom#1337
		a.InputChanged:Connect(function(input) -- doom#1337
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then -- doom#1337
				dragInput = input -- doom#1337
			end -- doom#1337
		end) -- doom#1337
		UserInputService.InputChanged:Connect(function(input) -- doom#1337
			if input == dragInput and library.dragging then -- doom#1337
				update(input) -- doom#1337
			end -- doom#1337
		end) -- doom#1337
	end -- doom#1337

	TextLabel.Parent = Menu -- doom#1337
	TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
	TextLabel.BackgroundTransparency = 1 -- doom#1337
	TextLabel.Position = UDIM2(0, 7, 0, 0) -- doom#1337
	TextLabel.Size = UDIM2(0, 0, 0, 29) -- doom#1337
	TextLabel.Size = UDIM2(0, txt:GetTextSize(name, 15, Enum.Font.SourceSansSemibold, Vec2(700, TextLabel.AbsoluteSize.Y)).X, 0, 29) -- doom#1337
	TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
	TextLabel.Text = name -- doom#1337
	TextLabel.TextColor3 = COL3RGB(255, 255, 255) -- doom#1337
	TextLabel.TextSize = 15.000 -- doom#1337
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

	TabButtons.Name = "TabButtons" -- doom#1337
	TabButtons.Parent = Menu -- doom#1337
	TabButtons.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
	TabButtons.BackgroundTransparency = 1 -- doom#1337
	TabButtons.Position = UDIM2(TextLabel.Size.X.Scale, TextLabel.Size.X.Offset+10, 0, 0) -- doom#1337
	TabButtons.Size = UDIM2(TextLabel.Size.X.Scale, 590-TextLabel.Size.X.Offset, 0, 29) -- doom#1337

	UIListLayout.Parent = TabButtons -- doom#1337
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal -- doom#1337
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center -- doom#1337

	Tabs.Name = "Tabs" -- doom#1337
	Tabs.Parent = Menu -- doom#1337
	Tabs.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
	Tabs.BackgroundTransparency = 1.000 -- doom#1337
	Tabs.Position = UDIM2(0, 0, 0, 32) -- doom#1337
	Tabs.Size = UDIM2(0, 600, 0, 568) -- doom#1337

	local first = true -- doom#1337
	local currenttab -- doom#1337

	function menu:Tab(text) -- doom#1337
		local tabname -- doom#1337
		tabname = text -- doom#1337
		local Tab = {} -- doom#1337
		values[tabname] = {} -- doom#1337

		local TextButton = INST("TextButton") -- doom#1337
		TextButton.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
		TextButton.BackgroundTransparency = 1 -- doom#1337
		TextButton.Size = UDIM2(0, txt:GetTextSize(text, 15, Enum.Font.SourceSansSemibold, Vec2(700,700)).X+12, 1, 0) -- doom#1337
		TextButton.Font = Enum.Font.SourceSansSemibold -- doom#1337
		TextButton.Text = text -- doom#1337
		TextButton.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
		TextButton.TextSize = 15.000 -- doom#1337
		TextButton.Parent = TabButtons -- doom#1337

		local TabGui = INST("Frame") -- doom#1337
		local Left = INST("Frame") -- doom#1337
		local UIListLayout = INST("UIListLayout") -- doom#1337
		local Right = INST("Frame") -- doom#1337
		local UIListLayout_2 = INST("UIListLayout") -- doom#1337

		TabGui.Name = "TabGui" -- doom#1337
		TabGui.Parent = Tabs -- doom#1337
		TabGui.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
		TabGui.BackgroundTransparency = 1.000 -- doom#1337
		TabGui.Size = UDIM2(1, 0, 1, 0) -- doom#1337
		TabGui.Visible = false -- doom#1337

		Left.Name = "Left" -- doom#1337
		Left.Parent = TabGui -- doom#1337
		Left.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
		Left.BackgroundTransparency = 1.000 -- doom#1337
		Left.Position = UDIM2(0, 15, 0, 11) -- doom#1337
		Left.Size = UDIM2(0, 279, 0, 543) -- doom#1337

		UIListLayout.Parent = Left -- doom#1337
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
		UIListLayout.Padding = UDim.new(0, 10) -- doom#1337

		Right.Name = "Right" -- doom#1337
		Right.Parent = TabGui -- doom#1337
		Right.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
		Right.BackgroundTransparency = 1.000 -- doom#1337
		Right.Position = UDIM2(0, 303, 0, 11) -- doom#1337
		Right.Size = UDIM2(0, 279, 0, 543) -- doom#1337

		UIListLayout_2.Parent = Right -- doom#1337
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
		UIListLayout_2.Padding = UDim.new(0, 10) -- doom#1337

		if first then -- doom#1337
			TextButton.TextColor3 = COL3RGB(255, 255, 255) -- doom#1337
			currenttab = text -- doom#1337
			TabGui.Visible = true -- doom#1337
			first = false -- doom#1337
		end -- doom#1337

		TextButton.MouseButton1Down:Connect(function() -- doom#1337
			if currenttab ~= text then -- doom#1337
				for i,v in pairs(TabButtons:GetChildren()) do -- doom#1337
					if v:IsA("TextButton") then -- doom#1337
						library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
					end -- doom#1337
				end -- doom#1337
				for i,v in pairs(Tabs:GetChildren()) do -- doom#1337
					v.Visible = false -- doom#1337
				end -- doom#1337
				library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
				currenttab = text -- doom#1337
				TabGui.Visible = true -- doom#1337
			end -- doom#1337
		end) -- doom#1337

		function Tab:MSector(text, side) -- doom#1337
			local sectorname = text -- doom#1337
			local MSector = {} -- doom#1337
			values[tabname][text] = {} -- doom#1337


			local Section = INST("Frame") -- doom#1337
			local SectionText = INST("TextLabel") -- doom#1337
			local Inner = INST("Frame") -- doom#1337
			local sectiontabs = INST("Frame") -- doom#1337
			local UIListLayout_2 = INST("UIListLayout") -- doom#1337

			Section.Name = "Section" -- doom#1337
			Section.Parent = TabGui[side] -- doom#1337
			Section.BackgroundColor3 = COL3RGB(27, 27, 35) -- doom#1337
			Section.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
			Section.BorderSizePixel = 0 -- doom#1337
			Section.Size = UDIM2(1, 0, 0, 33) -- doom#1337

			SectionText.Name = "SectionText" -- doom#1337
			SectionText.Parent = Section -- doom#1337
			SectionText.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
			SectionText.BackgroundTransparency = 1.000 -- doom#1337
			SectionText.Position = UDIM2(0, 7, 0, -12) -- doom#1337
			SectionText.Size = UDIM2(0, 270, 0, 19) -- doom#1337
			SectionText.ZIndex = 2 -- doom#1337
			SectionText.Font = Enum.Font.SourceSansSemibold -- doom#1337
			SectionText.Text = text -- doom#1337
			SectionText.TextColor3 = COL3RGB(255, 255, 255) -- doom#1337
			SectionText.TextSize = 15.000 -- doom#1337
			SectionText.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

			Inner.Name = "Inner" -- doom#1337
			Inner.Parent = Section -- doom#1337
			Inner.BackgroundColor3 = COL3RGB(30, 30, 39) -- doom#1337
			Inner.BorderColor3 = COL3RGB(0, 0, 0) -- doom#1337
			Inner.BorderSizePixel = 0 -- doom#1337
			Inner.Position = UDIM2(0, 1, 0, 1) -- doom#1337
			Inner.Size = UDIM2(1, -2, 1, -9) -- doom#1337

			sectiontabs.Name = "sectiontabs" -- doom#1337
			sectiontabs.Parent = Section -- doom#1337
			sectiontabs.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
			sectiontabs.BackgroundTransparency = 1.000 -- doom#1337
			sectiontabs.Position = UDIM2(0, 0, 0, 6) -- doom#1337
			sectiontabs.Size = UDIM2(1, 0, 0, 22) -- doom#1337

			UIListLayout_2.Parent = sectiontabs -- doom#1337
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal -- doom#1337
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
			UIListLayout_2.Padding = UDim.new(0,4) -- doom#1337

			local firs = true -- doom#1337
			local selected -- doom#1337
			function MSector:Tab(text) -- doom#1337
				local tab = {} -- doom#1337
				values[tabname][sectorname][text] = {} -- doom#1337
				local tabtext = text -- doom#1337

				local tabsize = UDIM2(1, 0, 0, 44) -- doom#1337

				local tab1 = INST("Frame") -- doom#1337
				local UIPadding = INST("UIPadding") -- doom#1337
				local UIListLayout = INST("UIListLayout") -- doom#1337
				local TextButton = INST("TextButton") -- doom#1337

				tab1.Name = text -- doom#1337
				tab1.Parent = Inner -- doom#1337
				tab1.BackgroundColor3 = COL3RGB(30, 30, 39) -- doom#1337
				tab1.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
				tab1.BorderSizePixel = 0 -- doom#1337
				tab1.Position = UDIM2(0, 0, 0, 30) -- doom#1337
				tab1.Size = UDIM2(1, 0, 1, -21) -- doom#1337
				tab1.Name = text -- doom#1337
				tab1.Visible = false -- doom#1337

				UIPadding.Parent = tab1 -- doom#1337
				UIPadding.PaddingTop = UDim.new(0, 0) -- doom#1337

				UIListLayout.Parent = tab1 -- doom#1337
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
				UIListLayout.Padding = UDim.new(0, 1) -- doom#1337

				TextButton.Parent = sectiontabs -- doom#1337
				TextButton.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
				TextButton.BackgroundTransparency = 1.000 -- doom#1337
				TextButton.Size = UDIM2(0, txt:GetTextSize(text, 14, Enum.Font.SourceSansSemibold, Vec2(700,700)).X + 2, 1, 0) -- doom#1337
				TextButton.Font = Enum.Font.SourceSansSemibold -- doom#1337
				TextButton.Text = text -- doom#1337
				TextButton.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
				TextButton.TextSize = 14.000 -- doom#1337
				TextButton.Name = text -- doom#1337

				TextButton.MouseButton1Down:Connect(function() -- doom#1337
					for i,v in pairs(Inner:GetChildren()) do -- doom#1337
						v.Visible = false -- doom#1337
					end -- doom#1337
					for i,v in pairs(sectiontabs:GetChildren()) do -- doom#1337
						if v:IsA("TextButton") then -- doom#1337
							library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)}) -- doom#1337
						end -- doom#1337
					end -- doom#1337
					Section.Size = tabsize -- doom#1337
					tab1.Visible = true -- doom#1337
					library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
				end) -- doom#1337

				function tab:Element(type, text, data, callback) -- doom#1337
					local Element = {} -- doom#1337
					data = data or {} -- doom#1337
					callback = callback or function() end -- doom#1337
					values[tabname][sectorname][tabtext][text] = {} -- doom#1337

					if type == "Jumbobox" then -- doom#1337
						tabsize = tabsize + UDIM2(0,0,0, 39) -- doom#1337
						Element.value = {Jumbobox = {}} -- doom#1337
						data.options = data.options or {} -- doom#1337

						local Dropdown = INST("Frame") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337
						local Drop = INST("ScrollingFrame") -- doom#1337
						local Button_2 = INST("TextButton") -- doom#1337
						local TextLabel_2 = INST("TextLabel") -- doom#1337
						local UIListLayout = INST("UIListLayout") -- doom#1337
						local ImageLabel = INST("ImageLabel") -- doom#1337
						local TextLabel_3 = INST("TextLabel") -- doom#1337

						Dropdown.Name = "Dropdown" -- doom#1337
						Dropdown.Parent = tab1 -- doom#1337
						Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Dropdown.BackgroundTransparency = 1.000 -- doom#1337
						Dropdown.Position = UDIM2(0, 0, 0.255102038, 0) -- doom#1337
						Dropdown.Size = UDIM2(1, 0, 0, 39) -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Dropdown -- doom#1337
						Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
						Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
						Button.AutoButtonColor = false -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
						TextLabel.Position = UDIM2(0, 5, 0, 0) -- doom#1337
						TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = "..." -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						local abcd = TextLabel -- doom#1337

						Drop.Name = "Drop" -- doom#1337
						Drop.Parent = Button -- doom#1337
						Drop.Active = true -- doom#1337
						Drop.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Drop.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Drop.Position = UDIM2(0, 0, 1, 1) -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 20) -- doom#1337
						Drop.Visible = false -- doom#1337
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
						Drop.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
						Drop.ScrollBarThickness = 4 -- doom#1337
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
						Drop.AutomaticCanvasSize = "Y" -- doom#1337
						Drop.ZIndex = 5 -- doom#1337
						Drop.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

						UIListLayout.Parent = Drop -- doom#1337
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						local num = #data.options -- doom#1337
						if num > 5 then -- doom#1337
							Drop.Size = UDIM2(1, 0, 0, 85) -- doom#1337
						else -- doom#1337
							Drop.Size = UDIM2(1, 0, 0, 17*num) -- doom#1337
						end -- doom#1337
						local first = true -- doom#1337

						local function updatetext() -- doom#1337
							local old = {} -- doom#1337
							for i,v in ipairs(data.options) do -- doom#1337
								if TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
									INSERT(old, v) -- doom#1337
								else -- doom#1337
								end -- doom#1337
							end -- doom#1337
							local str = "" -- doom#1337


							if #old == 0 then -- doom#1337
								str = "..." -- doom#1337
							else -- doom#1337
								if #old == 1 then -- doom#1337
									str = old[1] -- doom#1337
								else -- doom#1337
									for i,v in ipairs(old) do -- doom#1337
										if i == 1 then -- doom#1337
											str = v -- doom#1337
										else -- doom#1337
											if i > 2 then -- doom#1337
												if i < 4 then -- doom#1337
													str = str..",  ..." -- doom#1337
												end -- doom#1337
											else -- doom#1337
												str = str..",  "..v -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337

							abcd.Text = str -- doom#1337
						end -- doom#1337
						for i,v in ipairs(data.options) do -- doom#1337
							do -- doom#1337
								local Button = INST("TextButton") -- doom#1337
								local TextLabel = INST("TextLabel") -- doom#1337

								Button.Name = v -- doom#1337
								Button.Parent = Drop -- doom#1337
								Button.BackgroundColor3 = COL3RGB(35, 35, 47) -- doom#1337
								Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
								Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
								Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
								Button.AutoButtonColor = false -- doom#1337
								Button.Font = Enum.Font.SourceSans -- doom#1337
								Button.Text = "" -- doom#1337
								Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
								Button.TextSize = 14.000 -- doom#1337
								Button.BorderSizePixel = 0 -- doom#1337
								Button.ZIndex = 6 -- doom#1337

								TextLabel.Parent = Button -- doom#1337
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
								TextLabel.BackgroundTransparency = 1.000 -- doom#1337
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
								TextLabel.Position = UDIM2(0, 5, 0, -1) -- doom#1337
								TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
								TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
								TextLabel.Text = v -- doom#1337
								TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
								TextLabel.TextSize = 14.000 -- doom#1337
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
								TextLabel.ZIndex = 6 -- doom#1337

								Button.MouseButton1Down:Connect(function() -- doom#1337
									if TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
										for i,a in pairs(Element.value.Jumbobox) do -- doom#1337
											if a == v then -- doom#1337
												TBLREMOVE(Element.value.Jumbobox, i) -- doom#1337
											end -- doom#1337
										end -- doom#1337
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
									else -- doom#1337
										INSERT(Element.value.Jumbobox, v) -- doom#1337
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(175, 42, 86)}) -- doom#1337
									end -- doom#1337
									updatetext() -- doom#1337

									values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
									callback(Element.value) -- doom#1337
								end) -- doom#1337
								Button.MouseEnter:Connect(function() -- doom#1337
									if not TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
									end -- doom#1337
								end) -- doom#1337
								Button.MouseLeave:Connect(function() -- doom#1337
									if not TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
									end -- doom#1337
								end) -- doom#1337

								first = false -- doom#1337
							end -- doom#1337
						end -- doom#1337
						function Element:SetValue(val) -- doom#1337
							Element.value = val -- doom#1337
							for i,v in pairs(Drop:GetChildren()) do -- doom#1337
								if v.Name ~= "UIListLayout" then -- doom#1337
									if TBLFIND(val.Jumbobox, v.Name) then -- doom#1337
										v.TextLabel.TextColor3 = COL3RGB(175, 175, 175) -- doom#1337
									else -- doom#1337
										v.TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
							updatetext() -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(val) -- doom#1337
						end -- doom#1337
						if data.default then -- doom#1337
							Element:SetValue(data.default) -- doom#1337
						end -- doom#1337

						ImageLabel.Parent = Button -- doom#1337
						ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						ImageLabel.BackgroundTransparency = 1.000 -- doom#1337
						ImageLabel.Position = UDIM2(0, 165, 0, 6) -- doom#1337
						ImageLabel.Size = UDIM2(0, 6, 0, 4) -- doom#1337
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" -- doom#1337

						TextLabel_3.Parent = Dropdown -- doom#1337
						TextLabel_3.BackgroundColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel_3.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel_3.Position = UDIM2(0, 32, 0, -1) -- doom#1337
						TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0) -- doom#1337
						TextLabel_3.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel_3.Text = text -- doom#1337
						TextLabel_3.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel_3.TextSize = 14.000 -- doom#1337
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337
							Drop.Visible = not Drop.Visible -- doom#1337
							if not Drop.Visible then -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						local indrop = false -- doom#1337
						local ind = false -- doom#1337
						Drop.MouseEnter:Connect(function() -- doom#1337
							indrop = true -- doom#1337
						end) -- doom#1337
						Drop.MouseLeave:Connect(function() -- doom#1337
							indrop = false -- doom#1337
						end) -- doom#1337
						Button.MouseEnter:Connect(function() -- doom#1337
							ind = true -- doom#1337
						end) -- doom#1337
						Button.MouseLeave:Connect(function() -- doom#1337
							ind = false -- doom#1337
						end) -- doom#1337
						game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
								if Drop.Visible == true and not indrop and not ind then -- doom#1337
									Drop.Visible = false -- doom#1337
									Drop.CanvasPosition = Vec2(0,0) -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					elseif type == "TextBox" then -- doom#1337

					elseif type == "ToggleKeybind" then -- doom#1337
						tabsize = tabsize + UDIM2(0,0,0,16) -- doom#1337
						Element.value = {Toggle = data.default and data.default.Toggle or false, Key, Type = "Always", Active = true} -- doom#1337

						local Toggle = INST("Frame") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local Color = INST("Frame") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337

						Toggle.Name = "Toggle" -- doom#1337
						Toggle.Parent = tab1 -- doom#1337
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Toggle.BackgroundTransparency = 1.000 -- doom#1337
						Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Toggle -- doom#1337
						Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Button.BackgroundTransparency = 1.000 -- doom#1337
						Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						Color.Name = "Color" -- doom#1337
						Color.Parent = Button -- doom#1337
						Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Color.BorderColor3 = COL3RGB(27, 3275, 35) -- doom#1337
						Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
						Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337
						local binding = false -- doom#1337
						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = text -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						local function update() -- doom#1337
							if Element.value.Toggle then -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 22, 66)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
							else -- doom#1337
								keybindremove(text) -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							end -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337
							if not binding then -- doom#1337
								Element.value.Toggle = not Element.value.Toggle -- doom#1337
								update() -- doom#1337
								values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						if data.default then -- doom#1337
							update() -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						do -- doom#1337
							local Keybind = INST("TextButton") -- doom#1337
							local Frame = INST("Frame") -- doom#1337
							local Always = INST("TextButton") -- doom#1337
							local UIListLayout = INST("UIListLayout") -- doom#1337
							local Hold = INST("TextButton") -- doom#1337
							local Toggle = INST("TextButton") -- doom#1337

							Keybind.Name = "Keybind" -- doom#1337
							Keybind.Parent = Button -- doom#1337
							Keybind.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Keybind.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Keybind.Position = UDIM2(0, 270, 0.5, -6) -- doom#1337
							Keybind.Text = "NONE" -- doom#1337
							Keybind.Size = UDIM2(0, 43, 0, 12) -- doom#1337
							Keybind.Size = UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12) -- doom#1337
							Keybind.AutoButtonColor = false -- doom#1337
							Keybind.Font = Enum.Font.SourceSansSemibold -- doom#1337
							Keybind.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
							Keybind.TextSize = 14.000 -- doom#1337
							Keybind.AnchorPoint = Vec2(1,0) -- doom#1337
							Keybind.ZIndex = 3 -- doom#1337

							Frame.Parent = Keybind -- doom#1337
							Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Frame.Position = UDIM2(1, -49, 0, 1) -- doom#1337
							Frame.Size = UDIM2(0, 49, 0, 49) -- doom#1337
							Frame.Visible = false -- doom#1337
							Frame.ZIndex = 3 -- doom#1337

							Always.Name = "Always" -- doom#1337
							Always.Parent = Frame -- doom#1337
							Always.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Always.BackgroundTransparency = 1.000 -- doom#1337
							Always.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Always.Position = UDIM2(-3.03289485, 231, 0.115384616, -6) -- doom#1337
							Always.Size = UDIM2(1, 0, 0, 16) -- doom#1337
							Always.AutoButtonColor = false -- doom#1337
							Always.Font = Enum.Font.SourceSansBold -- doom#1337
							Always.Text = "Always" -- doom#1337
							Always.TextColor3 = COL3RGB(173, 24, 74) -- doom#1337
							Always.TextSize = 14.000 -- doom#1337
							Always.ZIndex = 3 -- doom#1337

							UIListLayout.Parent = Frame -- doom#1337
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

							Hold.Name = "Hold" -- doom#1337
							Hold.Parent = Frame -- doom#1337
							Hold.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Hold.BackgroundTransparency = 1.000 -- doom#1337
							Hold.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Hold.Position = UDIM2(-3.03289485, 231, 0.115384616, -6) -- doom#1337
							Hold.Size = UDIM2(1, 0, 0, 16) -- doom#1337
							Hold.AutoButtonColor = false -- doom#1337
							Hold.Font = Enum.Font.SourceSansSemibold -- doom#1337
							Hold.Text = "Hold" -- doom#1337
							Hold.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
							Hold.TextSize = 14.000 -- doom#1337
							Hold.ZIndex = 3 -- doom#1337

							Toggle.Name = "Toggle" -- doom#1337
							Toggle.Parent = Frame -- doom#1337
							Toggle.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Toggle.BackgroundTransparency = 1.000 -- doom#1337
							Toggle.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Toggle.Position = UDIM2(-3.03289485, 231, 0.115384616, -6) -- doom#1337
							Toggle.Size = UDIM2(1, 0, 0, 16) -- doom#1337
							Toggle.AutoButtonColor = false -- doom#1337
							Toggle.Font = Enum.Font.SourceSansSemibold -- doom#1337
							Toggle.Text = "Toggle" -- doom#1337
							Toggle.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
							Toggle.TextSize = 14.000 -- doom#1337
							Toggle.ZIndex = 3 -- doom#1337

							for _,button in pairs(Frame:GetChildren()) do -- doom#1337
								if button:IsA("TextButton") then -- doom#1337
									button.MouseButton1Down:Connect(function() -- doom#1337
										Element.value.Type = button.Text -- doom#1337
										Frame.Visible = false -- doom#1337
										Element.value.Active = Element.value.Type == "Always" and true or false -- doom#1337
										if Element.value.Type == "Always" then -- doom#1337
											keybindremove(text) -- doom#1337
										end -- doom#1337
										for _,button in pairs(Frame:GetChildren()) do -- doom#1337
											if button:IsA("TextButton") and button.Text ~= Element.value.Type then -- doom#1337
												button.Font = Enum.Font.SourceSansSemibold -- doom#1337
												library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)}) -- doom#1337
											end -- doom#1337
										end -- doom#1337
										button.Font = Enum.Font.SourceSansBold -- doom#1337
										button.TextColor3 = COL3RGB(60, 0, 90) -- doom#1337
										values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
										callback(Element.value) -- doom#1337
									end) -- doom#1337
									button.MouseEnter:Connect(function() -- doom#1337
										if Element.value.Type ~= button.Text then -- doom#1337
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255,255,255)}) -- doom#1337
										end -- doom#1337
									end) -- doom#1337
									button.MouseLeave:Connect(function() -- doom#1337
										if Element.value.Type ~= button.Text then -- doom#1337
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)}) -- doom#1337
										end -- doom#1337
									end) -- doom#1337
								end -- doom#1337
							end -- doom#1337
							Keybind.MouseButton1Down:Connect(function() -- doom#1337
								if not binding then -- doom#1337
									wait() -- doom#1337
									binding = true -- doom#1337
									Keybind.Text = "..." -- doom#1337
									Keybind.Size = UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12) -- doom#1337
								end -- doom#1337
							end) -- doom#1337
							Keybind.MouseButton2Down:Connect(function() -- doom#1337
								if not binding then -- doom#1337
									Frame.Visible = not Frame.Visible -- doom#1337
								end -- doom#1337
							end) -- doom#1337
							local Player = game.Players.LocalPlayer -- doom#1337
							local Mouse = Player:GetMouse() -- doom#1337
							local InFrame = false -- doom#1337
							Frame.MouseEnter:Connect(function() -- doom#1337
								InFrame = true -- doom#1337
							end) -- doom#1337
							Frame.MouseLeave:Connect(function() -- doom#1337
								InFrame = false -- doom#1337
							end) -- doom#1337
							local InFrame2 = false -- doom#1337
							Keybind.MouseEnter:Connect(function() -- doom#1337
								InFrame2 = true -- doom#1337
							end) -- doom#1337
							Keybind.MouseLeave:Connect(function() -- doom#1337
								InFrame2 = false -- doom#1337
							end) -- doom#1337
							game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then -- doom#1337
									if Frame.Visible == true and not InFrame and not InFrame2 then -- doom#1337
										Frame.Visible = false -- doom#1337
									end -- doom#1337
								end -- doom#1337
								if binding then -- doom#1337
									binding = false -- doom#1337
									Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() -- doom#1337
									Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12) -- doom#1337
									Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name -- doom#1337
									if input.KeyCode.Name == "Backspace" then -- doom#1337
										Keybind.Text = "NONE" -- doom#1337
										Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12) -- doom#1337
										Element.value.Key = nil -- doom#1337
									end -- doom#1337
								else -- doom#1337
									if Element.value.Key ~= nil then -- doom#1337
										if FIND(Element.value.Key, "Mouse") then -- doom#1337
											if input.UserInputType == Enum.UserInputType[Element.value.Key] then -- doom#1337
												if Element.value.Type == "Hold" then -- doom#1337
													Element.value.Active = true -- doom#1337
													if Element.value.Active and Element.value.Toggle then -- doom#1337
														keybindadd(text) -- doom#1337
													else -- doom#1337
														keybindremove(text) -- doom#1337
													end -- doom#1337
												elseif Element.value.Type == "Toggle" then -- doom#1337
													Element.value.Active = not Element.value.Active -- doom#1337
													if Element.value.Active and Element.value.Toggle then -- doom#1337
														keybindadd(text) -- doom#1337
													else -- doom#1337
														keybindremove(text) -- doom#1337
													end -- doom#1337
												end -- doom#1337
											end -- doom#1337
										else -- doom#1337
											if input.KeyCode == Enum.KeyCode[Element.value.Key] then -- doom#1337
												if Element.value.Type == "Hold" then -- doom#1337
													Element.value.Active = true -- doom#1337
													if Element.value.Active and Element.value.Toggle then -- doom#1337
														keybindadd(text) -- doom#1337
													else -- doom#1337
														keybindremove(text) -- doom#1337
													end -- doom#1337
												elseif Element.value.Type == "Toggle" then -- doom#1337
													Element.value.Active = not Element.value.Active -- doom#1337
													if Element.value.Active and Element.value.Toggle then -- doom#1337
														keybindadd(text) -- doom#1337
													else -- doom#1337
														keybindremove(text) -- doom#1337
													end -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									else -- doom#1337
										Element.value.Active = true -- doom#1337
									end -- doom#1337
								end -- doom#1337
								values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
							end) -- doom#1337
							game:GetService("UserInputService").InputEnded:Connect(function(input) -- doom#1337
								if Element.value.Key ~= nil then -- doom#1337
									if FIND(Element.value.Key, "Mouse") then -- doom#1337
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then -- doom#1337
											if Element.value.Type == "Hold" then -- doom#1337
												Element.value.Active = false -- doom#1337
												if Element.value.Active and Element.value.Toggle then -- doom#1337
													keybindadd(text) -- doom#1337
												else -- doom#1337
													keybindremove(text) -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									else -- doom#1337
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then -- doom#1337
											if Element.value.Type == "Hold" then -- doom#1337
												Element.value.Active = false -- doom#1337
												if Element.value.Active and Element.value.Toggle then -- doom#1337
													keybindadd(text) -- doom#1337
												else -- doom#1337
													keybindremove(text) -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
								values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
							end) -- doom#1337
						end -- doom#1337
						function Element:SetValue(value) -- doom#1337
							Element.value = value -- doom#1337
							update() -- doom#1337
						end -- doom#1337
					elseif type == "Toggle" then -- doom#1337
						tabsize = tabsize + UDIM2(0,0,0,16) -- doom#1337
						Element.value = {Toggle = data.default and data.default.Toggle or false} -- doom#1337

						local Toggle = INST("Frame") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local Color = INST("Frame") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337

						Toggle.Name = "Toggle" -- doom#1337
						Toggle.Parent = tab1 -- doom#1337
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Toggle.BackgroundTransparency = 1.000 -- doom#1337
						Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Toggle -- doom#1337
						Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Button.BackgroundTransparency = 1.000 -- doom#1337
						Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						Color.Name = "Color" -- doom#1337
						Color.Parent = Button -- doom#1337
						Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
						Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337

						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = text -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						local function update() -- doom#1337
							if Element.value.Toggle then -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 22, 66)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
							else -- doom#1337
								keybindremove(text) -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							end -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						end -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337
							Element.value.Toggle = not Element.value.Toggle -- doom#1337
							update() -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end) -- doom#1337
						if data.default then -- doom#1337
							update() -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						function Element:SetValue(value) -- doom#1337
							Element.value = value -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							update() -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
					elseif type == "ToggleColor" then -- doom#1337
						tabsize = tabsize + UDIM2(0,0,0,16) -- doom#1337
						Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255)} -- doom#1337

						local Toggle = INST("Frame") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local Color = INST("Frame") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337

						Toggle.Name = "Toggle" -- doom#1337
						Toggle.Parent = tab1 -- doom#1337
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Toggle.BackgroundTransparency = 1.000 -- doom#1337
						Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Toggle -- doom#1337
						Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Button.BackgroundTransparency = 1.000 -- doom#1337
						Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						Color.Name = "Color" -- doom#1337
						Color.Parent = Button -- doom#1337
						Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
						Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337

						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = text -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						local function update() -- doom#1337
							if Element.value.Toggle then -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
							else -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							end -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337

						local ColorH,ColorS,ColorV -- doom#1337

						local ColorP = INST("TextButton") -- doom#1337
						local Frame = INST("Frame") -- doom#1337
						local Colorpick = INST("ImageButton") -- doom#1337
						local ColorDrag = INST("Frame") -- doom#1337
						local Huepick = INST("ImageButton") -- doom#1337
						local Huedrag = INST("Frame") -- doom#1337

						ColorP.Name = "ColorP" -- doom#1337
						ColorP.Parent = Button -- doom#1337
						ColorP.AnchorPoint = Vec2(1, 0) -- doom#1337
						ColorP.BackgroundColor3 = COL3RGB(255, 0, 0) -- doom#1337
						ColorP.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						ColorP.Position = UDIM2(0, 270, 0.5, -4) -- doom#1337
						ColorP.Size = UDIM2(0, 18, 0, 8) -- doom#1337
						ColorP.AutoButtonColor = false -- doom#1337
						ColorP.Font = Enum.Font.SourceSansSemibold -- doom#1337
						ColorP.Text = "" -- doom#1337
						ColorP.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						ColorP.TextSize = 14.000 -- doom#1337

						Frame.Parent = ColorP -- doom#1337
						Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0) -- doom#1337
						Frame.Size = UDIM2(0, 200, 0, 170) -- doom#1337
						Frame.Visible = false -- doom#1337
						Frame.ZIndex = 3 -- doom#1337

						Colorpick.Name = "Colorpick" -- doom#1337
						Colorpick.Parent = Frame -- doom#1337
						Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Colorpick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Colorpick.ClipsDescendants = false -- doom#1337
						Colorpick.Position = UDIM2(0, 40, 0, 10) -- doom#1337
						Colorpick.Size = UDIM2(0, 150, 0, 150) -- doom#1337
						Colorpick.AutoButtonColor = false -- doom#1337
						Colorpick.Image = "rbxassetid://4155801252" -- doom#1337
						Colorpick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
						Colorpick.ZIndex = 3 -- doom#1337

						ColorDrag.Name = "ColorDrag" -- doom#1337
						ColorDrag.Parent = Colorpick -- doom#1337
						ColorDrag.AnchorPoint = Vec2(0.5, 0.5) -- doom#1337
						ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						ColorDrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						ColorDrag.Size = UDIM2(0, 4, 0, 4) -- doom#1337
						ColorDrag.ZIndex = 3 -- doom#1337

						Huepick.Name = "Huepick" -- doom#1337
						Huepick.Parent = Frame -- doom#1337
						Huepick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Huepick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Huepick.ClipsDescendants = false -- doom#1337
						Huepick.Position = UDIM2(0, 10, 0, 10) -- doom#1337
						Huepick.Size = UDIM2(0, 20, 0, 150) -- doom#1337
						Huepick.AutoButtonColor = false -- doom#1337
						Huepick.Image = "rbxassetid://3641079629" -- doom#1337
						Huepick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
						Huepick.ImageTransparency = 1 -- doom#1337
						Huepick.BackgroundTransparency = 0 -- doom#1337
						Huepick.ZIndex = 3 -- doom#1337

						local HueFrameGradient = INST("UIGradient") -- doom#1337
						HueFrameGradient.Rotation = 90 -- doom#1337
						HueFrameGradient.Name = "HueFrameGradient" -- doom#1337
						HueFrameGradient.Parent = Huepick -- doom#1337
						HueFrameGradient.Color = ColorSequence.new { -- doom#1337
							ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)), -- doom#1337
							ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)), -- doom#1337
							ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)), -- doom#1337
							ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)), -- doom#1337
							ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)), -- doom#1337
							ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)), -- doom#1337
							ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0)) -- doom#1337
						}	 -- doom#1337

						Huedrag.Name = "Huedrag" -- doom#1337
						Huedrag.Parent = Huepick -- doom#1337
						Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Huedrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Huedrag.Size = UDIM2(1, 0, 0, 2) -- doom#1337
						Huedrag.ZIndex = 3 -- doom#1337

						ColorP.MouseButton1Down:Connect(function() -- doom#1337
							Frame.Visible = not Frame.Visible -- doom#1337
						end) -- doom#1337
						local abc = false -- doom#1337
						local inCP = false -- doom#1337
						ColorP.MouseEnter:Connect(function() -- doom#1337
							abc = true -- doom#1337
						end) -- doom#1337
						ColorP.MouseLeave:Connect(function() -- doom#1337
							abc = false -- doom#1337
						end) -- doom#1337
						Frame.MouseEnter:Connect(function() -- doom#1337
							inCP = true -- doom#1337
						end) -- doom#1337
						Frame.MouseLeave:Connect(function() -- doom#1337
							inCP = false -- doom#1337
						end) -- doom#1337

						ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) -- doom#1337
						ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
						ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337

						if data.default.Color ~= nil then -- doom#1337
							ColorH, ColorS, ColorV = data.default.Color:ToHSV() -- doom#1337

							ColorH = CLAMP(ColorH,0,1) -- doom#1337
							ColorS = CLAMP(ColorS,0,1) -- doom#1337
							ColorV = CLAMP(ColorV,0,1) -- doom#1337
							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337

							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337
						end -- doom#1337

						local mouse = LocalPlayer:GetMouse() -- doom#1337
						game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
								if not dragging and not abc and not inCP then -- doom#1337
									Frame.Visible = false -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end) -- doom#1337

						local function updateColor() -- doom#1337
							local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
							local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337
							ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0) -- doom#1337
							ColorS = 1-ColorX -- doom#1337
							ColorV = 1-ColorY -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
						local function updateHue() -- doom#1337
							local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) -- doom#1337
							Huedrag.Position = UDIM2(0, 0, 0, y) -- doom#1337
							hue = y/148 -- doom#1337
							ColorH = 1-hue -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
						Colorpick.MouseButton1Down:Connect(function() -- doom#1337
							updateColor() -- doom#1337
							moveconnection = mouse.Move:Connect(function() -- doom#1337
								updateColor() -- doom#1337
							end) -- doom#1337
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
									updateColor() -- doom#1337
									moveconnection:Disconnect() -- doom#1337
									releaseconnection:Disconnect() -- doom#1337
								end -- doom#1337
							end) -- doom#1337
						end) -- doom#1337
						Huepick.MouseButton1Down:Connect(function() -- doom#1337
							updateHue() -- doom#1337
							moveconnection = mouse.Move:Connect(function() -- doom#1337
								updateHue() -- doom#1337
							end) -- doom#1337
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
									updateHue() -- doom#1337
									moveconnection:Disconnect() -- doom#1337
									releaseconnection:Disconnect() -- doom#1337
								end -- doom#1337
							end) -- doom#1337
						end) -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337
							Element.value.Toggle = not Element.value.Toggle -- doom#1337
							update() -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end) -- doom#1337
						if data.default then -- doom#1337
							update() -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						function Element:SetValue(value) -- doom#1337
							Element.value = value -- doom#1337
							local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B) -- doom#1337
							ColorH, ColorS, ColorV = duplicate:ToHSV() -- doom#1337
							ColorH = CLAMP(ColorH,0,1) -- doom#1337
							ColorS = CLAMP(ColorS,0,1) -- doom#1337
							ColorV = CLAMP(ColorV,0,1) -- doom#1337

							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							update() -- doom#1337
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337
						end -- doom#1337
					elseif type == "ToggleTrans" then -- doom#1337
						tabsize = tabsize + UDIM2(0,0,0,16) -- doom#1337
						Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0} -- doom#1337

						local Toggle = INST("Frame") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local Color = INST("Frame") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337

						Toggle.Name = "Toggle" -- doom#1337
						Toggle.Parent = tab1 -- doom#1337
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Toggle.BackgroundTransparency = 1.000 -- doom#1337
						Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Toggle -- doom#1337
						Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Button.BackgroundTransparency = 1.000 -- doom#1337
						Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						Color.Name = "Color" -- doom#1337
						Color.Parent = Button -- doom#1337
						Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
						Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337

						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = text -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						local function update() -- doom#1337
							if Element.value.Toggle then -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
							else -- doom#1337
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							end -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337

						local ColorH,ColorS,ColorV -- doom#1337

						local ColorP = INST("TextButton") -- doom#1337
						local Frame = INST("Frame") -- doom#1337
						local Colorpick = INST("ImageButton") -- doom#1337
						local ColorDrag = INST("Frame") -- doom#1337
						local Huepick = INST("ImageButton") -- doom#1337
						local Huedrag = INST("Frame") -- doom#1337

						ColorP.Name = "ColorP" -- doom#1337
						ColorP.Parent = Button -- doom#1337
						ColorP.AnchorPoint = Vec2(1, 0) -- doom#1337
						ColorP.BackgroundColor3 = COL3RGB(255, 0, 0) -- doom#1337
						ColorP.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						ColorP.Position = UDIM2(0, 270, 0.5, -4) -- doom#1337
						ColorP.Size = UDIM2(0, 18, 0, 8) -- doom#1337
						ColorP.AutoButtonColor = false -- doom#1337
						ColorP.Font = Enum.Font.SourceSansSemibold -- doom#1337
						ColorP.Text = "" -- doom#1337
						ColorP.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						ColorP.TextSize = 14.000 -- doom#1337

						Frame.Parent = ColorP -- doom#1337
						Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0) -- doom#1337
						Frame.Size = UDIM2(0, 200, 0, 190) -- doom#1337
						Frame.Visible = false -- doom#1337
						Frame.ZIndex = 3 -- doom#1337

						Colorpick.Name = "Colorpick" -- doom#1337
						Colorpick.Parent = Frame -- doom#1337
						Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Colorpick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Colorpick.ClipsDescendants = false -- doom#1337
						Colorpick.Position = UDIM2(0, 40, 0, 10) -- doom#1337
						Colorpick.Size = UDIM2(0, 150, 0, 150) -- doom#1337
						Colorpick.AutoButtonColor = false -- doom#1337
						Colorpick.Image = "rbxassetid://4155801252" -- doom#1337
						Colorpick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
						Colorpick.ZIndex = 3 -- doom#1337

						ColorDrag.Name = "ColorDrag" -- doom#1337
						ColorDrag.Parent = Colorpick -- doom#1337
						ColorDrag.AnchorPoint = Vec2(0.5, 0.5) -- doom#1337
						ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						ColorDrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						ColorDrag.Size = UDIM2(0, 4, 0, 4) -- doom#1337
						ColorDrag.ZIndex = 3 -- doom#1337

						Huepick.Name = "Huepick" -- doom#1337
						Huepick.Parent = Frame -- doom#1337
						Huepick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Huepick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Huepick.ClipsDescendants = true -- doom#1337
						Huepick.Position = UDIM2(0, 10, 0, 10) -- doom#1337
						Huepick.Size = UDIM2(0, 20, 0, 150) -- doom#1337
						Huepick.AutoButtonColor = false -- doom#1337
						Huepick.Image = "rbxassetid://3641079629" -- doom#1337
						Huepick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
						Huepick.ImageTransparency = 1 -- doom#1337
						Huepick.BackgroundTransparency = 0 -- doom#1337
						Huepick.ZIndex = 3 -- doom#1337

						local HueFrameGradient = INST("UIGradient") -- doom#1337
						HueFrameGradient.Rotation = 90 -- doom#1337
						HueFrameGradient.Name = "HueFrameGradient" -- doom#1337
						HueFrameGradient.Parent = Huepick -- doom#1337
						HueFrameGradient.Color = ColorSequence.new { -- doom#1337
							ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)), -- doom#1337
							ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)), -- doom#1337
							ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)), -- doom#1337
							ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)), -- doom#1337
							ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)), -- doom#1337
							ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)), -- doom#1337
							ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0)) -- doom#1337
						}	 -- doom#1337

						Huedrag.Name = "Huedrag" -- doom#1337
						Huedrag.Parent = Huepick -- doom#1337
						Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Huedrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Huedrag.Size = UDIM2(1, 0, 0, 2) -- doom#1337
						Huedrag.ZIndex = 3 -- doom#1337

						local Transpick = INST("ImageButton") -- doom#1337
						local Transcolor = INST("ImageLabel") -- doom#1337
						local Transdrag = INST("Frame") -- doom#1337

						Transpick.Name = "Transpick" -- doom#1337
						Transpick.Parent = Frame -- doom#1337
						Transpick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Transpick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Transpick.Position = UDIM2(0, 10, 0, 167) -- doom#1337
						Transpick.Size = UDIM2(0, 180, 0, 15) -- doom#1337
						Transpick.AutoButtonColor = false -- doom#1337
						Transpick.Image = "rbxassetid://3887014957" -- doom#1337
						Transpick.ScaleType = Enum.ScaleType.Tile -- doom#1337
						Transpick.TileSize = UDIM2(0, 10, 0, 10) -- doom#1337
						Transpick.ZIndex = 3 -- doom#1337

						Transcolor.Name = "Transcolor" -- doom#1337
						Transcolor.Parent = Transpick -- doom#1337
						Transcolor.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Transcolor.BackgroundTransparency = 1.000 -- doom#1337
						Transcolor.Size = UDIM2(1, 0, 1, 0) -- doom#1337
						Transcolor.Image = "rbxassetid://3887017050" -- doom#1337
						Transcolor.ImageColor3 = COL3RGB(255, 0, 4) -- doom#1337
						Transcolor.ZIndex = 3 -- doom#1337

						Transdrag.Name = "Transdrag" -- doom#1337
						Transdrag.Parent = Transcolor -- doom#1337
						Transdrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Transdrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Transdrag.Position = UDIM2(0, -1, 0, 0) -- doom#1337
						Transdrag.Size = UDIM2(0, 2, 1, 0) -- doom#1337
						Transdrag.ZIndex = 3 -- doom#1337

						ColorP.MouseButton1Down:Connect(function() -- doom#1337
							Frame.Visible = not Frame.Visible -- doom#1337
						end) -- doom#1337
						local abc = false -- doom#1337
						local inCP = false -- doom#1337
						ColorP.MouseEnter:Connect(function() -- doom#1337
							abc = true -- doom#1337
						end) -- doom#1337
						ColorP.MouseLeave:Connect(function() -- doom#1337
							abc = false -- doom#1337
						end) -- doom#1337
						Frame.MouseEnter:Connect(function() -- doom#1337
							inCP = true -- doom#1337
						end) -- doom#1337
						Frame.MouseLeave:Connect(function() -- doom#1337
							inCP = false -- doom#1337
						end) -- doom#1337

						ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) -- doom#1337
						ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
						ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337

						if data.default.Color ~= nil then -- doom#1337
							ColorH, ColorS, ColorV = data.default.Color:ToHSV() -- doom#1337

							ColorH = CLAMP(ColorH,0,1) -- doom#1337
							ColorS = CLAMP(ColorS,0,1) -- doom#1337
							ColorV = CLAMP(ColorV,0,1) -- doom#1337
							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337

							Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337

							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337
						end -- doom#1337
						if data.default.Transparency ~= nil then -- doom#1337
							Transdrag.Position = UDIM2(data.default.Transparency, -1, 0, 0) -- doom#1337
						end -- doom#1337
						local mouse = LocalPlayer:GetMouse() -- doom#1337
						game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
								if not dragging and not abc and not inCP then -- doom#1337
									Frame.Visible = false -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end) -- doom#1337

						local function updateColor() -- doom#1337
							local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
							local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337
							ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0) -- doom#1337
							ColorS = 1-ColorX -- doom#1337
							ColorV = 1-ColorY -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
						local function updateHue() -- doom#1337
							local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) -- doom#1337
							Huedrag.Position = UDIM2(0, 0, 0, y) -- doom#1337
							hue = y/148 -- doom#1337
							ColorH = 1-hue -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
						local function updateTrans() -- doom#1337
							local x = CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178) -- doom#1337
							Transdrag.Position = UDIM2(0, x, 0, 0) -- doom#1337
							Element.value.Transparency = (x/178) -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
						Transpick.MouseButton1Down:Connect(function() -- doom#1337
							updateTrans() -- doom#1337
							moveconnection = mouse.Move:Connect(function() -- doom#1337
								updateTrans() -- doom#1337
							end) -- doom#1337
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
									updateTrans() -- doom#1337
									moveconnection:Disconnect() -- doom#1337
									releaseconnection:Disconnect() -- doom#1337
								end -- doom#1337
							end) -- doom#1337
						end) -- doom#1337
						Colorpick.MouseButton1Down:Connect(function() -- doom#1337
							updateColor() -- doom#1337
							moveconnection = mouse.Move:Connect(function() -- doom#1337
								updateColor() -- doom#1337
							end) -- doom#1337
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
									updateColor() -- doom#1337
									moveconnection:Disconnect() -- doom#1337
									releaseconnection:Disconnect() -- doom#1337
								end -- doom#1337
							end) -- doom#1337
						end) -- doom#1337
						Huepick.MouseButton1Down:Connect(function() -- doom#1337
							updateHue() -- doom#1337
							moveconnection = mouse.Move:Connect(function() -- doom#1337
								updateHue() -- doom#1337
							end) -- doom#1337
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
									updateHue() -- doom#1337
									moveconnection:Disconnect() -- doom#1337
									releaseconnection:Disconnect() -- doom#1337
								end -- doom#1337
							end) -- doom#1337
						end) -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337
							Element.value.Toggle = not Element.value.Toggle -- doom#1337
							update() -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end) -- doom#1337
						if data.default then -- doom#1337
							update() -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						function Element:SetValue(value) -- doom#1337
							Element.value = value -- doom#1337
							local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B) -- doom#1337
							ColorH, ColorS, ColorV = duplicate:ToHSV() -- doom#1337
							ColorH = CLAMP(ColorH,0,1) -- doom#1337
							ColorS = CLAMP(ColorS,0,1) -- doom#1337
							ColorV = CLAMP(ColorV,0,1) -- doom#1337

							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
							update() -- doom#1337
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337
						end -- doom#1337
					elseif type == "Dropdown" then -- doom#1337
						tabsize = tabsize + UDIM2(0,0,0,39) -- doom#1337
						Element.value = {Dropdown = data.options[1]} -- doom#1337

						local Dropdown = INST("Frame") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337
						local Drop = INST("ScrollingFrame") -- doom#1337
						local Button_2 = INST("TextButton") -- doom#1337
						local TextLabel_2 = INST("TextLabel") -- doom#1337
						local UIListLayout = INST("UIListLayout") -- doom#1337
						local ImageLabel = INST("ImageLabel") -- doom#1337
						local TextLabel_3 = INST("TextLabel") -- doom#1337

						Dropdown.Name = "Dropdown" -- doom#1337
						Dropdown.Parent = tab1 -- doom#1337
						Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Dropdown.BackgroundTransparency = 1.000 -- doom#1337
						Dropdown.Position = UDIM2(0, 0, 0.255102038, 0) -- doom#1337
						Dropdown.Size = UDIM2(1, 0, 0, 39) -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Dropdown -- doom#1337
						Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
						Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
						Button.AutoButtonColor = false -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
						TextLabel.Position = UDIM2(0, 5, 0, 0) -- doom#1337
						TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = Element.value.Dropdown -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						local abcd = TextLabel -- doom#1337

						Drop.Name = "Drop" -- doom#1337
						Drop.Parent = Button -- doom#1337
						Drop.Active = true -- doom#1337
						Drop.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Drop.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Drop.Position = UDIM2(0, 0, 1, 1) -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 20) -- doom#1337
						Drop.Visible = false -- doom#1337
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
						Drop.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
						Drop.ScrollBarThickness = 4 -- doom#1337
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
						Drop.AutomaticCanvasSize = "Y" -- doom#1337
						Drop.ZIndex = 5 -- doom#1337
						Drop.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

						UIListLayout.Parent = Drop -- doom#1337
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

						local num = #data.options -- doom#1337
						if num > 5 then -- doom#1337
							Drop.Size = UDIM2(1, 0, 0, 85) -- doom#1337
						else -- doom#1337
							Drop.Size = UDIM2(1, 0, 0, 17*num) -- doom#1337
						end -- doom#1337
						Drop.CanvasSize = UDIM2(1, 0, 0, 17*num) -- doom#1337
						local first = true -- doom#1337
						for i,v in ipairs(data.options) do -- doom#1337
							do -- doom#1337
								local Button = INST("TextButton") -- doom#1337
								local TextLabel = INST("TextLabel") -- doom#1337

								Button.Name = v -- doom#1337
								Button.Parent = Drop -- doom#1337
								Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
								Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
								Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
								Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
								Button.AutoButtonColor = false -- doom#1337
								Button.Font = Enum.Font.SourceSans -- doom#1337
								Button.Text = "" -- doom#1337
								Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
								Button.TextSize = 14.000 -- doom#1337
								Button.BorderSizePixel = 0 -- doom#1337
								Button.ZIndex = 6 -- doom#1337

								TextLabel.Parent = Button -- doom#1337
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
								TextLabel.BackgroundTransparency = 1.000 -- doom#1337
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
								TextLabel.Position = UDIM2(0, 5, 0, -1) -- doom#1337
								TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
								TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
								TextLabel.Text = v -- doom#1337
								TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
								TextLabel.TextSize = 14.000 -- doom#1337
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
								TextLabel.ZIndex = 6 -- doom#1337

								Button.MouseButton1Down:Connect(function() -- doom#1337
									Drop.Visible = false -- doom#1337
									Element.value.Dropdown = v -- doom#1337
									abcd.Text = v -- doom#1337
									values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
									callback(Element.value) -- doom#1337
									Drop.CanvasPosition = Vec2(0,0) -- doom#1337
								end) -- doom#1337
								Button.MouseEnter:Connect(function() -- doom#1337
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)}) -- doom#1337
								end) -- doom#1337
								Button.MouseLeave:Connect(function() -- doom#1337
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)}) -- doom#1337
								end) -- doom#1337

								first = false -- doom#1337
							end -- doom#1337
						end -- doom#1337

						function Element:SetValue(val) -- doom#1337
							Element.value = val -- doom#1337
							abcd.Text = val.Dropdown -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(val) -- doom#1337
						end -- doom#1337

						ImageLabel.Parent = Button -- doom#1337
						ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						ImageLabel.BackgroundTransparency = 1.000 -- doom#1337
						ImageLabel.Position = UDIM2(0, 165, 0, 6) -- doom#1337
						ImageLabel.Size = UDIM2(0, 6, 0, 4) -- doom#1337
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" -- doom#1337

						TextLabel_3.Parent = Dropdown -- doom#1337
						TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel_3.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel_3.Position = UDIM2(0, 32, 0, -1) -- doom#1337
						TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0) -- doom#1337
						TextLabel_3.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel_3.Text = text -- doom#1337
						TextLabel_3.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel_3.TextSize = 14.000 -- doom#1337
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337
							Drop.Visible = not Drop.Visible -- doom#1337
							if not Drop.Visible then -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						local indrop = false -- doom#1337
						local ind = false -- doom#1337
						Drop.MouseEnter:Connect(function() -- doom#1337
							indrop = true -- doom#1337
						end) -- doom#1337
						Drop.MouseLeave:Connect(function() -- doom#1337
							indrop = false -- doom#1337
						end) -- doom#1337
						Button.MouseEnter:Connect(function() -- doom#1337
							ind = true -- doom#1337
						end) -- doom#1337
						Button.MouseLeave:Connect(function() -- doom#1337
							ind = false -- doom#1337
						end) -- doom#1337
						game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
								if Drop.Visible == true and not indrop and not ind then -- doom#1337
									Drop.Visible = false -- doom#1337
									Drop.CanvasPosition = Vec2(0,0) -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
					elseif type == "Slider" then -- doom#1337

						tabsize = tabsize + UDIM2(0,0,0,25) -- doom#1337

						local Slider = INST("Frame") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local Frame = INST("Frame") -- doom#1337
						local UIGradient = INST("UIGradient") -- doom#1337
						local Value = INST("TextLabel") -- doom#1337

						Slider.Name = "Slider" -- doom#1337
						Slider.Parent = tab1 -- doom#1337
						Slider.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Slider.BackgroundTransparency = 1.000 -- doom#1337
						Slider.Position = UDIM2(0, 0, 0.653061211, 0) -- doom#1337
						Slider.Size = UDIM2(1, 0, 0, 25) -- doom#1337

						TextLabel.Parent = Slider -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.Position = UDIM2(0, 32, 0, -2) -- doom#1337
						TextLabel.Size = UDIM2(0, 100, 0, 15) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = text -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = Slider -- doom#1337
						Button.BackgroundColor3 = COL3RGB(35, 37, 47) -- doom#1337
						Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Button.Position = UDIM2(0, 30, 0, 15) -- doom#1337
						Button.Size = UDIM2(0, 175, 0, 5) -- doom#1337
						Button.AutoButtonColor = false -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						Frame.Parent = Button -- doom#1337
						Frame.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Frame.BorderSizePixel = 0 -- doom#1337
						Frame.Size = UDIM2(0.5, 0, 1, 0) -- doom#1337

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, COL3RGB(153, 22, 65)), ColorSequenceKeypoint.new(1, COL3RGB(109, 16, 46))} -- doom#1337
						UIGradient.Rotation = 90 -- doom#1337
						UIGradient.Parent = Frame -- doom#1337

						Value.Name = "Value" -- doom#1337
						Value.Parent = Slider -- doom#1337
						Value.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Value.BackgroundTransparency = 1.000 -- doom#1337
						Value.Position = UDIM2(0, 150, 0, -1) -- doom#1337
						Value.Size = UDIM2(0, 55, 0, 15) -- doom#1337
						Value.Font = Enum.Font.SourceSansSemibold -- doom#1337
						Value.Text = "50" -- doom#1337
						Value.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						Value.TextSize = 14.000 -- doom#1337
						Value.TextXAlignment = Enum.TextXAlignment.Right -- doom#1337
						local min, max, default = data.min or 0, data.max or 100, data.default or 0 -- doom#1337
						Element.value = {Slider = default} -- doom#1337

						function Element:SetValue(value) -- doom#1337
							Element.value = value -- doom#1337
							local a -- doom#1337
							if min > 0 then -- doom#1337
								a = ((Element.value.Slider - min)) / (max-min) -- doom#1337
							else -- doom#1337
								a = (Element.value.Slider-min)/(max-min) -- doom#1337
							end -- doom#1337
							Value.Text = Element.value.Slider -- doom#1337
							Frame.Size = UDIM2(a,0,1,0) -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(value) -- doom#1337
						end -- doom#1337
						local a -- doom#1337
						if min > 0 then -- doom#1337
							a = ((Element.value.Slider - min)) / (max-min) -- doom#1337
						else -- doom#1337
							a = (Element.value.Slider-min)/(max-min) -- doom#1337
						end -- doom#1337
						Value.Text = Element.value.Slider -- doom#1337
						Frame.Size = UDIM2(a,0,1,0) -- doom#1337
						values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
						local uis = game:GetService("UserInputService") -- doom#1337
						local mouse = game.Players.LocalPlayer:GetMouse() -- doom#1337
						local val -- doom#1337
						Button.MouseButton1Down:Connect(function() -- doom#1337
							Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) -- doom#1337
							val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0 -- doom#1337
							Value.Text = val -- doom#1337
							Element.value.Slider = val -- doom#1337
							values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
							moveconnection = mouse.Move:Connect(function() -- doom#1337
								Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) -- doom#1337
								val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) -- doom#1337
								Value.Text = val -- doom#1337
								Element.value.Slider = val -- doom#1337
								values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
							end) -- doom#1337
							releaseconnection = uis.InputEnded:Connect(function(Mouse) -- doom#1337
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
									Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) -- doom#1337
									val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) -- doom#1337
									values[tabname][sectorname][tabtext][text] = Element.value -- doom#1337
									callback(Element.value) -- doom#1337
									moveconnection:Disconnect() -- doom#1337
									releaseconnection:Disconnect() -- doom#1337
								end -- doom#1337
							end) -- doom#1337
						end) -- doom#1337
					elseif type == "Button" then -- doom#1337

						tabsize = tabsize + UDIM2(0,0,0,24) -- doom#1337
						local Button = INST("Frame") -- doom#1337
						local Button_2 = INST("TextButton") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337

						Button.Name = "Button" -- doom#1337
						Button.Parent = tab1 -- doom#1337
						Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						Button.BackgroundTransparency = 1.000 -- doom#1337
						Button.Position = UDIM2(0, 0, 0.236059487, 0) -- doom#1337
						Button.Size = UDIM2(1, 0, 0, 24) -- doom#1337

						Button_2.Name = "Button" -- doom#1337
						Button_2.Parent = Button -- doom#1337
						Button_2.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Button_2.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Button_2.Position = UDIM2(0, 30, 0.5, -9) -- doom#1337
						Button_2.Size = UDIM2(0, 175, 0, 18) -- doom#1337
						Button_2.AutoButtonColor = false -- doom#1337
						Button_2.Font = Enum.Font.SourceSans -- doom#1337
						Button_2.Text = "" -- doom#1337
						Button_2.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button_2.TextSize = 14.000 -- doom#1337

						TextLabel.Parent = Button_2 -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
						TextLabel.Size = UDIM2(1, 0, 1, 0) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = text -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337

						function Element:SetValue() -- doom#1337
						end -- doom#1337

						Button_2.MouseButton1Down:Connect(function() -- doom#1337
							TextLabel.TextColor3 = COL3RGB(175, 42, 86) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							callback() -- doom#1337
						end) -- doom#1337
						Button_2.MouseEnter:Connect(function() -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						end) -- doom#1337
						Button_2.MouseLeave:Connect(function() -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						end) -- doom#1337
					end -- doom#1337
					ConfigLoad:Connect(function(cfg) -- doom#1337
						local fix = library:ConfigFix(cfg) -- doom#1337
						if fix[tabname][sectorname][tabtext][text] ~= nil then -- doom#1337
							Element:SetValue(fix[tabname][sectorname][tabtext][text]) -- doom#1337
						end -- doom#1337
					end) -- doom#1337

					return Element -- doom#1337
				end -- doom#1337


				if firs then -- doom#1337
					coroutine.wrap(function() -- doom#1337
						game:GetService("RunService").RenderStepped:Wait() -- doom#1337
						Section.Size = tabsize -- doom#1337
					end)() -- doom#1337
					selected = text -- doom#1337
					TextButton.TextColor3 = COL3RGB(255,255,255) -- doom#1337
					tab1.Visible = true -- doom#1337
					firs = false -- doom#1337
				end -- doom#1337

				return tab -- doom#1337
			end -- doom#1337

			return MSector -- doom#1337
		end -- doom#1337
		function Tab:Sector(text, side) -- doom#1337
			local sectorname = text -- doom#1337
			local Sector = {} -- doom#1337
			values[tabname][text] = {} -- doom#1337
			local Section = INST("Frame") -- doom#1337
			local SectionText = INST("TextLabel") -- doom#1337
			local Inner = INST("Frame") -- doom#1337
			local UIListLayout = INST("UIListLayout") -- doom#1337

			Section.Name = "Section" -- doom#1337
			Section.Parent = TabGui[side] -- doom#1337
			Section.BackgroundColor3 = COL3RGB(27, 27, 35) -- doom#1337
			Section.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
			Section.BorderSizePixel = 0 -- doom#1337
			Section.Position = UDIM2(0.00358422939, 0, 0, 0) -- doom#1337
			Section.Size = UDIM2(1, 0, 0, 22) -- doom#1337

			SectionText.Name = "SectionText" -- doom#1337
			SectionText.Parent = Section -- doom#1337
			SectionText.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
			SectionText.BackgroundTransparency = 1.000 -- doom#1337
			SectionText.Position = UDIM2(0, 7, 0, -12) -- doom#1337
			SectionText.Size = UDIM2(0, 270, 0, 19) -- doom#1337
			SectionText.ZIndex = 2 -- doom#1337
			SectionText.Font = Enum.Font.SourceSansSemibold -- doom#1337
			SectionText.Text = text -- doom#1337
			SectionText.TextColor3 = COL3RGB(255, 255, 255) -- doom#1337
			SectionText.TextSize = 15.000 -- doom#1337
			SectionText.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

			Inner.Name = "Inner" -- doom#1337
			Inner.Parent = Section -- doom#1337
			Inner.BackgroundColor3 = COL3RGB(30, 30, 39) -- doom#1337
			Inner.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
			Inner.BorderSizePixel = 0 -- doom#1337
			Inner.Position = UDIM2(0, 1, 0, 1) -- doom#1337
			Inner.Size = UDIM2(1, -2, 1, -2) -- doom#1337

			local UIPadding = INST("UIPadding") -- doom#1337

			UIPadding.Parent = Inner -- doom#1337
			UIPadding.PaddingTop = UDim.new(0, 10) -- doom#1337

			UIListLayout.Parent = Inner -- doom#1337
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
			UIListLayout.Padding = UDim.new(0,1) -- doom#1337

			function Sector:Element(type, text, data, callback) -- doom#1337
				local Element = {} -- doom#1337
				data = data or {} -- doom#1337
				callback = callback or function() end -- doom#1337
				values[tabname][sectorname][text] = {} -- doom#1337
				if type == "ScrollDrop" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,39) -- doom#1337
					Element.value = {Scroll = {}, Dropdown = ""} -- doom#1337

					for i,v in pairs(data.options) do -- doom#1337
						Element.value.Scroll[i] = v[1] -- doom#1337
					end -- doom#1337

					local joe = {} -- doom#1337
					if data.alphabet then -- doom#1337
						local copy = {} -- doom#1337
						for i,v in pairs(data.options) do -- doom#1337
							INSERT(copy, i) -- doom#1337
						end -- doom#1337
						TBLSORT(copy, function(a,b) -- doom#1337
							return a < b -- doom#1337
						end) -- doom#1337
						joe = copy -- doom#1337
					else -- doom#1337
						for i,v in pairs(data.options) do -- doom#1337
							INSERT(joe, i) -- doom#1337
						end -- doom#1337
					end -- doom#1337

					local Dropdown = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337
					local Drop = INST("ScrollingFrame") -- doom#1337
					local Button_2 = INST("TextButton") -- doom#1337
					local TextLabel_2 = INST("TextLabel") -- doom#1337
					local UIListLayout = INST("UIListLayout") -- doom#1337
					local ImageLabel = INST("ImageLabel") -- doom#1337
					local TextLabel_3 = INST("TextLabel") -- doom#1337

					Dropdown.Name = "Dropdown" -- doom#1337
					Dropdown.Parent = Inner -- doom#1337
					Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Dropdown.BackgroundTransparency = 1.000 -- doom#1337
					Dropdown.Position = UDIM2(0, 0, 0, 0) -- doom#1337
					Dropdown.Size = UDIM2(1, 0, 0, 39) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Dropdown -- doom#1337
					Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
					Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
					Button.AutoButtonColor = false -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					local TextLabel = INST("TextLabel") -- doom#1337

					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
					TextLabel.Position = UDIM2(0, 5, 0, 0) -- doom#1337
					TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = "lol" -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local abcd = TextLabel -- doom#1337

					Drop.Name = "Drop" -- doom#1337
					Drop.Parent = Button -- doom#1337
					Drop.Active = true -- doom#1337
					Drop.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Drop.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Drop.Position = UDIM2(0, 0, 1, 1) -- doom#1337
					Drop.Size = UDIM2(1, 0, 0, 20) -- doom#1337
					Drop.Visible = false -- doom#1337
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
					Drop.ScrollBarThickness = 4 -- doom#1337
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.AutomaticCanvasSize = "Y" -- doom#1337
					Drop.ZIndex = 5 -- doom#1337
					Drop.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

					UIListLayout.Parent = Drop -- doom#1337
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337


					local amount = data.Amount or 6 -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,amount * 16 + 8) -- doom#1337

					local num = #joe -- doom#1337
					if num > 5 then -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 85) -- doom#1337
					else -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 17*num) -- doom#1337
					end -- doom#1337
					local first = true -- doom#1337
					for i,v in ipairs(joe) do -- doom#1337
						do -- doom#1337
							local joell = v -- doom#1337
							local Scroll = INST("Frame") -- doom#1337
							local joe2 = data.options[v] -- doom#1337
							local Button = INST("TextButton") -- doom#1337
							local TextLabel = INST("TextLabel") -- doom#1337

							Button.Name = v -- doom#1337
							Button.Parent = Drop -- doom#1337
							Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
							Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
							Button.AutoButtonColor = false -- doom#1337
							Button.Font = Enum.Font.SourceSans -- doom#1337
							Button.Text = "" -- doom#1337
							Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
							Button.TextSize = 14.000 -- doom#1337
							Button.BorderSizePixel = 0 -- doom#1337
							Button.ZIndex = 6 -- doom#1337

							TextLabel.Parent = Button -- doom#1337
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
							TextLabel.BackgroundTransparency = 1.000 -- doom#1337
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
							TextLabel.Position = UDIM2(0, 5, 0, -1) -- doom#1337
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
							TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
							TextLabel.Text = v -- doom#1337
							TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
							TextLabel.TextSize = 14.000 -- doom#1337
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
							TextLabel.ZIndex = 6 -- doom#1337

							Button.MouseButton1Down:Connect(function() -- doom#1337
								Drop.Visible = false -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
								abcd.Text = v -- doom#1337
								for i,v in pairs(Scroll.Parent:GetChildren()) do -- doom#1337
									if v:IsA("Frame") then -- doom#1337
										v.Visible = false -- doom#1337
									end -- doom#1337
								end -- doom#1337
								Element.value.Dropdown = v -- doom#1337
								Scroll.Visible = true -- doom#1337
								callback(Element.value) -- doom#1337
							end) -- doom#1337
							Button.MouseEnter:Connect(function() -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)}) -- doom#1337
							end) -- doom#1337
							Button.MouseLeave:Connect(function() -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)}) -- doom#1337
							end) -- doom#1337

							if first then -- doom#1337
								abcd.Text = v -- doom#1337
								Element.value.Dropdown = v -- doom#1337
							end -- doom#1337
							local Frame = INST("ScrollingFrame") -- doom#1337
							local UIListLayout = INST("UIListLayout") -- doom#1337

							Scroll.Name = "Scroll" -- doom#1337
							Scroll.Parent = Dropdown -- doom#1337
							Scroll.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
							Scroll.BackgroundTransparency = 1.000 -- doom#1337
							Scroll.Position = UDIM2(0, 0, 0, 0) -- doom#1337
							Scroll.Size = UDIM2(1, 0, 0, amount * 16 + 8) -- doom#1337
							Scroll.Visible = first -- doom#1337
							Scroll.Name = v -- doom#1337


							Frame.Name = "Frame" -- doom#1337
							Frame.Parent = Scroll -- doom#1337
							Frame.Active = true -- doom#1337
							Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Frame.Position = UDIM2(0, 30, 0, 40) -- doom#1337
							Frame.Size = UDIM2(0, 175, 0, 16 * amount) -- doom#1337
							Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
							Frame.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
							Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
							Frame.ScrollBarThickness = 4 -- doom#1337
							Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
							Frame.AutomaticCanvasSize = "Y" -- doom#1337
							Frame.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

							UIListLayout.Parent = Frame -- doom#1337
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
							local joll = true -- doom#1337
							for i,v in ipairs(joe2) do -- doom#1337
								local Button = INST("TextButton") -- doom#1337
								local TextLabel = INST("TextLabel") -- doom#1337

								Button.Name = v -- doom#1337
								Button.Parent = Frame -- doom#1337
								Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
								Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
								Button.BorderSizePixel = 0 -- doom#1337
								Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
								Button.Size = UDIM2(1, 0, 0, 16) -- doom#1337
								Button.AutoButtonColor = false -- doom#1337
								Button.Font = Enum.Font.SourceSans -- doom#1337
								Button.Text = "" -- doom#1337
								Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
								Button.TextSize = 14.000 -- doom#1337

								TextLabel.Parent = Button -- doom#1337
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
								TextLabel.BackgroundTransparency = 1.000 -- doom#1337
								TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
								TextLabel.Position = UDIM2(0, 4, 0, -1) -- doom#1337
								TextLabel.Size = UDIM2(1, 1, 1, 1) -- doom#1337
								TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
								TextLabel.Text = v -- doom#1337
								TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
								TextLabel.TextSize = 14.000 -- doom#1337
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
								if joll then -- doom#1337
									joll = false -- doom#1337
									TextLabel.TextColor3 = COL3RGB(255, 37, 110) -- doom#1337
								end -- doom#1337

								Button.MouseButton1Down:Connect(function() -- doom#1337

									for i,v in pairs(Frame:GetChildren()) do -- doom#1337
										if v:IsA("TextButton") then -- doom#1337
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
										end -- doom#1337
									end -- doom#1337

									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337

									Element.value.Scroll[joell] = v -- doom#1337

									values[tabname][sectorname][text] = Element.value -- doom#1337
									callback(Element.value) -- doom#1337
								end) -- doom#1337
								Button.MouseEnter:Connect(function() -- doom#1337
									if Element.value.Scroll[joell] ~= v then -- doom#1337
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
									end -- doom#1337
								end) -- doom#1337
								Button.MouseLeave:Connect(function() -- doom#1337
									if Element.value.Scroll[joell] ~= v then -- doom#1337
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
									end -- doom#1337
								end) -- doom#1337
							end -- doom#1337
							first = false -- doom#1337
						end -- doom#1337
					end -- doom#1337

					ImageLabel.Parent = Button -- doom#1337
					ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					ImageLabel.BackgroundTransparency = 1.000 -- doom#1337
					ImageLabel.Position = UDIM2(0, 165, 0, 6) -- doom#1337
					ImageLabel.Size = UDIM2(0, 6, 0, 4) -- doom#1337
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" -- doom#1337

					TextLabel_3.Parent = Dropdown -- doom#1337
					TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel_3.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel_3.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0) -- doom#1337
					TextLabel_3.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel_3.Text = text -- doom#1337
					TextLabel_3.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel_3.TextSize = 14.000 -- doom#1337
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						Drop.Visible = not Drop.Visible -- doom#1337
						if not Drop.Visible then -- doom#1337
							Drop.CanvasPosition = Vec2(0,0) -- doom#1337
						end -- doom#1337
					end) -- doom#1337
					local indrop = false -- doom#1337
					local ind = false -- doom#1337
					Drop.MouseEnter:Connect(function() -- doom#1337
						indrop = true -- doom#1337
					end) -- doom#1337
					Drop.MouseLeave:Connect(function() -- doom#1337
						indrop = false -- doom#1337
					end) -- doom#1337
					Button.MouseEnter:Connect(function() -- doom#1337
						ind = true -- doom#1337
					end) -- doom#1337
					Button.MouseLeave:Connect(function() -- doom#1337
						ind = false -- doom#1337
					end) -- doom#1337
					game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
							if Drop.Visible == true and not indrop and not ind then -- doom#1337
								Drop.Visible = false -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end) -- doom#1337

					function Element:SetValue(tbl) -- doom#1337
						Element.value = tbl -- doom#1337
						abcd.Text = tbl.Dropdown -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						for i,v in pairs(Dropdown:GetChildren()) do -- doom#1337
							if v:IsA("Frame") then -- doom#1337
								if v.Name == Element.value.Dropdown then -- doom#1337
									v.Visible = true -- doom#1337
								else -- doom#1337
									v.Visible = false -- doom#1337
								end -- doom#1337
								for _,bad in pairs(v.Frame:GetChildren()) do -- doom#1337
									if bad:IsA("TextButton") then -- doom#1337
										bad.TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
										if bad.Name == Element.value.Scroll[v.Name] then -- doom#1337
											bad.TextLabel.TextColor3 = COL3RGB(255, 37, 110) -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end -- doom#1337

					if data.default then -- doom#1337
						Element:SetValue(data.default) -- doom#1337
					end -- doom#1337

					values[tabname][sectorname][text] = Element.value -- doom#1337

				elseif type == "Scroll" then -- doom#1337
					local amount = data.Amount or 6 -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,amount * 16 + 8) -- doom#1337
					if data.alphabet then -- doom#1337
						TBLSORT(data.options, function(a,b) -- doom#1337
							return a < b -- doom#1337
						end) -- doom#1337
					end -- doom#1337
					Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]} -- doom#1337

					local Scroll = INST("Frame") -- doom#1337
					local Frame = INST("ScrollingFrame") -- doom#1337
					local UIListLayout = INST("UIListLayout") -- doom#1337

					Scroll.Name = "Scroll" -- doom#1337
					Scroll.Parent = Inner -- doom#1337
					Scroll.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Scroll.BackgroundTransparency = 1.000 -- doom#1337
					Scroll.Position = UDIM2(0, 0, 00, 0) -- doom#1337
					Scroll.Size = UDIM2(1, 0, 0, amount * 16 + 8) -- doom#1337


					Frame.Name = "Frame" -- doom#1337
					Frame.Parent = Scroll -- doom#1337
					Frame.Active = true -- doom#1337
					Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Frame.Position = UDIM2(0, 30, 0, 0) -- doom#1337
					Frame.Size = UDIM2(0, 175, 0, 16 * amount) -- doom#1337
					Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Frame.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
					Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Frame.ScrollBarThickness = 4 -- doom#1337
					Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Frame.AutomaticCanvasSize = "Y" -- doom#1337
					Frame.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

					UIListLayout.Parent = Frame -- doom#1337
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337
					local first = true -- doom#1337
					for i,v in ipairs(data.options) do -- doom#1337
						local Button = INST("TextButton") -- doom#1337
						local TextLabel = INST("TextLabel") -- doom#1337

						Button.Name = v -- doom#1337
						Button.Parent = Frame -- doom#1337
						Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Button.BorderSizePixel = 0 -- doom#1337
						Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
						Button.Size = UDIM2(1, 0, 0, 16) -- doom#1337
						Button.AutoButtonColor = false -- doom#1337
						Button.Font = Enum.Font.SourceSans -- doom#1337
						Button.Text = "" -- doom#1337
						Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
						Button.TextSize = 14.000 -- doom#1337

						TextLabel.Parent = Button -- doom#1337
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
						TextLabel.BackgroundTransparency = 1.000 -- doom#1337
						TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
						TextLabel.Position = UDIM2(0, 4, 0, -1) -- doom#1337
						TextLabel.Size = UDIM2(1, 1, 1, 1) -- doom#1337
						TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
						TextLabel.Text = v -- doom#1337
						TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						TextLabel.TextSize = 14.000 -- doom#1337
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
						if first then first = false -- doom#1337
							TextLabel.TextColor3 = COL3RGB(255, 37, 110) -- doom#1337
						end -- doom#1337

						Button.MouseButton1Down:Connect(function() -- doom#1337

							for i,v in pairs(Frame:GetChildren()) do -- doom#1337
								if v:IsA("TextButton") then -- doom#1337
									library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
								end -- doom#1337
							end -- doom#1337

							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337

							Element.value.Scroll = v -- doom#1337

							values[tabname][sectorname][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end) -- doom#1337
						Button.MouseEnter:Connect(function() -- doom#1337
							if Element.value.Scroll ~= v then -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						Button.MouseLeave:Connect(function() -- doom#1337
							if Element.value.Scroll ~= v then -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end -- doom#1337

					function Element:SetValue(val) -- doom#1337
						Element.value = val -- doom#1337

						for i,v in pairs(Frame:GetChildren()) do -- doom#1337
							if v:IsA("TextButton") then -- doom#1337
								library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
							end -- doom#1337
						end -- doom#1337

						library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
				elseif type == "Jumbobox" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,39) -- doom#1337
					Element.value = {Jumbobox = {}} -- doom#1337
					data.options = data.options or {} -- doom#1337

					local Dropdown = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337
					local Drop = INST("ScrollingFrame") -- doom#1337
					local Button_2 = INST("TextButton") -- doom#1337
					local TextLabel_2 = INST("TextLabel") -- doom#1337
					local UIListLayout = INST("UIListLayout") -- doom#1337
					local ImageLabel = INST("ImageLabel") -- doom#1337
					local TextLabel_3 = INST("TextLabel") -- doom#1337

					Dropdown.Name = "Dropdown" -- doom#1337
					Dropdown.Parent = Inner -- doom#1337
					Dropdown.BackgroundColor3 = COL3RGB(33, 35, 255) -- doom#1337
					Dropdown.BackgroundTransparency = 1.000 -- doom#1337
					Dropdown.Position = UDIM2(0, 0, 0.255102038, 0) -- doom#1337
					Dropdown.Size = UDIM2(1, 0, 0, 39) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Dropdown -- doom#1337
					Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
					Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
					Button.AutoButtonColor = false -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
					TextLabel.Position = UDIM2(0, 5, 0, 0) -- doom#1337
					TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = "..." -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local abcd = TextLabel -- doom#1337

					Drop.Name = "Drop" -- doom#1337
					Drop.Parent = Button -- doom#1337
					Drop.Active = true -- doom#1337
					Drop.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Drop.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Drop.Position = UDIM2(0, 0, 1, 1) -- doom#1337
					Drop.Size = UDIM2(1, 0, 0, 20) -- doom#1337
					Drop.Visible = false -- doom#1337
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
					Drop.ScrollBarThickness = 4 -- doom#1337
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					--Drop.AutomaticCanvasSize = "Y" -- doom#1337
					for i,v in pairs(data.options) do -- doom#1337
						Drop.CanvasSize = Drop.CanvasSize + UDIM2(0, 0, 0, 17) -- doom#1337
					end -- doom#1337
					Drop.ZIndex = 5 -- doom#1337
					Drop.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

					UIListLayout.Parent = Drop -- doom#1337
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

					values[tabname][sectorname][text] = Element.value -- doom#1337

					local num = #data.options -- doom#1337
					if num > 5 then -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 85) -- doom#1337
					else -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 17*num) -- doom#1337
					end -- doom#1337
					local first = true -- doom#1337

					local function updatetext() -- doom#1337
						local old = {} -- doom#1337
						for i,v in ipairs(data.options) do -- doom#1337
							if TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
								INSERT(old, v) -- doom#1337
							else -- doom#1337
							end -- doom#1337
						end -- doom#1337
						local str = "" -- doom#1337


						if #old == 0 then -- doom#1337
							str = "..." -- doom#1337
						else -- doom#1337
							if #old == 1 then -- doom#1337
								str = old[1] -- doom#1337
							else -- doom#1337
								for i,v in ipairs(old) do -- doom#1337
									if i == 1 then -- doom#1337
										str = v -- doom#1337
									else -- doom#1337
										if i > 2 then -- doom#1337
											if i < 4 then -- doom#1337
												str = str..",  ..." -- doom#1337
											end -- doom#1337
										else -- doom#1337
											str = str..",  "..v -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337

						abcd.Text = str -- doom#1337
					end -- doom#1337
					for i,v in ipairs(data.options) do -- doom#1337
						do -- doom#1337
							local Button = INST("TextButton") -- doom#1337
							local TextLabel = INST("TextLabel") -- doom#1337

							Button.Name = v -- doom#1337
							Button.Parent = Drop -- doom#1337
							Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
							Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
							Button.AutoButtonColor = false -- doom#1337
							Button.Font = Enum.Font.SourceSans -- doom#1337
							Button.Text = "" -- doom#1337
							Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
							Button.TextSize = 14.000 -- doom#1337
							Button.BorderSizePixel = 0 -- doom#1337
							Button.ZIndex = 6 -- doom#1337

							TextLabel.Parent = Button -- doom#1337
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
							TextLabel.BackgroundTransparency = 1.000 -- doom#1337
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
							TextLabel.Position = UDIM2(0, 5, 0, -1) -- doom#1337
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
							TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
							TextLabel.Text = v -- doom#1337
							TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
							TextLabel.TextSize = 14.000 -- doom#1337
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
							TextLabel.ZIndex = 6 -- doom#1337

							Button.MouseButton1Down:Connect(function() -- doom#1337
								if TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
									for i,a in pairs(Element.value.Jumbobox) do -- doom#1337
										if a == v then -- doom#1337
											TBLREMOVE(Element.value.Jumbobox, i) -- doom#1337
										end -- doom#1337
									end -- doom#1337
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
								else -- doom#1337
									INSERT(Element.value.Jumbobox, v) -- doom#1337
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(175, 42, 86)}) -- doom#1337
								end -- doom#1337
								updatetext() -- doom#1337

								values[tabname][sectorname][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
							end) -- doom#1337
							Button.MouseEnter:Connect(function() -- doom#1337
								if not TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
								end -- doom#1337
							end) -- doom#1337
							Button.MouseLeave:Connect(function() -- doom#1337
								if not TBLFIND(Element.value.Jumbobox, v) then -- doom#1337
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
								end -- doom#1337
							end) -- doom#1337

							first = false -- doom#1337
						end -- doom#1337
					end -- doom#1337
					function Element:SetValue(val) -- doom#1337
						Element.value = val -- doom#1337
						for i,v in pairs(Drop:GetChildren()) do -- doom#1337
							if v.Name ~= "UIListLayout" then -- doom#1337
								if TBLFIND(val.Jumbobox, v.Name) then -- doom#1337
									v.TextLabel.TextColor3 = COL3RGB(175, 42, 86) -- doom#1337
								else -- doom#1337
									v.TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337
						updatetext() -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(val) -- doom#1337
					end -- doom#1337
					if data.default then -- doom#1337
						Element:SetValue(data.default) -- doom#1337
					end -- doom#1337

					ImageLabel.Parent = Button -- doom#1337
					ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					ImageLabel.BackgroundTransparency = 1.000 -- doom#1337
					ImageLabel.Position = UDIM2(0, 165, 0, 6) -- doom#1337
					ImageLabel.Size = UDIM2(0, 6, 0, 4) -- doom#1337
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" -- doom#1337

					TextLabel_3.Parent = Dropdown -- doom#1337
					TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel_3.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel_3.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0) -- doom#1337
					TextLabel_3.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel_3.Text = text -- doom#1337
					TextLabel_3.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel_3.TextSize = 14.000 -- doom#1337
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						Drop.Visible = not Drop.Visible -- doom#1337
						if not Drop.Visible then -- doom#1337
							Drop.CanvasPosition = Vec2(0,0) -- doom#1337
						end -- doom#1337
					end) -- doom#1337
					local indrop = false -- doom#1337
					local ind = false -- doom#1337
					Drop.MouseEnter:Connect(function() -- doom#1337
						indrop = true -- doom#1337
					end) -- doom#1337
					Drop.MouseLeave:Connect(function() -- doom#1337
						indrop = false -- doom#1337
					end) -- doom#1337
					Button.MouseEnter:Connect(function() -- doom#1337
						ind = true -- doom#1337
					end) -- doom#1337
					Button.MouseLeave:Connect(function() -- doom#1337
						ind = false -- doom#1337
					end) -- doom#1337
					game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
							if Drop.Visible == true and not indrop and not ind then -- doom#1337
								Drop.Visible = false -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end) -- doom#1337
				elseif type == "ToggleKeybind" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,16) -- doom#1337
					Element.value = {Toggle = data.default and data.default.Toggle or false, Key, Type = "Always", Active = true} -- doom#1337

					local Toggle = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local Color = INST("Frame") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337

					Toggle.Name = "Toggle" -- doom#1337
					Toggle.Parent = Inner -- doom#1337
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Toggle.BackgroundTransparency = 1.000 -- doom#1337
					Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Toggle -- doom#1337
					Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Button.BackgroundTransparency = 1.000 -- doom#1337
					Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					Color.Name = "Color" -- doom#1337
					Color.Parent = Button -- doom#1337
					Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
					Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337
					local binding = false -- doom#1337
					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = text -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local function update() -- doom#1337
						if Element.value.Toggle then -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 22, 66)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						else -- doom#1337
							keybindremove(text) -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						if not binding then -- doom#1337
							Element.value.Toggle = not Element.value.Toggle -- doom#1337
							update() -- doom#1337
							values[tabname][sectorname][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end -- doom#1337
					end) -- doom#1337
					if data.default then -- doom#1337
						update() -- doom#1337
					end -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
					do -- doom#1337
						local Keybind = INST("TextButton") -- doom#1337
						local Frame = INST("Frame") -- doom#1337
						local Always = INST("TextButton") -- doom#1337
						local UIListLayout = INST("UIListLayout") -- doom#1337
						local Hold = INST("TextButton") -- doom#1337
						local Toggle = INST("TextButton") -- doom#1337

						Keybind.Name = "Keybind" -- doom#1337
						Keybind.Parent = Button -- doom#1337
						Keybind.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Keybind.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Keybind.Position = UDIM2(0, 270, 0.5, -6) -- doom#1337
						Keybind.Text = "NONE" -- doom#1337
						Keybind.Size = UDIM2(0, 43, 0, 12) -- doom#1337
						Keybind.Size = UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12) -- doom#1337
						Keybind.AutoButtonColor = false -- doom#1337
						Keybind.Font = Enum.Font.SourceSansSemibold -- doom#1337
						Keybind.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						Keybind.TextSize = 14.000 -- doom#1337
						Keybind.AnchorPoint = Vec2(1,0) -- doom#1337
						Keybind.ZIndex = 3 -- doom#1337

						Frame.Parent = Keybind -- doom#1337
						Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Frame.Position = UDIM2(1, -49, 0, 1) -- doom#1337
						Frame.Size = UDIM2(0, 49, 0, 49) -- doom#1337
						Frame.Visible = false -- doom#1337
						Frame.ZIndex = 3 -- doom#1337

						Always.Name = "Always" -- doom#1337
						Always.Parent = Frame -- doom#1337
						Always.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Always.BackgroundTransparency = 1.000 -- doom#1337
						Always.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Always.Position = UDIM2(-3.03289485, 231, 0.115384616, -6) -- doom#1337
						Always.Size = UDIM2(1, 0, 0, 16) -- doom#1337
						Always.AutoButtonColor = false -- doom#1337
						Always.Font = Enum.Font.SourceSansBold -- doom#1337
						Always.Text = "Always" -- doom#1337
						Always.TextColor3 = COL3RGB(173, 24, 72) -- doom#1337
						Always.TextSize = 14.000 -- doom#1337
						Always.ZIndex = 3 -- doom#1337

						UIListLayout.Parent = Frame -- doom#1337
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

						Hold.Name = "Hold" -- doom#1337
						Hold.Parent = Frame -- doom#1337
						Hold.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Hold.BackgroundTransparency = 1.000 -- doom#1337
						Hold.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Hold.Position = UDIM2(-3.03289485, 231, 0.115384616, -6) -- doom#1337
						Hold.Size = UDIM2(1, 0, 0, 16) -- doom#1337
						Hold.AutoButtonColor = false -- doom#1337
						Hold.Font = Enum.Font.SourceSansSemibold -- doom#1337
						Hold.Text = "Hold" -- doom#1337
						Hold.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						Hold.TextSize = 14.000 -- doom#1337
						Hold.ZIndex = 3 -- doom#1337

						Toggle.Name = "Toggle" -- doom#1337
						Toggle.Parent = Frame -- doom#1337
						Toggle.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
						Toggle.BackgroundTransparency = 1.000 -- doom#1337
						Toggle.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
						Toggle.Position = UDIM2(-3.03289485, 231, 0.115384616, -6) -- doom#1337
						Toggle.Size = UDIM2(1, 0, 0, 16) -- doom#1337
						Toggle.AutoButtonColor = false -- doom#1337
						Toggle.Font = Enum.Font.SourceSansSemibold -- doom#1337
						Toggle.Text = "Toggle" -- doom#1337
						Toggle.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
						Toggle.TextSize = 14.000 -- doom#1337
						Toggle.ZIndex = 3 -- doom#1337

						for _,button in pairs(Frame:GetChildren()) do -- doom#1337
							if button:IsA("TextButton") then -- doom#1337
								button.MouseButton1Down:Connect(function() -- doom#1337
									Element.value.Type = button.Text -- doom#1337
									Frame.Visible = false -- doom#1337
									if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then -- doom#1337
										Element.value.Active = Element.value.Type == "Always" and true or false -- doom#1337
										callback(Element.value) -- doom#1337
									end -- doom#1337
									if button.Text == "Always" then -- doom#1337
										keybindremove(text) -- doom#1337
									end -- doom#1337
									for _,button in pairs(Frame:GetChildren()) do -- doom#1337
										if button:IsA("TextButton") and button.Text ~= Element.value.Type then -- doom#1337
											button.Font = Enum.Font.SourceSansSemibold -- doom#1337
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)}) -- doom#1337
										end -- doom#1337
									end -- doom#1337
									button.Font = Enum.Font.SourceSansBold -- doom#1337
									button.TextColor3 = COL3RGB(173, 24, 74) -- doom#1337
									values[tabname][sectorname][text] = Element.value -- doom#1337
								end) -- doom#1337
								button.MouseEnter:Connect(function() -- doom#1337
									if Element.value.Type ~= button.Text then -- doom#1337
										library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255,255,255)}) -- doom#1337
									end -- doom#1337
								end) -- doom#1337
								button.MouseLeave:Connect(function() -- doom#1337
									if Element.value.Type ~= button.Text then -- doom#1337
										library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)}) -- doom#1337
									end -- doom#1337
								end) -- doom#1337
							end -- doom#1337
						end -- doom#1337
						Keybind.MouseButton1Down:Connect(function() -- doom#1337
							if not binding then -- doom#1337
								wait() -- doom#1337
								binding = true -- doom#1337
								Keybind.Text = "..." -- doom#1337
								Keybind.Size = UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12) -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						Keybind.MouseButton2Down:Connect(function() -- doom#1337
							if not binding then -- doom#1337
								Frame.Visible = not Frame.Visible -- doom#1337
							end -- doom#1337
						end) -- doom#1337
						local Player = game.Players.LocalPlayer -- doom#1337
						local Mouse = Player:GetMouse() -- doom#1337
						local InFrame = false -- doom#1337
						Frame.MouseEnter:Connect(function() -- doom#1337
							InFrame = true -- doom#1337
						end) -- doom#1337
						Frame.MouseLeave:Connect(function() -- doom#1337
							InFrame = false -- doom#1337
						end) -- doom#1337
						local InFrame2 = false -- doom#1337
						Keybind.MouseEnter:Connect(function() -- doom#1337
							InFrame2 = true -- doom#1337
						end) -- doom#1337
						Keybind.MouseLeave:Connect(function() -- doom#1337
							InFrame2 = false -- doom#1337
						end) -- doom#1337
						game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then -- doom#1337
								if Frame.Visible == true and not InFrame and not InFrame2 then -- doom#1337
									Frame.Visible = false -- doom#1337
								end -- doom#1337
							end -- doom#1337
							if binding then -- doom#1337
								binding = false -- doom#1337
								Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() -- doom#1337
								Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12) -- doom#1337
								Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name -- doom#1337
								if input.KeyCode.Name == "Backspace" then -- doom#1337
									Keybind.Text = "NONE" -- doom#1337
									Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12) -- doom#1337
									Element.value.Key = nil -- doom#1337
									Element.value.Active = true -- doom#1337
								end -- doom#1337
								callback(Element.value) -- doom#1337
							else -- doom#1337
								if Element.value.Key ~= nil then -- doom#1337
									if FIND(Element.value.Key, "Mouse") then -- doom#1337
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then -- doom#1337
											if Element.value.Type == "Hold" then -- doom#1337
												Element.value.Active = true -- doom#1337
												callback(Element.value) -- doom#1337
												if Element.value.Active and Element.value.Toggle then -- doom#1337
													keybindadd(text) -- doom#1337
												else -- doom#1337
													keybindremove(text) -- doom#1337
												end -- doom#1337
											elseif Element.value.Type == "Toggle" then -- doom#1337
												Element.value.Active = not Element.value.Active -- doom#1337
												callback(Element.value) -- doom#1337
												if Element.value.Active and Element.value.Toggle then -- doom#1337
													keybindadd(text) -- doom#1337
												else -- doom#1337
													keybindremove(text) -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									else -- doom#1337
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then -- doom#1337
											if Element.value.Type == "Hold" then -- doom#1337
												Element.value.Active = true -- doom#1337
												callback(Element.value) -- doom#1337
												if Element.value.Active and Element.value.Toggle then -- doom#1337
													keybindadd(text) -- doom#1337
												else -- doom#1337
													keybindremove(text) -- doom#1337
												end -- doom#1337
											elseif Element.value.Type == "Toggle" then -- doom#1337
												Element.value.Active = not Element.value.Active -- doom#1337
												callback(Element.value) -- doom#1337
												if Element.value.Active and Element.value.Toggle then -- doom#1337
													keybindadd(text) -- doom#1337
												else -- doom#1337
													keybindremove(text) -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								else -- doom#1337
									Element.value.Active = true -- doom#1337
								end -- doom#1337
							end -- doom#1337
							values[tabname][sectorname][text] = Element.value -- doom#1337
						end) -- doom#1337
						game:GetService("UserInputService").InputEnded:Connect(function(input) -- doom#1337
							if Element.value.Key ~= nil then -- doom#1337
								if FIND(Element.value.Key, "Mouse") then -- doom#1337
									if input.UserInputType == Enum.UserInputType[Element.value.Key] then -- doom#1337
										if Element.value.Type == "Hold" then -- doom#1337
											Element.value.Active = false -- doom#1337
											callback(Element.value) -- doom#1337
											if Element.value.Active then -- doom#1337
												keybindadd(text) -- doom#1337
											else -- doom#1337
												keybindremove(text) -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								else -- doom#1337
									if input.KeyCode == Enum.KeyCode[Element.value.Key] then -- doom#1337
										if Element.value.Type == "Hold" then -- doom#1337
											Element.value.Active = false -- doom#1337
											callback(Element.value) -- doom#1337
											if Element.value.Active then -- doom#1337
												keybindadd(text) -- doom#1337
											else -- doom#1337
												keybindremove(text) -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
							values[tabname][sectorname][text] = Element.value -- doom#1337
						end) -- doom#1337
					end -- doom#1337
					function Element:SetValue(value) -- doom#1337
						Element.value = value -- doom#1337
						update() -- doom#1337
					end -- doom#1337
				elseif type == "Toggle" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,16) -- doom#1337
					Element.value = {Toggle = data.default and data.default.Toggle or false} -- doom#1337

					local Toggle = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local Color = INST("Frame") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337

					Toggle.Name = "Toggle" -- doom#1337
					Toggle.Parent = Inner -- doom#1337
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Toggle.BackgroundTransparency = 1.000 -- doom#1337
					Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Toggle -- doom#1337
					Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Button.BackgroundTransparency = 1.000 -- doom#1337
					Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					Color.Name = "Color" -- doom#1337
					Color.Parent = Button -- doom#1337
					Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
					Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337

					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = text -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local function update() -- doom#1337
						if Element.value.Toggle then -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 26, 66)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						else -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
					end -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						Element.value.Toggle = not Element.value.Toggle -- doom#1337
						update() -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end) -- doom#1337
					if data.default then -- doom#1337
						update() -- doom#1337
					end -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
					function Element:SetValue(value) -- doom#1337
						Element.value = value -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						update() -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
				elseif type == "ToggleColor" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,16) -- doom#1337
					Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255)} -- doom#1337

					local Toggle = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local Color = INST("Frame") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337

					Toggle.Name = "Toggle" -- doom#1337
					Toggle.Parent = Inner -- doom#1337
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Toggle.BackgroundTransparency = 1.000 -- doom#1337
					Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Toggle -- doom#1337
					Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Button.BackgroundTransparency = 1.000 -- doom#1337
					Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					Color.Name = "Color" -- doom#1337
					Color.Parent = Button -- doom#1337
					Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
					Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337

					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = text -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local function update() -- doom#1337
						if Element.value.Toggle then -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 26, 66)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						else -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
					end -- doom#1337

					local ColorH,ColorS,ColorV -- doom#1337

					local ColorP = INST("TextButton") -- doom#1337
					local Frame = INST("Frame") -- doom#1337
					local Colorpick = INST("ImageButton") -- doom#1337
					local ColorDrag = INST("Frame") -- doom#1337
					local Huepick = INST("ImageButton") -- doom#1337
					local Huedrag = INST("Frame") -- doom#1337

					ColorP.Name = "ColorP" -- doom#1337
					ColorP.Parent = Button -- doom#1337
					ColorP.AnchorPoint = Vec2(1, 0) -- doom#1337
					ColorP.BackgroundColor3 = COL3RGB(255, 0, 0) -- doom#1337
					ColorP.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					ColorP.Position = UDIM2(0, 270, 0.5, -4) -- doom#1337
					ColorP.Size = UDIM2(0, 18, 0, 8) -- doom#1337
					ColorP.AutoButtonColor = false -- doom#1337
					ColorP.Font = Enum.Font.SourceSansSemibold -- doom#1337
					ColorP.Text = "" -- doom#1337
					ColorP.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					ColorP.TextSize = 14.000 -- doom#1337

					Frame.Parent = ColorP -- doom#1337
					Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0) -- doom#1337
					Frame.Size = UDIM2(0, 200, 0, 170) -- doom#1337
					Frame.Visible = false -- doom#1337
					Frame.ZIndex = 3 -- doom#1337

					Colorpick.Name = "Colorpick" -- doom#1337
					Colorpick.Parent = Frame -- doom#1337
					Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Colorpick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Colorpick.ClipsDescendants = false -- doom#1337
					Colorpick.Position = UDIM2(0, 40, 0, 10) -- doom#1337
					Colorpick.Size = UDIM2(0, 150, 0, 150) -- doom#1337
					Colorpick.AutoButtonColor = false -- doom#1337
					Colorpick.Image = "rbxassetid://4155801252" -- doom#1337
					Colorpick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
					Colorpick.ZIndex = 3 -- doom#1337

					ColorDrag.Name = "ColorDrag" -- doom#1337
					ColorDrag.Parent = Colorpick -- doom#1337
					ColorDrag.AnchorPoint = Vec2(0.5, 0.5) -- doom#1337
					ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					ColorDrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					ColorDrag.Size = UDIM2(0, 4, 0, 4) -- doom#1337
					ColorDrag.ZIndex = 3 -- doom#1337

					Huepick.Name = "Huepick" -- doom#1337
					Huepick.Parent = Frame -- doom#1337
					Huepick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Huepick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Huepick.ClipsDescendants = false -- doom#1337
					Huepick.Position = UDIM2(0, 10, 0, 10) -- doom#1337
					Huepick.Size = UDIM2(0, 20, 0, 150) -- doom#1337
					Huepick.AutoButtonColor = false -- doom#1337
					Huepick.Image = "rbxassetid://3641079629" -- doom#1337
					Huepick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
					Huepick.ImageTransparency = 1 -- doom#1337
					Huepick.BackgroundTransparency = 0 -- doom#1337
					Huepick.ZIndex = 3 -- doom#1337

					local HueFrameGradient = INST("UIGradient") -- doom#1337
					HueFrameGradient.Rotation = 90 -- doom#1337
					HueFrameGradient.Name = "HueFrameGradient" -- doom#1337
					HueFrameGradient.Parent = Huepick -- doom#1337
					HueFrameGradient.Color = ColorSequence.new { -- doom#1337
						ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)), -- doom#1337
						ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)), -- doom#1337
						ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)), -- doom#1337
						ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)), -- doom#1337
						ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)), -- doom#1337
						ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)), -- doom#1337
						ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0)) -- doom#1337
					}	 -- doom#1337

					Huedrag.Name = "Huedrag" -- doom#1337
					Huedrag.Parent = Huepick -- doom#1337
					Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Huedrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Huedrag.Size = UDIM2(1, 0, 0, 2) -- doom#1337
					Huedrag.ZIndex = 3 -- doom#1337

					ColorP.MouseButton1Down:Connect(function() -- doom#1337
						Frame.Visible = not Frame.Visible -- doom#1337
					end) -- doom#1337
					local abc = false -- doom#1337
					local inCP = false -- doom#1337
					ColorP.MouseEnter:Connect(function() -- doom#1337
						abc = true -- doom#1337
					end) -- doom#1337
					ColorP.MouseLeave:Connect(function() -- doom#1337
						abc = false -- doom#1337
					end) -- doom#1337
					Frame.MouseEnter:Connect(function() -- doom#1337
						inCP = true -- doom#1337
					end) -- doom#1337
					Frame.MouseLeave:Connect(function() -- doom#1337
						inCP = false -- doom#1337
					end) -- doom#1337

					ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) -- doom#1337
					ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
					ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337

					if data.default and data.default.Color ~= nil then -- doom#1337
						ColorH, ColorS, ColorV = data.default.Color:ToHSV() -- doom#1337

						ColorH = CLAMP(ColorH,0,1) -- doom#1337
						ColorS = CLAMP(ColorS,0,1) -- doom#1337
						ColorV = CLAMP(ColorV,0,1) -- doom#1337
						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337

						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337

						values[tabname][sectorname][text] = data.default.Color -- doom#1337
					end -- doom#1337

					local mouse = LocalPlayer:GetMouse() -- doom#1337
					game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
							if not dragging and not abc and not inCP then -- doom#1337
								Frame.Visible = false -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end) -- doom#1337

					local function updateColor() -- doom#1337
						local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
						local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337
						ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0) -- doom#1337
						ColorS = 1-ColorX -- doom#1337
						ColorV = 1-ColorY -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
					local function updateHue() -- doom#1337
						local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) -- doom#1337
						Huedrag.Position = UDIM2(0, 0, 0, y) -- doom#1337
						hue = y/148 -- doom#1337
						ColorH = 1-hue -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
					Colorpick.MouseButton1Down:Connect(function() -- doom#1337
						updateColor() -- doom#1337
						moveconnection = mouse.Move:Connect(function() -- doom#1337
							updateColor() -- doom#1337
						end) -- doom#1337
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
								updateColor() -- doom#1337
								moveconnection:Disconnect() -- doom#1337
								releaseconnection:Disconnect() -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end) -- doom#1337
					Huepick.MouseButton1Down:Connect(function() -- doom#1337
						updateHue() -- doom#1337
						moveconnection = mouse.Move:Connect(function() -- doom#1337
							updateHue() -- doom#1337
						end) -- doom#1337
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
								updateHue() -- doom#1337
								moveconnection:Disconnect() -- doom#1337
								releaseconnection:Disconnect() -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end) -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						Element.value.Toggle = not Element.value.Toggle -- doom#1337
						update() -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end) -- doom#1337
					if data.default then -- doom#1337
						update() -- doom#1337
					end -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
					function Element:SetValue(value) -- doom#1337
						Element.value = value -- doom#1337
						local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B) -- doom#1337
						ColorH, ColorS, ColorV = duplicate:ToHSV() -- doom#1337
						ColorH = CLAMP(ColorH,0,1) -- doom#1337
						ColorS = CLAMP(ColorS,0,1) -- doom#1337
						ColorV = CLAMP(ColorV,0,1) -- doom#1337

						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						update() -- doom#1337
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337

						callback(value) -- doom#1337
					end -- doom#1337
				elseif type == "ToggleTrans" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,16) -- doom#1337
					Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0} -- doom#1337

					local Toggle = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local Color = INST("Frame") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337

					Toggle.Name = "Toggle" -- doom#1337
					Toggle.Parent = Inner -- doom#1337
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Toggle.BackgroundTransparency = 1.000 -- doom#1337
					Toggle.Size = UDIM2(1, 0, 0, 15) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Toggle -- doom#1337
					Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Button.BackgroundTransparency = 1.000 -- doom#1337
					Button.Size = UDIM2(1, 0, 1, 0) -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					Color.Name = "Color" -- doom#1337
					Color.Parent = Button -- doom#1337
					Color.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Color.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Color.Position = UDIM2(0, 15, 0.5, -5) -- doom#1337
					Color.Size = UDIM2(0, 8, 0, 8) -- doom#1337

					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = text -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local function update() -- doom#1337
						if Element.value.Toggle then -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						else -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337

					local ColorH,ColorS,ColorV -- doom#1337

					local ColorP = INST("TextButton") -- doom#1337
					local Frame = INST("Frame") -- doom#1337
					local Colorpick = INST("ImageButton") -- doom#1337
					local ColorDrag = INST("Frame") -- doom#1337
					local Huepick = INST("ImageButton") -- doom#1337
					local Huedrag = INST("Frame") -- doom#1337

					ColorP.Name = "ColorP" -- doom#1337
					ColorP.Parent = Button -- doom#1337
					ColorP.AnchorPoint = Vec2(1, 0) -- doom#1337
					ColorP.BackgroundColor3 = COL3RGB(255, 0, 0) -- doom#1337
					ColorP.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					ColorP.Position = UDIM2(0, 270, 0.5, -4) -- doom#1337
					ColorP.Size = UDIM2(0, 18, 0, 8) -- doom#1337
					ColorP.AutoButtonColor = false -- doom#1337
					ColorP.Font = Enum.Font.SourceSansSemibold -- doom#1337
					ColorP.Text = "" -- doom#1337
					ColorP.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					ColorP.TextSize = 14.000 -- doom#1337

					Frame.Parent = ColorP -- doom#1337
					Frame.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Frame.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0) -- doom#1337
					Frame.Size = UDIM2(0, 200, 0, 190) -- doom#1337
					Frame.Visible = false -- doom#1337
					Frame.ZIndex = 3 -- doom#1337

					Colorpick.Name = "Colorpick" -- doom#1337
					Colorpick.Parent = Frame -- doom#1337
					Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Colorpick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Colorpick.ClipsDescendants = false -- doom#1337
					Colorpick.Position = UDIM2(0, 40, 0, 10) -- doom#1337
					Colorpick.Size = UDIM2(0, 150, 0, 150) -- doom#1337
					Colorpick.AutoButtonColor = false -- doom#1337
					Colorpick.Image = "rbxassetid://4155801252" -- doom#1337
					Colorpick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
					Colorpick.ZIndex = 3 -- doom#1337

					ColorDrag.Name = "ColorDrag" -- doom#1337
					ColorDrag.Parent = Colorpick -- doom#1337
					ColorDrag.AnchorPoint = Vec2(0.5, 0.5) -- doom#1337
					ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					ColorDrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					ColorDrag.Size = UDIM2(0, 4, 0, 4) -- doom#1337
					ColorDrag.ZIndex = 3 -- doom#1337

					Huepick.Name = "Huepick" -- doom#1337
					Huepick.Parent = Frame -- doom#1337
					Huepick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Huepick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Huepick.ClipsDescendants = true -- doom#1337
					Huepick.Position = UDIM2(0, 10, 0, 10) -- doom#1337
					Huepick.Size = UDIM2(0, 20, 0, 150) -- doom#1337
					Huepick.AutoButtonColor = false -- doom#1337
					Huepick.Image = "rbxassetid://3641079629" -- doom#1337
					Huepick.ImageColor3 = COL3RGB(255, 0, 0) -- doom#1337
					Huepick.ImageTransparency = 1 -- doom#1337
					Huepick.BackgroundTransparency = 0 -- doom#1337
					Huepick.ZIndex = 3 -- doom#1337

					local HueFrameGradient = INST("UIGradient") -- doom#1337
					HueFrameGradient.Rotation = 90 -- doom#1337
					HueFrameGradient.Name = "HueFrameGradient" -- doom#1337
					HueFrameGradient.Parent = Huepick -- doom#1337
					HueFrameGradient.Color = ColorSequence.new { -- doom#1337
						ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)), -- doom#1337
						ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)), -- doom#1337
						ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)), -- doom#1337
						ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)), -- doom#1337
						ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)), -- doom#1337
						ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)), -- doom#1337
						ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0)) -- doom#1337
					}	 -- doom#1337

					Huedrag.Name = "Huedrag" -- doom#1337
					Huedrag.Parent = Huepick -- doom#1337
					Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Huedrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Huedrag.Size = UDIM2(1, 0, 0, 2) -- doom#1337
					Huedrag.ZIndex = 3 -- doom#1337

					local Transpick = INST("ImageButton") -- doom#1337
					local Transcolor = INST("ImageLabel") -- doom#1337
					local Transdrag = INST("Frame") -- doom#1337

					Transpick.Name = "Transpick" -- doom#1337
					Transpick.Parent = Frame -- doom#1337
					Transpick.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Transpick.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Transpick.Position = UDIM2(0, 10, 0, 167) -- doom#1337
					Transpick.Size = UDIM2(0, 180, 0, 15) -- doom#1337
					Transpick.AutoButtonColor = false -- doom#1337
					Transpick.Image = "rbxassetid://3887014957" -- doom#1337
					Transpick.ScaleType = Enum.ScaleType.Tile -- doom#1337
					Transpick.TileSize = UDIM2(0, 10, 0, 10) -- doom#1337
					Transpick.ZIndex = 3 -- doom#1337

					Transcolor.Name = "Transcolor" -- doom#1337
					Transcolor.Parent = Transpick -- doom#1337
					Transcolor.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Transcolor.BackgroundTransparency = 1.000 -- doom#1337
					Transcolor.Size = UDIM2(1, 0, 1, 0) -- doom#1337
					Transcolor.Image = "rbxassetid://3887017050" -- doom#1337
					Transcolor.ImageColor3 = COL3RGB(255, 0, 4) -- doom#1337
					Transcolor.ZIndex = 3 -- doom#1337

					Transdrag.Name = "Transdrag" -- doom#1337
					Transdrag.Parent = Transcolor -- doom#1337
					Transdrag.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Transdrag.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Transdrag.Position = UDIM2(0, -1, 0, 0) -- doom#1337
					Transdrag.Size = UDIM2(0, 2, 1, 0) -- doom#1337
					Transdrag.ZIndex = 3 -- doom#1337

					ColorP.MouseButton1Down:Connect(function() -- doom#1337
						Frame.Visible = not Frame.Visible -- doom#1337
					end) -- doom#1337
					local abc = false -- doom#1337
					local inCP = false -- doom#1337
					ColorP.MouseEnter:Connect(function() -- doom#1337
						abc = true -- doom#1337
					end) -- doom#1337
					ColorP.MouseLeave:Connect(function() -- doom#1337
						abc = false -- doom#1337
					end) -- doom#1337
					Frame.MouseEnter:Connect(function() -- doom#1337
						inCP = true -- doom#1337
					end) -- doom#1337
					Frame.MouseLeave:Connect(function() -- doom#1337
						inCP = false -- doom#1337
					end) -- doom#1337

					ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) -- doom#1337
					ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
					ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337

					if data.default and data.default.Color ~= nil then -- doom#1337
						ColorH, ColorS, ColorV = data.default.Color:ToHSV() -- doom#1337

						ColorH = CLAMP(ColorH,0,1) -- doom#1337
						ColorS = CLAMP(ColorS,0,1) -- doom#1337
						ColorV = CLAMP(ColorV,0,1) -- doom#1337
						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337

						Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337

						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337
					end -- doom#1337
					if data.default and data.default.Transparency ~= nil then -- doom#1337
						Transdrag.Position = UDIM2(data.default.Transparency, -1, 0, 0) -- doom#1337
					end -- doom#1337
					local mouse = LocalPlayer:GetMouse() -- doom#1337
					game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
							if not dragging and not abc and not inCP then -- doom#1337
								Frame.Visible = false -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end) -- doom#1337

					local function updateColor() -- doom#1337
						local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) -- doom#1337
						local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) -- doom#1337
						ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0) -- doom#1337
						ColorS = 1-ColorX -- doom#1337
						ColorV = 1-ColorY -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
					local function updateHue() -- doom#1337
						local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) -- doom#1337
						Huedrag.Position = UDIM2(0, 0, 0, y) -- doom#1337
						hue = y/148 -- doom#1337
						ColorH = 1-hue -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
					local function updateTrans() -- doom#1337
						local x = CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178) -- doom#1337
						Transdrag.Position = UDIM2(0, x, 0, 0) -- doom#1337
						Element.value.Transparency = (x/178) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end -- doom#1337
					Transpick.MouseButton1Down:Connect(function() -- doom#1337
						updateTrans() -- doom#1337
						moveconnection = mouse.Move:Connect(function() -- doom#1337
							updateTrans() -- doom#1337
						end) -- doom#1337
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
								updateTrans() -- doom#1337
								moveconnection:Disconnect() -- doom#1337
								releaseconnection:Disconnect() -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end) -- doom#1337
					Colorpick.MouseButton1Down:Connect(function() -- doom#1337
						updateColor() -- doom#1337
						moveconnection = mouse.Move:Connect(function() -- doom#1337
							updateColor() -- doom#1337
						end) -- doom#1337
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
								updateColor() -- doom#1337
								moveconnection:Disconnect() -- doom#1337
								releaseconnection:Disconnect() -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end) -- doom#1337
					Huepick.MouseButton1Down:Connect(function() -- doom#1337
						updateHue() -- doom#1337
						moveconnection = mouse.Move:Connect(function() -- doom#1337
							updateHue() -- doom#1337
						end) -- doom#1337
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) -- doom#1337
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
								updateHue() -- doom#1337
								moveconnection:Disconnect() -- doom#1337
								releaseconnection:Disconnect() -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end) -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						Element.value.Toggle = not Element.value.Toggle -- doom#1337
						update() -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end) -- doom#1337
					if data.default then -- doom#1337
						if Element.value.Toggle then -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
						else -- doom#1337
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(33, 35, 47)}) -- doom#1337
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						end -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
					end -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
					function Element:SetValue(value) -- doom#1337
						Element.value = value -- doom#1337
						local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B) -- doom#1337
						ColorH, ColorS, ColorV = duplicate:ToHSV() -- doom#1337
						ColorH = CLAMP(ColorH,0,1) -- doom#1337
						ColorS = CLAMP(ColorS,0,1) -- doom#1337
						ColorV = CLAMP(ColorV,0,1) -- doom#1337

						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0) -- doom#1337
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1) -- doom#1337
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV) -- doom#1337
						update() -- doom#1337
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1) -- doom#1337
					end -- doom#1337
				elseif type == "TextBox" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,30) -- doom#1337
					Element.value = {Text = data.default and data.default.text or ""} -- doom#1337

					local Box = INST("Frame") -- doom#1337
					local TextBox = INST("TextBox") -- doom#1337

					Box.Name = "Box" -- doom#1337
					Box.Parent = Inner -- doom#1337
					Box.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Box.BackgroundTransparency = 1.000 -- doom#1337
					Box.Position = UDIM2(0, 0, 0.542059898, 0) -- doom#1337
					Box.Size = UDIM2(1, 0, 0, 30) -- doom#1337

					TextBox.Parent = Box -- doom#1337
					TextBox.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					TextBox.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					TextBox.Position = UDIM2(0.108303241, 0, 0.224465579, 0) -- doom#1337
					TextBox.Size = UDIM2(0, 175, 0, 20) -- doom#1337
					TextBox.Font = Enum.Font.SourceSans -- doom#1337
					TextBox.PlaceholderText = data.placeholder -- doom#1337
					TextBox.Text = Element.value.Text -- doom#1337
					TextBox.TextColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextBox.TextSize = 14.000 -- doom#1337

					values[tabname][sectorname][text] = Element.value -- doom#1337

					TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- doom#1337
						if LEN(TextBox.Text) > 10 then -- doom#1337
							TextBox.Text = SUB(TextBox.Text, 1, 10) -- doom#1337
						end -- doom#1337
						Element.value.Text = TextBox.Text -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
					end) -- doom#1337

					function Element:SetValue(value) -- doom#1337
						Element.value = value -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						TextBox.Text = Element.value.Text -- doom#1337
					end -- doom#1337

				elseif type == "Dropdown" then -- doom#1337
					Section.Size = Section.Size + UDIM2(0,0,0,39) -- doom#1337
					Element.value = {Dropdown = data.options[1]} -- doom#1337

					local Dropdown = INST("Frame") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337
					local Drop = INST("ScrollingFrame") -- doom#1337
					local Button_2 = INST("TextButton") -- doom#1337
					local TextLabel_2 = INST("TextLabel") -- doom#1337
					local UIListLayout = INST("UIListLayout") -- doom#1337
					local ImageLabel = INST("ImageLabel") -- doom#1337
					local TextLabel_3 = INST("TextLabel") -- doom#1337

					Dropdown.Name = "Dropdown" -- doom#1337
					Dropdown.Parent = Inner -- doom#1337
					Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Dropdown.BackgroundTransparency = 1.000 -- doom#1337
					Dropdown.Position = UDIM2(0, 0, 0.255102038, 0) -- doom#1337
					Dropdown.Size = UDIM2(1, 0, 0, 39) -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Dropdown -- doom#1337
					Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
					Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
					Button.AutoButtonColor = false -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					TextLabel.Parent = Button -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
					TextLabel.Position = UDIM2(0, 5, 0, 0) -- doom#1337
					TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = Element.value.Dropdown -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					local abcd = TextLabel -- doom#1337

					Drop.Name = "Drop" -- doom#1337
					Drop.Parent = Button -- doom#1337
					Drop.Active = true -- doom#1337
					Drop.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Drop.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Drop.Position = UDIM2(0, 0, 1, 1) -- doom#1337
					Drop.Size = UDIM2(1, 0, 0, 20) -- doom#1337
					Drop.Visible = false -- doom#1337
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.CanvasSize = UDIM2(0, 0, 0, 0) -- doom#1337
					Drop.ScrollBarThickness = 4 -- doom#1337
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" -- doom#1337
					Drop.AutomaticCanvasSize = "Y" -- doom#1337
					Drop.ZIndex = 5 -- doom#1337
					Drop.ScrollBarImageColor3 = COL3RGB(255, 37, 110) -- doom#1337

					UIListLayout.Parent = Drop -- doom#1337
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- doom#1337
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder -- doom#1337

					local num = #data.options -- doom#1337
					if num > 5 then -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 85) -- doom#1337
					else -- doom#1337
						Drop.Size = UDIM2(1, 0, 0, 17*num) -- doom#1337
					end -- doom#1337
					local first = true -- doom#1337
					for i,v in ipairs(data.options) do -- doom#1337
						do -- doom#1337
							local Button = INST("TextButton") -- doom#1337
							local TextLabel = INST("TextLabel") -- doom#1337

							Button.Name = v -- doom#1337
							Button.Parent = Drop -- doom#1337
							Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
							Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
							Button.Position = UDIM2(0, 30, 0, 16) -- doom#1337
							Button.Size = UDIM2(0, 175, 0, 17) -- doom#1337
							Button.AutoButtonColor = false -- doom#1337
							Button.Font = Enum.Font.SourceSans -- doom#1337
							Button.Text = "" -- doom#1337
							Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
							Button.TextSize = 14.000 -- doom#1337
							Button.BorderSizePixel = 0 -- doom#1337
							Button.ZIndex = 6 -- doom#1337

							TextLabel.Parent = Button -- doom#1337
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
							TextLabel.BackgroundTransparency = 1.000 -- doom#1337
							TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
							TextLabel.Position = UDIM2(0, 5, 0, -1) -- doom#1337
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0) -- doom#1337
							TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
							TextLabel.Text = v -- doom#1337
							TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
							TextLabel.TextSize = 14.000 -- doom#1337
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337
							TextLabel.ZIndex = 6 -- doom#1337

							Button.MouseButton1Down:Connect(function() -- doom#1337
								Drop.Visible = false -- doom#1337
								Element.value.Dropdown = v -- doom#1337
								abcd.Text = v -- doom#1337
								values[tabname][sectorname][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
							end) -- doom#1337
							Button.MouseEnter:Connect(function() -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)}) -- doom#1337
							end) -- doom#1337
							Button.MouseLeave:Connect(function() -- doom#1337
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)}) -- doom#1337
							end) -- doom#1337

							first = false -- doom#1337
						end -- doom#1337
					end -- doom#1337

					function Element:SetValue(val) -- doom#1337
						Element.value = val -- doom#1337
						abcd.Text = val.Dropdown -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(val) -- doom#1337
					end -- doom#1337

					ImageLabel.Parent = Button -- doom#1337
					ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					ImageLabel.BackgroundTransparency = 1.000 -- doom#1337
					ImageLabel.Position = UDIM2(0, 165, 0, 6) -- doom#1337
					ImageLabel.Size = UDIM2(0, 6, 0, 4) -- doom#1337
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" -- doom#1337

					TextLabel_3.Parent = Dropdown -- doom#1337
					TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel_3.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel_3.Position = UDIM2(0, 32, 0, -1) -- doom#1337
					TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0) -- doom#1337
					TextLabel_3.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel_3.Text = text -- doom#1337
					TextLabel_3.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel_3.TextSize = 14.000 -- doom#1337
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					Button.MouseButton1Down:Connect(function() -- doom#1337
						Drop.Visible = not Drop.Visible -- doom#1337
						if not Drop.Visible then -- doom#1337
							Drop.CanvasPosition = Vec2(0,0) -- doom#1337
						end -- doom#1337
					end) -- doom#1337
					local indrop = false -- doom#1337
					local ind = false -- doom#1337
					Drop.MouseEnter:Connect(function() -- doom#1337
						indrop = true -- doom#1337
					end) -- doom#1337
					Drop.MouseLeave:Connect(function() -- doom#1337
						indrop = false -- doom#1337
					end) -- doom#1337
					Button.MouseEnter:Connect(function() -- doom#1337
						ind = true -- doom#1337
					end) -- doom#1337
					Button.MouseLeave:Connect(function() -- doom#1337
						ind = false -- doom#1337
					end) -- doom#1337
					game:GetService("UserInputService").InputBegan:Connect(function(input) -- doom#1337
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then -- doom#1337
							if Drop.Visible == true and not indrop and not ind then -- doom#1337
								Drop.Visible = false -- doom#1337
								Drop.CanvasPosition = Vec2(0,0) -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end) -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
				elseif type == "Slider" then -- doom#1337

					Section.Size = Section.Size + UDIM2(0,0,0,25) -- doom#1337

					local Slider = INST("Frame") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337
					local Button = INST("TextButton") -- doom#1337
					local Frame = INST("Frame") -- doom#1337
					local UIGradient = INST("UIGradient") -- doom#1337
					local Value = INST("TextLabel") -- doom#1337

					Slider.Name = "Slider" -- doom#1337
					Slider.Parent = Inner -- doom#1337
					Slider.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Slider.BackgroundTransparency = 1.000 -- doom#1337
					Slider.Position = UDIM2(0, 0, 0.653061211, 0) -- doom#1337
					Slider.Size = UDIM2(1, 0, 0, 25) -- doom#1337

					TextLabel.Parent = Slider -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.Position = UDIM2(0, 32, 0, -2) -- doom#1337
					TextLabel.Size = UDIM2(0, 100, 0, 15) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = text -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Slider -- doom#1337
					Button.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Button.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Button.Position = UDIM2(0, 30, 0, 15) -- doom#1337
					Button.Size = UDIM2(0, 175, 0, 5) -- doom#1337
					Button.AutoButtonColor = false -- doom#1337
					Button.Font = Enum.Font.SourceSans -- doom#1337
					Button.Text = "" -- doom#1337
					Button.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button.TextSize = 14.000 -- doom#1337

					Frame.Parent = Button -- doom#1337
					Frame.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Frame.BorderSizePixel = 0 -- doom#1337
					Frame.Size = UDIM2(0.5, 0, 1, 0) -- doom#1337

					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, COL3RGB(153, 22, 65)), ColorSequenceKeypoint.new(1, COL3RGB(109, 16, 46))} -- doom#1337
					UIGradient.Rotation = 90 -- doom#1337
					UIGradient.Parent = Frame -- doom#1337

					Value.Name = "Value" -- doom#1337
					Value.Parent = Slider -- doom#1337
					Value.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Value.BackgroundTransparency = 1.000 -- doom#1337
					Value.Position = UDIM2(0, 150, 0, -1) -- doom#1337
					Value.Size = UDIM2(0, 55, 0, 15) -- doom#1337
					Value.Font = Enum.Font.SourceSansSemibold -- doom#1337
					Value.Text = "50" -- doom#1337
					Value.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					Value.TextSize = 14.000 -- doom#1337
					Value.TextXAlignment = Enum.TextXAlignment.Right -- doom#1337
					local min, max, default = data.min or 0, data.max or 100, data.default or 0 -- doom#1337
					Element.value = {Slider = default} -- doom#1337

					function Element:SetValue(value) -- doom#1337
						Element.value = value -- doom#1337
						local a -- doom#1337
						if min > 0 then -- doom#1337
							a = ((Element.value.Slider - min)) / (max-min) -- doom#1337
						else -- doom#1337
							a = (Element.value.Slider-min)/(max-min) -- doom#1337
						end -- doom#1337
						Value.Text = Element.value.Slider -- doom#1337
						Frame.Size = UDIM2(a,0,1,0) -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(value) -- doom#1337
					end -- doom#1337
					local a -- doom#1337
					if min > 0 then -- doom#1337
						a = ((Element.value.Slider - min)) / (max-min) -- doom#1337
					else -- doom#1337
						a = (Element.value.Slider-min)/(max-min) -- doom#1337
					end -- doom#1337
					Value.Text = Element.value.Slider -- doom#1337
					Frame.Size = UDIM2(a,0,1,0) -- doom#1337
					values[tabname][sectorname][text] = Element.value -- doom#1337
					local uis = game:GetService("UserInputService") -- doom#1337
					local mouse = game.Players.LocalPlayer:GetMouse() -- doom#1337
					local val -- doom#1337
					Button.MouseButton1Down:Connect(function() -- doom#1337
						Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) -- doom#1337
						val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0 -- doom#1337
						Value.Text = val -- doom#1337
						Element.value.Slider = val -- doom#1337
						values[tabname][sectorname][text] = Element.value -- doom#1337
						callback(Element.value) -- doom#1337
						moveconnection = mouse.Move:Connect(function() -- doom#1337
							Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) -- doom#1337
							val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) -- doom#1337
							Value.Text = val -- doom#1337
							Element.value.Slider = val -- doom#1337
							values[tabname][sectorname][text] = Element.value -- doom#1337
							callback(Element.value) -- doom#1337
						end) -- doom#1337
						releaseconnection = uis.InputEnded:Connect(function(Mouse) -- doom#1337
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then -- doom#1337
								Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) -- doom#1337
								val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) -- doom#1337
								values[tabname][sectorname][text] = Element.value -- doom#1337
								callback(Element.value) -- doom#1337
								moveconnection:Disconnect() -- doom#1337
								releaseconnection:Disconnect() -- doom#1337
							end -- doom#1337
						end) -- doom#1337
					end) -- doom#1337
				elseif type == "Button" then -- doom#1337

					Section.Size = Section.Size + UDIM2(0,0,0,24) -- doom#1337
					local Button = INST("Frame") -- doom#1337
					local Button_2 = INST("TextButton") -- doom#1337
					local TextLabel = INST("TextLabel") -- doom#1337

					Button.Name = "Button" -- doom#1337
					Button.Parent = Inner -- doom#1337
					Button.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					Button.BackgroundTransparency = 1.000 -- doom#1337
					Button.Position = UDIM2(0, 0, 0.236059487, 0) -- doom#1337
					Button.Size = UDIM2(1, 0, 0, 24) -- doom#1337

					Button_2.Name = "Button" -- doom#1337
					Button_2.Parent = Button -- doom#1337
					Button_2.BackgroundColor3 = COL3RGB(33, 35, 47) -- doom#1337
					Button_2.BorderColor3 = COL3RGB(27, 27, 35) -- doom#1337
					Button_2.Position = UDIM2(0, 30, 0.5, -9) -- doom#1337
					Button_2.Size = UDIM2(0, 175, 0, 18) -- doom#1337
					Button_2.AutoButtonColor = false -- doom#1337
					Button_2.Font = Enum.Font.SourceSans -- doom#1337
					Button_2.Text = "" -- doom#1337
					Button_2.TextColor3 = COL3RGB(0, 0, 0) -- doom#1337
					Button_2.TextSize = 14.000 -- doom#1337

					TextLabel.Parent = Button_2 -- doom#1337
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
					TextLabel.BackgroundTransparency = 1.000 -- doom#1337
					TextLabel.BorderColor3 = COL3RGB(27, 42, 53) -- doom#1337
					TextLabel.Size = UDIM2(1, 0, 1, 0) -- doom#1337
					TextLabel.Font = Enum.Font.SourceSansSemibold -- doom#1337
					TextLabel.Text = text -- doom#1337
					TextLabel.TextColor3 = COL3RGB(200, 200, 200) -- doom#1337
					TextLabel.TextSize = 14.000 -- doom#1337

					function Element:SetValue() -- doom#1337
					end -- doom#1337

					Button_2.MouseButton1Down:Connect(function() -- doom#1337
						TextLabel.TextColor3 = COL3RGB(175, 42, 86) -- doom#1337
						library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
						callback() -- doom#1337
					end) -- doom#1337
					Button_2.MouseEnter:Connect(function() -- doom#1337
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)}) -- doom#1337
					end) -- doom#1337
					Button_2.MouseLeave:Connect(function() -- doom#1337
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)}) -- doom#1337
					end) -- doom#1337
				end -- doom#1337
				ConfigLoad:Connect(function(cfg) -- doom#1337
					pcall(function() -- doom#1337
						local fix = library:ConfigFix(cfg) -- doom#1337
						if fix[tabname][sectorname][text] ~= nil then -- doom#1337
							Element:SetValue(fix[tabname][sectorname][text]) -- doom#1337
						end -- doom#1337
					end) -- doom#1337
				end) -- doom#1337

				return Element -- doom#1337
			end -- doom#1337
			return Sector -- doom#1337
		end -- doom#1337

		return Tab -- doom#1337
	end -- doom#1337

	Ova.Parent = game.CoreGui -- doom#1337

	return menu -- doom#1337
end -- doom#1337

local UserInputService = game:GetService("UserInputService") -- doom#1337
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- doom#1337
local RunService = game:GetService("RunService") -- doom#1337
local Lighting = game:GetService("Lighting") -- doom#1337
local Players = game:GetService("Players") -- doom#1337
local LocalPlayer = Players.LocalPlayer -- doom#1337
local PlayerGui = LocalPlayer.PlayerGui -- doom#1337
local Mouse = LocalPlayer:GetMouse() -- doom#1337
local Camera = workspace.CurrentCamera -- doom#1337
local ClientScript = LocalPlayer.PlayerGui.Client -- doom#1337
local Client = getsenv(ClientScript) -- doom#1337

repeat RunService.RenderStepped:Wait() until game:IsLoaded() -- doom#1337

local Crosshairs = PlayerGui.GUI.Crosshairs -- doom#1337
local Crosshair = PlayerGui.GUI.Crosshairs.Crosshair -- doom#1337
local oldcreatebullethole = Client.createbullethole -- doom#1337
local LGlove, RGlove, LSleeve, RSleeve, RArm, LArm -- doom#1337
local WeaponObj = {} -- doom#1337
local SelfObj = {} -- doom#1337
local Viewmodels =  ReplicatedStorage.Viewmodels -- doom#1337
local Weapons =  ReplicatedStorage.Weapons -- doom#1337
local ViewmodelOffset = CF(0,0,0) -- doom#1337
local Smokes = {} -- doom#1337
local Mollies = {} -- doom#1337
local RayIgnore = workspace.Ray_Ignore -- doom#1337
local RageTarget -- doom#1337
local GetIcon = require(game.ReplicatedStorage.GetIcon) -- doom#1337
local BodyVelocity = INST("BodyVelocity") -- doom#1337
BodyVelocity.MaxForce = Vec3(HUGE, 0, HUGE) -- doom#1337
local Collision = {Camera, workspace.Ray_Ignore, workspace.Debris} -- doom#1337
local FakelagFolder = INST("Folder", workspace) -- doom#1337
FakelagFolder.Name = "Fakelag" -- doom#1337
local FakeAnim = INST("Animation", workspace) -- doom#1337
FakeAnim.AnimationId = "rbxassetid://0" -- doom#1337
local Gloves = ReplicatedStorage.Gloves -- doom#1337
if Gloves:FindFirstChild("ImageLabel") then -- doom#1337
	Gloves.ImageLabel:Destroy() -- doom#1337
end -- doom#1337
local GloveModels = Gloves.Models -- doom#1337
local Multipliers = { -- doom#1337
	["Head"] = 4, -- doom#1337
	["FakeHead"] = 4, -- doom#1337
	["HeadHB"] = 4, -- doom#1337
	["UpperTorso"] = 1, -- doom#1337
	["LowerTorso"] = 1.25, -- doom#1337
	["LeftUpperArm"] = 1, -- doom#1337
	["LeftLowerArm"] = 1, -- doom#1337
	["LeftHand"] = 1, -- doom#1337
	["RightUpperArm"] = 1, -- doom#1337
	["RightLowerArm"] = 1, -- doom#1337
	["RightHand"] = 1, -- doom#1337
	["LeftUpperLeg"] = 0.75, -- doom#1337
	["LeftLowerLeg"] = 0.75, -- doom#1337
	["LeftFoot"] = 0.75, -- doom#1337
	["RightUpperLeg"] = 0.75, -- doom#1337
	["RightLowerLeg"] = 0.75, -- doom#1337
	["RightFoot"] = 0.75, -- doom#1337
} -- doom#1337
local ChamItems = {} -- doom#1337
local Skyboxes = { -- doom#1337
	["nebula"] = { -- doom#1337
		SkyboxLf = "rbxassetid://159454286", -- doom#1337
		SkyboxBk = "rbxassetid://159454299", -- doom#1337
		SkyboxDn = "rbxassetid://159454296", -- doom#1337
		SkyboxFt = "rbxassetid://159454293", -- doom#1337
		SkyboxLf = "rbxassetid://159454286", -- doom#1337
		SkyboxRt = "rbxassetid://159454300", -- doom#1337
		SkyboxUp = "rbxassetid://159454288", -- doom#1337
	}, -- doom#1337
	["vaporwave"] = { -- doom#1337
		SkyboxLf = "rbxassetid://1417494402", -- doom#1337
		SkyboxBk = "rbxassetid://1417494030", -- doom#1337
		SkyboxDn = "rbxassetid://1417494146", -- doom#1337
		SkyboxFt = "rbxassetid://1417494253", -- doom#1337
		SkyboxLf = "rbxassetid://1417494402", -- doom#1337
		SkyboxRt = "rbxassetid://1417494499", -- doom#1337
		SkyboxUp = "rbxassetid://1417494643", -- doom#1337
	}, -- doom#1337
	["clouds"] = { -- doom#1337
		SkyboxLf = "rbxassetid://570557620", -- doom#1337
		SkyboxBk = "rbxassetid://570557514", -- doom#1337
		SkyboxDn = "rbxassetid://570557775", -- doom#1337
		SkyboxFt = "rbxassetid://570557559", -- doom#1337
		SkyboxLf = "rbxassetid://570557620", -- doom#1337
		SkyboxRt = "rbxassetid://570557672", -- doom#1337
		SkyboxUp = "rbxassetid://570557727", -- doom#1337
	}, -- doom#1337
	["twilight"] = { -- doom#1337
		SkyboxLf = "rbxassetid://264909758", -- doom#1337
		SkyboxBk = "rbxassetid://264908339", -- doom#1337
		SkyboxDn = "rbxassetid://264907909", -- doom#1337
		SkyboxFt = "rbxassetid://264909420", -- doom#1337
		SkyboxLf = "rbxassetid://264909758", -- doom#1337
		SkyboxRt = "rbxassetid://264908886", -- doom#1337
		SkyboxUp = "rbxassetid://264907379", -- doom#1337
	}, -- doom#1337
} -- doom#1337
local NewScope -- doom#1337
do -- doom#1337
	local ScreenGui = INST("ScreenGui") -- doom#1337
	local Frame = INST("Frame") -- doom#1337
	local Frame_2 = INST("Frame") -- doom#1337

	ScreenGui.Enabled = false -- doom#1337
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global -- doom#1337
	ScreenGui.IgnoreGuiInset = true -- doom#1337

	Frame.Parent = ScreenGui -- doom#1337
	Frame.BackgroundColor3 = COL3RGB(0, 0, 0) -- doom#1337
	Frame.BorderSizePixel = 0 -- doom#1337
	Frame.Position = UDIM2(0, 0, 0.5, 0) -- doom#1337
	Frame.Size = UDIM2(1, 0, 0, 1) -- doom#1337

	Frame_2.Parent = ScreenGui -- doom#1337
	Frame_2.BackgroundColor3 = COL3RGB(0, 0, 0) -- doom#1337
	Frame_2.BorderSizePixel = 0 -- doom#1337
	Frame_2.Position = UDIM2(0.5, 0, 0, 0) -- doom#1337
	Frame_2.Size = UDIM2(0, 1, 1, 0) -- doom#1337

	ScreenGui.Parent = game.CoreGui -- doom#1337

	NewScope = ScreenGui -- doom#1337
end -- doom#1337
local oldSkybox -- doom#1337

local function VectorRGB(RGB) -- doom#1337
	return Vec3(RGB.R, RGB.G, RGB.B) -- doom#1337
end -- doom#1337
local function new(name, prop) -- doom#1337
	local obj = INST(name) -- doom#1337
	for i,v in pairs(prop) do -- doom#1337
		if i ~= "Parent" then -- doom#1337
			obj[i] = v -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if prop["Parent"] ~= nil then -- doom#1337
		obj.Parent = prop["Parent"] -- doom#1337
	end -- doom#1337
end -- doom#1337
local function UpdateAccessory(Accessory) -- doom#1337
	Accessory.Material = values.visuals.effects["accessory material"].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField" -- doom#1337
	Accessory.Mesh.VertexColor = VectorRGB(values.visuals.effects["accessory chams"].Color) -- doom#1337
	Accessory.Color = values.visuals.effects["accessory chams"].Color -- doom#1337
	Accessory.Transparency = values.visuals.effects["accessory chams"].Transparency -- doom#1337
	if values.visuals.effects["accessory material"].Dropdown ~= "ForceField" then -- doom#1337
		Accessory.Mesh.TextureId = "" -- doom#1337
	else -- doom#1337
		Accessory.Mesh.TextureId = Accessory.StringValue.Value -- doom#1337
	end -- doom#1337
end -- doom#1337
local function ReverseAccessory(Accessory) -- doom#1337
	Accessory.Material = "SmoothPlastic" -- doom#1337
	Accessory.Mesh.VertexColor = Vec3(1,1,1) -- doom#1337
	Accessory.Mesh.TextureId = Accessory.StringValue.Value -- doom#1337
	Accessory.Transparency = 0 -- doom#1337
end -- doom#1337
local function UpdateWeapon(obj) -- doom#1337
	local selected = values.visuals.effects["weapon material"].Dropdown -- doom#1337

	if obj:IsA("MeshPart") then obj.TextureID = "" end -- doom#1337
	if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then -- doom#1337
		obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["weapon chams"].Color) -- doom#1337
		if selected == "Smooth" or selected == "Glass" then -- doom#1337
			obj.Mesh.TextureId = "" -- doom#1337
		else -- doom#1337
			pcall(function() -- doom#1337
				obj.Mesh.TextureId = obj.Mesh.OriginalTexture.Value -- doom#1337
				obj.Mesh.TextureID = obj.Mesh.OriginalTexture.Value -- doom#1337
			end) -- doom#1337
		end -- doom#1337
	end -- doom#1337
	obj.Color = values.visuals.effects["weapon chams"].Color -- doom#1337
	obj.Material = selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField" or "Glass" -- doom#1337
	obj.Reflectance = values.visuals.effects["reflectance"].Slider/10 -- doom#1337
	obj.Transparency = values.visuals.effects["weapon chams"].Transparency -- doom#1337
end -- doom#1337
local Skins = ReplicatedStorage.Skins -- doom#1337
local function MapSkin(Gun, Skin, CustomSkin) -- doom#1337
	if CustomSkin ~= nil then -- doom#1337
		for _,Data in pairs(CustomSkin) do -- doom#1337
			local Obj = Camera.Arms:FindFirstChild(Data.Name) -- doom#1337
			if Obj ~= nil and Obj.Transparency ~= 1 then -- doom#1337
				Obj.TextureId = Data.Value -- doom#1337
			end -- doom#1337
		end -- doom#1337
	else -- doom#1337
		local SkinData = Skins:FindFirstChild(Gun):FindFirstChild(Skin) -- doom#1337
		if not SkinData:FindFirstChild("Animated") then -- doom#1337
			for _,Data in pairs(SkinData:GetChildren()) do -- doom#1337
				local Obj = Camera.Arms:FindFirstChild(Data.Name) -- doom#1337
				if Obj ~= nil and Obj.Transparency ~= 1 then -- doom#1337
					if Obj:FindFirstChild("Mesh") then -- doom#1337
						Obj.Mesh.TextureId = v.Value -- doom#1337
					elseif not Obj:FindFirstChild("Mesh") then -- doom#1337
						Obj.TextureID = Data.Value -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
local function ChangeCharacter(NewCharacter) -- doom#1337
	for _,Part in pairs (LocalPlayer.Character:GetChildren()) do -- doom#1337
		if Part:IsA("Accessory") then -- doom#1337
			Part:Destroy() -- doom#1337
		end -- doom#1337
		if Part:IsA("BasePart") then -- doom#1337
			if NewCharacter:FindFirstChild(Part.Name) then -- doom#1337
				Part.Color = NewCharacter:FindFirstChild(Part.Name).Color -- doom#1337
				Part.Transparency = NewCharacter:FindFirstChild(Part.Name).Transparency -- doom#1337
			end -- doom#1337
			if Part.Name == "FakeHead" then -- doom#1337
				Part.Color = NewCharacter:FindFirstChild("Head").Color -- doom#1337
				Part.Transparency = NewCharacter:FindFirstChild("Head").Transparency -- doom#1337
			end -- doom#1337
		end -- doom#1337

		if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("Decal") and NewCharacter.Head:FindFirstChildOfClass("Decal") then -- doom#1337
			Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture -- doom#1337
		end -- doom#1337
	end -- doom#1337

	if NewCharacter:FindFirstChildOfClass("Shirt") then -- doom#1337
		if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then -- doom#1337
			LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy() -- doom#1337
		end -- doom#1337
		local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone() -- doom#1337
		Clone.Parent = LocalPlayer.Character -- doom#1337
	end -- doom#1337

	if NewCharacter:FindFirstChildOfClass("Pants") then -- doom#1337
		if LocalPlayer.Character:FindFirstChildOfClass("Pants") then -- doom#1337
			LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy() -- doom#1337
		end -- doom#1337
		local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone() -- doom#1337
		Clone.Parent = LocalPlayer.Character -- doom#1337
	end -- doom#1337

	for _,Part in pairs (NewCharacter:GetChildren()) do -- doom#1337
		if Part:IsA("Accessory") then -- doom#1337
			local Clone = Part:Clone() -- doom#1337
			for _,Weld in pairs (Clone.Handle:GetChildren()) do -- doom#1337
				if Weld:IsA("Weld") and Weld.Part1 ~= nil then -- doom#1337
					Weld.Part1 = LocalPlayer.Character[Weld.Part1.Name] -- doom#1337
				end -- doom#1337
			end -- doom#1337
			Clone.Parent = LocalPlayer.Character -- doom#1337
		end -- doom#1337
	end -- doom#1337

	if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then -- doom#1337
		local String = INST("StringValue") -- doom#1337
		String.Name = "OriginalTexture" -- doom#1337
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate -- doom#1337
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Shirt") -- doom#1337

		if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then -- doom#1337
			LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate = "" -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if LocalPlayer.Character:FindFirstChildOfClass("Pants") then -- doom#1337
		local String = INST("StringValue") -- doom#1337
		String.Name = "OriginalTexture" -- doom#1337
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate -- doom#1337
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Pants") -- doom#1337

		if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then -- doom#1337
			LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate = "" -- doom#1337
		end -- doom#1337
	end -- doom#1337
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do -- doom#1337
		if v:IsA("BasePart") and v.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, v) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = v.Color -- doom#1337
			Color.Parent = v -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = v.Material.Name -- doom#1337
			String.Parent = v -- doom#1337
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, v.Handle) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = v.Handle.Color -- doom#1337
			Color.Parent = v.Handle -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = v.Handle.Material.Name -- doom#1337
			String.Parent = v.Handle -- doom#1337
		end -- doom#1337
	end -- doom#1337

	if values.visuals.self["self chams"].Toggle then -- doom#1337
		for _,obj in pairs(SelfObj) do -- doom#1337
			if obj.Parent ~= nil then -- doom#1337
				obj.Material = Enum.Material.ForceField -- doom#1337
				obj.Color = values.visuals.self["self chams"].Color -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
local function GetDeg(pos1, pos2) -- doom#1337
	local start = pos1.LookVector -- doom#1337
	local vector = CF(pos1.Position, pos2).LookVector -- doom#1337
	local angle = ACOS(start:Dot(vector)) -- doom#1337
	local deg = DEG(angle) -- doom#1337
	return deg -- doom#1337
end -- doom#1337
local Ping = game.Stats.PerformanceStats.Ping:GetValue() -- doom#1337

for i,v in pairs(Viewmodels:GetChildren()) do -- doom#1337
	if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then -- doom#1337
		v.HumanoidRootPart.Transparency = 1 -- doom#1337
	end -- doom#1337
end -- doom#1337

local Models = game:GetObjects("rbxassetid://7285197035")[1] -- doom#1337
repeat wait() until Models ~= nil -- doom#1337
local ChrModels = game:GetObjects("rbxassetid://7265740528")[1] -- doom#1337
repeat wait() until ChrModels ~= nil -- doom#1337


local AllKnives = { -- doom#1337
	"CT Knife", -- doom#1337
	"T Knife", -- doom#1337
	"Banana", -- doom#1337
	"Bayonet", -- doom#1337
	"Bearded Axe", -- doom#1337
	"Butterfly Knife", -- doom#1337
	"Cleaver", -- doom#1337
	"Crowbar", -- doom#1337
	"Falchion Knife", -- doom#1337
	"Flip Knife", -- doom#1337
	"Gut Knife", -- doom#1337
	"Huntsman Knife", -- doom#1337
	"Karambit", -- doom#1337
	"Sickle", -- doom#1337
} -- doom#1337

local AllGloves = {} -- doom#1337


for _,fldr in pairs(Gloves:GetChildren()) do -- doom#1337
	if fldr ~= GloveModels and fldr.Name ~= "Racer" then -- doom#1337
		AllGloves[fldr.Name] = {} -- doom#1337
		for _2,modl in pairs(fldr:GetChildren()) do -- doom#1337
			INSERT(AllGloves[fldr.Name], modl.Name) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337

for i,v in pairs(Models.Knives:GetChildren()) do -- doom#1337
	INSERT(AllKnives, v.Name) -- doom#1337
end -- doom#1337

local AllSkins = {} -- doom#1337
local AllWeapons = {} -- doom#1337
local AllCharacters = {} -- doom#1337

for i,v in pairs(ChrModels:GetChildren()) do -- doom#1337
	INSERT(AllCharacters, v.Name) -- doom#1337
end -- doom#1337

local skins = { -- doom#1337
	{["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}} -- doom#1337
} -- doom#1337

for _,skin in pairs (skins) do -- doom#1337
	local Folder = INST("Folder") -- doom#1337
	Folder.Name = skin["SkinName"] -- doom#1337
	Folder.Parent = Skins[skin["Weapon"]] -- doom#1337

	for _,model in pairs (skin["Skin"]) do -- doom#1337
		local val = INST("StringValue") -- doom#1337
		val.Name = _ -- doom#1337
		val.Value = "rbxassetid://"..model -- doom#1337
		val.Parent = Folder -- doom#1337
	end -- doom#1337
end -- doom#1337

for i,v in pairs(Skins:GetChildren()) do -- doom#1337
	INSERT(AllWeapons, v.Name) -- doom#1337
end -- doom#1337

TBLSORT(AllWeapons, function(a,b) -- doom#1337
	return a < b -- doom#1337
end) -- doom#1337

for i,v in ipairs(AllWeapons) do -- doom#1337
	AllSkins[v] = {} -- doom#1337
	INSERT(AllSkins[v], "Inventory") -- doom#1337
	for _,v2 in pairs(Skins[v]:GetChildren()) do -- doom#1337
		if not v2:FindFirstChild("Animated") then -- doom#1337
			INSERT(AllSkins[v], v2.Name) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337

makefolder("DOOMHVH") -- doom#1337

local allluas = {} -- doom#1337

for _,lua in pairs(listfiles("DOOMHVH")) do -- doom#1337
	local luaname = GSUB(lua, "DOOMHVH\\", "") -- doom#1337
	INSERT(allluas, luaname) -- doom#1337
end -- doom#1337

RunService.RenderStepped:Wait() -- doom#1337

local gui = library:New("DOOMHVH") -- doom#1337
local legit = gui:Tab("legit") -- doom#1337
local rage = gui:Tab("rage") -- doom#1337
local visuals = gui:Tab("visuals") -- doom#1337
local misc = gui:Tab("misc") -- doom#1337
local skins = gui:Tab("skins") -- doom#1337
local luas = gui:Tab("luas") -- doom#1337

getgenv().api = {} -- doom#1337
api.newtab = function(name) -- doom#1337
	return gui:Tab(name) -- doom#1337
end -- doom#1337
api.newsection = function(tab, name, side) -- doom#1337
	return tab:Sector(name, side) -- doom#1337
end -- doom#1337
api.newelement = function(section, type, name, data, callback) -- doom#1337
	section:Element(type, name, data, callback) -- doom#1337
end -- doom#1337


local luascripts = luas:Sector("lua scripts", "Left") -- doom#1337
luascripts:Element("Scroll", "lua", {options = allluas, Amount = 5}) -- doom#1337
luascripts:Element("Button", "load", {}, function() -- doom#1337
	loadstring(readfile("ovalua\\"..values.luas["lua scripts"].lua.Scroll))() -- doom#1337
end) -- doom#1337

local knife = skins:Sector("knife", "Left") -- doom#1337
knife:Element("Toggle", "knife changer") -- doom#1337
knife:Element("Scroll", "model", {options = AllKnives, Amount = 15}) -- doom#1337

local glove = skins:Sector("glove", "Left") -- doom#1337
glove:Element("Toggle", "glove changer") -- doom#1337
glove:Element("ScrollDrop", "model", {options = AllGloves, Amount = 9}) -- doom#1337

local skin = skins:Sector("skins", "Right") -- doom#1337
skin:Element("Toggle", "skin changer") -- doom#1337
skin:Element("ScrollDrop", "skin", {options = AllSkins, Amount = 15, alphabet = true}) -- doom#1337

local characters = skins:Sector("characters", "Right") -- doom#1337
characters:Element("Toggle", "character changer", nil, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then -- doom#1337
			ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll)) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
characters:Element("Scroll", "skin", {options = AllCharacters, Amount = 9, alphabet = true}, function(tbl) -- doom#1337
	if values.skins.characters["character changer"].Toggle then -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then -- doom#1337
			ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll)) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337

local aimbot = legit:Sector("aimbot", "Left") -- doom#1337
aimbot:Element("ToggleKeybind", "aim assist") -- doom#1337
aimbot:Element("ToggleKeybind", "silent aim") -- doom#1337
aimbot:Element("ToggleKeybind", "triggerbot") -- doom#1337

local main = legit:MSector("main", "Left") -- doom#1337
local default = main:Tab("default") -- doom#1337
local pistol = main:Tab("pistol") -- doom#1337
local smg = main:Tab("smg") -- doom#1337
local rifle = main:Tab("rifle") -- doom#1337
local sniper = main:Tab("sniper") -- doom#1337

local function AddLegit(Tab) -- doom#1337
	Tab:Element("Jumbobox", "conditions", {options = {"visible", "standing", "blind", "smoke"}}) -- doom#1337
	Tab:Element("Dropdown", "target", {options = {"crosshair", "health", "distance"}}) -- doom#1337
	Tab:Element("Dropdown", "hitbox", {options = {"closest", "head", "chest"}}) -- doom#1337
	Tab:Element("Slider", "field of view", {min = 30, max = 420, default = 120}) -- doom#1337
	Tab:Element("Slider", "smoothing", {min = 1, max = 50, default = 1}) -- doom#1337
	Tab:Element("Toggle", "silent aim") -- doom#1337
	Tab:Element("Slider", "hitchance", {min = 1, max = 100, default = 100}) -- doom#1337
	Tab:Element("Dropdown", "priority", {options = {"closest", "head", "chest"}}) -- doom#1337
	Tab:Element("Toggle", "triggerbot") -- doom#1337
	Tab:Element("Slider", "delay (ms)", {min = 0, max = 300, default = 200}) -- doom#1337
	Tab:Element("Slider", "minimum dmg", {min = 0, max = 100, default = 15}) -- doom#1337
end -- doom#1337

AddLegit(default) -- doom#1337

pistol:Element("Toggle", "override default") -- doom#1337
AddLegit(pistol) -- doom#1337

smg:Element("Toggle", "override default") -- doom#1337
AddLegit(smg) -- doom#1337

rifle:Element("Toggle", "override default") -- doom#1337
AddLegit(rifle) -- doom#1337

sniper:Element("Toggle", "override default") -- doom#1337
AddLegit(sniper) -- doom#1337

local settings = legit:Sector("settings", "Right") -- doom#1337
settings:Element("Toggle", "free for all") -- doom#1337
settings:Element("Toggle", "forcefield check") -- doom#1337
settings:Element("ToggleColor", "draw fov") -- doom#1337

local aimbot = rage:Sector("aimbot", "Left") -- doom#1337
aimbot:Element("Toggle", "enabled") -- doom#1337
aimbot:Element("Dropdown", "origin", {options = {"character", "camera"}}) -- doom#1337
aimbot:Element("Toggle", "silent aim") -- doom#1337
aimbot:Element("Dropdown", "automatic fire", {options = {"off", "standard", "hitpart"}}) -- doom#1337
aimbot:Element("Toggle", "automatic penetration") -- doom#1337
aimbot:Element("Jumbobox", "resolver", {options = {"pitch", "roll"}}) -- doom#1337
aimbot:Element("Toggle", "delay shot") -- doom#1337
aimbot:Element("Toggle", "force hit") -- doom#1337
aimbot:Element("Toggle", "sex package") -- doom#1337
aimbot:Element("Toggle", "teammates") -- doom#1337
aimbot:Element("Toggle", "auto baim") -- doom#1337
aimbot:Element("Toggle", "knifebot") -- doom#1337

local weapons = rage:MSector("weapons", "Left") -- doom#1337
local default = weapons:Tab("default") -- doom#1337
local pistol = weapons:Tab("pistol") -- doom#1337
local rifle = weapons:Tab("rifle") -- doom#1337
local scout = weapons:Tab("scout") -- doom#1337
local awp = weapons:Tab("awp") -- doom#1337
local auto = weapons:Tab("auto") -- doom#1337

local function AddRage(Tab) -- doom#1337
	Tab:Element("Jumbobox", "hitboxes", {options = {"head", "torso", "pelvis"}}) -- doom#1337
	Tab:Element("Toggle", "prefer body") -- doom#1337
	Tab:Element("Slider", "minimum damage", {min = 1, max = 100, default = 20}) -- doom#1337
	Tab:Element("Slider", "max fov", {min = 1, max = 180, default = 180}) -- doom#1337
end -- doom#1337

AddRage(default) -- doom#1337

pistol:Element("Toggle", "override default") -- doom#1337
AddRage(pistol) -- doom#1337

rifle:Element("Toggle", "override default") -- doom#1337
AddRage(rifle) -- doom#1337

scout:Element("Toggle", "override default") -- doom#1337
AddRage(scout) -- doom#1337

awp:Element("Toggle", "override default") -- doom#1337
AddRage(awp) -- doom#1337

auto:Element("Toggle", "override default") -- doom#1337
AddRage(auto) -- doom#1337

local antiaim = rage:Sector("angles", "Right") -- doom#1337
antiaim:Element("Toggle", "enabled") -- doom#1337
antiaim:Element("Dropdown", "yaw base", {options = {"camera", "targets", "spin", "random"}}) -- doom#1337
antiaim:Element("Slider", "yaw offset", {min = -180, max = 180, default = 0}) -- doom#1337
antiaim:Element("Toggle", "jitter") -- doom#1337
antiaim:Element("Slider", "jitter offset", {min = -180, max = 180, default = 0}) -- doom#1337
antiaim:Element("Dropdown", "pitch", {options = {"none", "up", "down", "zero", "180", "random"}}) -- doom#1337
antiaim:Element("Toggle", "extend pitch") -- doom#1337
antiaim:Element("Dropdown", "body roll", {options = {"off", "180"}}) -- doom#1337
antiaim:Element("Slider", "spin speed", {min = 1, max = 48, default = 4}) -- doom#1337

local others = rage:Sector("others", "Right") -- doom#1337
others:Element("Toggle", "remove head") -- doom#1337
others:Element("Toggle", "no animations") -- doom#1337
others:Element("Dropdown", "leg movement", {options = {"off", "slide"}}) -- doom#1337

local LagTick = 0 -- doom#1337
local fakelag = rage:Sector("fakelag", "Right") -- doom#1337
fakelag:Element("Toggle", "enabled", {default = {Toggle = false}}, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
	else -- doom#1337
		FakelagFolder:ClearAllChildren() -- doom#1337
		game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9) -- doom#1337
	end -- doom#1337
end) -- doom#1337
fakelag:Element("Dropdown", "amount", {options = {"static", "dynamic"}}) -- doom#1337
fakelag:Element("Slider", "limit", {min = 1, max = 16, default = 8}) -- doom#1337
fakelag:Element("ToggleColor", "visualize lag", {default = {Toggle = false, Color = COL3RGB(255,255,255)}}, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
		for _,obj in pairs(FakelagFolder:GetChildren()) do -- doom#1337
			obj.Color = tbl.Color -- doom#1337
		end -- doom#1337
	else -- doom#1337
		FakelagFolder:ClearAllChildren() -- doom#1337
	end -- doom#1337
end) -- doom#1337
fakelag:Element("ToggleKeybind", "ping spike") -- doom#1337
coroutine.wrap(function() -- doom#1337
	while wait(1/16) do -- doom#1337
		LagTick = CLAMP(LagTick + 1, 0, values.rage.fakelag.limit.Slider) -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") and values.rage.fakelag.enabled.Toggle then -- doom#1337
			if LagTick == (values.rage.fakelag.amount.Dropdown == "static" and values.rage.fakelag.limit.Slider or RANDOM(1, values.rage.fakelag.limit.Slider)) then -- doom#1337
				game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9) -- doom#1337
				FakelagFolder:ClearAllChildren() -- doom#1337
				LagTick = 0 -- doom#1337
				if values.rage.fakelag["visualize lag"].Toggle then -- doom#1337
					for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do -- doom#1337
						if hitbox:IsA("BasePart") and hitbox.Name ~= "HumanoidRootPart" then -- doom#1337
							local part = INST("Part") -- doom#1337
							part.CFrame = hitbox.CFrame -- doom#1337
							part.Anchored = true -- doom#1337
							part.CanCollide = false -- doom#1337
							part.Material = Enum.Material.ForceField -- doom#1337
							part.Color = values.rage.fakelag["visualize lag"].Color -- doom#1337
							part.Name = hitbox.Name -- doom#1337
							part.Transparency = 0 -- doom#1337
							part.Size = hitbox.Size -- doom#1337
							part.Parent = FakelagFolder -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end -- doom#1337
			else -- doom#1337
				if values.rage.fakelag.enabled.Toggle then -- doom#1337
					game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1) -- doom#1337
				end -- doom#1337
			end -- doom#1337
		else -- doom#1337
			FakelagFolder:ClearAllChildren() -- doom#1337
			game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end)() -- doom#1337

local exploits = rage:Sector("exploits", "Left") -- doom#1337
exploits:Element("ToggleKeybind", "double tap") -- doom#1337
exploits:Element("ToggleKeybind", "kill all") -- doom#1337


local players = visuals:Sector("players", "Left") -- doom#1337
players:Element("Toggle", "teammates") -- doom#1337
players:Element("ToggleColor", "box", {default = {Color = COL3RGB(255,255,255)}}) -- doom#1337
players:Element("ToggleColor", "name", {default = {Color = COL3RGB(255,255,255)}}) -- doom#1337
players:Element("Toggle", "health") -- doom#1337
players:Element("ToggleColor", "weapon", {default = {Color = COL3RGB(255,255,255)}}) -- doom#1337
players:Element("ToggleColor", "weapon icon", {default = {Color = COL3RGB(255,255,255)}}) -- doom#1337
players:Element("Jumbobox", "indicators", {options = {"armor"}}) -- doom#1337
players:Element("Jumbobox", "outlines", {options = {"drawings", "text"}, default = {Jumbobox = {"drawings", "text"}}}) -- doom#1337
players:Element("Dropdown", "font", {options = {"Plex", "Monospace", "System", "UI"}}) -- doom#1337
players:Element("Slider", "size", {min = 12, max = 16, default = 13}) -- doom#1337
players:Element("ToggleColor", "chams", nil, function(tbl) -- doom#1337
	for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
		if Player.Character then -- doom#1337
			for _2,Obj in pairs(Player.Character:GetDescendants()) do -- doom#1337
				if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then -- doom#1337
					if tbl.Toggle then -- doom#1337
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
							Obj.Visible = true -- doom#1337
						else -- doom#1337
							Obj.Visible = false -- doom#1337
						end -- doom#1337
					else -- doom#1337
						Obj.Visible = false -- doom#1337
					end -- doom#1337
					Obj.Color3 = tbl.Color -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337

local effects = visuals:Sector("effects", "Right") -- doom#1337
effects:Element("ToggleTrans", "weapon chams", {default = {Color = COL3RGB(255,255,255), Transparency = 0}}, function(tbl) -- doom#1337
	if WeaponObj == nil then return end -- doom#1337
	if tbl.Toggle then -- doom#1337
		for i,v in pairs(WeaponObj) do -- doom#1337
			UpdateWeapon(v) -- doom#1337
		end -- doom#1337
	else -- doom#1337
		for i,v in pairs(WeaponObj) do -- doom#1337
			if v:IsA("MeshPart") then v.TextureID = v.OriginalTexture.Value end -- doom#1337
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then -- doom#1337
				v.Mesh.TextureId = v.Mesh.OriginalTexture.Value -- doom#1337
				v.Mesh.VertexColor = Vec3(1,1,1) -- doom#1337
			end -- doom#1337
			v.Color = v.OriginalColor.Value -- doom#1337
			v.Material = v.OriginalMaterial.Value -- doom#1337
			v.Transparency = 0 -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("Dropdown", "weapon material", {options = {"Smooth", "Flat", "ForceField", "Glass"}}, function(tbl) -- doom#1337
	if WeaponObj == nil then return end -- doom#1337
	if values.visuals.effects["weapon chams"].Toggle then -- doom#1337
		for i,v in pairs(WeaponObj) do -- doom#1337
			UpdateWeapon(v) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("Slider", "reflectance", {min = 0, max = 100, default = 0}, function(tbl) -- doom#1337
	if values.visuals.effects["weapon chams"].Toggle then -- doom#1337
		for i,v in pairs(WeaponObj) do -- doom#1337
			UpdateWeapon(v) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("ToggleTrans", "accessory chams", {default = {Color = COL3RGB(255,255,255)}}, function(val) -- doom#1337
	if RArm == nil or LArm == nil then return end -- doom#1337
	if val.Toggle then -- doom#1337
		if RGlove ~= nil then -- doom#1337
			UpdateAccessory(RGlove) -- doom#1337
		end -- doom#1337
		if RSleeve ~= nil then -- doom#1337
			UpdateAccessory(RSleeve) -- doom#1337
		end -- doom#1337
		if LGlove ~= nil then -- doom#1337
			UpdateAccessory(LGlove) -- doom#1337
		end -- doom#1337
		if LSleeve ~= nil then -- doom#1337
			UpdateAccessory(LSleeve) -- doom#1337
		end -- doom#1337
	else -- doom#1337
		if RGlove then -- doom#1337
			ReverseAccessory(RGlove) -- doom#1337
		end -- doom#1337
		if LGlove then -- doom#1337
			ReverseAccessory(LGlove) -- doom#1337
		end -- doom#1337
		if RSleeve then -- doom#1337
			ReverseAccessory(RSleeve) -- doom#1337
		end -- doom#1337
		if LSleeve then -- doom#1337
			ReverseAccessory(LSleeve) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("Dropdown", "accessory material", {options = {"Smooth","ForceField"}}, function(val) -- doom#1337
	if RArm == nil or LArm == nil then return end -- doom#1337
	if values.visuals.effects["accessory chams"].Toggle then -- doom#1337
		if RGlove ~= nil then -- doom#1337
			UpdateAccessory(RGlove) -- doom#1337
		end -- doom#1337
		if RSleeve ~= nil then -- doom#1337
			UpdateAccessory(RSleeve) -- doom#1337
		end -- doom#1337
		if LGlove ~= nil then -- doom#1337
			UpdateAccessory(LGlove) -- doom#1337
		end -- doom#1337
		if LSleeve ~= nil then -- doom#1337
			UpdateAccessory(LSleeve) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("ToggleTrans", "arm chams", {default = {Color = COL3RGB(255,255,255)}}, function(val) -- doom#1337
	if RArm == nil then return end -- doom#1337
	if LArm == nil then return end -- doom#1337
	if val.Toggle then -- doom#1337
		RArm.Color = val.Color -- doom#1337
		LArm.Color = val.Color -- doom#1337
		RArm.Transparency = val.Transparency -- doom#1337
		LArm.Transparency = val.Transparency -- doom#1337
	else -- doom#1337
		RArm.Color = RArm.Color3Value.Value -- doom#1337
		LArm.Color = RArm.Color3Value.Value -- doom#1337
		RArm.Transparency = 0 -- doom#1337
		LArm.Transparency = 0 -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("Jumbobox", "removals", {options = {"scope", "scope lines", "flash", "smoke", "decals", "shadows", "clothes"}}, function(val) -- doom#1337
	local tbl = val.Jumbobox -- doom#1337
	if TBLFIND(tbl, "decals") then -- doom#1337
		Client.createbullethole = function() end -- doom#1337
		for i,v in pairs(workspace.Debris:GetChildren()) do -- doom#1337
			if v.Name == "Bullet" or v.Name == "SurfaceGui" then -- doom#1337
				v:Destroy() -- doom#1337
			end -- doom#1337
		end -- doom#1337
	else -- doom#1337
		Client.createbullethole = oldcreatebullethole -- doom#1337
	end -- doom#1337
	if TBLFIND(tbl, "clothes") then -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then -- doom#1337
			if LocalPlayer.Character:FindFirstChild("Shirt") then -- doom#1337
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = "" -- doom#1337
			end -- doom#1337
			if LocalPlayer.Character:FindFirstChild("Pants") then -- doom#1337
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = "" -- doom#1337
			end -- doom#1337
		end -- doom#1337
	else -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then -- doom#1337
			if LocalPlayer.Character:FindFirstChild("Shirt") then -- doom#1337
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = LocalPlayer.Character:FindFirstChild("Shirt").OriginalTexture.Value -- doom#1337
			end -- doom#1337
			if LocalPlayer.Character:FindFirstChild("Pants") then -- doom#1337
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = LocalPlayer.Character:FindFirstChild("Pants").OriginalTexture.Value -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if TBLFIND(tbl, "scope") then -- doom#1337
		Crosshairs.Scope.ImageTransparency = 1 -- doom#1337
		Crosshairs.Scope.Scope.ImageTransparency = 1 -- doom#1337
		Crosshairs.Frame1.Transparency = 1 -- doom#1337
		Crosshairs.Frame2.Transparency = 1 -- doom#1337
		Crosshairs.Frame3.Transparency = 1 -- doom#1337
		Crosshairs.Frame4.Transparency = 1 -- doom#1337
	else -- doom#1337
		Crosshairs.Scope.ImageTransparency = 0 -- doom#1337
		Crosshairs.Scope.Scope.ImageTransparency = 0 -- doom#1337
		Crosshairs.Frame1.Transparency = 0 -- doom#1337
		Crosshairs.Frame2.Transparency = 0 -- doom#1337
		Crosshairs.Frame3.Transparency = 0 -- doom#1337
		Crosshairs.Frame4.Transparency = 0 -- doom#1337
	end -- doom#1337
	PlayerGui.Blnd.Enabled = not TBLFIND(tbl, "flash") and true or false -- doom#1337
	Lighting.GlobalShadows = not TBLFIND(tbl, "shadows") and true or false -- doom#1337
	if RayIgnore:FindFirstChild("Smokes") then -- doom#1337
		if TBLFIND(tbl, "smoke") then -- doom#1337
			for i,smoke in pairs(RayIgnore.Smokes:GetChildren()) do -- doom#1337
				smoke.ParticleEmitter.Rate = 0 -- doom#1337
			end -- doom#1337
		else -- doom#1337
			for i,smoke in pairs(RayIgnore.Smokes:GetChildren()) do -- doom#1337
				smoke.ParticleEmitter.Rate = smoke.OriginalRate.Value -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("Toggle", "force crosshair") -- doom#1337
effects:Element("ToggleColor", "world color", {default = {Color = COL3RGB(255,255,255)}}, function(val) -- doom#1337
	if val.Toggle then -- doom#1337
		Camera.ColorCorrection.TintColor = val.Color -- doom#1337
	else -- doom#1337
		Camera.ColorCorrection.TintColor = COL3RGB(255,255,255) -- doom#1337
	end -- doom#1337
end) -- doom#1337
effects:Element("Toggle", "shadowmap technology", nil, function(val) sethiddenproperty(Lighting, "Technology", val.Toggle and "ShadowMap" or "Legacy") end) -- doom#1337

local self = visuals:Sector("self", "Right") -- doom#1337
self:Element("ToggleKeybind", "third person", {}, function(tbl) -- doom#1337
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then -- doom#1337
		if tbl.Toggle then -- doom#1337
			if tbl.Active then -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider -- doom#1337
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider -- doom#1337
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider -- doom#1337
			else -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = 0 -- doom#1337
				LocalPlayer.CameraMinZoomDistance = 0 -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = 0 -- doom#1337
				LocalPlayer.CameraMinZoomDistance = 0 -- doom#1337
			end -- doom#1337
		else -- doom#1337
			LocalPlayer.CameraMaxZoomDistance = 0 -- doom#1337
			LocalPlayer.CameraMinZoomDistance = 0 -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
self:Element("Slider", "distance", {min = 6, max = 18, default = 12}, function(tbl) -- doom#1337
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then -- doom#1337
		if values.visuals.self["third person"].Toggle then -- doom#1337
			if values.visuals.self["third person"].Active then -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider -- doom#1337
				LocalPlayer.CameraMinZoomDistance = tbl.Slider -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider -- doom#1337
				LocalPlayer.CameraMinZoomDistance = tbl.Slider -- doom#1337
			else -- doom#1337
				LocalPlayer.CameraMaxZoomDistance = 0 -- doom#1337
				LocalPlayer.CameraMinZoomDistance = 0 -- doom#1337
			end -- doom#1337
		else -- doom#1337
			LocalPlayer.CameraMaxZoomDistance = 0 -- doom#1337
			LocalPlayer.CameraMinZoomDistance = 0 -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function(current) -- doom#1337
	if values.visuals.self["third person"].Toggle then -- doom#1337
		if values.visuals.self["third person"].Active then -- doom#1337
			if current ~= values.visuals.self.distance.Slider then -- doom#1337
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
self:Element("Slider", "fov changer", {min = 0, max = 120, default = 80}, function(value) -- doom#1337
	RunService.RenderStepped:Wait() -- doom#1337
	if LocalPlayer.Character == nil then return end -- doom#1337
	if fov == value.Slider then return end -- doom#1337
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then -- doom#1337
		Camera.FieldOfView = value.Slider -- doom#1337
	end -- doom#1337
end) -- doom#1337
self:Element("Toggle", "on scope") -- doom#1337
self:Element("Toggle", "viewmodel changer") -- doom#1337
self:Element("Slider", "viewmodel x", {min = -10, max = 10}, function(val) -- doom#1337
	ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50) -- doom#1337
end) -- doom#1337
self:Element("Slider", "viewmodel y", {min = -10, max = 10}, function(val) -- doom#1337
	ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50) -- doom#1337
end) -- doom#1337
self:Element("Slider", "viewmodel z", {min = -10, max = 10}, function(val) -- doom#1337
	ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50) -- doom#1337
end) -- doom#1337
self:Element("Slider", "roll", {min = -100, max = 100}, function(val) -- doom#1337
	ViewmodelOffset = CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * CFAngles(0, 0, values.visuals.self.roll.Slider/50) -- doom#1337
end) -- doom#1337
self:Element("ToggleColor", "self chams", {default = {Color = COL3RGB(255,255,255)}}, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
		for _,obj in pairs(SelfObj) do -- doom#1337
			if obj.Parent ~= nil then -- doom#1337
				obj.Material = Enum.Material.ForceField -- doom#1337
				obj.Color = tbl.Color -- doom#1337
			end -- doom#1337
		end -- doom#1337
	else -- doom#1337
		for _,obj in pairs(SelfObj) do -- doom#1337
			if obj.Parent ~= nil then -- doom#1337
				obj.Material = obj.OriginalMaterial.Value -- doom#1337
				obj.Color = obj.OriginalColor.Value -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
self:Element("Slider", "scope blend", {min = 0, max = 100, default = 0}) -- doom#1337

local ads = Client.updateads -- doom#1337
Client.updateads = function(self, ...) -- doom#1337
	local args = {...} -- doom#1337
	coroutine.wrap(function() -- doom#1337
		wait() -- doom#1337
		if LocalPlayer.Character ~= nil then -- doom#1337
			for _,part in pairs(LocalPlayer.Character:GetDescendants()) do -- doom#1337
				if part:IsA("Part") or part:IsA("MeshPart") then -- doom#1337
					if part.Transparency ~= 1 then -- doom#1337
						part.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0 -- doom#1337
					end -- doom#1337
				end -- doom#1337
				if part:IsA("Accessory") then -- doom#1337
					part.Handle.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0 -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end)() -- doom#1337
	return ads(self, ...) -- doom#1337
end -- doom#1337

local world = visuals:Sector("world", "Left") -- doom#1337
world:Element("ToggleTrans", "molly radius", {default = {Color = COL3RGB(255,0,0)}}, function(tbl) -- doom#1337
	if RayIgnore:FindFirstChild("Fires") == nil then return end -- doom#1337
	if tbl.Toggle then -- doom#1337
		for i,fire in pairs(RayIgnore:FindFirstChild("Fires"):GetChildren()) do -- doom#1337
			fire.Transparency = tbl.Transparency -- doom#1337
			fire.Color = tbl.Color -- doom#1337
		end -- doom#1337
	else -- doom#1337
		for i,fire in pairs(RayIgnore:FindFirstChild("Fires"):GetChildren()) do -- doom#1337
			fire.Transparency = 1 -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
world:Element("ToggleColor", "smoke radius", {default = {Color = COL3RGB(0, 255, 0)}}, function(tbl) -- doom#1337
	if RayIgnore:FindFirstChild("Smokes") == nil then return end -- doom#1337
	if tbl.Toggle then -- doom#1337
		for i,smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do -- doom#1337
			smoke.Transparency = 0 -- doom#1337
			smoke.Color = tbl.Color -- doom#1337
		end -- doom#1337
	else -- doom#1337
		for i,smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do -- doom#1337
			smoke.Transparency = 1 -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
world:Element("ToggleColor", "bullet tracers", {default = {Color = COL3RGB(0, 0, 255)}}) -- doom#1337
world:Element("ToggleColor", "impacts", {default = {Color = COL3RGB(255, 0, 0)}}) -- doom#1337
world:Element("ToggleColor", "hit chams", {default = {Color = COL3RGB(0, 0, 255)}}) -- doom#1337
world:Element("Dropdown", "hitsound", {options = {"none", "skeet", "neverlose", "rust", "bag", "baimware"}}) -- doom#1337
world:Element("Slider", "sound volume", {min = 1, max = 5, default = 3}) -- doom#1337
world:Element("Dropdown", "skybox", {options = {"none", "nebula", "vaporwave", "clouds"}}, function(tbl) -- doom#1337
	local sky = tbl.Dropdown -- doom#1337
	if sky ~= "none" then -- doom#1337
		if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end -- doom#1337
		local skybox = INST("Sky") -- doom#1337
		skybox.SkyboxLf = Skyboxes[sky].SkyboxLf -- doom#1337
		skybox.SkyboxBk = Skyboxes[sky].SkyboxBk -- doom#1337
		skybox.SkyboxDn = Skyboxes[sky].SkyboxDn -- doom#1337
		skybox.SkyboxFt = Skyboxes[sky].SkyboxFt -- doom#1337
		skybox.SkyboxRt = Skyboxes[sky].SkyboxRt -- doom#1337
		skybox.SkyboxUp = Skyboxes[sky].SkyboxUp -- doom#1337
		skybox.Name = "override" -- doom#1337
		skybox.Parent = Lighting -- doom#1337
	else -- doom#1337
		if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end -- doom#1337
		if oldSkybox ~= nil then oldSkybox:Clone().Parent = Lighting end -- doom#1337
	end -- doom#1337
end) -- doom#1337
world:Element("ToggleColor", "item esp", {default = {Color = COL3RGB(255, 255, 255)}}, function(tbl) -- doom#1337
	for i,weapon in pairs(workspace.Debris:GetChildren()) do -- doom#1337
		if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then -- doom#1337
			weapon.BillboardGui.ImageLabel.Visible = tbl.Toggle and TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
world:Element("Jumbobox", "types", {options = {"icon"}}, function(tbl) -- doom#1337
	for i,weapon in pairs(workspace.Debris:GetChildren()) do -- doom#1337
		if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then -- doom#1337
			weapon.BillboardGui.ImageLabel.Visible = values.visuals.world["item esp"].Toggle and TBLFIND(tbl.Jumbobox, "icon") and true or false -- doom#1337
			weapon.BillboardGui.ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
local configs = misc:Sector("configs", "Left") -- doom#1337
configs:Element("TextBox", "config", {placeholder = "config name"}) -- doom#1337
configs:Element("Button", "save", {}, function() if values.misc.configs.config.Text ~= "" then library:SaveConfig(values.misc.configs.config.Text) end end) -- doom#1337
configs:Element("Button", "load", {}, function() if values.misc.configs.config.Text ~= "" then ConfigLoad:Fire(values.misc.configs.config.Text) end end) -- doom#1337
configs:Element("Toggle", "keybind list", nil, function(tbl) -- doom#1337
	library:SetKeybindVisible(tbl.Toggle) -- doom#1337
end) -- doom#1337

local crosshaireditor = misc:Sector("crosshair editor", "Right") -- doom#1337
local function UpdateCrosshair() -- doom#1337
	if values.misc["crosshair editor"].enabled.Toggle then -- doom#1337
		local length = values.misc["crosshair editor"].length.Slider -- doom#1337
		Crosshair.LeftFrame.Size = UDIM2(0, length, 0, 2) -- doom#1337
		Crosshair.RightFrame.Size = UDIM2(0, length, 0, 2) -- doom#1337
		Crosshair.TopFrame.Size = UDIM2(0, 2, 0, length) -- doom#1337
		Crosshair.BottomFrame.Size = UDIM2(0, 2, 0, length) -- doom#1337
		for _,frame in pairs(Crosshair:GetChildren()) do -- doom#1337
			if FIND(frame.Name, "Frame") then -- doom#1337
				frame.BorderColor3 = COL3(0,0,0) -- doom#1337
				if values.misc["crosshair editor"].border.Toggle then -- doom#1337
					frame.BorderSizePixel = 1 -- doom#1337
				else -- doom#1337
					frame.BorderSizePixel = 0 -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	else -- doom#1337
		Crosshair.LeftFrame.Size = UDIM2(0, 10, 0, 2) -- doom#1337
		Crosshair.RightFrame.Size = UDIM2(0, 10, 0, 2) -- doom#1337
		Crosshair.TopFrame.Size = UDIM2(0, 2, 0, 10) -- doom#1337
		Crosshair.BottomFrame.Size = UDIM2(0, 2, 0, 10) -- doom#1337
		for _,frame in pairs(Crosshair:GetChildren()) do -- doom#1337
			if FIND(frame.Name, "Frame") then -- doom#1337
				frame.BorderSizePixel = 0 -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
crosshaireditor:Element("Toggle", "enabled", nil, UpdateCrosshair) -- doom#1337
crosshaireditor:Element("Slider", "length", {min = 1, max = 15, default = 10}, UpdateCrosshair) -- doom#1337
crosshaireditor:Element("Toggle", "border", nil, UpdateCrosshair) -- doom#1337

local client = misc:Sector("client", "Right") -- doom#1337
client:Element("Toggle", "infinite cash", nil, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
		LocalPlayer.Cash.Value = 8000 -- doom#1337
	end -- doom#1337
end) -- doom#1337
client:Element("Toggle", "infinite crouch") -- doom#1337
client:Element("Jumbobox", "damage bypass", {options = {"fire", "fall"}}) -- doom#1337
client:Element("Jumbobox", "gun modifiers", {options = {"recoil", "spread", "reload", "equip", "ammo", "automatic", "penetration", "firerate"}}) -- doom#1337
client:Element("Toggle", "remove killers", {}, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then -- doom#1337
			local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone() -- doom#1337
			clone.Name = "KillersClone" -- doom#1337
			clone.Parent = workspace:FindFirstChild("Map") -- doom#1337

			workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy() -- doom#1337
		end -- doom#1337
	else -- doom#1337
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("KillersClone") then -- doom#1337
			workspace:FindFirstChild("Map"):FindFirstChild("KillersClone").Name = "Killers" -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
client:Element("ToggleColor", "hitmarker", {default = {Color = COL3RGB(255,255,255)}}) -- doom#1337
client:Element("Toggle", "buy any grenade") -- doom#1337
client:Element("Toggle", "chat alive") -- doom#1337
client:Element("Jumbobox", "shop", {options = {"inf time", "anywhere"}}) -- doom#1337
client:Element("Toggle", "anti spectate") -- doom#1337

local oldgrenadeallowed = Client.grenadeallowed -- doom#1337
Client.grenadeallowed = function(...) -- doom#1337
	if values.misc.client["buy any grenade"].Toggle then -- doom#1337
		return true -- doom#1337
	end -- doom#1337

	return oldgrenadeallowed(...) -- doom#1337
end -- doom#1337

local movement = misc:Sector("movement", "Left") -- doom#1337
movement:Element("Toggle", "bunny hop") -- doom#1337
movement:Element("Dropdown", "direction", {options = {"forward", "directional", "directional 2"}}) -- doom#1337
movement:Element("Dropdown", "type", {options = {"gyro", "cframe"}}) -- doom#1337
movement:Element("Slider", "speed", {min = 15, max = 100, default = 40}) -- doom#1337
movement:Element("ToggleKeybind", "jump bug") -- doom#1337
movement:Element("ToggleKeybind", "edge jump") -- doom#1337
movement:Element("ToggleKeybind", "edge bug") -- doom#1337

local chat = misc:Sector("chat", "Left") -- doom#1337
chat:Element("Toggle", "chat spam", nil, function(tbl) -- doom#1337
	if tbl.Toggle then -- doom#1337
		while values.misc.chat["chat spam"].Toggle do -- doom#1337
			game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(values.misc.chat.type.Dropdown == "standard" and "hi" or "buy stormy.solutions", false, "Innocent", false, true) -- doom#1337
			wait(values.misc.chat["speed (ms)"].Slider/1000) -- doom#1337
			 -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
chat:Element("Dropdown", "type", {options = {"standard", "stormy"}}) -- doom#1337
chat:Element("Slider", "speed (ms)", {min = 150, max = 1000, default = 500}) -- doom#1337
chat:Element("Toggle", "kill say") -- doom#1337
chat:Element("TextBox", "message", {placeholder = "message"}) -- doom#1337
chat:Element("Toggle", "no filter") -- doom#1337

local grenades = misc:Sector("grenades", "Right") -- doom#1337
grenades:Element("ToggleKeybind", "spam grenades") -- doom#1337
coroutine.wrap(function() -- doom#1337
	while true do -- doom#1337
		wait(0.5) -- doom#1337
		if values.misc.grenades["spam grenades"].Toggle and values.misc.grenades["spam grenades"].Active then -- doom#1337
			local oh1 = game:GetService("ReplicatedStorage").Weapons[values.misc.grenades.grenade.Dropdown].Model -- doom#1337
			local oh3 = 25 -- doom#1337
			local oh4 = 35 -- doom#1337
			local oh6 = "" -- doom#1337
			local oh7 = "" -- doom#1337
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, Vec3(0,-100,0), oh6, oh7) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end)() -- doom#1337
grenades:Element("Dropdown", "grenade", {options = {"Flashbang", "Smoke Grenade", "Molotov", "HE Grenade", "Decoy Grenade"}}) -- doom#1337
grenades:Element("Button", "crash server", {}, function() -- doom#1337
	RunService.RenderStepped:Connect(function() -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then -- doom#1337
			local oh1 = game:GetService("ReplicatedStorage").Weapons[values.misc.grenades.grenade.Dropdown].Model -- doom#1337
			local oh3 = 25 -- doom#1337
			local oh4 = 35 -- doom#1337
			local oh6 = "" -- doom#1337
			local oh7 = "" -- doom#1337
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, Vec3(0,-100,0), oh6, oh7) -- doom#1337
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, Vec3(0,-100,0), oh6, oh7) -- doom#1337
			game:GetService("ReplicatedStorage").Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, Vec3(0,-100,0), oh6, oh7) -- doom#1337
		end -- doom#1337
	end) -- doom#1337
end) -- doom#1337

local Dance = INST("Animation") -- doom#1337
Dance.AnimationId = "rbxassetid://5917459365" -- doom#1337

local LoadedAnim -- doom#1337

local animations = misc:Sector("animations", "Right") -- doom#1337
animations:Element("ToggleKeybind", "enabled", nil, function(tbl) -- doom#1337
	pcall(function() -- doom#1337
		LoadedAnim:Stop() -- doom#1337
	end) -- doom#1337
	if not tbl.Toggle or tbl.Toggle and not tbl.Active then -- doom#1337
	else -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then -- doom#1337
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) -- doom#1337
			LoadedAnim.Priority = Enum.AnimationPriority.Action -- doom#1337
			LoadedAnim:Play() -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
animations:Element("Dropdown", "animation", {options = {"floss", "default", "lil nas x", "dolphin", "monkey"}}, function(tbl) -- doom#1337
	Dance.AnimationId = tbl.Dropdown == "floss" and "rbxassetid://5917459365" or tbl.Dropdown == "default" and "rbxassetid://3732699835" or tbl.Dropdown == "lil nas x" and "rbxassetid://5938396308" or tbl.Dropdown == "dolphin" and "rbxassetid://5938365243" or tbl.Dropdown == "monkey" and "rbxassetid://3716636630" -- doom#1337

	pcall(function() -- doom#1337
		LoadedAnim:Stop() -- doom#1337
	end) -- doom#1337

	if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then -- doom#1337
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then -- doom#1337
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) -- doom#1337
			LoadedAnim.Priority = Enum.AnimationPriority.Action -- doom#1337
			LoadedAnim:Play() -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337

local ui = misc:Sector("ui", "Left") -- doom#1337
ui:Element("Toggle", "scaling") -- doom#1337
ui:Element("Slider", "amount", {min = 5, max = 11, default = 10}) -- doom#1337

local objects = {} -- doom#1337
local utility = {} -- doom#1337
do -- doom#1337
	utility.default = { -- doom#1337
		Line = { -- doom#1337
			Thickness = 1.5, -- doom#1337
			Color = COL3RGB(255, 255, 255), -- doom#1337
			Visible = false -- doom#1337
		}, -- doom#1337
		Text = { -- doom#1337
			Size = 13, -- doom#1337
			Center = true, -- doom#1337
			Outline = true, -- doom#1337
			Font = Drawing.Fonts.Plex, -- doom#1337
			Color = COL3RGB(255, 255, 255), -- doom#1337
			Visible = false -- doom#1337
		}, -- doom#1337
		Square = { -- doom#1337
			Thickness = 1.5, -- doom#1337
			Filled = false, -- doom#1337
			Color = COL3RGB(255, 255, 255), -- doom#1337
			Visible = false -- doom#1337
		}, -- doom#1337
	} -- doom#1337
	function utility.create(type, isOutline) -- doom#1337
		local drawing = Drawing.new(type) -- doom#1337
		for i, v in pairs(utility.default[type]) do -- doom#1337
			drawing[i] = v -- doom#1337
		end -- doom#1337
		if isOutline then -- doom#1337
			drawing.Color = COL3(0,0,0) -- doom#1337
			drawing.Thickness = 3 -- doom#1337
		end -- doom#1337
		return drawing -- doom#1337
	end -- doom#1337
	function utility.add(plr) -- doom#1337
		if not objects[plr] then -- doom#1337
			objects[plr] = { -- doom#1337
				Name = utility.create("Text"), -- doom#1337
				Weapon = utility.create("Text"), -- doom#1337
				Armor = utility.create("Text"), -- doom#1337
				BoxOutline = utility.create("Square", true), -- doom#1337
				Box = utility.create("Square"), -- doom#1337
				HealthOutline = utility.create("Line", true), -- doom#1337
				Health = utility.create("Line"), -- doom#1337
			} -- doom#1337
		end -- doom#1337
	end -- doom#1337
	for _,plr in pairs(Players:GetPlayers()) do -- doom#1337
		if Player ~= LocalPlayer then -- doom#1337
			utility.add(plr) -- doom#1337
		end -- doom#1337
	end -- doom#1337
	Players.PlayerAdded:Connect(utility.add) -- doom#1337
	Players.PlayerRemoving:Connect(function(plr) -- doom#1337
		wait() -- doom#1337
		if objects[plr] then -- doom#1337
			for i,v in pairs(objects[plr]) do -- doom#1337
				for i2,v2 in pairs(v) do -- doom#1337
					if v then -- doom#1337
						v:Remove() -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end -- doom#1337

			objects[plr] = nil -- doom#1337
		end -- doom#1337
	end) -- doom#1337
end -- doom#1337
local Items = INST("ScreenGui") -- doom#1337
Items.Name = "Items" -- doom#1337
Items.Parent = game.CoreGui -- doom#1337
Items.ResetOnSpawn = false -- doom#1337
Items.ZIndexBehavior = "Global" -- doom#1337
do -- doom#1337
	function add(plr) -- doom#1337
		local ImageLabel = INST("ImageLabel") -- doom#1337
		ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255) -- doom#1337
		ImageLabel.BackgroundTransparency = 1.000 -- doom#1337
		ImageLabel.Size = UDIM2(0, 62, 0, 25) -- doom#1337
		ImageLabel.Visible = false -- doom#1337
		ImageLabel.Image = "rbxassetid://1784884358" -- doom#1337
		ImageLabel.ScaleType = Enum.ScaleType.Fit -- doom#1337
		ImageLabel.Name = plr.Name -- doom#1337
		ImageLabel.AnchorPoint = Vec2(0.5,0.5) -- doom#1337
		ImageLabel.Parent = Items -- doom#1337
	end -- doom#1337
	for _,plr in pairs(Players:GetPlayers()) do -- doom#1337
		if Player ~= LocalPlayer then -- doom#1337
			add(plr) -- doom#1337
		end -- doom#1337
	end -- doom#1337
	Players.PlayerAdded:Connect(add) -- doom#1337
	Players.PlayerRemoving:Connect(function(plr) -- doom#1337
		wait() -- doom#1337
		Items[plr.Name]:Destroy() -- doom#1337
	end) -- doom#1337
end -- doom#1337
local debrisitems = {} -- doom#1337
workspace.Debris.ChildAdded:Connect(function(obj) -- doom#1337
	if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then -- doom#1337
		RunService.RenderStepped:Wait() -- doom#1337

		local BillboardGui = INST("BillboardGui") -- doom#1337
		BillboardGui.AlwaysOnTop = true -- doom#1337
		BillboardGui.Size = UDIM2(0, 40, 0, 40) -- doom#1337
		BillboardGui.Adornee = obj -- doom#1337

		local ImageLabel = INST("ImageLabel") -- doom#1337
		ImageLabel.Parent = BillboardGui -- doom#1337
		ImageLabel.BackgroundTransparency = 1 -- doom#1337
		ImageLabel.Size = UDIM2(1, 0, 1, 0) -- doom#1337
		ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color -- doom#1337
		ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name) -- doom#1337
		ImageLabel.ScaleType = Enum.ScaleType.Fit -- doom#1337
		ImageLabel.Visible = values.visuals.world["item esp"].Toggle and TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false -- doom#1337

		BillboardGui.Parent = obj -- doom#1337
	end -- doom#1337
end) -- doom#1337
for _, obj in pairs(workspace.Debris:GetChildren()) do -- doom#1337
	if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then -- doom#1337
		RunService.RenderStepped:Wait() -- doom#1337

		local BillboardGui = INST("BillboardGui") -- doom#1337
		BillboardGui.AlwaysOnTop = true -- doom#1337
		BillboardGui.Size = UDIM2(0, 40, 0, 40) -- doom#1337
		BillboardGui.Adornee = obj -- doom#1337

		local ImageLabel = INST("ImageLabel") -- doom#1337
		ImageLabel.Parent = BillboardGui -- doom#1337
		ImageLabel.BackgroundTransparency = 1 -- doom#1337
		ImageLabel.Size = UDIM2(1, 0, 1, 0) -- doom#1337
		ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color -- doom#1337
		ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name) -- doom#1337
		ImageLabel.ScaleType = Enum.ScaleType.Fit -- doom#1337
		ImageLabel.Visible = values.visuals.world["item esp"].Toggle and TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false -- doom#1337

		BillboardGui.Parent = obj -- doom#1337
	end -- doom#1337
end -- doom#1337
local function YROTATION(cframe) -- doom#1337
	local x, y, z = cframe:ToOrientation() -- doom#1337
	return CF(cframe.Position) * CFAngles(0,y,0) -- doom#1337
end -- doom#1337
local function XYROTATION(cframe) -- doom#1337
	local x, y, z = cframe:ToOrientation() -- doom#1337
	return CF(cframe.Position) * CFAngles(x,y,0) -- doom#1337
end -- doom#1337
local weps = { -- doom#1337
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"}, -- doom#1337
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"}, -- doom#1337
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"}, -- doom#1337
	Sniper = {"AWP", "Scout", "G3SG1"} -- doom#1337
} -- doom#1337
local weps2 = { -- doom#1337
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"}, -- doom#1337
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"}, -- doom#1337
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"}, -- doom#1337
	Sniper = {"AWP", "Scout", "G3SG1"} -- doom#1337
} -- doom#1337
local function GetWeaponRage(weapon) -- doom#1337
	return TBLFIND(weps.Pistol, weapon) and "pistol" or TBLFIND(weps.Rifle, weapon) and "rifle" or weapon == "AWP" and "awp" or weapon == "G3SG1"  and "auto" or weapon == "Scout" and "scout" or "default" -- doom#1337
end -- doom#1337
local function GetStatsRage(weapon) -- doom#1337
	if weapon == "default" then -- doom#1337
		return values.rage.weapons.default -- doom#1337
	else -- doom#1337
		if values.rage.weapons[weapon]["override default"].Toggle then -- doom#1337
			return values.rage.weapons[weapon] -- doom#1337
		else -- doom#1337
			return values.rage.weapons.default -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
local function GetWeaponLegit(weapon) -- doom#1337
	return TBLFIND(weps2.Pistol, weapon) and "pistol" or TBLFIND(weps2.Rifle, weapon) and "rifle" or TBLFIND(weps2.SMG, weapon) and "smg" or TBLFIND(weps2.Sniper, weapon) and "sniper" or "default" -- doom#1337
end -- doom#1337
local function GetStatsLegit(weapon) -- doom#1337
	if weapon == "default" then -- doom#1337
		return values.legit.main.default -- doom#1337
	else -- doom#1337
		if values.legit.main[weapon]["override default"].Toggle then -- doom#1337
			return values.legit.main[weapon] -- doom#1337
		else -- doom#1337
			return values.legit.main.default -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
local Jitter = false -- doom#1337
local Spin = 0 -- doom#1337
local RageTarget -- doom#1337
local Filter = false -- doom#1337
local LastStep -- doom#1337
local TriggerDebounce = false -- doom#1337
local DisableAA = false -- doom#1337

local Fov = Drawing.new("Circle") -- doom#1337
Fov.Filled = true -- doom#1337
Fov.Color = COL3RGB(15,15,15) -- doom#1337
Fov.Transparency = 0.5 -- doom#1337
Fov.Position = Vec2(Mouse.X, Mouse.Y + 16) -- doom#1337
Fov.Radius = 120 -- doom#1337
RunService.RenderStepped:Connect(function(step) -- doom#1337
	Fov.Visible = false -- doom#1337
	LastStep = step -- doom#1337
	Ping = game.Stats.PerformanceStats.Ping:GetValue() -- doom#1337
	RageTarget = nil -- doom#1337
	local CamCFrame = Camera.CFrame -- doom#1337
	local CamLook = CamCFrame.LookVector -- doom#1337
	local PlayerIsAlive = false -- doom#1337
	local Character = LocalPlayer.Character -- doom#1337
	RageTarget = nil -- doom#1337
	Spin = CLAMP(Spin + values.rage.angles["spin speed"].Slider, 0, 360) -- doom#1337
	if Spin == 360 then Spin = 0 end -- doom#1337
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("UpperTorso") then -- doom#1337
		PlayerIsAlive = true -- doom#1337
	end -- doom#1337
	for i,v in pairs(ChamItems) do -- doom#1337
		if v.Parent == nil then -- doom#1337
			TBLREMOVE(ChamItems, i) -- doom#1337
		end -- doom#1337
	end -- doom#1337
	Fov.Position = Vec2(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2) -- doom#1337
	if PlayerIsAlive then -- doom#1337
		local SelfVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity -- doom#1337
		if values.rage.fakelag["ping spike"].Toggle and values.rage.fakelag["ping spike"].Active then -- doom#1337
			for count = 1, 20  do -- doom#1337
				game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer({[1] = "createparticle", [2] = "bullethole", [3] = LocalPlayer.Character.Head, [4] = Vec3(0,0,0)})  -- doom#1337
			end -- doom#1337
		end -- doom#1337
		local Root = LocalPlayer.Character.HumanoidRootPart -- doom#1337
		if values.misc.client["infinite crouch"].Toggle then -- doom#1337
			Client.crouchcooldown = 0 -- doom#1337
		end -- doom#1337
		if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "firerate") then -- doom#1337
			Client.DISABLED = false -- doom#1337
		end -- doom#1337
		if values.rage.exploits["kill all"].Toggle and values.rage.exploits["kill all"].Active and LocalPlayer.Character:FindFirstChild("UpperTorso") and LocalPlayer.Character:FindFirstChild("Gun") then -- doom#1337
			for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
				if Player.Character and Player.Team ~= LocalPlayer.Team and Player.Character:FindFirstChild("UpperTorso") then -- doom#1337
					local oh1 = Player.Character.Head -- doom#1337
					local oh2 = Player.Character.Head.CFrame.p -- doom#1337
					local oh3 = Client.gun.Name -- doom#1337
					local oh4 = 4096 -- doom#1337
					local oh5 = LocalPlayer.Character.Gun -- doom#1337
					local oh8 = 15 -- doom#1337
					local oh9 = false -- doom#1337
					local oh10 = false -- doom#1337
					local oh11 = Vec3(0,0,0) -- doom#1337
					local oh12 = 16868 -- doom#1337
					local oh13 = Vec3(0, 0, 0) -- doom#1337
					game:GetService("ReplicatedStorage").Events.HitPart:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13) -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
		if TBLFIND(values.visuals.effects.removals.Jumbobox, "scope lines") then  -- doom#1337
			NewScope.Enabled = LocalPlayer.Character:FindFirstChild("AIMING") and true or false -- doom#1337
			Crosshairs.Scope.Visible = false -- doom#1337
		else -- doom#1337
			NewScope.Enabled = false -- doom#1337
		end -- doom#1337
		local RageGuy -- doom#1337
		if workspace:FindFirstChild("Map") and Client.gun ~= "none" and Client.gun.Name ~= "C4" then -- doom#1337
			if values.rage.aimbot.enabled.Toggle then -- doom#1337
				local Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.LowerTorso.Position + Vec3(0, 2.5, 0) or CamCFrame.p -- doom#1337
				local Stats = GetStatsRage(GetWeaponRage(Client.gun.Name)) -- doom#1337
				for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
					if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "firerate") then -- doom#1337
						Client.DISABLED = false -- doom#1337
					end -- doom#1337
					if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and Player ~= LocalPlayer then -- doom#1337
						if TBLFIND(values.rage.aimbot.resolver.Jumbobox, "pitch") then -- doom#1337
							Player.Character.UpperTorso.Waist.C0 = CFAngles(0, 0, 0) -- doom#1337
						end -- doom#1337
						if TBLFIND(values.rage.aimbot.resolver.Jumbobox, "roll") then -- doom#1337
							Player.Character.Humanoid.MaxSlopeAngle = 0 -- doom#1337
						end -- doom#1337
					end -- doom#1337
					if Player.Character and Player.Character:FindFirstChild("Humanoid") and not Client.DISABLED and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and not Player.Character:FindFirstChildOfClass("ForceField") and GetDeg(CamCFrame, Player.Character.Head.Position) <= Stats["max fov"].Slider and Player ~= LocalPlayer then -- doom#1337
						if Player.Team ~= LocalPlayer.Team or values.rage.aimbot.teammates.Toggle and Player:FindFirstChild("Status") and Player.Status.Team.Value ~= LocalPlayer.Status.Team.Value and Player.Status.Alive.Value then -- doom#1337
							if Client.gun:FindFirstChild("Melee") and values.rage.aimbot["knifebot"].Toggle then -- doom#1337
								local Ignore = {unpack(Collision)} -- doom#1337
								INSERT(Ignore, workspace.Map.Clips) -- doom#1337
								INSERT(Ignore, workspace.Map.SpawnPoints) -- doom#1337
								INSERT(Ignore, LocalPlayer.Character) -- doom#1337
								INSERT(Ignore, Player.Character.HumanoidRootPart) -- doom#1337
								if Player.Character:FindFirstChild("BackC4") then -- doom#1337
									INSERT(Ignore, Player.Character.BackC4) -- doom#1337
								end -- doom#1337
								if Player.Character:FindFirstChild("Gun") then -- doom#1337
									INSERT(Ignore, Player.Character.Gun) -- doom#1337
								end -- doom#1337

								local Ray = RAY(Origin, (Player.Character.Head.Position - Origin).unit * 20) -- doom#1337
								local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore, false, true) -- doom#1337

								if Hit and Hit.Parent == Player.Character then -- doom#1337
									RageGuy = Hit -- doom#1337
									RageTarget = Hit -- doom#1337
									if not values.rage.aimbot["silent aim"].Toggle then -- doom#1337
										Camera.CFrame = CF(CamCFrame.Position, Hit.Position) -- doom#1337
									end -- doom#1337
									Filter = true -- doom#1337
									Client.firebullet() -- doom#1337
									Filter = false -- doom#1337

									local Arguments = { -- doom#1337
										[1] = Hit, -- doom#1337
										[2] = Hit.Position, -- doom#1337
										[3] = Client.gun.Name, -- doom#1337
										[4] = 4096, -- doom#1337
										[5] = LocalPlayer.Character.Gun, -- doom#1337
										[8] = 1, -- doom#1337
										[9] = false, -- doom#1337
										[10] = false, -- doom#1337
										[11] = Vec3(), -- doom#1337
										[12] = 16868, -- doom#1337
										[13] = Vec3() -- doom#1337
									} -- doom#1337
									game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
								end -- doom#1337
							else -- doom#1337
								local Ignore = {unpack(Collision)} -- doom#1337
								INSERT(Ignore, workspace.Map.Clips) -- doom#1337
								INSERT(Ignore, workspace.Map.SpawnPoints) -- doom#1337
								INSERT(Ignore, LocalPlayer.Character) -- doom#1337
								INSERT(Ignore, Player.Character.HumanoidRootPart) -- doom#1337
								if Player.Character:FindFirstChild("BackC4") then -- doom#1337
									INSERT(Ignore, Player.Character.BackC4) -- doom#1337
								end -- doom#1337
								if Player.Character:FindFirstChild("Gun") then -- doom#1337
									INSERT(Ignore, Player.Character.Gun) -- doom#1337
								end -- doom#1337

								local Hitboxes = {} -- doom#1337
								for _,Hitbox in ipairs(Stats.hitboxes.Jumbobox) do -- doom#1337
									if Stats["prefer body"].Toggle then -- doom#1337
										if Hitbox == "head" and (not values.rage.aimbot["auto baim"].Toggle or Player.Character:FindFirstChild("FakeHead")) then -- doom#1337
											INSERT(Hitboxes, Player.Character.Head) -- doom#1337
										elseif Hitbox == "torso" then -- doom#1337
											INSERT(Hitboxes, Player.Character.UpperTorso) -- doom#1337
										else -- doom#1337
											INSERT(Hitboxes, Player.Character.LowerTorso) -- doom#1337
										end -- doom#1337
									else -- doom#1337
										if Hitbox == "torso" then -- doom#1337
											INSERT(Hitboxes, Player.Character.UpperTorso) -- doom#1337
										elseif Hitbox == "pelvis" then -- doom#1337
											INSERT(Hitboxes, Player.Character.LowerTorso) -- doom#1337
										elseif not values.rage.aimbot["auto baim"].Toggle or Player.Character:FindFirstChild("FakeHead") then -- doom#1337
											INSERT(Hitboxes, Player.Character.Head) -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337

								for _,Hitbox in ipairs(Hitboxes) do -- doom#1337
									local Ignore2 = {unpack(Ignore)} -- doom#1337
									for _,Part in pairs(Player.Character:GetChildren()) do -- doom#1337
										if Part ~= Hitbox then INSERT(Ignore2, Part) end -- doom#1337
									end -- doom#1337
									if values.rage.aimbot["automatic penetration"].Toggle then -- doom#1337
										local Hits = {} -- doom#1337
										local EndHit, Hit, Pos -- doom#1337
										local Penetration = Client.gun.Penetration.Value * 0.01 -- doom#1337
										local Ray1 = RAY(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude) -- doom#1337
										repeat -- doom#1337
											Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore2, false, true) -- doom#1337
											if Hit ~= nil and Hit.Parent ~= nil then -- doom#1337
												if Hit and Multipliers[Hit.Name] ~= nil then -- doom#1337
													EndHit = Hit -- doom#1337
												else -- doom#1337
													INSERT(Ignore2, Hit) -- doom#1337
													INSERT(Hits, {["Position"] = Pos,["Hit"] = Hit}) -- doom#1337
												end -- doom#1337
											end -- doom#1337
										until EndHit ~= nil or #Hits >= 4 or Hit == nil -- doom#1337
										if EndHit ~= nil and Multipliers[EndHit.Name] ~= nil and #Hits <= 4 then -- doom#1337
											if #Hits == 0 then -- doom#1337
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] -- doom#1337
												if Player:FindFirstChild("Kevlar") then -- doom#1337
													if FIND(EndHit.Name, "Head") then -- doom#1337
														if Player:FindFirstChild("Helmet") then -- doom#1337
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value -- doom#1337
														end -- doom#1337
													else -- doom#1337
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value -- doom#1337
													end -- doom#1337
												end -- doom#1337
												Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100 -- doom#1337
												if Damage >= Stats["minimum damage"].Slider then -- doom#1337
													RageGuy = EndHit -- doom#1337
													RageTarget = EndHit -- doom#1337
													if not values.rage.aimbot["silent aim"].Toggle then -- doom#1337
														Camera.CFrame = CF(CamCFrame.Position, EndHit.Position) -- doom#1337
													end -- doom#1337
													Filter = true -- doom#1337
													if values.rage.aimbot["automatic fire"].Dropdown == "standard" then -- doom#1337
														Client.firebullet() -- doom#1337
														if values.rage.exploits["double tap"].Toggle and values.rage.exploits["double tap"].Active then -- doom#1337
															Client.firebullet() -- doom#1337
														end -- doom#1337
													elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then -- doom#1337
														Client.firebullet() -- doom#1337
														local Arguments = { -- doom#1337
															[1] = EndHit, -- doom#1337
															[2] = EndHit.Position, -- doom#1337
															[3] = LocalPlayer.Character.EquippedTool.Value, -- doom#1337
															[4] = 100, -- doom#1337
															[5] = LocalPlayer.Character.Gun, -- doom#1337
															[8] = 1, -- doom#1337
															[9] = false, -- doom#1337
															[10] = false, -- doom#1337
															[11] = Vec3(), -- doom#1337
															[12] = 100, -- doom#1337
															[13] = Vec3() -- doom#1337
														} -- doom#1337
														game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
														if values.rage.exploits["double tap"].Toggle and values.rage.exploits["double tap"].Active then -- doom#1337
															Client.firebullet() -- doom#1337
															local Arguments = { -- doom#1337
																[1] = EndHit, -- doom#1337
																[2] = EndHit.Position, -- doom#1337
																[3] = LocalPlayer.Character.EquippedTool.Value, -- doom#1337
																[4] = 100, -- doom#1337
																[5] = LocalPlayer.Character.Gun, -- doom#1337
																[8] = 1, -- doom#1337
																[9] = false, -- doom#1337
																[10] = false, -- doom#1337
																[11] = Vec3(), -- doom#1337
																[12] = 100, -- doom#1337
																[13] = Vec3() -- doom#1337
															} -- doom#1337
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
														end -- doom#1337
													end -- doom#1337
													Filter = false -- doom#1337
													break -- doom#1337
												end -- doom#1337
											else -- doom#1337
												local penetration = Client.gun.Penetration.Value * 0.01 -- doom#1337
												local limit = 0 -- doom#1337
												local dmgmodifier = 1 -- doom#1337
												for i = 1, #Hits do -- doom#1337
													local data = Hits[i] -- doom#1337
													local part = data["Hit"] -- doom#1337
													local pos = data["Position"] -- doom#1337
													local modifier = 1 -- doom#1337
													if part.Material == Enum.Material.DiamondPlate then -- doom#1337
														modifier = 3 -- doom#1337
													end -- doom#1337
													if part.Material == Enum.Material.CorrodedMetal or part.Material == Enum.Material.Metal or part.Material == Enum.Material.Concrete or part.Material == Enum.Material.Brick then -- doom#1337
														modifier = 2 -- doom#1337
													end -- doom#1337
													if part.Name == "Grate" or part.Material == Enum.Material.Wood or part.Material == Enum.Material.WoodPlanks then -- doom#1337
														modifier = 0.1 -- doom#1337
													end -- doom#1337
													if part.Name == "nowallbang" then -- doom#1337
														modifier = 100 -- doom#1337
													end -- doom#1337
													if part:FindFirstChild("PartModifier") then -- doom#1337
														modifier = part.PartModifier.Value -- doom#1337
													end -- doom#1337
													if part.Transparency == 1 or part.CanCollide == false or part.Name == "Glass" or part.Name == "Cardboard" then -- doom#1337
														modifier = 0 -- doom#1337
													end -- doom#1337
													local direction = (Hitbox.Position - pos).unit * CLAMP(Client.gun.Range.Value, 1, 100) -- doom#1337
													local ray = RAY(pos + direction * 1, direction * -2) -- doom#1337
													local _,endpos = workspace:FindPartOnRayWithWhitelist(ray, {part}, true) -- doom#1337
													local thickness = (endpos - pos).Magnitude -- doom#1337
													thickness = thickness * modifier -- doom#1337
													limit = MIN(penetration, limit + thickness) -- doom#1337
													dmgmodifier = 1 - limit / penetration -- doom#1337
												end -- doom#1337
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] * dmgmodifier -- doom#1337
												if Player:FindFirstChild("Kevlar") then -- doom#1337
													if FIND(EndHit.Name, "Head") then -- doom#1337
														if Player:FindFirstChild("Helmet") then -- doom#1337
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value -- doom#1337
														end -- doom#1337
													else -- doom#1337
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value -- doom#1337
													end -- doom#1337
												end -- doom#1337
												Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100 -- doom#1337
												if Damage >= Stats["minimum damage"].Slider then -- doom#1337
													RageGuy = EndHit -- doom#1337
													RageTarget = EndHit -- doom#1337
													if not values.rage.aimbot["silent aim"].Toggle then -- doom#1337
														Camera.CFrame = CF(CamCFrame.Position, EndHit.Position) -- doom#1337
													end -- doom#1337
													Filter = true -- doom#1337
													if values.rage.aimbot["automatic fire"].Dropdown == "standard" then -- doom#1337
														Client.firebullet() -- doom#1337
														if values.rage.exploits["double tap"].Toggle and values.rage.exploits["double tap"].Active then -- doom#1337
															Client.firebullet() -- doom#1337
														end -- doom#1337
													elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then -- doom#1337
														Client.firebullet() -- doom#1337
														local Arguments = { -- doom#1337
															[1] = EndHit, -- doom#1337
															[2] = EndHit.Position, -- doom#1337
															[3] = LocalPlayer.Character.EquippedTool.Value, -- doom#1337
															[4] = 100, -- doom#1337
															[5] = LocalPlayer.Character.Gun, -- doom#1337
															[8] = 1, -- doom#1337
															[9] = false, -- doom#1337
															[10] = false, -- doom#1337
															[11] = Vec3(), -- doom#1337
															[12] = 100, -- doom#1337
															[13] = Vec3() -- doom#1337
														} -- doom#1337
														game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
														if values.rage.exploits["double tap"].Toggle and values.rage.exploits["double tap"].Active then -- doom#1337
															Client.firebullet() -- doom#1337
															local Arguments = { -- doom#1337
																[1] = EndHit, -- doom#1337
																[2] = EndHit.Position, -- doom#1337
																[3] = LocalPlayer.Character.EquippedTool.Value, -- doom#1337
																[4] = 100, -- doom#1337
																[5] = LocalPlayer.Character.Gun, -- doom#1337
																[8] = 1, -- doom#1337
																[9] = false, -- doom#1337
																[10] = false, -- doom#1337
																[11] = Vec3(), -- doom#1337
																[12] = 100, -- doom#1337
																[13] = Vec3() -- doom#1337
															} -- doom#1337
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
														end -- doom#1337
													end -- doom#1337
													Filter = false -- doom#1337
													break -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									else -- doom#1337
										local Ray = RAY(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude) -- doom#1337
										local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore2, false, true) -- doom#1337
										if Hit and Multipliers[Hit.Name] ~= nil then -- doom#1337
											local Damage = Client.gun.DMG.Value * Multipliers[Hit.Name] -- doom#1337
											if Player:FindFirstChild("Kevlar") then -- doom#1337
												if FIND(Hit.Name, "Head") then -- doom#1337
													if Player:FindFirstChild("Helmet") then -- doom#1337
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value -- doom#1337
													end -- doom#1337
												else -- doom#1337
													Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value -- doom#1337
												end -- doom#1337
											end -- doom#1337
											Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - Hit.Position).Magnitude/500)) -- doom#1337
											if Damage >= Stats["minimum damage"].Slider then -- doom#1337
												RageGuy = Hit -- doom#1337
												RageTarget = Hit -- doom#1337
												if not values.rage.aimbot["silent aim"].Toggle then -- doom#1337
													Camera.CFrame = CF(CamCFrame.Position, Hit.Position) -- doom#1337
												end -- doom#1337
												Filter = true -- doom#1337
												if values.rage.aimbot["automatic fire"].Dropdown == "standard" then -- doom#1337
													Client.firebullet() -- doom#1337
													if values.rage.exploits["double tap"].Toggle and values.rage.exploits["double tap"].Active then -- doom#1337
														Client.firebullet() -- doom#1337
													end -- doom#1337
												elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then -- doom#1337
													Client.firebullet() -- doom#1337
													local Arguments = { -- doom#1337
														[1] = EndHit, -- doom#1337
														[2] = EndHit.Position, -- doom#1337
														[3] = LocalPlayer.Character.EquippedTool.Value, -- doom#1337
														[4] = 100, -- doom#1337
														[5] = LocalPlayer.Character.Gun, -- doom#1337
														[8] = 1, -- doom#1337
														[9] = false, -- doom#1337
														[10] = false, -- doom#1337
														[11] = Vec3(), -- doom#1337
														[12] = 100, -- doom#1337
														[13] = Vec3() -- doom#1337
													} -- doom#1337
													game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
													if values.rage.exploits["double tap"].Toggle and values.rage.exploits["double tap"].Active then -- doom#1337
														Client.firebullet() -- doom#1337
														local Arguments = { -- doom#1337
															[1] = EndHit, -- doom#1337
															[2] = EndHit.Position, -- doom#1337
															[3] = LocalPlayer.Character.EquippedTool.Value, -- doom#1337
															[4] = 100, -- doom#1337
															[5] = LocalPlayer.Character.Gun, -- doom#1337
															[8] = 1, -- doom#1337
															[9] = false, -- doom#1337
															[10] = false, -- doom#1337
															[11] = Vec3(), -- doom#1337
															[12] = 100, -- doom#1337
															[13] = Vec3() -- doom#1337
														} -- doom#1337
														game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments)) -- doom#1337
													end -- doom#1337
												end -- doom#1337
												Filter = false -- doom#1337
												break -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end -- doom#1337
			elseif values.legit.aimbot["aim assist"].Toggle and values.legit.aimbot["aim assist"].Active and not library.uiopen then -- doom#1337
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name)) -- doom#1337
				local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris} -- doom#1337
				local Closest = 9999 -- doom#1337
				local Target -- doom#1337

				Fov.Radius = Stats["field of view"].Slider -- doom#1337
				Fov.Visible =  values.legit.settings["draw fov"].Toggle -- doom#1337
				Fov.Color =  values.legit.settings["draw fov"].Color -- doom#1337

				if not TBLFIND(Stats.conditions.Jumbobox, "smoke") then -- doom#1337
					INSERT(Ignore, workspace.Ray_Ignore) -- doom#1337
				end -- doom#1337

				if not TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then -- doom#1337
					if not TBLFIND(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then -- doom#1337
						for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
							if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then -- doom#1337
								if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then -- doom#1337
									if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then -- doom#1337
										local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position) -- doom#1337
										if onScreen then -- doom#1337
											local Magnitude = (Vec2(Pos.X, Pos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
											if Magnitude < Stats["field of view"].Slider then -- doom#1337
												local Hitbox = Stats.hitbox.Dropdown == "head" and Player.Character.Head or Stats.hitbox.Dropdown == "chest" and Player.Character.UpperTorso -- doom#1337
												if Stats.hitbox.Dropdown == "closest" then -- doom#1337
													local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position) -- doom#1337
													local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position) -- doom#1337
													local HeadDistance = (Vec2(HeadPos.X, HeadPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
													local TorsoDistance = (Vec2(TorsoPos.X, TorsoPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
													if HeadDistance < TorsoDistance then -- doom#1337
														Hitbox = Player.Character.Head -- doom#1337
													else -- doom#1337
														Hitbox = Player.Character.UpperTorso -- doom#1337
													end -- doom#1337
												end -- doom#1337
												if Hitbox ~= nil then -- doom#1337
													if not TBLFIND(Stats.conditions.Jumbobox, "visible") then -- doom#1337
														Target = Hitbox -- doom#1337
													else -- doom#1337
														local Ray1 = RAY(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude) -- doom#1337
														local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true) -- doom#1337
														if Hit and Hit:FindFirstAncestor(Player.Name) then -- doom#1337
															Target = Hitbox -- doom#1337
														end -- doom#1337
													end -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end -- doom#1337

				if Target ~= nil then -- doom#1337
					local Pos = Camera:WorldToScreenPoint(Target.Position) -- doom#1337
					local Magnitude = Vec2(Pos.X - Mouse.X, Pos.Y - Mouse.Y) -- doom#1337
					mousemoverel(Magnitude.x/Stats.smoothing.Slider, Magnitude.y/Stats.smoothing.Slider) -- doom#1337
				end -- doom#1337
			end -- doom#1337
			if not values.rage.aimbot.enabled.Toggle and values.legit.aimbot["triggerbot"].Toggle and values.legit.aimbot["triggerbot"].Active and not TriggerDebounce then -- doom#1337
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name)) -- doom#1337
				if Stats.triggerbot.Toggle then -- doom#1337
					if not TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then -- doom#1337
						if not TBLFIND(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then -- doom#1337
							if Mouse.Target and Mouse.Target.Parent and Players:GetPlayerFromCharacter(Mouse.Target.Parent) and Multipliers[Mouse.Target.Name] ~= nil and Client.gun.DMG.Value * Multipliers[Mouse.Target.Name] >= Stats["minimum dmg"].Slider then -- doom#1337
								local OldTarget = Mouse.Target -- doom#1337
								local Player = Players:GetPlayerFromCharacter(Mouse.Target.Parent) -- doom#1337
								if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then -- doom#1337
									coroutine.wrap(function() -- doom#1337
										TriggerDebounce = true -- doom#1337
										wait(Stats["delay (ms)"].Slider/1000) -- doom#1337
										repeat RunService.RenderStepped:Wait() -- doom#1337
											if not Client.DISABLED then -- doom#1337
												Client.firebullet() -- doom#1337
											end -- doom#1337
										until Mouse.Target == nil or Player ~= Players:GetPlayerFromCharacter(Mouse.Target.Parent) -- doom#1337
										TriggerDebounce = false -- doom#1337
									end)() -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end  -- doom#1337
		end -- doom#1337
		BodyVelocity:Destroy() -- doom#1337
		BodyVelocity = INST("BodyVelocity") -- doom#1337
		BodyVelocity.MaxForce = Vec3(HUGE,0,HUGE) -- doom#1337
		if UserInputService:IsKeyDown("Space") and values.misc.movement["bunny hop"].Toggle then -- doom#1337
			local add = 0 -- doom#1337
			if values.misc.movement.direction.Dropdown == "directional" or values.misc.movement.direction.Dropdown == "directional 2" then -- doom#1337
				if UserInputService:IsKeyDown("A") then add = 90 end -- doom#1337
				if UserInputService:IsKeyDown("S") then add = 180 end -- doom#1337
				if UserInputService:IsKeyDown("D") then add = 270 end -- doom#1337
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end -- doom#1337
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end -- doom#1337
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end -- doom#1337
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end -- doom#1337
			end -- doom#1337
			local rot = YROTATION(CamCFrame) * CFAngles(0,RAD(add),0) -- doom#1337
			BodyVelocity.Parent = LocalPlayer.Character.UpperTorso -- doom#1337
			LocalPlayer.Character.Humanoid.Jump = true -- doom#1337
			BodyVelocity.Velocity = Vec3(rot.LookVector.X,0,rot.LookVector.Z) * (values.misc.movement["speed"].Slider * 2) -- doom#1337
			if add == 0 and values.misc.movement.direction.Dropdown == "directional" and not UserInputService:IsKeyDown("W") then -- doom#1337
				BodyVelocity:Destroy() -- doom#1337
			else -- doom#1337
				if values.misc.movement.type.Dropdown == "cframe" then -- doom#1337
					BodyVelocity:Destroy() -- doom#1337
					Root.CFrame = Root.CFrame + Vec3(rot.LookVector.X,0,rot.LookVector.Z) * values.misc.movement["speed"].Slider/50 -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
		if values.misc.movement["edge jump"].Toggle and values.misc.movement["edge jump"].Active then -- doom#1337
			if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then -- doom#1337
				coroutine.wrap(function() -- doom#1337
					RunService.RenderStepped:Wait() -- doom#1337
					if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then -- doom#1337
						LocalPlayer.Character.Humanoid:ChangeState("Jumping") -- doom#1337
					end -- doom#1337
				end)() -- doom#1337
			end -- doom#1337
		end -- doom#1337
		Jitter = not Jitter -- doom#1337
		LocalPlayer.Character.Humanoid.AutoRotate = false -- doom#1337
		if values.rage.angles.enabled.Toggle and not DisableAA then -- doom#1337
			local Angle = -ATAN2(CamLook.Z, CamLook.X) + RAD(-90) -- doom#1337
			if values.rage.angles["yaw base"].Dropdown == "spin" then -- doom#1337
				Angle = Angle + RAD(Spin) -- doom#1337
			end -- doom#1337
			if values.rage.angles["yaw base"].Dropdown == "random" then -- doom#1337
				Angle = Angle + RAD(RANDOM(0, 360)) -- doom#1337
			end -- doom#1337
			local Offset = RAD(-values.rage.angles["yaw offset"].Slider - (values.rage.angles.jitter.Toggle and Jitter and values.rage.angles["jitter offset"].Slider or 0)) -- doom#1337
			local CFramePos = CF(Root.Position) * CFAngles(0, Angle + Offset, 0) -- doom#1337
			if values.rage.angles["yaw base"].Dropdown == "targets" then -- doom#1337
				local part -- doom#1337
				local closest = 9999 -- doom#1337
				for _,plr in pairs(Players:GetPlayers()) do -- doom#1337
					if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 and plr.Team ~= LocalPlayer.Team then -- doom#1337
						local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position) -- doom#1337
						local magnitude = (Vec2(pos.X, pos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
						if closest > magnitude then -- doom#1337
							part = plr.Character.HumanoidRootPart -- doom#1337
							closest = magnitude -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end -- doom#1337
				if part ~= nil then -- doom#1337
					CFramePos = CF(Root.Position, part.Position) * CFAngles(0, Offset, 0) -- doom#1337
				end -- doom#1337
			end -- doom#1337

			Root.CFrame = YROTATION(CFramePos) -- doom#1337
			if values.rage.angles["body roll"].Dropdown == "180" then -- doom#1337
				Root.CFrame = Root.CFrame * CFAngles(values.rage.angles["body roll"].Dropdown == "180" and RAD(180) or 0, 1, 0) -- doom#1337
				LocalPlayer.Character.Humanoid.HipHeight = 4 -- doom#1337
			else -- doom#1337
				LocalPlayer.Character.Humanoid.HipHeight = 2 -- doom#1337
			end -- doom#1337

			local Pitch = values.rage.angles["pitch"].Dropdown == "none" and CamLook.Y or values.rage.angles["pitch"].Dropdown == "up" and 1 or values.rage.angles["pitch"].Dropdown == "down" and -1 or values.rage.angles["pitch"].Dropdown == "zero" and 0 or values.rage.angles["pitch"].Dropdown == "random" and RANDOM(-10, 10)/10 or 2.5 -- doom#1337
			if values.rage.angles["extend pitch"].Toggle and (values.rage.angles["pitch"].Dropdown == "up" or values.rage.angles["pitch"].Dropdown == "down") then -- doom#1337
				Pitch = (Pitch*2)/1.6 -- doom#1337
			end -- doom#1337
			game.ReplicatedStorage.Events.ControlTurn:FireServer(Pitch, LocalPlayer.Character:FindFirstChild("Climbing") and true or false) -- doom#1337
		else -- doom#1337
			LocalPlayer.Character.Humanoid.HipHeight = 2 -- doom#1337
			Root.CFrame = CF(Root.Position) * CFAngles(0, -ATAN2(CamLook.Z, CamLook.X) + RAD(270), 0) -- doom#1337
			game.ReplicatedStorage.Events.ControlTurn:FireServer(CamLook.Y, LocalPlayer.Character:FindFirstChild("Climbing") and true or false) -- doom#1337
		end -- doom#1337
		if values.rage.others["remove head"].Toggle then -- doom#1337
			if LocalPlayer.Character:FindFirstChild("FakeHead") then -- doom#1337
				LocalPlayer.Character.FakeHead:Destroy() -- doom#1337
			end -- doom#1337
			if LocalPlayer.Character:FindFirstChild("HeadHB") then -- doom#1337
				LocalPlayer.Character.HeadHB:Destroy() -- doom#1337
			end -- doom#1337
		end -- doom#1337
		if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "recoil") then -- doom#1337
			Client.resetaccuracy() -- doom#1337
			Client.RecoilX = 0 -- doom#1337
			Client.RecoilY = 0 -- doom#1337
		end -- doom#1337
	end -- doom#1337
	for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
		if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then -- doom#1337
			coroutine.wrap(function() -- doom#1337
				local Position = Player.Character.HumanoidRootPart.Position -- doom#1337
				RunService.RenderStepped:Wait() -- doom#1337
				if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") then -- doom#1337
					if Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then -- doom#1337
						Player.Character.HumanoidRootPart.OldPosition.Value = Position -- doom#1337
					else -- doom#1337
						local Value = INST("Vector3Value") -- doom#1337
						Value.Name = "OldPosition" -- doom#1337
						Value.Value = Position -- doom#1337
						Value.Parent = Player.Character.HumanoidRootPart -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end)() -- doom#1337
		end -- doom#1337
	end -- doom#1337
	for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
		local tbl = objects[Player] -- doom#1337
		if tbl == nil then return end -- doom#1337
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Team ~= "TTT" and (Player.Team ~= LocalPlayer.Team or values.visuals.players.teammates.Toggle) and Player.Character:FindFirstChild("Gun") and Player.Character:FindFirstChild("Humanoid") and Player ~= LocalPlayer then -- doom#1337
			local HumanoidRootPart = Player.Character.HumanoidRootPart -- doom#1337
			local RootPosition = HumanoidRootPart.Position -- doom#1337
			local Pos, OnScreen = Camera:WorldToViewportPoint(RootPosition) -- doom#1337
			local Size = (Camera:WorldToViewportPoint(RootPosition - Vec3(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPosition + Vec3(0, 2.6, 0)).Y) / 2 -- doom#1337

			local Drawings, Text = TBLFIND(values.visuals.players.outlines.Jumbobox, "drawings") ~= nil, TBLFIND(values.visuals.players.outlines.Jumbobox, "text") ~= nil -- doom#1337

			tbl.Box.Color = values.visuals.players.box.Color -- doom#1337
			tbl.Box.Size = Vec2(Size * 1.5, Size * 1.9) -- doom#1337
			tbl.Box.Position = Vec2(Pos.X - Size*1.5 / 2, (Pos.Y - Size*1.6 / 2)) -- doom#1337

			if values.visuals.players.box.Toggle then -- doom#1337
				tbl.Box.Visible = OnScreen -- doom#1337
				if Drawings then -- doom#1337
					tbl.BoxOutline.Size = tbl.Box.Size -- doom#1337
					tbl.BoxOutline.Position = tbl.Box.Position -- doom#1337
					tbl.BoxOutline.Visible = OnScreen -- doom#1337
				else -- doom#1337
					tbl.BoxOutline.Visible = false -- doom#1337
				end -- doom#1337
			else -- doom#1337
				tbl.Box.Visible = false -- doom#1337
				tbl.BoxOutline.Visible = false -- doom#1337
			end -- doom#1337

			if values.visuals.players.health.Toggle then -- doom#1337
				tbl.Health.Color = COL3(0,1,0) -- doom#1337
				tbl.Health.From = Vec2((tbl.Box.Position.X - 5), tbl.Box.Position.Y + tbl.Box.Size.Y) -- doom#1337
				tbl.Health.To = Vec2(tbl.Health.From.X, tbl.Health.From.Y - CLAMP(Player.Character.Humanoid.Health / Player.Character.Humanoid.MaxHealth, 0, 1) * tbl.Box.Size.Y) -- doom#1337
				tbl.Health.Visible = OnScreen -- doom#1337
				if Drawings then -- doom#1337
					tbl.HealthOutline.From = Vec2(tbl.Health.From.X, tbl.Box.Position.Y + tbl.Box.Size.Y + 1) -- doom#1337
					tbl.HealthOutline.To = Vec2(tbl.Health.From.X, (tbl.Health.From.Y - 1 * tbl.Box.Size.Y) -1) -- doom#1337
					tbl.HealthOutline.Visible = OnScreen -- doom#1337
				else -- doom#1337
					tbl.HealthOutline.Visible = false -- doom#1337
				end -- doom#1337
			else -- doom#1337
				tbl.Health.Visible = false -- doom#1337
				tbl.HealthOutline.Visible = false -- doom#1337
			end -- doom#1337

			if values.visuals.players.weapon.Toggle then -- doom#1337
				tbl.Weapon.Color = values.visuals.players.weapon.Color -- doom#1337
				tbl.Weapon.Text = Player.Character.EquippedTool.Value -- doom#1337
				tbl.Weapon.Position = Vec2(tbl.Box.Size.X/2 + tbl.Box.Position.X, tbl.Box.Size.Y + tbl.Box.Position.Y + 1) -- doom#1337
				tbl.Weapon.Font = Drawing.Fonts[values.visuals.players.font.Dropdown] -- doom#1337
				tbl.Weapon.Outline = Text -- doom#1337
				tbl.Weapon.Size = values.visuals.players.size.Slider -- doom#1337
				tbl.Weapon.Visible = OnScreen -- doom#1337
			else -- doom#1337
				tbl.Weapon.Visible = false -- doom#1337
			end -- doom#1337

			if values.visuals.players["weapon icon"].Toggle then -- doom#1337
				Items[Player.Name].ImageColor3 = values.visuals.players["weapon icon"].Color -- doom#1337
				Items[Player.Name].Image = GetIcon.getWeaponOfKiller(Player.Character.EquippedTool.Value) -- doom#1337
				Items[Player.Name].Position = UDIM2(0, tbl.Box.Size.X/2 + tbl.Box.Position.X, 0, tbl.Box.Size.Y + tbl.Box.Position.Y + (values.visuals.players.weapon.Toggle and -10 or -22)) -- doom#1337
				Items[Player.Name].Visible = OnScreen -- doom#1337
			else -- doom#1337
				Items[Player.Name].Visible = false -- doom#1337
			end -- doom#1337

			if values.visuals.players.name.Toggle then -- doom#1337
				tbl.Name.Color = values.visuals.players.name.Color -- doom#1337
				tbl.Name.Text = Player.Name -- doom#1337
				tbl.Name.Position = Vec2(tbl.Box.Size.X/2 + tbl.Box.Position.X,  tbl.Box.Position.Y - 16) -- doom#1337
				tbl.Name.Font = Drawing.Fonts[values.visuals.players.font.Dropdown] -- doom#1337
				tbl.Name.Outline = Text -- doom#1337
				tbl.Name.Size = values.visuals.players.size.Slider -- doom#1337
				tbl.Name.Visible = OnScreen -- doom#1337
			else -- doom#1337
				tbl.Name.Visible = false -- doom#1337
			end -- doom#1337
			local LastInfoPos = tbl.Box.Position.Y - 1 -- doom#1337
			if TBLFIND(values.visuals.players.indicators.Jumbobox, "armor") and Player:FindFirstChild("Kevlar") then -- doom#1337
				tbl.Armor.Color = COL3RGB(0, 150, 255) -- doom#1337
				tbl.Armor.Text = Player:FindFirstChild("Helmet") and "HK" or "K" -- doom#1337
				tbl.Armor.Position = Vec2(tbl.Box.Size.X + tbl.Box.Position.X + 12, LastInfoPos) -- doom#1337
				tbl.Armor.Font = Drawing.Fonts[values.visuals.players.font.Dropdown] -- doom#1337
				tbl.Armor.Outline = Text -- doom#1337
				tbl.Armor.Size = values.visuals.players.size.Slider -- doom#1337
				tbl.Armor.Visible = OnScreen -- doom#1337

				LastInfoPos = LastInfoPos + values.visuals.players.size.Slider -- doom#1337
			else -- doom#1337
				tbl.Armor.Visible = false -- doom#1337
			end -- doom#1337
		else -- doom#1337
			if Player.Name ~= LocalPlayer.Name then -- doom#1337
				Items[Player.Name].Visible = false -- doom#1337
				for i,v in pairs(tbl) do -- doom#1337
					v.Visible = false -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337

	if (values.misc.ui.scaling.Toggle) then -- doom#1337
		gui:SetScale(values.misc.ui.amount.Slider / 10) -- doom#1337
	else -- doom#1337
		gui:SetScale(1) -- doom#1337
	end -- doom#1337
end) -- doom#1337

local mt = getrawmetatable(game) -- doom#1337
local oldNamecall = mt.__namecall -- doom#1337
local oldIndex = mt.__index -- doom#1337
local oldNewIndex = mt.__newindex -- doom#1337
setreadonly(mt,false) -- doom#1337
mt.__namecall = function(self, ...) -- doom#1337
	local method = tostring(getnamecallmethod()) -- doom#1337
	local args = {...} -- doom#1337

	if method == "SetPrimaryPartCFrame" and self.Name == "Arms" then -- doom#1337
		if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active and LocalPlayer.Character then -- doom#1337
			args[1] = args[1] * CF(99, 99, 99) -- doom#1337
		else -- doom#1337
			if values.visuals.self["viewmodel changer"].Toggle then -- doom#1337
				args[1] = args[1] * ViewmodelOffset -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if method == "SetPrimaryPartCFrame" and self.Name ~= "Arms" then -- doom#1337
		args[1] = args[1] + Vec3(0, 3, 0) -- doom#1337
		coroutine.wrap(function() -- doom#1337
			DisableAA = true -- doom#1337
			wait(2) -- doom#1337
			DisableAA = false -- doom#1337
		end)() -- doom#1337
	end -- doom#1337
	if method == "Kick" then -- doom#1337
		return -- doom#1337
	end -- doom#1337
	if method == "FireServer" then -- doom#1337
		if LEN(self.Name) == 38 then -- doom#1337
			return -- doom#1337
		elseif self.Name == "FallDamage" and TBLFIND(values.misc.client["damage bypass"].Jumbobox, "fall") or values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then -- doom#1337
			return -- doom#1337
		elseif self.Name == "BURNME" and TBLFIND(values.misc.client["damage bypass"].Jumbobox, "fire") then -- doom#1337
			return -- doom#1337
		elseif self.Name == "ControlTurn" and not checkcaller() then -- doom#1337
			return -- doom#1337
		end -- doom#1337
		if self.Name == "PlayerChatted" and values.misc.client["chat alive"].Toggle then -- doom#1337
			args[2] = false -- doom#1337
			args[3] = "Innocent" -- doom#1337
			args[4] = false -- doom#1337
			args[5] = false -- doom#1337
		end -- doom#1337
		if self.Name == "ReplicateCamera" and values.misc.client["anti spectate"].Toggle then -- doom#1337
			args[1] = CF() -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if method == "FindPartOnRayWithWhitelist" and not checkcaller() and Client.gun ~= "none" and Client.gun.Name ~= "C4" then -- doom#1337
		if #args[2] == 1 and args[2][1].Name == "SpawnPoints" then -- doom#1337
			local Team = LocalPlayer.Status.Team.Value -- doom#1337

			if TBLFIND(values.misc.client.shop.Jumbobox, "anywhere") then -- doom#1337
				return Team == "T" and args[2][1].BuyArea or args[2][1].BuyArea2 -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then -- doom#1337
		if not checkcaller() or Filter then -- doom#1337
			if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "penetration") then -- doom#1337
				INSERT(args[2], workspace.Map) -- doom#1337
			end -- doom#1337
			if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "spread") then -- doom#1337
				args[1] = RAY(Camera.CFrame.p, Camera.CFrame.LookVector * Client.gun.Range.Value) -- doom#1337
			end -- doom#1337
			local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name)) -- doom#1337
			if values.legit.aimbot["silent aim"].Toggle and values.legit.aimbot["silent aim"].Active and Stats["silent aim"].Toggle then -- doom#1337
				local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris} -- doom#1337
				local Closest = 9999 -- doom#1337
				local Target -- doom#1337

				if not TBLFIND(Stats.conditions.Jumbobox, "smoke") then -- doom#1337
					INSERT(Ignore, workspace.Ray_Ignore) -- doom#1337
				end -- doom#1337

				coroutine.wrap(function() -- doom#1337
					if not TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then -- doom#1337
						if not TBLFIND(Stats.conditions.Jumbobox, "blind") or SelfVelocity.Magnitude < 3 then -- doom#1337
							for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
								if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then -- doom#1337
									if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then -- doom#1337
										if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then -- doom#1337
											local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position) -- doom#1337
											if onScreen then -- doom#1337
												local Magnitude = (Vec2(Pos.X, Pos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
												if Magnitude < Stats["field of view"].Slider then -- doom#1337
													local Hitbox = Stats.priority.Dropdown == "head" and Player.Character.Head or Stats.priority.Dropdown == "chest" and Player.Character.UpperTorso -- doom#1337
													if Stats.priority.Dropdown == "closest" then -- doom#1337
														local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position) -- doom#1337
														local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position) -- doom#1337
														local HeadDistance = (Vec2(HeadPos.X, HeadPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
														local TorsoDistance = (Vec2(TorsoPos.X, TorsoPos.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude -- doom#1337
														if HeadDistance < TorsoDistance then -- doom#1337
															Hitbox = Player.Character.Head -- doom#1337
														else -- doom#1337
															Hitbox = Player.Character.UpperTorso -- doom#1337
														end -- doom#1337
													end -- doom#1337
													if Hitbox ~= nil then -- doom#1337
														if not TBLFIND(Stats.conditions.Jumbobox, "visible") then -- doom#1337
															Target = Hitbox -- doom#1337
														else -- doom#1337
															local Ray1 = RAY(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude) -- doom#1337
															local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true) -- doom#1337
															if Hit and Hit:FindFirstAncestor(Player.Name) then -- doom#1337
																Target = Hitbox -- doom#1337
															end -- doom#1337
														end -- doom#1337
													end -- doom#1337
												end -- doom#1337
											end -- doom#1337
										end -- doom#1337
									end -- doom#1337
								end -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end -- doom#1337

					local Hit = RANDOM(1, 100) <= Stats.hitchance.Slider -- doom#1337
					if Target ~= nil and Hit then -- doom#1337
						args[1] = RAY(Camera.CFrame.Position, (Target.Position - Camera.CFrame.Position).unit * (Target.Position - Camera.CFrame.Position).magnitude) -- doom#1337
					end -- doom#1337
				end)() -- doom#1337
			end -- doom#1337
			if RageTarget ~= nil then -- doom#1337
				local Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.LowerTorso.Position + Vec3(0, 2.5, 0) or Camera.CFrame.p -- doom#1337
				if values.rage.aimbot["delay shot"].Toggle then -- doom#1337
					spawn(function() -- doom#1337
						args[1] = RAY(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude) -- doom#1337
					end) -- doom#1337
				else -- doom#1337
					args[1] = RAY(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude) -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if method == "InvokeServer" then -- doom#1337
		if self.Name == "Moolah" then -- doom#1337
			return -- doom#1337
		elseif self.Name == "Hugh" then -- doom#1337
			return -- doom#1337
		elseif self.Name == "Filter" and values.misc.chat["no filter"].Toggle then -- doom#1337
			return args[1] -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if method == "LoadAnimation" and self.Name == "Humanoid" then -- doom#1337
		if values.rage.others["leg movement"].Dropdown == "slide" then -- doom#1337
			if FIND(args[1].Name, "Walk") or FIND(args[1].Name, "Run") then -- doom#1337
				args[1] = FakeAnim -- doom#1337
			end -- doom#1337
		end -- doom#1337
		if values.rage.others["no animations"].Toggle then -- doom#1337
			args[1] = FakeAnim -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if method == "FireServer" and self.Name == "HitPart" then -- doom#1337
		if values.rage.aimbot["force hit"].Toggle then -- doom#1337
			args[1] = RageTarget -- doom#1337
			args[2] = RageTarget.Position -- doom#1337
		end -- doom#1337
		if (values.rage.aimbot["sex package"].Toggle and RageTarget ~= nil) then -- doom#1337
			coroutine.wrap(function() -- doom#1337
				if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then -- doom#1337
					local hrp = RageTarget.Parent.HumanoidRootPart.Position -- doom#1337
					local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value -- doom#1337

					local vel = (Vec3(hrp.X, 0, hrp.Z) - Vec3(oldHrp.X, 0, oldHrp.Z)) / LastStep -- doom#1337
					local dir = Vec3(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude) -- doom#1337

					 -- doom#1337
					args[2] = args[2] + dir * (Ping / (POW(Ping, 1.5)) * (dir / (dir / 2))) -- doom#1337
					args[4] = 0 -- doom#1337
					args[12] = args[12] - 500 -- doom#1337
				end -- doom#1337
			end)() -- doom#1337
		end -- doom#1337
		 -- doom#1337
		if values.visuals.world["bullet tracers"].Toggle then -- doom#1337
			coroutine.wrap(function() -- doom#1337
				local beam = INST("Part") -- doom#1337
				beam.Anchored = true -- doom#1337
				beam.CanCollide = false -- doom#1337
				beam.Material = Enum.Material.ForceField -- doom#1337
				beam.Color = values.visuals.world["bullet tracers"].Color -- doom#1337
				beam.Size = Vec3(0.1, 0.1, (Camera.CFrame.Position - args[2]).Magnitude) -- doom#1337
				beam.CFrame = CF(Camera.CFrame.Position, args[2]) * CF(0, 0, -beam.Size.Z / 2) -- doom#1337
				beam.Parent = workspace.Debris -- doom#1337
				library:Tween(beam, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}) -- doom#1337
				wait(1.5) -- doom#1337
				beam:Destroy() -- doom#1337
			end)() -- doom#1337
		end -- doom#1337
		if values.visuals.world["impacts"].Toggle then -- doom#1337
			coroutine.wrap(function() -- doom#1337
				local hit = INST("Part") -- doom#1337
				hit.Transparency = 1 -- doom#1337
				hit.Anchored = true -- doom#1337
				hit.CanCollide = false -- doom#1337
				hit.Size = Vec3(0.3,0.3,0.3) -- doom#1337
				hit.Position = args[2] -- doom#1337
				local selection = INST("SelectionBox") -- doom#1337
				selection.LineThickness = 0 -- doom#1337
				selection.SurfaceTransparency = 0.5 -- doom#1337
				selection.Color3 = values.visuals.world["impacts"].Color -- doom#1337
				selection.SurfaceColor3 = values.visuals.world["impacts"].Color -- doom#1337
				selection.Parent = hit -- doom#1337
				selection.Adornee = hit -- doom#1337
				hit.Parent = workspace.Debris -- doom#1337
				wait(5.9) -- doom#1337
				library:Tween(selection, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {SurfaceTransparency = 1}) -- doom#1337
				hit:Destroy() -- doom#1337
			end)() -- doom#1337
			if values.visuals.world["hit chams"].Toggle then -- doom#1337
				coroutine.wrap(function() -- doom#1337
					if Players:GetPlayerFromCharacter(args[1].Parent) and Players:GetPlayerFromCharacter(args[1].Parent).Team ~= LocalPlayer.Team then -- doom#1337
						for _,hitbox in pairs(args[1].Parent:GetChildren()) do -- doom#1337
							if hitbox:IsA("BasePart") or hitbox.Name == "Head" then -- doom#1337
								coroutine.wrap(function() -- doom#1337
									local part = INST("Part") -- doom#1337
									part.CFrame = hitbox.CFrame -- doom#1337
									part.Anchored = true -- doom#1337
									part.CanCollide = false -- doom#1337
									part.Material = Enum.Material.ForceField -- doom#1337
									part.Color = values.visuals.world["hit chams"].Color -- doom#1337
									part.Size = hitbox.Size -- doom#1337
									part.Parent = workspace.Debris -- doom#1337
									library:Tween(part, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}) -- doom#1337
									wait(2) -- doom#1337
									part:Destroy() -- doom#1337
								end)() -- doom#1337
							end -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end)() -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337

	return oldNamecall(self, unpack(args)) -- doom#1337
end -- doom#1337
mt.__index = function(self, key) -- doom#1337
	local CallingScript = getcallingscript() -- doom#1337

	if not checkcaller() and self == Viewmodels and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("UpperTorso") then -- doom#1337
		local WeaponName = GSUB(key, "v_", "") -- doom#1337
		if not FIND(WeaponName, "Arms") then -- doom#1337
			if Weapons[WeaponName]:FindFirstChild("Melee") and values.skins.knife["knife changer"].Toggle then -- doom#1337
				if Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll) then -- doom#1337
					return Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll) -- doom#1337
				else -- doom#1337
					local Clone = Models.Knives[values.skins.knife.model.Scroll]:Clone() -- doom#1337
					return Clone -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if key == "Value" then -- doom#1337
		if self.Name == "Auto" and TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "automatic") then -- doom#1337
			return true -- doom#1337
		elseif self.Name == "ReloadTime" and TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "reload") then -- doom#1337
			return 0.001 -- doom#1337
		elseif self.Name == "EquipTime" and TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "equip") then -- doom#1337
			return 0.001 -- doom#1337
		elseif self.Name == "BuyTime" and TBLFIND(values.misc.client.shop.Jumbobox, "inf time") then -- doom#1337
			return 5 -- doom#1337
		end -- doom#1337
	end -- doom#1337

	return oldIndex(self, key) -- doom#1337
end -- doom#1337

local perf__ = LocalPlayer.PlayerGui.Performance.Perf -- doom#1337

mt.__newindex = function(self, i, v) -- doom#1337
	if self:IsA("Humanoid") and i == "JumpPower" and not checkcaller() then -- doom#1337
		if values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then -- doom#1337
			v = 24 -- doom#1337
		end -- doom#1337
		if values.misc.movement["edge bug"].Toggle and values.misc.movement["edge bug"].Active then -- doom#1337
			v = 0 -- doom#1337
		end -- doom#1337
	elseif self:IsA("Humanoid") and i == "CameraOffset" then -- doom#1337
		if values.rage.angles.enabled.Toggle and values.rage.angles["body roll"].Dropdown == "180" and not DisableAA then -- doom#1337
			v = v + Vec3(0, -3.5, 0) -- doom#1337
		end -- doom#1337
	end -- doom#1337

	return oldNewIndex(self, i, v) -- doom#1337
end -- doom#1337
Crosshairs.Scope:GetPropertyChangedSignal("Visible"):Connect(function(current) -- doom#1337
	if not TBLFIND(values.visuals.effects.removals.Jumbobox, "scope lines") then return end -- doom#1337

	if current ~= false then -- doom#1337
		Crosshairs.Scope.Visible = false -- doom#1337
	end -- doom#1337
end) -- doom#1337
Crosshair:GetPropertyChangedSignal("Visible"):Connect(function(current) -- doom#1337
	if not LocalPlayer.Character then return end -- doom#1337
	if not values.visuals.effects["force crosshair"].Toggle then return end -- doom#1337
	if LocalPlayer.Character:FindFirstChild("AIMING") then return end -- doom#1337

	Crosshair.Visible = true -- doom#1337
end) -- doom#1337

LocalPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(current) -- doom#1337
	if current == 0 then return end -- doom#1337
	coroutine.wrap(function() -- doom#1337
		if values.misc.client.hitmarker.Toggle then -- doom#1337
			local Line = Drawing.new("Line") -- doom#1337
			local Line2 = Drawing.new("Line") -- doom#1337
			local Line3 = Drawing.new("Line") -- doom#1337
			local Line4 = Drawing.new("Line") -- doom#1337

			local x, y = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 -- doom#1337

			Line.From = Vec2(x + 4, y + 4) -- doom#1337
			Line.To = Vec2(x + 10, y + 10) -- doom#1337
			Line.Color = values.misc.client.hitmarker.Color -- doom#1337
			Line.Visible = true  -- doom#1337

			Line2.From = Vec2(x + 4, y - 4) -- doom#1337
			Line2.To = Vec2(x + 10, y - 10) -- doom#1337
			Line2.Color = values.misc.client.hitmarker.Color -- doom#1337
			Line2.Visible = true  -- doom#1337

			Line3.From = Vec2(x - 4, y - 4) -- doom#1337
			Line3.To = Vec2(x - 10, y - 10) -- doom#1337
			Line3.Color = values.misc.client.hitmarker.Color -- doom#1337
			Line3.Visible = true  -- doom#1337

			Line4.From = Vec2(x - 4, y + 4) -- doom#1337
			Line4.To = Vec2(x - 10, y + 10) -- doom#1337
			Line4.Color = values.misc.client.hitmarker.Color -- doom#1337
			Line4.Visible = true -- doom#1337

			Line.Transparency = 1 -- doom#1337
			Line2.Transparency = 1 -- doom#1337
			Line3.Transparency = 1 -- doom#1337
			Line4.Transparency = 1 -- doom#1337

			Line.Thickness = 1 -- doom#1337
			Line2.Thickness = 1 -- doom#1337
			Line3.Thickness = 1 -- doom#1337
			Line4.Thickness = 1 -- doom#1337

			wait(0.3) -- doom#1337
			for i = 1,0,-0.1 do -- doom#1337
				wait() -- doom#1337
				Line.Transparency = i  -- doom#1337
				Line2.Transparency = i -- doom#1337
				Line3.Transparency = i -- doom#1337
				Line4.Transparency = i -- doom#1337
			end -- doom#1337
			Line:Remove() -- doom#1337
			Line2:Remove() -- doom#1337
			Line3:Remove() -- doom#1337
			Line4:Remove() -- doom#1337
		end -- doom#1337
	end)() -- doom#1337
	if values.visuals.world.hitsound.Dropdown == "none" then return end -- doom#1337

	local sound = INST("Sound") -- doom#1337
	sound.Parent = game:GetService("SoundService") -- doom#1337
	sound.SoundId = values.visuals.world.hitsound.Dropdown == "skeet" and "rbxassetid://5447626464" or values.visuals.world.hitsound.Dropdown == "rust" and "rbxassetid://5043539486" or values.visuals.world.hitsound.Dropdown == "bag" and "rbxassetid://364942410" or values.visuals.world.hitsound.Dropdown == "baimware" and "rbxassetid://6607339542" or "rbxassetid://6607204501" -- doom#1337
	sound.Volume = values.visuals.world["sound volume"].Slider -- doom#1337
	sound.PlayOnRemove = true -- doom#1337
	sound:Destroy() -- doom#1337
end) -- doom#1337
LocalPlayer.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function(current) -- doom#1337
	if current == 0 then return end -- doom#1337
	if values.misc.chat["kill say"].Toggle then -- doom#1337
		game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(values.misc.chat["message"].Text ~= "" and values.misc.chat["message"].Text or "looks like you don't have stormy.solutions", false, "Innocent", false, true) -- doom#1337
	end -- doom#1337
end) -- doom#1337
RayIgnore.ChildAdded:Connect(function(obj) -- doom#1337
	if obj.Name == "Fires" then -- doom#1337
		obj.ChildAdded:Connect(function(fire) -- doom#1337
			if values.visuals.world["molly radius"].Toggle then -- doom#1337
				fire.Transparency = values.visuals.world["molly radius"].Transparency -- doom#1337
				fire.Color = values.visuals.world["molly radius"].Color -- doom#1337
			end -- doom#1337
		end) -- doom#1337
	end -- doom#1337
	if obj.Name == "Smokes" then -- doom#1337
		obj.ChildAdded:Connect(function(smoke) -- doom#1337
			RunService.RenderStepped:Wait() -- doom#1337
			local OriginalRate = INST("NumberValue") -- doom#1337
			OriginalRate.Value = smoke.ParticleEmitter.Rate -- doom#1337
			OriginalRate.Name = "OriginalRate" -- doom#1337
			OriginalRate.Parent = smoke -- doom#1337
			if TBLFIND(values.visuals.effects.removals.Jumbobox, "smokes") then -- doom#1337
				smoke.ParticleEmitter.Rate = 0 -- doom#1337
			end -- doom#1337
			smoke.Material = Enum.Material.ForceField -- doom#1337
			if values.visuals.world["smoke radius"].Toggle then -- doom#1337
				smoke.Transparency = 0 -- doom#1337
				smoke.Color = values.visuals.world["smoke radius"].Color -- doom#1337
			end -- doom#1337
		end) -- doom#1337
	end -- doom#1337
end) -- doom#1337
if RayIgnore:FindFirstChild("Fires") then -- doom#1337
	RayIgnore:FindFirstChild("Fires").ChildAdded:Connect(function(fire) -- doom#1337
		if values.visuals.world["molly radius"].Toggle then -- doom#1337
			fire.Transparency = values.visuals.world["molly radius"].Transparency -- doom#1337
			fire.Color = values.visuals.world["molly radius"].Color -- doom#1337
		end -- doom#1337
	end) -- doom#1337
end -- doom#1337
if RayIgnore:FindFirstChild("Smokes") then -- doom#1337
	for _,smoke in pairs(RayIgnore:FindFirstChild("Smokes"):GetChildren()) do -- doom#1337
		local OriginalRate = INST("NumberValue") -- doom#1337
		OriginalRate.Value = smoke.ParticleEmitter.Rate -- doom#1337
		OriginalRate.Name = "OriginalRate" -- doom#1337
		OriginalRate.Parent = smoke -- doom#1337
		smoke.Material = Enum.Material.ForceField -- doom#1337
	end -- doom#1337
	RayIgnore:FindFirstChild("Smokes").ChildAdded:Connect(function(smoke) -- doom#1337
		RunService.RenderStepped:Wait() -- doom#1337
		local OriginalRate = INST("NumberValue") -- doom#1337
		OriginalRate.Value = smoke.ParticleEmitter.Rate -- doom#1337
		OriginalRate.Name = "OriginalRate" -- doom#1337
		OriginalRate.Parent = smoke -- doom#1337
		if TBLFIND(values.visuals.effects.removals.Jumbobox, "smokes") then -- doom#1337
			smoke.ParticleEmitter.Rate = 0 -- doom#1337
		end -- doom#1337
		smoke.Material = Enum.Material.ForceField -- doom#1337
		if values.visuals.world["smoke radius"].Toggle then -- doom#1337
			smoke.Transparency = 0 -- doom#1337
			smoke.Color = values.visuals.world["smoke radius"].Color -- doom#1337
		end -- doom#1337
	end) -- doom#1337
end -- doom#1337
Camera.ChildAdded:Connect(function(obj) -- doom#1337
	if TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "ammo") then -- doom#1337
		Client.ammocount = 999999 -- doom#1337
		Client.primarystored = 999999 -- doom#1337
		Client.ammocount2 = 999999 -- doom#1337
		Client.secondarystored = 999999 -- doom#1337
	end -- doom#1337
	RunService.RenderStepped:Wait() -- doom#1337
	if obj.Name ~= "Arms" then return end -- doom#1337
	local Model -- doom#1337
	for i,v in pairs(obj:GetChildren()) do -- doom#1337
		if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then -- doom#1337
			Model = v -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if Model == nil then return end -- doom#1337
	for i,v in pairs(obj:GetChildren()) do -- doom#1337
		if (v:IsA("BasePart") or v:IsA("Part")) and v.Transparency ~= 1 and v.Name ~= "Flash" then -- doom#1337
			local valid = true -- doom#1337
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then -- doom#1337
				valid = false -- doom#1337
				local success, err = pcall(function() -- doom#1337
					local OriginalTexture = INST("StringValue") -- doom#1337
					OriginalTexture.Value = v.Mesh.TextureId -- doom#1337
					OriginalTexture.Name = "OriginalTexture" -- doom#1337
					OriginalTexture.Parent = v.Mesh -- doom#1337
				end) -- doom#1337
				local success2, err2 = pcall(function() -- doom#1337
					local OriginalTexture = INST("StringValue") -- doom#1337
					OriginalTexture.Value = v.Mesh.TextureID -- doom#1337
					OriginalTexture.Name = "OriginalTexture" -- doom#1337
					OriginalTexture.Parent = v.Mesh -- doom#1337
				end) -- doom#1337
				if success or success2 then valid = true end -- doom#1337
			end -- doom#1337

			for i2,v2 in pairs(v:GetChildren()) do -- doom#1337
				if (v2:IsA("BasePart") or v2:IsA("Part")) then -- doom#1337
					INSERT(WeaponObj, v2) -- doom#1337
				end -- doom#1337
			end -- doom#1337

			if valid then -- doom#1337
				INSERT(WeaponObj, v) -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337

	local gunname = Client.gun ~= "none" and values.skins.knife["knife changer"].Toggle and Client.gun:FindFirstChild("Melee") and values.skins.knife.model.Scroll or Client.gun ~= "none" and Client.gun.Name -- doom#1337
	if values.skins.skins["skin changer"].Toggle and gunname ~= nil and Skins:FindFirstChild(gunname) then -- doom#1337
		if values.skins.skins.skin.Scroll[gunname] ~= "Inventory" then -- doom#1337
			MapSkin(gunname, values.skins.skins.skin.Scroll[gunname]) -- doom#1337
		end -- doom#1337
	end -- doom#1337
	for _,v in pairs(WeaponObj) do -- doom#1337
		if v:IsA("MeshPart") then -- doom#1337
			local OriginalTexture = INST("StringValue") -- doom#1337
			OriginalTexture.Value = v.TextureID -- doom#1337
			OriginalTexture.Name = "OriginalTexture" -- doom#1337
			OriginalTexture.Parent = v -- doom#1337
		end -- doom#1337

		local OriginalColor = INST("Color3Value") -- doom#1337
		OriginalColor.Value = v.Color -- doom#1337
		OriginalColor.Name = "OriginalColor" -- doom#1337
		OriginalColor.Parent = v -- doom#1337

		local OriginalMaterial = INST("StringValue") -- doom#1337
		OriginalMaterial.Value = v.Material.Name -- doom#1337
		OriginalMaterial.Name = "OriginalMaterial" -- doom#1337
		OriginalMaterial.Parent = v -- doom#1337

		if values.visuals.effects["weapon chams"].Toggle then -- doom#1337
			UpdateWeapon(v) -- doom#1337
		end -- doom#1337
	end -- doom#1337
	RArm = Model:FindFirstChild("Right Arm"); LArm = Model:FindFirstChild("Left Arm") -- doom#1337
	if RArm then -- doom#1337
		local OriginalColor = INST("Color3Value") -- doom#1337
		OriginalColor.Value = RArm.Color -- doom#1337
		OriginalColor.Name = "Color3Value" -- doom#1337
		OriginalColor.Parent = RArm -- doom#1337
		if values.visuals.effects["arm chams"].Toggle then -- doom#1337
			RArm.Color = values.visuals.effects["arm chams"].Color -- doom#1337
			RArm.Transparency = values.visuals.effects["arm chams"].Transparency -- doom#1337
		end -- doom#1337
		RGlove = RArm:FindFirstChild("Glove") or RArm:FindFirstChild("RGlove") -- doom#1337
		if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then -- doom#1337
			if RGlove then RGlove:Destroy() end -- doom#1337
			RGlove = GloveModels[values.skins.glove.model.Dropdown].RGlove:Clone() -- doom#1337
			RGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId -- doom#1337
			RGlove.Parent = RArm -- doom#1337
			RGlove.Transparency = 0 -- doom#1337
			RGlove.Welded.Part0 = RArm -- doom#1337
		end -- doom#1337
		if RGlove.Transparency == 1 then -- doom#1337
			RGlove:Destroy() -- doom#1337
			RGlove = nil -- doom#1337
		else -- doom#1337
			local GloveTexture = INST("StringValue") -- doom#1337
			GloveTexture.Value = RGlove.Mesh.TextureId -- doom#1337
			GloveTexture.Name = "StringValue" -- doom#1337
			GloveTexture.Parent = RGlove -- doom#1337

			if values.visuals.effects["accessory chams"].Toggle then -- doom#1337
				UpdateAccessory(RGlove) -- doom#1337
			end -- doom#1337
		end -- doom#1337
		RSleeve = RArm:FindFirstChild("Sleeve") -- doom#1337
		if RSleeve ~= nil then -- doom#1337
			local SleeveTexture = INST("StringValue") -- doom#1337
			SleeveTexture.Value = RSleeve.Mesh.TextureId -- doom#1337
			SleeveTexture.Name = "StringValue" -- doom#1337
			SleeveTexture.Parent = RSleeve -- doom#1337
			if values.visuals.effects["arm chams"].Toggle then -- doom#1337
				LArm.Color = values.visuals.effects["arm chams"].Color -- doom#1337
			end -- doom#1337
			if values.visuals.effects["accessory chams"].Toggle then -- doom#1337
				UpdateAccessory(RSleeve) -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if LArm then -- doom#1337
		local OriginalColor = INST("Color3Value") -- doom#1337
		OriginalColor.Value = LArm.Color -- doom#1337
		OriginalColor.Name = "Color3Value" -- doom#1337
		OriginalColor.Parent = LArm -- doom#1337
		if values.visuals.effects["arm chams"].Toggle then -- doom#1337
			LArm.Color = values.visuals.effects["arm chams"].Color -- doom#1337
			LArm.Transparency = values.visuals.effects["arm chams"].Transparency -- doom#1337
		end -- doom#1337
		LGlove = LArm:FindFirstChild("Glove") or LArm:FindFirstChild("LGlove") -- doom#1337
		if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then -- doom#1337
			if LGlove then LGlove:Destroy() end -- doom#1337
			LGlove = GloveModels[values.skins.glove.model.Dropdown].LGlove:Clone() -- doom#1337
			LGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId -- doom#1337
			LGlove.Transparency = 0 -- doom#1337
			LGlove.Parent = LArm -- doom#1337
			LGlove.Welded.Part0 = LArm -- doom#1337
		end -- doom#1337
		if LGlove.Transparency == 1 then -- doom#1337
			LGlove:Destroy() -- doom#1337
			LGlove =  nil -- doom#1337
		else -- doom#1337
			local GloveTexture = INST("StringValue") -- doom#1337
			GloveTexture.Value = LGlove.Mesh.TextureId -- doom#1337
			GloveTexture.Name = "StringValue" -- doom#1337
			GloveTexture.Parent = LGlove -- doom#1337

			if values.visuals.effects["accessory chams"].Toggle then -- doom#1337
				UpdateAccessory(LGlove) -- doom#1337
			end -- doom#1337
		end -- doom#1337
		LSleeve = LArm:FindFirstChild("Sleeve") -- doom#1337
		if LSleeve ~= nil then -- doom#1337
			local SleeveTexture = INST("StringValue") -- doom#1337
			SleeveTexture.Value = LSleeve.Mesh.TextureId -- doom#1337
			SleeveTexture.Name = "StringValue" -- doom#1337
			SleeveTexture.Parent = LSleeve -- doom#1337

			if values.visuals.effects["accessory chams"].Toggle then -- doom#1337
				UpdateAccessory(LSleeve) -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
Camera.ChildAdded:Connect(function(obj) -- doom#1337
	if obj.Name == "Arms" then -- doom#1337
		RArm, LArm, RGlove, RSleeve, LGlove, LSleeve = nil, nil, nil, nil, nil, nil -- doom#1337
		WeaponObj = {} -- doom#1337
	end -- doom#1337
end) -- doom#1337
Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function(fov) -- doom#1337
	if LocalPlayer.Character == nil then return end -- doom#1337
	if fov == values.visuals.self["fov changer"].Slider then return end -- doom#1337
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then -- doom#1337
		Camera.FieldOfView = values.visuals.self["fov changer"].Slider -- doom#1337
	end -- doom#1337
end) -- doom#1337
LocalPlayer.Cash:GetPropertyChangedSignal("Value"):Connect(function(cash) -- doom#1337
	if values.misc.client["infinite cash"].Toggle and cash ~= 8000 then -- doom#1337
		LocalPlayer.Cash.Value = 8000 -- doom#1337
	end -- doom#1337
end) -- doom#1337
if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Origin") then -- doom#1337
	if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then -- doom#1337
		oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() -- doom#1337
	end -- doom#1337
end -- doom#1337
workspace.ChildAdded:Connect(function(obj) -- doom#1337
	if obj.Name == "Map" then -- doom#1337
		wait(5) -- doom#1337
		if values.misc.client["remove killers"].Toggle then -- doom#1337
			if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then -- doom#1337
				local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone() -- doom#1337
				clone.Name = "KillersClone" -- doom#1337
				clone.Parent = workspace:FindFirstChild("Map") -- doom#1337

				workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy() -- doom#1337
			end -- doom#1337
		end -- doom#1337
		if oldSkybox ~= nil then -- doom#1337
			oldSkybox:Destroy() -- doom#1337
			oldSkybox = nil -- doom#1337
		end -- doom#1337
		local Origin = workspace.Map:WaitForChild("Origin") -- doom#1337
		if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then -- doom#1337
			oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() -- doom#1337

			local sky = values.visuals.world.skybox.Dropdown -- doom#1337
			if sky ~= "none" then -- doom#1337
				Lighting:FindFirstChildOfClass("Sky"):Destroy() -- doom#1337
				local skybox = INST("Sky") -- doom#1337
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf -- doom#1337
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk -- doom#1337
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn -- doom#1337
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt -- doom#1337
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt -- doom#1337
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp -- doom#1337
				skybox.Name = "override" -- doom#1337
				skybox.Parent = Lighting -- doom#1337
			end -- doom#1337
		else -- doom#1337
			local sky = values.visuals.world.skybox.Dropdown -- doom#1337
			if sky ~= "none" then -- doom#1337
				local skybox = INST("Sky") -- doom#1337
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf -- doom#1337
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk -- doom#1337
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn -- doom#1337
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt -- doom#1337
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt -- doom#1337
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp -- doom#1337
				skybox.Name = "override" -- doom#1337
				skybox.Parent = Lighting -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end) -- doom#1337
Lighting.ChildAdded:Connect(function(obj) -- doom#1337
	if obj:IsA("Sky") and obj.Name ~= "override" then -- doom#1337
		oldSkybox = obj:Clone() -- doom#1337
	end -- doom#1337
end) -- doom#1337

local function CollisionTBL(obj) -- doom#1337
	if obj:IsA("Accessory") then -- doom#1337
		INSERT(Collision, obj) -- doom#1337
	end -- doom#1337
	if obj:IsA("Part") then -- doom#1337
		if obj.Name == "HeadHB" or obj.Name == "FakeHead" then -- doom#1337
			INSERT(Collision, obj) -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
LocalPlayer.CharacterAdded:Connect(function(char) -- doom#1337
	repeat RunService.RenderStepped:Wait() -- doom#1337
	until char:FindFirstChild("Gun") -- doom#1337
	SelfObj = {} -- doom#1337
	if values.skins.characters["character changer"].Toggle then -- doom#1337
		ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll)) -- doom#1337
	end -- doom#1337
	if char:FindFirstChildOfClass("Shirt") then -- doom#1337
		local String = INST("StringValue") -- doom#1337
		String.Name = "OriginalTexture" -- doom#1337
		String.Value = char:FindFirstChildOfClass("Shirt").ShirtTemplate -- doom#1337
		String.Parent = char:FindFirstChildOfClass("Shirt") -- doom#1337

		if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then -- doom#1337
			char:FindFirstChildOfClass("Shirt").ShirtTemplate = "" -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if char:FindFirstChildOfClass("Pants") then -- doom#1337
		local String = INST("StringValue") -- doom#1337
		String.Name = "OriginalTexture" -- doom#1337
		String.Value = char:FindFirstChildOfClass("Pants").PantsTemplate -- doom#1337
		String.Parent = char:FindFirstChildOfClass("Pants") -- doom#1337

		if TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then -- doom#1337
			char:FindFirstChildOfClass("Pants").PantsTemplate = "" -- doom#1337
		end -- doom#1337
	end -- doom#1337
	for i,v in pairs(char:GetChildren()) do -- doom#1337
		if v:IsA("BasePart") and v.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, v) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = v.Color -- doom#1337
			Color.Parent = v -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = v.Material.Name -- doom#1337
			String.Parent = v -- doom#1337
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, v.Handle) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = v.Handle.Color -- doom#1337
			Color.Parent = v.Handle -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = v.Handle.Material.Name -- doom#1337
			String.Parent = v.Handle -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if values.visuals.self["self chams"].Toggle then -- doom#1337
		for _,obj in pairs(SelfObj) do -- doom#1337
			if obj.Parent ~= nil then -- doom#1337
				obj.Material = Enum.Material.ForceField -- doom#1337
				obj.Color = values.visuals.self["self chams"].Color -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	LocalPlayer.Character.ChildAdded:Connect(function(Child) -- doom#1337
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, Child.Handle) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = Child.Handle.Color -- doom#1337
			Color.Parent = Child.Handle -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = Child.Handle.Material.Name -- doom#1337
			String.Parent = Child.Handle -- doom#1337

			if values.visuals.self["self chams"].Toggle then -- doom#1337
				for _,obj in pairs(SelfObj) do -- doom#1337
					if obj.Parent ~= nil then -- doom#1337
						obj.Material = Enum.Material.ForceField -- doom#1337
						obj.Color = values.visuals.self["self chams"].Color -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end) -- doom#1337

	if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then -- doom#1337
		LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) -- doom#1337
		LoadedAnim.Priority = Enum.AnimationPriority.Action -- doom#1337
		LoadedAnim:Play() -- doom#1337
	end -- doom#1337
end) -- doom#1337
if LocalPlayer.Character ~= nil then -- doom#1337
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do -- doom#1337
		if v:IsA("BasePart") and v.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, v) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = v.Color -- doom#1337
			Color.Parent = v -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = v.Material.Name -- doom#1337
			String.Parent = v -- doom#1337
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, v.Handle) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = v.Handle.Color -- doom#1337
			Color.Parent = v.Handle -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = v.Handle.Material.Name -- doom#1337
			String.Parent = v.Handle -- doom#1337
		end -- doom#1337
	end -- doom#1337
	if values.visuals.self["self chams"].Toggle then -- doom#1337
		for _,obj in pairs(SelfObj) do -- doom#1337
			if obj.Parent ~= nil then -- doom#1337
				obj.Material = Enum.Material.ForceField -- doom#1337
				obj.Color = values.visuals.self["self chams"].Color -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
	LocalPlayer.Character.ChildAdded:Connect(function(Child) -- doom#1337
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then -- doom#1337
			INSERT(SelfObj, Child.Handle) -- doom#1337
			local Color = INST("Color3Value") -- doom#1337
			Color.Name = "OriginalColor" -- doom#1337
			Color.Value = Child.Handle.Color -- doom#1337
			Color.Parent = Child.Handle -- doom#1337

			local String = INST("StringValue") -- doom#1337
			String.Name = "OriginalMaterial" -- doom#1337
			String.Value = Child.Handle.Material.Name -- doom#1337
			String.Parent = Child.Handle -- doom#1337

			if values.visuals.self["self chams"].Toggle then -- doom#1337
				for _,obj in pairs(SelfObj) do -- doom#1337
					if obj.Parent ~= nil then -- doom#1337
						obj.Material = Enum.Material.ForceField -- doom#1337
						obj.Color = values.visuals.self["self chams"].Color -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end) -- doom#1337
end -- doom#1337
Players.PlayerAdded:Connect(function(Player) -- doom#1337
	Player:GetPropertyChangedSignal("Team"):Connect(function(new) -- doom#1337
		wait() -- doom#1337
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then -- doom#1337
			for _2,Obj in pairs(Player.Character:GetDescendants()) do -- doom#1337
				if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then -- doom#1337
					if values.visuals.players.chams.Toggle then -- doom#1337
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
							Obj.Visible = true -- doom#1337
						else -- doom#1337
							Obj.Visible = false -- doom#1337
						end -- doom#1337
					else -- doom#1337
						Obj.Visible = false -- doom#1337
					end -- doom#1337
					Obj.Color3 = values.visuals.players.chams.Color -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end) -- doom#1337
	Player.CharacterAdded:Connect(function(Character) -- doom#1337
		Character.ChildAdded:Connect(function(obj) -- doom#1337
			wait(1) -- doom#1337
			CollisionTBL(obj) -- doom#1337
		end) -- doom#1337
		wait(1) -- doom#1337
		if Character ~= nil then -- doom#1337
			local Value = INST("Vector3Value") -- doom#1337
			Value.Name = "OldPosition" -- doom#1337
			Value.Value = Character.HumanoidRootPart.Position -- doom#1337
			Value.Parent = Character.HumanoidRootPart -- doom#1337
			for _,obj in pairs(Character:GetChildren()) do -- doom#1337
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then -- doom#1337
					local VisibleCham = INST("BoxHandleAdornment") -- doom#1337
					VisibleCham.Name = "VisibleCham" -- doom#1337
					VisibleCham.AlwaysOnTop = false -- doom#1337
					VisibleCham.ZIndex = 8 -- doom#1337
					VisibleCham.Size = obj.Size + Vec3(0.1,0.1,0.1) -- doom#1337
					VisibleCham.AlwaysOnTop = false -- doom#1337
					VisibleCham.Transparency = 0 -- doom#1337

					local WallCham = INST("BoxHandleAdornment") -- doom#1337
					WallCham.Name = "WallCham" -- doom#1337
					WallCham.AlwaysOnTop = true -- doom#1337
					WallCham.ZIndex = 5 -- doom#1337
					WallCham.Size = obj.Size + Vec3(0.1,0.1,0.1) -- doom#1337
					WallCham.AlwaysOnTop = true -- doom#1337
					WallCham.Transparency = 0.7 -- doom#1337

					if values.visuals.players.chams.Toggle then -- doom#1337
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
							VisibleCham.Visible = true -- doom#1337
							WallCham.Visible = true -- doom#1337
						else -- doom#1337
							VisibleCham.Visible = false -- doom#1337
							WallCham.Visible = false -- doom#1337
						end -- doom#1337
					else -- doom#1337
						VisibleCham.Visible = false -- doom#1337
						WallCham.Visible = false -- doom#1337
					end -- doom#1337

					INSERT(ChamItems, VisibleCham) -- doom#1337
					INSERT(ChamItems, WallCham) -- doom#1337

					VisibleCham.Color3 = values.visuals.players.chams.Color -- doom#1337
					WallCham.Color3 = values.visuals.players.chams.Color -- doom#1337

					VisibleCham.AdornCullingMode = "Never" -- doom#1337
					WallCham.AdornCullingMode = "Never" -- doom#1337

					VisibleCham.Adornee = obj -- doom#1337
					VisibleCham.Parent = obj -- doom#1337

					WallCham.Adornee = obj -- doom#1337
					WallCham.Parent = obj -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end) -- doom#1337
end) -- doom#1337
for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
	if Player ~= LocalPlayer then -- doom#1337
		Player:GetPropertyChangedSignal("Team"):Connect(function(new) -- doom#1337
			wait() -- doom#1337
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then -- doom#1337
				for _2,Obj in pairs(Player.Character:GetDescendants()) do -- doom#1337
					if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then -- doom#1337
						if values.visuals.players.chams.Toggle then -- doom#1337
							if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
								Obj.Visible = true -- doom#1337
							else -- doom#1337
								Obj.Visible = false -- doom#1337
							end -- doom#1337
						else -- doom#1337
							Obj.Visible = false -- doom#1337
						end -- doom#1337
						Obj.Color3 = values.visuals.players.chams.Color -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end) -- doom#1337
	else -- doom#1337
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new) -- doom#1337
			wait() -- doom#1337
			for _,Player in pairs(Players:GetPlayers()) do -- doom#1337
				if Player.Character then -- doom#1337
					for _2,Obj in pairs(Player.Character:GetDescendants()) do -- doom#1337
						if Obj.Name == "VisibleCham" or Obj.Name == "WallCham" then -- doom#1337
							if values.visuals.players.chams.Toggle then -- doom#1337
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
									Obj.Visible = true -- doom#1337
								else -- doom#1337
									Obj.Visible = false -- doom#1337
								end -- doom#1337
							else -- doom#1337
								Obj.Visible = false -- doom#1337
							end -- doom#1337
							Obj.Color3 = values.visuals.players.chams.Color -- doom#1337
						end -- doom#1337
					end -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end) -- doom#1337
	end -- doom#1337
	Player.CharacterAdded:Connect(function(Character) -- doom#1337
		Character.ChildAdded:Connect(function(obj) -- doom#1337
			wait(1) -- doom#1337
			CollisionTBL(obj) -- doom#1337
		end) -- doom#1337
		wait(1) -- doom#1337
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then -- doom#1337
			local Value = INST("Vector3Value") -- doom#1337
			Value.Value = Player.Character.HumanoidRootPart.Position -- doom#1337
			Value.Name = "OldPosition" -- doom#1337
			Value.Parent = Player.Character.HumanoidRootPart -- doom#1337
			for _,obj in pairs(Player.Character:GetChildren()) do -- doom#1337
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then -- doom#1337
					local VisibleCham = INST("BoxHandleAdornment") -- doom#1337
					VisibleCham.Name = "VisibleCham" -- doom#1337
					VisibleCham.AlwaysOnTop = false -- doom#1337
					VisibleCham.ZIndex = 5 -- doom#1337
					VisibleCham.Size = obj.Size + Vec3(0.1,0.1,0.1) -- doom#1337
					VisibleCham.AlwaysOnTop = false -- doom#1337
					VisibleCham.Transparency = 0 -- doom#1337

					local WallCham = INST("BoxHandleAdornment") -- doom#1337
					WallCham.Name = "WallCham" -- doom#1337
					WallCham.AlwaysOnTop = true -- doom#1337
					WallCham.ZIndex = 5 -- doom#1337
					WallCham.Size = obj.Size + Vec3(0.1,0.1,0.1) -- doom#1337
					WallCham.AlwaysOnTop = true -- doom#1337
					WallCham.Transparency = 0.7 -- doom#1337

					if values.visuals.players.chams.Toggle then -- doom#1337
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
							VisibleCham.Visible = true -- doom#1337
							WallCham.Visible = true -- doom#1337
						else -- doom#1337
							VisibleCham.Visible = false -- doom#1337
							WallCham.Visible = false -- doom#1337
						end -- doom#1337
					else -- doom#1337
						VisibleCham.Visible = false -- doom#1337
						WallCham.Visible = false -- doom#1337
					end -- doom#1337

					INSERT(ChamItems, VisibleCham) -- doom#1337
					INSERT(ChamItems, WallCham) -- doom#1337

					VisibleCham.Color3 = values.visuals.players.chams.Color -- doom#1337
					WallCham.Color3 = values.visuals.players.chams.Color -- doom#1337

					VisibleCham.AdornCullingMode = "Never" -- doom#1337
					WallCham.AdornCullingMode = "Never" -- doom#1337

					VisibleCham.Adornee = obj -- doom#1337
					VisibleCham.Parent = obj -- doom#1337

					WallCham.Adornee = obj -- doom#1337
					WallCham.Parent = obj -- doom#1337
				end -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end) -- doom#1337
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then -- doom#1337
		local Value = INST("Vector3Value") -- doom#1337
		Value.Name = "OldPosition" -- doom#1337
		Value.Value = Player.Character.HumanoidRootPart.Position -- doom#1337
		Value.Parent = Player.Character.HumanoidRootPart -- doom#1337
		for _,obj in pairs(Player.Character:GetChildren()) do -- doom#1337
			CollisionTBL(obj) -- doom#1337
			if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then -- doom#1337
				local VisibleCham = INST("BoxHandleAdornment") -- doom#1337
				VisibleCham.Name = "VisibleCham" -- doom#1337
				VisibleCham.AlwaysOnTop = false -- doom#1337
				VisibleCham.ZIndex = 5 -- doom#1337
				VisibleCham.Size = obj.Size + Vec3(0.1,0.1,0.1) -- doom#1337
				VisibleCham.AlwaysOnTop = false -- doom#1337
				VisibleCham.Transparency = 0 -- doom#1337

				local WallCham = INST("BoxHandleAdornment") -- doom#1337
				WallCham.Name = "WallCham" -- doom#1337
				WallCham.AlwaysOnTop = true -- doom#1337
				WallCham.ZIndex = 5 -- doom#1337
				WallCham.Size = obj.Size + Vec3(0.1,0.1,0.1) -- doom#1337
				WallCham.AlwaysOnTop = true -- doom#1337
				WallCham.Transparency = 0.7 -- doom#1337

				if values.visuals.players.chams.Toggle then -- doom#1337
					if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then -- doom#1337
						VisibleCham.Visible = true -- doom#1337
						WallCham.Visible = true -- doom#1337
					else -- doom#1337
						VisibleCham.Visible = false -- doom#1337
						WallCham.Visible = false -- doom#1337
					end -- doom#1337
				else -- doom#1337
					VisibleCham.Visible = false -- doom#1337
					WallCham.Visible = false -- doom#1337
				end -- doom#1337

				INSERT(ChamItems, VisibleCham) -- doom#1337
				INSERT(ChamItems, WallCham) -- doom#1337

				VisibleCham.Color3 = values.visuals.players.chams.Color -- doom#1337
				WallCham.Color3 = values.visuals.players.chams.Color -- doom#1337

				VisibleCham.AdornCullingMode = "Never" -- doom#1337
				WallCham.AdornCullingMode = "Never" -- doom#1337

				VisibleCham.Adornee = obj -- doom#1337
				VisibleCham.Parent = obj -- doom#1337

				WallCham.Adornee = obj -- doom#1337
				WallCham.Parent = obj -- doom#1337
			end -- doom#1337
		end -- doom#1337
	end -- doom#1337
end -- doom#1337
