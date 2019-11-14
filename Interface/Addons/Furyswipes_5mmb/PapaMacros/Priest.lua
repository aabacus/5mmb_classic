local _, Sequences = ...

------------------
----- Priest
------------------

Sequences['Disc_dps'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Webus@Draka",
  SpecID=256,
  Talents = "11?,?,?,?,?,",
  Help = [[BETA]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Shadow Word: Pain",
      },
      PreMacro={
      },
        "/cast [nochanneling] Penance",
        "/cast [nochanneling] Smite",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Disc_healz'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Webus@Draka",
  SpecID=256,
  Talents = "11?,?,?,?,?,",
  Help = [[BETA]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/cast [mod:alt,@mouseover] Power Word: Shield",
        "/cast [mod:ctrl,@mouseover] Plea",
      },
      PreMacro={
      },
        "/cast [@mouseover,nochanneling] Penance",
        "/cast [@mouseover,nochanneling] Shadow Mend",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Feather_macro'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Webus@Draka",
  SpecID=257,
  Talents = "31?,?,?,?,?,",
  Help = [[Sanic]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
        "/cast [mod:alt,@mouseover] Angelic Feather",
        "/cast [@player] Angelic Feather",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Holy_dps'] = {
-- This Sequence was exported from GSE 2.2.00.
  Author="Webus@Draka",
  SpecID=257,
  Talents = "12?,?,?,?,?,",
  Help = [[BETA]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/cast [mod:alt] Holy Nova",
      },
      PreMacro={
      },
        "/cast Holy Fire",
        "/cast Smite",
        "/cast Holy Word: Chastise",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Holy_heals'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Webus@Draka",
  SpecID=257,
  Talents = "12?,?,?,?,?,",
  Help = [[Optional Change target nearest player keybind to a single key to spam renew on players
alt for Holy Word: Sanctify
Ctrl for Holy Word: Serenity]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Renew, nul",
        "/cast [mod:ctrl,@mouseover] Holy Word: Serenity",
        "/cast [mod:alt] Holy Word: Sanctify",
      },
      PreMacro={
      },
        "/cast [@mouseover,nochanneling] Prayer of Healing",
        "/cast [@mouseover,nochanneling] Heal",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Shader_ST'] = {
-- This Sequence was exported from GSE 2.2.03.
  Author="Webus@Draka",
  SpecID=258,
  Talents = "1212231",
  Help = [[Boss/ST
Alt for Shadowfiend
ctrl for Mind Bomb
shift to reapply Shadow Word: Pain]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=7,
      KeyPress={
        "/cast [form:0] Shadowform",
        "/cast [mod:alt] Shadowfiend",
        "/cast [mod:ctrl] Mind Bomb",
        "/cast [mod:shift] Shadow Word: Pain",
        "/castsequence  reset=target/combat  Shadow Word: Pain, nul",
      },
      PreMacro={
        "/cast Mind Blast",
      },
        "/cast [nochanneling] Void Eruption",
        "/cast [nochanneling] Mind Blast",
        "/cast Shadow Word: Death",
        "/cast [nochanneling] Mind Blast",
        "/cast [nochanneling] Void Eruption",
        "/cast [nochanneling] Mind Flay",
        "/castsequence [nochanneling] Vampiric Touch, Mind Blast",
        "/cast [nochanneling] Mind Blast",
        "/cast [nochanneling] Void Eruption",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}


Sequences['Shader_Aoe'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Webus@Draka",
  SpecID=258,
  Talents = "1212231",
  Help = [[Mind sear aoe
ctrl for Shadow Word: Pain
alt for Vampiric Touch
shift for Void Eruption
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Shadow Word: Pain, nul",
        "/cast [mod:ctrl] Shadow Word: Pain",
        "/cast [mod:alt] Vampiric Touch",
        "/cast [mod:shift] Void Eruption",
      },
      PreMacro={
      },
        "/cast Mind Flay",
        "/cast Shadow Word: Death",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}