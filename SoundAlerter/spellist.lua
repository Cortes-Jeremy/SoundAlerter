--[[SoundAlerter for 3.3.5a by Trolollolol - Sargeras - Molten-WoW.com
				Credits to Abatorlos of Spinebreaker, Duskashes, Superk
								Notes: Check spell IDs by rank first
								add death wish down, starfire, bladestorm down]]

function SoundAlerter:GetSpellList ()
	return {

		auraApplied = {					-- aura applied [spellid] = ".mp3 file name",
			--Objects
			[54861] = "nitroBoost",
			[54758] = "hyperspeedAccelerator",

			--Races
			[58984] = "shadowmeld",
			[26297] = "berserking",
			[20594] = "stoneform",
			[20572] = "bloodFury",
			[33702] = "bloodFury",
			[7744]  = "willOfTheForsaken",
			[28880] = "giftOfTheNaaru",

			--DK
				--Blood
				[45529] = "bloodTap", -- New
				[49028] = "dancingRuneWeapon", -- New
				[49016] = "hysteria",
				[55233] = "vampiricBlood",
				--Frost
				[57623] = "hornOfWinter", --New
				[48792] = "iceboundFortitude",
				[49039] = "lichborne",
				[51271] = "unbreakableArmor", --New
				--Unholy
				[48707] = "antiMagicShell",
				[51052] = "antiMagicZone", --New
				[49222] = "boneShield",
			--

			--Druid
				--Balance
				[22812] = "barkskin",
				[29166] = "innervate",
				[17329] = "naturesGrasp",	--rank 6
				[27009] = "naturesGrasp",	--rank 7
				[53312] = "naturesGrasp",	--rank 8
				[48505] = "starfall",	--rank 1
				[53199] = "starfall",	--rank 2
				[53200] = "starfall",	--rank 3
				[53201] = "starfall",	--rank 4
				[53307] = "thorns",	--New
					--Proc
					[48518] = "lunarEclipse", --New
					[48517] = "solarEclipse", --New
					[16870] = "clearcasting",
				--Feral
				[50334] = "berserk",
				[1850]  = "dash",	--rank 1
				[9821]  = "dash",	--rank 2
				[33357] = "dash",	--rank 3
				[5229]  = "enrage", --New
				[22842] = "frenziedRegeneration",
				[52610] = "savageRoar", --New
				[61336] = "survivalInstincts",
					--PROC
					[69369] = "predatorsSwiftness",		-- NEW
				--Restauration
				[48470] = "giftOfTheWild", --New
				[48469] = "markOfTheWild", --New
				[17116] = "naturesSwiftness",
			--

			--Hunter
				--Beastmastery
				[34027] = "killCommand", --New
				[54216] = "mastersCall", --New
					--Proc
					[34471] = "theBeastWithin",
				--Marksmanship
				[3045]  = "rapidFire", -- NEW
				--Survival
				[19263] = "deterrence",
				[35079] = "misdirection", --New
				--Pet
					[53480] = "roarOfSacrifice",
					[53517] = "roarOfRecovery", --New
					[1742]  = "petCower", --New
					--Crab
					[53476] = "petIntervene", --New
					[53479] = "petLaststand", --New
					--Ravarger
					[61684] = "petDash", --New
			--

			--Mage
				--Arcane
				[12042] = "arcanePower",
				[66]    = "invisibility", --New
				[43020] = "manaShield", --New
				[12043] = "presenceOfMind",
				[130]   = "slowFall", --New
					--Proc
					[44401] = "missileBarrage", --New
				--Fire
				[28682] = "combustion",
				[43010] = "fireWard", --New
					--Proc
					[31643] = "blazingSpeed", --New
					[64343] = "impact", --New
					[48108] = "hotStreak", --New
				--Frost
				[43012] = "frostWard",
				[43039] = "iceBarrier", -- New
				[45438] = "iceBlock",
				[12472] = "icyveins",
					--Proc
					[74396] = "fingersOfFrost", --New
					[57761] = "brainFreeze", --New
			--

			--Paladin
				--Holy
				[31821] = "auraMastery",
				[53563] = "beaconOfLight", --New
				[31842] = "divineIllumination", --New
				[54428] = "divinePlea", --New
				[53601] = "sacredShield", --New
					--Proc
					[54149] = "infusionOfLight", --New
				--Protection
				[498]   = "divineProtection",
				[64205] = "divineSacrifice",
				[642]   = "divineShield",
				[1044]  = "handOfFreedom",
				[1022]  = "handOfProtection",	--Hand of Protection rank 1
				[5599]  = "handOfProtection",	--Hand of Protection rank 2
				[10278] = "handOfProtection",	--Hand of Protection rank 3
				[6940]  = "handofsacrifice",
				[1038]  = "handofsalvation", --New
				[25780] = "righteousFury", --New
					--Proc
					[20178] = "reckoning", --New
				--Retribution
				[31884] = "avengingWrath", --New
					--Proc
					[59578] = "theArtOfWar", --New
					[54203] = "sheathOfLight", --New
			--

			--Priest
				--Discipline
				[6346]  = "fearWard",
				[48168] = "innerFire", --New
				[33206] = "painSuppression",
				[10060] = "powerInfusion",
				[48066] = "powerWordShield", --New
				--Holy
				[47788] = "guardianSpirit",
				--Shadow
				[47585] = "dispersion",
				[586]   = "fade",	--New
				[15473] = "shadowForm",	--New
			--

			--Rogue
				--Assassination
				[14177] = "coldBlood",
				--Combat
				[13750] = "adrenalineRush",	--New
				[5277]  = "evasion", --Evasion rank 1
				[26669] = "evasion", --Evasion rank 2
				[48659] = "feint",		  -- NEW
				[51690] = "killingSpree", -- NEW
				[2983]  = "sprint",	--Sprint rank 1
				[8696]  = "sprint",	--Sprint rank 3
				[11305] = "sprint",	--Sprint rank 2
				--Subtlety
				[31224] = "cloakOfShadows",
				[51713] = "shadowDance",
				[57934] = "trickOfTheTrade", --New (A revoir)
				[45182] = "cheatingDeath",   -- New
			--

			--Shaman
				--Elemental
				[16166] = "elementalMastery",
				--Enhancement
				[2645]  = "ghostWolf", --new
				[32182] = "heroism", --new
				[2825]  = "bloodlust",
				[30823] = "shamanisticRage",
					--Proc
					[53817] = "maelstromWeapon",
				--Restoration
				[974]   = "earthShield",	--Earth Shield rank 1
				[32593] = "earthShield",	--Earth Shield rank 2
				[32594] = "earthShield",	--Earth Shield rank 3
				[49283] = "earthShield",	--Earth Shield rank 4
				[49284] = "earthShield",	--Earth Shield rank 5
				[52127] = "waterShield",	--Water Shield rank 1
				[52129] = "waterShield",	--Water Shield rank 2
				[52131] = "waterShield",	--Water Shield rank 3
				[52134] = "waterShield",	--Water Shield rank 4
				[52136] = "waterShield",	--Water Shield rank 5
				[52138] = "waterShield",	--Water Shield rank 6
				[24398] = "waterShield",	--Water Shield rank 7
				[33736] = "waterShield",	--Water Shield rank 8
				[57960] = "waterShield",	--Water Shield rank 9
				[16188] = "naturesSwiftness",
			--

			--Warlock
				--Affliction
					--Proc
					[17941] = "shadowtrance",
				--Demonology
				[47891] = "shadowWard", --New (pas de son pour le down)
				[18708] = "felDomination",	 -- NEW
				--Destruction
					--Proc
					[54277] = "backdraft",	 	 -- NEW
			--

			--Warrior
				--Arms
				[46924] = "bladestorm",
				[20230] = "Retaliation",
				[12328] = "sweepingStrikes",
					--Proc
					[60503] = "tasteForBlood",
				--Fury
				[18499] = "berserkerRage", --New (manque le son du down)
				[12292] = "deathWish", --New (manque le son du down)
				[55694] = "enragedRegeneration",
				[1719]  = "recklessness",
				[47436] = "battleShout",	 -- NEW
				[47440] = "commandingShout", -- NEW
				--Protection
				[12975] = "lastStand",
				[2565]  = "shieldBlock", --New
				[871]   = "shieldWall",
				[23920] = "spellReflection",
					--Proc
					[50227] = "swordAndBoard", --New
			--
		},
		auraRemoved = {

			--Objects
			[54861] = "nitroBoostDown",
			[54758] = "hyperspeedAcceleratorDown",

			--Races
			[58984] = "shadowmeldDown",
			[26297] = "berserkingDown",
			[20594] = "stoneformDown",
			[20572] = "bloodFuryDown",
			[33702] = "bloodFuryDown",
			[7744] = "willOfTheForsakenDown",
			[28880] = "giftOfTheNaaruDown",

			--DK
				--Blood
				[45529] = "bloodTapDown", -- New
				[49028] = "dancingRuneWeaponDown", -- New
				[49016] = "hysteriaDown",
				[55233] = "vampiricBloodDown",
				--Frost
				[57623] = "hornOfWinterDown", --New
				[48792] = "iceboundFortitudeDown",
				[49039] = "lichborneDown",
				[51271] = "unbreakableArmorDown", --New
				--Unholy
				[48707] = "antiMagicShellDown",
				[51052] = "antiMagicZoneDown", --New
				[49222] = "boneShieldDown",
			--

			--Druid
				--Balance
				[22812] = "barkskinDown",
				[29166] = "innervateDown",
				[17329] = "naturesGraspDown",	--rank 6
				[27009] = "naturesGraspDown",	--rank 7
				[53312] = "naturesGraspDown",	--rank 8
				[48505] = "starfallDown",	--rank 1
				[53199] = "starfallDown",	--rank 2
				[53200] = "starfallDown",	--rank 3
				[53201] = "starfallDown",	--rank 4
				[53307] = "thornsDown",	--New
					--Proc
					[48518] = "lunarEclipseFown", --New
					[48517] = "solarEclipseDown", --New
					[16870] = "clearcastingDown",
				--Feral
				[50334] = "berserkDown",
				[1850] = "dashDown",	--rank 1
				[9821] = "dashDown",	--rank 2
				[33357] = "dashDown",	--rank 3
				[5229] = "enrageDown", --New
				[22842] = "frenziedRegenerationDown",
				[52610] = "savageRoarDown", --New
				[61336] = "survivalInstinctsDown",
					--PROC
					[69369] = "predatorsSwiftnessDown",		-- NEW
				--Restauration
				[48470] = "giftOfTheWildDown", --New
				[48469] = "markOfTheWildDown", --New
				[17116] = "naturesSwiftnessDown",
			--

			--Hunter
				--Beastmastery
				[34027] = "killCommandDown", --New
				[54216] = "mastersCallDown", --New
					--Proc
					[34471] = "theBeastWithinDown",
				--Marksmanship
				[3045] = "rapidFireDown", -- NEW
				--Survival
				[19263] = "deterrenceDown",
				[35079] = "misdirectionDown", --New
				--Pet
					[53480] = "roarOfSacrificeDown",
					[53517] = "roarOfRecoveryDown", --New
					[1742] = "petCowerDown", --New
					--Crab
					[53476] = "petInterveneDown", --New
					[53479] = "petLaststandDown", --New
					--Ravarger
					[61684] = "petDashDown", --New
			--

			--Mage
				--Arcane
				[12042] = "arcanePowerDown",
				[66] = "invisibilityDown", --New
				[43020] = "manaShieldDown", --New
				[12043] = "presenceOfMindDown",
				[130] = "slowFallDown", --New
					--Proc
					[44401] = "missileBarrageDown", --New
				--Fire
				[28682] = "combustionDown",
				[43010] = "fireWardDown", --New
					--Proc
					[31643] = "blazingSpeedDown", --New
					[64343] = "impactDown", --New
					[48108] = "hotStreakDown", --New
				--Frost
				[43012] = "frostWardDown",
				[43039] = "iceBarrierDown", -- New
				[45438] = "iceBlockDown",
				[12472] = "icyveinsDown",
					--Proc
					[74396] = "fingersOfFrostDown", --New
					[57761] = "brainFreezeDown", --New
			--

			--Paladin
				--Holy
				[31821] = "auraMasteryDown",
				[53563] = "beaconOfLightDown", --New
				[31842] = "divineIlluminationDown", --New
				[54428] = "divinePleaDown", --New
				[53601] = "sacredShieldDown", --New
					--Proc
					[54149] = "infusionOfLightDown", --New
				--Protection
				[498] = "divineProtectionDown",
				[64205] = "divineSacrificeDown",
				[642] = "divineShieldDown",
				[1044] = "handOfFreedomDown",
				[1022] = "handOfProtectionDown",	--Hand of Protection rank 1
				[5599] = "handOfProtectionDown",	--Hand of Protection rank 2
				[10278] = "handOfProtectionDown",	--Hand of Protection rank 3
				[6940] = "handofsacrificeDown",
				[1038] = "handofsalvationDown", --New
				[25780] = "righteousFuryDown", --New
					--Proc
					[20178] = "reckoningDown", --New
				--Retribution
				[31884] = "avengingWrathDown", --New (manque le son de down)
					--Proc
					[59578] = "theArtOfWarDown", --New
					[54203] = "sheathOfLightDown", --New (manque le son de down)
			--

			--Priest
				--Discipline
				[6346] = "fearWardDown",
				[48168] = "innerFireDown", --New
				[33206] = "painSuppressionDown",
				[10060] = "powerInfusionDown",
				[48066] = "powerWordShieldDown", --New
				--Holy
				[47788] = "guardianSpiritDown",
				--Shadow
				[47585] = "dispersionDown",
				[586] = "fadeDown",	--New
				[15473] = "shadowFormDown",	--New
			--

			--Rogue
				--Assassination
				[14177] = "coldBloodDown",
				--Combat
				[13750] = "adrenalineRushDown",	--New
				[5277] = "evasionDown", --Evasion rank 1
				[26669] = "evasionDown", --Evasion rank 2
				[48659] = "feintDown",		  -- NEW
				[51690] = "killingSpreeDown", -- NEW
				[2983] = "sprintDown",	--Sprint rank 1
				[8696] = "sprintDown",	--Sprint rank 3
				[11305] = "sprintDown",	--Sprint rank 2
				--Subtlety
				[31224] = "cloakOfShadowsDown",
				[51713] = "shadowDanceDown",
				[57934] = "trickOfTheTradeDown", --New (A revoir)
				[45182] = "cheatingDeathDown",   -- New
			--

			--Shaman
				--Elemental
				[16166] = "elementalMasteryDown",
				--Enhancement
				[2645] = "ghostWolfDown", --new
				[32182] = "heroismDown", --new
				[2825] = "bloodlustDown",
				[30823] = "shamanisticRageDown",
					--Proc
					[53817] = "maelstromWeaponDown",
				--Restoration
				[974] = "earthShieldDown",	--Earth Shield rank 1
				[32593] = "earthShieldDown",	--Earth Shield rank 2
				[32594] = "earthShieldDown",	--Earth Shield rank 3
				[49283] = "earthShieldDown",	--Earth Shield rank 4
				[49284] = "earthShieldDown",	--Earth Shield rank 5
				[52127] = "waterShieldDown",	--Water Shield rank 1
				[52129] = "waterShieldDown",	--Water Shield rank 2
				[52131] = "waterShieldDown",	--Water Shield rank 3
				[52134] = "waterShieldDown",	--Water Shield rank 4
				[52136] = "waterShieldDown",	--Water Shield rank 5
				[52138] = "waterShieldDown",	--Water Shield rank 6
				[24398] = "waterShieldDown",	--Water Shield rank 7
				[33736] = "waterShieldDown",	--Water Shield rank 8
				[57960] = "waterShieldDown",	--Water Shield rank 9
				[16188] = "naturesSwiftnessDown",
			--

			--Warlock
				--Affliction
					--Proc
					[17941] = "shadowtranceDown",
				--Demonology
				[47891] = "shadowWardDown", --New (pas de son pour le down)
				[18708] = "felDominationDown", -- NEW
				--Destruction
					--Proc
					[54277] = "backdraftDown", -- NEW
			--

			--Warrior
				--Arms
				[46924] = "bladestormDown",
				[20230] = "RetaliationDown",
				[12328] = "sweepingStrikesDown",
					--Proc
					[60503] = "tasteForBloodDown",
				--Fury
				[18499] = "berserkerRageDown", --New (manque le son du down)
				[12292] = "deathWishDown", --New (manque le son du down)
				[55694] = "enragedRegenerationDown",
				[1719] = "recklessnessDown",
				[47440] = "commandingShoutDown", -- NEW
				[47436] = "battleShoutDown",	 -- NEW
				--Protection
				[12975] = "lastStandDown",
				[2565] = "shieldBlockDown", --New
				[871] = "shieldWallDown",
				[23920] = "spellReflectionDown",
					--Proc
					[50227] = "swordAndBoardDown", --New
			--
		},
		castStart = {

			--general
			[635]   = "bigHeal",	--Holy Light rank 1
			[639]   = "bigHeal",	--Holy Light rank 2
			[647]   = "bigHeal",	--Holy Light rank 3
			[1026]  = "bigHeal",	--Holy Light rank 4
			[1042]  = "bigHeal",	--Holy Light rank 5
			[3472]  = "bigHeal",	--Holy Light rank 6
			[10328] = "bigHeal",	--Holy Light rank 7
			[10329] = "bigHeal",	--Holy Light rank 8
			[25292] = "bigHeal",	--Holy Light rank 9
			[27135] = "bigHeal",	--Holy Light rank 10
			[27136] = "bigHeal",	--Holy Light rank 11
			[48782] = "bigHeal",	--Holy Light rank 12
			[2054]  = "bigHeal",		--Heal rank 1
			[2055]  = "bigHeal",		--Heal rank 2
			[6063]  = "bigHeal",		--Heal rank 3
			[6064]  = "bigHeal",		--Heal rank 4
			[2060]  = "bigHeal",		--Greater Heal rank 1
			[332]   = "bigHeal",	--Healing Wave rank 2
			[547]   = "bigHeal",	--Healing Wave rank 3
			[913]   = "bigHeal",	--Healing Wave rank 4
			[939]   = "bigHeal",	--Healing Wave rank 5
			[959]   = "bigHeal",	--Healing Wave rank 6
			[8005]  = "bigHeal",	--Healing Wave rank 7
			[10395] = "bigHeal",	--Healing Wave rank 8
			[10396] = "bigHeal",	--Healing Wave rank 9
			[25357] = "bigHeal",	--Healing Wave rank 10
			[25391] = "bigHeal",	--Healing Wave rank 11
			[25396] = "bigHeal",	--Healing Wave rank 12
			[49272] = "bigHeal",	--Healing Wave rank 13
			[49273] = "bigHeal",	--Healing Wave rank 14
			--Druid
			--Restauration
			[5185]  = "bigHeal",		--Healing Touch rank 1
			[5186]  = "bigHeal",		--Healing Touch rank 2
			[5187]  = "bigHeal",		--Healing Touch rank 3
			[5188]  = "bigHeal",		--Healing Touch rank 4
			[5189]  = "bigHeal",		--Healing Touch rank 5
			[6778]  = "bigHeal",		--Healing Touch rank 6
			[8903]  = "bigHeal",		--Healing Touch rank 7
			[9758]  = "bigHeal",		--Healing Touch rank 8
			[9888]  = "bigHeal",		--Healing Touch rank 9
			[9889]  = "bigHeal",		--Healing Touch rank 10
			[25297] = "bigHeal",		--Healing Touch rank 11
			[26978] = "bigHeal",		--Healing Touch rank 12
			[26979] = "bigHeal",		--Healing Touch rank 13
			[48377] = "bigHeal",		--Healing Touch rank 14
			[48378] = "bigHeal",		--Healing Touch rank 15
			[50464] = "bigHeal",		--Nourish
			--
			[2006]  = "resurrection",	--Resurrection (priest) rank 1
			[2010]  = "resurrection",	--Resurrection (priest) rank 2
			[10880] = "resurrection",	--Resurrection (priest) rank 3
			[10881] = "resurrection",	--Resurrection (priest) rank 4
			[20770] = "resurrection",	--Resurrection (priest) rank 5
			[25435] = "resurrection",	--Resurrection (priest) rank 6
			[48171] = "resurrection",	--Resurrection (priest) rank 7
			[7328]  = "resurrection",	--Redemption rank 1
			[10322] = "resurrection",	--Redemption rank 2
			[10324] = "resurrection",	--Redemption rank 3
			[20772] = "resurrection",	--Redemption rank 4
			[20773] = "resurrection",	--Redemption rank 5
			[48949] = "resurrection",	--Redemption rank 6
			[48950] = "resurrection",	--Redemption rank 7
			[2008]  = "resurrection",	--Ancestral Spirit rank 1
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
				[18658] = "hibernate",
				[2637]  = "hibernate",
				[48467] = "hurricane", --New
				[33786] = "cyclone",  --works
				[48465] = "starfire", --rank 10
				[53308] = "entanglingRoots", -- NEW
				[48461] = "wrath", -- NEW
				--Restoration
				[48443] = "regrowth", -- NEW
				[48447] = "tranquility", -- NEW
			--

			--Hunter
				--Beast Mastery
				[14327] = "scareBeast",
				[982]   = "revivePet",
				--Marksmanship
				[49052] = "steadyShot", --New
			--

			--mage
				--arcane
				[42897] = "arcaneBlast", --New
				[118]   = "polymorph", --Can be poly:turtle, cat, sheep, etc
				[12826] = "polymorph",
				[28272] = "polymorph",
				[61305] = "polymorph",
				[61721] = "polymorph",
				[61025] = "polymorph",
				[61780] = "polymorph",
				[28271] = "polymorph",
				[42846] = "arcaneMissiles", 	-- NEW (probably not working)
				--Fire
				[42833] = "fireBall", 	-- New
				[42926] = "flameStrike", 	-- New
				[47610] = "frostFireBolt", 	-- New
				[42859] = "scorch", 	-- New
				--Frost
				[116]   = "frostBolt", --r1	-- New
				[42842] = "frostBolt", --r16	-- New
			--

			--paladin
				--Holy
				[48801] = "exorcism", --New
				[48785] = "flashOfLight", --New
				[10326] = "turnEvil", --New
			--

			--priest
				--Discipline
				[8129]  = "manaBurn",
				[32375] = "massDispel", -- NEW
				[9484]  = "shackleUndead",
				[10955] = "shackleUndead", --r5
				--Holy
				[48120] = "bindingHeal", --New
				[48071] = "flashHeal", --New
				[48135] = "holyFire", --New
				[48123] = "smite", --New
				--shadow
				[48127] = "mindBlast", --New
				[605]   = "mindControl",
				[48160] = "vampiricTouch", --New
			--

			--rogue
				--subtlety
				[1842]  = "disarmTrap", --New
			--

			--shaman
				--Elem
				[49271] = "chainLightning", --New
				[51514] = "hex", --works
				[60043] = "lavaBurst",
				[49238] = "lightningBolt", --New
				--Restoration
				[49276] = "lesserHealingWave", --New
			--

			--Warlock
				--Affliction
				[6215]  = "fear",
				[59164] = "haunt", --New
				[5484]  = "howlOfTerror",
				[17928] = "howlOfTerror",
				[47836] = "seedOfCorruption", --New
				[47843] = "unstableAffliction", --New
				--Demonology
				[710]   = "banish",
				[18647] = "banish", --r2
				[47878] = "createHealstone", --New
				[48018] = "demonicCircleSummon", --New
				[61191] = "enslaveDemon", --New
				[691]   = "summonFelhunter", --New
				[688]   = "summonImp", --New
				[712]   = "summonSuccube", --New
				[697]   = "summonVoidwalker", --New
				[30146] = "summonFelGuard", --felguard, works
				--Destruction
				[59172] = "chaosBolt", --New
				[47811] = "immolate", --New
				[47838] = "incinerate", --New
				[47815] = "searingPain", --New
				[47825] = "soulFire", --New
				--Pet
					--Succube
					[6358] = "seduction", --New
			--

			--warrior
				--Arms
				[64382] = "shatteringThrow", -- NEW
			--
		},
		castSuccess = { --Used for abilities that affect the player

			--Objects
			[71607] = "baubleOfTrueBlood",
			[54757] = "pyroRocket",

			--DK
				--Blood
				[49941] = "bloodBoil", --New
				[48266] = "bloodPresence", --New
				[49930] = "bloodStrike", --New
				[56222] = "darkCommand", --New
				[48743] = "deathPact", -- NEW
				[55262] = "hearthStrike", --New
				[49005] = "markofblood", --New
				[50842] = "pestilence", --New
				[48982] = "runeTap", -- NEW
				[47476] = "strangulate",
				--Frost
				[45524] = "chainOfIce", --New
				[49796] = "deathChill", -- NEW
				[47568] = "empowerRuneWeapon",
				[48263] = "frostPresence", --New
				[55268] = "frostStrike", --New
				[49203] = "hungeringCold",
				[49909] = "icyTouch", --New
				[47528] = "mindFreeze",
				[51425] = "obliterate", --New
				[56815] = "runeStrike", --New
				--Unhloy
				[51328] = "corpseExplosion", --New
				[49938] = "deathAndDecay", --New
				[49576] = "deathGrip", -- New
				[49924] = "deathStrike", -- New
				[49921] = "plagueStrike", -- New
				[61999] = "raiseAlly", -- New
				[46584] = "raiseDead", -- NEW
				[55271] = "scourgeStrike", -- New
				[49206] = "summonGargoyle",
				[48265] = "unholyPresence",
					-- DK Pet
					[47468] = "petClaw", -- NEW
					[47481] = "petStun", -- NEW
					[47482] = "petLeap", -- NEW
					[47484] = "petHuddle", -- NEW
			--

			-- Druid
				--Balance
				[770]   = "faeryFire", -- New
				[33831] = "forceOfNature", -- New
				[48467] = "hurricane", -- New
				[48468] = "insectSwarm", -- New
				[48463] = "moonFire", -- New
				[24858] = "moonkinForm", -- New
				[61384] = "typhoon", -- NEW
				--Feral
				[8983]  = "bash", -- NEW
				[768]   = "catForm", -- NEW
				[9634]  = "bearForm", -- NEW
				[48570] = "claw", -- NEW
				[48560] = "demoralizingRoar", -- NEW
				[16857] = "faeryFire", -- Feral New
				[16979] = "feralChargeBear", -- New
				[49376] = "feralChargeCat", -- New
				[48577] = "ferociousBite", -- New
				[48568] = "lacerate", -- New
				[49802] = "maim", -- NEW
				[33878] = "mangle", -- Bear New
				[33876] = "mangle", -- Cat New
				[48480] = "maul", -- New
				[49803] = "pounce", -- New
				[5215]  = "prowl", -- NEW
				[48574] = "rake", -- New
				[48579] = "ravage", -- New
				[49800] = "rip", -- New
				[48572] = "shred", -- New
				[48562] = "swipe", -- Bear New
				[62078] = "swipe", -- Cat New
				[50213] = "tigersFury", -- New
				[5225]  = "trackHumanoids", -- New
				[783]   = "travelForm", -- New
				--Restoration
				[2893]  = "abolishPoison", -- New
				[48470] = "giftOfTheWild", -- New
				[48469] = "markOfTheWild", -- New
				[48451] = "lifeBloom", -- New
				[17116] = "naturesSwiftness", -- New
				[48441] = "rejuvenation", -- New
				[2782]  = "removeCurse", -- New
				[18562] = "swiftmend", -- New
				[33891] = "treeForm", -- New
				[53251] = "wildGrowth", -- New
			--

			--hunter
				--BeastMastery
				[13161] = "aspectOfTheBeast", --New
				[5118]  = "aspectOfTheCheetah", --New
				[61847] = "aspectOfTheDragonhawk", --New
				[27044] = "aspectOfTheHawk", --New
				[13163] = "aspectOfTheMonkey", --New
				[13159] = "aspectOfThePack", --New
				[34074] = "aspectOfTheViper", --New
				[49071] = "aspectOfTheWild", --New
				[6991]  = "feedPet", --New
				[48990] = "mendPet", -- NEW
				--Marksmanship
				[19434] = "aimedShot", --Aimed Shot rank 1
				[49050] = "aimedShot", --Aimed Shot rank 9
				[49045] = "arcaneShot", -- New
				[53209] = "chimeraShot", -- New
				[5116]  = "concussiveShot", -- New
				[20736] = "distractingShot", -- New
				[1543]  = "flare", -- NEW
				[53338] = "huntersMark", -- NEW
				[61006] = "killShot", -- New
				[49048] = "multiShot", -- New
				[23989] = "readiness",
				[3043]  = "scorpidSting", -- New
				[49001] = "serpentSting", -- New
				[34490] = "silencingshot",
				[19801] = "tranquilizingShot", -- New
				[3034]  = "viperSting", -- New
				[58434] = "volley", -- New
				--Survival
				[781]   = "disengage", -- New
				[49067] = "explosiveTrap", -- New
				[5384]  = "feignDeath", -- New
				[60192] = "freezingArrow", -- New
				[14311] = "freezingtrap", --freezing trap
				[14309] = "freezingtrap", --freezing trap effect
				[13809] = "frostTrap", --New
				[13810] = "frosttrap", --frost trap aura
				[1499]  = "frosttrap",
				[49056] = "immolationTrap", --New
				[53339] = "mongooseBite", --New
				[48996] = "raptorStrike", --New
				[19503] = "scattershot", -- New
				[34600] = "snaketrap", -- New
				[19885] = "trackHidden", -- New
				[19883] = "trackHumanoids", -- New
				[19386] = "wyvernSting",
				[49010] = "wyvernSting",
					-- Crab
					[61685] = "petCharge", -- NEW
					[52472] = "petClaw", -- NEW
					[53547] = "petPin", -- NEW
					-- Ravager
					[53561] = "petRavage", -- NEW
					[53490] = "petBullheaded", -- NEW
					[52473] = "petBite", -- NEW
					[61684] = "petDash", -- NEW
			--

			--mage
				--arcane
				[44781] = "arcaneBarrage", --New
				[42921] = "arcaneExplosion", --New
				[42846] = "arcaneMissiles", --New
				[1953]  = "blink", --New
				[42987] = "manaGem", --New
				[2139]  = "counterspell",
				[12051] = "evocation",
				[66]    = "invisibility",
				[55342] = "mirrorImage", -- NEW
				[475]   = "removeCurse", -- New
				[31589] = "slow", -- New
				[30449] = "spellSteal", -- NEW
				--Fire
				[42945] = "blastWave", -- NEW
				[42950] = "dragonsBreath", -- NEW
				[42873] = "fireBlast", -- NEW
				[55360] = "livingBomb", -- NEW
				--Frost
				[42940] = "blizzard", --New
				[11958] = "coldSnap",
				[42931] = "coneOfCold", --New
				[44572] = "deepFreeze",
				[42917] = "frostNova", -- NEW
				[42914] = "iceLance", -- NEW
				[31687] = "summonWaterElemental", -- NEW
				--Pet
					[33395] = "petFreeze", --New
			--

			--paladin
				--Holy
				[4987]  = "Cleanse", --New
				[19746] = "concentrationAura", --New
				[48819] = "consecration", --New
				[20216] = "divineFavor", -- NEW
				[48825] = "holyShock", -- NEW
				[48817] = "holyWrath", -- NEW
				[48788] = "layOnHands", -- NEW
				[1152]  = "purify", -- NEW
				--Protection
				[48827] = "avengersShield", -- NEW
				[48942] = "devotionAura", -- NEW
				[48947] = "fireResistanceAura", -- NEW
				[48945] = "frostResistanceAura", -- New
				[10308] = "hammerOfJustice",
				[53595] = "hammerOfTheRighteous", -- New
				[62124] = "handOfReckoning", -- New
				[20164] = "sealOfJustice", -- New
				[48943] = "shadowResistanceAura", -- New
				[61411] = "shieldOfRighteousness", -- New
				--Retribution
				[32223] = "crusaderAura", --New
				[35395] = "crusaderStrike", --New
				[53385] = "divineStorm", --New
				[48806] = "hammerOfWrath", --New
				[53407] = "judgementOfJustice", --New
				[20271] = "judgementOfLight", --New
				[53408] = "judgementOfWisdom", --New
				[20066] = "repentance",
				[54043] = "retributionAura", --New
			--

			--priest
				--Discipline
				[988]   = "dispel", -- NEW
				[53007] = "penance", -- NEW
				--Holy
				[552]   = "abolishDisease", -- NEW
				[528]   = "cureDisease", -- NEW
				[48173] = "desperatePrayer", --works
				[48078] = "holyNova", -- NEW
				[48068] = "renew", -- NEW
				[48113] = "prayerOfMending", -- NEW
				--Shadow
				[48300] = "devouringPlague", --New
				[48156] = "mindFlay", --New
				[53023] = "mindSear", --New
				[64044] = "psychicHorror", -- New
				[10890] = "psychicScream", -- New
				[48158] = "shadowWordDeath", -- NEW
				[48125] = "shadowWordPain", -- NEW
				[34433] = "shadowFiend", -- works
				[15487] = "silence", 		 -- NEW
			--

			--rogue
				--Assassination
				[48691] = "ambush", --New
				[1833]  = "cheapShot",  -- NEW
				[48674] = "deadlyThrow",  -- NEW
				[51722] = "dismantle", --New
				[57993] = "envenom", --New
				[48668] = "eviscerate", --New
				[8647]  = "exposeArmor", --New
				[48676] = "garrote",   -- NEW
				[8643]  = "kidneyShot", -- NEW
				[48666] = "mutilate", -- NEW
				[48672] = "rupture", -- NEW
				--Combat
				[48657] = "backstab", --New
				[51723] = "fanOfKnive", --New
				[1776]  = "gouge", --New
				[1766]  = "kick",
				[5938]  = "shiv", --New
				[48638] = "sinisterStrike", --New
				[13877] = "bladeFlurry",
				--Subtlety
				[2094]  = "blind",
				[1725]  = "distract", --New
				[48660] = "hemorrage", --New
				[14183] = "premeditation", --New
				[14185] = "preparation",
				[51724] = "sap",
				[11297] = "sap",
				[6770]  = "sap",
				[36554] = "shadowStep", --New
				[1784]  = "stealth",
				[26889] = "vanish",
			--

			--shaman
				--Elemental
				[66843] = "callOfTheAncestors", --New
				[66842] = "callOfTheElements", --New
				[66844] = "callOfTheSpirits", --New
				[49231] = "earthShock", --New
				[2484]  = "earthbindTotem",
				[2894]  = "fireElementalTotem", --New
				[61657] = "fireNova", --New
				[49233] = "flameShock", --New
				[49236] = "frostShock", --New
				[58734] = "magmaTotem", --New
				[8012]  = "purge", -- NEW
				[58704] = "searingTotem", -- NEW
				[58582] = "stoneclawTotem", -- NEW
				[59159] = "thunderstorm", 	-- NEW
				[57722] = "totemOfWrath", -- NEW
				[57994] = "windShear", 		-- NEW
				--Enhancement
				[2062]  = "earthElementalTotem", --New
				[51533] = "feralSpirit", --New
				[58739] = "fireResistanceTotem", --New
				[58656] = "flametongueTotem", --New
				[58745] = "frostResistanceTotem", --New
				[8177]  = "groundingTotem",
				[60103] = "lavaLash", --New
				[49281] = "lightningShield", --New
				[58749] = "natureResistanceTotem", --New
				[58753] = "stoneskinTotem", --New
				[17364] = "stormstrike", --New
				[58643] = "strengthOfTheEarthTotem", --New
				[8512]  = "windfuryTotem", --New
				[3738]  = "wrathOfTheAirTotem", --New
				--Restoration
				[51886] = "cleanseSpirit", --New
				[8170]  = "cleansingTotem", --New
				[526]   = "cureToxins", --New
				[58757] = "healingStreamTotem", --New
				[58774] = "manaSpringTotem", --New
				[16190] = "manaTideTotem",
				[16188] = "naturesSwiftness", --New
				[61301] = "riptide", --New
				[55198] = "tidalForce", --New
				[36936] = "totemicRecall", --New
				[8143]  = "tremorTotem",
				[65992] = "tremorTotem",
			--

			--warlock
				--Affliction
				[47813] = "corruption", --New
				[47864] = "curseOfAgony", 	-- NEW
				[47867] = "curseOfDoom", 	-- NEW
				[18223] = "curseOfExhaustion", 	-- NEW
				[47865] = "curseOfTheElements", 	-- NEW
				[11719] = "curseOfTongues", 	-- NEW
				[50511] = "curseOfWeakness", 	-- NEW
				[6789]  = "deathcoil",
				[47860] = "deathcoil",
				[47857] = "drainLife", --New
				[5138]  = "drainMana",
				[47855] = "drainSoul", --New
				[17928] = "howlOfTerror", --New
				[57946] = "lifeTap", --New
				--Demonology
				[47875] = "healthtone", --R1 	-- NEW
				[48020] = "demonicCircleTeleport",
				[132]   = "detectInvisibility", --New
				[47856] = "healthFunnel", --New
				[1122]  = "inferno", --New
				--Destruction
				[17962] = "conflagrate", --New
				[47823] = "hellFire", --New
				[47820] = "rainOfFire", --New
				[47827] = "shadowBurn", --New
				[61290] = "shadowFlame", --New
				[47847] = "shadowFury", --New
					-- Succube
					[7870] = "lesserInvisibility", --New
					-- Felhunter
					[19647] = "spellLock",
					[48011] = "devourMagic", -- NEW
			--

			--warrior
				--Arms
				[2457]  = "battleStance",
				[11578] = "charge", --New
				[1715]  = "hamstring", --New
				[47450] = "heroicStrike", --New
				[57755] = "heroicThrow", --New
				[694]   = "mockingBlow", --New
				[47486] = "mortalStrike", --New
				[7384]  = "overpower", --New
				[47465] = "rend", --New
				[47502] = "thunderClap", --New
				--Fury
				[2458]  = "berserkerStance",
				[23881] = "bloodthirst", --New
				[1161]  = "challengingShout", --New
				[47520] = "cleave", --New
				[47437] = "demoralizingShout", -- NEW
				[47471] = "execute", -- New
				[60970] = "heroicFury", -- New
				[20252] = "intercept", -- New
				[5246]  = "intimidatingShout",
				[12323] = "piercingHowl", --New
				[6552]  = "pummel", --New
				[47475] = "slam", --New
				[34428] = "victoryRush", --New
				[1680]  = "whirlwind", --New
				--Protection
				[2687]  = "bloodRage", --New
				[12809] = "concussionBlow", --New
				[71]    = "defensiveStance",
				[47498] = "devastate", --New
				[676]   = "disarm",
				[3411]  = "intervene", --New
				[57823] = "revenge", --New
				[72]    = "shieldBash",
				[47488] = "shieldSlam", --New
				[46968] = "shockwave", -- NEW
				[7386]  = "sunderArmor", -- NEW
				[355]   = "taunt", -- NEW
			--
		},

		-- Enemy SPELL_AURA_APPLIED CC
		enemyDebuffs = {
			[2094]  = "Enemyblinded", --works
			[51724] = "Enemysapped", --works
			[12826] = "EnemyPollied",
			[118]   = "EnemyPollied",
			[33786] = "EnemyCycloned",--menu
			[51514] = "EnemyHexxed",
		},
		-- Enemy SPELL_AURA_REMOVED CC
		enemyDebuffdown = {
			[2094]  = "blinddown", --works
			[51724] = "sapdown", --works
			[118]   = "polydown",
			[12826] = "polydown",
			[33786] = "cyclonedown", --menu
			[51514] = "hexdown",
		},

		-- Friend SPELL_COUNTERED
		interruptFriend = {
			[2139]  = "friendcountered",
			[50613] = "friendcountered",
			[1766]  = "friendcountered",
			[57994] = "friendcountered",
			[72]    = "friendcountered",
			[47528] = "friendcountered",
		},
		-- Friend - ENemy SPELL_CASTING_START CC -> Party
		friendCCs = {
			[33786] = "cyclonefriend",
			[51514] = "hexfriend",
			[12826] = "polyfriend",
			[118]   = "polyfriend",
			[28272] = "polyfriend",
			[61305] = "polyfriend",
			[61721] = "polyfriend",
			[61025] = "polyfriend",
			[61780] = "polyfriend",
			[28271] = "polyfriend",
			[6215]  = "fearfriend",
		},
		-- Friend - Enemy SPELL_CASTING_SUCCESS CC -> Party
		friendCCSuccess = {
			[14309] = "friendfrozen",
			[2094]  = "blindfriend",
			[5246]  = "friendfeared", --intimidating shout
			[51724] = "friendsapped",
			[33786] = "friendcycloned",
			[10308] = "friendstunned",
			[2139]  = "friendcountered",
			[51514] = "friendhexxed",
			[118]   = "friendpoly",
			[12826] = "friendpoly",
			[6215]  = "friendfeared",
			[10890] = "friendfeared",
			[17928] = "friendfeared",
		},
		-- Party SPELL_CASTING_SUCCESS CC -> Enemy
		friendCCenemy = {
			[2094]  = "enemyblinded",
			[51724] = "enemysapped",
			[51514] = "enemyhexxed",
			[12826] = "enemypollied",
			[118]   = "enemypollied",
			[33786] = "enemycycloned",
		},
		-- Enemy SPELL_AURA_REMOVED CC
		enemyDebuffdownAP = {
			[2094]  = "Blinddown",
			[51724] = "Sapdown",
			[51514] = "Hexdown",
			[12826] = "Polydown",
			[118]   = "Polydown",
			[33786] = "CycloneDown",
		},
		-- SELF
		selfDebuff = {
			[33786] = "Cyclone",
			[51514] = "Hex",
			[12826] = "Polymorph",
			[118]   = "Polymorph",
			[28272] = "Polymorph",
			[61305] = "Polymorph",
			[61721] = "Polymorph",
			[61025] = "Polymorph",
			[61780] = "Polymorph",
			[28271] = "Polymorph",
			[6215]  = "Fear",
			[60192] = "Freezingtrap", --double check
			[14309] = "Freezingtrap", --freezing trap effect
			[13810] = "Frosttrap", --frost trap aura
			[13809] = "Frosttrap", --frost trap aura
			[14311] = "Freezingtrap",
			[19503] = "scattershot", -- NEW: Scatter Shot
			[1499]  = "Frosttrap",
			[5246]  = "Fear3", --intimidating shout
			[17928] = "Fear2", --Howl of Terror
			[2094]  = "Blind",
			[51724] = "Sap",
			[11297] = "Sap",
			[6770]  = "Sap",
			[10308] = "Hammerofjustice",
			[10890] = "Fear4", -- Psychic Scream
			[47860] = "Deathcoil",
			[5138]  = "drainMana",
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
			[6358]  = "seduction",
		},
	}
end
--args = listOptions({58984,26297,20594,20572,7744,28880},"auraApplied"),


--PlaySoundFile(""..sadb.sapath..list[spellID]..".mp3");