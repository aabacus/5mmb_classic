local _, Sequences = ...

------------------
----- Shaman
------------------
Sequences['RESTOSHAM_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
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

Sequences['RESTOSHAM_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
	      "/startattack [nomod]",
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

Sequences['RESTOSHAM_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
	      "/cast [mod:alt,@"..FSMB_tank.."] Healing Wave",
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
Sequences['RESTOSHAM_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
      },
	"/castsequence reset=combat Fire Nova Totem, Stoneskin Totem, null",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['RESTOSHAM_TOT'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
      },
      PreMacro={
      },
	"/castsequence reset=60/combat strength of earth totem, fire nova totem,null",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['ENH_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
  Just stops attack on alt.
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
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

Sequences['ENH_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
  Flame Shock every 30 clicks
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=20,
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod] Flame Shock",
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

Sequences['ENH_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod] Flame Shock",
      },
      PreMacro={
      },
	      "/cast [mod:alt,@"..FSMB_tank.."] Healing Wave",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ENH_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
      },
      PreMacro={
      },
	"/castsequence reset=combat Fire Nova Totem, Stoneskin Totem, null",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ENH_TOT'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
      },
      PreMacro={
      },
	"/castsequence reset=60/combat strength of earth totem, fire nova totem,null",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['ELE_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
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

Sequences['ELE_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=20,
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod] Flame Shock",
      },
      PreMacro={
      },
      "/cast [nomod] lightning bolt",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['ELE_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod] Flame Shock",
      },
      PreMacro={
      },
	"/cast [mod:alt,@"..FSMB_tank.."] Healing Wave",
      	"/cast [nomod] Chain lightning",
      	"/cast [nomod] Lightning Bolt",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ELE_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
      },
      PreMacro={
      },
	"/castsequence reset=combat Fire Nova Totem, Stoneskin Totem, null",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ELE_TOT'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=7,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      LoopLimit=1,
      KeyPress={
      },
      PreMacro={
      },
	"/castsequence reset=60/combat strength of earth totem, fire nova totem,null",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

