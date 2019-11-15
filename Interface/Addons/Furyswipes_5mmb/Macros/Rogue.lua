local _, Sequences = ...

------------------
----- Rogue
------------------

Sequences['COMBAT_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=4,
  Talents = "",
  Help = [[
  Castsequence of the normal rogue stuff.
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	      "/startattack [nomod]",
      },
      PreMacro={
      },
        "/castsequence [nomod] reset=combat/target Sinister Strike, Sinister Strike, Sinsiter Strike, Sinister Strike, Eviscerate",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['COMBAT_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=4,
  Talents = "",
  Help = [[
  Castsequence of the normal rogue stuff.
  Add Blade Flurry
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	      "/startattack [nomod]",
      },
      PreMacro={
	      "/cast Blade Flurry",
      },
        "/castsequence [nomod] reset=combat/target Sinister Strike, Sinister Strike, Sinsiter Strike, Sinister Strike, Eviscerate",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['COMBAT_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=4,
  Talents = "",
  Help = [[
  Castsequence of the normal rogue stuff.
  Add Blade Flurry
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	      "/startattack [nomod]",
      },
      PreMacro={
      },
        "/castsequence [nomod] reset=combat/target Sinister Strike, Sinister Strike, Sinsiter Strike, Sinister Strike, Eviscerate",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['COMBAT_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=4,
  Talents = "",
  Help = [[
  Does nothing yet but trinket 2
]],
  Default=1,
  MacroVersions = {
    [1] = {
	Combat=true,
	Trinket2=true,
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
      },
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['COMBAT_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=4,
  Talents = "",
  Help = [[
  Does nothing yet.
]],
  Default=1,
  MacroVersions = {
    [1] = {
	Combat=true,
      StepFunction = "Priority",
      KeyPress={
	      "/stopattack [mod:alt]",
      },
      PreMacro={
      },
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
