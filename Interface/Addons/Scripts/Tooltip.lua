local ItemRefTooltip = ItemRefTooltip
L_CHAT_AFK = "[AFK]"
L_CHAT_DND = "[DND]"
L_TOOLTIP_LOADING = "Loading..."
L_TOOLTIP_SPELL_ID = "Spell ID:"
L_TOOLTIP_ITEM_ID = "Item ID:"
L_TOOLTIP_WHO_TARGET = "Targeted By"
L_TOOLTIP_ITEM_COUNT = "Item count:"
L_TOOLTIP_INSPECT_OPEN = "Inspect Frame is open"

ItemRefTooltip.UpdateTooltip = function(self)
  if (not self.comparing and not IsModifiedClick("COMPAREITEMS")) then
    GameTooltip_ShowCompareItem(self)
    self.comparing = true
  elseif (self.comparing and IsModifiedClick("COMPAREITEMS")) then
    for _, frame in pairs(self.shoppingTooltips) do
      frame:Hide()
    end

    self.needsReset = true
    self.comparing = false
  end
end

ItemRefTooltip:SetScript(
  "OnTooltipSetItem",
  function(self)
    if (not IsModifiedClick("COMPAREITEMS") and self:IsMouseOver()) then
      GameTooltip_ShowCompareItem(self)
      self.comparing = true
    end
  end
)

ItemRefTooltip:SetScript(
  "OnDragStop",
  function(self)
    self:StopMovingOrSizing()
    ValidateFramePosition(self)
    if (not IsModifiedClick("COMPAREITEMS")) then --We do this to choose where the comparison is shown
      GameTooltip_ShowCompareItem(self)
      self.comparing = true
    end
  end
)

ShortValue = function(value)
  if value >= 1e11 then
    return ("%.0fb"):format(value / 1e9)
  elseif value >= 1e10 then
    return ("%.1fb"):format(value / 1e9):gsub("%.?0+([km])$", "%1")
  elseif value >= 1e9 then
    return ("%.2fb"):format(value / 1e9):gsub("%.?0+([km])$", "%1")
  elseif value >= 1e8 then
    return ("%.0fm"):format(value / 1e6)
  elseif value >= 1e7 then
    return ("%.1fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
  elseif value >= 1e6 then
    return ("%.2fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
  elseif value >= 1e5 then
    return ("%.0fk"):format(value / 1e3)
  elseif value >= 1e3 then
    return ("%.1fk"):format(value / 1e3):gsub("%.?0+([km])$", "%1")
  else
    return value
  end
end

-- Hide PVP text
PVP_ENABLED = ""

local oUF_colors = {
  reaction = {}
}

for eclass, color in next, FACTION_BAR_COLORS do
  oUF_colors.reaction[eclass] = {color.r, color.g, color.b}
end

-- Statusbar
--GameTooltipStatusBar:SetHeight(4)
--GameTooltipStatusBar:ClearAllPoints()
--GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", 2, 6)
--GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -2, 6)

-- Raid icon
local ricon = GameTooltip:CreateTexture("GameTooltipRaidIcon", "OVERLAY")
ricon:SetHeight(20)
ricon:SetWidth(20)
ricon:SetPoint("BOTTOM", GameTooltip, "TOP", 0, 8)

GameTooltip:HookScript(
  "OnHide",
  function(self)
    ricon:SetTexture(nil)
  end
)

-- Add "Targeted By" line
local targetedList = {}
local ClassColors = {}
local token
for class, color in next, RAID_CLASS_COLORS do
  ClassColors[class] = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)
end

local function AddTargetedBy()
  local numParty, numRaid = GetNumSubgroupMembers(), GetNumGroupMembers()
  if numParty > 0 or numRaid > 0 then
    for i = 1, (numRaid > 0 and numRaid or numParty) do
      local unit = (numRaid > 0 and "raid" .. i or "party" .. i)
      if UnitIsUnit(unit .. "target", token) and not UnitIsUnit(unit, "player") then
        local _, class = UnitClass(unit)
        targetedList[#targetedList + 1] = ClassColors[class]
        targetedList[#targetedList + 1] = UnitName(unit)
        targetedList[#targetedList + 1] = "|r, "
      end
    end
    if #targetedList > 0 then
      targetedList[#targetedList] = nil
      GameTooltip:AddLine(" ", nil, nil, nil, 1)
      local line = _G["GameTooltipTextLeft" .. GameTooltip:NumLines()]
      if not line then
        return
      end
      line:SetFormattedText(
        L_TOOLTIP_WHO_TARGET .. " (|cffffffff%d|r): %s",
        (#targetedList + 1) / 3,
        table.concat(targetedList)
      )
      wipe(targetedList)
    end
  end
end

----------------------------------------------------------------------------------------
--	Unit tooltip styling
----------------------------------------------------------------------------------------
function GameTooltip_UnitColor(unit)
  if not unit then
    return
  end
  local r, g, b

  if UnitIsPlayer(unit) then
    local _, class = UnitClass(unit)
    local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
    if color then
      r, g, b = color.r, color.g, color.b
    else
      r, g, b = 1, 1, 1
    end
  elseif UnitIsTapDenied(unit) or UnitIsDead(unit) then
    r, g, b = 0.6, 0.6, 0.6
  else
    local reaction = oUF_colors.reaction[UnitReaction(unit, "player")]
    if reaction then
      r, g, b = reaction[1], reaction[2], reaction[3]
    else
      r, g, b = 1, 1, 1
    end
  end

  return r, g, b
end

local function GameTooltipDefault(tooltip, parent)
  tooltip:SetOwner(parent, "ANCHOR_NONE")
  --tooltip:ClearAllPoints()
  --tooltip:SetPoint("BOTTOMRIGHT", TooltipAnchor, "BOTTOMRIGHT", 0, 0)
  tooltip.default = 1
end

hooksecurefunc("GameTooltip_SetDefaultAnchor", GameTooltipDefault)

GameTooltipStatusBar:SetScript(
  "OnValueChanged",
  function(self, value)
    if not value then
      return
    end
    local min, max = self:GetMinMaxValues()
    if (value < min) or (value > max) then
      return
    end
    self:SetStatusBarColor(0, 1, 0)
    local _, unit = GameTooltip:GetUnit()
    if unit then
      min, max = UnitHealth(unit), UnitHealthMax(unit)
      local hpRMH, maxhpRMH
      if IsAddOnLoaded("RealMobHealth") and UnitExists(unit) then
        if GetAddOnMetadata("RealMobHealth", "Version") == "1.0" then
          if RealMobHealth.GetHealth then
            hpRMH, maxhpRMH = RealMobHealth.GetHealth(unit, true)
          end
        else
          hpRMH, maxhpRMH = RealMobHealth.GetUnitHealth(unit, true)
        end

        if hpRMH and maxhpRMH then
          min, max = hpRMH, maxhpRMH
        end
      end
      if not self.text then
        self.text = self:CreateFontString(nil, "OVERLAY", "Tooltip_Med")
        self.text:SetPoint("CENTER", GameTooltipStatusBar, 0, 1.5)
      end
      self.text:Show()
      local hp = ShortValue(min) .. " / " .. ShortValue(max)
      self.text:SetText(hp)
    end
  end
)

local OnTooltipSetUnit = function(self)
  local lines = self:NumLines()
  local unit =
    (select(2, self:GetUnit())) or
    (GetMouseFocus() and GetMouseFocus().GetAttribute and GetMouseFocus():GetAttribute("unit")) or
    (UnitExists("mouseover") and "mouseover") or
    nil

  if not unit then
    return
  end

  local name, realm = UnitName(unit)
  local race, englishRace = UnitRace(unit)
  local level = UnitLevel(unit)
  local levelColor = GetCreatureDifficultyColor(level)
  local classification = UnitClassification(unit)
  local creatureType = UnitCreatureType(unit)
  local _, faction = UnitFactionGroup(unit)
  local _, playerFaction = UnitFactionGroup("player")
  local UnitPVPName = UnitPVPName

  if level and level == -1 then
    level = "|cffff0000??|r"
  end

  if classification == "rareelite" then
    classification = " R+"
  elseif classification == "rare" then
    classification = " R"
  elseif classification == "elite" then
    classification = "+"
  else
    classification = ""
  end

  if UnitPVPName(unit) then
    name = UnitPVPName(unit)
  end

  _G["GameTooltipTextLeft1"]:SetText(name)
  if realm and realm ~= "" then
    self:AddLine(FRIENDS_LIST_REALM .. "|cffffffff" .. realm .. "|r")
  end

  if UnitIsPlayer(unit) then
    if UnitIsAFK(unit) then
      self:AppendText((" %s"):format("|cffE7E716" .. L_CHAT_AFK .. "|r"))
    elseif UnitIsDND(unit) then
      self:AppendText((" %s"):format("|cffFF0000" .. L_CHAT_DND .. "|r"))
    end

    if UnitIsPlayer(unit) and faction ~= nil and faction ~= playerFaction then
      local hex = "cffff3333"
      if faction == "Alliance" then
        hex = "cff69ccf0"
      end
      self:AppendText((" [|%s%s|r]"):format(hex, faction:sub(1, 2)))
    end

    if GetGuildInfo(unit) then
      _G["GameTooltipTextLeft2"]:SetFormattedText("%s", GetGuildInfo(unit))
      if UnitIsInMyGuild(unit) then
        _G["GameTooltipTextLeft2"]:SetTextColor(1, 1, 0)
      else
        _G["GameTooltipTextLeft2"]:SetTextColor(0, 1, 1)
      end
    end

    local n = GetGuildInfo(unit) and 3 or 2
    -- thx TipTac for the fix above with color blind enabled
    if GetCVar("colorblindMode") == "1" then
      n = n + 1
    end
    _G["GameTooltipTextLeft" .. n]:SetFormattedText(
      "|cff%02x%02x%02x%s|r %s",
      levelColor.r * 255,
      levelColor.g * 255,
      levelColor.b * 255,
      level,
      race or UNKNOWN
    )

    for i = 2, lines do
      local line = _G["GameTooltipTextLeft" .. i]
      if not line or not line:GetText() then
        return
      end
      if line and line:GetText() and (line:GetText() == FACTION_HORDE or line:GetText() == FACTION_ALLIANCE) then
        line:SetText()
        break
      end
    end
  else
    for i = 2, lines do
      local line = _G["GameTooltipTextLeft" .. i]
      if not line or not line:GetText() then
        return
      end
      if (level and line:GetText():find("^" .. LEVEL)) or (creatureType and line:GetText():find("^" .. creatureType)) then
        line:SetFormattedText(
          "|cff%02x%02x%02x%s%s|r %s",
          levelColor.r * 255,
          levelColor.g * 255,
          levelColor.b * 255,
          level,
          classification,
          creatureType or ""
        )
        break
      end
    end
  end

  local r, g, b = GameTooltip_UnitColor(unit .. "target")
  local text = ""

  if UnitIsEnemy("player", unit .. "target") then
    r, g, b = unpack(oUF_colors.reaction[1])
  elseif not UnitIsFriend("player", unit .. "target") then
    r, g, b = unpack(oUF_colors.reaction[4])
  end

  if UnitName(unit .. "target") == UnitName("player") then
    text = "|cfffed100" .. STATUS_TEXT_TARGET .. ":|r " .. "|cffff0000> " .. UNIT_YOU .. " <|r"
  else
    --text = "|cfffed100" .. STATUS_TEXT_TARGET .. ":|r " .. UnitName(unit .. "target")
  end

  self:AddLine(text, r, g, b)

  local raidIndex = GetRaidTargetIndex(unit)
  if raidIndex then
    ricon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. raidIndex)
  end

  token = unit
  AddTargetedBy()
end

GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)

GameTooltip:HookScript(
  "OnTooltipSetUnit",
  function(self, ...)
    -- Get the unit
    local _, unit = self:GetUnit()
    if not unit then
      local mFocus = GetMouseFocus()
      if mFocus and mFocus.unit then
        unit = mFocus.unit
      end
    end
    -- Get and display guild rank
    if UnitIsPlayer(unit) then
      local guildName, guildRank = GetGuildInfo(unit)
      if guildName then
        self:AddLine(RANK .. ": |cffffffff" .. guildRank .. "|r")
      end
    end
  end
)
