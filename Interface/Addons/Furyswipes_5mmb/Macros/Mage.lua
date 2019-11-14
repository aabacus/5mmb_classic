local _, Sequences = ...

------------------
----- Mage
------------------

Sequences['FROST_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
Frostbolt or fireball if you don't have fb.
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	"/startattack [nomod]",
	"/stopattack [mod:alt]",
      },
      PreMacro={
      },
        "/cast [nomod] Frostbolt",
	"/cast [nomod,nochanneling] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FROST_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Blizzard, fill with FB
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	"/startattack [nomod]",
	"/stopattack [mod:alt]",
      },
      PreMacro={
      },
        "/cast [nomod,nochanneling] Frost Nova",
        "/cast [nomod,@player] Blizzard",
	"/cast [nomod,nochanneling] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FROST_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Blizzard, fill with FB
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
	"/startattack [nomod]",
	"/stopattack [mod:alt]",
      },
      PreMacro={
      },
        "/cast [nomod,nochanneling] Frost Nova",
        "/cast [nomod,@player,nochanneling] Blizzard",
	"/cast [nomod,nochanneling] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FROST_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Blizzard, fill with FB
]],
  Default=1,
  MacroVersions = {
    [1] = {
	Combat=true,
	Trinket2=true,
      StepFunction = "Priority",
      KeyPress={
	"/startattack [nomod]",
	"/stopattack [mod:alt]",
      },
      PreMacro={
      },
        "/cast [nomod] Arcane Power",
	"/cast [nomod] Presence of Mind",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['FROST_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
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
Sequences['FIRE_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Fire shit.
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
      },
        "/cast [nomod] Fire Blast",
        "/cast [nomod] Fireball",
	"/cast [nomod,nochanneling] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FIRE_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Fire them up!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
      },
	"/cast [nomod] Fire Blast",
	"/cast [nomod] Fireball",
	"/cast [nomod,nochanneling] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FIRE_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Blaze it up.
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Priority",
      KeyPress={
      },
      PreMacro={
      },
        "/cast [nomod] Blastwave",
        "/cast [nomod,@player] Flamestrike",
        "/cast [nomod] Arcane Explosion",
	"/cast [nomod,nochanneling] !Shoot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FIRE_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Turbo it up
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
        "/cast [nomod] Arcane Power",
	"/cast [nomod] Presence of Mind",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['FIRE_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=8,
  Talents = "",
  Help = [[
  Nothin here yet
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
