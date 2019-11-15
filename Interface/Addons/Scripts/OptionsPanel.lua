local addonName, addonTable = ...

local Options = CreateFrame("Frame", "ScriptsOptions", InterfaceOptionsPanelContainer)
Options.name = addonName
InterfaceOptions_AddCategory(Options)
Options:Hide()

local OkayGo = CreateFrame("Button", nil, InterfaceOptionsFrameOkay)
OkayGo:Hide()
OkayGo:SetAllPoints()

OkayGo:SetScript(
  "OnEnter",
  function()
    InterfaceOptionsFrameOkay:LockHighlight()
  end
)
OkayGo:SetScript(
  "OnLeave",
  function()
    InterfaceOptionsFrameOkay:UnlockHighlight()
  end
)
OkayGo:SetScript(
  "OnMouseDown",
  function()
    InterfaceOptionsFrameOkay:SetButtonState("PUSHED", false)
  end
)
OkayGo:SetScript(
  "OnMouseUp",
  function(self)
    InterfaceOptionsFrameOkay:SetButtonState("NORMAL", false)
    if MouseIsOver(self) then
      _G.ReloadUI()
    end
  end
)

function printTable(t, s)
  for k, v in pairs(t) do
    local kfmt = '["' .. tostring(k) .. '"]'
    if type(k) ~= "string" then
      kfmt = "[" .. k .. "]"
    end
    local vfmt = '"' .. tostring(v) .. '"'
    if type(v) == "table" then
      printTable(v, (s or "") .. kfmt)
    else
      if type(v) ~= "string" then
        vfmt = tostring(v)
      end
      print(type(t) .. (s or "") .. kfmt .. " = " .. vfmt)
    end
  end
end

function createCheckbox(label, description, x, y, pointParent, parent, checked, onClick)
  local checkbox = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
  checkbox:SetPoint("TOPLEFT", pointParent, "BOTTOMLEFT", x, y)

  checkbox.label = parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
  checkbox.label:SetPoint("LEFT", checkbox, "RIGHT", 0, 0)
  checkbox.label:SetText(label)

  checkbox.tooltipText = label
  checkbox.tooltipRequirement = description

  checkbox:SetChecked(checked)
  checkbox:SetScript("OnClick", onClick)

  return checkbox
end

local function createSlider(name, parent, low, high, label, description)
  local Slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
  Slider:SetWidth(180)
  Slider:SetObeyStepOnDrag(true)

  Slider.label = parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
  Slider.label:SetPoint("TOP", Slider, "BOTTOM", 0, 0)
  Slider.label:SetText(label)

  Slider.low = _G[Slider:GetName() .. "Low"]
  Slider.low:SetPoint("TOPLEFT", Slider, "BOTTOMLEFT", 0, 0)
  Slider.low:SetFontObject(GameFontNormalSmall)
  Slider.low:SetText(low)

  Slider.high = _G[Slider:GetName() .. "High"]
  Slider.high:SetPoint("TOPRIGHT", Slider, "BOTTOMRIGHT", 0, 0)
  Slider.high:SetFontObject(GameFontNormalSmall)
  Slider.high:SetText(high)

  Slider.value = Slider:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
  Slider.value:SetPoint("BOTTOM", Slider, "TOP")

  Slider:SetMinMaxValues(low, high)

  Slider.tooltipText = label
  Slider.tooltipRequirement = description

  return Slider
end

local function createButton(text, x, y, pointParent, parent, width, height, onClick)
  local Button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  Button:SetPoint("TOPLEFT", pointParent, "BOTTOMLEFT", x, y)
  Button:SetWidth(width)
  Button:SetHeight(height)
  Button:SetText(text)
  Button:SetScript("OnClick", onClick)

  return Button
end

local function createText(text, pointParent, parent, x, y)
  local Text = parent:CreateFontString(nil, parent, "GameFontNormalLarge")
  Text:SetPoint("TOPLEFT", pointParent, "BOTTOMLEFT", x, y)
  Text:SetText(text)

  return Text
end

local function createCategory(name, categoryConstructor)
  local CategoryFrame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
  CategoryFrame.name = name
  CategoryFrame.parent = addonName
  InterfaceOptions_AddCategory(CategoryFrame, addonName)
  CategoryFrame:Hide()
  CategoryFrame:SetScript(
    "OnShow",
    function(self)
      local title = CategoryFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
      title:SetPoint("TOPLEFT", 16, -16)
      title:SetText(addonName .. " - " .. name)
      local SubText = CategoryFrame:CreateFontString("$parentSubText", "ARTWORK", "GameFontHighlightSmall")
      SubText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -2, -16)

      categoryConstructor(CategoryFrame, SubText)
      OkayGo:Show()

      self:SetScript(
        "OnHide",
        function()
          OkayGo:Hide()
        end
      )

      self:SetScript(
        "OnShow",
        function()
          OkayGo:Show()
        end
      )
    end
  )
end

-- Default section
Options:SetScript(
  "OnShow",
  function(self)
    local title = Options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(addonName)

    local SubText = Options:CreateFontString("$parentSubText", "ARTWORK", "GameFontHighlightSmall")
    SubText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -2, -16)
    SubText:SetText(GetAddOnMetadata(addonName, "Notes"))

    local DARKEN_FRAMES =
      createCheckbox(
      "Darken frames",
      "Make Blizzard UI look dark!",
      0,
      -16,
      SubText,
      Options,
      ScriptsDB.GENERAL.DARKEN_FRAMES,
      function(self)
        ScriptsDB.GENERAL.DARKEN_FRAMES = self:GetChecked()
      end
    )

    local LUA_ERRORS =
      createCheckbox(
      "LUA errors",
      "Show LUA script errors",
      0,
      -16,
      DARKEN_FRAMES,
      Options,
      ScriptsDB.GENERAL.LUA_ERRORS,
      function(self)
        ScriptsDB.GENERAL.LUA_ERRORS = self:GetChecked()
      end
    )
    OkayGo:Show()

    self:SetScript(
      "OnHide",
      function()
        OkayGo:Hide()
      end
    )

    self:SetScript(
      "OnShow",
      function()
        OkayGo:Show()
      end
    )
  end
)

createCategory(
  "Action Bars",
  function(CategoryFrame, SubText)
    local MAINBAR_SCALE = createSlider("$parentMAINBAR_SCALE", CategoryFrame, 0.9, 1.2, "Mainbar Scale", "")
    MAINBAR_SCALE:SetPoint("TOPLEFT", SubText, "BOTTOMLEFT", 0, -20)
    MAINBAR_SCALE:SetValueStep(0.05)

    MAINBAR_SCALE:SetScript(
      "OnValueChanged",
      function(self, value)
        local stepValue = 0.05
        local halfStep = stepValue / 2
        value = value + halfStep - (value + halfStep) % stepValue

        self.value:SetText(value)
        ScriptsDB.ACTIONBARS.MAINBAR_SCALE = value
      end
    )
    MAINBAR_SCALE:SetValue(ScriptsDB.ACTIONBARS.MAINBAR_SCALE)

    local HIDE_HOTKEYS =
      createCheckbox(
      "Hide hotkeys",
      "",
      0,
      -32,
      MAINBAR_SCALE,
      CategoryFrame,
      ScriptsDB.ACTIONBARS.HIDE_HOTKEYS,
      function(self)
        ScriptsDB.ACTIONBARS.HIDE_HOTKEYS = self:GetChecked()
      end
    )

    local HIDE_MACRONAMES =
      createCheckbox(
      "Hide macros names",
      "",
      0,
      -16,
      HIDE_HOTKEYS,
      CategoryFrame,
      ScriptsDB.ACTIONBARS.HIDE_MACRONAMES,
      function(self)
        ScriptsDB.ACTIONBARS.HIDE_MACRONAMES = self:GetChecked()
      end
    )

    local HIDE_GRYPHONS =
      createCheckbox(
      "Hide gryphons",
      "Hide Mainbar gryphons art",
      0,
      -16,
      HIDE_MACRONAMES,
      CategoryFrame,
      ScriptsDB.ACTIONBARS.HIDE_GRYPHONS,
      function(self)
        ScriptsDB.ACTIONBARS.HIDE_GRYPHONS = self:GetChecked()
      end
    )

    local OUT_OF_RANGE_INDICATOR =
      createCheckbox(
      "Out of range indicator",
      "Add red background to target out of range spell buttons",
      0,
      -16,
      HIDE_GRYPHONS,
      CategoryFrame,
      ScriptsDB.ACTIONBARS.OUT_OF_RANGE_INDICATOR,
      function(self)
        ScriptsDB.ACTIONBARS.OUT_OF_RANGE_INDICATOR = self:GetChecked()
      end
    )

    local KEYPRESS_ANIMATION =
      createCheckbox(
      "Keypress animation",
      "Add key press flashing animation",
      0,
      -16,
      OUT_OF_RANGE_INDICATOR,
      CategoryFrame,
      ScriptsDB.ACTIONBARS.KEYPRESS_ANIMATION,
      function(self)
        ScriptsDB.ACTIONBARS.KEYPRESS_ANIMATION = self:GetChecked()
      end
    )
  end
)

createCategory(
  "Automation",
  function(CategoryFrame, SubText)
    local SELL_JUNK =
      createCheckbox(
      "Sell junk",
      "Automatically sell gray items when vendor tab is open",
      0,
      -16,
      SubText,
      CategoryFrame,
      ScriptsDB.AUTOMATION.SELL_JUNK,
      function(self)
        ScriptsDB.AUTOMATION.SELL_JUNK = self:GetChecked()
      end
    )

    local SKIP_CINEMATICS =
      createCheckbox(
      "Skip cinematics",
      "Automatically skip cinematics",
      0,
      -16,
      SELL_JUNK,
      CategoryFrame,
      ScriptsDB.AUTOMATION.SKIP_CINEMATICS,
      function(self)
        ScriptsDB.AUTOMATION.SKIP_CINEMATICS = self:GetChecked()
      end
    )

    local DISMOUNT =
      createCheckbox(
      "Dismount",
      "Automatically dismount on spell button press, at flight points, etc.",
      0,
      -16,
      SKIP_CINEMATICS,
      CategoryFrame,
      ScriptsDB.AUTOMATION.DISMOUNT,
      function(self)
        ScriptsDB.AUTOMATION.DISMOUNT = self:GetChecked()
      end
    )
  end
)

createCategory(
  "Unit Frames",
  function(CategoryFrame, SubText)
    local COMBAT_INDICATORS =
      createCheckbox(
      "Combat indicators",
      "Show Custom Combat Indicators",
      0,
      -16,
      SubText,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.COMBAT_INDICATORS,
      function(self)
        ScriptsDB.UNITFRAMES.COMBAT_INDICATORS = self:GetChecked()
      end
    )

    local CLASS_PORTRAITS =
      createCheckbox(
      "Class portraits",
      "Show class portraits as frame portraits",
      240,
      24,
      COMBAT_INDICATORS,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.CLASS_PORTRAITS,
      function(self)
        ScriptsDB.UNITFRAMES.CLASS_PORTRAITS = self:GetChecked()
      end
    )

    local PLAYER_TEXT = createText("Player", COMBAT_INDICATORS, CategoryFrame, 0, -20)
    local TARGET_TEXT = createText("Target", PLAYER_TEXT, CategoryFrame, 240, 16)

    local PLAYER_HIDE_LEVEL =
      createCheckbox(
      "Hide player level",
      "",
      0,
      -16,
      PLAYER_TEXT,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.PLAYER_HIDE_LEVEL,
      function(self)
        ScriptsDB.UNITFRAMES.PLAYER_HIDE_LEVEL = self:GetChecked()
      end
    )

    local PLAYER_HIDE_NAME =
      createCheckbox(
      "Hide name",
      "",
      0,
      -16,
      PLAYER_HIDE_LEVEL,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.PLAYER_HIDE_NAME,
      function(self)
        ScriptsDB.UNITFRAMES.PLAYER_HIDE_NAME = self:GetChecked()
      end
    )

    local PLAYER_HIDE_REST_ICON =
      createCheckbox(
      "Hide player rest icon",
      "",
      0,
      -16,
      PLAYER_HIDE_NAME,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.PLAYER_HIDE_REST_ICON,
      function(self)
        ScriptsDB.UNITFRAMES.PLAYER_HIDE_REST_ICON = self:GetChecked()
      end
    )

    local PLAYER_BIG_FRAME =
      createCheckbox(
      "Big frame",
      "",
      0,
      -16,
      PLAYER_HIDE_REST_ICON,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.PLAYER_BIG_FRAME,
      function(self)
        ScriptsDB.UNITFRAMES.PLAYER_BIG_FRAME = self:GetChecked()
      end
    )

    -- TARGET
    local TARGET_CLASS_COLORED =
      createCheckbox(
      "Class colored",
      "Class colored name background",
      0,
      -16,
      TARGET_TEXT,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.TARGET_CLASS_COLORED,
      function(self)
        ScriptsDB.UNITFRAMES.TARGET_CLASS_COLORED = self:GetChecked()
      end
    )

    local TARGET_BIG_FRAME =
      createCheckbox(
      "Big frame",
      "",
      0,
      -16,
      TARGET_CLASS_COLORED,
      CategoryFrame,
      ScriptsDB.UNITFRAMES.TARGET_BIG_FRAME,
      function(self)
        ScriptsDB.UNITFRAMES.TARGET_BIG_FRAME = self:GetChecked()
      end
    )
  end
)

createCategory(
  "Raid Frames",
  function(CategoryFrame, SubText)
    local SCALE = createSlider("$parentSCALE", CategoryFrame, 0.8, 2.0, "Raid frames scale", "")
    SCALE:SetPoint("TOPLEFT", SubText, "BOTTOMLEFT", 0, -20)
    SCALE:SetValueStep(0.1)
    SCALE:SetScript(
      "OnValueChanged",
      function(self, value)
        local stepValue = 0.1
        local halfStep = stepValue / 2
        value = value + halfStep - (value + halfStep) % stepValue

        self.value:SetText(value)

        ScriptsDB.RAIDFRAMES.SCALE = value
      end
    )

    SCALE:SetValue(ScriptsDB.RAIDFRAMES.SCALE)
  end
)

SLASH_SCRIPTS1 = "/scripts"
SlashCmdList.SCRIPTS = function()
  InterfaceOptionsFrame_OpenToCategory(Options)
  InterfaceOptionsFrame_OpenToCategory(Options) -- double to fix blizz bug
end
