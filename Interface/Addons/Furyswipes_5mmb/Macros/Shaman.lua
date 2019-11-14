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
	      "/startattack [nomod,@target,exists,harm]",
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
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
	      "/cast [mod:alt,@"..FSMB_tank..",nodead] Healing Wave",
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
	"/cast [@"..FSMB_strongestaoe.."] chain heal",
	"/cast [@"..FSMB_strongestaoe.."] healing wave",
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
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod,@target,exists,harm] Flame Shock",
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
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod,@target,exists,harm] Flame Shock",
      },
      PreMacro={
      },
	      "/cast [mod:alt,@"..FSMB_tank..",nodead] Healing Wave",
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
	"/cast [@"..FSMB_strongestaoe..",nodead] chain heal",
	"/cast [@"..FSMB_strongestaoe..",nodead] healing wave",
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
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod,@target,exists,harm] Flame Shock",
      },
      PreMacro={
      },
      "/cast [nomod,@target,exists,harm] lightning bolt",
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
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
	      "/cast [nomod,@target,exists,harm] Flame Shock",
      },
      PreMacro={
      },
	"/cast [mod:alt,@"..FSMB_tank..",nodead] Healing Wave",
      	"/cast [nomod,@target,exists,harm] Chain lightning",
      	"/cast [nomod,@target,exists,harm] Lightning Bolt",
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
	"/castsequence [nomod] reset=combat Fire Nova Totem, Stoneskin Totem, null",
	"/cast [nomod] chain lightning",
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

