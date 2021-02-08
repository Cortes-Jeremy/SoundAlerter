--[[SoundAlerter for 3.3.5a by Trolollolol - Sargeras - Molten-WoW.com
				Credits to Abatorlos of Spinebreaker, Duskashes, Superk
								Notes: Check spell IDs by rank first
								add death wish down, starfire, bladestorm down]]
local objP = {
	base = "_objects\\",
	ingi = "_objects\\ingineering\\",
	FA = "_objects\\firstAid\\"
}
local raceP = "_racial\\"

local dkP = {
	BD = "dk\\blood\\",
	FT = "dk\\frost\\",
	UH = "dk\\unholy\\",
	pet = "dk\\pet\\",
}
local druidP = {
	BL = "druid\\balance\\",
	FL = "druid\\feral\\",
	RT = "druid\\restoration\\",
}
local hunterP = {
	BM = "hunter\\beastmastery\\",
	MM = "hunter\\marksman\\",
	SV = "hunter\\survival\\",
	pet = "hunter\\_pet\\",
	crab = "hunter\\_pet\\crab\\",
	ravager = "hunter\\_pet\\ravager\\",
}
local mageP = {
	AR = "mage\\arcane\\",
	FE = "mage\\fire\\",
	FS = "mage\\frost\\",
	pet = "mage\\_pet\\",
}
local palyP = {
	HY = "paladin\\holy\\",
	PT = "paladin\\protection\\",
	RT = "paladin\\retribution\\",
}
local priestP = {
	DP = "priest\\discipline\\",
	HY = "priest\\holy\\",
	SP = "priest\\shadow\\",
}
local rogP = {
	AS = "rogue\\assassination\\",
	CT = "rogue\\combat\\",
	SB = "rogue\\subtlety\\",
}
local shamP = {
	EL = "shaman\\elemental\\",
	EH = "shaman\\enhancement\\",
	RT = "shaman\\restoration\\",
}
local wlP = {
	AF = "warlock\\affliction\\",
	DM = "warlock\\demonology\\",
	DT = "warlock\\destruction\\",
	felhunter = "warlock\\pet\\felhunter\\",
	succube = "warlock\\pet\\succube\\",
	voidwalker = "warlock\\pet\\voidwalker\\",
}
local warP = {
	AR = "warrior\\arms\\",
	FY = "warrior\\fury\\",
	PT = "warrior\\protection\\",
}

function SoundAlerter:GetSpellList ()
	return {

		auraApplied = {					-- aura applied [spellid] = ".mp3 file name",
			--Objects
			[54861] = objP.ingi.."nitroBoost",
			[54758] = objP.ingi.."hyperspeedAccelerator",

			--Races
			[58984] = raceP.."shadowmeld",
			[26297] = raceP.."berserking",
			[20594] = raceP.."stoneform",
			[20572] = raceP.."bloodFury",
			[33702] = raceP.."bloodFury",
			[7744] = raceP.."willOfTheForsaken",
			[28880] = raceP.."giftOfTheNaaru",

			--DK
				--Blood
				[45529] = dkP.BD.."bloodTap", -- New
				[49028] = dkP.BD.."dancingRuneWeapon", -- New
				[49016] = dkP.BD.."hysteria",
				[55233] = dkP.BD.."vampiricBlood",
				--Frost
				[57623] = dkP.FT.."hornOfWinter", --New
				[48792] = dkP.FT.."iceboundFortitude",
				[49039] = dkP.FT.."lichborne",
				[51271] = dkP.FT.."unbreakableArmor", --New
				--Unholy
				[48707] = dkP.UH.."antiMagicShell",
				[51052] = dkP.UH.."antiMagicZone", --New
				[49222] = dkP.UH.."boneShield",
			--

			--Druid
				--Balance
				[22812] = druidP.BL.."barkskin",
				[29166] = druidP.BL.."innervate",
				[17329] = druidP.BL.."naturesGrasp",	--rank 6
				[27009] = druidP.BL.."naturesGrasp",	--rank 7
				[53312] = druidP.BL.."naturesGrasp",	--rank 8
				[48505] = druidP.BL.."starfall",	--rank 1
				[53199] = druidP.BL.."starfall",	--rank 2
				[53200] = druidP.BL.."starfall",	--rank 3
				[53201] = druidP.BL.."starfall",	--rank 4
				[53307] = druidP.BL.."thorns",	--New
					--Proc
					[48518] = druidP.BL.."_proc\\".."lunarEclipse", --New
					[48517] = druidP.BL.."_proc\\".."solarEclipse", --New
					[16870] = druidP.BL.."_proc\\".."clearcasting",
				--Feral
				[50334] = druidP.FL.."berserk",
				[1850] = druidP.FL.."dash",	--rank 1
				[9821] = druidP.FL.."dash",	--rank 2
				[33357] = druidP.FL.."dash",	--rank 3
				[5229] = druidP.FL.."enrage", --New
				[22842] = druidP.FL.."frenziedRegeneration",
				[52610] = druidP.FL.."savageRoar", --New
				[61336] = druidP.FL.."survivalInstincts",
					--PROC
					[69369] = druidP.FL.."_proc\\".."predatorsSwiftness",		-- NEW
				--Restauration
				[48470] = druidP.RT.."giftOfTheWild", --New
				[48469] = druidP.RT.."markOfTheWild", --New
				[17116] = druidP.RT.."naturesSwiftness",
			--

			--Hunter
				--Beastmastery
				[34027] = hunterP.BM.."killCommand", --New
				[54216] = hunterP.BM.."mastersCall", --New
					--Proc
					[34471] = hunterP.BM.."theBeastWithin",
				--Marksmanship
				[3045] = hunterP.MM.."rapidFire", -- NEW
				--Survival
				[19263] = hunterP.SV.."deterrence",
				[35079] = hunterP.SV.."misdirection", --New
				--Pet
					[53480] = hunterP.pet.."roarOfSacrifice",
					[53517] = hunterP.pet.."roarOfRecovery", --New
					[1742] = hunterP.pet.."petCower", --New
					--Crab
					[53476] = hunterP.crab.."petIntervene", --New
					[53479] = hunterP.crab.."petLaststand", --New
					--Ravarger
					[61684] = hunterP.ravager.."petDash", --New
			--

			--Mage
				--Arcane
				[12042] = mageP.AR.."arcanePower",
				[66] = mageP.AR.."invisibility", --New
				[43020] = mageP.AR.."manaShield", --New
				[12043] = mageP.AR.."presenceOfMind",
				[130] = mageP.AR.."slowFall", --New
					--Proc
					[44401] = mageP.AR.."_proc\\".."missileBarrage", --New
				--Fire
				[28682] = mageP.FE.."combustion",
				[43010] = mageP.FE.."fireWard", --New
					--Proc
					[31643] = mageP.FE.."_proc\\".."blazingSpeed", --New
					[64343] = mageP.FE.."_proc\\".."impact", --New
					[48108] = mageP.FE.."_proc\\".."hotStreak", --New
				--Frost
				[43012] = mageP.FS.."frostWard",
				[43039] = mageP.FS.."iceBarrier", -- New
				[45438] = mageP.FS.."iceBlock",
				[12472] = mageP.FS.."icyveins",
					--Proc
					[74396] = mageP.FS.."_proc\\".."fingersOfFrost", --New
					[57761] = mageP.FS.."_proc\\".."brainFreeze", --New
			--

			--Paladin
				--Holy
				[31821] = palyP.HY.."auraMastery",
				[53563] = palyP.HY.."beaconOfLight", --New
				[31842] = palyP.HY.."divineIllumination", --New
				[54428] = palyP.HY.."divinePlea", --New
				[53601] = palyP.HY.."sacredShield", --New
					--Proc
					[54149] = palyP.HY.."_proc\\".."infusionOfLight", --New
				--Protection
				[498] = palyP.PT.."divineProtection",
				[64205] = palyP.PT.."divineSacrifice",
				[642] = palyP.PT.."divineShield",
				[1044] = palyP.PT.."handOfFreedom",
				[1022] = palyP.PT.."handOfProtection",	--Hand of Protection rank 1
				[5599] = palyP.PT.."handOfProtection",	--Hand of Protection rank 2
				[10278] = palyP.PT.."handOfProtection",	--Hand of Protection rank 3
				[6940] = palyP.PT.."handofsacrifice",
				[1038] = palyP.PT.."handofsalvation", --New
				[25780] = palyP.PT.."righteousFury", --New
					--Proc
					[20178] = palyP.PT.."_proc\\".."reckoning", --New
				--Retribution
				[31884] = palyP.RT.."avengingWrath", --New
					--Proc
					[59578] = palyP.RT.."_proc\\".."theArtOfWar", --New
					[54203] = palyP.RT.."_proc\\".."sheathOfLight", --New
			--

			--Priest
				--Discipline
				[6346] = priestP.DP.."fearWard",
				[48168] = priestP.DP.."innerFire", --New
				[33206] = priestP.DP.."painSuppression",
				[10060] = priestP.DP.."powerInfusion",
				[48066] = priestP.DP.."powerWordShield", --New
				--Holy
				[47788] = priestP.HY.."guardianSpirit",
				--Shadow
				[47585] = priestP.SP.."dispersion",
				[586] = priestP.SP.."fade",	--New
				[15473] = priestP.SP.."shadowForm",	--New
			--

			--Rogue
				--Assassination
				[14177] = rogP.AS.."coldBlood",
				--Combat
				[13750] = rogP.CT.."adrenalineRush",	--New
				[5277] = rogP.CT.."evasion", --Evasion rank 1
				[26669] = rogP.CT.."evasion", --Evasion rank 2
				[48659] = rogP.CT.."feint",		  -- NEW
				[51690] = rogP.CT.."killingSpree", -- NEW
				[2983] = rogP.CT.."sprint",	--Sprint rank 1
				[8696] = rogP.CT.."sprint",	--Sprint rank 3
				[11305] = rogP.CT.."sprint",	--Sprint rank 2
				--Subtlety
				[31224] = rogP.SB.."cloakOfShadows",
				[51713] = rogP.SB.."shadowDance",
				[57934] = rogP.SB.."trickOfTheTrade", --New (A revoir)
				[45182] = rogP.SB.."cheatDeath",   -- New
			--

			--Shaman
				--Elemental
				[16166] = shamP.EL.."elementalMastery",
				--Enhancement
				[2645] = shamP.EH.."ghostWolf", --new
				[32182] = shamP.EH.."heroism", --new
				[2825] = shamP.EH.."bloodlust",
				[30823] = shamP.EH.."shamanisticRage",
					--Proc
					[53817] = shamP.EH.."_proc\\".."maelstromWeapon",
				--Restoration
				[974] = shamP.RT.."earthShield",	--Earth Shield rank 1
				[32593] = shamP.RT.."earthShield",	--Earth Shield rank 2
				[32594] = shamP.RT.."earthShield",	--Earth Shield rank 3
				[49283] = shamP.RT.."earthShield",	--Earth Shield rank 4
				[49284] = shamP.RT.."earthShield",	--Earth Shield rank 5
				[52127] = shamP.RT.."waterShield",	--Water Shield rank 1
				[52129] = shamP.RT.."waterShield",	--Water Shield rank 2
				[52131] = shamP.RT.."waterShield",	--Water Shield rank 3
				[52134] = shamP.RT.."waterShield",	--Water Shield rank 4
				[52136] = shamP.RT.."waterShield",	--Water Shield rank 5
				[52138] = shamP.RT.."waterShield",	--Water Shield rank 6
				[24398] = shamP.RT.."waterShield",	--Water Shield rank 7
				[33736] = shamP.RT.."waterShield",	--Water Shield rank 8
				[57960] = shamP.RT.."waterShield",	--Water Shield rank 9
				[16188] = shamP.RT.."naturesSwiftness",
			--

			--Warlock
				--Affliction
					--Proc
					[17941] = wlP.AF.."_proc\\".."shadowtrance",
				--Demonology
				[47891] = wlP.DM.."shadowWard", --New (pas de son pour le down)
				[18708] = wlP.DM.."felDomination",	 -- NEW
				--Destruction
					--Proc
					[54277] = wlP.DT.."_proc\\".."backdraft",	 	 -- NEW
			--

			--Warrior
				--Arms
				[46924] = warP.AR.."bladestorm",
				[20230] = warP.AR.."Retaliation",
				[12328] = warP.AR.."sweepingStrikes",
					--Proc
					[60503] = warP.AR.."_proc\\".."tasteForBlood",
				--Fury
				[18499] = warP.FY.."berserkerRage", --New (manque le son du down)
				[12292] = warP.FY.."deathWish", --New (manque le son du down)
				[55694] = warP.FY.."enragedRegeneration",
				[1719] = warP.FY.."recklessness",
				[47436] = warP.FY.."battleShout",	 -- NEW
				[47440] = warP.FY.."commandingShout", -- NEW
				--Protection
				[12975] = warP.PT.."lastStand",
				[2565] = warP.PT.."shieldBlock", --New
				[871] = warP.PT.."shieldWall",
				[23920] = warP.PT.."spellReflection",
					--Proc
					[50227] = warP.PT.."_proc\\".."swordAndBoard", --New
			--
		},
		auraRemoved = {

			--Objects
			[54861] = objP.."nitroBoostDown",
			[54758] = objP.."hyperspeedAcceleratorDown",

			--Races
			[58984] = raceP.."shadowmeldDown",
			[26297] = raceP.."berserkingDown",
			[20594] = raceP.."stoneformDown",
			[20572] = raceP.."bloodFuryDown",
			[33702] = raceP.."bloodFuryDown",
			[7744] = raceP.."willOfTheForsakenDown",
			[28880] = raceP.."giftOfTheNaaruDown",


			--DK
				--Blood
				[45529] = dkP.BD.."bloodTapDown", -- New
				[49028] = dkP.BD.."dancingRuneWeaponDown", -- New
				[49016] = dkP.BD.."hysteriaDown",
				[55233] = dkP.BD.."vampiricBloodDown",
				--Frost
				[57623] = dkP.FT.."hornOfWinterDown", --New
				[48792] = dkP.FT.."iceboundFortitudeDown",
				[49039] = dkP.FT.."lichborneDown",
				[51271] = dkP.FT.."unbreakableArmorDown", --New
				--Unholy
				[48707] = dkP.UH.."antiMagicShellDown",
				[51052] = dkP.UH.."antiMagicZoneDown", --New
				[49222] = dkP.UH.."boneShieldDown",
			--

			--Druid
				--Balance
				[22812] = druidP.BL.."barkskinDown",
				[29166] = druidP.BL.."innervateDown",
				[17329] = druidP.BL.."naturesGraspDown",	--rank 6
				[27009] = druidP.BL.."naturesGraspDown",	--rank 7
				[53312] = druidP.BL.."naturesGraspDown",	--rank 8
				[48505] = druidP.BL.."starfallDown",	--rank 1
				[53199] = druidP.BL.."starfallDown",	--rank 2
				[53200] = druidP.BL.."starfallDown",	--rank 3
				[53201] = druidP.BL.."starfallDown",	--rank 4
				[53307] = druidP.BL.."thornsDown",	--New
					--Proc
					[48518] = druidP.BL.."_proc\\".."lunarEclipseFown", --New
					[48517] = druidP.BL.."_proc\\".."solarEclipseDown", --New
					[16870] = druidP.BL.."_proc\\".."clearcastingDown",
				--Feral
				[50334] = druidP.FL.."berserkDown",
				[1850] = druidP.FL.."dashDown",	--rank 1
				[9821] = druidP.FL.."dashDown",	--rank 2
				[33357] = druidP.FL.."dashDown",	--rank 3
				[5229] = druidP.FL.."enrageDown", --New
				[22842] = druidP.FL.."frenziedRegenerationDown",
				[52610] = druidP.FL.."savageRoarDown", --New
				[61336] = druidP.FL.."survivalInstinctsDown",
					--PROC
					[69369] = druidP.FL.."predatorsSwiftnessDown",		-- NEW
				--Restauration
				[48470] = druidP.RT.."giftOfTheWildDown", --New
				[48469] = druidP.RT.."markOfTheWildDown", --New
				[17116] = druidP.RT.."naturesSwiftnessDown",
			--

			--Hunter
				--Beastmastery
				[34027] = hunterP.BM.."killCommandDown", --New
				[54216] = hunterP.BM.."mastersCallDown", --New
					--Proc
					[34471] = hunterP.BM.."_proc\\".."theBeastWithinDown",
				--Marksmanship
				[3045] = hunterP.MM.."rapidFireDown", -- NEW
				--Survival
				[19263] = hunterP.SV.."deterrenceDown",
				[35079] = hunterP.SV.."misdirectionDown", --New
				--Pet
					[53480] = hunterP.pet.."roarOfSacrificeDown",
					[53517] = hunterP.pet.."roarOfRecoveryDown", --New
					[1742] = hunterP.pet.."petCowerDown", --New
					--Crab
					[53476] = hunterP.crab.."petInterveneDown", --New
					[53479] = hunterP.crab.."petLaststandDown", --New
					--Ravarger
					[61684] = hunterP.ravager.."petDashDown", --New
			--

			--Mage
				--Arcane
				[12042] = mageP.AR.."arcanePowerDown",
				[66] = mageP.AR.."invisibilityDown", --New
				[43020] = mageP.AR.."manaShieldDown", --New
				[12043] = mageP.AR.."presenceOfMindDown",
				[130] = mageP.AR.."slowFallDown", --New
					--Proc
					[44401] = mageP.AR.."_proc\\".."missileBarrageDown", --New
				--Fire
				[28682] = mageP.FE.."combustionDown",
				[43010] = mageP.FE.."fireWardDown", --New
					--Proc
					[31643] = mageP.FE.."_proc\\".."blazingSpeedDown", --New
					[64343] = mageP.FE.."_proc\\".."impactDown", --New
					[48108] = mageP.FE.."_proc\\".."hotStreakDown", --New
				--Frost
				[43012] = mageP.FS.."frostWardDown",
				[43039] = mageP.FS.."iceBarrierDown", -- New
				[45438] = mageP.FS.."iceBlockDown",
				[12472] = mageP.FS.."icyveinsDown",
					--Proc
					[74396] = mageP.FS.."_proc\\".."fingersOfFrostDown", --New
					[57761] = mageP.FS.."_proc\\".."brainFreezeDown", --New
			--

			--Paladin
				--Holy
				[31821] = palyP.HY.."auraMasteryDown",
				[53563] = palyP.HY.."beaconOfLightDown", --New
				[31842] = palyP.HY.."divineIlluminationDown", --New
				[54428] = palyP.HY.."divinePleaDown", --New
				[53601] = palyP.HY.."sacredShieldDown", --New
					--Proc
					[54149] = palyP.HY.."_proc\\".."infusionOfLightDown", --New
				--Protection
				[498] = palyP.PT.."divineProtectionDown",
				[64205] = palyP.PT.."divineSacrificeDown",
				[642] = palyP.PT.."divineShieldDown",
				[1044] = palyP.PT.."handOfFreedomDown",
				[1022] = palyP.PT.."handOfProtectionDown",	--Hand of Protection rank 1
				[5599] = palyP.PT.."handOfProtectionDown",	--Hand of Protection rank 2
				[10278] = palyP.PT.."handOfProtectionDown",	--Hand of Protection rank 3
				[6940] = palyP.PT.."handofsacrificeDown",
				[1038] = palyP.PT.."handofsalvationDown", --New
				[25780] = palyP.PT.."righteousFuryDown", --New
					--Proc
					[20178] = palyP.PT.."_proc\\".."reckoningDown", --New
				--Retribution
				[31884] = palyP.RT.."avengingWrathDown", --New (manque le son de down)
					--Proc
					[59578] = palyP.RT.."_proc\\".."theArtOfWarDown", --New
					[54203] = palyP.RT.."_proc\\".."sheathOfLightDown", --New (manque le son de down)
			--

			--Priest
				--Discipline
				[6346] = priestP.DP.."fearWardDown",
				[48168] = priestP.DP.."innerFireDown", --New
				[33206] = priestP.DP.."painSuppressionDown",
				[10060] = priestP.DP.."powerInfusionDown",
				[48066] = priestP.DP.."powerWordShieldDown", --New
				--Holy
				[47788] = priestP.HY.."guardianSpiritDown",
				--Shadow
				[47585] = priestP.SP.."dispersionDown",
				[586] = priestP.SP.."fadeDown",	--New
				[15473] = priestP.SP.."shadowFormDown",	--New
			--

			--Rogue
				--Assassination
				[14177] = rogP.AS.."coldBlood",
				--Combat
				[13750] = rogP.CT.."adrenalineRushDown",	--New
				[5277] = rogP.CT.."evasionDown", --Evasion rank 1
				[26669] = rogP.CT.."evasionDown", --Evasion rank 2
				[48659] = rogP.CT.."feintDown",		  -- NEW
				[51690] = rogP.CT.."killingSpreeDown", -- NEW
				[2983] = rogP.CT.."sprintDown",	--Sprint rank 1
				[8696] = rogP.CT.."sprintDown",	--Sprint rank 3
				[11305] = rogP.CT.."sprintDown",	--Sprint rank 2
				--Subtlety
				[31224] = rogP.SB.."cloakOfShadowsDown",
				[51713] = rogP.SB.."shadowDanceDown",
				[57934] = rogP.SB.."trickOfTheTradeDown", --New (A revoir)
				[45182] = rogP.SB.."cheatingDeathDown",   -- New
			--

			--Shaman
				--Elemental
				[16166] = shamP.EL.."elementalMasteryDown",
				--Enhancement
				[2645] = shamP.EH.."ghostWolfDown", --new
				[32182] = shamP.EH.."heroismDown", --new
				[2825] = shamP.EH.."bloodlustDown",
				[30823] = shamP.EH.."shamanisticRageDown",
					--Proc
					[53817] = shamP.EH.."_proc\\".."maelstromWeaponDown",
				--Restoration
				[974] = shamP.RT.."earthShieldDown",	--Earth Shield rank 1
				[32593] = shamP.RT.."earthShieldDown",	--Earth Shield rank 2
				[32594] = shamP.RT.."earthShieldDown",	--Earth Shield rank 3
				[49283] = shamP.RT.."earthShieldDown",	--Earth Shield rank 4
				[49284] = shamP.RT.."earthShieldDown",	--Earth Shield rank 5
				[52127] = shamP.RT.."waterShieldDown",	--Water Shield rank 1
				[52129] = shamP.RT.."waterShieldDown",	--Water Shield rank 2
				[52131] = shamP.RT.."waterShieldDown",	--Water Shield rank 3
				[52134] = shamP.RT.."waterShieldDown",	--Water Shield rank 4
				[52136] = shamP.RT.."waterShieldDown",	--Water Shield rank 5
				[52138] = shamP.RT.."waterShieldDown",	--Water Shield rank 6
				[24398] = shamP.RT.."waterShieldDown",	--Water Shield rank 7
				[33736] = shamP.RT.."waterShieldDown",	--Water Shield rank 8
				[57960] = shamP.RT.."waterShieldDown",	--Water Shield rank 9
				[16188] = shamP.RT.."naturesSwiftnessDown",
			--

			--Warlock
				--Affliction
					--Proc
					[17941] = wlP.AF.."_proc\\".."shadowtranceDown",
				--Demonology
				[47891] = wlP.DM.."shadowWardDown", --New (pas de son pour le down)
				[18708] = wlP.DM.."felDominationDown", -- NEW
				--Destruction
					--Proc
					[54277] = wlP.DT.."_proc\\".."backdraftDown", -- NEW
			--

			--Warrior
				--Arms
				[46924] = warP.AR.."bladestormDown",
				[20230] = warP.AR.."RetaliationDown",
				[12328] = warP.AR.."sweepingStrikesDown",
					--Proc
					[60503] = warP.AR.."_proc\\".."tasteForBloodDown",
				--Fury
				[18499] = warP.FY.."berserkerRageDown", --New (manque le son du down)
				[12292] = warP.FY.."deathWishDown", --New (manque le son du down)
				[55694] = warP.FY.."enragedRegenerationDown",
				[1719] = warP.FY.."recklessnessDown",
				[47440] = warP.FY.."commandingShoutDown", -- NEW
				[47436] = warP.FY.."battleShoutDown",	 -- NEW
				--Protection
				[12975] = warP.PT.."lastStandDown",
				[2565] = warP.PT.."shieldBlockDown", --New
				[871] = warP.PT.."shieldWallDown",
				[23920] = warP.PT.."spellReflectionDown",
					--Proc
					[50227] = warP.PT.."_proc\\".."swordAndBoardDown", --New
			--
		},
		castStart = {

			--general
			[635] = "bigHeal",	--Holy Light rank 1
			[639] = "bigHeal",	--Holy Light rank 2
			[647] = "bigHeal",	--Holy Light rank 3
			[1026] = "bigHeal",	--Holy Light rank 4
			[1042] = "bigHeal",	--Holy Light rank 5
			[3472] = "bigHeal",	--Holy Light rank 6
			[10328] = "bigHeal",	--Holy Light rank 7
			[10329] = "bigHeal",	--Holy Light rank 8
			[25292] = "bigHeal",	--Holy Light rank 9
			[27135] = "bigHeal",	--Holy Light rank 10
			[27136] = "bigHeal",	--Holy Light rank 11
			[48782] = "bigHeal",	--Holy Light rank 12
			[2054] = "bigHeal",		--Heal rank 1
			[2055] = "bigHeal",		--Heal rank 2
			[6063] = "bigHeal",		--Heal rank 3
			[6064] = "bigHeal",		--Heal rank 4
			[2060] = "bigHeal",		--Greater Heal rank 1
			[332] = "bigHeal",	--Healing Wave rank 2
			[547] = "bigHeal",	--Healing Wave rank 3
			[913] = "bigHeal",	--Healing Wave rank 4
			[939] = "bigHeal",	--Healing Wave rank 5
			[959] = "bigHeal",	--Healing Wave rank 6
			[8005] = "bigHeal",	--Healing Wave rank 7
			[10395] = "bigHeal",	--Healing Wave rank 8
			[10396] = "bigHeal",	--Healing Wave rank 9
			[25357] = "bigHeal",	--Healing Wave rank 10
			[25391] = "bigHeal",	--Healing Wave rank 11
			[25396] = "bigHeal",	--Healing Wave rank 12
			[49272] = "bigHeal",	--Healing Wave rank 13
			[49273] = "bigHeal",	--Healing Wave rank 14
			--Druid
			--Restauration
			[5185] = "bigHeal",		--Healing Touch rank 1
			[5186] = "bigHeal",		--Healing Touch rank 2
			[5187] = "bigHeal",		--Healing Touch rank 3
			[5188] = "bigHeal",		--Healing Touch rank 4
			[5189] = "bigHeal",		--Healing Touch rank 5
			[6778] = "bigHeal",		--Healing Touch rank 6
			[8903] = "bigHeal",		--Healing Touch rank 7
			[9758] = "bigHeal",		--Healing Touch rank 8
			[9888] = "bigHeal",		--Healing Touch rank 9
			[9889] = "bigHeal",		--Healing Touch rank 10
			[25297] = "bigHeal",		--Healing Touch rank 11
			[26978] = "bigHeal",		--Healing Touch rank 12
			[26979] = "bigHeal",		--Healing Touch rank 13
			[48377] = "bigHeal",		--Healing Touch rank 14
			[48378] = "bigHeal",		--Healing Touch rank 15
			[50464] = "bigHeal",		--Nourish
			--
			[2006] = "resurrection",	--Resurrection (priest) rank 1
			[2010] = "resurrection",	--Resurrection (priest) rank 2
			[10880] = "resurrection",	--Resurrection (priest) rank 3
			[10881] = "resurrection",	--Resurrection (priest) rank 4
			[20770] = "resurrection",	--Resurrection (priest) rank 5
			[25435] = "resurrection",	--Resurrection (priest) rank 6
			[48171] = "resurrection",	--Resurrection (priest) rank 7
			[7328] = "resurrection",	--Redemption rank 1
			[10322] = "resurrection",	--Redemption rank 2
			[10324] = "resurrection",	--Redemption rank 3
			[20772] = "resurrection",	--Redemption rank 4
			[20773] = "resurrection",	--Redemption rank 5
			[48949] = "resurrection",	--Redemption rank 6
			[48950] = "resurrection",	--Redemption rank 7
			[2008] = "resurrection",	--Ancestral Spirit rank 1
			[20609] = "resurrection",	--Ancestral Spirit rank 2
			[50769] = "resurrection",	--Revive rank 1
			[50768] = "resurrection",	--Revive rank 2
			[50767] = "resurrection",	--Revive rank 3
			[50766] = "resurrection",	--Revive rank 4
			[50765] = "resurrection",	--Revive rank 5
			[50764] = "resurrection",	--Revive rank 6
			[50763] = "resurrection",	--Revive rank 7


			--DK
			--Druid
				--Balance
				[18658] = druidP.BL.."hibernate",
				[2637] = druidP.BL.."hibernate",
				[48467] = druidP.BL.."hurricane", --New
				[33786] = druidP.BL.."cyclone",  --works
				[48465] = druidP.BL.."starfire", --rank 10
				[53308] = druidP.BL.."entanglingRoots", -- NEW
				[48461] = druidP.BL.."wrath", -- NEW
				--Restoration
				[48443] = druidP.RT.."regrowth", -- NEW
				[48447] = druidP.RT.."tranquility", -- NEW
			--

			--Hunter
				--Beast Mastery
				[14327] = hunterP.BM.."scareBeast",
				[982] = hunterP.BM.."revivePet",
				--Marksmanship
				[49052] = hunterP.MM.."steadyShot", --New
			--

			--mage
				--arcane
				[42897] = mageP.AR.."arcaneBlast", --New
				[118] = mageP.AR.."polymorph", --Can be poly:turtle, cat, sheep, etc
				[12826] = mageP.AR.."polymorph",
				[28272] = mageP.AR.."polymorph",
				[61305] = mageP.AR.."polymorph",
				[61721] = mageP.AR.."polymorph",
				[61025] = mageP.AR.."polymorph",
				[61780] = mageP.AR.."polymorph",
				[28271] = mageP.AR.."polymorph",
				[42846] = mageP.AR.."arcaneMissiles", 	-- NEW (probably not working)
				--Fire
				[42833] = mageP.FE.."fireBall", 	-- New
				[42926] = mageP.FE.."flameStrike", 	-- New
				[47610] = mageP.FE.."frostFireBolt", 	-- New
				[42859] = mageP.FE.."scorch", 	-- New
				--Frost
				[116] = mageP.FS.."frostBolt", --r1	-- New
				[42842] = mageP.FS.."frostBolt", --r16	-- New
			--

			--paladin
				--Holy
				[48801] = palyP.HY.."exorcism", --New
				[48785] = palyP.HY.."flashOfLight", --New
				[10326] = palyP.HY.."turnEvil", --New
			--

			--priest
				--Discipline
				[8129] = priestP.DP.."manaBurn",
				[32375] = priestP.DP.."massDispel", -- NEW
				[9484] = priestP.DP.."shackleUndead",
				[10955] = priestP.DP.."shackleUndead", --r5
				--Holy
				[48120] = priestP.HY.."bindingHeal", --New
				[48071] = priestP.HY.."flashHeal", --New
				[48135] = priestP.HY.."holyFire", --New
				[48123] = priestP.HY.."smite", --New
				--shadow
				[48127] = priestP.SP.."mindBlast", --New
				[605] = priestP.SP.."mindControl",
				[48160] = priestP.SP.."vampiricTouch", --New
			--

			--rogue
				--subtlety
				[1842] = rogP.SB.."disarmTrap", --New
			--

			--shaman
				--Elem
				[49271] = shamP.EL.."chainLightning", --New
				[51514] = shamP.EL.."hex", --works
				[60043] = shamP.EL.."lavaBurst",
				[49238] = shamP.EL.."lightningBolt", --New
				--Restoration
				[49276] = shamP.RT.."lesserHealingWave", --New
			--

			--Warlock
				--Affliction
				[6215] = wlP.AF.."fear",
				[59164] = wlP.AF.."haunt", --New
				[5484] = wlP.AF.."howlOfTerror",
				[17928] = wlP.AF.."howlOfTerror",
				[47836] = wlP.AF.."seedOfCorruption", --New
				[47843] = wlP.AF.."unstableAffliction", --New
				--Demonology
				[710] = wlP.DM.."banish",
				[18647] = wlP.DM.."banish", --r2
				[47878] = wlP.DM.."createHealstone", --New
				[48018] = wlP.DM.."demonicCircleSummon", --New
				[61191] = wlP.DM.."enslaveDemon", --New
				[691] = wlP.DM.."summonFelhunter", --New
				[688] = wlP.DM.."summonImp", --New
				[712] = wlP.DM.."summonSuccube", --New
				[697] = wlP.DM.."summonVoidwalker", --New
				[30146] = wlP.DM.."summonpet2", --felguard, works
				--Destruction
				[59172] = wlP.DT.."chaosBolt", --New
				[47811] = wlP.DT.."immolate", --New
				[47838] = wlP.DT.."incinerate", --New
				[47815] = wlP.DT.."searingPain", --New
				[47825] = wlP.DT.."soulFire", --New
				--Pet
					--Succube
					[6358] = wlP.succube.."seduction", --New
			--

			--warrior
				--Arms
				[64382] = warP.AR.."shatteringThrow", -- NEW
			--
		},
		castSuccess = { --Used for abilities that affect the player

			--Objects
			[71607] = objP.base.."baubleOfTrueBlood",

			--DK
				--Blood
				[49941] = dkP.BD.."bloodBoil", --New
				[48266] = dkP.BD.."bloodPresence", --New
				[49930] = dkP.BD.."bloodStrike", --New
				[56222] = dkP.BD.."darkCommand", --New
				[48743] = dkP.BD.."deathPact", -- NEW
				[55262] = dkP.BD.."hearthStrike", --New
				[49005] = dkP.BD.."markofblood", --New
				[50842] = dkP.BD.."pestilence", --New
				[48982] = dkP.BD.."runeTap", -- NEW
				[47476] = dkP.BD.."strangulate",
				--Frost
				[45524] = dkP.FT.."chainOfIce", --New
				[49796] = dkP.FT.."deathChill", -- NEW
				[47568] = dkP.FT.."empowerRuneWeapon",
				[48263] = dkP.FT.."frostPresence", --New
				[55268] = dkP.FT.."frostStrike", --New
				[49203] = dkP.FT.."hungeringCold",
				[49909] = dkP.FT.."icyTouch", --New
				[47528] = dkP.FT.."mindFreeze",
				[51425] = dkP.FT.."obliterate", --New
				[56815] = dkP.FT.."runeStrike", --New
				--Unhloy
				[51328] = dkP.UH.."corpseExplosion", --New
				[49938] = dkP.UH.."deathAndDecay", --New
				[49576] = dkP.UH.."deathGrip", -- New
				[49924] = dkP.UH.."deathStrike", -- New
				[49921] = dkP.UH.."plagueStrike", -- New
				[61999] = dkP.UH.."raiseAlly", -- New
				[46584] = dkP.UH.."raiseDead", -- NEW
				[55271] = dkP.UH.."scourgeStrike", -- New
				[49206] = dkP.UH.."summonGargoyle",
				[48265] = dkP.UH.."unholyPresence",
					-- DK Pet
					[47468] = dkP.pet.."petClaw", -- NEW
					[47481] = dkP.pet.."petStun", -- NEW
					[47482] = dkP.pet.."petLeap", -- NEW
					[47484] = dkP.pet.."petHuddle", -- NEW
			--

			-- Druid
				--Balance
				[770] = druidP.BL.."faeryFire", -- New
				[33831] = druidP.BL.."forceOfNature", -- New
				[48467] = druidP.BL.."hurricane", -- New
				[48468] = druidP.BL.."insectSwarm", -- New
				[48463] = druidP.BL.."moonFire", -- New
				[24858] = druidP.BL.."moonkinForm", -- New
				[61384] = druidP.BL.."typhoon", -- NEW
				--Feral
				[8983] = druidP.FL.."bash", -- NEW
				[768] = druidP.FL.."catForm", -- NEW
				[9634] = druidP.FL.."bearForm", -- NEW
				[48570] = druidP.FL.."claw", -- NEW
				[48560] = druidP.FL.."demoralizingRoar", -- NEW
				[16857] = druidP.FL.."faeryFire", -- Feral New
				[16979] = druidP.FL.."feralChargeBear", -- New
				[49376] = druidP.FL.."feralChargeCat", -- New
				[48577] = druidP.FL.."ferociousBite", -- New
				[48568] = druidP.FL.."lacerate", -- New
				[49802] = druidP.FL.."maim", -- NEW
				[33878] = druidP.FL.."mangle", -- Bear New
				[33876] = druidP.FL.."mangle", -- Cat New
				[48480] = druidP.FL.."maul", -- New
				[49803] = druidP.FL.."pounce", -- New
				[5215] = druidP.FL.."prowl", -- NEW
				[48574] = druidP.FL.."rake", -- New
				[48579] = druidP.FL.."ravage", -- New
				[49800] = druidP.FL.."rip", -- New
				[48572] = druidP.FL.."shred", -- New
				[48562] = druidP.FL.."swipe", -- Bear New
				[62078] = druidP.FL.."swipe", -- Cat New
				[50213] = druidP.FL.."tigersFury", -- New
				[5225] = druidP.FL.."trackHumanoids", -- New
				[783] = druidP.FL.."travelForm", -- New
				--Restoration
				[2893] = druidP.RT.."abolishPoison", -- New
				[48470] = druidP.RT.."giftOfTheWild", -- New
				[48469] = druidP.RT.."markOfTheWild", -- New
				[48451] = druidP.RT.."lifeBloom", -- New
				[17116] = druidP.RT.."naturesSwiftness", -- New
				[48441] = druidP.RT.."rejuvenation", -- New
				[2782] = druidP.RT.."removeCurse", -- New
				[18562] = druidP.RT.."swiftmend", -- New
				[33891] = druidP.RT.."treeForm", -- New
				[53251] = druidP.RT.."wildGrowth", -- New
			--

			--hunter
				--BeastMastery
				[13161] = hunterP.BM.."aspectOfTheBeast", --New
				[5118] = hunterP.BM.."aspectOfTheCheetah", --New
				[61847] = hunterP.BM.."aspectOfTheDragonhawk", --New
				[27044] = hunterP.BM.."aspectOfTheHawk", --New
				[13163] = hunterP.BM.."aspectOfTheMonkey", --New
				[13159] = hunterP.BM.."aspectOfThePack", --New
				[34074] = hunterP.BM.."aspectOfTheViper", --New
				[49071] = hunterP.BM.."aspectOfTheWild", --New
				[6991] = hunterP.BM.."feedPet", --New
				[48990] = hunterP.BM.."mendPet", -- NEW
				--Marksmanship
				[19434] = hunterP.MM.."aimedShot", --Aimed Shot rank 1
				[49050] = hunterP.MM.."aimedShot", --Aimed Shot rank 9
				[49045] = hunterP.MM.."arcaneShot", -- New
				[53209] = hunterP.MM.."chimeraShot", -- New
				[5116] = hunterP.MM.."concussiveShot", -- New
				[20736] = hunterP.MM.."distractingShot", -- New
				[1543] = hunterP.MM.."flare", -- NEW
				[53338] = hunterP.MM.."huntersMark", -- NEW
				[61006] = hunterP.MM.."killShot", -- New
				[49048] = hunterP.MM.."multiShot", -- New
				[23989] = hunterP.MM.."readiness",
				[3043] = hunterP.MM.."scorpidSting", -- New
				[49001] = hunterP.MM.."serpentSting", -- New
				[34490] = hunterP.MM.."silencingshot",
				[19801] = hunterP.MM.."tranquilizingShot", -- New
				[3034] = hunterP.MM.."viperSting", -- New
				[58434] = hunterP.MM.."volley", -- New
				--Survival
				[781] = hunterP.SV.."disengage", -- New
				[49067] = hunterP.SV.."explosiveTrap", -- New
				[5384] = hunterP.SV.."feignDeath", -- New
				[60192] = hunterP.SV.."freezingArrow", -- New
				[14311] = hunterP.SV.."freezingtrap", --freezing trap
				[14309] = hunterP.SV.."freezingtrap", --freezing trap effect
				[13809] = hunterP.SV.."frostTrap", --New
				[13810] = hunterP.SV.."frosttrap", --frost trap aura
				[1499] = hunterP.SV.."frosttrap",
				[49056] = hunterP.SV.."immolationTrap", --New
				[53339] = hunterP.SV.."mongooseBite", --New
				[48996] = hunterP.SV.."raptorStrike", --New
				[19503] = hunterP.SV.."scattershot", -- New
				[34600] = hunterP.SV.."snaketrap", -- New
				[19885] = hunterP.SV.."trackHidden", -- New
				[19883] = hunterP.SV.."trackHumanoids", -- New
				[19386] = hunterP.SV.."wyvernSting",
				[49010] = hunterP.SV.."wyvernSting",
					-- Crab
					[61685] = hunterP.crab.."petCharge", -- NEW
					[52472 ] = hunterP.crab.."petClaw", -- NEW
					[53547] = hunterP.crab.."petPin", -- NEW
					-- Ravager
					[53561] = hunterP.ravager.."petRavage", -- NEW
					[53490] = hunterP.ravager.."petBullheaded", -- NEW
					[52473] = hunterP.ravager.."petBite", -- NEW
					[61684] = hunterP.ravager.."petDash", -- NEW
			--

			--mage
				--arcane
				[44781] = mageP.AR.."arcaneBarrage", --New
				[42921] = mageP.AR.."arcaneExplosion", --New
				[42846] = mageP.AR.."arcaneMissiles", --New
				[1953] = mageP.AR.."blink", --New
				[42987] = mageP.AR.."manaGem", --New
				[2139] = mageP.AR.."counterspell",
				[12051] = mageP.AR.."evocation",
				[66] = mageP.AR.."invisibility",
				[55342] = mageP.AR.."mirrorImage", -- NEW
				[475] = mageP.AR.."removeCurse", -- New
				[31589] = mageP.AR.."slow", -- New
				[30449] = mageP.AR.."spellSteal", -- NEW
				--Fire
				[42945] = mageP.FE.."blastWave", -- NEW
				[42950] = mageP.FE.."dragonsBreath", -- NEW
				[42873] = mageP.FE.."fireBlast", -- NEW
				[55360] = mageP.FE.."livingBomb", -- NEW
				--Frost
				[42940] = mageP.FS.."blizzard", --New
				[11958] = mageP.FS.."coldSnap",
				[42931] = mageP.FS.."coneOfCold", --New
				[44572] = mageP.FS.."deepFreeze",
				[42917] = mageP.FS.."frostNova", -- NEW
				[42914] = mageP.FS.."iceLance", -- NEW
				[31687] = mageP.FS.."summonWaterElemental", -- NEW
				--Pet
					[33395] = mageP.pet.."petFreeze", --New
			--

			--paladin
				--Holy
				[4987] = palyP.HY.."Cleanse", --New
				[19746] = palyP.HY.."concentrationAura", --New
				[48819] = palyP.HY.."consecration", --New
				[20216] = palyP.HY.."divineFavor", -- NEW
				[48825] = palyP.HY.."holyShock", -- NEW
				[48817] = palyP.HY.."holyWrath", -- NEW
				[48788] = palyP.HY.."layOnHands", -- NEW
				[1152] = palyP.HY.."purify", -- NEW
				--Protection
				[48827] = palyP.PT.."avengersShield", -- NEW
				[48942] = palyP.PT.."devotionAura", -- NEW
				[48947] = palyP.PT.."fireResistanceAura", -- NEW
				[48945] = palyP.PT.."frostResistanceAura", -- New
				[10308] = palyP.PT.."hammerOfJustice",
				[53595] = palyP.PT.."hammerOfTheRighteous", -- New
				[62124] = palyP.PT.."handOfReckoning", -- New
				[20164] = palyP.PT.."sealOfJustice", -- New
				[48943] = palyP.PT.."shadowResistanceAura", -- New
				[61411] = palyP.PT.."shieldOfRighteousness", -- New
				--Retribution
				[32223] = palyP.RT.."crusaderAura", --New
				[35395] = palyP.RT.."crusaderStrike", --New
				[53385] = palyP.RT.."divineStorm", --New
				[48806] = palyP.RT.."hammerOfWrath", --New
				[53407] = palyP.RT.."judgementOfJustice", --New
				[20271] = palyP.RT.."judgementOfLight", --New
				[53408] = palyP.RT.."judgementOfWisdom", --New
				[20066] = palyP.RT.."repentance",
				[54043] = palyP.RT.."retributionAura", --New
			--

			--priest
				--Discipline
				[988] = priestP.DP.."dispel", -- NEW
				[53007] = priestP.DP.."penance", -- NEW
				--Holy
				[552] = priestP.HY.."abolishDisease", -- NEW
				[528] = priestP.HY.."cureDisease", -- NEW
				[48173] = priestP.HY.."desperatePrayer", --works
				[48078] = priestP.HY.."holyNova", -- NEW
				[48119] = priestP.HY.."bindingHeal", -- NEW
				[48068] = priestP.HY.."renew", -- NEW
				[48113] = priestP.HY.."prayerOfMending", -- NEW
				--Shadow
				[48300] = priestP.SP.."devouringPlague", --New
				[48156] = priestP.SP.."mindFlay", --New
				[53023] = priestP.SP.."mindSear", --New
				[64044] = priestP.SP.."psychicHorror", -- New
				[10890] = priestP.SP.."psychicScream", -- New
				[48158] = priestP.SP.."shadowWordDeath", -- NEW
				[48125] = priestP.SP.."shadowWordPain", -- NEW
				[34433] = priestP.SP.."shadowFiend", -- works
				[15487] = priestP.SP.."silence", 		 -- NEW
			--

			--rogue
				--Assassination
				[48691] = rogP.AS.."ambush", --New
				[1833] = rogP.AS.."cheapShot",  -- NEW
				[48674] = rogP.AS.."deadlyThrow",  -- NEW
				[51722] = rogP.AS.."dismantle", --New
				[57993] = rogP.AS.."envenom", --New
				[48668] = rogP.AS.."eviscerate", --New
				[8647] = rogP.AS.."exposeArmor", --New
				[48676] = rogP.AS.."garrote",   -- NEW
				[8643] = rogP.AS.."kidneyShot", -- NEW
				[48666] = rogP.AS.."mutilate", -- NEW
				[48672] = rogP.AS.."rupture", -- NEW
				--Combat
				[48657] = rogP.CT.."backstab", --New
				[51723] = rogP.CT.."fanOfKnive", --New
				[1776] = rogP.CT.."gouge", --New
				[1766] = rogP.CT.."kick",
				[5938] = rogP.CT.."shiv", --New
				[48638] = rogP.CT.."sinisterStrike", --New
				[13877] = rogP.CT.."bladeFlurry",
				--Subtlety
				[2094] = rogP.SB.."blind",
				[1725] = rogP.SB.."distract", --New
				[48660] = rogP.SB.."hemorrage", --New
				[14183] = rogP.SB.."premeditation", --New
				[14185] = rogP.SB.."preparation",
				[51724] = rogP.SB.."sap",
				[11297] = rogP.SB.."sap",
				[6770] = rogP.SB.."sap",
				[36554] = rogP.SB.."shadowStep", --New
				[1784] = rogP.SB.."stealth",
				[26889] = rogP.SB.."vanish",
			--

			--shaman
				--Elemental
				[66843] = shamP.EL.."callOfTheAncestors", --New
				[66842] = shamP.EL.."callOfTheElements", --New
				[66844] = shamP.EL.."callOfTheSpirits", --New
				[49231] = shamP.EL.."earthShock", --New
				[2484] = shamP.EL.."earthbindTotem",
				[2894] = shamP.EL.."fireElementalTotem", --New
				[61657] = shamP.EL.."fireNova", --New
				[49233] = shamP.EL.."flameShock", --New
				[49236] = shamP.EL.."frostShock", --New
				[58734] = shamP.EL.."magmaTotem", --New
				[8012] = shamP.EL.."purge", -- NEW
				[58704] = shamP.EL.."searingTotem", -- NEW
				[58582] = shamP.EL.."stoneclawTotem", -- NEW
				[59159] = shamP.EL.."thunderstorm", 	-- NEW
				[57722] = shamP.EL.."totemOfWrath", -- NEW
				[57994] = shamP.EL.."windShear", 		-- NEW
				--Enhancement
				[2062] = shamP.EH.."earthElementalTotem", --New
				[51533] = shamP.EH.."feralSpirit", --New
				[58739] = shamP.EH.."fireResistanceTotem", --New
				[58656] = shamP.EH.."flametongueTotem", --New
				[58745] = shamP.EH.."frostResistanceTotem", --New
				[8177] = shamP.EH.."groundingTotem",
				[60103] = shamP.EH.."lavaLash", --New
				[49281] = shamP.EH.."lightningShield", --New
				[58749] = shamP.EH.."natureResistanceTotem", --New
				[58753] = shamP.EH.."stoneskinTotem", --New
				[17364] = shamP.EH.."stormstrike", --New
				[58643] = shamP.EH.."strengthOfTheEarthTotem", --New
				[8512] = shamP.EH.."windfuryTotem", --New
				[3738] = shamP.EH.."wrathOfTheAirTotem", --New
				--Restoration
				[51886] = shamP.RT.."cleanseSpirit", --New
				[8170] = shamP.RT.."cleansingTotem", --New
				[526] = shamP.RT.."cureToxins", --New
				[58757] = shamP.RT.."healingStreamTotem", --New
				[58774] = shamP.RT.."manaSpringTotem", --New
				[16190] = shamP.RT.."manaTideTotem",
				[16188] = shamP.RT.."naturesSwiftness", --New
				[61301] = shamP.RT.."riptide", --New
				[55198] = shamP.RT.."tidalForce", --New
				[36936] = shamP.RT.."totemicRecall", --New
				[8143] = shamP.RT.."tremorTotem",
				[65992] = shamP.RT.."tremorTotem",
			--

			--warlock
				--Affliction
				[47813] = wlP.AF.."corruption", --New
				[47864] = wlP.AF.."curseOfAgony", 	-- NEW
				[47867] = wlP.AF.."curseOfDoom", 	-- NEW
				[18223] = wlP.AF.."curseOfExhaustion", 	-- NEW
				[47865] = wlP.AF.."curseOfTheElements", 	-- NEW
				[11719] = wlP.AF.."curseOfTongues", 	-- NEW
				[50511] = wlP.AF.."curseOfWeakness", 	-- NEW
				[6789] = wlP.AF.."deathcoil",
				[47860] = wlP.AF.."deathcoil",
				[47857] = wlP.AF.."drainLife", --New
				[5138] = wlP.AF.."drainMana",
				[47855] = wlP.AF.."drainSoul", --New
				[17928] = wlP.AF.."howlOfTerror", --New
				[57946] = wlP.AF.."lifeTap", --New
				--Demonology
				[47875] = wlP.DM.."healthtone", --R1 	-- NEW
				[48020] = wlP.DM.."demonicCircleTeleport",
				[132] = wlP.DM.."detectInvisibility", --New
				[47856] = wlP.DM.."healthFunnel", --New
				[1122] = wlP.DM.."inferno", --New
				--Destruction
				[17962] = wlP.DT.."conflagrate", --New
				[47823] = wlP.DT.."hellFire", --New
				[47820] = wlP.DT.."rainOfFire", --New
				[47827] = wlP.DT.."shadowBurn", --New
				[61290] = wlP.DT.."shadowFlame", --New
				[47847] = wlP.DT.."shadowFury", --New
					-- Succube
					[7870] = wlP.succube.."lesserInvisibility", --New
					-- Felhunter
					[19647] = wlP.felhunter.."spellLock",
					[48011] = wlP.felhunter.."devourMagic", -- NEW
			--

			--warrior
				--Arms
				[2457]  = warP.AR.."battleStance",
				[11578] = warP.AR.."charge", --New
				[1715]  = warP.AR.."hamstring", --New
				[47450] = warP.AR.."heroicStrike", --New
				[57755] = warP.AR.."heroicThrow", --New
				[694]   = warP.AR.."mockingBlow", --New
				[47486] = warP.AR.."mortalStrike", --New
				[7384]  = warP.AR.."overpower", --New
				[47465] = warP.AR.."rend", --New
				[47502] = warP.AR.."thunderClap", --New
				--Fury
				[2458]  = warP.FY.."berserkerStance",
				[23881] = warP.FY.."bloodthirst", --New
				[1161]  = warP.FY.."challengingShout", --New
				[47520] = warP.FY.."cleave", --New
				[47437] = warP.FY.."demoralizingShout", -- NEW
				[47471] = warP.FY.."execute", -- New
				[60970] = warP.FY.."heroicFury", -- New
				[20252] = warP.FY.."intercept", -- New
				[5246]  = warP.FY.."intimidatingShout",
				[12323] = warP.FY.."piercingHowl", --New
				[6552]  = warP.FY.."pummel", --New
				[47475] = warP.FY.."slam", --New
				[34428] = warP.FY.."victoryRush", --New
				[1680]  = warP.FY.."whirlwind", --New
				--Protection
				[2687]  = warP.PT.."bloodRage", --New
				[12809] = warP.PT.."concussionBlow", --New
				[71]    = warP.PT.."defensiveStance",
				[47498] = warP.PT.."devastate", --New
				[676]   = warP.PT.."disarm",
				[3411]  = warP.PT.."intervene", --New
				[57823] = warP.PT.."revenge", --New
				[72]    = warP.PT.."shieldBash",
				[47488] = warP.PT.."shieldSlam", --New
				[46968] = warP.PT.."shockwave", -- NEW
				[7386]  = warP.PT.."sunderArmor", -- NEW
				[355]   = warP.PT.."taunt", -- NEW
			--
		},

		-- Enemy SPELL_AURA_APPLIED CC
		enemyDebuffs = {
			[2094] = "Enemyblinded", --works
			[51724] = "Enemysapped", --works
			[12826] = "EnemyPollied",
			[118] = "EnemyPollied",
			[33786] = "EnemyCycloned",--menu
			[51514] = "EnemyHexxed",
		},
		-- Enemy SPELL_AURA_REMOVED CC
		enemyDebuffdown = {
			[2094] = "blinddown", --works
			[51724] = "sapdown", --works
			[118] = "polydown",
			[12826] = "polydown",
			[33786] = "cyclonedown", --menu
			[51514] = "hexdown",
		},
		-- Enemy SPELL_COUNTERED -> Party
		interruptFriend = {
			[2139] = "friendcountered",
			[50613] = "friendcountered",
			[1766] = "friendcountered",
			[57994] = "friendcountered",
			[72] = "friendcountered",
			[47528] = "friendcountered",
		},
		-- Enemy SPELL_CASTING_START CC -> Party
		friendCCs = {
			[33786] = "cyclonefriend",
			[51514] = "hexfriend",
			[12826] = "polyfriend",
			[118] = "polyfriend",
			[28272] = "polyfriend",
			[61305] = "polyfriend",
			[61721] = "polyfriend",
			[61025] = "polyfriend",
			[61780] = "polyfriend",
			[28271] = "polyfriend",
			[6215] = "fearfriend",
		},
		-- Enemy SPELL_CASTING_SUCCESS CC -> Party
		friendCCSuccess = {
			[14309] = "friendfrozen",
			[2094] = "blindfriend",
			[5246] = "friendfeared", --intimidating shout
			[51724] = "friendsapped",
			[33786] = "friendcycloned",
			[10308] = "friendstunned",
			[2139] = "friendcountered",
			[51514] = "friendhexxed",
			[118] = "friendpoly",
			[12826] = "friendpoly",
			[6215] = "friendfeared",
			[10890] = "friendfeared",
			[17928] = "friendfeared",
		},
		-- Party SPELL_CASTING_SUCCESS CC -> Enemy
		friendCCenemy = {
			[2094] = "enemyblinded",
			[51724] = "enemysapped",
			[51514] = "enemyhexxed",
			[12826] = "enemypollied",
			[118] = "enemypollied",
			[33786] = "enemycycloned",
		},
		-- Enemy SPELL_AURA_REMOVED CC
		enemyDebuffdownAP = {
			[2094] = "Blinddown",
			[51724] = "Sapdown",
			[51514] = "Hexdown",
			[12826] = "Polydown",
			[118] = "Polydown",
			[33786] = "CycloneDown",
		},
		-- SELF
		selfDebuff = {
			[33786] = "Cyclone",
			[51514] = "Hex",
			[12826] = "Polymorph",
			[118] = "Polymorph",
			[28272] = "Polymorph",
			[61305] = "Polymorph",
			[61721] = "Polymorph",
			[61025] = "Polymorph",
			[61780] = "Polymorph",
			[28271] = "Polymorph",
			[6215] = "Fear",
			[60192] = "Freezingtrap", --double check
			[14309] = "Freezingtrap", --freezing trap effect
			[13810] = "Frosttrap", --frost trap aura
			[13809] = "Frosttrap", --frost trap aura
			[14311] = "Freezingtrap",
			[19503] = "scattershot", -- NEW: Scatter Shot
			[1499] = "Frosttrap",
			[5246] = "Fear3", --intimidating shout
			[17928] = "Fear2", --Howl of Terror
			[2094] = "Blind",
			[51724] = "Sap",
			[11297] = "Sap",
			[6770] = "Sap",
			[10308] = "Hammerofjustice",
			[10890] = "Fear4", -- Psychic Scream
			[47860] = "Deathcoil",
			[5138] = "drainMana",
			[44572] = "DeepFreeze",
			[20066] = "Repentance",
			[34490] = "Silencingshot",
			[19434] = "Aimedshot", --Aimed Shot rank 1
			[49050] = "Aimedshot", --Aimed Shot rank 9
			[47476] = "Strangulate",
			[51722] = "Disarm2", --dismantle
			[61606] = "Markofblood",
			[19386] = "wyvernSting",
			[49010] = "wyvernSting",
			[6358] = "seduction",
		},
	}
end
--args = listOptions({58984,26297,20594,20572,7744,28880},"auraApplied"),


--PlaySoundFile(""..sadb.sapath..list[spellID]..".mp3");