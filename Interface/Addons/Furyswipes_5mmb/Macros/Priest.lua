local _, Sequences = ...

------------------
----- Priest
------------------


Sequences['SINGLE_HOLY'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  You're holy, whattre you gonna do? Swing your staff, healgirl.
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
      },
	"/cast [nomod,nochanneling,@target,exists,harm] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['MULTI_HOLY'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Heal tank on alt
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
      },
	      "/cast [mod:alt,@"..FSMB_tank..",nodead] Lesser Heal",
		"/cast [nomod,nochanneling,@target,exists,harm] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['HOLY_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Holy nova, of course!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
      },
        "/cast [nomod] Holy Nova",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['HOLY_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Nothing but Trinket2
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

Sequences['HOLY_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Nothing here yet
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
Sequences['SHADOW_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
Smite when you are a lowbie
SWP every 30 clicks
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      LoopLimit=30,
      KeyPress={
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
        "/cast [nomod,@target,exists,harm] Shadow Word: Pain",
      },
        "/cast [nomod,@target,exists,harm] Smite",
	"/cast [nomod,nochanneling,@target,exists,harm] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SHADOW_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Heal tank on alt.
Smite when you are a lowbie
SWP every 30 clicks
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      LoopLimit=30,
      KeyPress={
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
		"/cast [mod:alt,@"..FSMB_tank..",nodead] Lesser Heal",
      },
      PreMacro={
        "/cast [nomod,@target,exists,harm] Shadow Word: Pain",
      },
        "/cast [nomod,@target,exists,harm] Smite",
	"/cast [nomod,nochanneling,@target,exists,harm] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SHADOW_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Holy nova, better speck it sucka!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
      },
      "/cast [nomod,@target,exists,harm] holy nova",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SHADOW_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Does nothing yet but Trinket2
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

Sequences['SHADOW_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=5,
  Talents = "",
  Help = [[
  Does nothing yet
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
