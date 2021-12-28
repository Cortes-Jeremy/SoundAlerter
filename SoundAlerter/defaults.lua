dbDefaults = {
	profile = {
	--general
		all = false,
		arena = true,
		battleground = true,
		field = true,
		myself = false,
		enemyinrange = true,
		sapath = SA_LOCALEPATH[GetLocale()] or "Interface\\Addons\\SoundAlerter\\voice\\",
		debugmode = false,
		trinket = true,
		drinking = true,
		class = true,
	--chat alert stuff
		caonlyTF = true,
		bubbleeenemy = true,
		stealthenemy = true,
		vanishalert = true,
		interruptenemy = true,
		sapenemy = true,
		sapselffriend = true,
		cycloneenemy = true,
		hexenemy = true,
		fearenemy = true,
		blindenemy = true,
		blindselffriend = true,
		polyenemy = true,
		cycloneselffriend = true,
		hexselffriend = true,
		fearselffriend = true,
		bubbleenemy = true,
		chatdownself = true,
		vanishTF = true,
		stealthTF = true,
		InterruptEnemyText = "Interrupted #enemy# with #spell#",
		InterruptSelfText = "#enemy# interrupted me!",
		friendchat = "#enemy# casted #spell# on #friend#",
		selfchat = "#enemy# casted #spell# on me!",
		enemychat = "#spell# up on #enemy#",
		enemybuffchat = "#enemy# casted #spell#",
		sapselftext = "I'm Sapped!",
		sapfriendtext = "#friend# is Sapped!",
		bubbleenemytext = "#enemy# bubbled!",
		blindtext = "#enemy# blinded me!",
		saptextself = "I'm Sapped!",
		blindtextfriend = "#friend# Is Blinded!",
		trinketalerttext = "[#enemy#] Trinketted!",
		chatgroup = "SAY",
	--disables
		chatdownfriend = false,
		interruptself = false,
		trinketalert = false,
		spelldebug = false,
		auraApplied = false,
		auraRemoved = false,
		castStart = false,
		castSuccess = false,
		interrupt = false,
	--spells
		-- main
			chatalerts = true,
			interrupt = true,
			auraApplied = false,
			auraRemoved = true,
			castStart = false,
			castSuccess = false,
			dEnemyDebuff = true,
			dEnemyDebuffDown = true,
			dArenaPartner = true,
			dSelfDebuff = true,
	--Disabled Spells at default
		-- aura applied
			--Objects
				nitroBoost = false,
				hyperspeedAccelerator = false,
			--Races
				-- shadowmeld = true,
				berserking = false,
				stoneform = false,
				bloodFury = false,
				willOfTheForsaken = true,
				giftOfTheNaaru = false,
			--DK
				--Blood
					bloodTap = false,
					dancingRuneWeapon = false,
					hysteria = false,
					vampiricBlood = false,
				--Frost
					hornOfWinter = false,
					-- iceboundFortitude = true,
					-- lichborne = true,
					unbreakableArmor = false,
				--Unholy
				-- antiMagicShell = true
				antiMagicZone = false,
				boneShield = false,
			--Druid
				--Balance
					barkskin = false,
					-- innervate = false,
					naturesGrasp = false,
					-- starfall = true,
					thorns = false,
						--Proc
						lunarEclipse = false,
						solarEclipse = false,
						clearcasting = false,
				--Feral
				berserk = false,
				dash = false,
				enrage = false,
				frenziedRegeneration = false,
				savageRoar = false,
				survivalInstincts = false,
					--PROC
					-- predatorsSwiftness = false,
				--Restauration
				giftOfTheWild = false,
				markOfTheWild = false,
				naturesSwiftness = false,
			--Hunter
				--Beastmastery
					killCommand = false,
					mastersCall = false,
						--Proc
						theBeastWithin = false,
				--Marksmanship
					rapidFire = false,
				--Survival
					-- deterrence = false,
					misdirection = false,
					--Pet
						roarOfSacrifice = false,
						roarOfRecovery = false,
						petCower = false,
						--Crab
						-- petIntervene = false,
						petLaststand = false,
						--Ravarger
						petDash = false,
			--Mage
				--Arcane
					-- arcanePower = false,
					-- invisibility = false,
					manaShield = false,
					presenceOfMind = false,
					slowFall = false,
						--Proc
						missileBarrage = false,
				--Fire
					combustion = false,
					fireWard = false,
						--Proc
						blazingSpeed = false,
						impact = false,
						hotStreak = false,
				--Frost
					frostWard = false,
					iceBarrier = false,
					-- iceBlock = false,
					-- icyveins = false,
						--Proc
						fingersOfFrost = false,
						brainFreeze = false,
			--Paladin
				--Holy
					-- auraMastery = false,
					beaconOfLight = false,
					divineIllumination = false,
					-- divinePlea = false,
					sacredShield = false,
						--Proc
						infusionOfLight = false,
				--Protection
					divineProtection = false,
					-- divineSacrifice = false,
					divineShield = false,
					handOfFreedom = false,
					handOfProtection = false,
					handofsacrifice = false,
					handofsalvation = false,
					righteousFury = false,
						--Proc
						reckoning = false,
				--Retribution
					-- avengingWrath = false,
						--Proc
						theArtOfWar = false,
						sheathOfLight = false,
			--Priest
				--Discipline
					-- fearWard = false,
					innerFire = false,
					-- painSuppression = false,
					powerInfusion = false,
					powerWordShield = false,
				--Holy
					guardianSpirit = false,
				--Shadow
					-- dispersion = false,
					fade = false,
					shadowForm = false,
			--Rogue
				--Assassination
					coldBlood = false,
				--Combat
					adrenalineRush = false,
					-- evasion = false,
					feint = false,
					killingSpree = false,
					sprint = false,
				--Subtlety
					-- cloakOfShadows = false,
					-- shadowDance = false,
					trickOfTheTrade = false,
					cheatingDeath = false,
			--Shaman
				--Elemental
					-- elementalMastery = false,
				--Enhancement
					ghostWolf = false,
					-- heroism = false,
					-- bloodlust = false,
					shamanisticRage = false,
						--Proc
						maelstromWeapon = false,
				--Restoration
					earthShield = false,
					waterShield = false,
					naturesSwiftness = false,
			--Warlock
				--Affliction
						--Proc
						shadowtrance = false,
				--Demonology
					shadowWard = false,
					felDomination = false,
				--Destruction
						--Proc
						backdraft = false,
			--Warrior
				--Arms
					-- bladestorm = false,
					-- Retaliation = false,
					sweepingStrikes = false,
						--Proc
						tasteForBlood = false,
				--Fury
					berserkerRage = false,
					deathWish = false,
					-- enragedRegeneration = false,
					-- recklessness = false,
					battleShout = false,
					commandingShout = false,
				--Protection
					lastStand = false,
					shieldBlock = false,
					-- shieldWall = false,
					-- spellReflection = false,
						--Proc
						swordAndBoard = false,
		-- aura removed
			--Objects
				nitroBoostDown = false,
				hyperspeedAcceleratorDown = false,
			--Races
				shadowmeldDown = false,
				berserkingDown = false,
				stoneformDown = false,
				bloodFuryDown = false,
				bloodFuryDown = false,
				willOfTheForsakenDown = false,
				giftOfTheNaaruDown = false,
			--DK
				--Blood
					bloodTapDown = false,
					dancingRuneWeaponDown = false,
					hysteriaDown = false,
					vampiricBloodDown = false,
				--Frost
					hornOfWinterDown = false,
					iceboundFortitudeDown = false,
					lichborneDown = false,
					unbreakableArmorDown = false,
				--Unholy
					antiMagicShellDown = false,
					antiMagicZoneDown = false,
					boneShieldDown = false,
			--Druid
				--Balance
					barkskinDown = false,
					innervateDown = false,
					naturesGraspDown = false,
					starfallDown = false,
					thornsDown = false,
						--Proc
						lunarEclipseFown = false,
						solarEclipseDown = false,
						clearcastingDown = false,
				--Feral
					berserkDown = false,
					dashDown = false,
					enrageDown = false,
					frenziedRegenerationDown = false,
					savageRoarDown = false,
					survivalInstinctsDown = false,
						--PROC
						predatorsSwiftnessDown = false,
				--Restauration
					giftOfTheWildDown = false,
					markOfTheWildDown = false,
					naturesSwiftnessDown = false,
			--Hunter
				--Beastmastery
					killCommandDown = false,
					mastersCallDown = false,
						--Proc
						theBeastWithinDown = false,
				--Marksmanship
					rapidFireDown = false,
				--Survival
					deterrenceDown =false,
					misdirectionDown = false,
					--Pet
						roarOfSacrificeDown = false,
						roarOfRecoveryDown = false,
						petCowerDown = false,
						--Crab
						petInterveneDown = false,
						petLaststandDown = false,
						--Ravarger
						petDashDown = false,
			--Mage
				--Arcane
					arcanePowerDown = false,
					invisibilityDown = false,
					manaShieldDown = false,
					presenceOfMindDown = false,
					slowFallDown = false,
						--Proc
						missileBarrageDown = false,
				--Fire
					combustionDown = false,
					fireWardDown = false,
						--Proc
						blazingSpeedDown = false,
						impactDown = false,
						hotStreakDown = false,
				--Frost
					frostWardDown = false,
					iceBarrierDown = false,
					iceBlockDown = false,
					icyveinsDown = false,
						--Proc
						fingersOfFrostDown = false,
						brainFreezeDown = false,
			--Paladin
				--Holy
					auraMasteryDown = false,
					beaconOfLightDown = false,
					divineIlluminationDown = false,
					divinePleaDown = false,
					sacredShieldDown = false,
						--Proc
						infusionOfLightDown = false,
				--Protection
					divineProtectionDown = false,
					divineSacrificeDown = false,
					divineShieldDown = false,
					handOfFreedomDown = false,
					handOfProtectionDown = false,
					handofsacrificeDown = false,
					handofsalvationDown = false,
					righteousFuryDown = false,
						--Proc
						reckoningDown = false,
				--Retribution
					avengingWrathDown = false,
						--Proc
						theArtOfWarDown = false,
						sheathOfLightDown = false,
			--Priest
				--Discipline
					fearWardDown = false,
					innerFireDown = false,
					painSuppressionDown = false,
					powerInfusionDown = false,
					powerWordShieldDown = false,
				--Holy
					guardianSpiritDown = false,
				--Shadow
					dispersionDown = false,
					fadeDown = false,
					shadowFormDown = false,
			--Rogue
				--Assassination
					coldBloodDown = false,
				--Combat
					adrenalineRushDown = false,
					evasionDown = false,
					feintDown = false,
					killingSpreeDown = false,
					sprintDown = false,
				--Subtlety
					cloakOfShadowsDown = false,
					shadowDanceDown = false,
					trickOfTheTradeDown = false,
					cheatingDeathDown = false,
			--Shaman
				--Elemental
					elementalMasteryDown = false,
				--Enhancement
					ghostWolfDown = false,
					heroismDown = false,
					bloodlustDown = false,
					shamanisticRageDown = false,
						--Proc
						maelstromWeaponDown = false,
				--Restoration
					earthShieldDown = false,
					waterShieldDown = false,
					naturesSwiftnessDown = false,
			--Warlock
				--Affliction
					--Proc
					shadowtranceDown = false,
				--Demonology
				shadowWardDown = false,
				felDominationDown = false,
				--Destruction
					--Proc
					backdraftDown = false,
			--Warrior
				--Arms
					bladestormDown = false,
					RetaliationDown = false,
					sweepingStrikesDown = false,
						--Proc
						tasteForBloodDown = false,
				--Fury
					berserkerRageDown = false,
					deathWishDown = false,
					enragedRegenerationDown = false,
					recklessnessDown = false,
					commandingShoutDown = false,
					battleShoutDown = false,
				--Protection
					lastStandDown = false,
					shieldBlockDown = false,
					shieldWallDown = false,
					spellReflectionDown = false,
						--Proc
						swordAndBoardDown = false,
		-- cast start
			--general
				-- bigHeal = false,
				-- resurrection = false,
			--Druid
				--Balance
					hibernate = false,
					hurricane = false,
					-- cyclone = false,
					starfire = false,
					-- entanglingRoots = false,
					wrath = false,
				--Restoration
					regrowth = false,
					tranquility = false,
			--Hunter
				--Beast Mastery
					scareBeast = false,
					revivePet = false,
				--Marksmanship
					steadyShot = false,
			--mage
				--arcane
					arcaneBlast = false,
					-- polymorph = false,
					arcaneMissiles = false,
				--Fire
					fireBall = false,
					flameStrike = false,
					frostFireBolt = false,
					scorch = false,
				--Frost
					frostBolt = false,
			--paladin
				--Holy
					exorcism = false,
					flashOfLight = false,
					turnEvil = false,
			--priest
				--Discipline
					-- manaBurn = false,
					-- massDispel = false,
					shackleUndead = false,
				--Holy
					bindingHeal = false,
					flashHeal = false,
					holyFire = false,
					smite = false,
				--shadow
					mindBlast = false,
					-- mindControl = false,
					-- vampiricTouch = false,
			--rogue
				--subtlety
				disarmTrap = false,
			--shaman
				--Elem
					chainLightning = false,
					-- hex = false,
					lavaBurst = false,
					lightningBolt = false,
				--Restoration
					lesserHealingWave = false,
			--Warlock
				--Affliction
					-- fear = false,
					haunt = false,
					-- howlOfTerror = false,
					seedOfCorruption = false,
					unstableAffliction = false,
				--Demonology
					banish = false,
					createHealstone = false,
					demonicCircleSummon = false,
					enslaveDemon = false,
					summonFelhunter = false,
					summonImp = false,
					-- summonSuccube = false,
					summonVoidwalker = false,
					summonFelGuard = false,
				--Destruction
					chaosBolt =false,
					immolate =false,
					incinerate =false,
					searingPain =false,
					soulFire =false,
				--Pet
					--Succube
					-- seduction =false,
			--warrior
				--Arms
					-- shatteringThrow = false,
		-- cast success
			--Objects
				-- baubleOfTrueBlood = false,
				pyroRocket = false,
			--DK
				--Blood
					-- bloodBoil = false,
					bloodPresence = false,
					bloodStrike = false,
					darkCommand = false,
					-- deathPact = false,
					hearthStrike = false,
					-- markofblood = false,
					pestilence = false,
					runeTap = false,
					-- strangulate = false,
				-- Frost
					chainOfIce = false,
					deathChill = false,
					-- empowerRuneWeapon = false,
					frostPresence = false,
					frostStrike = false,
					-- hungeringCold = false,
					icyTouch = false,
					-- mindFreeze = false,
					obliterate = false,
					runeStrike = false,
				--Unhloy
					-- corpseExplosion = false,
					deathAndDecay = false,
					deathGrip = false,
					deathStrike = false,
					plagueStrike = false,
					raiseAlly = false,
					raiseDead = false,
					scourgeStrike = false,
					-- summonGargoyle = false,
					unholyPresence = false,
				-- DK Pet
					petClaw = false,
					-- petStun = false,
					petLeap = false,
					petHuddle = false,
			-- Druid
				--Balance
					faeryFire = false,
					forceOfNature = false,
					hurricane = false,
					insectSwarm = false,
					moonFire = false,
					moonkinForm = false,
					typhoon = false,
				--Feral
					bash = false,
					catForm = false,
					bearForm = false,
					claw = false,
					demoralizingRoar = false,
					faeryFire = false,
					feralChargeBear = false,
					feralChargeCat = false,
					ferociousBite = false,
					lacerate = false,
					maim = false,
					mangle = false,
					maul = false,
					pounce = false,
					-- prowl = false,
					rake = false,
					ravage = false,
					rip = false,
					shred = false,
					swipe = false,
					tigersFury = false,
					trackHumanoids = false,
					travelForm = false,
				--Restoration
					abolishPoison = false,
					giftOfTheWild = false,
					markOfTheWild = false,
					lifeBloom = false,
					naturesSwiftness = false,
					rejuvenation = false,
					removeCurse = false,
					swiftmend = false,
					treeForm = false,
					wildGrowth = false,
			--hunter
				--BeastMastery
					aspectOfTheBeast = false,
					aspectOfTheCheetah = false,
					aspectOfTheDragonhawk = false,
					aspectOfTheHawk = false,
					aspectOfTheMonkey = false,
					aspectOfThePack = false,
					aspectOfTheViper = false,
					aspectOfTheWild = false,
					feedPet = false,
					mendPet = false,
				--Marksmanship
					aimedShot = false,
					arcaneShot = false,
					chimeraShot = false,
					concussiveShot = false,
					distractingShot = false,
					-- flare = false,
					huntersMark = false,
					killShot = false,
					multiShot = false,
					-- readiness = false,
					scorpidSting = false,
					serpentSting = false,
					-- silencingshot = false,
					tranquilizingShot = false,
					viperSting = false,
					volley = false,
				--Survival
				disengage = false,
				-- explosiveTrap = false,
				-- feignDeath = false,
				-- freezingArrow = false,
				-- freezingtrap = false,
				-- frostTrap = false,
				-- immolationTrap = false,
				mongooseBite = false,
				raptorStrike = false,
				-- scattershot = false,
				-- snaketrap = false,
				trackHidden = false,
				trackHumanoids = false,
				wyvernSting = false,
				-- Pet
					-- Crab
					petCharge = false,
					petClaw = false,
					-- petPin = false,
					-- Ravager
					petRavage = false,
					petBullheaded = false,
					petBite = false,
					petDash = false,
			--mage
				--arcane
					arcaneBarrage = false,
					arcaneExplosion = false,
					arcaneMissiles = false,
					blink = false,
					manaGem = false,
					-- counterspell = false,
					-- evocation = false,
					invisibility = false,
					-- mirrorImage = false,
					removeCurse = false,
					slow = false,
					-- spellSteal = false,
				--Fire
					blastWave = false,
					dragonsBreath = false,
					fireBlast = false,
					livingBomb = false,
				--Frost
					blizzard =false,
					coldSnap =false,
					coneOfCold =false,
					-- deepFreeze =false,
					frostNova =false,
					iceLance =false,
					-- summonWaterElemental =false,
				--Pet
					petFreeze = false,
			--paladin
				--Holy
					Cleanse = false,
					concentrationAura = false,
					consecration = false,
					divineFavor = false,
					holyShock = false,
					holyWrath = false,
					layOnHands = false,
					purify = false,
				--Protection
					avengersShield = false,
					devotionAura = false,
					fireResistanceAura = false,
					frostResistanceAura = false,
					--hammerOfJustice = false,
					hammerOfTheRighteous = false,
					handOfReckoning = false,
					sealOfJustice = false,
					shadowResistanceAura = false,
					shieldOfRighteousness = false,
				--Retribution
					crusaderAura = false,
					crusaderStrike = false,
					divineStorm = false,
					hammerOfWrath = false,
					judgementOfJustice = false,
					judgementOfLight = false,
					judgementOfWisdom = false,
					-- repentance = false,
					retributionAura = false,
			--priest
				--Discipline
					-- dispel = false, -- NEW
					penance = false, -- NEW
				--Holy
					abolishDisease = false,
					cureDisease = false,
					-- desperatePrayer = false,
					holyNova = false,
					renew = false,
					prayerOfMending = false,
				--Shadow
				devouringPlague = false,
				mindFlay = false,
				mindSear = false,
				-- psychicHorror = false,
				-- psychicScream = false,
				-- shadowWordDeath = false,
				shadowWordPain = false,
				-- shadowFiend = false,
				-- silence = false,
			--rogue
				--Assassination
					ambush = false,
					cheapShot = false,
					deadlyThrow = false,
					-- dismantle = false,
					envenom = false,
					eviscerate = false,
					exposeArmor = false,
					garrote = false,
					kidneyShot = false,
					mutilate = false,
					rupture = false,
				--Combat
					backstab = false,
					fanOfKnive = false,
					-- gouge = false,
					-- kick = false,
					shiv = false,
					sinisterStrike = false,
					-- bladeFlurry = false,
				--Subtlety
					-- blind = false,
					distract = false,
					hemorrage = false,
					premeditation = false,
					-- preparation = false,
					-- sap = false,
					shadowStep = false,
					-- stealth = false,
					-- vanish = false,
			--shaman
				--Elemental
					callOfTheAncestors = false,
					callOfTheElements = false,
					callOfTheSpirits = false,
					earthShock = false,
					-- earthbindTotem = false,
					fireElementalTotem = false,
					fireNova = false,
					flameShock = false,
					frostShock = false,
					magmaTotem = false,
					purge = false,
					searingTotem = false,
					stoneclawTotem = false,
					thunderstorm = false,
					totemOfWrath = false,
					-- windShear = false,
				--Enhancement
					earthElementalTotem = false,
					feralSpirit = false,
					fireResistanceTotem = false,
					flametongueTotem = false,
					frostResistanceTotem = false,
					groundingTotem = false,
					lavaLash = false,
					lightningShield = false,
					natureResistanceTotem = false,
					stoneskinTotem = false,
					stormstrike = false,
					strengthOfTheEarthTotem = false,
					windfuryTotem = false,
					wrathOfTheAirTotem = false,
				--Restoration
					cleanseSpirit = false,
					cleansingTotem = false,
					cureToxins = false,
					healingStreamTotem = false,
					manaSpringTotem = false,
					-- manaTideTotem = false,
					naturesSwiftness = false,
					riptide = false,
					tidalForce = false,
					totemicRecall = false,
					-- tremorTotem = false,
			--warlock
				--Affliction
					corruption = false,
					curseOfAgony = false,
					curseOfDoom = false,
					curseOfExhaustion = false,
					curseOfTheElements = false,
					curseOfTongues = false,
					curseOfWeakness = false,
					-- deathcoil = false,
					drainLife = false,
					drainMana = false,
					drainSoul = false,
					-- howlOfTerror = false,
					lifeTap = false,
				--Demonology
					healthtone = false,
					demonicCircleTeleport = false,
					detectInvisibility = false,
					healthFunnel = false,
					inferno = false,
				--Destruction
					conflagrate = false,
					hellFire = false,
					rainOfFire = false,
					shadowBurn = false,
					shadowFlame = false,
					--shadowFury = false,
				-- Pet
					-- Succube
					-- lesserInvisibility = false,
					-- Felhunter
					-- spellLock = false,
					devourMagic = false,
			--warrior
				--Arms
					battleStance = false,
					charge = false,
					hamstring = false,
					heroicStrike = false,
					heroicThrow = false,
					mockingBlow = false,
					mortalStrike = false,
					overpower = false,
					rend = false,
					thunderClap = false,
				--Fury
					berserkerStance = false,
					bloodthirst = false,
					challengingShout = false,
					cleave = false,
					demoralizingShout = false,
					execute = false,
					heroicFury = false,
					intercept = false,
					intimidatingShout = false,
					piercingHowl = false,
					-- pummel = false,
					slam = false,
					victoryRush = false,
					whirlwind = false,
				--Protection
					bloodRage = false,
					concussionBlow = false,
					defensiveStance = false,
					devastate = false,
					-- disarm = false,
					intervene = false,
					revenge = false,
					-- shieldBash = false,
					shieldSlam = false,
					-- shockwave = false,
					sunderArmor = false,
					taunt = false,
		-- Enemy SPELL_AURA_APPLIED CC (enemyDebuffs)
			Enemyblinded = false,
			Enemysapped = false,
			EnemyPollied = false,
			EnemyCycloned = false,
			EnemyHexxed = false,
		-- Enemy SPELL_AURA_REMOVED CC (enemyDebuffdown)
			blinddown = false,
			sapdown = false,
			polydown = false,
			polydown = false,
			cyclonedown = false,
			hexdown = false,
		-- Friend SPELL_COUNTERED (interruptFriend)
			-- friendcountered = false,
		-- Friend - ENemy SPELL_CASTING_START CC -> Party (friendCCs)
			cyclonefriend = false,
			hexfriend = false,
			polyfriend = false,
			fearfriend = false,
		-- Friend - Enemy SPELL_CASTING_SUCCESS CC -> Party (friendCCSuccess)
			friendfrozen = false,
			blindfriend = false,
			friendfeared = false,
			friendsapped = false,
			friendcycloned = false,
			friendstunned = false,
			friendcountered = false,
			friendhexxed = false,
			friendpoly = false,
			friendpoly = false,
			friendfeared = false,
			friendfeared = false,
			friendfeared = false,
		-- Party SPELL_CASTING_SUCCESS CC -> Enemy (friendCCenemy)
			enemyblinded = false,
			enemysapped = false,
			enemyhexxed = false,
			enemypollied = false,
			enemypollied = false,
			enemycycloned = false,
		-- Enemy SPELL_AURA_REMOVED CC (enemyDebuffdownAP)
			Blinddown = false,
			Sapdown = false,
			Hexdown = false,
			Polydown = false,
			Polydown = false,
			CycloneDown = false,
		-- SELF
			Cyclone = false,
			Hex = false,
			Polymorph = false,
			Fear = false,
			Freezingtrap = false,
			Frosttrap = false,
			scattershot = false,
			Fear3 = false,
			Fear2 = false,
			Blind = false,
			Sap = false,
			Hammerofjustice = false,
			Fear4 = false,
			Deathcoil = false,
			drainMana = false,
			DeepFreeze = false,
			Repentance = false,
			Silencingshot = false,
			Aimedshot = false,
			Strangulate = false,
			Disarm2 = false,
			Markofblood = false,
			wyvernSting = false,
			seduction = false,
	--

		custom = {},
	--debug
	cspell = "",
	}
}