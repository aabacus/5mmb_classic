local _, Sequences = ...

------------------
----- Warlock
------------------

-- Demonology (specID = 266)

Sequences['Demo_aoe'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Illidansbro@Draka",
  SpecID=266,
  Talents = "3131132",
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Doom, null",
      },
      PreMacro={
      },
        "/castsequence [nochanneling] Demonic Empowerment, Demonwrath, Demonwrath, Demonwrath, Hand of Gul'dan, Life Tap",
        "/cast Felstorm",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}


Sequences['Demo_st'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Illidansbro@Draka",
  SpecID=266,
  Talents = "3131132",
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Doom, null",
      },
      PreMacro={
      },
        "/castsequence [nochanneling] Demonic Empowerment, Demonbolt, Demonbolt, Demonbolt, Hand of Gul'dan, Demonbolt, Thal'kiel's Consumption, Life Tap",
        "/castsequence  reset=1  Demonbolt",
        "/castsequence  reset=4  Call Dreadstalkers",
        "/castsequence  reset=1  Summon Doomguard",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

-- Affliction (specID = 265)

Sequences['aff_aoe'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Illidansbro@Draka",
  SpecID=265,
  Talents = "1222113",
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
        "/castsequence [nochanneling] reset=combat/target  Agony, Corruption, Drain Soul, Seed of Corruption, Unstable Affliction, Life Tap, Life Tap",
        "/castsequence  reset=5  Reap Souls",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}


Sequences['aff_st'] = {
-- This Sequence was exported from GSE 2.1.04.
  Author="Illidansbro@Draka",
  SpecID=265,
  Talents = "1222113",
  Default=1,
  MacroVersions = {
    [1] = {
      StepFunction = "Sequential",
      KeyPress={
      },
      PreMacro={
      },
        "/castsequence [nochanneling] Agony, Corruption, Drain Soul, Drain Soul, Unstable Affliction, Unstable Affliction, Life Tap",
        "/cast Haunt",
        "/castsequence  reset=5  Reap Souls",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Destro'] = {
-- This Sequence was exported from GSE 2.2.03.
  Author="Illidansbro@Draka",
  SpecID=267,
  Talents = "1132112",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [nopet,nodead] Summon Doomguard",
        "/cast [mod:ctrl] Havoc",
        "/castsequence  reset=target/combat  Immolate, null",
      },
      PreMacro={
      },
        "/castsequence Immolate, Incinerate, Incinerate",
        "/cast [nochanneling] chaos bolt",
        "/cast Conflagrate",
        "/cast Dimensional Rift",
        "/cast [nochanneling] chaos bolt",
        "/cast [nochanneling] Channel Demonfire",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Destro_close_aoe'] = {
-- This Sequence was exported from GSE 2.2.03.
  Author="Illidansbro@Draka",
  SpecID=267,
  Talents = "1132112",
  Help = [[use at close range]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Immolate, null",
      },
      PreMacro={
      },
        "/cast Incinerate",
        "/cast [@player] Rain of Fire",
        "/cast [@player] Shadowfury",
        "/cast [nochanneling] Channel Demonfire",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Destro_far_aoe'] = {
-- This Sequence was exported from GSE 2.2.03.
  Author="Illidansbro@Draka",
  SpecID=267,
  Talents = "1132112",
  Help = [[use at far range]],
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/castsequence  reset=target/combat  Immolate, null",
      },
      PreMacro={
      },
        "/cast Incinerate",
        "/cast [@cursor] Rain of Fire",
        "/cast [@cursor] Shadowfury",
        "/cast [nochanneling] Channel Demonfire",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}
