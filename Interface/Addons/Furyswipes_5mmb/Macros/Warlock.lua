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
  Default=2,
  PVP=2,
  Party=1,
  Dungeon=1,
  Raid=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	"/startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
	"/petattack [nomod,@target,exists,harm]",
	"/cast [mod:ctrl] Life Tap",
      },
      PreMacro={
      },
	"/cast [nomod] Shadow Bolt",
	"/cast [nomod] Shadow Bolt",
	"/cast [nomod] Life Tap",
	"/cast [nomod,nochanneling] Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
    [2] = {
      StepFunction = "Priority",
      KeyPress={
	"/startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
	"/petattack [nomod,@target,exists,harm]",
	"/cast [mod:ctrl] Life Tap",
      },
      PreMacro={
      },
	"/cast [nomod] Shadow Bolt",
	"/cast [nomod] Shadow Bolt",
	"/cast [nomod,nochanneling] Shoot",
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
	"/startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
	"/petattack [nomod,@target,exists,harm]",
      },
      PreMacro={
      },
	"/cast [nomod] Shadow Bolt",
	"/cast [nomod] Shadow Bolt",
	"/cast [nomod] Life Tap",
	"/cast [nomod,nochanneling] Shoot",
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
      StepFunction = "Priority",
      KeyPress={
	      "/petattack [nomod,@target,exists,harm]",
      },
      PreMacro={
      },
        "/cast [nomod,nochanneling,@player] Rain of Fire",
	"/cast [nomod,nochanneling,@player] Rain of Fire",
	"/cast [nomod,nochanneling] Life Tap",
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
	      "/stopattack [mod:alt]",
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
