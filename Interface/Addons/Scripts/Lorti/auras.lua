local addon, ns = ...
local cfg = ns.cfg

local classColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local backdrop = {
	bgFile = nil,
	edgeFile = "Interface\\AddOns\\Scripts\\textures\\outer_shadow",
	tile = false,
	tileSize = 32,
	edgeSize = 4,
	insets = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4
	}
}

local setCustomAurasSizes = function(
	self,
	auraName,
	numAuras,
	numOppositeAuras,
	largeAuraList,
	updateFunc,
	maxRowWidth,
	offsetX)
	local AURA_OFFSET_Y = 3
	local LARGE_AURA_SIZE = 27 -- Your buffs
	local SMALL_AURA_SIZE = 20 -- Enemy's buffs
	local size
	local offsetY = AURA_OFFSET_Y
	local rowWidth = 7
	local firstBuffOnRow = 1
	for i = 1, numAuras do
		if (largeAuraList[i]) then
			size = LARGE_AURA_SIZE
			offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y
		else
			size = SMALL_AURA_SIZE
		end
		if (i == 1) then
			rowWidth = size
			self.auraRows = self.auraRows + 1
		else
			rowWidth = rowWidth + size + offsetX
		end
		if (rowWidth > maxRowWidth) then
			updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY)
			rowWidth = size
			self.auraRows = self.auraRows + 1
			firstBuffOnRow = i
			offsetY = AURA_OFFSET_Y
		else
			updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY)
		end
	end
end

hooksecurefunc("TargetFrame_UpdateAuraPositions", setCustomAurasSizes)

--apply aura frame texture func
local function applySkin(b)
	if not b or (b and b.styled) then
		return
	end
	--button name
	local name = b:GetName()
	if (name:match("Debuff")) then
		b.debuff = true
	else
		b.buff = true
	end
	--icon
	local icon = _G[name .. "Icon"]
	icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	icon:SetDrawLayer("BACKGROUND", -8)
	b.icon = icon
	--border
	local border = _G[name .. "Border"] or b:CreateTexture(name .. "Border", "BACKGROUND", nil, -7)
	border:SetTexture("Interface\\AddOns\\Scripts\\textures\\gloss_grey")
	border:SetTexCoord(0, 1, 0, 1)
	border:SetDrawLayer("BACKGROUND", -7)
	if b.buff then
		border:SetVertexColor(0.4, 0.35, 0.35)
	end
	border:ClearAllPoints()
	border:SetPoint("TOPLEFT", b, "TOPLEFT", -1, 1)
	border:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 1, -1)
	b.border = border
	--shadow
	local back = CreateFrame("Frame", nil, b)
	back:SetPoint("TOPLEFT", b, "TOPLEFT", -4, 4)
	back:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 4, -4)
	back:SetFrameLevel(b:GetFrameLevel() - 1)
	back:SetBackdrop(backdrop)
	back:SetBackdropBorderColor(0, 0, 0, 0.9)
	b.bg = back
	--set button styled variable
	b.styled = true
end

hooksecurefunc(
	"TargetFrame_UpdateAuras",
	function(self)
		for i = 1, MAX_TARGET_BUFFS do
			b = _G["TargetFrameBuff" .. i]
			applySkin(b)

			-- style stealable buffs
			_, _, ic, _, debuffType = UnitBuff(self.unit, i)
			if (ic and (not self.maxBuffs or i <= self.maxBuffs)) then
				frameStealable = _G[self:GetName() .. "Buff" .. i .. "Stealable"]
				if (UnitIsEnemy(PlayerFrame.unit, self.unit) and debuffType == "Magic") then
					frameStealable:Show()
				else
					frameStealable:Hide()
				end
			end
		end
		for i = 1, MAX_TARGET_DEBUFFS do
			b = _G["TargetFrameDebuff" .. i]
			applySkin(b)
		end
	end
)
