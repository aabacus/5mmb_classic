local _, Sequences = ...

------------------
----- Druid
------------------
Sequences['Papa_Balance'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Tyon@Draka",
  SpecID=102,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[Beta]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [noform:4] Moonkin Form",
        "/cast [mod:alt] Lunar Strike",
        "/castsequence  reset=target/combat  Moonfire, Sunfire, null",
      },
      PreMacro={
      },
        "/castsequence [nochanneling] Solar Wrath, Lunar Strike",
        "/cast Starsurge",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Papa_bear'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Tyon@Draka",
  SpecID=104,
  Talents = "1?,?,?,?,?,?,",
  Help = [[Very Early]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [noform:1] Bear Form",
        "/cast [mod:alt] Ironfur",
        "/castsequence  reset=target/combat  Moonfire, nul",
      },
      PreMacro={
      },
        "/castsequence Mangle, Thrash",
        "/cast Maul",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

