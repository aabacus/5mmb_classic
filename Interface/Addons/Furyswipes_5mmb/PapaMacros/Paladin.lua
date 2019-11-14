local _, Sequences = ...

------------------
----- Paladin
------------------

-- Protection (specID = 104)

Sequences['Prot'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Pallyman@Draka",
  SpecID=66,
  Talents = "21?,?,?,?,?,",
  Help = [[BETA
Hold alt for Avenger's Shield
Hold ctrl for Hand of Reckoning]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast Divine Protection",
        "/cast [mod:alt] Avenger's Shield",
        "/cast [mod:ctrl] Hand of Reckoning",
      },
      PreMacro={
        "/targetenemy [noharm][dead]",
      },
        "/castsequence Avenger's Shield, Blessed Hammer",
        "/castsequence Avenger's Shield, Consecration, Shield of the Righteous",
        "/cast Judgment",
        "/cast Light of the Protector",
        "/cast Blessed Hammer",
        "/cast Shield of the Righteous",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['RET_ST'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Pallyman@Draka",
  SpecID=70,
  Talents = "1333221",
  Help = [[BETA
most likely to be changed at max ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [mod:alt] Templar's Verdict",
        "/cast [mod:ctrl] Judgment",
      },
      PreMacro={
      },
        "/cast Templar's Verdict",
        "/castsequence Crusader Strike, Crusader Strike",
        "/cast Blade of Justice",
        "/cast Crusader Strike",
        "/cast Templar's Verdict",
        "/cast Judgment",
        "/cast Templar's Verdict",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['RET_AOE'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Pallyman@Draka",
  SpecID=70,
  Talents = "1333221",
  Help = [[BETA
most likely to be changed at max ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [mod:alt] Divine Storm",
        "/cast [mod:ctrl] Judgment",
      },
      PreMacro={
      },
        "/cast Divine Storm",
        "/castsequence Crusader Strike, Crusader Strike",
        "/cast Blade of Justice",
        "/cast Crusader Strike",
        "/cast Divine Storm",
        "/cast Judgment",
        "/cast Divine Storm",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Holy_heals'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Pallyman@Draka",
  SpecID=65,
  Talents = "32?,?,?,?,?,",
  Help = [[Extreme BETA
Hold ctrl for beacon on tank
Hold alt for flash]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/cast [mod:alt,@mouseover] Flash of Light",
        "/cast [mod:ctrl,@mouseover] Beacon of Light",
      },
      PreMacro={
      },
        "/cast [@mouseover] Holy Light",
        "/cast [@mouseover] Holy Shock",
        "/cast Light of Dawn",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Holy_dps'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Pallyman@Draka",
  SpecID=65,
  Talents = "32?,?,?,?,?,",
  Help = [[BETA]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
        "/cast [mod:alt] Divine Shield",
        "/cast [mod:ctrl] Hammer of Justice",
      },
      PreMacro={
      },
        "/cast Consecration",
        "/cast Crusader Strike",
        "/cast Holy Shock",
        "/cast Light of Dawn",
        "/cast Judgment",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}


