--Author: Kostya12rus
local ZChatWar = {}
ZChatWar.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
ZChatWar.optionEnable = Menu.AddOption({"Kostya12rus","Chat War"}, "Activate", "")
-- ZChatWar.NickAndItemseKey =     Menu.AddKeyOption({"Kostya12rus","MultiCheat",  "4 Nick And Items"}, "Fuck Key",Enum.ButtonCode.KEY_P)

--[[
Herotable = 
{
	NameKey =        Ник Игрока
	TeamKey =        Тригер на каманду в которой находиться игрок
	ValueStreakKey = Всего убийств без смертей
	RespawnTimeKey = Время до возрождения, если мертв
	OldStreakKey =   Счетчик для обновления
	TimeTick =       Время совершения последнего убийсва, отчет до нового, чтобы засчитал стрик
	BeenKill =       Тригер Срабатывает при убийстве
	Killtick =       Количество быстрых убийств подряд 
	Msgtick =        Тригер для вывода сообщения в чат
	HeroNamePlayer = Имя героя на котором играет игрок
}








]]

function ZChatWar.OnUpdate()
	if not Menu.IsEnabled(ZChatWar.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local NeedX = 1000
	local NeedY = 500
	local NeedX1 = 1000
	MyCour = 0
	EnCour = 0
	for i=1,NPCs.Count() do
		NA_Unit = NPCs.Get(i)
		if Entity.IsHero(NA_Unit) and Entity.IsPlayer(Entity.GetOwner(NA_Unit)) and not NPC.IsIllusion(NA_Unit) then
			if HeroDataInfo[NPC.GetUnitName(NA_Unit)] == nil then HeroDataInfo[NPC.GetUnitName(NA_Unit)] = {} end
			Herotable = HeroDataInfo[NPC.GetUnitName(NA_Unit)]
			Herotable[NameKey] = Player.GetName(Entity.GetOwner(NA_Unit))
			Herotable[TeamKey] = Entity.IsSameTeam(myHero, NA_Unit)
			Herotable[ValueStreakKey] = Player.GetTeamData(Entity.GetOwner(NA_Unit)).streak
			Herotable[RespawnTimeKey] = Player.GetTeamData(Entity.GetOwner(NA_Unit)).respawnTime
			Herotable[PlayerGameID] = Hero.GetPlayerID(NA_Unit)
			--Renderer.DrawTextCenteredX(ZChatWar.Font, 1000, NeedY, Herotable[PlayerGameID], 1)
			if Herotable[TimeTick] == nil then Herotable[TimeTick] = 9999999 end
			if Herotable[BeenKill] == nil then Herotable[BeenKill] = false end
			if Herotable[Killtick] == nil then Herotable[Killtick] = 0 end
			if Herotable[Msgtick] == nil then Herotable[Msgtick] = false end
			if Herotable[HeroNamePlayer] == nil then 
				for ConsoleName,DefName in pairs(HeroNameTable) do
					if ConsoleName == NPC.GetUnitName(NA_Unit) then
						Herotable[HeroNamePlayer] = DefName 
					end
				end
			end
			if (Herotable[ValueStreakKey] == 0 and Herotable[RespawnTimeKey] <= 0) or Herotable[OldStreakKey] == nil then
				Herotable[OldStreakKey] = 0
			end
			if Herotable[OldStreakKey] == 0 and Herotable[ValueStreakKey] >= 2 then
				Herotable[OldStreakKey] = Herotable[ValueStreakKey]
			end
			if Herotable[ValueStreakKey] > Herotable[OldStreakKey] then
				Herotable[OldStreakKey] = Herotable[OldStreakKey]+1
				Herotable[Killtick] = Herotable[Killtick]+1
				Herotable[BeenKill] = true
			end
			if Herotable[TimeTick] >= GameRules.GetGameTime() and Herotable[BeenKill] then
				Herotable[TimeTick] = GameRules.GetGameTime() + TimeStreak
				Herotable[BeenKill] = false
				Herotable[Msgtick] = true
			end
--[[	Сообщения для килл стриков		]]--
--[[]]	if Herotable[TimeTick]-GameRules.GetGameTime() <= TimeStreak-1 and Herotable[Msgtick] then 
--[[]]		if Herotable[Killtick] == 2 and kill2 then
--[[ДаблКилл]]	Engine.ExecuteCommand("say Красавчик "..Herotable[NameKey]..", сделал ДаблКил")
--[[]]			local kill2 = false
--[[]]		else
--[[]]			local kill2 = true
--[[]]		end
--[[]]		if Herotable[Killtick] == 3 and kill3 then
--[[ТриплКилл]]	Engine.ExecuteCommand("say Это трипл килл в исполнении "..Herotable[NameKey])
--[[]]			local kill3 = false
--[[]]		else 
--[[]]			local kill3 = true 
--[[]]		end
--[[]]		if Herotable[Killtick] == 4 and kill4 then
--[[УльтраКилл]]Engine.ExecuteCommand("say "..Herotable[NameKey]..", он пришел за рампагой")
--[[]]			local kill4 = false
--[[]]		else 
--[[]]			local kill4 = true 
--[[]]		end
--[[]]		if Herotable[Killtick] == 5 and kill5 then
--[[Рампага]]	Engine.ExecuteCommand("say Это рампага в исполнении "..Herotable[NameKey].." на "..Herotable[HeroNamePlayer]..", просто лайк")
--[[]]			local kill5 = false
--[[]]		else 
--[[]]			local kill5 = true 
--[[]]		end
--[[]]		if Herotable[Killtick] > 5 and kill6 then
--[[Больше]]	Engine.ExecuteCommand("say Остановите "..Herotable[NameKey]..", он просто ебанутый, сделал "..Herotable[Killtick].." килов подряд")
--[[  5   ]]	local kill6 = false
--[[киллов]]else 
--[[]]			local kill6 = true 
--[[]]		end
--[[]]		Herotable[Msgtick] = false
--[[]]	end
--[[-------------------------------------------------]]--
			if Herotable[TimeTick] < GameRules.GetGameTime() and not Herotable[BeenKill] then
				Herotable[Killtick] = 0
				Herotable[TimeTick]=Herotable[TimeTick]+1
			end
		end
		if NPC.IsCourier(NA_Unit) then
			if CourDataInfo[Entity.GetTeamNum(NA_Unit)] == nil then CourDataInfo[Entity.GetTeamNum(NA_Unit)] = {} end
			CourTable = CourDataInfo[Entity.GetTeamNum(NA_Unit)]
			CourTable[AliveKey] = Entity.IsAlive(NA_Unit)
			if CourTable[DeadValue] == nil then CourTable[DeadValue] = 0 end
			if CourTable[DeadTime] == nil then CourTable[DeadTime] = 0 end
			if CourTable[DeadTimeFlae] == nil then CourTable[DeadTimeFlae] = 0 end
			if CourTable[MyCour] == nil then CourTable[MyCour] = 0 end
			if CourTable[EnCour] == nil then CourTable[EnCour] = 0 end
			if CourTable[MyTeamCuer] == nil then CourTable[MyTeamCuer] = Entity.IsSameTeam(myHero, NA_Unit) end
			if Courier.IsFlyingCourier(NA_Unit) then
				if not Entity.IsAlive(NA_Unit) and (CourTable[DeadTimeFlae] <= GameRules.GetGameTime() or CourTable[DeadTimeFlae] < Courier.GetRespawnTime(NA_Unit)) and not Entity.IsDormant(NA_Unit) then
					CourTable[DeadValue] = CourTable[DeadValue] + 1
					CourTable[DeadTimeFlae] = Courier.GetRespawnTime(NA_Unit)+2
					CouerDead = true
				end
			else
				if not Entity.IsAlive(NA_Unit) and (CourTable[DeadTime] <= GameRules.GetGameTime() or CourTable[DeadTime]< Courier.GetRespawnTime(NA_Unit)) and not Entity.IsDormant(NA_Unit) then
					CourTable[DeadValue] = CourTable[DeadValue] + 1
					CourTable[DeadTime] = Courier.GetRespawnTime(NA_Unit)+2
					CouerDead = true
				end
			end
			CourTable[ItemKey] = ""
			itemrecept = false
			for j = 0, 9 do
				local item = NPC.GetItemByIndex(NA_Unit, j)
				if item and Entity.IsAbility(item) then
					if Ability.GetName(item):find("item_recipe_") then
						iteamname = Ability.GetName(item):gsub("item_recipe_","item_")
						itemrecept = true
					else
						iteamname = Ability.GetName(item)
					end
					for iteamconsole,nameitem in pairs(ItemNameTable) do
						if iteamname == iteamconsole then
							if itemrecept then
								CourTable[ItemKey] = CourTable[ItemKey] ..", рецепт от ".. nameitem
								itemrecept = false
							else
								CourTable[ItemKey] = CourTable[ItemKey] ..", ".. nameitem
							end
						end
					end
					CourTable[ItemTrig] = true
				end
				if j == 9 then
					if CourTable[ItemKey] == "" then
						CourTable[ItemTrig] = false
					end
				end
			end
--[[     Сообщения о мертвой куре	]]
--[[]]	if CouerDead then
--[[]]		if CourTable[MyTeamCuer] then
--[[]]			if CourTable[DeadValue] == 1 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Зачем вы убили куру там были" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Мне кажестся или мы проебали куру?")
--[[]]				end
--[[]]			elseif CourTable[DeadValue] == 2 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Сново кура умерла с нашими шмотками" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Как у нас так получаеться проебывать куру?")
--[[]]				end
--[[]]			elseif CourTable[DeadValue] == 3 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Он сливает куру когда она несет" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Кажеться пора кидать репорт, он ещё раз слил куру")
--[[]]				end
--[[]]			elseif CourTable[DeadValue] >= 4 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Пиздец.. В куре были" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Блять, этот далбоеб просто фидит курами, репорт")
--[[]]				end
--[[]]			end
--[[]]		else
--[[]]			if CourTable[DeadValue] == 1 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Кажеться кура умерла и кто то потерял" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Научитесь управлять курой")
--[[]]				end
--[[]]			elseif CourTable[DeadValue] == 2 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Ваша кура мерла с" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Вы заметили, что у вас кура сдохла?")
--[[]]				end
--[[]]			elseif CourTable[DeadValue] == 3 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Кура не донесла" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Скажите куре пока на 3 минуты")
--[[]]				end
--[[]]			elseif CourTable[DeadValue] >= 4 then
--[[]]				if CourTable[ItemTrig] then
--[[]]					Engine.ExecuteCommand("say Вы что фидить начали? Хоть выложите" .. CourTable[ItemKey])
--[[]]				else
--[[]]					Engine.ExecuteCommand("say Ещё больше курьеров ... ")
--[[]]				end
--[[]]			end
--[[]]		end
--[[]]			CouerDead = false
--[[]]		end
--[[]]	end
--[[---------------------------------------------------]]
	end
	-- for index,names in pairs(CourDataInfo) do
		-- if CourDataInfo[index] ~= nil then
			-- itemincor = CourDataInfo[index][ItemKey]
			-- Renderer.DrawTextCenteredX(ZChatWar.Font, 1000, 200, index .." | ".. names , 1)
		-- end
	-- end
end

function ZChatWar.init()
	HeroDataInfo = {}
	NameKey = 1
	TeamKey = 2
	ValueStreakKey = 3
	RespawnTimeKey = 4
	OldStreakKey = 5
	TimeTick = 6
	BeenKill = 7
	Killtick = 8
	Msgtick = 9
	HeroNamePlayer = 10
	PlayerGameID = 11
	-------------------
	CourDataInfo = {}
	AliveKey = 12
	ItemKey = 13
	ItemTrig = 14
	DeadValue = 15
	DeadTime = 16
	DeadTimeFlae = 17
	MyTeamCuer = 18
	-------------------
	TimeStreak = 18
	RespawnCourer = 181
	kill2 = true
	kill3 = true
	kill4 = true
	kill5 = true
	kill6 = true
	CouerDead = false
	HeroNameTable = {
 npc_dota_hero_abaddon = "Abaddon"
,npc_dota_hero_abyssal_underlord = "Abyssal Underlord"
,npc_dota_hero_alchemist = "Alchemist"
,npc_dota_hero_ancient_apparition = "Ancient Apparition"
,npc_dota_hero_antimage = "Anti-Mage"
,npc_dota_hero_arc_warden = "Arc Warden"
,npc_dota_hero_axe = "Axe"
,npc_dota_hero_bane = "Bane"
,npc_dota_hero_batrider = "Batrider"
,npc_dota_hero_beastmaster = "Beastmaster"
,npc_dota_hero_bloodseeker = "Bloodseeker"
,npc_dota_hero_bounty_hunter = "Bounty Hunter"
,npc_dota_hero_brewmaster = "Brewmaster"
,npc_dota_hero_bristleback = "Bristleback"
,npc_dota_hero_broodmother = "Broodmother"
,npc_dota_hero_centaur = "Centaur Warrunner"
,npc_dota_hero_chaos_knight = "Chaos Knight"
,npc_dota_hero_chen = "Chen"
,npc_dota_hero_clinkz = "Clinkz"
,npc_dota_hero_crystal_maiden = "Crystal Maiden"
,npc_dota_hero_dark_seer = "Dark Seer"
,npc_dota_hero_dazzle = "Dazzle"
,npc_dota_hero_death_prophet = "Death Prophet"
,npc_dota_hero_disruptor = "Disruptor"
,npc_dota_hero_doom_bringer = "Doom"
,npc_dota_hero_dragon_knight = "Dragon Knight"
,npc_dota_hero_drow_ranger = "Drow Ranger"
,npc_dota_hero_earth_spirit = "Earth Spirit"
,npc_dota_hero_earthshaker = "Earthshaker"
,npc_dota_hero_elder_titan = "Elder Titan"
,npc_dota_hero_ember_spirit = "Ember Spirit"
,npc_dota_hero_enchantress = "Enchantress"
,npc_dota_hero_enigma = "Enigma"
,npc_dota_hero_faceless_void = "Faceless Void"
,npc_dota_hero_furion = "Nature's Prophet"
,npc_dota_hero_gyrocopter = "Gyrocopter"
,npc_dota_hero_huskar = "Huskar"
,npc_dota_hero_invoker = "Invoker"
,npc_dota_hero_jakiro = "Jakiro"
,npc_dota_hero_juggernaut = "Juggernaut"
,npc_dota_hero_keeper_of_the_light = "Keeper of the Light"
,npc_dota_hero_kunkka = "Kunkka"
,npc_dota_hero_legion_commander = "Legion Commander"
,npc_dota_hero_leshrac = "Leshrac"
,npc_dota_hero_lich = "Lich"
,npc_dota_hero_life_stealer = "Lifestealer"
,npc_dota_hero_lina = "Lina"
,npc_dota_hero_lion = "Lion"
,npc_dota_hero_lone_druid = "Lone Druid"
,npc_dota_hero_luna = "Luna"
,npc_dota_hero_lycan = "Lycan"
,npc_dota_hero_magnataur = "Magnus"
,npc_dota_hero_medusa = "Medusa"
,npc_dota_hero_meepo = "Meepo"
,npc_dota_hero_mirana = "Mirana"
,npc_dota_hero_monkey_king = "Monkey King"
,npc_dota_hero_morphling = "Morphling"
,npc_dota_hero_naga_siren = "Naga Siren"
,npc_dota_hero_necrolyte = "Necrophos"
,npc_dota_hero_nevermore = "Shadow Fiend"
,npc_dota_hero_night_stalker = "Night Stalker"
,npc_dota_hero_nyx_assassin = "Nyx Assassin"
,npc_dota_hero_obsidian_destroyer = "Outworld Devourer"
,npc_dota_hero_ogre_magi = "Ogre Magi"
,npc_dota_hero_omniknight = "Omniknight"
,npc_dota_hero_oracle = "Oracle"
,npc_dota_hero_phantom_assassin = "Phantom Assassin"
,npc_dota_hero_phantom_lancer = "Phantom Lancer"
,npc_dota_hero_phoenix = "Phoenix"
,npc_dota_hero_puck = "Puck"
,npc_dota_hero_pudge = "Pudge"
,npc_dota_hero_pugna = "Pugna"
,npc_dota_hero_queenofpain = "Queen of Pain"
,npc_dota_hero_rattletrap = "Clockwerk"
,npc_dota_hero_razor = "Razor"
,npc_dota_hero_riki = "Riki"
,npc_dota_hero_rubick = "Rubick"
,npc_dota_hero_sand_king = "Sand King"
,npc_dota_hero_shadow_demon = "Shadow Demon"
,npc_dota_hero_shadow_shaman = "Shadow Shaman"
,npc_dota_hero_shredder = "Timbersaw"
,npc_dota_hero_silencer = "Silencer"
,npc_dota_hero_skeleton_king = "Wraith King"
,npc_dota_hero_skywrath_mage = "Skywrath Mage"
,npc_dota_hero_slardar = "Slardar"
,npc_dota_hero_slark = "Slark"
,npc_dota_hero_sniper = "Sniper"
,npc_dota_hero_spectre = "Spectre"
,npc_dota_hero_spirit_breaker = "Spirit Breaker"
,npc_dota_hero_storm_spirit = "Storm Spirit"
,npc_dota_hero_sven = "Sven"
,npc_dota_hero_techies = "Techies"
,npc_dota_hero_templar_assassin = "Templar Assassin"
,npc_dota_hero_terrorblade = "Terrorblade"
,npc_dota_hero_tidehunter = "Tidehunter"
,npc_dota_hero_tinker = "Tinker"
,npc_dota_hero_tiny = "Tiny"
,npc_dota_hero_treant = "Treant Protector"
,npc_dota_hero_troll_warlord = "Troll Warlord"
,npc_dota_hero_tusk = "Tusk"
,npc_dota_hero_undying = "Undying"
,npc_dota_hero_ursa = "Ursa"
,npc_dota_hero_vengefulspirit = "Vengeful Spirit"
,npc_dota_hero_venomancer = "Venomancer"
,npc_dota_hero_viper = "Viper"
,npc_dota_hero_visage = "Visage"
,npc_dota_hero_warlock = "Warlock"
,npc_dota_hero_weaver = "Weaver"
,npc_dota_hero_windrunner = "Windranger"
,npc_dota_hero_winter_wyvern = "Winter Wyvern"
,npc_dota_hero_wisp = "Io"
,npc_dota_hero_witch_doctor = "Witch Doctor"
,npc_dota_hero_zuus = "Zeus"
}
	ItemNameTable = 
{
 item_abyssal_blade = "Abyssal Blade"
,item_aegis = "Aegis of the Immortal"
,item_aether_lens = "Aether Lens"
,item_ancient_janggo = "Drum of Endurance"
,item_arcane_boots = "Arcane Boots"
,item_armlet = "Armlet of Mordiggian"
,item_assault = "Assault Cuirass"
,item_basher = "Skull Basher"
,item_belt_of_strength = "Belt of Strength"
,item_bfury = "Battle Fury"
,item_black_king_bar = "Black King Bar"
,item_blade_mail = "Blade Mail"
,item_blade_of_alacrity = "Blade of Alacrity"
,item_blades_of_attack = "Blades of Attack"
,item_blight_stone = "Blight Stone"
,item_blink = "Blink Dagger"
,item_bloodstone = "Bloodstone"
,item_bloodthorn = "Bloodthorn"
,item_boots = "Boots of Speed"
,item_boots_of_elves = "Band of Elvenskin"
,item_bottle = "Bottle"
,item_bracer = "Bracer"
,item_branches = "Iron Branch"
,item_broadsword = "Broadsword"
,item_buckler = "Buckler"
,item_butterfly = "Butterfly"
,item_chainmail = "Chainmail"
,item_cheese = "Cheese"
,item_circlet = "Circlet"
,item_clarity = "Clarity"
,item_claymore = "Claymore"
,item_cloak = "Cloak"
,item_courier = "Animal Courier"
,item_crimson_guard = "Crimson Guard"
,item_cyclone = "Eul's Scepter of Divinity"
,item_dagon = "Dagon"
,item_dagon_1 = "Dagon"
,item_dagon_2 = "Dagon2"
,item_dagon_3 = "Dagon3"
,item_dagon_4 = "Dagon4"
,item_dagon_5 = "Dagon5" 
,item_demon_edge = "Demon Edge"
,item_desolator = "Desolator"
,item_diffusal_blade = "Diffusal Blade"
,item_diffusal_blade_1 = "Diffusal Blade1"
,item_diffusal_blade_2 = "Diffusal Blade2"
,item_dragon_lance = "Dragon Lance"
,item_dust = "Dust of Appearance"
,item_eagle = "Eaglesong"
,item_echo_sabre = "Echo Sabre"
,item_enchanted_mango = "Enchanted Mango"
,item_energy_booster = "Energy Booster"
,item_ethereal_blade = "Ethereal Blade"
,item_faerie_fire = "Faerie Fire"
,item_flask = "Healing Salve"
,item_flying_courier = "Flying Courier"
,item_force_staff = "Force Staff"
,item_gauntlets = "Gauntlets of Strength"
,item_gem = "Gem of True Sight"
,item_ghost = "Ghost Scepter"
,item_glimmer_cape = "Glimmer Cape"
,item_gloves = "Gloves of Haste"
,item_greater_crit = "Daedalus"
,item_guardian_greaves = "Guardian Greaves"
,item_hand_of_midas = "Hand of Midas"
,item_headdress = "Headdress"
,item_heart = "Heart of Tarrasque"
,item_heavens_halberd = "Heaven's Halberd"
,item_helm_of_iron_will = "Helm of Iron Will"
,item_helm_of_the_dominator = "Helm of the Dominator"
,item_hood_of_defiance = "Hood of Defiance"
,item_hurricane_pike = "Hurricane Pike"
,item_hyperstone = "Hyperstone"
,item_infused_raindrop = "Infused Raindrop"
,item_invis_sword = "Shadow Blade"
,item_iron_talon = "Iron Talon"
,item_javelin = "Javelin"
,item_lesser_crit = "Crystalys"
,item_lifesteal = "Morbid Mask"
,item_lotus_orb = "Lotus Orb"
,item_maelstrom = "Maelstrom"
,item_magic_stick = "Magic Stick"
,item_magic_wand = "Magic Wand"
,item_manta = "Manta Style"
,item_mantle = "Mantle of Intelligence"
,item_mask_of_madness = "Mask of Madness"
,item_medallion_of_courage = "Medallion of Courage"
,item_mekansm = "Mekansm"
,item_mithril_hammer = "Mithril Hammer"
,item_mjollnir = "Mjollnir"
,item_monkey_king_bar = "Monkey King Bar"
,item_moon_shard = "Moon Shard"
,item_mystic_staff = "Mystic Staff"
,item_necronomicon = "Necronomicon"
,item_necronomicon_1 = "Necronomicon1"
,item_necronomicon_2 = "Necronomicon2"
,item_necronomicon_3 = "Necronomicon3"
,item_null_talisman = "Null Talisman"
,item_oblivion_staff = "Oblivion Staff"
,item_octarine_core = "Octarine Core"
,item_ogre_axe = "Ogre Club"
,item_orb_of_venom = "Orb of Venom"
,item_orchid = "Orchid Malevolence"
,item_pers = "Perseverance"
,item_phase_boots = "Phase Boots"
,item_pipe = "Pipe of Insight"
,item_platemail = "Platemail"
,item_point_booster = "Point Booster"
,item_poor_mans_shield = "Poor Man's Shield"
,item_power_treads = "Power Treads"
,item_quarterstaff = "Quarterstaff"
,item_quelling_blade = "Quelling Blade"
,item_radiance = "Radiance"
,item_rapier = "Divine Rapier"
,item_reaver = "Reaver"
,item_refresher = "Refresher Orb"
,item_relic = "Sacred Relic"
,item_ring_of_aquila = "Ring of Aquila"
,item_ring_of_basilius = "Ring of Basilius"
,item_ring_of_health = "Ring of Health"
,item_ring_of_protection = "Ring of Protection"
,item_ring_of_regen = "Ring of Regen"
,item_robe = "Robe of the Magi"
,item_rod_of_atos = "Rod of Atos"
,item_sange = "Sange"
,item_sange_and_yasha = "Sange and Yasha"
,item_satanic = "Satanic"
,item_shadow_amulet = "Shadow Amulet"
,item_sheepstick = "Scythe of Vyse"
,item_shivas_guard = "Shiva's Guard"
,item_silver_edge = "Silver Edge"
,item_skadi = "Eye of Skadi"
,item_slippers = "Slippers of Agility"
,item_smoke_of_deceit = "Smoke of Deceit"
,item_sobi_mask = "Sage's Mask"
,item_solar_crest = "Solar Crest"
,item_soul_booster = "Soul Booster"
,item_soul_ring = "Soul Ring"
,item_sphere = "Linken's Sphere"
,item_staff_of_wizardry = "Staff of Wizardry"
,item_stout_shield = "Stout Shield"
,item_talisman_of_evasion = "Talisman of Evasion"
,item_tango = "Tango"
,item_tango_single = "Tango (Shared)"
,item_tome_of_knowledge = "Tome of Knowledge"
,item_tpscroll = "Town Portal Scroll"
,item_tranquil_boots = "Tranquil Boots"
,item_travel_boots = "Boots of Travel"
,item_travel_boots_1 = "Boots of Travel1"
,item_travel_boots_2 = "Boots of Travel2"
,item_ultimate_orb = "Ultimate Orb"
,item_ultimate_scepter = "Aghanim's Scepter"
,item_urn_of_shadows = "Urn of Shadows"
,item_vanguard = "Vanguard"
,item_veil_of_discord = "Veil of Discord"
,item_vitality_booster = "Vitality Booster"
,item_vladmir = "Vladmir's Offering"
,item_void_stone = "Void Stone"
,item_ward_dispenser = "Observer and Sentry Wards"
,item_ward_observer = "Observer Ward"
,item_ward_sentry = "Sentry Ward"
,item_wind_lace = "Wind Lace"
,item_wraith_band = "Wraith Band"
,item_yasha = "Yasha"
}
end

function ZChatWar.OnGameStart()
  ZChatWar.init()
end
function ZChatWar.OnGameEnd()
  ZChatWar.init()
end
ZChatWar.init()
return ZChatWar