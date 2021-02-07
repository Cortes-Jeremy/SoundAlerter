--[[SoundAlerter for 3.3.5a by Trolollolol - Sargeras - Molten-WoW.com
				Credits to Abatorlos of Spinebreaker, Duskashes, Superk
								Notes: Check spell IDs by rank first
								add death wish down, starfire, bladestorm down]]
function SoundAlerter:GetSpellList () 
	return {
		auraApplied = {					-- aura applied [spellid] = ".mp3 file name",
			--Races
			[58984] = "Shadowmeld",
			[26297] = "berserking",
			[20594] = "stoneform",
			[20572] = "BloodFury",
			[33702] = "BloodFury",
			[7744] = "willoftheforsaken",
			[28880] = "giftofthenaaru",
			--Druid
			[61336] = "survivalInstincts",
			[29166] = "innervate",
			[22812] = "barkskin",
			[17116] = "naturesSwiftness",
			[17329] = "naturesGrasp",	--Natures Grasp rank 6
			[27009] = "naturesGrasp",	--Natures Grasp rank 7
			[53312] = "naturesGrasp",	--Natures Grasp rank 8
			[22842] = "frenziedRegeneration",
			[48505] = "starfall",	--starfall rank 1
			[53199] = "starfall",	--starfall rank 2
			[53200] = "starfall",	--starfall rank 3
			[53201] = "starfall",	--starfall rank 4
			[50334] = "berserk",
			[1850] = "dash",	--dash rank 1
			[9821] = "dash",	--dash rank 2
			[33357] = "dash",	--dash rank 3
			--Paladin
			[31821] = "auraMastery",
			[1022] = "handOfProtection",	--Hand of Protection rank 1
			[5599] = "handOfProtection",	--Hand of Protection rank 2
			[10278] = "handOfProtection",	--Hand of Protection rank 3
			[1044] = "handOfFreedom",
			[642] = "divineShield",
			[6940] = "handofsacrifice", --don't know
			[64205] = "divineSacrifice",
			[498] = "DivineProtection", 
			[54428] = "divinePlea",
			--Rogue
			[2983] = "sprint",	--Sprint rank 1
			[8696] = "sprint",	--Sprint rank 3
			[11305] = "sprint",	--Sprint rank 2
			[51713] = "shadowDance",
			[31224] = "cloakOfShadows",
			[13750] = "adrenalineRush",
			[5277] = "evasion", --Evasion rank 1
			[26669] = "evasion", --Evasion rank 2
			[14177] = "coldBlood",
			--Warrior
			[55694] = "EnragedRegeneration",
			[1719] = "Recklessness",
			[871] = "shieldWall",
			[12975] = "lastStand",
			[18499] = "berserkerRage",
			[20230] = "Retaliation",
			[23920] = "spellReflection",
			[12328] = "sweepingStrikes",
			[46924] = "bladestorm",
			[12292] = "deathWish",
			--Priest
			[33206] = "painSuppression",
			[10060] = "powerInfusion",
			[6346] = "fearWard",
			[47585] = "dispersion",
			[14751] = "innerfocus",
			[47788] = "GuardianSpirit",
			--Shaman
			[30823] = "shamanisticRage",
			[974] = "earthShield",	--Earth Shield rank 1
			[32593] = "earthShield",	--Earth Shield rank 2
			[32594] = "earthShield",	--Earth Shield rank 3
			[49283] = "earthShield",	--Earth Shield rank 4
			[49284] = "earthShield",	--Earth Shield rank 5
			[16188] = "naturesSwiftness2",
			[52127] = "waterShield",	--Water Shield rank 1
			[52129] = "waterShield",	--Water Shield rank 2
			[52131] = "waterShield",	--Water Shield rank 3
			[52134] = "waterShield",	--Water Shield rank 4
			[52136] = "waterShield",	--Water Shield rank 5
			[52138] = "waterShield",	--Water Shield rank 6
			[24398] = "waterShield",	--Water Shield rank 7
			[33736] = "waterShield",	--Water Shield rank 8
			[57960] = "waterShield",	--Water Shield rank 9
			[16166] = "ElementalMastery",
			--Mage
			[45438] = "iceBlock",
			[12042] = "arcanePower",
			[12472] = "icyveins",
			[12043] = "PresenceofMind",
			[28682] = "combustion",
			--DK
			[49039] = "lichborne",
			[48792] = "iceboundFortitude",
			[55233] = "vampiricBlood",
			[48707] = "antimagicshell",
			[49222] = "boneshield",
			[49016] = "hysteria",
			--Hunter
			[53480] = "roarofsacrifice",
			[34471] = "theBeastWithin",
			[19263] = "deterrence",	
			--Warlock
			[17941] = "shadowtrance",
		},
		auraRemoved = {
			--Warrior
			[46924] = "bladestormdown",
			[1719] = "RecklessnessDown",
			[871] = "shieldWallDown",
			[12292] = "deathWishdown",
			--Paladin
			[498] = "DivineProtectionDown", 
			[10278] = "protectionDown",
			[642] = "bubbleDown",
			--Rogue
			[31224] = "cloakDown",
			[26669] = "evasionDown",
			--Priest
			[33206] = "PSDown",
			[47585] = "dispersionDown",
			--Mage
			[45438] = "iceBlockDown",
			--DK
			[48792] = "iceboundFortitudeDown",
			[49039] = "lichborneDown",
			[48707] = "antimagicshelldown",
			--Druid
			[48505] = "Starfalldown",	--starfall rank 1
			[53199] = "Starfalldown",	--starfall rank 2
			[53200] = "Starfalldown",	--starfall rank 3
			[53201] = "Starfalldown",	--starfall rank 4
			--Hunter
			[19263] = "Deterrencedown",
			[34471] = "beastwithindown",
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
			--druid
			[18658] = "hibernate",
			[2637] = "hibernate", 
			[33786] = "cyclone",  --works
			[48465] = "starfire", --rank 10
			--paladin
			[10326] = "turnEvil", --unimplemented
			--rogue
			--warrior
			--priest		
			[8129] = "manaBurn", 
			[9484] = "shackleUndead",
			[64843] = "divineHymn",
			[605] = "mindControl",
			--shaman
			[51514] = "hex", --works
			[60043] = "lavaburst",
			--mage
			[118] = "polymorph", --Can be poly:turtle, cat, sheep, etc
			[12826] = "polymorph",
			[28272] = "polymorph",
			[61305] = "polymorph",
			[61721] = "polymorph",
			[61025] = "polymorph",
			[61780] = "polymorph",
			[28271] = "polymorph", 
			--Hunter
			[982] = "revivePet", 
			[14327] = "scareBeast",
			--Warlock
			[6215] = "fear", --works
			[5484] = "fear2", -- Howl of Terror
			[17928] = "fear2", --Howl of Terror
			[710] = "banish",
			[688] = "summonpet", --works
			[691] = "summonpet", --works
			[712] =  "summonpet", --works
			[697] = "summonpet", --works
			[30146] = "summonpet", --felguard, works
		},
		castSuccess = { --Used for abilities that affect the player
			--mage
			[12051] = "evocation",
			[11958] = "coldSnap",
			[44572] = "deepFreeze",
			[44445] = "hotStreak", --double check spell ID
			[2139] = "counterspell",
			[66] = "invisibility",
			--DK
			[47528] = "mindFreeze",
			[47476] = "strangulate",
			[47568] = "runeWeapon",
			[49206] = "gargoyle",
			[49203] = "hungeringCold",
			[61606] = "markofblood",
			--hunter
			[23989] = "readiness", 
			[19386] = "wyvernSting", 
			[49010] = "wyvernSting", 
			[34490] = "silencingshot",
			[19434] = "aimedshot", --Aimed Shot rank 1
			[49050] = "aimedshot", --Aimed Shot rank 9
			[53271] = "masterscall",
			[60192] = "freezingtrap", --double check
			[14309] = "freezingtrap", --freezing trap effect
			[13810] = "frosttrap", --frost trap aura
			[13809] = "frosttrap", --frost trap aura
			[14311] = "freezingtrap",
			[1499] = "frosttrap",
			--warlock
			[5138] = "DrainMana",
			[17928] = "fear2", --Howl of Terror
			[19647] = "spellLock",
			[48020] = "demonicCircleTeleport",
			[6789] = "deathcoil",
			[47860] = "deathcoil",
			[6358] = "Seduction",
			--paladin
			[20066] = "repentance",
			[10308] = "hammerofjustice",
			[31884] = "avengingWrath",
			--rogue
			[51722] = "disarm2", --dismantle
			[51724] = "sap",
			[11297] = "sap",
			[6770] = "sap",
			[2094] = "blind",
			[1766] = "kick",
			[14185] = "preparation",
			[26889] = "vanish",
			[13877] = "bladeflurry",
			[1784] = "stealth",
			--shaman
			[2825] = "bloodlust",
			[32182] = "heroism",
			[8143] = "tremorTotem", --works
			[65992] = "tremorTotem", --dont know which one
			[16190] = "manaTide",
			[2484] = "earthbind", --works
			[8177] = "grounding", --works
			--warrior
			[2457] = "battlestance",
			[71] = "defensestance",
			[2458] = "berserkerstance",
			[676] = "disarm", --works
			[5246] = "fear3", --intimidating shout, works
			[6552] = "pummel", --works
			[72] = "shieldBash", --works
			--priest
			[10890] = "fear4", -- Psychic Scream
			[34433] = "shadowFiend", -- works
			[64044] = "disarm3", --psychic horror, works
			[48173] = "desperatePrayer", --works
		},
		enemyDebuffs = {
			[2094] = "Enemyblinded", --works
			[51724] = "Enemysapped", --works
			[12826] = "EnemyPollied",
			[118] = "EnemyPollied",
			[33786] = "EnemyCycloned",--menu
			[51514] = "EnemyHexxed",
		},
		enemyDebuffdown = {
			[2094] = "blinddown", --works
			[51724] = "sapdown", --works
			[118] = "polydown",
			[12826] = "polydown",
			[33786] = "cyclonedown", --menu
			[51514] = "hexdown",
		},
		interruptFriend = {
			[2139] = "friendcountered",
			[50613] = "friendcountered",
			[1766] = "friendcountered",
			[57994] = "friendcountered",
			[72] = "friendcountered",
			[47528] = "friendcountered",
		},
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
		friendCCenemy = {
			[2094] = "enemyblinded",
			[51724] = "enemysapped",
			[51514] = "enemyhexxed",
			[12826] = "enemypollied",
			[118] = "enemypollied",
			[33786] = "enemycycloned",
		},
		enemyDebuffdownAP = {
			[2094] = "Blinddown",
			[51724] = "Sapdown",
			[51514] = "Hexdown",
			[12826] = "Polydown",
			[118] = "Polydown",
			[33786] = "CycloneDown",
		},
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