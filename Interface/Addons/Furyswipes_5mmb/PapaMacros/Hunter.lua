local _, Sequences = ...

------------------
----- Hunter
------------------
Sequences['Beaster_st'] = {
-- This Sequence was exported from GSE 2.2.03.
  Author="Westwolf@Draka",
  SpecID=253,
  Talents = "3233332",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Priority",
      KeyPress={
        "/cast [@pet,dead] Heart of the Phoenix",
        "/petautocastoff [group] Growl",
        "/petautocaston [nogroup] Growl",
        "/cast [target=focus, exists, nodead],[target=pet, exists, nodead] Misdirection",
        "/cast Intimidation",
        "/cast [combat] Bestial Wrath",
        "/cast Titan's Thunder",
        "/cast [combat] Aspect of the Wild",
      },
      PreMacro={
        "/cast Cobra Shot",
      },
        "/cast Dire Frenzy",
        "/cast Dire Frenzy",
        "/cast Dire Frenzy",
        "/cast Kill Command",
        "/cast Kill Command",
        "/cast Cobra Shot",
        "/cast Cobra Shot",
        "/cast Cobra Shot",
        "/cast Dire Frenzy",
        "/cast Kill Command",
        "/cast Kill Command",
        "/cast Cobra Shot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}

Sequences['Beaster_aoe'] = {
-- This Sequence was exported from GSE 2.2.03.
  Author="Westwolf@Draka",
  SpecID=253,
  Talents = "3231312",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Priority",
      KeyPress={
        "/cast [@pet,dead] Heart of the Phoenix",
        "/petautocastoff [group] Growl",
        "/petautocaston [nogroup] Growl",
        "/cast [target=focus, exists, nodead],[target=pet, exists, nodead] Misdirection",
        "/cast Intimidation",
        "/cast [combat] Bestial Wrath",
        "/cast Titan's Thunder",
        "/cast [combat] Aspect of the Wild",
      },
      PreMacro={
      },
        "/cast Dire Frenzy",
        "/cast Dire Frenzy",
        "/cast Dire Frenzy",
        "/cast Kill Command",
        "/cast Kill Command",
        "/cast Multi-Shot",
        "/cast Multi-Shot",
        "/cast Multi-Shot",
        "/cast Kill Command",
        "/cast Dire Frenzy",
        "/cast Kill Command",
        "/cast Multi-Shot",
      PostMacro={
      },
      KeyRelease={
      },
    },
  },
}


Sequences['MM_singlelady'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Westwolf@Draka",
  SpecID=254,
  Talents = "1133333",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast [combat] Trueshot",
      },
      PreMacro={
      },
        "/cast Arcane Shot",
        "/cast Windburst",
        "/castsequence  reset=4  Aimed Shot",
        "/castsequence  reset=3  Marked Shot",
      PostMacro={
        "/cast Marked Shot",
      },
      KeyRelease={
      },
    },
  },
}

Sequences['MMaoelady'] = {
-- This Sequence was exported from GSE 2.1.07.
  Author="Westwolf@Draka",
  SpecID=254,
  Talents = "1133333",
  Default=1,
  MacroVersions = {
    [1] = {
     Combat=true,
      StepFunction = "Sequential",
      KeyPress={
        "/cast Trueshot",
      },
      PreMacro={
      },
        "/cast Multi-Shot",
        "/cast Windburst",
        "/castsequence  reset=6  Aimed Shot",
        "/castsequence  reset=1  Marked Shot",
      PostMacro={
        "/cast Marked Shot",
      },
      KeyRelease={
      },
    },
  },
}

