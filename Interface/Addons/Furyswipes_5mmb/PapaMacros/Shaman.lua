local _, Sequences = ...

------------------
----- Shaman
------------------
Sequences['Papa_Elem_ST'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Shamanmaw@Draka",
  SpecID=262,
  Talents = "3111332",
  Help = [[alt to reapply Flame Shock
ctrl for  Earth Shock at 100
shift for Totem Mastery]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=3,
      KeyPress={
        "/cast [mod:alt] Flame Shock",
        "/cast [mod:ctrl] Earth Shock",
        "/cast [mod:shift] Totem Mastery",
        "/castsequence  reset=target/combat  Totem Mastery, Flame Shock, nul",
      },
      PreMacro={
        "/cast Lava Burst",
      },
        "/castrandom Chain Lightning,Lightning Bolt,Lava Burst,Elemental Blast",
        "/cast [combat] Fire Elemental",
        "/cast Lightning Bolt",
        "/cast Elemental Blast",
        "/castsequence [combat] Stormkeeper",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_Elem_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Shamanmaw@Draka",
  SpecID=262,
  Talents = "3111332",
  Help = [[hold ctrl and put mouse over pack of mobs for earthquake at 50 Maelstrom
hold alt for flame shock if needed
hold shift for Totem Mastery if needed]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=3,
      KeyPress={
        "/cast [mod:alt] Flame Shock",
        "/cast [mod:ctrl,@cursor] Earthquake",
        "/cast [mod:shift] Totem Mastery",
        "/castsequence  reset=target/combat  Totem Mastery, nul",
      },
      PreMacro={
        "/cast Lava Burst",
      },
        "/castrandom Chain Lightning,Elemental Blast,Lava Burst",
        "/cast Chain Lightning",
        "/cast Elemental Blast",
        "/castsequence [combat] Stormkeeper",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_Enhance'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Shamanmaw@Draka",
  SpecID=263,
  Talents = "3112113",
  Help = [[Alt for Feral Spirit if it doesnt go off
ctrl for Earthen Spike
shift for Rockbiter
]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      LoopLimit=4,
      KeyPress={
        "/cast [mod:alt] Feral Spirit",
        "/cast [mod:ctrl] Earthen Spike",
        "/cast [mod:shift] Rockbiter",
        "/targetenemy [noharm][dead]",
        "/cast Doom Winds",
      },
      PreMacro={
        "/cast Stormstrike",
      },
        "/cast Flametongue",
        "/cast Feral Spirit",
        "/cast Rockbiter",
        "/cast Rockbiter",
        "/cast Stormstrike",
        "/cast Earthen Spike",
        "/cast Stormstrike",
        "/cast Crash Lightning",
        "/cast Rockbiter",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Lava Lash",
        "/cast Rockbiter",
        "/cast Rockbiter",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Stormstrike",
        "/cast Crash Lightning",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_Enhance_beta'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Shamanmaw@Draka",
  SpecID=263,
  Talents = "3112113",
  Help = [[Alt for Feral Spirit
ctrl for Lava Lash
shift for Flametongue
]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      LoopLimit=4,
      KeyPress={
        "/cast [mod:alt] Feral Spirit",
        "/cast [mod:ctrl] Lava Lash",
        "/cast [mod:shift] Flametongue",
        "/targetenemy [noharm][dead]",
        "/cast Doom Winds",
      },
      PreMacro={
        "/cast Stormstrike",
      },
        "/castrandom Rockbiter,Stormstrike,Crash Lightning",
        "/cast Rockbiter",
        "/cast Earthen Spike",
        "/castsequence  reset=1/target  Stormstrike",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}