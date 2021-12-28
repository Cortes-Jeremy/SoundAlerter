--[[
SoundAlerter by Trolollolol
If you have any issues or concerns with the addon, Send me an ingame message at  Trolollol - Realm:Sargeras Server:Molten-WoW.com
Bugs: Check auraApplied for strangulate
]]

SoundAlerter = LibStub("AceAddon-3.0"):NewAddon("SoundAlerter", "AceEvent-3.0","AceConsole-3.0","AceTimer-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("SoundAlerter")
local self, SoundAlerter = SoundAlerter, SoundAlerter
local sadb
local playerName = UnitName("player")

--warning to non-english clients
if ((GetLocale() == "zhCN") or (GetLocale() == "zhTW") or (GetLocale() == "koKR") or (GetLocale() == "frFR") or (GetLocale() == "ruRU")) then
DEFAULT_CHAT_FRAME:AddMessage("|cffFF7D0ASoundAlerter|r Currently only works on English and Spanish Clients only, sorry. If you would like to get involved, send a PM to shamwoww on forum.molten-wow.com or send a message to |cff0070DETrolollolol|r - Sargeras - Horde - Molten-WoW.com");
end

SA_LOCALEPATH = {
	enUS = "Interface\\Addons\\SoundAlerter\\Voice\\",
	esES = "Interface\\Addons\\SoundAlerter\\Voice_ES\\",
}
self.SA_LOCALEPATH = SA_LOCALEPATH
local SA_LANGUAGE = {
	["Interface\\Addons\\SoundAlerter\\Voice_ES\\"] = "Spanish (Limited)",
	["Interface\\Addons\\SoundAlerter\\Voice\\"] = "English",
}
self.SA_LANGUAGE = SA_LANGUAGE
local SA_CHATGROUP = {
	["SAY"] = L["Say"],
	["EMOTE"] = L["Emote"],
	["PARTY"] = L["Party"],
	["RAID"] = L["Raid"],
	["BATTLEGROUND"] = L["Battleground"],
}
self.SA_CHATGROUP = SA_CHATGROUP
local SA_EVENT = {
	SPELL_CAST_SUCCESS = L["Instant spell was successfully casted"],
	SPELL_CAST_START = L["Spell is casting"],
	SPELL_AURA_APPLIED = L["Spell buff/debuff applied"],
	SPELL_AURA_REMOVED = L["Spell buff/debuff down"],
	SPELL_INTERRUPT = L["Spell is interrupted"],
	SPELL_SUMMON = L["Summoning spell"],
	SPELL_DAMAGE = L["Spell cast successfully damaged"]
	--UNIT_AURA = "Unit aura changed",
}
self.SA_EVENT = SA_EVENT
local SA_UNIT = {
	any = L["Any"],
	player = L["Player"],
	target = L["Target"],
	focus = L["Focus"],
	mouseover = L["Mouseover"],
	party = L["Party"],
	raid = L["Raid"],
	arena = L["Arena (enemy)"],
--	boss = L["Boss"],
	custom = L["Custom"],
}
self.SA_UNIT = SA_UNIT
local SA_TYPE = {
	[COMBATLOG_FILTER_EVERYTHING] = L["Any"],
	[COMBATLOG_FILTER_FRIENDLY_UNITS] = L["Friendly"],
	[COMBATLOG_FILTER_HOSTILE_PLAYERS] = L["Hostile player"],
	[COMBATLOG_FILTER_HOSTILE_UNITS] = L["Hostile non-player"],
	[COMBATLOG_FILTER_NEUTRAL_UNITS] = L["Neutral"],
	[COMBATLOG_FILTER_ME] = L["Myself"],
	[COMBATLOG_FILTER_MINE] = L["My non-unit object (totem)"],
	[COMBATLOG_FILTER_MY_PET] = L["My pet"],
}
self.SA_TYPE = SA_TYPE
local sourcetype,sourceuid,desttype,destuid = {},{},{},{}
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage("|cFF33FF22SA|r:"..msg) end
function SoundAlerter:OnInitialize()
	if not self.spellList then
		self.spellList = self:GetSpellList()
	end
	for _,v in pairs(self.spellList) do
		for _,spell in pairs(v) do
			if dbDefaults.profile[spell] == nil then dbDefaults.profile[spell] = true end
		end
	end
	self.db1 = LibStub("AceDB-3.0"):New("SoundAlerterDB",dbDefaults, "Default");
	DEFAULT_CHAT_FRAME:AddMessage("|cffFF7D0ASoundAlerter|r by |cff0070DETrolollolol|r - Ragnaros - Molten-WoW.com  - /SOUNDALERTER ");
	self.db1.RegisterCallback(self, "OnProfileChanged", "ChangeProfile")
	self.db1.RegisterCallback(self, "OnProfileCopied", "ChangeProfile")
	self.db1.RegisterCallback(self, "OnProfileReset", "ChangeProfile")
	self:RegisterChatCommand("SoundAlerter", "ShowConfig")
	self:RegisterChatCommand("SALERTER", "ShowConfig")
	self:RegisterChatCommand("sa", "ShowConfig")
	sadb = self.db1.profile
	SoundAlerter.options = {
		name = "SoundAlerter",
		desc = "Voice prompts from enemy used spells",
		type = 'group',
		icon = [[Interface\Icons\Spell_Nature_ForceOfNature]],
		args = {},
	}
	local bliz_options = CopyTable(SoundAlerter.options)
	bliz_options.args.load = {
		name = "Load configuration",
		desc = "Load configuration options",
		type = 'execute',
		func = "ShowConfig",
		handler = SoundAlerter,
	}

	LibStub("AceConfig-3.0"):RegisterOptionsTable("SoundAlerter_bliz", bliz_options)
	AceConfigDialog:AddToBlizOptions("SoundAlerter_bliz", "SoundAlerter")
end

function SoundAlerter:OnEnable()
	SoundAlerter:RegisterEvent("PLAYER_ENTERING_WORLD")
	SoundAlerter:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	SoundAlerter:RegisterEvent("UNIT_AURA")
	if not SA_LANGUAGE[sadb.path] then sadb.path = SA_LOCALEPATH[GetLocale()] end
	self.throttled = {}
	self.smarter = 0
end

GameTooltip:HookScript("OnTooltipSetUnit", function(tip)
	local name, server = tip:GetUnit()
	local Realm = GetRealmName()
	if (SA_sponsors[name] ) then
		if ( SA_sponsors[name]["Realm"] == Realm ) then
			tip:AddLine(SA_sponsors[SA_sponsors[name].Type], 1, 0, 0 )
		end;
	end
end)

function SoundAlerter:PlayTrinket()
	if (sadb.combatText and IsAddOnLoaded("Blizzard_CombatText")) then
		CombatText_AddMessage("TrinketUsed",CombatText_StandardScroll, 0,1,1,nil,false)
	else
		PlaySoundFile(sadb.sapath.."Trinket.mp3");
	end
end

function SoundAlerter:Interrupted()
	if (sadb.combatText and IsAddOnLoaded("Blizzard_CombatText")) then
		CombatText_AddMessage("Interrupted",CombatText_StandardScroll, 0,1,1,nil,false)
	else
		PlaySoundFile(sadb.sapath.."Interrupted.mp3");
	end
end

function SoundAlerter:spellOptions(order, spellID, ...)
	local spellname,_,icon = GetSpellInfo(spellID)
	if spellname ~= nil then
		return {
			type = 'toggle',
			name = "\124T"..icon..":24\124t"..spellname,
			desc = function ()
				GameTooltip:SetHyperlink(GetSpellLink(spellID));
			end,
			descStyle = "custom",
			order = order,
		}
	else
		self:Print("<SA>: Error loading spell ID " ..spellID .. " as it seems to not exist (anymore). Check if you have the correct version of SoundAlerter")
	end
end

function SoundAlerter:ArenaClass(id)
	for i = 1 , 5 do
		if id == UnitGUID("arena"..i) then
			return select(2, UnitClass ("arena"..i))
		end
	end
end

function SoundAlerter:PLAYER_ENTERING_WORLD()
	CombatLogClearEntries()
end

function SoundAlerter:PlaySpell(list, spellID, ...)
	if list[spellID] then
		if not sadb[list[spellID]] then return end
		if sadb.debugmode then print("<SA> DEBUG: Playing sound file: "..list[spellID]..".mp3"); end
		if (sadb.combatText and IsAddOnLoaded("Blizzard_CombatText")) then
			CombatText_AddMessage(""..list[spellID].."",CombatText_StandardScroll, 0,1,1,nil,false)
		else
			PlaySoundFile(sadb.sapath..list[spellID]..".mp3");
		end
	end
end

function SoundAlerter:COMBAT_LOG_EVENT_UNFILTERED(event , ...)
	--todo: divine shield+trinket chat alerts
	local _,currentZoneType = IsInInstance()
	local pvpType, isFFA, faction = GetZonePVPInfo();
	if (not ((pvpType == "contested" and sadb.field) or (pvpType == "hostile" and sadb.field) or (pvpType == "friendly" and sadb.field) or (currentZoneType == "pvp" and sadb.battleground) or (((currentZoneType == "arena") or (pvpType == "arena")) and sadb.arena) or sadb.all)) then
		return
	end
	local timestamp,event,sourceGUID,sourceName,sourceFlags,destGUID,destName,destFlags,spellID,spellName= select ( 1 , ... );
	local toSelf,toEnemy,fromEnemy,toTarget,fromFocus = false, false, false, false, false
	local focusTarget = UnitName("focustarget")
	local enemyTarget2 = UnitName("targettarget")
	local myTarget = UnitName("target")
	local myFocus = UnitName("focus")
	if (destFlags) then
		for k in pairs(SA_TYPE) do
			desttype[k] = CombatLog_Object_IsA(destFlags,k)
		end
	else
		for k in pairs(SA_TYPE) do
			desttype[k] = nil
		end
	end
	if (destGUID) then
		for k in pairs(SA_UNIT) do
			if k == "party" then
				if UnitName("party1") ~= nil then --because UnitInParty always returns true?
					for i = 1, MAX_PARTY_MEMBERS do
						if destGUID == UnitGUID(k..i) then
						destuid[k] = (UnitGUID(k..i) == destGUID)
						break
						end
					end
				end
			elseif k == "raid" then
				if UnitName("raid1") ~= nil then --because UnitInParty always returns true?
					for i = 1, MAX_RAID_MEMBERS do
						if destGUID == UnitGUID(k..i) then
						destuid[k] = (UnitGUID(k..i) == destGUID)
						break
						end
					end
				end
			elseif k == "arena" then
				if currentZoneType == "arena" then
					for i = 1 , 5 do
						if destGUID == UnitGUID(k..i) then
						destuid[k] = (UnitGUID(k..i) == destGUID)
						break
						end
					end
				end
			else
			destuid[k] = (UnitGUID(k) == destGUID)
			end
			--	log("destuid:"..k.."="..(destuid[k] and "true" or "false"))
		end
	else
		for k in pairs(SA_UNIT) do
			destuid[k] = nil
			--	log("destuid:"..k.."="..(destuid[k] and "true" or "false"))
		end
	end
	destuid.any = true
	if (sourceFlags) then
		for k in pairs(SA_TYPE) do
			sourcetype[k] = CombatLog_Object_IsA(sourceFlags,k)
			--log("sourcetype:"..k.."="..(sourcetype[k] or "nil"))
		end
	else
		for k in pairs(SA_TYPE) do
			sourcetype[k] = nil
			--log("sourcetype:"..k.."="..(sourcetype[k] or "nil"))
		end
	end
	if (sourceGUID) then
		for k in pairs(SA_UNIT) do
			if k == "party" then
				if UnitName("party1") ~= nil then
					for i = 1, MAX_PARTY_MEMBERS do
						if sourceGUID == UnitGUID(k..i) then
						sourceuid[k] = (UnitGUID(k..i) == sourceGUID)
						break
						end
					end
				end
			elseif k == "raid" then
				if UnitName("raid1") ~= nil then --because UnitInParty always returns true?
					for i = 1, MAX_RAID_MEMBERS do
						if destGUID == UnitGUID(k..i) then
						destuid[k] = (UnitGUID(k..i) == destGUID)
						break
						end
					end
				end
			elseif k == "arena" then
				if currentZoneType == "arena" then
					for i = 1 , 5 do
						if sourceGUID == UnitGUID(k..i) then
							sourceuid[k] = (UnitGUID(k..i) == sourceGUID)
							break
						end
					end
				end
			else
				sourceuid[k] = (UnitGUID(k) == sourceGUID)
			end
			--log("sourceuid:"..k.."="..(sourceuid[k] and "true" or "false"))
		end
	else
		for k in pairs(SA_UNIT) do
			sourceuid[k] = nil
			--log("sourceuid:"..k.."="..(sourceuid[k] and "true" or "false"))
		end
	end
	sourceuid.any = true

	if sadb.debugmode and sadb.spelldebug then
		print(spellName,spellID,event,sourceName,destName)
	end
	if sadb.debugmode and spellName == sadb.csname and spellName then
		print("Custom spell name: "..spellName,spellID,event,sourceName,destName)
	end
	--Special conditions (freezing trap)
	if desttype[COMBATLOG_FILTER_HOSTILE_PLAYERS] and event == "SPELL_CREATE" and (spellID == 13809 or spellID == 13810 or spellID == 1499) and ((sadb.myself and (destuid.target or destuid.focus)) or sadb.enemyinrange) then
		self:PlaySpell (self.spellList.castSuccess,spellID)
	end
	if (event == "SPELL_AURA_APPLIED") then
		if desttype[COMBATLOG_FILTER_HOSTILE_PLAYERS] then
			if sourcetype[COMBATLOG_FILTER_ME] then --my spells against enemy
				if not sadb.enemydebuff then
				self:PlaySpell(self.spellList.enemyDebuffs,spellID)
				end
					if not sadb.chatalerts then
						if (((spellID == 6770 or spellID == 11297 or spellID == 51724) and sadb.sapenemy) or (spellID == 2094 and sadb.blindenemy) or (spellID == 33786 and sadb.cycloneenemy) or (spellID == 51514 and sadb.hexenemy) or (spellID == 5782 and sadb.fearenemy)) then
							local ccenemychat = gsub(sadb.enemychat, "(#spell#)", GetSpellLink(spellID))
							SendChatMessage(gsub(ccenemychat, "(#enemy#)", destName), sadb.chatgroup, nil, nil)
						end
					end
			elseif (sourcetype[COMBATLOG_FILTER_FRIENDLY_UNITS] and (destuid.target or destuid.focus) and not sadb.dArenaPartner) then
				self:PlaySpell(self.spellList.friendCCenemy,spellID)
			elseif ((sadb.myself and (destuid.target or destuid.focus)) or sadb.enemyinrange) and not sadb.castSuccess then
				self:PlaySpell(self.spellList.auraApplied,spellID)	--check hand of freedom
			end
		elseif desttype[COMBATLOG_FILTER_ME] then --spells applied to myself
					if not sadb.chatalerts then --todo: get localized table of spell names to compare instead/css custom chat alerts
						if sourcetype[COMBATLOG_FILTER_HOSTILE_PLAYERS] or ((spellID == 6770 or spellID == 11297 or spellID == 51724) and sadb.sapselffriend) then
							if ((spellID == 51514 and sadb.hexselffriend) or
								(spellID == 33786 and sadb.cycloneselffriend) or
								((spellID == 6215 or spellID == 17928 or spellID == 5484) and sadb.fearselffriend) or
								((spellID == 12826 or spellID == 118 or spellID == 28271 or spellID == 28272) and sadb.polyenemy) or
								(spellID == 2094 and sadb.blindselffriend)) then
									local form1 = gsub(sadb.selfchat, "(#spell#)", GetSpellLink(spellID))
									local form2 = gsub(form1, "(#target#)", "me")
									SendChatMessage(gsub(form2, "(#enemy#)", sourceName), sadb.chatgroup, nil, nil)
							elseif (spellID == 6770 or spellID == 11297 or spellID == 51724) and sadb.sapselffriend then
									SendChatMessage(gsub(sadb.sapselftext, "(#spell#)", GetSpellLink(spellID)), sadb.chatgroup, nil, nil)
							end
						end
					end
					if not sourceuid.target and not sourceuid.focus and not sadb.dselfDebuff then
						self:PlaySpell(self.spellList.selfDebuff,spellID) --debuffs on self, if source is enemy or spell is sap?
					end
		elseif desttype[COMBATLOG_FILTER_FRIENDLY_UNITS] then
				--chat alerts, enemy casted a spell on friend
				if (not sadb.chatalerts and not desttype[COMBATLOG_FILTER_ME] and (destuid.target or destuid.focus or (currentZoneType == "arena" or pvpType == "arena"))) then
					if (spellID == 6770 or spellID == 11297 or spellID == 51724) and sadb.sapselffriend then --this worked by default, everything below didn't / replacing "(#friend#)" with destName did nothing either
						local sapfriendtext = gsub(sadb.sapfriendtext, "(#spell#)", GetSpellLink(spellID))
						SendChatMessage(gsub(sapfriendtext, "(#friend#)", destName), sadb.chatgroup, nil, nil)
					elseif ((spellID == 51514 and sadb.hexselffriend) or
						(spellID == 642 and sadb.bubbleselffriend) or
						(spellID == 33786 and sadb.cycloneselffriend) or
						((spellID == 6215 or spellID == 17928 or spellID == 5484) and sadb.fearselffriend) or
						((spellID == 12826 or spellID == 118 or spellID == 28271 or spellID == 28272) and sadb.polyenemy) or
						(spellID == 2094 and sadb.blindselffriend)) then
							local form1 = gsub(sadb.friendchat, "(#spell#)", GetSpellLink(spellID))
							local form2 = gsub(form1, "(#friend#)", destName)
							SendChatMessage(gsub(form2, "(#enemy#)", sourceName), sadb.chatgroup, nil, nil)
					end
				end
		end
	elseif (event == "SPELL_AURA_REMOVED" and desttype[COMBATLOG_FILTER_HOSTILE_PLAYERS] and ((sourcetype[COMBATLOG_FILTER_ME] or (destuid.target or destuid.focus)))) then
		if sourcetype[COMBATLOG_FILTER_FRIENDLY_UNITS] and ((destuid.target or (currentZoneType == "arena" or pvpType == "arena")) and not sadb.dArenaPartner) then
			self:PlaySpell (self.spellList.enemyDebuffdownAP,spellID)
		elseif sourcetype[COMBATLOG_FILTER_ME] and not sadb.dEnemyDebuffDown then
			self:PlaySpell (self.spellList.enemyDebuffdown,spellID)
		elseif sourcetype[COMBATLOG_FILTER_HOSTILE_PLAYERS] and not sadb.auraRemoved then
			self:PlaySpell (self.spellList.auraRemoved,spellID)
		end
			if (not sadb.chatalerts and ((sourcetype[COMBATLOG_FILTER_ME] and sadb.chatdownself) or ((not sadb.caonlyTF or destuid.target or destuid.focus) and sadb.chatdownfriend))) then
					if ((spellID == 33786 and sadb.cycloneenemy) or
						(spellID == 51514 and sadb.hexenemy) or
						(spellID == 2094 and sadb.blindenemy) or
						((spellID == 6770 or spellID == 11297 or spellID == 51724) and sadb.sapenemy) or
						((spellID == 12826 or spellID == 118 or spellID == 28271 or spellID == 28272) and sadb.polyenemy) or
						((spellID == 6215 or spellID == 5484 or spellID == 17928) and sadb.fearenemy)) then
							SendChatMessage(GetSpellLink(spellID).." down on "..destName, sadb.chatgroup, nil, nil)
					end
			end
	elseif (event == "SPELL_CAST_SUCCESS") then
		if sourcetype[COMBATLOG_FILTER_HOSTILE_PLAYERS] then
			if (not sadb.chatalerts) then
					if ((sadb.vanishenemy and spellID == 26889) or (sadb.stealthenemy and spellID == 1784)) and ((sourceuid.target or sourceuid.focus) or ((sadb.vanishTF and spellID == 26889) or (sadb.stealthTF and spellID == 1784))) then
						SendChatMessage(gsub(gsub(sadb.enemychat,"(#spell#)", GetSpellLink(spellID)),"(#enemy#)", sourceName),sadb.chatgroup,nil,nil)
					end
			end
			if ((spellID == 42292 or spellID == 59752) and sadb.trinket) then
				if ((currentZoneType == "arena" or pvpType == "arena") or (sourceuid.target or sourceuid.focus)) then
					if (self:ArenaClass(sourceGUID) and sadb.class) then
						local c = self:ArenaClass(sourceGUID) -- missing, get Class that have trinketed
						PlaySoundFile(sadb.sapath..c..".mp3"); -- custom new Sound for trinket (non destructive, so added new path)
						--PlaySoundFile(sadb.sapath..c..".mp3");
						--self:ScheduleTimer("PlayTrinket", 0.4); -- new class sound already have it
					else
						self:PlayTrinket()
					end
				end
			elseif ((sadb.myself and (sourceuid.target or sourceuid.focus)) or sadb.enemyinrange) and not sadb.castSuccess then
				if not (sadb.enemyinrange and (spellID == 2825 or spellID == 32182)) then --make sure not bloodlust/hero
					self:PlaySpell (self.spellList.castSuccess,spellID)
				elseif (sourceuid.target or sourceuid.focus) then
					self:PlaySpell(self.spellList.castSuccess,spellID)	--bloodlust/heroism must be on target/focus in order to not spam
				end
			end
		elseif (desttype[COMBATLOG_FILTER_FRIENDLY_UNITS] and not desttype[COMBATLOG_FILTER_ME] and ((destuid.target or destuid.focus) or (currentZoneType == "arena" or pvpType == "arena")) and not sadb.dArenaPartner) then
				self:PlaySpell (self.spellList.friendCCSuccess,spellID) --friend gets cc'd in arena or if target/focus
		end
	elseif (event == "SPELL_INTERRUPT") then
		if (desttype[COMBATLOG_FILTER_ME] or sourcetype[COMBATLOG_FILTER_ME] and not sadb.interrupt) then
			if (sadb.combatText and IsAddOnLoaded("Blizzard_CombatText")) then
				CombatText_AddMessage("Counter",CombatText_StandardScroll, 0,1,1,nil,false)
			else
				PlaySoundFile(sadb.sapath.."lockout.mp3");
			end
			if (not sadb.chatalerts) then
				if (sadb.interruptenemy and sourcetype[COMBATLOG_FILTER_ME]) then
					local it = gsub(sadb.InterruptEnemyText, "(#spell#)", GetSpellLink(spellID))
					SendChatMessage(gsub(it, "(#enemy#)", destName), sadb.chatgroup, nil, nil)
				elseif (sadb.interruptself and desttype[COMBATLOG_FILTER_ME]) then
					local it = gsub(sadb.InterruptSelfText, "(#spell#)", GetSpellLink(spellID))
					SendChatMessage(gsub(it, "(#enemy#)", sourceName), sadb.chatgroup, nil, nil)
				end
			end
		end
	elseif (event == "SPELL_CAST_START") then
		if sourcetype[COMBATLOG_FILTER_HOSTILE_PLAYERS] then
			if not sadb.castStart and (sadb.myself and (sourceuid.target or sourceuid.focus) or sadb.enemyinrange) then
				self:PlaySpell (self.spellList.castStart,spellID)
			elseif ((currentZoneType == "arena") or (pvpType == "arena")) and not sadb.dArenaPartner then
				for i = 1, 6 do
					if i == 6 then
						self:PlaySpell(self.spellList.friendCCs,spellID)
						break
					elseif playerName == UnitName("arena"..i.."target") then
						self:PlaySpell(self.spellList.castStart,spellID)
						break
					end
				end
			end
		end
	end
	for k,css in pairs (sadb.custom) do
		if css.destuidfilter == "custom" and destName == css.destcustomname then
			destuid.custom = true
		else
			destuid.custom = false
		end
		if css.sourceuidfilter == "custom" and sourceName == css.sourcecustomname then
			sourceuid.custom = true
		else
			sourceuid.custom = false
		end--custom sound alert
		if sadb.debugmode and css.name == sadb.cspell and (spellID == tonumber(css.spellid) or (css.acceptSpellName and (css.spellname == spellName))) then
			log(css.name..": event: "..(css.eventtype[event] and "true" or "false")..", actual event: "..event..", dest spell: "..(destuid[css.destuidfilter] and "true" or "false")..", dest type: "..(desttype[css.desttypefilter] and "true" or "false")..", sourceunit: "..(sourceuid[css.sourceuidfilter] and "true" or "false")..", source type: "..(sourcetype[css.sourcetypefilter] and "true" or "false"))
		end
		if css.eventtype[event] and destuid[css.destuidfilter] and desttype[css.desttypefilter] and sourceuid[css.sourceuidfilter] and sourcetype[css.sourcetypefilter] and (spellID == tonumber(css.spellid) or (css.acceptSpellName and (css.spellname == spellName))) then
				if sadb.debugmode then
				self:Print("playing css "..css.name)
				end
			if not css.chatAlert then
				PlaySoundFile("Interface\\Addons\\SoundAlerter\\CustomSounds\\"..css.soundfilepath,"Master")
			else
				local spell = gsub(css.chatalerttext, "(#spell#)", GetSpellLink(spellID))
				if destuid[css.destuidfilter] or desttype[css.desttypefilter] then
					if event == "SPELL_CAST_START" then
						SendChatMessage(gsub(spell, "(#enemy#)", ""), sadb.chatgroup, nil, nil)
					else
						SendChatMessage(gsub(spell, "(#enemy#)", destName), sadb.chatgroup, nil, nil)
					end
				elseif sourceuid[css.sourceuidfilter] or sourcetype[css.sourcetypefilter] then
					if event == "SPELL_CAST_START" then
						SendChatMessage(gsub(spell, "(#enemy#)", ""), sadb.chatgroup, nil, nil)
					else
						SendChatMessage(gsub(spell, "(#enemy#)", sourceName), sadb.chatgroup, nil, nil)
					end
				end
			end
		end
	end
end

--Drink Spell in Arenas
local DRINK_SPELL = GetSpellInfo(57073)
function SoundAlerter:UNIT_AURA(event,uid)
	if ((currentZoneType == "arena") or (pvpType == "arena")) and sadb.drinking then
		if UnitAura(uid,DRINK_SPELL) then
			PlaySoundFile(sadb.sapath.."drinking.mp3");
		end
	end
end