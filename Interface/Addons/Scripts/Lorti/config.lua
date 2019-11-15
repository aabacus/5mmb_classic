local addon, ns = ...

local cfg = CreateFrame("Frame")

-- action bars settings
cfg.textures = {
  normal = "Interface\\AddOns\\Scripts\\textures\\gloss",
  flash = "Interface\\AddOns\\Scripts\\textures\\flash",
  hover = "Interface\\AddOns\\Scripts\\textures\\hover",
  pushed = "Interface\\AddOns\\Scripts\\textures\\pushed",
  checked = "Interface\\AddOns\\Scripts\\textures\\checked",
  equipped = "Interface\\AddOns\\Scripts\\textures\\gloss_grey",
  buttonback = "Interface\\AddOns\\Scripts\\textures\\button_background",
  buttonbackflat = "Interface\\AddOns\\Scripts\\textures\\button_background_flat",
  outer_shadow = "Interface\\AddOns\\Scripts\\textures\\outer_shadow"
}

cfg.background = {
  shadowcolor = {r = 0, g = 0, b = 0, a = 0.9},
  classcolored = false,
  inset = 5
}

cfg.color = {
  normal = {r = 0.37, g = 0.3, b = 0.3},
  equipped = {r = 0.1, g = 0.5, b = 0.1},
  classcolored = false
}

cfg.hotkeys = {
  show = true,
  fontsize = 12,
  pos1 = {a1 = "TOPRIGHT", x = 0, y = 0},
  pos2 = {a1 = "TOPLEFT", x = 0, y = 0} --important! two points are needed to make the hotkeyname be inside of the button
}

cfg.macroname = {
  show = false,
  fontsize = 10,
  pos1 = {a1 = "BOTTOMLEFT", x = 0, y = 0},
  pos2 = {a1 = "BOTTOMRIGHT", x = 0, y = 0} --important! two points are needed to make the macroname be inside of the button
}

cfg.itemcount = {
  show = true,
  fontsize = 12,
  pos1 = {a1 = "BOTTOMRIGHT", x = 0, y = 0}
}

cfg.cooldown = {
  spacing = 0
}

cfg.font = STANDARD_TEXT_FONT

--adjust the oneletter abbrev?
cfg.adjustOneletterAbbrev = true

--scale of the consolidated tooltip
cfg.consolidatedTooltipScale = 1.2

--combine buff and debuff frame - should buffs and debuffs be displayed in one single frame?
--if you disable this it is intended that you unlock the buff and debuffs and move them apart!
cfg.combineBuffsAndDebuffs = false

cfg.buffFrame = {
  pos = {a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = -15},
  gap = 35, --gap between buff and debuff rows
  userplaced = false, --want to place the bar somewhere else?
  rowSpacing = 10,
  colSpacing = 5,
  buttonsPerRow = 10,
  button = {
    size = 28
  },
  icon = {
    padding = -2
  },
  border = {
    texture = "Interface\\AddOns\\Scripts\\textures\\gloss",
    color = {r = 0.4, g = 0.35, b = 0.35},
    classcolored = false
  },
  background = {
    show = false, --show backdrop
    edgeFile = "Interface\\AddOns\\Scripts\\textures\\outer_shadow",
    color = {r = 0, g = 0, b = 0, a = 0.9},
    classcolored = true,
    inset = 6,
    padding = 4
  },
  duration = {
    font = STANDARD_TEXT_FONT,
    size = 10,
    pos = {a1 = "BOTTOM", x = 0, y = 0}
  },
  count = {
    font = STANDARD_TEXT_FONT,
    size = 11,
    pos = {a1 = "TOPRIGHT", x = 0, y = 0}
  }
}

cfg.debuffFrame = {
  pos = {a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -35, y = -100},
  gap = 10, --gap between buff and debuff rows
  userplaced = false, --want to place the bar somewhere else?
  rowSpacing = 10,
  colSpacing = 7,
  buttonsPerRow = 10,
  button = {
    size = 30
  },
  icon = {
    padding = -2
  },
  border = {
    texture = "Interface\\AddOns\\Scripts\\textures\\gloss_grey",
    color = {r = 0.4, g = 0.35, b = 0.35},
    classcolored = false
  },
  background = {
    show = false, --show backdrop
    edgeFile = "Interface\\AddOns\\Scripts\\textures\\outer_shadow",
    color = {r = 0, g = 0, b = 0, a = 0.9},
    classcolored = false,
    inset = 6,
    padding = 4
  },
  duration = {
    font = STANDARD_TEXT_FONT,
    size = 11,
    pos = {a1 = "BOTTOM", x = 0, y = 0}
  },
  count = {
    font = STANDARD_TEXT_FONT,
    size = 11,
    pos = {a1 = "TOPRIGHT", x = 0, y = 0}
  }
}

ns.cfg = cfg
