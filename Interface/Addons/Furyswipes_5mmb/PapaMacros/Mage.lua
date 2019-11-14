local _, Sequences = ...

------------------
----- Mage
------------------

Sequences['Papa_Frost'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Zalvana@Draka",
  SpecID=64,
  Talents = "3333122",
  Help = [[BETA
Hold alt for Ice lance when proc active
Hold control for Flurry
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/cast [nopet,nomod] Summon Water Elemental",
        "/cast [combat] Icy Veins",
        "/cast [mod:alt] Ice Lance",
        "/cast [mod:shift,@cursor] Blizzard",
        "/cast [mod:ctrl] Flurry",
        "/castsequence  reset=target/combat  Ice Barrier, nul",
      },
      PreMacro={
      },
        "/cast [nochanneling] Frostbolt",
        "/cast [nochanneling] Ebonbolt",
        "/cast [nochanneling] Frozen Orb",
        "/cast [nochanneling] Glacial Spike",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_Fire'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Zalvana@Draka",
  SpecID=63,
  Talents = "2132113",
  Help = [[Hold alt for Single target
Hold ctrl and put mouse over mobs for aoe
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=3,
      KeyPress={
        "/cast [combat] Combustion",
        "/cast [mod:ctrl,@cursor] Flamestrike",
        "/cast [mod:alt] Pyroblast",
      },
      PreMacro={
        "/cast Fire Blast",
      },
        "/cast Living Bomb",
        "/cast Fire Blast",
        "/cast Dragon's Breath",
        "/cast Fireball",
        "/cast [combat] Phoenix's Flames",
        "/cast [combat] Cinderstorm",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['AAoe'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Zalvana@Draka",
  SpecID=62,
  Talents = "2122131",
  Help = [[Aoe Arcane 
Hold ctrl for mana
Hold alt for arcane missles]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/cast [combat] Arcane Power",
        "/cast [combat] Charged Up",
        "/cast [mod:alt] Arcane Missiles",
        "/cast [mod:ctrl] Evocation",
      },
      PreMacro={
      },
        "/castsequence [nochanneling] Arcane Explosion, Arcane Explosion, Arcane Explosion, Arcane Explosion, Arcane Barrage",
        "/cast Mark of Aluneth",
        "/cast Rune of Power",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['ASt'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Zalvana@Draka",
  SpecID=62,
  Talents = "2122131",
  Help = [[Beta
Hold alt for Arcane Missles
Hold ctrl for Mana
Single target Arcane
]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [combat] Arcane Power",
        "/cast [combat] Charged Up",
        "/cast [combat] Presence of Mind",
        "/cast [mod:alt] Arcane Missiles",
        "/cast [mod:ctrl] Evocation",
      },
      PreMacro={
      },
        "/castsequence [nochanneling] Arcane Blast, Arcane Blast, Arcane Blast, Arcane Blast",
        "/cast Mark of Aluneth",
        "/cast Prismatic Barrier",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

