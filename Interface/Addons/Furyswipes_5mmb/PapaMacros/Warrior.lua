local _, Sequences = ...
------------------
----- Warrior
------------------

-- Fury (specID = 72)

Sequences['Papa_fury_old'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Arcoe@Draka",
  SpecID=72,
  Talents = "1311232",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=true,
      Trinket2=false,
      Head=true,
      Neck=true,
      Belt=true,
      Ring1=true,
      Ring2=true,
      StepFunction = "Priority",
      KeyPress={
        "/cast Charge",
        "/cast Berserker Rage",
        "/cast Battle Cry",
      },
      PreMacro={
      },
        "/cast Execute",
        "/cast Odyn's Fury",
        "/castsequence  reset=1  Whirlwind, Bloodthirst",
        "/cast Raging Blow",
        "/castsequence  reset=1  Whirlwind, Rampage",
        "/cast Execute",
        "/castsequence  reset=1  Whirlwind, Bloodthirst",
        "/cast Raging Blow",
        "/castsequence  reset=1  Whirlwind, Rampage",
        "/cast Rampage",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_fury_st'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Arcoe@Draka",
  SpecID=72,
  Talents = "1311232",
  Help = [[Beta
Hold alt for Enraged Regeneration
Hold ctrl for Commanding Shout
]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=true,
      Trinket2=false,
      Head=true,
      Neck=true,
      Belt=true,
      Ring1=true,
      Ring2=true,
      StepFunction = "Priority",
      KeyPress={
        "/cast Charge",
        "/cast [combat] Berserker Rage",
        "/cast [combat] Battle Cry",
        "/cast [mod:alt] Enraged Regeneration",
        "/cast [mod:ctrl] Commanding Shout",
      },
      PreMacro={
      },
        "/castsequence Furious Slash, Whirlwind, Bloodthirst",
        "/cast Raging Blow",
        "/cast Odyn's Fury",
        "/cast Rampage",
        "/cast Execute",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_fury_aoe'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Arcoe@Draka",
  SpecID=72,
  Talents = "1311232",
  Help = [[Hold alt for Enraged Regeneration
Hold ctrl for Commanding Shout
]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=true,
      Trinket2=false,
      Head=true,
      Neck=true,
      Belt=true,
      Ring1=true,
      Ring2=true,
      StepFunction = "Priority",
      KeyPress={
        "/cast Charge",
        "/cast [combat] Berserker Rage",
        "/cast [combat] Battle Cry",
        "/cast [mod:alt] Enraged Regeneration",
        "/cast [mod:ctrl] Commanding Shout",
      },
      PreMacro={
      },
        "/cast Execute",
        "/cast Odyn's Fury",
        "/castsequence  reset=1  Whirlwind, Bloodthirst",
        "/cast Raging Blow",
        "/castsequence  reset=1  Whirlwind, Rampage",
        "/cast Execute",
        "/castsequence  reset=1  Whirlwind, Bloodthirst",
        "/cast Raging Blow",
        "/castsequence  reset=1  Whirlwind, Rampage",
        "/cast Rampage",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_prot_warrior'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Arcoe@Draka",
  SpecID=73,
  Talents = "3223112",
  Help = [[Hold alt for Ignore Pain
Hold ctrl for Revenge]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/cast Battle Cry",
        "/cast Intercept",
        "/cast [mod:alt] Ignore Pain",
        "/cast [mod:ctrl] Revenge",
      },
      PreMacro={
      },
        "/cast Charge",
        "/cast Shield Slam",
        "/cast Thunder Clap",
        "/cast Shield Slam",
        "/cast Thunder Clap",
        "/cast Shield Slam",
        "/cast Shield Slam",
        "/cast Revenge",
        "/cast Neltharion's Fury",
        "/cast Shield Slam",
        "/cast Thunder Clap",
        "/cast Shield Block",
        "/cast Thunder Clap",
        "/cast Shield Slam",
        "/cast Thunder Clap",
        "/cast Shield Block",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['papa_arms'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Arcoe@Draka",
  SpecID=71,
  Talents = "2321322",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [combat] Charge",
        "/cast [combat] Battle Cry",
        "/cast [combat] Berserker Rage",
        "/cast [mod:alt] Bladestorm",
      },
      PreMacro={
      },
        "/cast Colossus Smash",
        "/cast Warbreaker",
        "/cast Battle Cry",
        "/cast Victory Rush",
        "/cast Mortal Strike",
        "/cast Overpower",
        "/cast Slam",
        "/cast Execute",
        "/castsequence  reset=5  Cleave, Whirlwind",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

