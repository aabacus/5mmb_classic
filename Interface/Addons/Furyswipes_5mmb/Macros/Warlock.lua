local _, Sequences = ...

------------------
----- Warlock
------------------

Sequences['DESTRO_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=9,
  Talents = "",
  Help = [[
  Let's add corruption later maybe?
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
        "/cast [nomod,@target,exists,harm] Shadow Bolt", 
	"/cast [nomod,nochanneling,@target,exists,harm] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['DESTRO_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=9,
  Talents = "",
  Help = [[
  Let's add corruption later maybe?
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
	      "/startattack [nomod,@target,exists,harm]",
	      "/stopattack [mod:alt]",
      },
        "/cast [nomod,@target,exists,harm] Shadow Bolt", 
	"/cast [nomod,nochanneling,@target,exists,harm] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['DESTRO_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=9,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	      "/cast [nomod,nochanneling] Hellfire",
      },
      PreMacro={
      },
        "/cast [nochanneling] Shadow Bolt",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['DESTRO_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=9,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
	Combat=true,
	Trinket2=true,
      StepFunction = "Sequential",
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

Sequences['DESTRO_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=9,
  Talents = "",
  Help = [[
]],
  Default=1,
  MacroVersions = {
    [1] = {
	Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	      "/stopattack [mod:alt,@target,exists,harm]",
	      "/petfollow [mod:alt]",
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
