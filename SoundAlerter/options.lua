local sadb
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("SoundAlerter")
local self, SoundAlerter = SoundAlerter, SoundAlerter

local function initOptions()
	if SoundAlerter.options.args.general then
		return
	end
	SoundAlerter:OnOptionsCreate()
	for k, v in SoundAlerter:IterateModules() do
		if type(v.OnOptionsCreate) == "function" then
			v:OnOptionsCreate()
		end
	end
	AceConfig:RegisterOptionsTable("SoundAlerter", SoundAlerter.options)
end
function SoundAlerter:ShowConfig()
	initOptions()
	AceConfigDialog:Open("SoundAlerter")
end

function SoundAlerter:ChangeProfile()
	sadb = self.db1.profile
	for k,v in SoundAlerter:IterateModules() do
		if type(v.ChangeProfile) == 'function' then
			v:ChangeProfile()
		end
	end
end
function SoundAlerter:AddOption(key, table)
	self.options.args[key] = table
end

local function setOption(info, value)
	local name = info[#info]
	sadb[name] = value
	--print(sadb.sapath..name..".mp3")
	PlaySoundFile(sadb.sapath..name..".mp3");
end
local function getOption(info)
	local name = info[#info]
	return sadb[name]
end

 function listOption(spellList, listType, ...)
	local args = {}
	for k,v in pairs(spellList) do
		if SoundAlerter.spellList[listType][v] then
			rawset(args, SoundAlerter.spellList[listType][v], self:spellOptions(k, v))
		else
			print(v)
		end
	end
	return args
end

function SpellTexture(sid)
	local spellname,_,icon = GetSpellInfo(sid)
	if spellname ~= nil then
		return "\124T"..icon..":24\124t"
	end
end
function SpellTextureName(sid)
	local spellname,_,icon = GetSpellInfo(sid)
	if spellname ~= nil then
		return "\124T"..icon..":24\124t"..spellname
	end
end

function SoundAlerter:OnOptionsCreate()
	sadb = self.db1.profile
	self:AddOption("profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db1))
	self.options.args.profiles.order = -1
	self:AddOption('General', {
		type = 'group',
		name = "General",
		desc = "General Options",
		order = 1,
		args = {
			enableArea = {
				type = 'group',
				inline = true,
				name = "General options",
				set = setOption,
				get = getOption,
				args = {
					all = {
						type = 'toggle',
						name = "Enable Everything",
						desc = "Enables Sound Alerter for BGs, world and arena",
						order = 1,
					},
					arena = {
						type = 'toggle',
						name = "Arena",
						desc = "Enabled in the arena",
						disabled = function() return sadb.all end,
						order = 2,
					},
					battleground = {
						type = 'toggle',
						name = "Battleground",
						desc = "Enable Battleground",
						disabled = function() return sadb.all end,
						order = 3,
					},
					field = {
						type = 'toggle',
						name = "World",
						desc = "Enabled outside Battlegrounds and arenas",
						disabled = function() return sadb.all end,
						order = 4,
					},
					AlertConditions = {
						type = 'group',
						inline = true,
						order = 9,
						name = "Alert Conditions",
						args = {
							myself = {
								type = 'toggle',
								name = L["Target and Focus only"],
								disabled = function() return sadb.enemyinrange end,
								desc = "Alert works only when your current target casts a spell, or an enemy casts a spell on you",
								order = 5,
							},
							enemyinrange = {
								type = 'toggle',
								name = "All Enemies in Range",
								desc = "Alerts are enabled for all enemies in range",
								disabled = function() return sadb.myself end,
								order = 6,
							},
						},
					},
					volumecontrol = {
						type = 'group',
						inline = true,
						order = 10,
						name = "Volume Control",
						args = {
							volumn = {
								type = 'range',
								max = 1,
								min = 0,
								isPercent = true,
								step = 0.1,
								name = "Master Volume",
								desc = "Sets the master volume so sound alerts can be louder/softer",
								set = function (info, value) SetCVar ("Sound_MasterVolume",tostring (value)) end,
								get = function () return tonumber (GetCVar ("Sound_MasterVolume")) end,
								order = 1,
							},
							volumn2 = {
								type = 'execute',
								width = 'normal',
								name = "Addon sounds only",
								desc = "Sets other sounds to minimum, only hearing the addon sounds",
								func = function()
										SetCVar ("Sound_AmbienceVolume",tostring ("0")); SetCVar ("Sound_SFXVolume",tostring ("0")); SetCVar ("Sound_MusicVolume",tostring ("0"));
										print("|cffFF7D0ASoundAlerter|r: Addons will only be heard by your Client. To undo this, click the 'reset sound options' button.");
									end,
								order = 2,
							},
							volumn3 = {
								type = 'execute',
								width = 'normal',
								name = "Reset volume options",
								desc = "Resets sound options",
								func = function()
										SetCVar ("Sound_MasterVolume",tostring ("1")); SetCVar ("Sound_AmbienceVolume",tostring ("1")); SetCVar ("Sound_SFXVolume",tostring ("1")); SetCVar ("Sound_MusicVolume",tostring ("1"));
										print("|cffFF7D0ASoundAlerter|r: Sound options reset.");
									end,
								order = 3,
							},
							sapath = {
								type = 'select',
								name = "Language",
								desc = "Language of Sounds",
								values = self.SA_LANGUAGE,
								order = 3,
							},
							combatText = {
								type = 'toggle',
								name = "Combat Text Only",
								desc = "Disable sounds and use combat text instead",
								order = 4,
							}
						},
					},
					advance = {
						type = 'group',
						inline = true,
						name = L["Advanced options"],
						order = 11,
						args = {
							debugmode = {
								type = 'toggle',
								name = "Debug Mode",
								desc = "Enable Debugging",
								order = 3,
							},
						},
					},
					debugopts = {
						type = 'group',
						inline = true,
						order = 11,
						hidden = function() return not sadb.debugmode end,
						name = "Debug options",
						args = {
							cspell = {
							type = 'input',
							name = "Custom spells entry name",
							order = 1,
							},
							spelldebug = {
								type = 'toggle',
								name = "Spell ID output debugging",
								order = 2,
							},
							csname = {
								type = 'input',
								name = "Spell name",
								order = 2,
							},
						},
					},
					importexport = {
						type = 'group',
						inline = true,
						hidden = function() return not sadb.debugmode end,
						name = "Import/Export",
						desc = "Import or export custom sound alerts",
						order = 12,
						args = {
							import = {
								type = 'execute',
								name = "Import custom sound alerts",
								order = 1,
								confirm = true,
								confirmText = "Are you sure? This will remove all of your current sound alerts",
								func = function()
										sadb.custom = nil
								end,
							},
							export = {
								type = 'execute',
								name = "Export encapsulation",
								order = 2,
								func = function()
								local thisw = "@"
										for k,css in pairs (sadb.custom) do
											 thisw = thisw.."|"..css.name..","..css.soundfilepath..","..(css.spellid and css.spellid or "0")..","
												for j,l in pairs (sadb.custom[k].eventtype) do
													thisw = thisw..j..","..tostring(l)..","
												end
										end
										sadb.exportbox = thisw.."#"
								end,
							},
							exportbox = {
								type = 'input',
								name = "Export custom sound alerts",
								order = 3,
							},
						},
					}
				},
			},
		}
	})
	self:AddOption('Spells', {
		type = 'group',
		name = "Spells",
		desc = "Spell Options",
		order = 2,
		args = {
			-- INLINE - checkbox to enable / disable spells alerter
			spellGeneral = {
				type = 'group',
				name = "Spell Disables",
				desc = "Enable certain spell types",
				inline = true,
				set = setOption,
				get = getOption,
				order = 0,
				args = {
					chatalerts = {
						type = 'toggle',
						name = "Disable Chat Alerts",
						desc = "Disbles Chat notifications of special abilities in the chat bar",
						order = 1,
					},
					interrupt = {
						type = 'toggle',
						name = "Disable Interrupted Spells",
						desc = "Check this option to disable notifications of friendly interrupted spells",
						order = 2,
					},
					auraApplied = {
						type = 'toggle',
						name = "Disable buff applied",
						desc = "Disables sound notifications of buffs applied",
						order = 3,
					},
					auraRemoved = {
						type = 'toggle',
						name = "Disable Buff down",
						desc = "Disables sound notifications of buffs down",
						order = 4,
					},
					castStart = {
						type = 'toggle',
						name = "Disable spell casting",
						desc = "Disables spell casting notifications",
						order = 5,
					},
					castSuccess = {
						type = 'toggle',
						name = "Disable enemy cooldown abilities",
						desc = "Disbles sound notifications of cooldown abilities",
						order = 6,
					},
					dEnemyDebuff = {
						type = 'toggle',
						name = "Disable Enemy Debuff alerts",
						desc = "Check this option to disable notifications of enemy debuff/CC alerts",
						order = 7,
					},
					dEnemyDebuffDown = {
						type = 'toggle',
						name = "Disable Enemy Debuff down alerts",
						desc = "Check this option to disable notifications of enemy debuff/CC alerts",
						order = 8,
					},
					dArenaPartner = {
						type = 'toggle',
						name = "Disable Arena Partner CC alerts",
						desc = "Check this option to disable notifications of Arena Partner debuff/CC alerts",
						order = 9,
					},
					dSelfDebuff = {
						type = 'toggle',
						name = "Disable Self Debuff alerts",
						desc = "Check this option to disable notifications of self debuff/CC alerts",
						order = 10,
					},
				},
			},
			-- INLINE - Buttons for fast navigation
			inlineCategories = {
				type = 'group',
				name = "",
				inline = true,
				order = 1,
				args = {
					btnChatAlerter = {
						type = 'execute',
						name = "Chat Alerter",
						order = 10,
						width = "full",
						disabled = function() return sadb.chatalerts end,
						hidden = function() return sadb.chatalerts end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "chatalerter") end,
					},
					btnAura = {
						type = 'execute',
						name = "Enemy Aura",
						order = 11,
						width = "full",
						disabled = function() return sadb.auraApplied end,
						hidden = function() return sadb.auraApplied end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied") end,
					},
					btnAuraDown = {
						type = 'execute',
						name = "Enemy Aura Down",
						order = 12,
						width = "full",
						disabled = function() return sadb.auraRemoved end,
						hidden = function() return sadb.auraRemoved end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved") end,
					},
					btnCastStart = {
						type = 'execute',
						name = "Enemy Casting Start",
						order = 13,
						width = "full",
						disabled = function() return sadb.castStart end,
						hidden = function() return sadb.castStart end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart") end,
					},
					btnCastSucc = {
						type = 'execute',
						name = "Enemy Casting Success",
						order = 14,
						width = "full",
						disabled = function() return sadb.castSuccess end,
						hidden = function() return sadb.castSuccess end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess") end,
					},
					btnEnemyDebuff = {
						type = 'execute',
						name = "Enemy Debuff",
						order = 15,
						width = "full",
						disabled = function() return sadb.dEnemyDebuff end,
						hidden = function() return sadb.dEnemyDebuff end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "enemydebuff") end,
					},
					btnEnemyDebuffDown = {
						type = 'execute',
						name = "Enemy Debuff Down",
						order = 16,
						width = "full",
						disabled = function() return sadb.dEnemyDebuffDown end,
						hidden = function() return sadb.dEnemyDebuffDown end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "enemydebuffdown") end,
					},
					btnFriendDebuff = {
						type = 'execute',
						name = "Friend Debuff",
						order = 17,
						width = "full",
						disabled = function() return sadb.dArenaPartner end,
						hidden = function() return sadb.dArenaPartner end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "FriendDebuff") end,
					},
					btnFriendDebuffSuccess= {
						type = 'execute',
						name = "Friend Debuff Success",
						order = 18,
						width = "full",
						disabled = function() return sadb.dArenaPartner end,
						hidden = function() return sadb.dArenaPartner end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "FriendDebuffSuccess") end,
					},
					btnselfDebuffs = {
						type = 'execute',
						name = "self Debuffs",
						order = 19,
						width = "full",
						disabled = function() return sadb.dSelfDebuff end,
						hidden = function() return sadb.dSelfDebuff end,
						func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "selfDebuffs") end,
					},
				},
			},
			--
			spellauraApplied = {
				type = 'group',
				name = "Enemy Aura",
				desc = "Alerts you when your enemy gains an aura, or uses a cooldown",
				set = setOption,
				get = getOption,
				disabled = function() return sadb.auraApplied end,
				order = 2,
				args = {
					inlineCategories = {
						type = 'group',
						inline = true,
						name = "",
						order = 0,
						args = {
							btnGen = {
								type = 'execute',
								name = "General spells",
								order = 8,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "general") end,
							},
							btnRaces = {
								type = 'execute',
								name = "General races",
								order = 9,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "races") end,
							},
							btnDK = {
								type = 'execute',
								name = "Death Knight",
								order = 10,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "dk") end,
							},
							btnDruid = {
								type = 'execute',
								name = "Druid",
								order = 11,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "druid") end,
							},
							btnHunt = {
								type = 'execute',
								name = "Hunter",
								order = 12,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "hunter") end,
							},
							btnMage = {
								type = 'execute',
								name = "Mage",
								order = 13,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "mage") end,
							},
							btnPaladin = {
								type = 'execute',
								name = "Paladin",
								order = 14,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "paladin") end,
							},
							btnPriest = {
								type = 'execute',
								name = "Priest",
								order = 15,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "priest") end,
							},
							btnRogue = {
								type = 'execute',
								name = "Rogue",
								order = 16,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "rogue") end,
							},
							btnShaman = {
								type = 'execute',
								name = "Shaman",
								order = 17,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "shaman") end,
							},
							btnWarlock = {
								type = 'execute',
								name = "Warlock",
								order = 18,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "warlock") end,
							},
							btnWarrior = {
								type = 'execute',
								name = "Warrior",
								order = 19,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellauraApplied", "warrior") end,
							},
						},
					},

					general = {
						type = 'group',
						name = "General spells",
						order = 1,
						args = {
							class = {
								type = 'toggle',
								name = "Alert Class calling for trinketting in Arena",
								desc = "Alert when an enemy class trinkets in arena",
								confirm = function() PlaySoundFile(sadb.sapath.."paladin.mp3"); end,
								order = 1,
							},
							drinking = {
								type = 'toggle',
								name = "Alert Drinking in Arena",
								desc = "Alert when an enemy drinks in arena",
								order = 2,
							},
							trinket = {
								type = 'toggle',
								name = SpellTexture(42292).."PvP Trinket/Every Man for Himself",
								desc = function ()
									GameTooltip:SetHyperlink(GetSpellLink(42292));
								end,
								descStyle = "custom",
								order = 3,
							},
							objects	= {
								type = 'group',
								inline = true,
								name= "Objects",
								order = 5,
								args = listOption({54861,54758},"auraApplied"),
							},
						}
					},
					races = {
						type = 'group',
						name = "|cffFFFFFFGeneral races|r",
						order = 4,
						args = listOption({58984,26297,20594,33702,7744,28880},"auraApplied"),
					},

					dk	= {
						type = 'group',
						name = "|cffC41F3BDeath Knight|r",
						order = 10,
						args = {
							dkBlood	= {
								type = 'group',
								inline = true,
								name= SpellTexture(48266).." |cffC41F3BBlood|r",
								order = 5,
								args = listOption({45529,49028,49016,55233},"auraApplied"),
							},

							spacerFrost = {
								order = 6,
								type = "description",
								name = " "
							},
							dkFrost	= {
								type = 'group',
								inline = true,
								name= SpellTexture(48263).."|cffC41F3B Frost |r",
								order = 10,
								args = listOption({57623,48792,49039,51271},"auraApplied"),
							},

							spacerUH = {
								order = 11,
								type = "description",
								name = " "
							},
							dkUnholy = {
								type = 'group',
								inline = true,
								name= SpellTexture(48265).."|cffC41F3B Unholy |r",
								order = 15,
								args = listOption({48707,51052,49222},"auraApplied"),
							},

						}
					},
					druid = {
						order = 11,
						type = 'group',
						name = "|cffFF7D0ADruid|r",
						args = {
							druidBalance= {
								type = 'group',
								inline = true,
								name = SpellTexture(48463).." |cffFF7D0ABalance|r",
								order = 1,
								args = listOption({16870,22812,29166,53312,53201,53307},"auraApplied"),
							},

							spacerFeral = {
								order = 5,
								type = "description",
								name = " "
							},
							druidFeral = {
								type = 'group',
								inline = true,
								name = SpellTexture(9634).." |cffFF7D0AFeral Combat|r",
								order = 6,
								args = listOption({50334,33357,5229,22842,52610,61336,69369},"auraApplied"),
							},

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							druidResto = {
								type = 'group',
								inline = true,
								name = SpellTexture(48378).." |cffFF7D0ARestoration|r",
								order = 11,
								args = listOption({48470,48469,17116},"auraApplied"),
							},
						}
					},
					hunter = {
						order = 12,
						type = 'group',
						name = "|cffABD473Hunter|r",
						args = {
							beastmastery = {
								type = 'group',
								inline = true,
								name = SpellTexture(1515).." |cffABD473 Beast Mastery|r",
								order = 1,
								args = listOption({34027,54216,34471},"auraApplied"),
							},

							spacerMM = {
								order = 5,
								type = "description",
								name = " "
							},
							marksman = {
								type = 'group',
								inline = true,
								name = SpellTexture(58434).." |cffABD473Marksmanship|r",
								order = 6,
								args = listOption({3045},"auraApplied"),
							},

							spacerSurvival = {
								order = 10,
								type = "description",
								name = " "
							},
							survival = {
								type = 'group',
								inline = true,
								name = SpellTexture(53339).." |cffABD473Survival|r",
								order = 11,
								args = listOption({19263,35079},"auraApplied"),
							},

							spacerPet = {
								order = 15,
								type = "description",
								name = " "
							},
							pet = {
								type = 'group',
								inline = true,
								name = "|cffABD473Pet|r",
								order = 16,
								args = {
									Gen = {
										type = 'group',
										inline = false,
										name = "",
										order = 1,
										args = listOption({53480,53517,1742},"auraApplied"),
									},
									Crab = {
										type = 'group',
										inline = false,
										name = "|cffABD473Crab|r",
										order = 1,
										args = listOption({53476,53479},"auraApplied"),
									},
									Ravager = {
										type = 'group',
										inline = false,
										name = "|cffABD473Ravager|r",
										order = 1,
										args = listOption({61684},"auraApplied"),
									},

								},
							},
						},
					},
					mage = {
						order = 13,
						type = 'group',
						name = "|cff69CCF0Mage|r",
						args = {
							arcane = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(42995).."|cff69CCF0 Arcane |r",
								args = listOption({12042,66,43020,12043,130,44401},"auraApplied"),
							},

							spacerFire = {
								order = 5,
								type = "description",
								name = " "
							},
							fire = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(42833).."|cff69CCF0 Fire |r",
								args = listOption({28682,43010,31643,64343,48108},"auraApplied"),
							},

							spacerFrost = {
								order = 10,
								type = "description",
								name = " "
							},
							frost = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(42842).."|cff69CCF0 Frost |r",
								args = listOption({43012,43039,45438,12472,74396,57761},"auraApplied"),
							},
						},
					},
					paladin = {
						order = 14,
						type = 'group',
						name = "|cffF58CBAPaladin|r",
						args = {
							holy = {
								order = 1,
								type = 'group',
								inline = true,
								name =  SpellTexture(48782).."|cffF58CBA Holy |r",
								args = listOption({31821,53563,31842,54428,53601,54149},"auraApplied"),
							},

							spacerProt = {
								order = 5,
								type = "description",
								name = " "
							},
							protection = {
								order = 6,
								type = 'group',
								inline = true,
								name =  SpellTexture(48942).."|cffF58CBA Protection |r",
								args = listOption({498,64205,642,1044,10278,6940,1038,25780,20178},"auraApplied"),
							},

							spacerRet = {
								order = 10,
								type = "description",
								name = " "
							},
							retribution = {
								order = 11,
								type = 'group',
								inline = true,
								name =  SpellTexture(54043).."|cffF58CBA Retribution |r",
								args = listOption({31884,59578,54203},"auraApplied"),
							},
						},
					},
					priest	= {
						order = 15,
						type = 'group',
						name = "|cffFFFFFFPriest|r",
						args = {
							discipline = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48161).."|cffFFFFFF Discipline |r",
								args = listOption({6346,48168,33206,10060,48066},"auraApplied"),
							},

							spacerHoly = {
								order = 5,
								type = "description",
								name = " "
							},
							holy = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48782).."|cffFFFFFF Holy |r",
								args = listOption({47788},"auraApplied"),
							},

							spacerShadow = {
								order = 10,
								type = "description",
								name = " "
							},
							shadow = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(48125).."|cffFFFFFF Shadow |r",
								args = listOption({47585,586,15473},"auraApplied"),
							},
						}
					},
					rogue = {
						type = 'group',
						name = "|cffFFF569Rogue|r",
						order = 16,
						args = {
							assassination = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48668).."|cffFFF569 Assassination |r",
								args = listOption({14177},"auraApplied"),
							},

							spacerCombat = {
								order = 5,
								type = "description",
								name = " "
							},
							combat = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48657).."|cffFFF569 Combat |r",
								args = listOption({13750, 26669, 48659, 51690, 11305},"auraApplied"),
							},

							spacerSub = {
								order = 10,
								type = "description",
								name = " "
							},
							subtlety = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(1784).."|cffFFF569 Subtlety |r",
								args = listOption({31224,51713,57934,45182},"auraApplied"),
							},
						},
					},
					shaman	= {
						type = 'group',
						name = "|cff0070DEShaman|r",
						order = 17,
						args = {
							elem = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(49238).."|cff0070DE Elemental Combat |r",
								args = listOption({16166},"auraApplied"),
							},

							spacerEH = {
								order = 5,
								type = "description",
								name = " "
							},
							EH	= {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(49281).."|cff0070DE Enhancement |r",
								args = listOption({2645,32182,30823,53817},"auraApplied"),
							},

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							Resto = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(49273).."|cff0070DE Restauration |r",
								args = listOption({49284,57960,16188},"auraApplied"),
							},
						}
					},
					warlock	= {
						type = 'group',
						name = "|cff9482C9Warlock|r",
						order = 18,
						args = {
							affliction = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(47860).." |cff9482C9Affliction|r",
								args = listOption({17941},"auraApplied"),
							},

							spacerDemo = {
								order = 5,
								type = "description",
								name = " "
							},
							demonology = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(5500).." |cff9482C9Demonology|r",
								args = listOption({47891,18708},"auraApplied"),
							},

							spacerDestro = {
								order = 15,
								type = "description",
								name = " "
							},
							destruction = {
								order = 16,
								type = 'group',
								inline = true,
								name = SpellTexture(47820).." |cff9482C9Destruction|r",
								args = listOption({54277},"auraApplied"),
							},

						},
					},
					warrior	= {
						order = 19,
						type = 'group',
						name = "|cffC79C6EWarrior|r",
						args = {
							arms = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(2457).." |cffC79C6EArms|r",
								args = listOption({46924,20230,12328,60503},"auraApplied"),
							},

							spacerFury = {
								order = 5,
								type = "description",
								name = " "
							},
							fury = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(2458).." |cffC79C6EFury|r",
								args = listOption({18499,12292,55694,1719,47436,47440},"auraApplied"),
							},

							spacerProt = {
								order = 10,
								type = "description",
								name = " "
							},
							protection = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(71).." |cffC79C6EProtection|r",
								args = listOption({12975,2565,871,23920,50227},"auraApplied"),
							},
						},
					},
				}
			},
			spellAuraRemoved = {
				type = 'group',
				name = "Enemy Aura Down",
				desc = "Alerts you when enemy aura or used cooldowns are off the enemy",
				set = setOption,
				get = getOption,
				disabled = function() return sadb.auraRemoved end,
				order = 3,
				args = {
					inlineCategories = {
						type = 'group',
						inline = true,
						name = "",
						order = 0,
						args = {
							btnGen = {
								type = 'execute',
								name = "General spells",
								order = 8,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "general") end,
							},
							btnRaces = {
								type = 'execute',
								name = "General races",
								order = 9,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "races") end,
							},
							btnDK = {
								type = 'execute',
								name = "Death Knight",
								order = 10,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "dk") end,
							},
							btnDruid = {
								type = 'execute',
								name = "Druid",
								order = 11,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "druid") end,
							},
							btnHunt = {
								type = 'execute',
								name = "Hunter",
								order = 12,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "hunter") end,
							},
							btnMage = {
								type = 'execute',
								name = "Mage",
								order = 13,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "mage") end,
							},
							btnPaladin = {
								type = 'execute',
								name = "Paladin",
								order = 14,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "paladin") end,
							},
							btnPriest = {
								type = 'execute',
								name = "Priest",
								order = 15,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "priest") end,
							},
							btnRogue = {
								type = 'execute',
								name = "Rogue",
								order = 16,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "rogue") end,
							},
							btnShaman = {
								type = 'execute',
								name = "Shaman",
								order = 17,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "shaman") end,
							},
							btnWarlock = {
								type = 'execute',
								name = "Warlock",
								order = 18,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "warlock") end,
							},
							btnWarrior = {
								type = 'execute',
								name = "Warrior",
								order = 19,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellAuraRemoved", "warrior") end,
							},
						},
					},

					general = {
						type = 'group',
						name = "General spells",
						order = 1,
						args = {
							objects	= {
								type = 'group',
								inline = true,
								name= "Objects",
								order = 5,
								args = listOption({54861,54758},"auraRemoved"),
							},
						}
					},
					races = {
						type = 'group',
						name = "|cffFFFFFFGeneral Races|r",
						order = 4,
						args = listOption({58984,26297,20594,33702,7744,28880},"auraRemoved"),
					},

					dk	= {
						type = 'group',
						name = "|cffC41F3BDeath Knight|r",
						order = 10,
						args = {
							dkBlood	= {
								type = 'group',
								inline = true,
								name= SpellTexture(48266).." |cffC41F3BBlood|r",
								order = 5,
								args = listOption({45529,49028,49016,55233},"auraRemoved"),
							},

							spacerFrost = {
								order = 6,
								type = "description",
								name = " "
							},
							dkFrost	= {
								type = 'group',
								inline = true,
								name= SpellTexture(48263).."|cffC41F3B Frost |r",
								order = 10,
								args = listOption({57623,48792,49039,51271},"auraRemoved"),
							},

							spacerUH = {
								order = 11,
								type = "description",
								name = " "
							},
							dkUnholy = {
								type = 'group',
								inline = true,
								name= SpellTexture(48265).."|cffC41F3B Unholy |r",
								order = 15,
								args = listOption({48707,51052,49222},"auraRemoved"),
							},

						}
					},
					druid = {
						order = 11,
						type = 'group',
						name = "|cffFF7D0ADruid|r",
						args = {
							druidBalance= {
								type = 'group',
								inline = true,
								name = SpellTexture(48463).." |cffFF7D0ABalance|r",
								order = 1,
								args = listOption({16870,22812,29166,53312,53201,53307},"auraRemoved"),
							},

							spacerFeral = {
								order = 5,
								type = "description",
								name = " "
							},
							druidFeral = {
								type = 'group',
								inline = true,
								name = SpellTexture(9634).." |cffFF7D0AFeral Combat|r",
								order = 6,
								args = listOption({50334,33357,5229,22842,52610,61336,69369},"auraRemoved"),
							},

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							druidResto = {
								type = 'group',
								inline = true,
								name = SpellTexture(48378).." |cffFF7D0ARestoration|r",
								order = 11,
								args = listOption({48470,48469,17116},"auraRemoved"),
							},
						}
					},
					hunter = {
						order = 12,
						type = 'group',
						name = "|cffABD473Hunter|r",
						args = {
							beastmastery = {
								type = 'group',
								inline = true,
								name = SpellTexture(1515).." |cffABD473 Beast Mastery|r",
								order = 1,
								args = listOption({34027,54216,34471},"auraRemoved"),
							},

							spacerMM = {
								order = 5,
								type = "description",
								name = " "
							},
							marksman = {
								type = 'group',
								inline = true,
								name = SpellTexture(58434).." |cffABD473Marksmanship|r",
								order = 6,
								args = listOption({3045},"auraRemoved"),
							},

							spacerSurvival = {
								order = 10,
								type = "description",
								name = " "
							},
							survival = {
								type = 'group',
								inline = true,
								name = SpellTexture(53339).." |cffABD473Survival|r",
								order = 11,
								args = listOption({19263,35079},"auraRemoved"),
							},

							spacerPet = {
								order = 15,
								type = "description",
								name = " "
							},
							pet = {
								type = 'group',
								inline = true,
								name = "|cffABD473Pet|r",
								order = 16,
								args = {
									Gen = {
										type = 'group',
										inline = false,
										name = "",
										order = 1,
										args = listOption({53480,53517,1742},"auraRemoved"),
									},
									Crab = {
										type = 'group',
										inline = false,
										name = "|cffABD473Crab|r",
										order = 1,
										args = listOption({53476,53479},"auraRemoved"),
									},
									Ravager = {
										type = 'group',
										inline = false,
										name = "|cffABD473Ravager|r",
										order = 1,
										args = listOption({61684},"auraRemoved"),
									},

								},
							},
						},
					},
					mage = {
						order = 13,
						type = 'group',
						name = "|cff69CCF0Mage|r",
						args = {
							arcane = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(42995).."|cff69CCF0 Arcane |r",
								args = listOption({12042,66,43020,12043,130,44401},"auraRemoved"),
							},

							spacerFire = {
								order = 5,
								type = "description",
								name = " "
							},
							fire = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(42833).."|cff69CCF0 Fire |r",
								args = listOption({28682,43010,31643,64343,48108},"auraRemoved"),
							},

							spacerFrost = {
								order = 10,
								type = "description",
								name = " "
							},
							frost = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(42842).."|cff69CCF0 Frost |r",
								args = listOption({43012,43039,45438,12472,74396,57761},"auraRemoved"),
							},
						},
					},
					paladin = {
						order = 14,
						type = 'group',
						name = "|cffF58CBAPaladin|r",
						args = {
							holy = {
								order = 1,
								type = 'group',
								inline = true,
								name =  SpellTexture(48782).."|cffF58CBA Holy |r",
								args = listOption({31821,53563,31842,54428,53601,54149},"auraRemoved"),
							},

							spacerProt = {
								order = 5,
								type = "description",
								name = " "
							},
							protection = {
								order = 6,
								type = 'group',
								inline = true,
								name =  SpellTexture(48942).."|cffF58CBA Protection |r",
								args = listOption({498,64205,642,1044,10278,6940,1038,25780,20178},"auraRemoved"),
							},

							spacerRet = {
								order = 10,
								type = "description",
								name = " "
							},
							retribution = {
								order = 11,
								type = 'group',
								inline = true,
								name =  SpellTexture(54043).."|cffF58CBA Retribution |r",
								args = listOption({31884,59578,54203},"auraRemoved"),
							},
						},
					},
					priest	= {
						order = 15,
						type = 'group',
						name = "|cffFFFFFFPriest|r",
						args = {
							discipline = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48161).."|cffFFFFFF Discipline |r",
								args = listOption({6346,48168,33206,10060,48066},"auraRemoved"),
							},

							spacerHoly = {
								order = 5,
								type = "description",
								name = " "
							},
							holy = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48782).."|cffFFFFFF Holy |r",
								args = listOption({47788},"auraRemoved"),
							},

							spacerShadow = {
								order = 10,
								type = "description",
								name = " "
							},
							shadow = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(48125).."|cffFFFFFF Shadow |r",
								args = listOption({47585,586,15473},"auraRemoved"),
							},
						}
					},
					rogue = {
						type = 'group',
						name = "|cffFFF569Rogue|r",
						order = 16,
						args = {
							assassination = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48668).."|cffFFF569 Assassination |r",
								args = listOption({14177},"auraRemoved"),
							},

							spacerCombat = {
								order = 5,
								type = "description",
								name = " "
							},
							combat = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48657).."|cffFFF569 Combat |r",
								args = listOption({13750, 26669, 48659, 51690, 11305},"auraRemoved"),
							},

							spacerSub = {
								order = 10,
								type = "description",
								name = " "
							},
							subtlety = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(1784).."|cffFFF569 Subtlety |r",
								args = listOption({31224,51713,57934,45182},"auraRemoved"),
							},
						},
					},
					shaman	= {
						type = 'group',
						name = "|cff0070DEShaman|r",
						order = 17,
						args = {
							elem = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(49238).."|cff0070DE Elemental Combat |r",
								args = listOption({16166},"auraRemoved"),
							},

							spacerEH = {
								order = 5,
								type = "description",
								name = " "
							},
							EH	= {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(49281).."|cff0070DE Enhancement |r",
								args = listOption({2645,32182,30823,53817},"auraRemoved"),
							},

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							Resto = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(49273).."|cff0070DE Restauration |r",
								args = listOption({49284,57960,16188},"auraRemoved"),
							},
						}
					},
					warlock	= {
						type = 'group',
						name = "|cff9482C9Warlock|r",
						order = 18,
						args = {
							affliction = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(47860).." |cff9482C9Affliction|r",
								args = listOption({17941},"auraRemoved"),
							},

							spacerDemo = {
								order = 5,
								type = "description",
								name = " "
							},
							demonology = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(5500).." |cff9482C9Demonology|r",
								args = listOption({47891,18708},"auraRemoved"),
							},

							spacerDestro = {
								order = 15,
								type = "description",
								name = " "
							},
							destruction = {
								order = 16,
								type = 'group',
								inline = true,
								name = SpellTexture(47820).." |cff9482C9Destruction|r",
								args = listOption({54277},"auraRemoved"),
							},

						},
					},
					warrior	= {
						order = 19,
						type = 'group',
						name = "|cffC79C6EWarrior|r",
						args = {
							arms = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(2457).." |cffC79C6EArms|r",
								args = listOption({46924,20230,12328,60503},"auraRemoved"),
							},

							spacerFury = {
								order = 5,
								type = "description",
								name = " "
							},
							fury = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(2458).." |cffC79C6EFury|r",
								args = listOption({18499,12292,55694,1719,47436,47440},"auraRemoved"),
							},

							spacerProt = {
								order = 10,
								type = "description",
								name = " "
							},
							protection = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(71).." |cffC79C6EProtection|r",
								args = listOption({12975,2565,871,23920,50227},"auraRemoved"),
							},
						},
					},
				}
			},
			--
			spellCastStart = {
				type = 'group',
				name = "Enemy Spell Casting",
				desc = "Alerts you when an enemy is attempting to cast a spell on you or another player",
				disabled = function() return sadb.castStart end,
				set = setOption,
				get = getOption,
				order = 4,
				args = {
					inlineCategories = {
						type = 'group',
						inline = true,
						name = "",
						order = 0,
						args = {
							btnGen = {
								type = 'execute',
								name = "General",
								order = 9,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "general") end,
							},
							--[[btnDK = {
								type = 'execute',
								name = "Death Knight",
								order = 10,
								width = "full",
								disabled = true,
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "dk") end,
							},]]
							btnDruid = {
								type = 'execute',
								name = "Druid",
								order = 11,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "druid") end,
							},
							btnHunt = {
								type = 'execute',
								name = "Hunter",
								order = 12,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "hunter") end,
							},
							btnMage = {
								type = 'execute',
								name = "Mage",
								order = 13,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "mage") end,
							},
							btnPaladin = {
								type = 'execute',
								name = "Paladin",
								order = 14,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "paladin") end,
							},
							btnPriest = {
								type = 'execute',
								name = "Priest",
								order = 15,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "priest") end,
							},
							btnRogue = {
								type = 'execute',
								name = "Rogue",
								order = 16,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "rogue") end,
							},
							btnShaman = {
								type = 'execute',
								name = "Shaman",
								order = 17,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "shaman") end,
							},
							btnWarlock = {
								type = 'execute',
								name = "Warlock",
								order = 18,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "warlock") end,
							},
							btnWarrior = {
								type = 'execute',
								name = "Warrior",
								order = 19,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastStart", "warrior") end,
							},
						},
					},
					general = {
						type = 'group',
						name = "General Spells",
						order = 2,
						args = {
							bigHeal = {
								type = 'toggle',
								name = SpellTexture(48782).."Big Heals",
								desc = "Heal, Holy Light, Healing Wave, Healing Touch",
								order = 1,
							},
							resurrection = {
								type = 'toggle',
								name = SpellTexture(20609).."Resurrection spells",
								desc = "Ancestral Spirit, Redemption, etc",
								order = 2,
							},
						}
					},
					druid = {
						type = 'group',
						name = "|cffFF7D0ADruid|r",
						order = 2,
						args = {
							druidBalance= {
								type = 'group',
								inline = true,
								name = SpellTexture(48463).." |cffFF7D0ABalance|r",
								order = 1,
								args = listOption({18658,48467,33786,48465,53308,48461},"castStart"),
							},

							--[[spacerFeral = {
								order = 5,
								type = "description",
								name = " "
							},
							druidFeral = {
								type = 'group',
								inline = true,
								name = SpellTexture(9634).." |cffFF7D0AFeral Combat|r",
								order = 6,
								args = listOption({},"castStart"),
							},]]

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							druidResto = {
								type = 'group',
								inline = true,
								name = SpellTexture(48378).." |cffFF7D0ARestoration|r",
								order = 11,
								args = listOption({48443,48447},"castStart"),
							},
						}
					},
					hunter = {
						type = 'group',
						name = "|cffABD473Hunter|r",
						order = 3,
						args = {
							beastmastery = {
								type = 'group',
								inline = true,
								name = SpellTexture(1515).." |cffABD473 Beast Mastery|r",
								order = 1,
								args = listOption({982, 14327},"castStart"),
							},

							spacerMM = {
								order = 5,
								type = "description",
								name = " "
							},
							marksman = {
								type = 'group',
								inline = true,
								name = SpellTexture(58434).." |cffABD473Marksmanship|r",
								order = 6,
								args = listOption({49052},"castStart"),
							},

							--[[spacerSurvival = {
								order = 10,
								type = "description",
								name = " "
							},
							survival = {
								type = 'group',
								inline = true,
								name = SpellTexture(53339).." |cffABD473Survival|r",
								order = 11,
								args = listOption({},"castStart"),
							},]]
						},
					},
					mage = {
						type = 'group',
						name = "|cff69CCF0Mage|r",
						order = 4,
						args = {
							arcane = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(42995).."|cff69CCF0 Arcane |r",
								args = listOption({42897,28271,42846},"castStart"),
							},

							spacerFire = {
								order = 5,
								type = "description",
								name = " "
							},
							fire = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(42833).."|cff69CCF0 Fire |r",
								args = listOption({42833,42926,47610,42859},"castStart"),
							},

							spacerFrost = {
								order = 10,
								type = "description",
								name = " "
							},
							frost = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(42842).."|cff69CCF0 Frost |r",
								args = listOption({42842},"castStart"),
							},
						},
					},
					paladin = {
						type = 'group',
						name = "|cffF58CBAPaladin|r",
						order = 5,
						args = {
							holy = {
								order = 1,
								type = 'group',
								inline = true,
								name =  SpellTexture(48782).."|cffF58CBA Holy |r",
								args = listOption({48801,48785,10326},"castStart"),
							},

							--[[spacerProt = {
								order = 5,
								type = "description",
								name = " "
							},
							protection = {
								order = 6,
								type = 'group',
								inline = true,
								name =  SpellTexture(48942).."|cffF58CBA Protection |r",
								args = listOption({},"castStart"),
							},]]

							--[[spacerRet = {
								order = 10,
								type = "description",
								name = " "
							},
							retribution = {
								order = 11,
								type = 'group',
								inline = true,
								name =  SpellTexture(54043).."|cffF58CBA Retribution |r",
								args = listOption({},"castStart"),
							},]]
						},
					},
					priest	= {
						type = 'group',
						name = "|cffFFFFFFPriest|r",
						order = 6,
						args = {
							discipline = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48161).."|cffFFFFFF Discipline |r",
								args = listOption({8129,9484,10955,32375},"castStart"),
							},

							spacerHoly = {
								order = 5,
								type = "description",
								name = " "
							},
							holy = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48782).."|cffFFFFFF Holy |r",
								args = listOption({48120,48071,48135,48123},"castStart"),
							},

							spacerShadow = {
								order = 10,
								type = "description",
								name = " "
							},
							shadow = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(48125).."|cffFFFFFF Shadow |r",
								args = listOption({48127,605,48160},"castStart"),
							},
						}
					},
					rogue = {
						type = 'group',
						name = "|cffFFF569Rogue|r",
						order = 7,
						args = {
							subtlety = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(1784).."|cffFFF569 Subtlety |r",
								args = listOption({1842},"castStart"),
							},
						},
					},
					shaman	= {
						type = 'group',
						name = "|cff0070DEShaman|r",
						order = 8,
						args = {
							elem = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(49238).."|cff0070DE Elemental Combat |r",
								args = listOption({49271,51514,60043,49238},"castStart"),
							},

							--[[spacerEH = {
								order = 5,
								type = "description",
								name = " "
							},
							EH	= {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(49281).."|cff0070DE Enhancement |r",
								args = listOption({51514},"castStart"),
							},]]

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							Resto = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(49273).."|cff0070DE Restauration |r",
								args = listOption({49276},"castStart"),
							},
						}
					},
					warlock = {
						type = 'group',
						name = "|cff9482C9Warlock|r",
						order = 9,
						args = {
							affliction = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(47860).." |cff9482C9Affliction|r",
								args = listOption({6215,59164,17928,47836,47843},"castStart"),
							},

							spacerDemo = {
								order = 5,
								type = "description",
								name = " "
							},
							demonology = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(5500).." |cff9482C9Demonology|r",
								args = listOption({18647,47878,48018,61191,691,688,712,697,30146},"castStart"),
							},

							spacerDestro = {
								order = 15,
								type = "description",
								name = " "
							},
							destruction = {
								order = 16,
								type = 'group',
								inline = true,
								name = SpellTexture(47820).." |cff9482C9Destruction|r",
								args = listOption({59172,47811,47838,47815,47825},"castStart"),
							},

							spacerPet = {
								order = 20,
								type = "description",
								name = " "
							},
							pet = {
								order = 21,
								type = 'group',
								inline = true,
								name = "|cff9482C9Pet|r",
								args = {
									succube = {
										type = 'group',
										inline = false,
										name = SpellTexture(712).."|cff9482C9 Succube |r",
										order = 2,
										args = listOption({6358},"castStart"),
									},
									--[[voidwalker = {
										type = 'group',
										inline = true,
										name = SpellTexture(697).." Voidwalker",
										order = 3,
										args = listOption({ },"castSuccess"),
									},]]
								}
							},
						},
					},
					warrior	= {
						type = 'group',
						name = "|cffC79C6EWarrior|r",
						order = 10,
						args = {
							arms = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(2457).." |cffC79C6EArms|r",
								args = listOption({64382},"castStart"),
							},

							--[[spacerFury = {
								order = 5,
								type = "description",
								name = " "
							},
							fury = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(2458).." |cffC79C6EFury|r",
								args = listOption({},"castStart"),
							},]]

							--[[spacerProt = {
								order = 10,
								type = "description",
								name = " "
							},
							protection = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(71).." |cffC79C6EProtection|r",
								args = listOption({},"castStart"),
							},]]
						},
					},
				},
			},
			spellCastSuccess = {
				type = 'group',
				name = "Enemy Cooldown Abilities",
				desc = "Alerts you when enemies have used cooldowns",
				disabled = function() return sadb.castSuccess end,
				set = setOption,
				get = getOption,
				order = 5,
				args = {
					inlineCategories = {
						type = 'group',
						inline = true,
						name = "",
						order = 0,
						args = {
							btnGen = {
								type = 'execute',
								name = "General",
								order = 9,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "general") end,
							},
							btnDK = {
								type = 'execute',
								name = "Death Knight",
								order = 10,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "dk") end,
							},
							btnDruid = {
								type = 'execute',
								name = "Druid",
								order = 11,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "druid") end,
							},
							btnHunt = {
								type = 'execute',
								name = "Hunter",
								order = 12,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "hunter") end,
							},
							btnMage = {
								type = 'execute',
								name = "Mage",
								order = 13,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "mage") end,
							},
							btnPaladin = {
								type = 'execute',
								name = "Paladin",
								order = 14,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "paladin") end,
							},
							btnPriest = {
								type = 'execute',
								name = "Priest",
								order = 15,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "priest") end,
							},
							btnRogue = {
								type = 'execute',
								name = "Rogue",
								order = 16,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "rogue") end,
							},
							btnShaman = {
								type = 'execute',
								name = "Shaman",
								order = 17,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "shaman") end,
							},
							btnWarlock = {
								type = 'execute',
								name = "Warlock",
								order = 18,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "warlock") end,
							},
							btnWarrior = {
								type = 'execute',
								name = "Warrior",
								order = 19,
								width = "full",
								func = function() AceConfigDialog:SelectGroup("SoundAlerter", "Spells", "spellCastSuccess", "warrior") end,
							},
						},
					},
					general = {
						type = 'group',
						name = "General spells",
						order = 1,
						args = {
							objects	= {
								type = 'group',
								inline = true,
								name= "Objects",
								order = 5,
								args = listOption({71607,54757},"castSuccess"),
							},
						}
					},
					dk	= {
						type = 'group',
						name = "|cffC41F3BDeath Knight|r",
						order = 10,
						args = {
							dkBlood	= {
								type = 'group',
								inline = true,
								name= SpellTexture(48266).." |cffC41F3BBlood|r",
								order = 5,
								args = listOption({49941,48266,49930,56222,48743,55262,49005,50842,48982,47476},"castSuccess"),
							},

							spacerFrost = {
								order = 6,
								type = "description",
								name = " "
							},
							dkFrost	= {
								type = 'group',
								inline = true,
								name= SpellTexture(48263).."|cffC41F3B Frost |r",
								order = 10,
								args = listOption({45524,49796,47568,48263,55268,49203,49909,47528,51425,56815},"castSuccess"),
							},

							spacerUH = {
								order = 11,
								type = "description",
								name = " "
							},
							dkUnholy = {
								type = 'group',
								inline = true,
								name= SpellTexture(48265).."|cffC41F3B Unholy |r",
								order = 15,
								args = listOption({51328,49938,49576,49924,49921,61999,46584,55271,49206,48265},"castSuccess"),
							},

							spacerPet = {
								order = 16,
								type = "description",
								name = " "
							},
							dkpet = {
								type = 'group',
								inline = true,
								name= SpellTexture(42650).." Pet",
								order = 20,
								args = listOption({47468,47481,47482,47484},"castSuccess"),
							},
						}
					},
					druid = {
						type = 'group',
						name = "|cffFF7D0ADruid|r",
						order = 11,
						args = {
							druidBalance= {
								type = 'group',
								inline = true,
								name = SpellTexture(48463).." |cffFF7D0ABalance|r",
								order = 1,
								args = listOption({770,33831,48467,48468,48463,24858,61384},"castSuccess"),
							},

							spacerFeral = {
								order = 5,
								type = "description",
								name = " "
							},
							druidFeral = {
								type = 'group',
								inline = true,
								name = SpellTexture(9634).." |cffFF7D0AFeral Combat|r",
								order = 6,
								args = listOption({8983,768,9634,48570,48560,16857,16979,49376,48577,48568,49802,33878,33876,48480,49803,5215,48574,48579,49800,48572,48562,62078,50213,5225,783},"castSuccess"),
							},

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							druidResto = {
								type = 'group',
								inline = true,
								name = SpellTexture(48378).." |cffFF7D0ARestoration|r",
								order = 11,
								args = listOption({2893,48470,48469,48451,17116,48441,2782,18562,33891,53251},"castSuccess"),
							},
						}
					},
					hunter = {
						type = 'group',
						name = "|cffABD473Hunter|r",
						order = 12,
						args = {
							beastmastery = {
								type = 'group',
								inline = true,
								name = SpellTexture(1515).." |cffABD473 Beast Mastery|r",
								order = 1,
								args = listOption({13161,5118,61847,27044,13163,13159,34074,49071,6991,48990},"castSuccess"),
							},

							spacerMM = {
								order = 5,
								type = "description",
								name = " "
							},
							marksman = {
								type = 'group',
								inline = true,
								name = SpellTexture(58434).." |cffABD473Marksmanship|r",
								order = 6,
								args = listOption({49050,49045,53209,5116,20736,1543,53338,61006,49048,23989,3043,49001,34490,19801,3034,58434},"castSuccess"),
							},

							spacerSurvival = {
								order = 10,
								type = "description",
								name = " "
							},
							survival = {
								type = 'group',
								inline = true,
								name = SpellTexture(53339).." |cffABD473Survival|r",
								order = 11,
								args = listOption({781,49067,5384,60192,14311,13809,49056,53339,48996,19503,34600,19885,19883,49010},"castSuccess"),
							},

							spacerPet = {
								order = 15,
								type = "description",
								name = " "
							},
							pet = {
								type = 'group',
								inline = true,
								name = "|cffABD473Pet|r",
								order = 16,
								args = {
									Crab = {
										type = 'group',
										inline = false,
										name = "|cffABD473Crab|r",
										order = 1,
										args = listOption({61685,52472,53547},"castSuccess"),
									},
									Ravager = {
										type = 'group',
										inline = false,
										name = "|cffABD473Ravager|r",
										order = 2,
										args = listOption({53561,53490,52473,61684},"castSuccess"),
									},
								},
							},
						},
					},
					mage = {
						type = 'group',
						name = "|cff69CCF0Mage|r",
						order = 13,
						args = {
							arcane = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(42995).."|cff69CCF0 Arcane |r",
								args = listOption({44781,42921,42846,1953,42987,2139,12051,66,55342,475,31589,30449},"castSuccess"),
							},

							spacerFire = {
								order = 5,
								type = "description",
								name = " "
							},
							fire = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(42833).."|cff69CCF0 Fire |r",
								args = listOption({42945, 42950,42873,55360},"castSuccess"),
							},

							spacerFrost = {
								order = 10,
								type = "description",
								name = " "
							},
							frost = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(42842).."|cff69CCF0 Frost |r",
								args = listOption({42940,11958, 42931,44572,42917,42914,31687},"castSuccess"),
							},

							spacerPet = {
								order = 20,
								type = "description",
								name = " "
							},
							pet = {
								order = 21,
								type = 'group',
								inline = true,
								name = "|cff69CCF0Pet|r",
								args = {
									waterElem = {
										type = 'group',
										inline = false,
										name = SpellTexture(31687).."|cff9482C9 Felhunter |r",
										order = 1,
										args = listOption({33395},"castSuccess"),
									},
								}
							},

						},
					},
					paladin = {
						type = 'group',
						name = "|cffF58CBAPaladin|r",
						order = 14,
						args = {
							holy = {
								order = 1,
								type = 'group',
								inline = true,
								name =  SpellTexture(48782).."|cffF58CBA Holy |r",
								args = listOption({4987,19746,48819,20216,48825,48817,48788,1152},"castSuccess"),
							},

							spacerProt = {
								order = 5,
								type = "description",
								name = " "
							},
							protection = {
								order = 6,
								type = 'group',
								inline = true,
								name =  SpellTexture(48942).."|cffF58CBA Protection |r",
								args = listOption({48827,48942,48947,48945,10308,53595,62124,20164,48943,61411},"castSuccess"),
							},

							spacerRet = {
								order = 10,
								type = "description",
								name = " "
							},
							retribution = {
								order = 11,
								type = 'group',
								inline = true,
								name =  SpellTexture(54043).."|cffF58CBA Retribution |r",
								args = listOption({32223,35395,53385, 48806,53407,20271,53408,20066,54043},"castSuccess"),
							},
						},
					},
					priest	= {
						type = 'group',
						name = "|cffFFFFFFPriest|r",
						order = 15,
						args = {
							discipline = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48161).."|cffFFFFFF Discipline |r",
								args = listOption({988,53007},"castSuccess"),
							},

							spacerHoly = {
								order = 5,
								type = "description",
								name = " "
							},
							holy = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48782).."|cffFFFFFF Holy |r",
								args = listOption({552, 528,48173,48078,48068,48113},"castSuccess"),
							},

							spacerShadow = {
								order = 10,
								type = "description",
								name = " "
							},
							shadow = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(48125).."|cffFFFFFF Shadow |r",
								args = listOption({48300,48156,53023, 64044,10890,48158,48125,34433,15487},"castSuccess"),
							},
						}
					},
					rogue = {
						type = 'group',
						name = "|cffFFF569Rogue|r",
						order = 16,
						args = {
							assassination = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(48668).."|cffFFF569 Assassination |r",
								args = listOption({48691, 1833,48674,51722,57993,48668,8647,48676,8643,48666,48672},"castSuccess"),
							},

							spacerCombat = {
								order = 5,
								type = "description",
								name = " "
							},
							combat = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(48657).."|cffFFF569 Combat |r",
								args = listOption({48657,51723, 1776,1766,5938,48638,13877},"castSuccess"),
							},

							spacerSub = {
								order = 10,
								type = "description",
								name = " "
							},
							subtlety = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(1784).."|cffFFF569 Subtlety |r",
								args = listOption({2094,1725,48660,14183,14185,51724,36554,1784,26889},"castSuccess"),
							},
						},
					},
					shaman	= {
						type = 'group',
						name = "|cff0070DEShaman|r",
						order = 17,
						args = {
							elem = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(49238).."|cff0070DE Elemental Combat |r",
								args = listOption({66843, 66842,66844,49231,2484,2894,61657,49233,49236,58734,8012,58704,58582,59159,57722,57994},"castSuccess"),
							},

							spacerEH = {
								order = 5,
								type = "description",
								name = " "
							},
							EH	= {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(49281).."|cff0070DE Enhancement |r",
								args = listOption({2062,51533,58739,58656,58745,8177,60103,49281,58749,58753,17364,58643,8512,3738},"castSuccess"),
							},

							spacerResto = {
								order = 10,
								type = "description",
								name = " "
							},
							Resto = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(49273).."|cff0070DE Restauration |r",
								args = listOption({51886,8170,526,58757,58774,16190,16188,61301,55198,36936,8143},"castSuccess"),
							},
						}
					},
					warlock = {
						type = 'group',
						name = "|cff9482C9Warlock|r",
						order = 18,
						args = {
							affliction = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(47860).." |cff9482C9Affliction|r",
								args = listOption({47813,47864,47867,18223,47865,11719,50511,47860,47857,5138,47855,17928,57946},"castSuccess"),
							},

							spacerDemo = {
								order = 5,
								type = "description",
								name = " "
							},
							demonology = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(5500).." |cff9482C9Demonology|r",
								args = listOption({47875,48020,132,47856,1122},"castSuccess"),
							},

							spacerDestro = {
								order = 15,
								type = "description",
								name = " "
							},
							destruction = {
								order = 16,
								type = 'group',
								inline = true,
								name = SpellTexture(47820).." |cff9482C9Destruction|r",
								args = listOption({17962,47823,47820,47827,61290,47847},"castSuccess"),
							},

							spacerPet = {
								order = 20,
								type = "description",
								name = " "
							},
							pet = {
								order = 21,
								type = 'group',
								inline = true,
								name = "|cff9482C9Pet|r",
								args = {
									felhunter = {
										type = 'group',
										inline = false,
										name = SpellTexture(691).."|cff9482C9 Felhunter |r",
										order = 1,
										args = listOption({19647,48011},"castSuccess"),
									},
									succube = {
										type = 'group',
										inline = false,
										name = SpellTexture(712).."|cff9482C9 Succube |r",
										order = 2,
										args = listOption({7870},"castSuccess"),
									},
									--[[voidwalker = {
										type = 'group',
										inline = true,
										name = SpellTexture(697).." Voidwalker",
										order = 3,
										args = listOption({ },"castSuccess"),
									},]]
								}
							},
						},
					},
					warrior	= {
						type = 'group',
						name = "|cffC79C6EWarrior|r",
						order = 19,
						args = {
							arms = {
								order = 1,
								type = 'group',
								inline = true,
								name = SpellTexture(2457).." |cffC79C6EArms|r",
								args = listOption({2457,11578,1715,47450,57755,694,47486,7384,47465,47502},"castSuccess"),
							},

							spacerFury = {
								order = 5,
								type = "description",
								name = " "
							},
							fury = {
								order = 6,
								type = 'group',
								inline = true,
								name = SpellTexture(2458).." |cffC79C6EFury|r",
								args = listOption({2458,23881,1161,47520,47437,47471,60970,20252,5246,12323,6552,47475,34428,1680},"castSuccess"),
							},

							spacerProt = {
								order = 10,
								type = "description",
								name = " "
							},
							protection = {
								order = 11,
								type = 'group',
								inline = true,
								name = SpellTexture(71).." |cffC79C6EProtection|r",
								args = listOption({71,2687,12809,47498,676,3411,57823,72,47488,46968,7386,355},"castSuccess"),
							},
						},
					},
				},
			},
			--
			enemydebuff = {
				type = 'group',
				--inline = true,
				name = "Enemy Debuff",
				desc = "Alerts you when you (or your arena partner) have casted a CC on an enemy",
				disabled = function() return sadb.dEnemyDebuff end,
				set = setOption,
				get = getOption,
				order = 6,
				args = {
						fromself = {
						type = 'group',
						inline = true,
						name = "|cffFFF569From Self|r",
						order = 1,
						args = listOption({2094,51724,51514,12826,118,33786},"enemyDebuffs"),
					},
					fromarenapartner = {
						type = 'group',
						inline = true,
						name = "|cffFFF569From Arena Partner or affecting your Target|r",
						order = 2,
						args = listOption({2094,51724,51514,12826,118,33786},"friendCCenemy"),
					}
				},
			},
			enemydebuffdown = {
				type = 'group',
				--inline = true,
				name = "Enemy Debuff Down",
				desc = "Alerts you when your (or your arena partner) casted CC's on an enemy is down",
				disabled = function() return sadb.dEnemyDebuffDown end,
				set = setOption,
				get = getOption,
				order = 7,
				args = {
					fromself = {
						type = 'group',
						inline = true,
						name = "|cffFFF569From Self|r",
						order = 1,
						args = listOption({2094,51724,51514,12826,118,33786},"enemyDebuffdown"),
					},
					fromarenapartner = {
						type = 'group',
						inline = true,
						name = "|cffFFF569From Arena Partner or affecting your Target|r",
						desc = "Alerts you if your arena partner casts a spell or your target gets afflicted by a spell",
						order = 2,
						args = listOption({2094,51724,51514,12826,118,33786},"enemyDebuffdownAP"),
					}
				},
			},
			--
			chatalerter = {
				type = 'group',
				name = "Chat Alerts",
				desc = "Alerts you and others via sending a chat message",
				disabled = function() return sadb.chatalerts end,
				set = setOption,
				get = getOption,
				order = 1,
				args = {
					caonlyTF = {
						type = 'toggle',
						name = L["Target and Focus only"],
						desc = L["Alerts you when your target or focus is applicable to a sound alert"],
						order = 1,
					},
					chatgroup = {
						type = 'select',
						name = L["What channel to alert in"],
						desc = L["You send a message to either party, raid, say or battleground with your chat alert"],
						values = self.SA_CHATGROUP,
						order = 2,
					},
					spells = {
						type = 'group',
						inline = true,
						name = "Spells",
						order = 3,
						args = {
							stealthenemy = {
								type = 'toggle',
								name = SpellTextureName(1784),
								desc = function ()
									GameTooltip:SetHyperlink(GetSpellLink(1784));
								end,
								order = 1,
							},
							blindenemy = {
								type = 'toggle',
								name = SpellTexture(2094).."Blind on Enemy",
								desc = "Enemies you blind will be alerted in chat",
								order = 3,
							},
							blindselffriend = {
								type = 'toggle',
								name = SpellTexture(2094).."Blind on Self/Friend",
								desc = "Enemies that have blinded you will be alerted",
								order = 4,
							},
							cycloneenemy = {
								type = 'toggle',
								name = SpellTexture(33786).."Cyclone on Enemy",
								desc = "Enemies you cyclone will be alerted in chat",
								order = 5,
							},
							cycloneselffriend = {
								type = 'toggle',
								name = SpellTexture(33786).."Cyclone on Self/Friend",
								desc = "Enemies you cyclone will be alerted in chat",
								order = 6,
							},
							hexenemy = {
								type = 'toggle',
								name = SpellTexture(51514).."Hex on Enemy",
								desc = "Enemies you hex will be alerted in chat",
								order = 7,
							},
							hexselffriend = {
								type = 'toggle',
								name = SpellTexture(51514).."Hex on Self/Friend",
								desc = "Enemies you hex will be alerted in chat",
								order = 8,
							},
							fearenemy = {
								type = 'toggle',
								name = SpellTexture(5484).."Fear on Enemy",
								desc = "Enemies you fear will be alerted in chat",
								order = 9,
							},
							fearselffriend = {
								type = 'toggle',
								name = SpellTexture(5484).."Fear on Self/friend",
								desc = "Enemies you fear will be alerted in chat",
								order = 10,
							},
							sapenemy = {
								type = 'toggle',
								name = SpellTexture(6770).."Sap on Enemy",
								desc = "Enemies you sapped will be alerted",
								order = 11,
							},
							bubbleenemy = {
								type = 'toggle',
								name = SpellTextureName(642),
								desc = "Enemies that have casted Divine Shield will be alerted",
								order = 12,
							},
							polyenemy = {
								type = 'toggle',
								name = SpellTextureName(118),
								desc = "Enemies that have casted Polymorph will be alerted",
								order = 13,
							},
							vanishenemy = {
								type = 'toggle',
								name = SpellTextureName(26889),
								desc = "Enemies that have casted Vanish will be alerted",
								order = 13,
							},
							trinketalert = {
								type = 'toggle',
								name = GetSpellInfo(42292),
								desc = function ()
									GameTooltip:SetHyperlink(GetSpellLink(42292));
								end,
								order = 14,
							},
							interruptenemy = {
								type = 'toggle',
								name = "Interrupt on Enemy",
								desc = "Sends a chat message if you have interrupted an enemy's spell.",
								order = 15,
							},
							interruptself = {
								type = 'toggle',
								name = "Interrupt on Self",
								desc = "Sends a chat message if an enemy has interrupted you.",
								order = 16,
							},
							chatdownself = {
								type = 'toggle',
								name = "Alert enemy debuff down (from self)",
								desc = "Sends a chat message when an enemies debuff is down that came from yourself (eg. Hex down)",
								order = 17,
							},
							chatdownfriend = {
								type = 'toggle',
								name = "Alert enemy debuff down (from friend)",
								desc = "Sends a chat message when an enemies debuff is down that came from yourself (eg. Hex down)",
								order = 17,
							},
						},
					},
					general = {
						type = "group",
						inline = true,
						name = "General Chat Alerts",
						args = {
							enemychat = {
								type = "input",
								name = "To Enemy",
								desc = "Example: '#spell# up on #enemy#' = [Blind] up on Enemyname",
								order = 1,
								width = "full",
							},
							friendchat = {
								type = "input",
								name = "From Enemy to friend",
								desc = "Example: '#enemy# casted #spell# on #target# = Enemyname casted [Blind] on FriendName",
								order = 2,
								width = "full",
							},
							selfchat = {
								type = "input",
								name = "From Enemy to self",
								desc = "Example: '#enemy# casted #spell# on #target# = Enemyname casted [Blind] on FriendName",
								order = 3,
								width = "full",
							},
							enemybuffchat = {
								type = "input",
								name = "Enemy buffs/cooldowns",
								desc = "Example: '#enemy# casted #spell#  = Enemyname casted [Stealth]",
								order = 4,
								width = "full",
							},
						},
					},
					saptextfriendg = {
						type = "group",
						inline = true,
						hidden = function() if sadb.sapenemy then return false else return true end end,
						name = SpellTexture(6770).."Sap on self/friend",
						order = 13,
						args = {
							sapselftext = {
							type = "input",
							name = "Sap on Self (Avoid using '#enemy# due to unknown enemy when stealthed)",
							order = 1,
							width = "full",
							},
							sapfriendtext = {
							type = "input",
							name = "Sap on Friend (Avoid using '#enemy# due to unknown enemy when stealthed)",
							order = 1,
							width = "full",
							},
						},
					},
					trinketalerttextg = {
						type = "group",
						inline = true,
						hidden = function() if sadb.trinketalert then return false else return true end end,
						name = "PvP trinket text",
						order = 14,
						args = {
							trinketalerttext = {
								type = 'input',
								name = "Example: '#enemy# casted #spell#!' = Enemyname casted [PvP Trinket]!",
								order = 1,
								width = "full",
							},
						},
					},
					stealthalerttextg = {
						type = "group",
						inline = true,
						hidden = function() if sadb.stealthenemy then return false else return true end end,
						name = SpellTextureName(1784),
						order = 15,
						args = {
							stealthTF = {
								type = 'toggle',
								name = "Ignore target/focus",
								order = 2,
							},
						},
					},
					vanishalerttextg = {
						type = "group",
						inline = true,
						hidden = function() if sadb.vanishenemy then return false else return true end end,
						name = SpellTextureName(26889),
						order = 16,
						args = {
							vanishTF = {
								type = 'toggle',
								name = "Ignore target/focus",
								order = 2,
							},
						},
					},
					InterruptTextg = {
						type = "group",
						inline = true,
						name = "Interrupt Text",
						order = 17,
						args = {
							InterruptEnemyText = {
								name = "Interrupt on Enemy (eg. 'Interrupted #enemy# with #spell#')",
								hidden = function() if sadb.interruptenemy then return false else return true end end,
								type = "input",
								order = 1,
								width = "full",
							},
							InterruptSelfText = {
								name = "Interrupts from Enemy (eg. '#enemy# interrupted me with #spell#')",
								hidden = function() if sadb.interruptself then return false else return true end end,
								type = "input",
								order = 1,
								width = "full",
							},
						},
					},
				},
			},
			--
			FriendDebuff = {
				type = 'group',
				--inline = true,
				name = "Arena partner Enemy Spell Casting",
				desc = "Alerts you when an enemy is casting a spell targetted at your arena partner",
				disabled = function() return sadb.dArenaPartner end,
				set = setOption,
				get = getOption,
				order = 8,
				args = listOption({51514,118,33786,6215},"friendCCs"),
			},
			FriendDebuffSuccess = {
				type = 'group',
				name = "Arena partner CCs/Debuffs",
				desc = "Alerts you when your arena partner gets CC'd",
				disabled = function() return sadb.dArenaPartner end,
				set = setOption,
				get = getOption,
				order = 9,
				args = listOption({14309,2094,10308,51514,12826,33786,6215,2139,51724},"friendCCSuccess"),
			},
			--
			selfDebuffs = {
				type = 'group',
				--inline = true,
				name = "Self Debuffs",
				desc = "Alerts you when you get afflicted by one of these spells when you aren't targeting the enemy.",
				disabled = function() return sadb.dSelfDebuff end,
				set = setOption,
				get = getOption,
				order = 10,
				args = listOption({33786,51514,118,6215,14309,13809,5246,17928,2094,51724,10308,47860,5138,44572,20066,34490,19434,47476,51722,61606,19386,6358},"selfDebuff"),
			},
		},
	})
	self:AddOption('custom', {
		type = 'group',
		name = L["Custom Alerts"],
		desc = L["Create a custom sound or chat alert with text or a sound file"],
		order = 3,
		args = {
			newalert = {
				type = 'execute',
				name = function ()
							if sadb.custom[L["New Alert"]] then
								return L["Rename the New Alert entry"]
							else
								return L["New Alert"]
							end
						end,
				order = -1,
				func = function()
					sadb.custom[L["New Alert"]] = {
						name = L["New Alert"],
						soundfilepath = L["New Alert"]..".[ogg/mp3/wav]",
						sourceuidfilter = "any",
						destuidfilter = "any",
						eventtype = {
							SPELL_CAST_SUCCESS = true,
							SPELL_CAST_START = false,
							SPELL_AURA_APPLIED = false,
							SPELL_AURA_REMOVED = false,
							SPELL_INTERRUPT = false,
							SPELL_SUMMON = false,
						},
						sourcetypefilter = COMBATLOG_FILTER_EVERYTHING,
						desttypefilter = COMBATLOG_FILTER_EVERYTHING,
						order = 0,
					}
					self:OnOptionsCreate()
				end,
				disabled = function ()
					if sadb.custom[L["New Alert"]] then
						return true
					else
						return false
					end
				end,
			},
		}
	})
	local function makeoption(key)
		local keytemp = key
		self.options.args.custom.args[key] = {
			type = 'group',
			name = sadb.custom[key].name,
			set = function(info, value) local name = info[#info] sadb.custom[key][name] = value end,
			get = function(info) local name = info[#info] return sadb.custom[key][name] end,
			order = sadb.custom[key].order,
			args = {
				name = {
					name = L["Spell Entry Name"],
					desc = L["Menu entry for the spell (eg. Hex down on arena partner)"],
					type = 'input',
					set = function(info, value)
						if sadb.custom[value] then log(L["same name already exists"]) return end
						sadb.custom[key].name = value
						sadb.custom[key].order = 100
						sadb.custom[value] = sadb.custom[key]
						sadb.custom[key] = nil
						--makeoption(value)
						self.options.args.custom.args[keytemp].name = value
						key = value
					end,
					order = 1,
				},
				spellname = {
					name = L["Spell Name"],
					type = 'input',
					order = 10,
					hidden = function() return not sadb.custom[key].acceptSpellName end,
				},
				spellid = {
					name = L["Spell ID"],
					desc = L["Can be found on OpenWoW, in the URL"],
					set = function(info, value)
					local name = info[#info] sadb.custom[key][name] = value
						if GetSpellInfo(value) then
							sadb.custom[key].spellname = GetSpellInfo(value)
							self.options.args.custom.args[keytemp].spellname = GetSpellInfo(value)
						else
						sadb.custom[key].spellname = "Invalid Spell ID"
						self.options.args.custom.args[keytemp].spellname = "Invalid Spell ID"
						end
					end,
					type = 'input',
					order = 20,
					pattern = "%d+$",
				},
				remove = {
					type = 'execute',
					order = 25,
					name = L["Remove"],
					confirm = true,
					confirmText = L["Are you sure?"],
					func = function()
						sadb.custom[key] = nil
						self.options.args.custom.args[keytemp] = nil
					end,
				},
				acceptSpellName = {
					type = 'toggle',
					name = "Use specific spell name",
					desc = "Use this in case there are multiple ranks for this spell",
					order = 26,
				},
				chatAlert = {
					type = 'toggle',
					name = "Chat Alert",
					order = 27,
				},
				test = {
					type = 'execute',
					order = 28,
					name = L["Test"],
					desc = L["If you don't hear anything, try restarting WoW"],
					func = function() PlaySoundFile("Interface\\Addons\\SoundAlerter\\CustomSounds\\"..sadb.custom[key].soundfilepath) end,
					hidden = function() if sadb.custom[key].chatAlert then return true end end,
				},
				soundfilepath = {
					name = L["File Path"],
					desc = L["Place your ogg/mp3 custom sound in the CustomSounds folder in Interface/Addons/SoundAlerter/"],
					type = 'input',
					width = 'double',
					order = 27,
					hidden = function() if sadb.custom[key].chatAlert then return true end end,
				},
				chatalerttext = {
					name = "Chat Alert Text",
					desc = "eg. #enemy# casted #spell# on me! (Use '%t' if you're casting a spell on an enemy. )",
					type = 'input',
					width = 'double',
					order = 28,
					hidden = function() if not sadb.custom[key].chatAlert then return true end end,
				},
				eventtype = {
					type = 'multiselect',
					order = 50,
					name = L["Event type - it's best to have the least amount of event conditions"],
					values = self.SA_EVENT,
					get = function(info, k) return sadb.custom[key].eventtype[k] end,
					set = function(info, k, v) sadb.custom[key].eventtype[k] = v end,
				},
				sourceuidfilter = {
					type = 'select',
					order = 61,
					name = L["Source unit"],
					desc = L["Is the person who casted the spell your target/focus/mouseover?"],
					values = self.SA_UNIT,
				},
				sourcetypefilter = {
					type = 'select',
					order = 60,
					name = L["Source of the spell"],
					desc = L["Who casted the spell? Leave on 'any' if a spell got casted on you"],
					values = self.SA_TYPE,
				},
				sourcecustomname = {
					type= 'input',
					order = 62,
					name = L["Custom source name"],
					desc = L["Example: If the spell came from a specific player or boss"],
					disabled = function() return not (sadb.custom[key].sourceuidfilter == "custom") end,
				},
				destuidfilter = {
					type = 'select',
					order = 65,
					name = L["Spell destination unit"],
					desc = L["Was the spell destination towards your target/focus/mouseover? (Leave on 'player' if it's yourself)"],
					values = self.SA_UNIT,
				},
				desttypefilter = {
					type = 'select',
					order = 63,
					name = L["Spell Destination"],
					desc = L["Who was afflicted by the spell? Leave it on 'any' if it's a spell cast or a buff"],
					values = self.SA_TYPE,
				},
				destcustomname = {
					type= 'input',
					order = 68,
					name = L["Custom destination name"],
					disabled = function() return not (sadb.custom[key].destuidfilter == "custom") end,
				},
				--[[NewLine5 = {
					type = 'header',
					order = 69,
					name = "",
				},]]
			}
		}
	end
	for key, v in pairs(sadb.custom) do
		makeoption(key)
	end
end