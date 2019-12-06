FSMB_version="120219b_classic"
AceComm=LibStub("AceComm-3.0")
print('Hello from 5mmb!')

-- Find players region and set the spelling for Rank and some other flakey things.
region=GetLocale()
local rankName,hearthStone,textSoulbound,textBoe
if (region == "deDE") then
rankName = "Rang"
hearthStone = "Ruhestein"
textSoulbound = "Seelengebunden"
textBoe = "Wird beim Anlegen gebunden"
elseif (region == "frFR") then
rankName = "Rang"
hearthStone = "Pierre de foyer"
textSoulbound = "Lié"
textBoe = "Lié quand équipé"
elseif (region == "esES" or region == "esMX") then
rankName = "Rango"
hearthStone = "Piedra de hogar"
textSoulbound = "Ligado"
textBoe = "Se liga al equiparlo"
elseif (region == "ptBR") then
rankName = "Grau"
hearthStone = "Pedra de Regresso"
textSoulbound = ""
textBoe = "Vinculado quando equipado"
elseif (region == "itIT") then
rankName = "Grado"
hearthStone = "Hearthstone"
textSoulbound = "Vincolato"
textBoe = "Si vincola all'equipaggiamento"
elseif (region == "ruRU") then
rankName = "???????"
hearthStone = "?????? ???????????"
textSoulbound = "???????????? ???????"
textBoe = "?????????? ???????????? ??? ?????????"
elseif (region == "zhCN" or region == "zhTW") then
rankName = "??"
hearthStone = "??"
textSoulbound = "???"
textBoe = "?????????? ???????????? ??? ?????????"
elseif (region == "koKR") then
rankName = "??"
hearthStone = "???"
textSoulbound = "?? ???"
textBoe = "?? ? ??"
else
rankName = "Rank"
hearthStone = "Hearthstone"
textSoulbound = "Soulbound"
textBoe = "Binds when equipped"
end
--
-- Find Spellnames by ID, result will be in players locale, tested with german & english
--local hearthStone = GetItemInfo(6948)
local priestHeal = GetSpellInfo(2050)
local shamanHeal = GetSpellInfo(331)
local druidHeal = GetSpellInfo(5185)
local palaHeal = GetSpellInfo(635)
local druidRebirth = GetSpellInfo(20484)
local crusaderSeal = GetSpellInfo(21082)
local rightSeal = GetSpellInfo(20154)
local devotionAura = GetSpellInfo(465)
local conjureWater = GetSpellInfo(5504)
local frostArmor = GetSpellInfo(168)
local iceArmor = GetSpellInfo(7302)
local arcaneIntellect = GetSpellInfo(1459)
local direBearForm = GetSpellInfo(9634)
local bearForm = GetSpellInfo(5487)
local freezingTrap = GetSpellInfo(1499)
local feignDeath = GetSpellInfo(5384)
local feedPet = GetSpellInfo(6991)
local callPet = GetSpellInfo(883)
local revivePet = GetSpellInfo(982)
local aspectHawk = GetSpellInfo(13165)
local shootBow = GetSpellInfo(2480)
local shootGun = GetSpellInfo(7918)
local shootCrossbow = GetSpellInfo(7919)
local druidThorns = GetSpellInfo(467)
local markOfTheWild = GetSpellInfo(1126)
local druidWrath = GetSpellInfo(5176)
local flameTongue = GetSpellInfo(8024)
local rockBiter = GetSpellInfo(8017)
local windFury = GetSpellInfo(8232)
local shackleUndead = GetSpellInfo(9484)
local innerFire = GetSpellInfo(588)
local pwFortitude = GetSpellInfo(1243)
local blessingWisdom = GetSpellInfo(19742)
local blessingMight = GetSpellInfo(19740)
local blessingKings = GetSpellInfo(20217)
local ancestralSpirit = GetSpellInfo(2008)
local priestRes = GetSpellInfo(2006)
local drainSoul = GetSpellInfo(1120)
local demonSkin = GetSpellInfo(687)
local demonArmor = GetSpellInfo(12956)
local magePoly = GetSpellInfo(118)
local druidHibernate = GetSpellInfo(2637)
local warlockBanish = GetSpellInfo(710)
local hammerJustice = GetSpellInfo(853)
local priestSilence = GetSpellInfo(15487)
local mageCounter = GetSpellInfo(2139)
local druidBash = GetSpellInfo(5211)
local earthShock = GetSpellInfo(8042)
local scatterShot = GetSpellInfo(19503)
local warPummel = GetSpellInfo(6552)
local rogueKick = GetSpellInfo(1766)
local palaCleanse = GetSpellInfo(4987)
local dispelMagic = GetSpellInfo(527)
local remLesserCurse = GetSpellInfo(475)
local remCurse = GetSpellInfo(2782)
local curePoison = GetSpellInfo(526)
--
FSMB_toonlist={[1]="Ulysses",[2]="Central",[3]="Wiggly",[4]="Thelnfinite",[5]="Antimagic"}
FSMB_tank="Ulysses"
FSMB_nomacros=nil
FSMB_healerlist={"Wiggly"}
FSMB_maxheal={DRUID=11,PRIEST=11,SHAMAN=11,PALADIN=11}
FSMB_mypoly={["PRIEST"]=(shackleUndead),["MAGE"]=(magePoly),["DRUID"]=(druidHibernate),["WARLOCK"]=(warlockBanish)}
FSMB_myint={["PALADIN"]=(hammerJustice),["PRIEST"]=(priestSilence),["MAGE"]=(mageCounter),["DRUID"]=(druidBash),["SHAMAN"]=(earthShock),["HUNTER"]=(scatterShot),["WARLOCK"]="",["WARRIOR"]=(warPummel),["ROGUE"]=(rogueKick),}
FSMB_decurse={["PALADIN"]=(palaCleanse),["PRIEST"]=(dispelMagic),["MAGE"]=(remLesserCurse),["DRUID"]=(remCurse),["SHAMAN"]=(curePoison),["HUNTER"]="None",["WARLOCK"]="None",["WARRIOR"]="None",["ROGUE"]="None",}
FSMB_heal_names={["PALADIN"]=(palaHeal),["PRIEST"]=(priestHeal),["DRUID"]=(druidHeal),["SHAMAN"]=(shamanHeal)}
FSMB_mydecurse=FSMB_decurse[UnitClass("player")]
myname=UnitName("player")

-- Find players class, first variable is in players locale, second in english and in CAPS
notUsed, myClass=UnitClass("player")
--
mylevel=UnitLevel("player")
if UnitLevel("player")>7 then
	FSMB_myseal=(crusaderSeal)
else
	FSMB_myseal=(rightSeal)
end
FSMB_myaura=(devotionAura)
SLASH_INIT1="/init"
SlashCmdList["INIT"]=function()
	init()
end
SLASH_VERSION1 = '/version'
	SlashCmdList['VERSION'] = function(arg)
	print("Furyswipes_5mmb version is "..FSMB_version)
end
FlashClientIcon = function() end
FSMB_msgcd=GetTime()
function init()
	if UnitAffectingCombat("player") then return end
	local myspec="UNKNOWN"
	if mylevel>39 then bearform=(direBearForm) else bearform=(bearForm) end
	--print (bearform)
	if myClass=="WARRIOR" then
		if IsTank(myname) then myspec="PROT"
		elseif IsFury() then myspec="FURY"
		else myspec="ARMS" end
	elseif myClass=="DRUID" then
		if IsBoomkin() then myspec="BOOMKIN"
		elseif IsDRUIDHealer() then myspec="RESTODRU"
		elseif IsTank(myname) then myspec="BEAR_TANK"
		else myspec="FERAL" end
	elseif myClass=="MAGE" then
		if IsFrost() then myspec="FROST"
		else myspec="FIRE" end
	elseif myClass=="SHAMAN" then
		if IsElementalShammy() then myspec="ELE"
		elseif IsEnhanceShammy() then myspec="ENH"
		else myspec="RESTOSHAM" end
	elseif myClass=="HUNTER" then
		if IsMM() then myspec="MM"
		elseif IsBM() then myspec="BM"
		else myspec="SURV" end
	elseif myClass=="PRIEST" then
		if IsShadow() then myspec="SHADOW"
		else myspec="HOLY" end
	elseif myClass=="HUNTER" then
		if IsMM() then myspec="MM"
		elseif IsBM() then myspec="BM"
		else myspec="SURV" end
	elseif myClass=="ROGUE" then
		myspec="COMBAT"
	elseif myClass=="WARLOCK" then
		myspec="DESTRO"
	elseif myClass=="PALADIN" then
		if IsPallyTank() then myspec="PROT"
		elseif IsHolyPally() then myspec="HOLY"
		else myspec="RET" end
	end
	clearmacros()
	local partymac=""
	for i=1,TableLength(FSMB_toonlist) do
		partymac=partymac.."/invite "..FSMB_toonlist[i].."\n"
	end
	local macroId = CreateMacroFS("party_fs", "Ability_HUNTER_pathfinding", partymac.."\n/run SetLootMethod(\"freeforall\",UnitName(\"player\"))" , nil);
	PickupMacro(macroId)
	PlaceAction(10)
	PickupMacro(macroId)
	PlaceAction(22)
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
			macroId = CreateMacroFS("f"..i.."_fs", "Ability_HUNTER_pet_gorilla", "", nil);
		else
			macroId = CreateMacroFS("f"..i.."_fs", "Ability_HUNTER_pet_gorilla", "/follow "..FSMB_toonlist[i], nil);
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
			macroId = CreateMacroFS("a"..i.."_fs", "Ability_HUNTER_pet_hyena", "", nil);
		else
			macroId = CreateMacroFS("a"..i.."_fs", "Ability_HUNTER_pet_hyena", "/assist "..FSMB_toonlist[i], nil);
		end
		PickupMacro(macroId)
		PlaceAction(slot+i)
		ClearCursor()
	end
	if myClass=="SHAMAN" and FindInTable(FSMB_healerlist,myname) then
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
			local heallist=""
			local x
			for x=1,FSMB_maxheal[myClass] do
				local heallev=FSMB_maxheal[myClass]-x+1
				-- Edited for multi language
				if SpellExists(FSMB_heal_names[myClass].."("..rankName.." "..heallev..")") then
					heallist=heallist.."\n/cast [@"..FSMB_toonlist[i].."] "..FSMB_heal_names[myClass].."("..rankName.." "..heallev..")"
					--
					break
				end
			end
  			macroId = CreateMacroFS("h"..i.."_fs", "spell_nature_healingtouch", "/run ClearCursor()\n/cleartarget"..heallist, nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	end
	if myClass=="PRIEST" and FindInTable(FSMB_healerlist,myname) then
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
			local heallist=""
			local x
			for x=1,FSMB_maxheal[myClass] do
				local heallev=FSMB_maxheal[myClass]-x+1
				if SpellExists(FSMB_heal_names[myClass].."("..rankName.." "..heallev..")") then
					heallist=heallist.."\n/cast [@"..FSMB_toonlist[i].."] "..FSMB_heal_names[myClass].."("..rankName.." "..heallev..")"
					break
				end
			end
  			macroId = CreateMacroFS("h"..i.."_fs", "spell_nature_healingtouch", "/run ClearCursor()\n/cleartarget"..heallist, nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	end
	if myClass=="PALADIN" and FindInTable(FSMB_healerlist,myname) then
			local slot=49
			local idx=0
			local i
			for i=1,TableLength(FSMB_toonlist) do
				local heallist=""
				local x
				for x=1,FSMB_maxheal[myClass] do
					local heallev=FSMB_maxheal[myClass]-x+1
					if SpellExists(FSMB_heal_names[myClass].."("..rankName.." "..heallev..")") then
					heallist=heallist.."\n/cast [@"..FSMB_toonlist[i].."] "..FSMB_heal_names[myClass].."("..rankName.." "..heallev..")"
						break
					end
				end
  				macroId = CreateMacroFS("h"..i.."_fs", "spell_nature_healingtouch", "/run ClearCursor()\n/cleartarget"..heallist, nil);
				PickupMacro(macroId)
				PlaceAction(slot+idx)
				ClearCursor()
				idx=idx+1
			end
	end
	if myClass=="DRUID" and FindInTable(FSMB_healerlist,myname) then
  		macroId = CreateMacroFS("rebirth_fs", "spell_nature_reincarnation", "\n/cancelform\n/cast "..druidRebirth.."", nil);
		PickupMacro(macroId)
		PlaceAction(68)
		ClearCursor()
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
			local heallist=""
			local x
			for x=1,FSMB_maxheal[myClass] do
				local heallev=FSMB_maxheal[myClass]-x+1
				if SpellExists(FSMB_heal_names[myClass].."("..rankName.." "..heallev..")") then
					heallist=heallist.."\n/cast [@"..FSMB_toonlist[i].."] "..FSMB_heal_names[myClass].."("..rankName.." "..heallev..")"
					break
				end
			end
  			macroId = CreateMacroFS("h"..i.."_fs", "spell_nature_healingtouch", "/run ClearCursor()\n/cleartarget"..heallist, nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	elseif myClass=="DRUID" then
		local slot=49
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
			local heallist=""
			local x
			for x=1,FSMB_maxheal[myClass] do
				local heallev=FSMB_maxheal[myClass]-x+1
				if SpellExists(FSMB_heal_names[myClass].."("..rankName.." "..heallev..")") then
					heallist=heallist.."\n/cast [@"..FSMB_toonlist[i].."] "..FSMB_heal_names[myClass].."("..rankName.." "..heallev..")"
					break
				end
			end
  			macroId = CreateMacroFS("h"..i.."_fs", "spell_nature_healingtouch", heallist, nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	end
	-- NONE OF THE FOLLOWING MACROS GET CREATED IF YOU put nomacros in your toonlist
	if not FSMB_nomacros then
	local macroId = CreateMacroFS("spit_fs", "Inv_misc_slime_01", "/spit", nil);
	PickupMacro(macroId)
	PlaceAction(59)
	ClearCursor()
	if myClass=="DRUID" then
		local macroId = CreateMacroFS("hearth_fs", "INV_Misc_QuestionMark", "/cancelform\n/use "..hearthStone.."", nil);
		PickupMacro(macroId)
		PlaceAction(26)
		ClearCursor()
	else
		PickupItem(hearthStone)
		PlaceAction(26)
		ClearCursor()
	end
	for i=1,TableLength(FSMB_toonlist) do
		if i==1 and myname==FSMB_toonlist[i] then
			macroId = CreateMacroFS("makealine_fs", "Ability_HUNTER_pet_tallstrider", "", nil);
		elseif myname==FSMB_toonlist[i] then
			macroId = CreateMacroFS("makealine_fs", "Ability_HUNTER_pet_tallstrider", "/follow "..FSMB_toonlist[i-1], nil);
		end
		PickupMacro(macroId)
		PlaceAction(60)
		ClearCursor()
	end

	if myClass=="HUNTER" then
		index=CreateMacroFS("feign_fs","INV_Misc_QuestionMark","/petfollow\n/petpassive\n/stopattack\n/cast "..freezingTrap.."\n/cast "..feignDeath.."",nil)
		PickupMacro(index)
		PlaceAction(61)
		index=CreateMacroFS("feed_fs","INV_Misc_QuestionMark","/cast [pet] "..feedPet.."\n/use 0 1\n/run ClearCursor()\n/cast [nopet] "..callPet.."\n/cast [@pet,dead] "..revivePet.."",nil)
		PickupMacro(index)
		PlaceAction(38)
		index=CreateMacroFS("hawk_fs","INV_Misc_QuestionMark","/cast !"..aspectHawk.."",nil)
		PickupMacro(index)
		PlaceAction(37)
		ClearCursor()
	end


	if myClass=="WARRIOR" and IsTank(myname) then
		print("Checking ranged weap")
		if myClass=="WARRIOR" and RangedWeaponType() and SpellExists(shootGun) then
			PickupSpellBookItem(shootGun)
			PlaceAction(61)
		elseif myClass=="WARRIOR" and RangedWeaponType() and SpellExists(shootCrossbow) then
			PickupSpellBookItem(shootCrossbow)
			PlaceAction(61)
		else
			PickupSpellBookItem(shootBow)
			PlaceAction(61)
		end
	end

	if myClass=="DRUID" then
  		macroId = CreateMacroFS("b0_fs", "INV_Misc_QuestionMark", "/cancelform\n/cast [@"..FSMB_tank.."] "..druidThorns.."", nil);
		PickupMacro(macroId)
		PlaceAction(37)
		ClearCursor()
		local slot=38
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
  			macroId = CreateMacroFS("b"..i.."_fs", "INV_Misc_QuestionMark", "/cancelform\n/cast [@"..FSMB_toonlist[i].."] "..markOfTheWild.."", nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
		macroId = CreateMacroFS("bufft_fs", "INV_Misc_QuestionMark", "/cast "..bearform.."\n/cancelform \n/castsequence [@target] reset=combat/target "..markOfTheWild..","..druidThorns..",null", nil);
		PickupMacro(macroId)
		PlaceAction(55)
		ClearCursor()
		PickupSpellBookItem(druidWrath)
		PlaceAction(61)
		ClearCursor()
	end
	if myClass=="DRUID" and IsTank(myname) then
  		macroId = CreateMacroFS("pull_fs", "INV_Misc_QuestionMark", "/cancelform [nocombat]\n/cast [nocombat] "..druidWrath.."", nil);
		PickupMacro(macroId)
		PlaceAction(61)
		ClearCursor()
	end
	if myClass=="SHAMAN" and FindInTable(FSMB_healerlist,myname) then
		if IsRestoShammy() then
			PickupSpellBookItem(flameTongue)
		else
			PickupSpellBookItem(rockBiter)
			PickupSpellBookItem(windFury)
		end
		PlaceAction(37)
		ClearCursor()
	end
	if myClass=="PRIEST" then
  		macroId = CreateMacroFS("shackle_fs", "INV_Misc_QuestionMark", "/cast "..shackleUndead.."", nil);
		PickupMacro(macroId)
		PlaceAction(62)
		ClearCursor()
		PickupSpellBookItem(innerFire)
		PlaceAction(37)
		ClearCursor()
		local slot=38
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
  			macroId = CreateMacroFS("b"..i.."_fs", "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] "..pwFortitude.."", nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
		macroId = CreateMacroFS("bufft_fs", "INV_Misc_QuestionMark", "/castsequence [@target] reset=combat/target "..pwFortitude..",null", nil);
		PickupMacro(macroId)
		PlaceAction(55)
		ClearCursor()
	end
	if myClass=="PALADIN" then
		if FindInTable(FSMB_healerlist,myname) then
  			macroId = CreateMacroFS("self_fs", "INV_Misc_QuestionMark", "/castsequence [@player] reset=combat "..blessingWisdom..","..devotionAura.."", nil);
			PickupMacro(macroId)
			PlaceAction(37)
			ClearCursor()
		else
  			macroId = CreateMacroFS("self_fs", "INV_Misc_QuestionMark", "/castsequence [@player] reset=combat "..blessingMight..","..devotionAura.."", nil);
			PickupMacro(macroId)
			PlaceAction(37)
			ClearCursor()
		end
		macroId = CreateMacroFS("bufft_fs", "INV_Misc_QuestionMark", "/castsequence [@target,nomod] reset=combat/target "..blessingMight..",null\n/castsequence [@target,mod:alt] reset=combat/target "..blessingWisdom.."", nil);
		PickupMacro(macroId)
		PlaceAction(55)
		ClearCursor()
		local slot=38
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
  			macroId = CreateMacroFS("b"..i.."_fs", "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] "..blessingKings.."", nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
	end
	if myClass=="SHAMAN" then
		local rezlist=""
		for i=1,TableLength(FSMB_toonlist) do
			rezlist=rezlist.."/target "..FSMB_toonlist[i].."\n/cast [dead] "..ancestralSpirit.."\n"
		end
  		macroId = CreateMacroFS("rez_fs", "spell_holy_resurrection", rezlist, nil);
		PickupMacro(macroId)
		PlaceAction(8)
		ClearCursor()
		PickupSpellBookItem(ancestralSpirit)
		PlaceAction(68)
		ClearCursor()
  		--macroId = CreateMacroFS("tot", "INV_Misc_QuestionMark", "/click "..myspec.."_TOT", nil);
		--PickupMacro(macroId)
		--PlaceAction(61)
		--ClearCursor()
	end
	if myClass=="PRIEST" then
		local rezlist=""
		for i=1,TableLength(FSMB_toonlist) do
			rezlist=rezlist.."/target "..FSMB_toonlist[i].."\n/cast [dead] "..priestRes.."\n"
		end
  		macroId = CreateMacroFS("rez_fs", "spell_holy_resurrection", rezlist, nil);
		PickupMacro(macroId)
		PlaceAction(8)
		ClearCursor()
		PickupSpellBookItem(priestRes)
		PlaceAction(68)
		ClearCursor()
	end
	if myClass=="DRUID" then
  		macroId = CreateMacroFS("rebirth_fs", "spell_nature_reincarnation", "\n/cancelform\n/cast "..druidRebirth.."", nil);
		PickupMacro(macroId)
		PlaceAction(68)
		ClearCursor()
	end
	if myClass=="WARLOCK" and SpellExists(drainSoul) then
		PickupSpellBookItem(drainSoul)
		PlaceAction(64)
		--index=CreateMacroFS("pet_fs","INV_Misc_QuestionMark","/cast [nopet, group, nocombat] Summon Imp\n/cast [nopet, nogroup, nocombat] Summon Voidwalker")
		PickupSpellBookItem(demonSkin)
		PickupSpellBookItem(demonArmor)
		PlaceAction(37)
		ClearCursor()
	end
	if myClass=="MAGE" then

		if findSpell(conjureWater,BOOKTYPE_SPELL) then
			PickupSpellBookItem(conjureWater)
			PlaceAction(12)
			ClearCursor()
		end
		PickupSpellBookItem(frostArmor)
		PickupSpellBookItem(iceArmor)
		PlaceAction(37)
		ClearCursor()
		local slot=38
		local idx=0
		local i
		for i=1,TableLength(FSMB_toonlist) do
  			macroId = CreateMacroFS("b"..i.."_fs", "INV_Misc_QuestionMark", "/cast [@"..FSMB_toonlist[i].."] "..arcaneIntellect.."", nil);
			PickupMacro(macroId)
			PlaceAction(slot+idx)
			ClearCursor()
			idx=idx+1
		end
		macroId = CreateMacroFS("bufft_fs", "INV_Misc_QuestionMark", "/castsequence [@target] reset=combat/target "..arcaneIntellect.."", nil);
		PickupMacro(macroId)
		PlaceAction(55)
		ClearCursor()
	else
		PickupAction(12)
		ClearCursor()
	end
	if FSMB_tank==myname or myClass=="HUNTER" or myClass=="WARRIOR" or myClass=="ROGUE" or myClass=="SHAMAN" or myClass=="PALADIN" then
  		macroId = CreateMacroFS("passive_fs", "Spell_magic_polymorphchicken", "/petfollow [mod:alt]\n/stopattack [mod:alt]", nil);
		PickupMacro(macroId)
		PlaceAction(62)
		ClearCursor()
	else
  		macroId = CreateMacroFS("poly_fs", "INV_Misc_QuestionMark", "/cast "..FSMB_mypoly[myClass], nil);
		PickupMacro(macroId)
		PlaceAction(62)
		ClearCursor()
	end
	--for healer,spelllist in pairs(FSMB_heal_names) do
		--if myClass==healer then
			--healcasts=""
			--for _,heal in pairs(spelllist) do
				--healcasts=healcasts.."/cast [@player] "..heal.."\n"
			--end
			--macroId = CreateMacroFS("selfh","INV_Misc_Questionmark",healcasts, nil);
			--PickupMacro(macroId)
			--PlaceAction(6)
			--ClearCursor()
		--end
	--end
	macroId = CreateMacroFS("buff_fs", "spell_holy_divinespirit", "", nil);
	PickupMacro(macroId)
	PlaceAction(57)
	ClearCursor()
	local index
	if myname==FSMB_tank then
		index=CreateMacroFS("setup_fs","Spell_magic_polymorphchicken","/click "..myspec.."_SETUP",nil)
	else
		index=CreateMacroFS("setup_fs","Spell_magic_polymorphchicken","/click "..myspec.."_SETUP\n/stopcasting [mod:alt]\n/cleartarget [mod:alt]",nil)
	end
	PickupMacro(index)
	PlaceAction(1)
	PickupMacro(index)
	PlaceAction(13)
	PickupMacro(index)
	PlaceAction(73)
	PickupMacro(index)
	PlaceAction(85)
	PickupMacro(index)
	PlaceAction(97)
	PickupMacro(index)
	PlaceAction(109)
	ClearCursor()
	index=CreateMacroFS("single_fs","ability_searingarrow","/click "..myspec.."_SINGLE",nil)
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
	if myClass=="HUNTER" then
		index=CreateMacroFS("rsingle_fs","ability_searingarrow","/click "..myspec.."_SINGLE_RANGED",nil)
	end
	PickupMacro(index)
	PlaceAction(14)
	ClearCursor()
	index=CreateMacroFS("multi_fs","ability_upgrademoonglaive","/click "..myspec.."_MULTI",nil)
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
	if myClass=="HUNTER" then
		index=CreateMacroFS("rmulti_fs","ability_upgrademoonglaive","/click "..myspec.."_MULTI_RANGED",nil)
	end
	PickupMacro(index)
	PlaceAction(15)
	ClearCursor()
	index=CreateMacroFS("turbo_fs","Spell_nature_lightning","/click "..myspec.."_TURBO\n/petpassive [mod:alt]\n/run SetView(4)",nil)
	PickupMacro(index)
	PlaceAction(4)
	PickupMacro(index)
	PlaceAction(16)
	PickupMacro(index)
	PlaceAction(76)
	PickupMacro(index)
	PlaceAction(88)
	PickupMacro(index)
	PlaceAction(100)
	PickupMacro(index)
	PlaceAction(112)
	ClearCursor()
	index=CreateMacroFS("aoe_fs","spell_fire_selfdestruct","/click "..myspec.."_AOE",nil)
	PickupMacro(index)
	PlaceAction(5)
	PickupMacro(index)
	PlaceAction(17)
	PickupMacro(index)
	PlaceAction(77)
	PickupMacro(index)
	PlaceAction(89)
	PickupMacro(index)
	PlaceAction(101)
	PickupMacro(index)
	PlaceAction(113)
	ClearCursor()
	macroId = CreateMacroFS("int_fs", "ability_DRUID_bash", "/cast "..FSMB_myint[myClass], nil);
	PickupMacro(macroId)
	PlaceAction(63)
	ClearCursor()
	--macroId = CreateMacroFS("decurse", "spell_nature_removecurse", "/click ".."DECURSE", nil);
	--PickupMacro(macroId)
	--PlaceAction(56)
	--ClearCursor()
	index=CreateMacroFS("reload_fs","spell_frost_stun","/reload",nil)
	PickupMacro(index)
	PlaceAction(31)
	ClearCursor()
	index=CreateMacroFS("leave_fs","spell_nature_purge","/script LeaveParty()",nil)
	PickupMacro(index)
	PlaceAction(30)
	ClearCursor()
	index=CreateMacroFS("dance_fs","ability_DRUID_aquaticform","/dance",nil)
	PickupMacro(index)
	PlaceAction(29)
	ClearCursor()
	end
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
	if myClass=="HUNTER" then
		SetBinding("SHIFT-9","ACTIONPAGE2")
		SetBinding("SHIFT-0","ACTIONPAGE1")
	else
		SetBinding("SHIFT-9","MULTIACTIONBAR1BUTTON9")
		SetBinding("SHIFT-0","MULTIACTIONBAR1BUTTON10")
	end
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
	CompactRaidFrameManager:Show()
	SetCVar("alwaysShowActionBars", true)
	SetCVar("raidFramesDisplayPowerBars", true)
	SetCVar("nameplateShowEnemies", true)
	SetCVar("nameplateShowFriends", true)
	SetCVar("enableFloatingCombatText", true)
	SetCVar("autointeract", true)
	SetCVar("autoInteract", true)
	SetCVar("autoQuestWatch", false)
	SetCVar("gameTip", false)
	SetCVar("statusText", true)
	SetCVar("statusTextDisplay", "NUMERIC")
	SetCVar("autoLootDefault", true)
	SetCVar("useCompactPartyFrames", 1)
	SetCVar("blockChannelInvites", true)
	SetCVar("instantQuestText", true)
	SetCVar("lootUnderMouse", true)
	SetCVar("nameplateMotion", true)
	SetCVar("autoSelfCast", false)
	SetCVar("showTutorials", false)
	SetCVar("ShowClassColorInFriendlyNameplate", true)
	SetCVar("showTargetOfTarget", true)
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
function CreateMacroFS(nameorid, icon, body, perCharacter)
    --print("CreateMacroFS: nameorid="..nameorid..", body="..body)
    name,_,body_,_ = GetMacroInfo(nameorid)
    --print("CreateMacroFS: name="..tostring(name)..", body_="..tostring(body_))
    if name then
        --print("Macro "..name.." already exist. NOT creating it again.")
        return name
    end
    return CreateMacro(nameorid, icon, body, perCharacter)
end
function DeleteMacroFS(indexorname)
    name,_,body,_ = GetMacroInfo(indexorname)
    if body then
        if not string.match(body, "^#noupdate") then
            --print("DELETE macro:      "..name.." and body: \n"..body)
            DeleteMacro(name)
        else
            --print("Found #noupdate macro:   "..name.." and body: \n"..body)
        end
    else
        --print("Nonexisting macro: "..indexorname)
    end
end
function clearmacros()
  print("Clearing Macros...")
  MB_macronamestodelete={"rsingle","rmulti","rebirth","hearth","pet","spit","bufft","self","rez","setup","pull","feign","shackle","feed","single","multi","selfh","decurse","reload","dance","leave","makealine","drink","buff","healtank","aoe","turbo","int","passive","poly","h1","h2","h3","h4","h5","f1","f2","f3","f4","f5","a1","a2","a3","a4","a5","party","b0","b1","b2","b3","b4","b5","rsingle_fs","rmulti_fs","rebirth_fs","hearth_fs","pet_fs","spit_fs","bufft_fs","self_fs","healpot_fs","manapot_fs","tot_fs","rez_fs","setup_fs","pull_fs","feign_fs","shackle_fs","feed_fs","single_fs","multi_fs","selfh_fs","decurse_fs","reload_fs","dance_fs","leave_fs","makealine_fs","drink_fs","buff_fs","healtank_fs","aoe_fs","turbo_fs","int_fs","passive_fs","poly_fs","h1_fs","h2_fs","h3_fs","h4_fs","h5_fs","f1_fs","f2_fs","f3_fs","f4_fs","f5_fs","a1_fs","a2_fs","a3_fs","a4_fs","a5_fs","party_fs","b0_fs","b1_fs","b2_fs","b3_fs","b4_fs","b5_fs"}
  for _,macname in pairs(MB_macronamestodelete) do
    DeleteMacroFS(macname)
  end
  print("Done clearing Macros!")
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
	return not IsHybridDRUID() and (TalentPointsIn(1)>=TalentPointsIn(2) and TalentPointsIn(1)>=TalentPointsIn(3))
end
function IsTouchOfShadowLock()
	n,ic,t,c,EM=GetTalentInfo(2,13)
	if EM>0 then return EM else return nil end
end
function IsDRUIDHealer()
	return not IsHybridDRUID() and (TalentPointsIn(3)>TalentPointsIn(2) and TalentPointsIn(3)>TalentPointsIn(1))
end
function IsHybridDRUID()
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
--  [1] = "WARRIOR",
--  [2] = "PALADIN",
--  [3] = "HUNTER",
--  [4] = "ROGUE",
--  [5] = "PRIEST",
--  [6] = "Death Knight",
--  [7] = "SHAMAN",
--  [8] = "MAGE",
--  [9] = "WARLOCK",
--  [10] = "Monk",
--  [11] = "DRUID",
--  [12] = "Demon HUNTER",
--  [62] = "Arcane",
--  [63] = "Fire",
--  [64] = "Frost - MAGE",
--  [65] = "Holy - PALADIN",
--  [66] = "Protection - PALADIN",
--  [70] = "Retribution",
--  [71] = "Arms",
--  [72] = "Fury",
--  [73] = "Protection - WARRIOR",
--  [102] = "Balance",
--  [103] = "Feral",
--  [104] = "Guardian",
--  [105] = "Restoration - DRUID",
--  [250] = "Blood",
--  [251] = "Frost - DK",
--  [252] = "Unholy",
--  [253] = "Beast Mastery",
--  [254] = "Marksmanship",
--  [255] = "Survival",
--  [256] = "Discipline",
--  [257] = "Holy - PRIEST",
--  [258] = "Shadow",
--  [259] = "Assassination",
--  [260] = "Outlaw",
--  [261] = "Subtlety",
--  [262] = "Elemental",
--  [263] = "Enhancement",
--  [264] = "Restoration - SHAMAN",
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
	local FSMB_classlist={"WARRIOR","MAGE","SHAMAN","PALADIN","PRIEST","ROGUE","DRUID","HUNTER","WARLOCK"}
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
			if string.find(ltext,"Soulbound") or string.find(ltext,textSoulbound) then
				soulbound=true
			end
			if string.find(ltext,"Binds when equipped") or string.find(ltext,textBoe) then
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
