ScriptsDB = {}

defaultOptions = {
  ACTIONBARS = {
    MAINBAR_SCALE = 1.0,
    HIDE_HOTKEYS = false,
    HIDE_MACRONAMES = false,
    HIDE_GRYPHONS = true,
    OUT_OF_RANGE_INDICATOR = true,
    KEYPRESS_ANIMATION = true
  },
  GENERAL = {
    DARKEN_FRAMES = true,
    LUA_ERRORS = false
  },
  AUTOMATION = {
    SKIP_CINEMATICS = true,
    DISMOUNT = true,
    SELL_JUNK = true
  },
  CASTBAR = {
    CUSTOM_STYLING = true
  },
  TOOLTIP = {
    ENABLED = true
  },
  SYSTEM_STATS = {
    ENABLED = true
  },
  RAIDFRAMES = {
    SCALE = 1.3
  },
  UNITFRAMES = {
    COMBAT_INDICATORS = true,
    CLASS_PORTRAITS = true,
    PLAYER_HIDE_LEVEL = true,
    PLAYER_HIDE_NAME = true,
    PLAYER_BIG_FRAME = true,
    PLAYER_HIDE_REST_ICON = false,
    TARGET_CLASS_COLORED = true,
    TARGET_BIG_FRAME = false
  }
}

local function copyDefaults(src, dst)
  if type(src) ~= "table" then
    return {}
  end
  if type(dst) ~= "table" then
    dst = {}
  end
  for k, v in pairs(src) do
    if type(v) == "table" then
      dst[k] = copyDefaults(v, dst[k])
    elseif type(v) ~= type(dst[k]) then
      dst[k] = v
    end
  end
  return dst
end

ScriptsDB = copyDefaults(defaultOptions, ScriptsDB)
