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
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/targetenemy [noexists][dead][help]",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Wing Clip",
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Wing Clip",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SURV_SINGLE_RANGED'] = {
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
	"/petattack",
	"/cast !Auto Shot",
      },
      PreMacro={
	"/cast [nomod] Hunter's Mark",
      },
      "/castsequence [nomod] reset=10  Serpent Sting, Concussive Shot, Arcane Shot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['SURV_MULTI_RANGED'] = {
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
	"/petattack",
	"/cast !Auto Shot",
      },
      "/castsequence [nomod] reset=10  Serpent Sting, Concussive Shot, Arcane Shot",
      "/cast [nomod] Multi-shot",
      PreMacro={
      },
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
      StepFunction = "Priority",
      KeyPress={
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/targetenemy [noexists][dead][help]",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod,nochanneling,@player] Volley",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
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
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/targetenemy [noexists][dead][help]",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Wing Clip",
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Wing Clip",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BM_SINGLE_RANGED'] = {
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
	"/petattack",
	"/cast !Auto Shot",
      },
      PreMacro={
	"/cast [nomod] Hunter's Mark",
      },
      "/castsequence [nomod] reset=10  Serpent Sting, Concussive Shot, Arcane Shot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['BM_MULTI_RANGED'] = {
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
	"/petattack",
	"/cast !Auto Shot",
      },
      "/castsequence [nomod] reset=10  Serpent Sting, Concussive Shot, Arcane Shot",
      "/cast [nomod] Multi-shot",
      PreMacro={
      },
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
      StepFunction = "Priority",
      KeyPress={
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/targetenemy [noexists][dead][help]",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod,nochanneling,@player] Volley",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
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
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/targetenemy [noexists][dead][help]",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Wing Clip",
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
	"/Cast [nomod] Wing Clip",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['MM_SINGLE_RANGED'] = {
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
	"/petattack",
	"/cast !Auto Shot",
      },
      PreMacro={
	"/cast [nomod] Hunter's Mark",
      },
      "/castsequence [nomod] reset=10  Serpent Sting, Concussive Shot, Arcane Shot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
Sequences['MM_MULTI_RANGED'] = {
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
	"/targetenemy [noexists][dead][help]",
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
	"/petattack",
	"/cast !Auto Shot",
      },
      "/castsequence [nomod] reset=10  Serpent Sting, Concussive Shot, Arcane Shot",
      "/cast [nomod] Multi-shot",
      PreMacro={
      },
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
      StepFunction = "Priority",
      KeyPress={
	"/cast [nopet,nodead] Call Pet; [@pet,dead] Revive Pet",
	"/targetenemy [noexists][dead][help]",
	"/petattack [nomod]",
	"/cast [nomod] Charge",
	"/stopattack [mod:alt]",
	"/startattack [nomod]", 
	"/petautocastoff [group] Growl",
	"/petautocaston [nogroup] Growl",
      },
      PreMacro={
      },
	"/cast [nomod,nochanneling,@player] Volley",
	"/Cast [nomod] Mongoose Bite",
	"/cast [nomod] Raptor Strike",
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
