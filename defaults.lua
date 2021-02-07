dbDefaults = {
	profile = {
	--general
		all = false,
		arena = true,
		battleground = true,
		field = true,
		myself = true,
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
		sapenemy = true,
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
		aruaApplied = false,
		aruaRemoved = false,
		castStart = false,
		castSuccess = false,
		interrupt = false,
	--spells
		sapenemy = true,
		ArenaPartner = false,
		enemyinrange = false,
		sayspell = true,
		enemyinterrupts = true,
	--Disabled Spells at default
		PresenceofMind = false,
		Starfire = false,
		lavaburst = false,
		custom = {},
	--debug
	cspell = "",
	}
}