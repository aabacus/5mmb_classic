local _, Sequences = ...
------------------
----- Warrior
------------------

Sequences['ARMS_SINGLE'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     LoopLimit=1,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Priority",
      KeyPress={
	      "/cast [nomod] Charge",
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	"/cast [nocombat,nomod] Battle Stance",
      },
        "/cast [nomod] Execute",
	"/cast [nomod] Overpower",
	"/castsequence [nomod] reset=target/combat  Heroic Strike, Heroic Strike",
	"/castsequence [nomod] reset=target/combat  Bloodrage, Battle Shout",
      PostMacro={
	"/castsequence [nomod] reset=1  Execute",
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ARMS_MULTI'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     LoopLimit=1,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Priority",
      KeyPress={
	      "/cast [nomod] Charge",
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	"/cast [nocombat,nomod] Battle Stance",
      },
        "/cast [nomod] Execute",
	"/cast [nomod] Overpower",
	"/cast [nomod] whirlwind",
	"/castsequence [nomod] reset=target/combat  Cleave,Cleave",
	"/castsequence [nomod] reset=target/combat  Bloodrage, Battle Shout",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ARMS_AOE'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     LoopLimit=1,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Priority",
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	"/cast [nocombat,nomod] Battle Stance",
      },
	"/cast [nomod] whirlwind",
	"/castsequence [nomod] reset=target/combat  Cleave,Cleave",
	"/castsequence [nomod] reset=target/combat  Bloodrage, Battle Shout",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['ARMS_SETUP'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
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
Sequences['ARMS_TURBO'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket2=true,
      StepFunction = "Sequential",
      KeyPress={
	      "/cast [nomod] Retaliation",
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
Sequences['FURY_SINGLE'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     LoopLimit=1,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Priority",
      KeyPress={
	      "/cast [nomod] Charge",
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	"/cast [nocombat,nomod] Battle Stance",
      },
        "/cast [nomod] Execute",
	"/cast [nomod] Overpower",
	"/castsequence [nomod] reset=target/combat  Heroic Strike, Heroic Strike",
	"/castsequence [nomod] reset=target/combat  Bloodrage, Battle Shout",
      PostMacro={
	"/castsequence [nomod] reset=1  Execute",
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FURY_MULTI'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     LoopLimit=1,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Priority",
      KeyPress={
	      "/cast [nomod] Charge",
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	"/cast [nocombat,nomod] Battle Stance",
      },
        "/cast [nomod] Execute",
	"/cast [nomod] Overpower",
	"/cast [nomod] whirlwind",
	"/castsequence [nomod] reset=target/combat  Cleave,Cleave",
	"/castsequence [nomod] reset=target/combat  Bloodrage, Battle Shout",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FURY_AOE'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
     LoopLimit=1,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Priority",
      KeyPress={
	      "/startattack [nomod]",
	      "/stopattack [mod:alt]",
      },
      PreMacro={
	"/cast [nocombat,nomod] Battle Stance",
      },
	"/cast [nomod] whirlwind",
	"/castsequence [nomod] reset=target/combat  Cleave,Cleave",
	"/castsequence [nomod] reset=target/combat  Bloodrage, Battle Shout",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['FURY_SETUP'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
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
Sequences['FURY_TURBO'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket2=true,
      StepFunction = "Sequential",
      KeyPress={
	      "/cast [nomod] Retaliation",
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
Sequences['PROT_SINGLE'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Sequential",
      KeyPress={
	"/targetenemy [nomod,noharm,nodead]",
      	"/cast [mod:alt] Taunt",
      	"/cast [mod:ctrl] Demoralizing Shout",
	"/cast [nomod] Charge",
	"/cast [combat] Bloodrage",
	"/cast [combat] Defensive Stance",
      },
      PreMacro={
	"/cast [nomod,nocombat] Battle Stance",
      },
	"/cast [nomod] Shield Block",
	"/cast [nomod] Shield Slam",
	"/cast [nomod] Revenge",
	"/cast [nomod] Sunder Armor",
	"/cast [nomod] Heroic Strike",
      PostMacro={
      },
      KeyRelease={
	      "/startattack [nomod]",
      },
    },
  },
}
Sequences['PROT_SETUP'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
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
Sequences['PROT_MULTI'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Sequential",
      KeyPress={
	"/targetenemy [nomod,noharm,nodead]",
      	"/cast [mod:alt] Taunt",
      	"/cast [mod:ctrl] Demoralizing Shout",
	"/cast [nomod] Charge",
	"/cast [combat] Bloodrage",
	"/cast [combat] Defensive Stance",
      },
      PreMacro={
	"/cast [nomod,nocombat] Battle Stance",
      },
	"/cast [nomod] Shield Block",
	"/cast [nomod] Shield Slam",
	"/cast [nomod] Revenge",
	"/cast [nomod] Sunder Armor",
	"/cast [nomod] Cleave",
      PostMacro={
      },
      KeyRelease={
	      "/startattack [nomod]",
      },
    },
  },
}
Sequences['PROT_AOE'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket1=false,
      Trinket2=false,
      Head=false,
      Neck=false,
      Belt=false,
      Ring1=false,
      Ring2=false,
      StepFunction = "Sequential",
      KeyPress={
	"/targetenemy [nomod,noharm,nodead]",
      	"/cast [mod:alt] Taunt",
      	"/cast [mod:ctrl] Demoralizing Shout",
	"/cast [nomod] Charge",
	"/cast [combat] Bloodrage",
	"/cast [combat] Defensive Stance",
      },
      PreMacro={
	"/cast [nomod,nocombat] Battle Stance",
      },
	"/cast [nomod] Shield Block",
	"/cast [nomod] Shield Slam",
	"/cast [nomod] Revenge",
	"/cast [nomod] Sunder Armor",
	"/cast [nomod] Cleave",
      PostMacro={
      },
      KeyRelease={
	      "/startattack [nomod]",
      },
    },
  },
}
Sequences['PROT_TURBO'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Furyswipesvg@gmail.com",
  SpecID=1,
  Talents = "",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      Trinket2=true,
      StepFunction = "Sequential",
      KeyPress={
	      "/cast [nomod] Retaliation",
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
