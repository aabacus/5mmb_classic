-- the default ActionButton_UpdateHotkeys function will reget the first hotkey associated with a button
-- and show/hide if there is a bind or not, so we will rehide it if neccesary after the default function runs
local function ActionButton_UpdateHotkeys(self)
  local hkf = self.HotKey --_G[self:GetName().."HotKey"]

  if (hkf) then
    if (ScriptsDB.ACTIONBARS.HIDE_HOTKEYS and hkf:IsShown()) then
      hkf:Hide()
    elseif (not ScriptsDB.ACTIONBARS.HIDE_HOTKEYS and not hkf:IsShown()) then
      local action = self.action

      if action and HasAction(action) then
        -- only show hotkey if the default UI would
        local range = IsActionInRange(action)

        if hkf:GetText() ~= RANGE_INDICATOR or range or range == false then
          hkf:Show()
        end
      end
    end
  end
end

local function ActionButton_Update(self)
  local mnf = self.Name --_G[self:GetName().."Name"]

  if (mnf) then
    if (ScriptsDB.ACTIONBARS.HIDE_MACRONAMES and mnf:IsShown()) then
      mnf:Hide()
    elseif (not ScriptsDB.ACTIONBARS.HIDE_MACRONAMES and not mnf:IsShown()) then
      mnf:Show()
    end
  end
end

local function hideBar(b, f)
  for i = 1, 12 do
    local o = _G[b .. "Button" .. i .. f]
    if (o) then
      o:Hide()
    end
  end
end

local function showBar(b, f)
  for i = 1, 12 do
    local o = _G[b .. "Button" .. i .. f]
    if (o) then
      if f == "HotKey" then
        local action = _G[b .. "Button" .. i].action
        local range = IsActionInRange(action)
        if o:GetText() ~= RANGE_INDICATOR or range or range == false then
          o:Show()
        end
      else
        o:Show()
      end
    end
  end
end

local function hideHotkeys(hide)
  for i, barName in pairs(
    {
      "Action",
      "BonusAction",
      "PetAction",
      "MultiBarBottomLeft",
      "MultiBarBottomRight",
      "MultiBarRight",
      "MultiBarLeft"
    }
  ) do
    if hide == false then
      showBar(barName, "HotKey")
    else
      hideBar(barName, "HotKey")
    end
  end
  if hide == false then
    ScriptsDB.ACTIONBARS.HIDE_HOTKEYS = false
  else
    ScriptsDB.ACTIONBARS.HIDE_HOTKEYS = true
  end
end

local function HK_Slash()
  if (ScriptsDB.ACTIONBARS.HIDE_HOTKEYS) then
    hideHotkeys(false)
  else
    hideHotkeys()
  end
end

local function hideMacroNames(hide)
  for i, barName in pairs(
    {
      "Action",
      "BonusAction",
      "MultiBarBottomLeft",
      "MultiBarBottomRight",
      "MultiBarRight",
      "MultiBarLeft"
    }
  ) do
    if hide == false then
      showBar(barName, "Name")
    else
      hideBar(barName, "Name")
    end
  end
  if hide == false then
    ScriptsDB.ACTIONBARS.HIDE_MACRONAMES = false
  else
    ScriptsDB.ACTIONBARS.HIDE_MACRONAMES = true
  end
end

local function MN_Slash()
  if (ScriptsDB.ACTIONBARS.HIDE_MACRONAMES) then
    hideMacroNames(false)
  else
    hideMacroNames()
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript(
  "OnEvent",
  function(self, event)
    if (event == "PLAYER_ENTERING_WORLD") then
      if (ScriptsDB.ACTIONBARS.HIDE_HOTKEYS) then
        hideHotkeys()
      else
        hideHotkeys(false)
      end
      if (ScriptsDB.ACTIONBARS.HIDE_MACRONAMES) then
        hideMacroNames()
      else
        hideMacroNames(false)
      end
    end
  end
)

-- register a hook for action button update functions
hooksecurefunc("ActionButton_UpdateHotkeys", ActionButton_UpdateHotkeys)
hooksecurefunc("ActionButton_OnUpdate", ActionButton_UpdateHotkeys)
hooksecurefunc("ActionButton_Update", ActionButton_Update)

SLASH_HIDEHOTKEYSHK1 = "/hhk"
SlashCmdList["HIDEHOTKEYSHK"] = HK_Slash

SLASH_HIDEHOTKEYSMN1 = "/hmn"
SlashCmdList["HIDEHOTKEYSMN"] = MN_Slash
