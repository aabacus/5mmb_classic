local _, Sequences = ...
-----------------
------HUNTER
-----------------
Sequences['SURV_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
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
Sequences['SURV_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,@target,exists,harm] Arcane Shot",
	"/Cast [nomod,@target,exists,harm] Mongoose Bite",
	"/cast [nomod,@target,exists,harm] Raptor Strike",
	"/cast [nomod,@target,exists,harm] Auto Shot",
	"/cast [nomod,@target,exists,harm] Bite",
	"/Cast [mod:alt,@target,exists,harm] Wing Clip",
	"/Cast [mod:ctrl,@target,exists,harm] Concussive Shot",
	"/Cast [mod:Shift,@target,exists,harm] Hunter's Mark",
	"/cast [nomod,@target,exists,harm] Claw",
	"/Cast [nomod,@target,exists,harm] Thunderstomp",
	"/cast [nomod,@target,exists,harm] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SURV_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,@target,exists,harm] Multi-Shot",
	"/cast [nomod,@target,exists,harm] Multi-Shot",
	"/cast [nomod,@target,exists,harm] Arcane Shot",
	"/Cast [nomod,@target,exists,harm] Mongoose Bite",
	"/cast [nomod,@target,exists,harm] Raptor Strike",
	"/cast [nomod,@target,exists,harm] Auto Shot",
	"/cast [nomod,@target,exists,harm] Bite",
	"/Cast [mod:ctrl,@target,exists,harm] Wing Clip",
	"/Cast [mod:ctrl,@target,exists,harm] Concussive Shot",
	"/Cast [mod:Shift,@target,exists,harm] Hunter's Mark",
	"/cast [nomod,@target,exists,harm] Claw",
	"/Cast [nomod,@target,exists,harm] Thunderstomp",
	"/cast [nomod,@target,exists,harm] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SURV_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling] Multi-Shot",
	"/cast [nomod,nochanneling] Multi-Shot",
	"/cast [nomod] Arcane Shot",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/cast [nomod] Auto Shot",
	"/cast [nomod] Bite",
	"/Cast [mod:alt] Wing Clip",
	"/Cast [mod:alt] Concussive Shot",
	"/Cast [mod:Shift] Hunter's Mark",
	"/cast [nomod] Claw",
	"/Cast [nomod] Thunderstomp",
	"/cast [nomod] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SURV_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  Does nothing yet
]],
  Default=1,
  MacroVersions = {
    [1] = {
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
Sequences['BM_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
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
Sequences['BM_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,@target,exists,harm] Arcane Shot",
	"/Cast [nomod,@target,exists,harm] Mongoose Bite",
	"/cast [nomod,@target,exists,harm] Raptor Strike",
	"/cast [nomod,@target,exists,harm] Auto Shot",
	"/cast [nomod,@target,exists,harm] Bite",
	"/Cast [mod:ctrl] Wing Clip",
	"/Cast [mod:ctrl] Concussive Shot",
	"/Cast [mod:Shift,@target,exists,harm] Hunter's Mark",
	"/cast [nomod,@target,exists,harm] Claw",
	"/Cast [nomod,@target,exists,harm] Thunderstomp",
	"/cast [nomod,@target,exists,harm] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BM_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,@target,exists,harm] Multi-Shot",
	"/cast [nomod,@target,exists,harm] Multi-Shot",
	"/cast [nomod,@target,exists,harm] Arcane Shot",
	"/Cast [nomod,@target,exists,harm] Mongoose Bite",
	"/cast [nomod,@target,exists,harm] Raptor Strike",
	"/cast [nomod,@target,exists,harm] Auto Shot",
	"/cast [nomod,@target,exists,harm] Bite",
	"/Cast [mod:ctrl] Wing Clip",
	"/Cast [mod:ctrl] Concussive Shot",
	"/Cast [mod:Shift,@target,exists,harm] Hunter's Mark",
	"/cast [nomod,@target,exists,harm] Claw",
	"/Cast [nomod,@target,exists,harm] Thunderstomp",
	"/cast [nomod,@target,exists,harm] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BM_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling] Multi-Shot",
	"/cast [nomod,nochanneling] Multi-Shot",
	"/cast [nomod] Arcane Shot",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/cast [nomod] Auto Shot",
	"/cast [nomod] Bite",
	"/Cast [mod:alt] Wing Clip",
	"/Cast [mod:alt] Concussive Shot",
	"/Cast [mod:Shift] Hunter's Mark",
	"/cast [nomod] Claw",
	"/Cast [nomod] Thunderstomp",
	"/cast [nomod] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BM_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  Does nothing yet
]],
  Default=1,
  MacroVersions = {
    [1] = {
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
Sequences['MM_SETUP'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
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
Sequences['MM_SINGLE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,@target,exists,harm] Arcane Shot",
	"/Cast [nomod,@target,exists,harm] Mongoose Bite",
	"/cast [nomod,@target,exists,harm] Raptor Strike",
	"/cast [nomod,@target,exists,harm] Auto Shot",
	"/cast [nomod,@target,exists,harm] Bite",
	"/Cast [mod:ctrl] Wing Clip",
	"/Cast [mod:ctrl] Concussive Shot",
	"/Cast [mod:Shift,@target,exists,harm] Hunter's Mark",
	"/cast [nomod,@target,exists,harm] Claw",
	"/Cast [nomod,@target,exists,harm] Thunderstomp",
	"/cast [nomod,@target,exists,harm] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['MM_MULTI'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,@target,exists,harm] Multi-Shot",
	"/cast [nomod,@target,exists,harm] Multi-Shot",
	"/cast [nomod,@target,exists,harm] Arcane Shot",
	"/Cast [nomod,@target,exists,harm] Mongoose Bite",
	"/cast [nomod,@target,exists,harm] Raptor Strike",
	"/cast [nomod,@target,exists,harm] Auto Shot",
	"/cast [nomod,@target,exists,harm] Bite",
	"/Cast [mod:ctrl] Wing Clip",
	"/Cast [mod:ctrl] Concussive Shot",
	"/Cast [mod:Shift] Hunter's Mark",
	"/cast [nomod,@target,exists,harm] Claw",
	"/Cast [nomod,@target,exists,harm] Thunderstomp",
	"/cast [nomod,@target,exists,harm] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['MM_AOE'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  It's MAAAAAAGIC!
]],
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
	"/petattack [nomod,@target,exists,harm]",
	"/cast [nomod,@target,exists,harm] Charge",
	"/cast [nomod,@target,exists,harm] Auto Shot",
      },
      PreMacro={
	"/cast [nomod,@target,exists,harm] Arcane Shot",
      },
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling,@player] Volley",
	"/cast [nomod,nochanneling] Multi-Shot",
	"/cast [nomod,nochanneling] Multi-Shot",
	"/cast [nomod] Arcane Shot",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/cast [nomod] Auto Shot",
	"/cast [nomod] Bite",
	"/Cast [mod:alt] Wing Clip",
	"/Cast [mod:alt] Concussive Shot",
	"/Cast [mod:Shift] Hunter's Mark",
	"/cast [nomod] Claw",
	"/Cast [nomod] Thunderstomp",
	"/cast [nomod] Screech",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['MM_TURBO'] = {
-- This Sequence was exported from GSE 2.2.02.
  Author="Farcex@Grobbulus",
  SpecID=3,
  Talents = "",
  Help = [[
  Does nothing yet
]],
  Default=1,
  MacroVersions = {
    [1] = {
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
