local dominos = IsAddOnLoaded("Dominos")

--[[ Deja Chat ]]
CHAT_FRAME_FADE_OUT_TIME = 0
CHAT_TAB_HIDE_DELAY = 0
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0

BNToastFrame:SetClampedToScreen(true)
BNToastFrame:SetClampRectInsets(-15, 15, 15, -15)
ChatFrameMenuButton:Hide()

_G.GOLD_AMOUNT = "|cffffffff%d|r|TInterface\\MONEYFRAME\\UI-GoldIcon:14:14:2:0|t"
_G.SILVER_AMOUNT = "|cffffffff%d|r|TInterface\\MONEYFRAME\\UI-SilverIcon:14:14:2:0|t"
_G.COPPER_AMOUNT = "|cffffffff%d|r|TInterface\\MONEYFRAME\\UI-CopperIcon:14:14:2:0|t"

-- Table to keep track of frames you already saw:
local frames = {}

local function UpdateBackgroundAnchors(self)
	--fix wierd combat log
	self:SetClampRectInsets(0, 0, 0, 0)
end

--AddMessage
local function AddMessage(self, text, ...)
	--channel replace (Trade and such)
	text = text:gsub("|h%[(%d+)%. .-%]|h", "|h%1.|h")
	--url search
	text = text:gsub("([wWhH][wWtT][wWtT][%.pP]%S+[^%p%s])", "|cffffffff|Hurl:%1|h[%1]|h|r")
	return self.DefaultAddMessage(self, text, ...)
end

-- Function to handle customzing a chat frame:
local function ProcessFrame(frame)
	if frames[frame] then
		return
	end

	frame:SetClampRectInsets(0, 0, 0, 0)
	frame:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
	frame:SetMinResize(250, 100)

	local name = frame:GetName()
	_G[name .. "ButtonFrame"]:Hide()
	_G[name .. "EditBoxLeft"]:Hide()
	_G[name .. "EditBoxMid"]:Hide()
	_G[name .. "EditBoxRight"]:Hide()

	local editbox = _G[name .. "EditBox"]
	editbox:ClearAllPoints()
	editbox:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", -7, 25)
	editbox:SetPoint("BOTTOMRIGHT", ChatFrame1, "TOPRIGHT", 10, 25)
	editbox:SetAltArrowKeyMode(false)

	_G[name .. "TabLeft"]:SetTexture(nil)
	_G[name .. "TabMiddle"]:SetTexture(nil)
	_G[name .. "TabRight"]:SetTexture(nil)
	_G[name .. "TabSelectedLeft"]:SetTexture(nil)
	_G[name .. "TabSelectedMiddle"]:SetTexture(nil)
	_G[name .. "TabSelectedRight"]:SetTexture(nil)
	--_G[name .. "TabHighlightLeft"]:SetTexture(nil)
	--_G[name .. "TabHighlightMiddle"]:SetTexture(nil)
	--_G[name .. "TabHighlightRight"]:SetTexture(nil)
	_G[name .. "TopTexture"]:SetTexture(nil)
	_G[name .. "RightTexture"]:SetTexture(nil)
	_G[name .. "BottomTexture"]:SetTexture(nil)
	_G[name .. "LeftTexture"]:SetTexture(nil)
	_G[name .. "Background"]:SetTexture(nil)

	frames[frame] = true
end

-- Get all of the permanent chat windows and customize them:
for i = 1, NUM_CHAT_WINDOWS do
	local chatframe = _G["ChatFrame" .. i]
	ProcessFrame(chatframe)

	_G["ChatFrame" .. i .. "ButtonFrame"]:SetAlpha(0.1)

	local tab = _G["ChatFrame" .. i .. "Tab"]
	tab.noMouseAlpha = 0
	tab:SetAlpha(0)

	if (i ~= 2) then
		chatframe.DefaultAddMessage = chatframe.AddMessage
		chatframe.AddMessage = AddMessage
	end
end

-- Set up a dirty hook to catch temporary windows and customize them when they are created:
local old_OpenTemporaryWindow = FCF_OpenTemporaryWindow
FCF_OpenTemporaryWindow = function(...)
	local frame = old_OpenTemporaryWindow(...)
	ProcessFrame(frame)
	return frame
end

hooksecurefunc("FloatingChatFrame_UpdateBackgroundAnchors", UpdateBackgroundAnchors)

-- Chat Scroll Module
function FloatingChatFrame_OnMouseScroll(self, delta)
	if delta > 0 then
		if IsShiftKeyDown() then
			self:ScrollToTop()
		else
			self:ScrollUp()
		end
	elseif delta < 0 then
		if IsShiftKeyDown() then
			self:ScrollToBottom()
		else
			self:ScrollDown()
		end
	end
end
