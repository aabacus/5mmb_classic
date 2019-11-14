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
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [combat,@target,exists,harm] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod,@target,exists,harm]",
      },
      PreMacro={
      },
        "/cast [mod:alt] Growl",
        "/cast [mod:ctrl] Demoralizing Roar",
        "/cast [nomod,@target,exists,harm] maul",
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
      StepFunction = "Sequential",
      KeyPress={
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [combat,@target,exists,harm] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod,@target,exists,harm]",
      },
      PreMacro={
      },
        "/cast [nomod,@target,exists,harm] Swipe",
        "/cast [mod:ctrl] Demoralizing Roar",
        "/cast [nomod,@target,exists,harm] maul",
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
	"/cast [mod:ctrl,stance:1] bear form",
	"/cast [mod:ctrl,stance:2] cat form",
	"/cast [mod:ctrl,stance:3] travel form",
	"/cast [mod:ctrl,stance:4] aquatic form",
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
	"/cast [combat,@target,exists] Enrage",
	"/cast [nostance:1] Bear Form",
	"/Startattack [nomod]",
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
      LoopLimit=20,
      KeyPress={
	"/cast [nostance:2] Cat Form",
        "/cast [stealth,@target,exists,harm] Pounce",
        "/cast [mod:alt,stealth,@target,exists,harm] Ravage",
	"/Startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
        "/cast [mod:ctrl,@target,exists,harm] Ferocious Bite",
        "/cast [nomod,@target,exists,harm] Tiger's Fury",
      },
      PreMacro={
	"/castsequence [nomod,@target,exists,harm] reset=target Faerie Fire,null",
        "/cast [nomod,@target,exists,harm] Rake",
      },
        "/cast [nomod,@target,exists,harm] Shred",
        "/cast [nomod,@target,exists,harm] Claw",
      PostMacro={
        "/cast [nomod,@target,exists,harm] Rip",
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
        "/cast [stealth,@target,exists,harm] Pounce",
        "/cast [mod:alt,stealth,@target,exists,harm] Ravage",
	"/Startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
        "/cast [mod:ctrl,@target,exists,harm] Ferocious Bite",
        "/cast [nomod,@target,exists,harm] Tiger's Fury",
      },
      PreMacro={
	"/castsequence [nomod,@target,exists,harm] reset=target Faerie Fire,null",
        "/cast [nomod,@target,exists,harm] Rake",
      },
        "/cast [nomod,@target,exists,harm] Shred",
        "/cast [nomod,@target,exists,harm] Claw",
      PostMacro={
        "/cast [nomod,@target,exists,harm] Rip",
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
        "/cast [stealth] Pounce",
        "/cast [mod:alt,stealth] Ravage",
	"/Startattack [nomod]",
        "/cast [nomod] Tiger's Fury",
      },
      PreMacro={
	"/castsequence [nomod] reset=target Faerie Fire,null",
        "/cast [nomod] Rake",
      },
        "/cast [nomod] Shred",
        "/cast [nomod] Claw",
      PostMacro={
        "/cast [nomod] Rip",
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
	"/cast [mod:ctrl,stance:1] bear form",
	"/cast [mod:ctrl,stance:2] cat form",
	"/cast [mod:ctrl,stance:3] travel form",
	"/cast [mod:ctrl,stance:4] aquatic form",
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
	      "/startattack [nomod,@target,exists,harm]",
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
	"/Startattack [nomod,@target,exists,harm]",
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
	"/Startattack [nomod,@target,exists,harm]",
	"/stopattack [mod:alt]",
	"/cast [mod:alt,@"..FSMB_tank..",nodead] healing touch",
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
      "/castsequence [nomod,@"..FSMB_strongestaoe..",nodead] reset=combat/target renewal,regrowth,null",
      "/cast [nomod,@"..FSMB_strongestaoe..",nodead] healing touch",
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
	"/cast [mod:ctrl,stance:1] bear form",
	"/cast [mod:ctrl,stance:2] cat form",
	"/cast [mod:ctrl,stance:3] travel form",
	"/cast [mod:ctrl,stance:4] aquatic form",
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
      },
      PreMacro={
      },
      "/castsequence [nomod,@target,exists,harm] reset=combat moonfire,starfire,,,",
      "/cast [nomod,@target,exists,harm] wrath",
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
	"/cast [mod:alt,@"..FSMB_tank..",nodead] healing touch",
      },
      PreMacro={
      },
      "/cast [nomod,@target,exists,harm] wrath",
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
      "/castsequence [nomod,@"..FSMB_strongestaoe..",nodead] reset=combat/target renewal,regrowth,null",
      "/cast [nomod,@"..FSMB_strongestaoe..",nodead] healing touch",
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
	"/cast [mod:ctrl,stance:1] bear form",
	"/cast [mod:ctrl,stance:2] cat form",
	"/cast [mod:ctrl,stance:3] travel form",
	"/cast [mod:ctrl,stance:4] aquatic form",
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
Sequences['DRINK'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=0,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     Head=false,
     Neck=false,
     Belt=false,
     Ring1=false,
     Ring2=false,
     Trinket1=false,
     Trinket2=false,
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
	"/use Conjured Crystal Water",
	"/use Conjured Sparkling Water",
	"/use Conjured Mineral Water",
	"/use Conjured Spring Water",
	"/use Conjured Purified Water",
	"/use Conjured Fresh Water",
	"/use Conjured Water",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['HEALPOT'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=0,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     Head=false,
     Neck=false,
     Belt=false,
     Ring1=false,
     Ring2=false,
     Trinket1=false,
     Trinket2=false,
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
	"/cancelaura bear form",
	"/cancelaura cat form",
	"/cancelaura travel form",
	"/cancelaura aquatic form",
	"/use Healthstone",
	"/use Major Healing Potion",
	"/use Combat Healing Potion",
	"/use Superior Healing Potion",
	"/use Greater Healing Potion",
	"/use Healing Potion",
	"/use Discolored Healing Potion",
	"/use Lesser Healing Potion",
	"/use Minor Healing Potion",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['MANAPOT'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=0,
  Talents = "?,?,?,?,?,?,?,",
  Help = [[5mmb]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     Head=false,
     Neck=false,
     Belt=false,
     Ring1=false,
     Ring2=false,
     Trinket1=false,
     Trinket2=false,
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
	"/cancelaura bear form",
	"/cancelaura cat form",
	"/cancelaura travel form",
	"/cancelaura aquatic form",
	"/use Mana Ruby",
	"/use Mana Citrine",
	"/use Mana Jade",
	"/use Mana Agate",
	"/use Major Mana Potion",
	"/use Superior Mana Potion",
	"/use Mana Potion",
	"/use Greater Mana Potion",
	"/use Minor Mana Potion",
	"/use Lesser Mana Potion",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['DECURSE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Furyswipesvg@gmail.com",
  SpecID=0,
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
	"/cast [@player] "..FSMB_mydecurse,
	"/cast [@party1] "..FSMB_mydecurse,
	"/cast [@party2] "..FSMB_mydecurse,
	"/cast [@party3] "..FSMB_mydecurse,
	"/cast [@party4] "..FSMB_mydecurse,
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
