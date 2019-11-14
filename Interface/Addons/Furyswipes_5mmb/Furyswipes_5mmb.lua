FSMB_version="091819_classic"
AceComm=LibStub("AceComm-3.0")
print('Hello from 5mmb!')
FSMB_toonlist={[1]="Furyswipes",[2]="Mootalia",[3]="Spirited",[4]="Icelance",[5]="Dragonstalkr"}
FSMB_tank="Furyswipes"
FSMB_healerlist={"Spirited"}
FSMB_strongestaoe="Icelance"
FSMB_mypoly={["Priest"]="Shackle",["Mage"]="Polymorph",["Druid"]="Hibernate",["Warlock"]="Banish"}
FSMB_myint={["Paladin"]="Hammer of Justice",["Priest"]="Silence",["Mage"]="Counterspell",["Druid"]="Bash",["Shaman"]="Earth Shock",["Hunter"]="Scatter Shot",["Warlock"]="",["Warrior"]="Pummel",["Rogue"]="Kick",}
FSMB_decurse={["Paladin"]="Cleanse",["Priest"]="Dispel Magic",["Mage"]="Remove Lesser Curse",["Druid"]="Remove Curse",["Shaman"]="Cure Poison",["Hunter"]="None",["Warlock"]="None",["Warrior"]="None",["Rogue"]="None",}
FSMB_heal_names={["Paladin"]={"Flash of Light","Holy Light"},["Priest"]={"Flash Heal","Heal","Lesser Heal"},["Druid"]={"Healing Touch"},["Shaman"]={"Healing Wave"}}
FSMB_mydecurse=FSMB_decurse[UnitClass("player")]
if UnitLevel("player")>7 then 
	FSMB_myseal="Seal of the Crusader"
else
	FSMB_myseal="Seal of Righteousness"
end
FSMB_myaura="Aura of Devotion"
SLASH_INIT1="/init"
SlashCmdList["INIT"]=function()
	init()
end
SLASH_VERSION1 = '/version'
	SlashCmdList['VERSION'] = function(arg)
	print("Furyswipes_5mmb version is "..FSMB_version)
end
FSMB_msgcd=GetTime()
function init()
	if UnitAffectingCombat("player") then return end
local myname=UnitName("player")
local myclass=UnitClass("player")
local myspec="UNKNOWN"
local mylevel=UnitLevel("player")
if myclass=="Warrior" then
	if IsFury() then myspec="FURY"
	else myspec="ARMS" end
elseif myclass=="Druid" then
	if IsBoomkin() then myspec="BOOMKIN" 
	elseif IsDruidHealer() then myspec="RESTODRU"
	elseif IsTank(myname) then myspec="BEAR_TANK"
	else myspec="FERAL" end
elseif myclass=="Mage" then
	if IsFrost() then myspec="FROST" 
	else myspec="FIRE" end
elseif myclass=="Shaman" then
	if IsElementalShammy() then myspec="ELE" 
	elseif IsEnhanceShammy() then myspec="ENH"
	else myspec="RESTOSHAM" end
elseif myclass=="Hunter" then
	if IsMM() then myspec="MM" 
	elseif IsBM() then myspec="BM"
	else myspec="SURV" end
elseif myclass=="Priest" then
	if IsShadow() then myspec="SHADOW" 
	else myspec="HOLY" end
elseif myclass=="Hunter" then
	if IsMM() then myspec="MM" 
	elseif IsBM() then myspec="BM"
	else myspec="SURV" end
elseif myclass=="Rogue" then
	myspec="COMBAT"
elseif myclass=="Warlock" then
	myspec="DESTRO"
elseif myclass=="Paladin" then
	if IsPallyTank() then myspec="PROT" 
	elseif IsHolyPally() then myspec="HOLY"
	else myspec="RET" end
end
clearmacros()
local macroId = CreateMacro("drink", "Inv_drink_18", "/click DRINK", nil);
PickupMacro(macroId)
PlaceAction(65)
ClearCursor()
local macroId = CreateMacro("manapot", "Inv_potion_76", "/click MANAPOT", nil);
PickupMacro(macroId)
PlaceAction(67)
ClearCursor()
local macroId = CreateMacro("healpot", "Inv_potion_54", "/click HEALPOT", nil);
PickupMacro(macroId)
PlaceAction(66)
ClearCursor()
PickupItem("Hearthstone")
PlaceAction(26)
ClearCursor()
local partymac=""
for i=1,TableLength(FSMB_toonlist) do
	partymac=partymac.."/invite "..FSMB_toonlist[i].."\n"
end
local macroId = CreateMacro("party", "Ability_hunter_pathfinding", partymac, nil);
PickupMacro(macroId)
PlaceAction(10)
PickupMacro(macroId)
PlaceAction(82)
PickupMacro(macroId)
PlaceAction(94)
PickupMacro(macroId)
PlaceAction(106)
PickupMacro(macroId)
PlaceAction(118)
ClearCursor()
local slot=43
local idx=0
local i
for i=1,TableLength(FSMB_toonlist) do
	if myname==FSMB_toonlist[i] then
		macroId = CreateMacro("f"..i, "Ability_hunter_pet_gorilla", "", nil);
	else
		macroId = CreateMacro("f"..i, "Ability_hunter_pet_gorilla", "/follow "..FSMB_toonlist[i], nil);
	end
	PickupMacro(macroId)
	PlaceAction(slot+i)
	ClearCursor()
end
local slot=31
local idx=0
local i
for i=1,TableLength(FSMB_toonlist) do
	if myname==FSMB_toonlist[i] then
		macroId = CreateMacro("a"..i, "Ability_hunter_pet_hyena", "", nil);
	else
		macroId = CreateMacro("a"..i, "Ability_hunter_pet_hyena", "/assist "..FSMB_toonlist[i], nil);
	end
	PickupMacro(macroId)
	PlaceAction(slot+i)
	ClearCursor()
end
for i=1,TableLength(FSMB_toonlist) do
	if i==1 and myname==FSMB_toonlist[i] then
		macroId = CreateMacro("makealine", "Ability_hunter_pet_tallstrider", "", nil);
	elseif myname==FSMB_toonlist[i] then
		macroId = CreateMacro("makealine", "Ability_hunter_pet_tallstrider", "/follow "..FSMB_toonlist[i-1], nil);
	end
	PickupMacro(macroId)
	PlaceAction(60)
	ClearCursor()
end
if myclass=="Hunter" then
	index=CreateMacro("feign","INV_Misc_QuestionMark","/petfollow\n/petpassive\n/stopattack\n/cast Freezing Trap\n/cast Feign Death",nil)
	PickupMacro(index)
	PlaceAction(61)
	index=CreateMacro("feed","INV_Misc_QuestionMark","/cast [pet] feed pet\n/use 0 1\n/run ClearCursor()\n/cast [nopet] call pet\n/cast [@pet,dead] revive pet",nil)
	PickupMacro(index)
	PlaceAction(37)
end
if myclass=="Warrior" and IsTank(myname) then
	print("Checking ranged weap")
	if myclass=="Warrior" and RangedWeaponType() and SpellExists("Shoot "..RangedWeaponType()) then
		PickupSpellBookItem(SpellNum("Shoot "..RangedWeaponType()),BOOKTYPE_SPELL)
		PlaceAction(61)
	end
end
if myclass=="Druid" then
  	macroId = CreateMacro("b0", "INV_Misc_QuestionMark", "/cast [stance:1] Bear Form\n/cast [stance:2] Cat Form\n/cast [stance:3] travel form\n/cast [stance:4] aquatic form\n/cast [nostance,@"..FSMB_tank.."] thorns", nil);
	PickupMacro(macroId)
	PlaceAction(37)
	ClearCursor()
	local slot=38
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("b"..i, "INV_Misc_QuestionMark", "/cast [stance:1] Bear Form\n/cast [stance:2] Cat Form\n/cast [stance:3] travel form\n/cast [stance:4] aquatic form\n/cast [nostance,@"..FSMB_toonlist[i].."] Mark of the Wild", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
	PickupSpellBookItem("Wrath")
	PlaceAction(61)
	ClearCursor()
end
if myclass=="Druid" and IsTank(myname) then
  	macroId = CreateMacro("pull", "INV_Misc_QuestionMark", "/cast [stance:1] Bear Form\n/cast [stance:2] Cat Form\n/cast [stance:3] travel form\n/cast [stance:4] aquatic form\n/cast [nostance] Wrath", nil);
	PickupMacro(macroId)
	PlaceAction(61)
	ClearCursor()
end
if myclass=="Shaman" and FindInTable(FSMB_healerlist,myname) then
	if IsRestoShammy() then 
		PickupSpellBookItem("Flametongue Weapon")
	else
		PickupSpellBookItem("Rockbiter Weapon")
		PickupSpellBookItem("Windfury Weapon")
	end
	PlaceAction(37)
	ClearCursor()
	local slot=49
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("h"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Healing Wave", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
end
if myclass=="Priest" and FindInTable(FSMB_healerlist,myname) then
	local slot=49
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("h"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Lesser Heal", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
end
if myclass=="Priest" then
  	macroId = CreateMacro("shackle", "INV_Misc_QuestionMark", "/cast Shackle Undead", nil);
	PickupMacro(macroId)
	PlaceAction(62)
	ClearCursor()
	PickupSpellBookItem("Inner Fire")
	PlaceAction(37)
	ClearCursor()
	local slot=38
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("b"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Power Word: Fortitude", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
end
if myclass=="Paladin" then
	if FindInTable(FSMB_healerlist,myname) then
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
  			macroId = CreateMacro("h"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Holy Light", nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
  		macroId = CreateMacro("self", "INV_Misc_QuestionMark", "/castsequence [@player] reset=combat Blessing of Wisdom,devotion aura", nil);
		PickupMacro(macroId)
		PlaceAction(37)
		ClearCursor()
	else
  		macroId = CreateMacro("self", "INV_Misc_QuestionMark", "/castsequence [@player] reset=combat Blessing of Might,devotion aura", nil);
		PickupMacro(macroId)
		PlaceAction(37)
		ClearCursor()
	end
	local slot=38
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("b"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Blessing of Kings", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
end
if myclass=="Shaman" then
	local rezlist=""
	for i=1,TableLength(FSMB_toonlist) do
		rezlist=rezlist.."/target "..FSMB_toonlist[i].."\n/cast [dead] Ancestral Spirit\n"
	end
  	macroId = CreateMacro("rez", "INV_Misc_QuestionMark", rezlist, nil);
	PickupMacro(macroId)
	PlaceAction(8)
	ClearCursor()
	PickupSpellBookItem("Ancestral Spirit")
	PlaceAction(68)
	ClearCursor()
  	macroId = CreateMacro("tot", "INV_Misc_QuestionMark", "/click "..myspec.."_TOT", nil);
	PickupMacro(macroId)
	PlaceAction(61)
	ClearCursor()
end
if myclass=="Druid" and FindInTable(FSMB_healerlist,myname) then
  	macroId = CreateMacro("rebirth", "INV_Misc_QuestionMark", "/cast [stance:1] Bear Form\n/cast [stance:2] Cat Form\n/cast [stance:3] travel form\n/cast [stance:4] aquatic form\n/cast [nostance] Rebirth", nil);
	PickupMacro(macroId)
	PlaceAction(68)
	ClearCursor()
	local slot=49
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("h"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Healing Touch", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
end
if myclass=="Mage" then
	if findSpell("Conjure Water",BOOKTYPE_SPELL) then
		PickupSpellBookItem("Conjure Water")
		PlaceAction(12)
		ClearCursor()
	end
	PickupSpellBookItem("Frost Armor")
	PickupSpellBookItem("Ice Armor")
	PlaceAction(37)
	ClearCursor()
	local slot=38
	local idx=0
	local i
	for i=1,TableLength(FSMB_toonlist) do
  		macroId = CreateMacro("b"..i, "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] Arcane Intellect", nil);
		PickupMacro(macroId)
		PlaceAction(slot+idx)
		ClearCursor()
		idx=idx+1
	end
else
	PickupAction(12)
	ClearCursor()
end
if FSMB_tank==myname or myclass=="Hunter" or myclass=="Warrior" or myclass=="Rogue" or myclass=="Shaman" or myclass=="Paladin" then
  	macroId = CreateMacro("passive", "Spell_magic_polymorphchicken", "/petfollow [mod:alt]\n/stopattack [mod:alt]", nil);
	PickupMacro(macroId)
	PlaceAction(62)
	ClearCursor()
else
  	macroId = CreateMacro("poly", "INV_Misc_QuestionMark", "/cast "..FSMB_mypoly[myclass], nil);
	PickupMacro(macroId)
	PlaceAction(62)
	ClearCursor()
end
for healer,spelllist in pairs(FSMB_heal_names) do
	if myclass==healer then 
		healcasts=""
		for _,heal in pairs(spelllist) do
			healcasts=healcasts.."/cast [@player] "..heal.."\n"
		end
		macroId = CreateMacro("selfh","INV_Misc_Questionmark",healcasts, nil);
		PickupMacro(macroId)
		PlaceAction(6)
		ClearCursor()
	end
end
macroId = CreateMacro("buff", "spell_holy_divinespirit", "", nil);
PickupMacro(macroId)
PlaceAction(57)
ClearCursor()
local index=CreateMacro("setup","Spell_magic_polymorphchicken","/click "..myspec.."_SETUP",nil)
PickupMacro(index)
PlaceAction(1)
PickupMacro(index)
PlaceAction(73)
PickupMacro(index)
PlaceAction(85)
PickupMacro(index)
PlaceAction(97)
PickupMacro(index)
PlaceAction(109)
ClearCursor()
index=CreateMacro("single","ability_searingarrow","/click "..myspec.."_SINGLE",nil)
PickupMacro(index)
PlaceAction(2)
PickupMacro(index)
PlaceAction(74)
PickupMacro(index)
PlaceAction(86)
PickupMacro(index)
PlaceAction(98)
PickupMacro(index)
PlaceAction(110)
ClearCursor()
index=CreateMacro("multi","ability_upgrademoonglaive","/click "..myspec.."_MULTI",nil)
PickupMacro(index)
PlaceAction(3)
PickupMacro(index)
PlaceAction(75)
PickupMacro(index)
PlaceAction(87)
PickupMacro(index)
PlaceAction(99)
PickupMacro(index)
PlaceAction(111)
ClearCursor()
index=CreateMacro("turbo","Spell_nature_lightning","/click "..myspec.."_TURBO",nil)
PickupMacro(index)
PlaceAction(4)
PickupMacro(index)
PlaceAction(76)
PickupMacro(index)
PlaceAction(88)
PickupMacro(index)
PlaceAction(100)
PickupMacro(index)
PlaceAction(112)
ClearCursor()
index=CreateMacro("aoe","spell_fire_selfdestruct","/click "..myspec.."_AOE",nil)
PickupMacro(index)
PlaceAction(5)
PickupMacro(index)
PlaceAction(77)
PickupMacro(index)
PlaceAction(89)
PickupMacro(index)
PlaceAction(101)
PickupMacro(index)
PlaceAction(113)
ClearCursor()
macroId = CreateMacro("int", "INV_Misc_Questionmark", "/cast "..FSMB_myint[myclass], nil);
PickupMacro(macroId)
PlaceAction(63)
ClearCursor()
macroId = CreateMacro("decurse", "spell_nature_removecurse", "/click ".."DECURSE", nil);
PickupMacro(macroId)
PlaceAction(56)
ClearCursor()
index=CreateMacro("reload","spell_frost_stun","/reload",nil)
PickupMacro(index)
PlaceAction(31)
ClearCursor()
index=CreateMacro("leave","spell_nature_purge","/script LeaveParty()",nil)
PickupMacro(index)
PlaceAction(30)
ClearCursor()
index=CreateMacro("dance","ability_druid_aquaticform","/dance",nil)
PickupMacro(index)
PlaceAction(29)
ClearCursor()
LoadBindings(1)
SetBinding("F1","MULTIACTIONBAR2BUTTON1")
SetBinding("F2","MULTIACTIONBAR2BUTTON2")
SetBinding("F3","MULTIACTIONBAR2BUTTON3")
SetBinding("F4","MULTIACTIONBAR2BUTTON4")
SetBinding("F5","MULTIACTIONBAR2BUTTON5")
SetBinding("F6","MULTIACTIONBAR2BUTTON6")
SetBinding("F7","MULTIACTIONBAR2BUTTON7")
SetBinding("F8","MULTIACTIONBAR2BUTTON8")
SetBinding("F9","MULTIACTIONBAR2BUTTON9")
SetBinding("F10","MULTIACTIONBAR2BUTTON10")
SetBinding("F11","MULTIACTIONBAR2BUTTON11")
SetBinding("F12","MULTIACTIONBAR2BUTTON12")
SetBinding("SHIFT-1","MULTIACTIONBAR1BUTTON1")
SetBinding("SHIFT-2","MULTIACTIONBAR1BUTTON2")
SetBinding("SHIFT-3","MULTIACTIONBAR1BUTTON3")
SetBinding("SHIFT-4","MULTIACTIONBAR1BUTTON4")
SetBinding("SHIFT-5","MULTIACTIONBAR1BUTTON5")
SetBinding("SHIFT-6","MULTIACTIONBAR1BUTTON6")
SetBinding("SHIFT-7","MULTIACTIONBAR1BUTTON7")
SetBinding("SHIFT-8","MULTIACTIONBAR1BUTTON8")
SetBinding("SHIFT-9","MULTIACTIONBAR1BUTTON9")
SetBinding("SHIFT-0","MULTIACTIONBAR1BUTTON10")
SetBinding("SHIFT--","MULTIACTIONBAR1BUTTON11")
SetBinding("SHIFT-=","MULTIACTIONBAR1BUTTON12")
SetBinding("F","INTERACTTARGET")
SetBinding("SHIFT-F1","MULTIACTIONBAR4BUTTON1")
SetBinding("SHIFT-F2","MULTIACTIONBAR4BUTTON2")
SetBinding("SHIFT-F3","MULTIACTIONBAR4BUTTON3")
SetBinding("SHIFT-F4","MULTIACTIONBAR4BUTTON4")
SetBinding("SHIFT-F5","MULTIACTIONBAR4BUTTON5")
SetBinding("SHIFT-F6","MULTIACTIONBAR4BUTTON6")
SetBinding("SHIFT-F7","MULTIACTIONBAR4BUTTON7")
SetBinding("SHIFT-F8","MULTIACTIONBAR4BUTTON8")
SetBinding("SHIFT-F9","MULTIACTIONBAR4BUTTON9")
SetBinding("SHIFT-F10","MULTIACTIONBAR4BUTTON10")
SetBinding("SHIFT-F11","MULTIACTIONBAR4BUTTON11")
SetBinding("SHIFT-F12","MULTIACTIONBAR4BUTTON12")
SetBinding("CTRL-F1","MULTIACTIONBAR3BUTTON1")
SetBinding("CTRL-F2","MULTIACTIONBAR3BUTTON2")
SetBinding("CTRL-F3","MULTIACTIONBAR3BUTTON3")
SetBinding("CTRL-F4","MULTIACTIONBAR3BUTTON4")
SetBinding("CTRL-F5","MULTIACTIONBAR3BUTTON5")
SetBinding("CTRL-F6","MULTIACTIONBAR3BUTTON6")
SetBinding("CTRL-F7","MULTIACTIONBAR3BUTTON7")
SetBinding("CTRL-F8","MULTIACTIONBAR3BUTTON8")
SetBinding("CTRL-F9","MULTIACTIONBAR3BUTTON9")
SetBinding("CTRL-F10","MULTIACTIONBAR3BUTTON10")
SetBinding("CTRL-F11","MULTIACTIONBAR3BUTTON11")
SetBinding("CTRL-F12","MULTIACTIONBAR3BUTTON12")
SetBinding("BUTTON3","MOVEBACKWARD")
SetBinding("ALT-CTRL-1","ACTIONBUTTON1")
SetBinding("CTRL-1")
SetBinding("CTRL-2")
SetBinding("CTRL-3")
SetBinding("CTRL-4")
SetBinding("CTRL-5")
SetBinding("CTRL-6")
SetBinding("CTRL-7")
SetBinding("CTRL-8")
SetBinding("CTRL-9")
SetBinding("CTRL-0")
SetBinding("CTRL--")
SetBinding("CTRL-=")
SetBinding("SHIFT-UP")
SetBinding("SHIFT-DOWN")
SetBinding("SHIFT-MOUSEWHEELUP")
SetBinding("SHIFT-MOUSEWHEELDOWN")
SetBinding("B","OPENALLBAGS")
AttemptToSaveBindings(1)
SetCVar("alwaysShowActionBars", true, true)
SetCVar("alwaysShowActionBars", true, true)
SetCVar("nameplateShowEnemies", true, true)
SetCVar("nameplateShowFriends", true, true)
SetCVar("enableFloatingCombatText", true, true)
SetModifiedClick("SELFCAST","NONE")
SetActionBarToggles(true,true,true,true,true)
SHOW_MULTI_ACTIONBAR_1=true
SHOW_MULTI_ACTIONBAR_2=true
SHOW_MULTI_ACTIONBAR_3=true
SHOW_MULTI_ACTIONBAR_4=true
ALWAYS_SHOW_MULTI_ACTIONBAR=1
MultiActionBar_Update()
ClearTutorials()
ReloadUI()
if false then 
	if myclass=="Hunter" then
		index=CreateMacro("feign",124,"/script fd()",nil)
		PickupMacro(index)
		PlaceAction(61)
	end
	if myclass=="Warrior" and RangedWeaponType() and SpellExists("Shoot "..RangedWeaponType()) then
		PickupSpellBookItem(SpellNum("Shoot "..RangedWeaponType()),BOOKTYPE_SPELL)
		PlaceAction(61)
	end
	if myclass=="Druid" and SpellExists("Wrath") then
		PickupSpellBookItem(findSpell("Wrath"),BOOKTYPE_SPELL)
		PlaceAction(61)
	end
	index=CreateMacro("foc",9,"/script TargetByName(MB_raidleader,1)",1,nil)
	PickupMacro(index)
	PlaceAction(47)
	index=CreateMacro("void",510,"/script SetLockPet(\"Voidwalker\")",1,nil)
	PickupMacro(index)
	PlaceAction(45)
	index=CreateMacro("imp",507,"/script SetLockPet(\"Imp\")",1,nil)
	PickupMacro(index)
	PlaceAction(44)
	index=CreateMacro("succ",509,"/script SetLockPet(\"Succubus\")",1,nil)
	PickupMacro(index)
	PlaceAction(43)
	index=CreateMacro("felhunt",506,"/script SetLockPet(\"Felhunter\")",nil)
	PickupMacro(index)
	PlaceAction(42)
	index=CreateMacro("tos",486,"/script SetLockPet(nil)",nil)
	PickupMacro(index)
	PlaceAction(41)
	index=CreateMacro("fearbreak",489,"/script fearbreak()",nil)
	PickupMacro(index)
	PlaceAction(62)
	index=CreateMacro("int",25,"/script interrupt_boss()",nil)
	PickupMacro(index)
	PlaceAction(63)
	PickupAction(51)
	ClearCursor()
	index=CreateMacro("summ",511,"/run SummonOutOfRange()",1,nil)
	PickupMacro(index)
	PlaceAction(37)
	if myclass=="Warlock" or myclass=="Hunter" or myclass=="Mage" or myclass=="Priest" or myclass=="Druid" or myclass=="Paladin" then
		index=CreateMacro("sheep",394,"/script CC()",nil)
		PickupMacro(index)
		PlaceAction(51)
	end
	PickupAction(8)
	ClearCursor()
	PickupAction(80)
	ClearCursor()
	PickupAction(92)
	ClearCursor()
	PickupAction(104)
	ClearCursor()
	PickupAction(116)
	ClearCursor()
	index=CreateMacro("rezemall",303,"/script rezemall()",nil)
	PickupMacro(index)
	PlaceAction(8)
	PickupMacro(index)
	PlaceAction(80)
	PickupMacro(index)
	PlaceAction(92)
	PickupMacro(index)
	PlaceAction(104)
	PickupMacro(index)
	PlaceAction(116)
	if myclass=="Priest" or myclass=="Druid" then
		index=CreateMacro("preheal",292,"/script preheal_tanks()",nil)
		PickupAction(50)
		ClearCursor()
		PickupMacro(index)
		PlaceAction(50)
	end
	index=CreateMacro("cc",395,"/script MB_assign_cc()",nil)
	PickupAction(49)
	ClearCursor()
	PickupMacro(index)
	PlaceAction(49)
	index=CreateMacro("ot",98,"/script MB_assign_ot()",1,nil)
	PickupMacro(index)
	PlaceAction(52)
	index=CreateMacro("smartdrink",339,"/script smartdrink()",nil)
	PickupMacro(index)
	PlaceAction(53)
	index=CreateMacro("line",294,"/script MakeALine()",1,nil)
	PickupMacro(index)
	PlaceAction(60)
	PickupAction(59)
	ClearCursor()
	index=CreateMacro("pent",366,"/script Pentagram()",1,nil)
	PickupMacro(index)
	PlaceAction(59)
	index=CreateMacro("clearot",133,"/script MB_clearraidtarget()",1,nil)
	PickupMacro(index)
	PlaceAction(54)
	index=CreateMacro("cleartargs",138,"/script clearraidtargs()",1,nil)
	PickupMacro(index)
	PlaceAction(55)
	index=CreateMacro("tankbrez",303,"/script rezemall(true)",nil)
	PickupMacro(index)
	PlaceAction(56)
	index=CreateMacro("focus",1,"/script focusme()",nil)
	PickupMacro(index)
	PlaceAction(58)
	index=CreateMacro("sortraid",63,"/script SortRaid()",nil)
	PickupMacro(index)
	PlaceAction(11)
	PickupMacro(index)
	PlaceAction(83)
	PickupMacro(index)
	PlaceAction(95)
	PickupMacro(index)
	PlaceAction(108)
	PickupMacro(index)
	PlaceAction(119)
	index=CreateSuperMacro("levparty","Interface\\Icons\\Spell_Nature_EnchantArmor","/script leveling_parties()")
	index=CreateMacro("party",320,"/script partyup()",1,nil)
	PickupMacro(index)
	PlaceAction(10)
	PickupMacro(index)
	PlaceAction(82)
	PickupMacro(index)
	PlaceAction(94)
	PickupMacro(index)
	PlaceAction(106)
	PickupMacro(index)
	PlaceAction(118)
	if myclass=="Warlock" and SpellExists("Drain Soul") then
		PickupSpellBookItem(findSpell("Drain Soul"),BOOKTYPE_SPELL)
		PlaceAction(67)
	end
	if myclass=="Warlock" and SpellExists("Rain of Fire") then
		PickupSpellBookItem(findSpell("Rain of Fire"),BOOKTYPE_SPELL)
		PlaceAction(69)
	end
	PickupAction(7)
	ClearCursor()
	PickupAction(79)
	ClearCursor()
	PickupAction(91)
	ClearCursor()
	PickupAction(104)
	ClearCursor()
	PickupAction(115)
	ClearCursor()
	if myclass=="Warlock" and SpellExists("Life Tap") then
		PickupSpellBookItem(findSpell("Life Tap"),BOOKTYPE_SPELL)
		PlaceAction(7)
	end
	if myclass=="Warrior" or myclass=="Priest" or myclass=="Shaman" or myclass=="Druid" or myclass=="Paladin" then
		index=CreateMacro("wall",165,"/script WarriorSurvive()",nil)
		PickupMacro(index)
		PlaceAction(6)
		PickupMacro(index)
		PlaceAction(78)
		PickupMacro(index)
		PlaceAction(90)
		PickupMacro(index)
		PlaceAction(103)
		PickupMacro(index)
		PlaceAction(114)
	end
	if myclass=="Warlock" then
	        index=CreateSuperMacro("HS","Interface\\Icons\\INV_stone_04","/run createhs()")
		PickupMacro(index,"HS")
		PlaceAction(68)
	elseif myclass=="Priest" and SpellExists("Resurrection") then
		PickupSpellBookItem(findSpell("Resurrection"),BOOKTYPE_SPELL)
		PlaceAction(68)
	elseif myclass=="Shaman" and SpellExists("Ancestral Spirit") then
		PickupSpellBookItem(findSpell("Ancestral Spirit"),BOOKTYPE_SPELL)
		PlaceAction(68)
	elseif myclass=="Paladin" and SpellExists("Redemption") then
		PickupSpellBookItem(findSpell("Redemption"),BOOKTYPE_SPELL)
		PlaceAction(68)
	end
	if myclass=="Priest" or myclass=="Shaman" or myclass=="Druid" or myclass=="Paladin" then
	        index=CreateSuperMacro("flaoe","Interface\\Icons\\Spell_Holy_Prayerofhealing02","/script FloodAOEHeal()")
		PickupMacro(index,"flaoe")
		PlaceAction(65)
		index=CreateMacro("aoeh",33,"/script AOEHeal()",1,nil)
		PickupMacro(index)
		PlaceAction(66)
	else
		PickupAction(65)
		ClearCursor()
		PickupAction(66)
		ClearCursor()
	end
	if myclass=="Priest" or myclass=="Mage" or myclass=="Warlock" then
		PickupSpellBookItem(SpellNum("Shoot"),BOOKTYPE_SPELL)
		PlaceAction(72)
		PickupSpellBookItem(SpellNum("Attack"),BOOKTYPE_SPELL)
		PlaceAction(71)
	elseif myclass=="Rogue" then
		if SpellExists("Backstab") then PickupSpellBookItem(SpellNum("Backstab"),BOOKTYPE_SPELL) end
		PlaceAction(71)
		PickupSpellBookItem(SpellNum("Attack"),BOOKTYPE_SPELL)
		PlaceAction(72)
	elseif myclass=="Druid" then
		if SpellExists("Ravage") then PickupSpellBookItem(SpellNum("Ravage"),BOOKTYPE_SPELL) end
		PlaceAction(71)
		PickupSpellBookItem(SpellNum("Attack"),BOOKTYPE_SPELL)
		PlaceAction(72)
	elseif myclass=="Hunter" then
		PickupSpellBookItem(SpellNum("Auto Shot"),BOOKTYPE_SPELL)
		PlaceAction(72)
		PickupSpellBookItem(SpellNum("Attack"),BOOKTYPE_SPELL)
		PlaceAction(71)
		if SpellExists("Immolation Trap") then
			PickupSpellBookItem(SpellNum("Freezing Trap"),BOOKTYPE_SPELL)
			PlaceAction(64)
		end
	else
		PickupSpellBookItem(SpellNum("Attack"),BOOKTYPE_SPELL)
		PlaceAction(72)
	end
end
end
function FindKeyInTable(table,string)
	if not table then return end
	for i,v in pairs(table) do
		if i==string and v then return true end
	end
	return nil
end
function TableLength(tab)
	--This utility tells you how many elements are in a table
	--if table doesn't exist, it's 0.
	if not tab then return 0 end
	local len=0
	for _ in pairs(tab) do
		len=len+1
	end
	return len
end
function findSpell(spellName, bookType)
   local i, s;
   local found = false;
   for i = 1, MAX_SKILLLINE_TABS do
     local name, texture, offset, numSpells = GetSpellTabInfo(i);
     if (not name) then break; end
     for s = offset + 1, offset + numSpells do
       local	spell, rank = GetSpellBookItemName(s, bookType);
       if (spell == spellName) then found = true; end
       if (found and spell ~=spellName) then return s-1; end
     end
   end
   if (found) then return s; end
   return nil;
 end
function clearmacros()
	MB_macronamestodelete={"self","healpot","manapot","tot","rez","setup","pull","feign","shackle","feed","single","multi","selfh","decurse","reload","dance","leave","makealine","drink","buff","healtank","aoe","turbo","int","passive","poly","h1","h2","h3","h4","h5","f1","f2","f3","f4","f5","a1","a2","a3","a4","a5","party","b0","b1","b2","b3","b4","b5"}
	for k,macname in pairs(MB_macronamestodelete) do
		while (GetMacroIndexByName(macname))>0 do
			local index=GetMacroIndexByName(macname)
			DeleteMacro(index)
		end
	end
	for i=0,20 do 
		while (GetMacroIndexByName("b"..i))>0 do
			local index=GetMacroIndexByName("b"..i)
			DeleteMacro(index)
		end
		while (GetMacroIndexByName("h"..i))>0 do
			local index=GetMacroIndexByName("h"..i)
			DeleteMacro(index)
		end
		while (GetMacroIndexByName("a"..i))>0 do
			local index=GetMacroIndexByName("a"..i)
			DeleteMacro(index)
		end
		while (GetMacroIndexByName("f"..i))>0 do
			local index=GetMacroIndexByName("f"..i)
			DeleteMacro(index)
		end
	end
end
function IsTank(name)
	if name then 
		return name==FSMB_tank
	end
end
function IsElementalShammy()
	if TalentPointsIn(1)==46 then return true end
	return TalentPointsIn(1)>=TalentPointsIn(2) and TalentPointsIn(1)>=TalentPointsIn(3)
end
function IsEnhanceShammy()
	return TalentPointsIn(2)>=TalentPointsIn(1) and TalentPointsIn(2)>=TalentPointsIn(3)
end
function IsRestoShammy()
	return TalentPointsIn(3)>TalentPointsIn(1) and TalentPointsIn(3)>=TalentPointsIn(2)
end
function IsHolyPally()
	return TalentPointsIn(1)>TalentPointsIn(2) and TalentPointsIn(1)>TalentPointsIn(3)
end
function IsPallyTank()
	return FindInTable(MB_raidtanks,UnitName("player"))
end
function IsFire()
	return (TalentPointsIn(2)>=TalentPointsIn(1) and TalentPointsIn(2)>=TalentPointsIn(3))
end
function IsFrost()
	return (TalentPointsIn(3)>TalentPointsIn(1) and TalentPointsIn(3)>TalentPointsIn(2))
end
function IsBoomkin()
	return not IsHybridDruid() and (TalentPointsIn(1)>=TalentPointsIn(2) and TalentPointsIn(1)>=TalentPointsIn(3))
end
function IsTouchOfShadowLock()
	n,ic,t,c,EM=GetTalentInfo(2,13)
	if EM>0 then return EM else return nil end
end
function IsDruidHealer()
	return not IsHybridDruid() and (TalentPointsIn(3)>TalentPointsIn(2) and TalentPointsIn(3)>TalentPointsIn(1))
end
function IsHybridDruid()
	return TalentPointsIn(3)>17 and TalentPointsIn(2)==0 and TalentPointsIn(1)>15
end
function IsShadow()
	return TalentPointsIn(3)>=TalentPointsIn(2) and TalentPointsIn(3)>=TalentPointsIn(1)
end
function IsFury()
	return TalentPointsIn(2)>TalentPointsIn(1) and TalentPointsIn(2)>TalentPointsIn(3)
end
function IsArms()
	return TalentPointsIn(1)>TalentPointsIn(2) and TalentPointsIn(1)>TalentPointsIn(3)
end
function IsMM()
	return TalentPointsIn(2)>TalentPointsIn(1) and TalentPointsIn(2)>TalentPointsIn(3)
end
function IsBM()
	return TalentPointsIn(1)>TalentPointsIn(2) and TalentPointsIn(1)>TalentPointsIn(3)
end
function IsEnhancementShammy()
	return TalentPointsIn(2)>TalentPointsIn(1) and TalentPointsIn(2)>TalentPointsIn(3)
end
-- specID for GSE
--[0] = "Global",
--  [1] = "Warrior",
--  [2] = "Paladin",
--  [3] = "Hunter",
--  [4] = "Rogue",
--  [5] = "Priest",
--  [6] = "Death Knight",
--  [7] = "Shaman",
--  [8] = "Mage",
--  [9] = "Warlock",
--  [10] = "Monk",
--  [11] = "Druid",
--  [12] = "Demon Hunter",
--  [62] = "Arcane",
--  [63] = "Fire",
--  [64] = "Frost - Mage",
--  [65] = "Holy - Paladin",
--  [66] = "Protection - Paladin",
--  [70] = "Retribution",
--  [71] = "Arms",
--  [72] = "Fury",
--  [73] = "Protection - Warrior",
--  [102] = "Balance",
--  [103] = "Feral",
--  [104] = "Guardian",
--  [105] = "Restoration - Druid",
--  [250] = "Blood",
--  [251] = "Frost - DK",
--  [252] = "Unholy",
--  [253] = "Beast Mastery",
--  [254] = "Marksmanship",
--  [255] = "Survival",
--  [256] = "Discipline",
--  [257] = "Holy - Priest",
--  [258] = "Shadow",
--  [259] = "Assassination",
--  [260] = "Outlaw",
--  [261] = "Subtlety",
--  [262] = "Elemental",
--  [263] = "Enhancement",
--  [264] = "Restoration - Shaman",
--  [265] = "Affliction",
--  [266] = "Demonology",
--  [267] = "Destruction",
--  [268] = "Brewmaster",
--  [269] = "Windwalker",
--  [270] = "Mistweaver",
--  [577] = "Havoc",
--  [581] = "Vengeance",
SLASH_FIND1="/find"
SlashCmdList["FIND"]=function(item)
	if item=="" then Print("Usage /find <classname or all or nothing> <wearing> item slot or string") return end
	AceComm.SendCommMessage(FSMB,"FSMB_FIND", item ,"RAID") 
end
FSMB = CreateFrame("frame","FSMB",UIParent)
function FSMB:OnCommReceived(prefix,item)
	FSMB_Find(item)
end
-- register the events we want to use (this is why we made the frame)
AceComm.RegisterComm(FSMB,"FSMB_FIND")
FSMB:RegisterEvent("ADDON_LOADED") -- register event "ADDON_LOADED"
FSMB:RegisterEvent("CHAT_MSG_ADDON")
FSMB:RegisterEvent("CONFIRM_SUMMON")
FSMB:RegisterEvent("RESURRECT_REQUEST")
FSMB:RegisterEvent("PLAYER_LOGIN")
FSMB:RegisterEvent("UI_ERROR_MESSAGE")
FSMB:RegisterEvent("AUTOFOLLOW_END")
FSMBtooltip=CreateFrame("GAMETOOLTIP", "FSMBtooltip", UIParent, "GameTooltipTemplate")
Print=print
function FSMB:OnEvent()
    if (event == "CHAT_MSG_ADDON") then
        Print("Addon message recieved from"..arg3)
        if arg1=="FSMB_FIND" then
            local item = arg2
            print("Got find request for "..item)
            MB_Find(item)
        end
    elseif event == "CONFIRM_SUMMON" then
    elseif event == "RESURRECT_REQUEST" then
    -- this event fires when you get a resurrect request
        AcceptResurrect() -- accepts resurrection
        StaticPopup_Hide("RESURRECT_NO_TIMER"); -- hides popup frame
        StaticPopup_Hide("RESURRECT_NO_SICKNESS"); -- hides popup frame
        StaticPopup_Hide("RESURRECT"); -- hides popup frame
    elseif (event == "UI_ERROR_MESSAGE") then
    elseif (event == "AUTOFOLLOW_END") then
        end
end
FSMB:SetScript("OnEvent", FSMB.OnEvent) -- event handler
FSMB:Show()
function TableReverse(table)
	local t={}
	if not table then return end
	for key,value in pairs(table) do
		t[value]=key
	end
	return t
end
function FSMB_Find(item)
	FSMB_slotmap={ [0]="ammo",[1]="head",[2]="neck",[3]="shoulder",[4]="shirt",[5]="chest",[6]="waist",[7]="legs",[8]="feet",[9]="wrist",[10]="hands",[11]="finger 1",[12]="finger 2",[13]="trinket 1",[14]="trinket 2",[15]="back",[16]="main hand",[17]="off hand",[18]="ranged",[19]="tabard"}
	FSMB_slotmap_i=TableReverse(FSMB_slotmap)
	local Rarity={["poor"]=0,["common"]=1,["uncommon"]=2,["rare"]=3,["epic"]=4,["legendary"]=5}
	--This is the function that determines what happens when you type /find
	if item=="" then Print("Usage /find <classname or all or nothing> <wearing> item slot or string") return end
	local class="all"
	local _,_,key=string.find(item,"(%a+)%s*")
	key=string.lower(key)
	local FSMB_classlist={"Warrior","Mage","Shaman","Paladin","Priest","Rogue","Druid","Hunter","Warlock"}
	classlist={}
	for _,class in pairs(FSMB_classlist) do
		table.insert(classlist,string.lower(class))
	end
	if FindInTable(classlist,key) then
		class=key
		_,_,item=string.find(item,"%a+%s(.*)")
		if not item then
			item=key
		else
			Print("Checking class "..key)
			_,_,key=string.find(item,"(%a+)%s*")
		end
	end
	if key=="all" then
		_,_,item=string.find(item,"%a+%s(.*)")
		_,_,key=string.find(item,"(%a+)%s*")
	end
	if key=="wearing" or key=="crapgear" then
		_,_,item=string.find(item,"%a+%s(.*)")
	end
	local myClass=string.lower(UnitClass("player"))
	if key=="crapgear" then
		if class~="all" and class~=myClass then return end
		Print("Finding crappy gear.")
		for inv=1,16 do
			if inv~=4 then
				local itemLink = GetInventoryItemLink("player",inv)
				local quality=GetInventoryItemQuality("player",inv)
				if not quality then
					FSMB_msg("MISSING: slot "..FSMB_slotmap[inv])
				elseif quality<3 then
					local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
					local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
					FSMB_msg("CRAP: "..itemEquipLoc.." "..inv.." "..itemLink)
				end
			end
		end
		return
	end
		if key=="boe" then
		Print("Finding boe items in bags")
		if class~="all" and class~=myClass then return end
		for bag=-1,11 do for slot=1,GetContainerNumSlots(bag) do
			local texture,itemCount,locked,quality,readable,lootable,link=GetContainerItemInfo(bag,slot)
			if texture then
				local link=GetContainerItemLink(bag,slot)
				local bsnum=string.gsub(link,".-\124H([^\124]*)\124h.*", "%1")
				local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
				_,itemCount=GetContainerItemInfo(bag,slot)
				local match=nil
				link=GetContainerItemLink(bag,slot)
				links=string.lower(link)
				items=string.lower(item)
				match = string.find(links, items)
				if IsUnboundBOE(bag,slot) then
					FSMB_msg("Found "..link.." in bag "..bag.." slot "..slot)
				end
			end
		end end
		return
	end
	if key=="wearing" then
		if not item then Print("You need to name an item or slot") return end
		Print("Finding "..class.." wearing "..item)
		if class~="all" and class~=myClass then return end
		for inv=1,19 do
			local itemLink = GetInventoryItemLink("player",inv)
			local quality=GetInventoryItemQuality("player",inv)
			if itemLink then
				local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
				local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
				local match=nil
				links=string.lower(itemLink)
				items=string.lower(item)
				match = string.find(links, items)
				if itemEquipLoc then
					match= match or string.find(string.lower(itemEquipLoc),items)
				end
				if itemRarity then
					match= match or itemRarity==Rarity[items]
				end
				if itemType then
					itemType=string.lower(itemType)
					match= match or string.find(itemType,items)
				end
				if itemSubType then
					itemSubType=string.lower(itemSubType)
					match= match or string.find(itemSubType,items)
				end
				if match then
					FSMB_msg("Found "..itemLink.." in slot "..FSMB_slotmap[inv])
				end
			end
		end
		return
			else
		if not item then Print("You need to name an item or slot") return end
			Print("Finding item "..item)
			if class~="all" and class~=myClass then return end
			for bag=-2,11 do
				local maxIndex=GetContainerNumSlots(bag)
				if bag==-2 then maxIndex=12 end
				for slot=1,maxIndex do
					local icon, itemCount, locked, quality, readable, lootable, itemLink, isFiltered, noValue, itemID = GetContainerItemInfo(bag,slot)
					if icon then
						local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
						local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
						local match=nil
						links=string.lower(itemName)
						items=string.lower(item)
						match = string.find(links, items)
					if itemEquipLoc then
						itemEquipLoc=string.lower(itemEquipLoc)
						match= match or string.find(itemEquipLoc,items)
					end
					if itemRarity then
						match= match or itemRarity==Rarity[items]
					end
					if itemType then
						itemType=string.lower(itemType)
						match= match or string.find(itemType,items)
					end
					if itemSubType then
						itemSubType=string.lower(itemSubType)
						match= match or string.find(itemSubType,items)
					end
					if match then
					FSMB_msg("Found "..itemLink.."x"..itemCount.." in bag "..bag.." slot "..slot)
					end
				end
			end
		end
	end
end
function IsUnboundBOE(b,s)
	local soulbound=nil
	local boe=nil
	--local _,_,itemID = string.find(itemlink, "item:(%d+)")
	FSMBtooltip:SetOwner(UIParent, "ANCHOR_NONE");
	FSMBtooltip:ClearLines()
	FSMBtooltip:SetBagItem(b,s);
	FSMBtooltip:Show()
	local index = 1
	local ltext = getglobal("FSMBtooltipTextLeft"..index):GetText()
	while ltext ~= nil do
		ltext = getglobal("FSMBtooltipTextLeft"..index):GetText()
		if ltext ~= nil then
			if string.find(ltext,"Soulbound") then
				soulbound=true
			end
			if string.find(ltext,"Binds when equipped") then
				boe=true
			end
		end
		index=index+1
	end
	if not soulbound and boe then return true end
end
function FSMB_msg(msg)
	--this is a raid message function with a 2 second cooldown to kind-of avoid some spamming.
	local cooldown=5
	local time=GetTime()
	if MB_prev_msg==msg and FSMB_msgcd+cooldown>time then return end
	MB_prev_msg=msg
	FSMB_msgcd=time
	if UnitInRaid("player") then
		SendChatMessage(msg,"RAID") return
	else
		SendChatMessage(msg,"PARTY") return
	end
	Print(msg)
end
function RangedWeaponType()
	local itemLink = GetInventoryItemLink("player",18)
	if not itemLink then return "Bow" end
	local bsnum=string.gsub(itemLink,".-\124H([^\124]*)\124h.*", "%1")
	local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon = GetItemInfo(bsnum)
	_,_,itemSubType=string.find(itemSubType,"(.*)s")
	return(itemSubType)
end
function printt(tab,indent)
	if indent == nil then indent = "" end
	indent = indent.."  "
	if type (tab) ~= "table" then
		print ("invoke with a table, you sent me a: ",type (tab) )
		return
   	end
   for k,v in pairs (tab) do
      if type (v) == "table" then
         print (indent,k," <TABLE>")
         printt (v, indent)
      else
         print (indent,k," = ",v)
      end
   end
end
print("Pally seal will be "..FSMB_myseal)
function SpellExists(spell)
	return GetSpellInfo(spell)
end
function IsRet()
	return (TalentPointsIn(3)>TalentPointsIn(1) and TalentPointsIn(3)>TalentPointsIn(2))
end
function TalentPointsIn(tab)
	points=0
	for t=1,GetNumTalents(tab) do
		n,ic,tier,c,EM=GetTalentInfo(tab,t)
		points=points+EM
	end
	return points
end
function FindInTable(table,string)
	--only works on 1D tables
	if not table then return end
	for i,v in pairs(table) do
		if v==string then return i end
	end
	return nil
end
