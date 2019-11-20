local _, Sequences = ...

------------------
----- Druid
------------------
Sequences['BEAR_TANK_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cast [nomod,@target,exists] Charge",
	"/cast [combat,@target,exists] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod,@target,exists]",
      },
      PreMacro={
      },
        "/cast [mod:alt] Growl",
        "/cast [mod:ctrl] Demoralizing Roar",
        "/cast [nomod] maul",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BEAR_TANK_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
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
Sequences['BEAR_TANK_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Priority",
      KeyPress={
	"/cast [nomod,@target,exists] Charge",
	"/cast [combat,@target,exists] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod,@target,exists]",
      },
      PreMacro={
      },
        "/cast [nomod] Swipe",
        "/cast [nomod] maul",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BEAR_TANK_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cancelform [mod:ctrl]",
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
Sequences['BEAR_TANK_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cast [nomod,@target,exists] Charge",
	"/cast [combat,@target,exists] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod,@target,exists]",
      },
      PreMacro={
      },
        "/cast [nomod] Swipe",
        "/cast [nomod] Swipe",
        "/cast [nomod] Swipe",
        "/cast [nomod] Demoralizing Roar",
        "/cast [nomod] maul",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FERAL_SINGLE'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cast [nostance:2] Cat Form",
	"/cast [stealth] Pounce",
	"/cast [mod:alt,stealth] Ravage",
	"/Startattack [nomod,@target,exists,harm]",
	"/cast [mod:ctrl] Prowl",
	"/cast [mod:alt,nostealth] cower",
      },
      PreMacro={
      },
      "/castsequence [nomod,combat,nostealth] reset=target  Faerie Fire, null",
	"/castsequence [nomod,combat,nostealth] reset=target/combat  Tiger's Fury, Rake, Claw, Claw, Claw, Rip",
	"/cast [nomod,combat,nostealth] Shred",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FERAL_MULTI'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      LoopLimit=20,
      KeyPress={
	"/cast [nostance:2] Cat Form",
	"/cast [stealth] Ravage",
	"/Startattack [nomod,@target,exists,harm]",
	"/cast [mod:alt,nostealth] cower",
      },
      PreMacro={
      },
        "/castsequence [nomod,combat,nostealth] reset=target  Faerie Fire, null",
	"/castsequence [nomod,combat,nostealth] reset=target/combat  Tiger's Fury, Rake, Claw, Claw, Claw, Rip",
	"/cast [nomod,combat,nostealth] Shred",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FERAL_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	      "/stopattack [mod:alt]",
	      "/cast [mod:alt,nostealth] cower",
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
Sequences['FERAL_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cast [nomod,@target,exists] Charge",
	"/cast [combat,@target,exists] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod,@target,exists]",
      },
      PreMacro={
      },
        "/cast [nomod] Swipe",
        "/cast [nomod] Swipe",
        "/cast [nomod] Swipe",
        "/cast [nomod] maul",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FERAL_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cancelform [mod:ctrl]",
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
Sequences['RESTODRU_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[
  Notthing here yet. Stop attack on alt
  ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	      "/startattack [nomod]",
      },
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['RESTODRU_SINGLE'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/Startattack [nomod]",
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
Sequences['RESTODRU_MULTI'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/Startattack [nomod]",
	"/stopattack [mod:alt]",
	"/cast [mod:alt,@"..FSMB_tank.."] healing touch",
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
Sequences['RESTODRU_AOE'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[
  Heal strongestaoe?
  ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/Startattack [nomod]",
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
Sequences['RESTODRU_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[
  Just trinket2 for now
  ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cancelform [mod:ctrl]",
	"/cast [mod:ctrl,nostance,nochanneling] Travel Form",
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
Sequences['BOOMKIN_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[
  Notthing here yet. Stop attack on alt
  ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
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
Sequences['BOOMKIN_SINGLE'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/Startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
	"/cast [nostance:5] Moonkin Form",
	"/cast [mod:ctrl] Entangling Roots", 
      },
      PreMacro={
      },
      "/castsequence [nomod,nochanneling] reset=combat/target Faerie Fire, null",
      "/castsequence [nomod,nochanneling] reset=combat moonfire,starfire,starfire",
      "/cast [nomod,nochanneling] wrath",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BOOMKIN_MULTI'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?," ,
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/Startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
	"/cast [nostance:5] Moonkin Form",
	"/cast [mod:alt,@"..FSMB_tank.."] healing touch",
      },
      PreMacro={
      },
      "/castsequence [nomod,nochanneling] reset=combat/target Faerie Fire, null",
      "/castsequence [nomod,nochanneling] reset=combat moonfire,starfire,starfire",
      "/cast [nomod,nochanneling] wrath",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BOOMKIN_AOE'] = {
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[
  Heal strongestaoe?
  ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
      "/cast [nomod,nochanneling] hurricane",
      "/castsequence [nomod,nochanneling] reset=combat moonfire,starfire,starfire",
      "/cast [nomod] wrath",
      --"/castsequence [nomod,@"..FSMB_strongestaoe.."] reset=combat/target renewal,regrowth,null",
      --"/cast [nomod,@"..FSMB_strongestaoe.."] healing touch",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BOOMKIN_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=11,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[
  Just trinket2 for now
  ]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
	"/cancelform [mod:ctrl]",
	"/cast [mod:ctrl,nostance,nochanneling] Travel Form",
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
