local AbilityInfo = {}
AbilityInfo.optionEnable = Menu.AddOption({"Awareness", "Bara Alert"}, "Activation", "")
AbilityInfo.ChatReport = Menu.AddOption({"Awareness", "Bara Alert"}, "Chat report", "")
AbilityInfo.Font = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)

function AbilityInfo.OnParticleCreate(particle)
	if not Menu.IsEnabled(AbilityInfo.optionEnable) then return end
	if particle.entity and not Entity.IsSameTeam(Heroes.GetLocal(),particle.entity) then
		temptable = {}
		if particle.name == "spirit_breaker_charge_start" then
			temptable = 
			{
				name = "spirit_breaker_charge_of_darkness",
				sourse = particle.entity,
				target = nil,
				timer = GameRules.GetGameTime() + 5,
				format = true,
				chat = 0,
				chattimer = GameRules.GetGameTime() + 0.1
			}
			table.insert(wellwellpel,temptable)
		end
	end
end

function AbilityInfo.OnUpdate()
	if not Menu.IsEnabled(AbilityInfo.optionEnable) then drawimg = false return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	for i,clear in pairs(wellwellpel) do
		if clear then
			if clear.timer <= GameRules.GetGameTime() then
				wellwellpel[i] = nil
			end
		end
	end
	for _,hero in pairs(NPCs.GetAll()) do
		if hero then
			if NPC.HasModifier(hero,"modifier_spirit_breaker_charge_of_darkness_vision") then
				for _,abbility in pairs(wellwellpel) do
					if abbility.name == "spirit_breaker_charge_of_darkness" and not abbility.target then
						abbility.target = hero
					end
				end
			end
		end
	end
	for i,hero in pairs(Heroes.GetAll()) do
		if hero then
			if not HeroImg[NPC.GetUnitName(hero)] then
				HeroImg[NPC.GetUnitName(hero)] = Renderer.LoadImage(string.gsub(heroIcon, "*", NPC.GetUnitName(hero)))
			end
		end
	end
	drawimg = true
end

function AbilityInfo.OnDraw()
	if not drawimg then return end
	for i,abil in pairs(wellwellpel) do
		if abil and abil.target and Entity.IsHero(abil.target) and Entity.IsHero(abil.sourse) then
			local skillIMG
			if HeroImg[abil.name] then
				skillIMG = HeroImg[abil.name]
			else
				HeroImg[abil.name] = Renderer.LoadImage(string.gsub(spellIconpath, "*", abil.name))
			end
			AbilityInfo.DrawInfo(HeroImg[NPC.GetUnitName(abil.sourse)],HeroImg[abil.name],HeroImg[NPC.GetUnitName(abil.target)],i,abil.format)
			if Menu.IsEnabled(AbilityInfo.ChatReport) and abil.name == "spirit_breaker_charge_of_darkness" then
				if (abil.chat == 0 or abil.chat == 1) and abil.chattimer <= GameRules.GetGameTime() then
					Engine.ExecuteCommand("say_team WARNING!!! " .. HeroNameTable[NPC.GetUnitName(abil.sourse)] .. " charge towards " .. HeroNameTable[NPC.GetUnitName(abil.target)]  )
					abil.chat = abil.chat + 1
					abil.chattimer = GameRules.GetGameTime() + 1
				end
			end
		end
	end
end


function AbilityInfo.DrawInfo(img1,img2,img3,index,formats)
	Renderer.SetDrawColor(255,255,255,255)
	local posx = math.ceil(size_x-backgroundsize*3)
	local posy = math.ceil(size_y-200-backgroundsize*1.1*index)
	Renderer.DrawImage(blankcard,posx,posy,backgroundsize*3,backgroundsize)
	
	local imgposx1 = math.ceil(posx+backgroundsize*0.32)
	local imgposy1 = math.ceil(posy + (backgroundsize-imgsize)/2)
	Renderer.DrawImage(img1,imgposx1,imgposy1,math.ceil(imgsize*0.90),imgsize)
	
	local imgsize2 = math.ceil(imgsize*0.75)
	local imgposx2 = math.ceil(posx+(backgroundsize*3)/2-imgsize2/2)
	local imgposy2 = math.ceil(posy + (backgroundsize-imgsize2)/2)
	Renderer.DrawImage(img2,imgposx2,imgposy2,imgsize2,imgsize2)
	
	if formats then
		local imgposx3 = math.ceil(posx+backgroundsize*2)
		local imgposy3 = math.ceil(posy + (backgroundsize-imgsize)/2)
		Renderer.DrawImage(img3,imgposx3,imgposy3,math.ceil(imgsize*0.90),imgsize)
	else
		local imgposx3 = math.ceil(posx+backgroundsize*2)
		local imgposy3 = math.ceil(posy + (backgroundsize-imgsize)/2)
		Renderer.DrawImage(img3,imgposx3,imgposy3,imgsize,imgsize)
	end
end

function AbilityInfo.init()
	blankcard = Renderer.LoadImage('panorama/images/weekend_tourney/battle_cup_tooltip_backer_champions_fall_psd.vtex_c')
	heroIcon = "panorama/images/heroes/selection/*_png.vtex_c"
	spellIconpath = "panorama/images/spellicons/*_png.vtex_c"
	HeroImg = {}
	bara = false
	timing = 0
	backgroundsize = 88
	imgsize = math.ceil(backgroundsize*0.75)
	size_x, size_y = Renderer.GetScreenSize()
	drawimg = false
	wellwellpel = {}
	abilitykekas = 
	{
		"spirit_breaker_charge_start",
		"rubick_cast_spell_steal"
	}
	HeroNameTable = {}
	HeroNameTable["npc_dota_hero_abaddon"] = "Abaddon"
	HeroNameTable["npc_dota_hero_abyssal_underlord"] = "Abyssal Underlord"
	HeroNameTable["npc_dota_hero_alchemist"] = "Alchemist"
	HeroNameTable["npc_dota_hero_ancient_apparition"] = "Ancient Apparition"
	HeroNameTable["npc_dota_hero_antimage"] = "Anti-Mage"
	HeroNameTable["npc_dota_hero_arc_warden"] = "Arc Warden"
	HeroNameTable["npc_dota_hero_axe"] = "Axe"
	HeroNameTable["npc_dota_hero_bane"] = "Bane"
	HeroNameTable["npc_dota_hero_batrider"] = "Batrider"
	HeroNameTable["npc_dota_hero_beastmaster"] = "Beastmaster"
	HeroNameTable["npc_dota_hero_bloodseeker"] = "Bloodseeker"
	HeroNameTable["npc_dota_hero_bounty_hunter"] = "Bounty Hunter"
	HeroNameTable["npc_dota_hero_brewmaster"] = "Brewmaster"
	HeroNameTable["npc_dota_hero_bristleback"] = "Bristleback"
	HeroNameTable["npc_dota_hero_broodmother"] = "Broodmother"
	HeroNameTable["npc_dota_hero_centaur"] = "Centaur Warrunner"
	HeroNameTable["npc_dota_hero_chaos_knight"] = "Chaos Knight"
	HeroNameTable["npc_dota_hero_chen"] = "Chen"
	HeroNameTable["npc_dota_hero_clinkz"] = "Clinkz"
	HeroNameTable["npc_dota_hero_crystal_maiden"] = "Crystal Maiden"
	HeroNameTable["npc_dota_hero_dark_seer"] = "Dark Seer"
	HeroNameTable["npc_dota_hero_dazzle"] = "Dazzle"
	HeroNameTable["npc_dota_hero_death_prophet"] = "Death Prophet"
	HeroNameTable["npc_dota_hero_disruptor"] = "Disruptor"
	HeroNameTable["npc_dota_hero_doom_bringer"] = "Doom"
	HeroNameTable["npc_dota_hero_dragon_knight"] = "Dragon Knight"
	HeroNameTable["npc_dota_hero_drow_ranger"] = "Drow Ranger"
	HeroNameTable["npc_dota_hero_earth_spirit"] = "Earth Spirit"
	HeroNameTable["npc_dota_hero_earthshaker"] = "Earthshaker"
	HeroNameTable["npc_dota_hero_elder_titan"] = "Elder Titan"
	HeroNameTable["npc_dota_hero_ember_spirit"] = "Ember Spirit"
	HeroNameTable["npc_dota_hero_enchantress"] = "Enchantress"
	HeroNameTable["npc_dota_hero_enigma"] = "Enigma"
	HeroNameTable["npc_dota_hero_faceless_void"] = "Faceless Void"
	HeroNameTable["npc_dota_hero_furion"] = "Nature's Prophet"
	HeroNameTable["npc_dota_hero_gyrocopter"] = "Gyrocopter"
	HeroNameTable["npc_dota_hero_huskar"] = "Huskar"
	HeroNameTable["npc_dota_hero_invoker"] = "Invoker"
	HeroNameTable["npc_dota_hero_jakiro"] = "Jakiro"
	HeroNameTable["npc_dota_hero_juggernaut"] = "Juggernaut"
	HeroNameTable["npc_dota_hero_keeper_of_the_light"] = "Keeper of the Light"
	HeroNameTable["npc_dota_hero_kunkka"] = "Kunkka"
	HeroNameTable["npc_dota_hero_legion_commander"] = "Legion Commander"
	HeroNameTable["npc_dota_hero_leshrac"] = "Leshrac"
	HeroNameTable["npc_dota_hero_lich"] = "Lich"
	HeroNameTable["npc_dota_hero_life_stealer"] = "Lifestealer"
	HeroNameTable["npc_dota_hero_lina"] = "Lina"
	HeroNameTable["npc_dota_hero_lion"] = "Lion"
	HeroNameTable["npc_dota_hero_lone_druid"] = "Lone Druid"
	HeroNameTable["npc_dota_hero_luna"] = "Luna"
	HeroNameTable["npc_dota_hero_lycan"] = "Lycan"
	HeroNameTable["npc_dota_hero_magnataur"] = "Magnus"
	HeroNameTable["npc_dota_hero_medusa"] = "Medusa"
	HeroNameTable["npc_dota_hero_meepo"] = "Meepo"
	HeroNameTable["npc_dota_hero_mirana"] = "Mirana"
	HeroNameTable["npc_dota_hero_monkey_king"] = "Monkey King"
	HeroNameTable["npc_dota_hero_morphling"] = "Morphling"
	HeroNameTable["npc_dota_hero_naga_siren"] = "Naga Siren"
	HeroNameTable["npc_dota_hero_necrolyte"] = "Necrophos"
	HeroNameTable["npc_dota_hero_nevermore"] = "Shadow Fiend"
	HeroNameTable["npc_dota_hero_night_stalker"] = "Night Stalker"
	HeroNameTable["npc_dota_hero_nyx_assassin"] = "Nyx Assassin"
	HeroNameTable["npc_dota_hero_obsidian_destroyer"] = "Outworld Devourer"
	HeroNameTable["npc_dota_hero_ogre_magi"] = "Ogre Magi"
	HeroNameTable["npc_dota_hero_omniknight"] = "Omniknight"
	HeroNameTable["npc_dota_hero_oracle"] = "Oracle"
	HeroNameTable["npc_dota_hero_phantom_assassin"] = "Phantom Assassin"
	HeroNameTable["npc_dota_hero_phantom_lancer"] = "Phantom Lancer"
	HeroNameTable["npc_dota_hero_phoenix"] = "Phoenix"
	HeroNameTable["npc_dota_hero_puck"] = "Puck"
	HeroNameTable["npc_dota_hero_pudge"] = "Pudge"
	HeroNameTable["npc_dota_hero_pugna"] = "Pugna"
	HeroNameTable["npc_dota_hero_queenofpain"] = "Queen of Pain"
	HeroNameTable["npc_dota_hero_rattletrap"] = "Clockwerk"
	HeroNameTable["npc_dota_hero_razor"] = "Razor"
	HeroNameTable["npc_dota_hero_riki"] = "Riki"
	HeroNameTable["npc_dota_hero_rubick"] = "Rubick"
	HeroNameTable["npc_dota_hero_sand_king"] = "Sand King"
	HeroNameTable["npc_dota_hero_shadow_demon"] = "Shadow Demon"
	HeroNameTable["npc_dota_hero_shadow_shaman"] = "Shadow Shaman"
	HeroNameTable["npc_dota_hero_shredder"] = "Timbersaw"
	HeroNameTable["npc_dota_hero_silencer"] = "Silencer"
	HeroNameTable["npc_dota_hero_skeleton_king"] = "Wraith King"
	HeroNameTable["npc_dota_hero_skywrath_mage"] = "Skywrath Mage"
	HeroNameTable["npc_dota_hero_slardar"] = "Slardar"
	HeroNameTable["npc_dota_hero_slark"] = "Slark"
	HeroNameTable["npc_dota_hero_sniper"] = "Sniper"
	HeroNameTable["npc_dota_hero_spectre"] = "Spectre"
	HeroNameTable["npc_dota_hero_spirit_breaker"] = "Spirit Breaker"
	HeroNameTable["npc_dota_hero_storm_spirit"] = "Storm Spirit"
	HeroNameTable["npc_dota_hero_sven"] = "Sven"
	HeroNameTable["npc_dota_hero_techies"] = "Techies"
	HeroNameTable["npc_dota_hero_templar_assassin"] = "Templar Assassin"
	HeroNameTable["npc_dota_hero_terrorblade"] = "Terrorblade"
	HeroNameTable["npc_dota_hero_tidehunter"] = "Tidehunter"
	HeroNameTable["npc_dota_hero_tinker"] = "Tinker"
	HeroNameTable["npc_dota_hero_tiny"] = "Tiny"
	HeroNameTable["npc_dota_hero_treant"] = "Treant Protector"
	HeroNameTable["npc_dota_hero_troll_warlord"] = "Troll Warlord"
	HeroNameTable["npc_dota_hero_tusk"] = "Tusk"
	HeroNameTable["npc_dota_hero_undying"] = "Undying"
	HeroNameTable["npc_dota_hero_ursa"] = "Ursa"
	HeroNameTable["npc_dota_hero_vengefulspirit"] = "Vengeful Spirit"
	HeroNameTable["npc_dota_hero_venomancer"] = "Venomancer"
	HeroNameTable["npc_dota_hero_viper"] = "Viper"
	HeroNameTable["npc_dota_hero_visage"] = "Visage"
	HeroNameTable["npc_dota_hero_warlock"] = "Warlock"
	HeroNameTable["npc_dota_hero_weaver"] = "Weaver"
	HeroNameTable["npc_dota_hero_windrunner"] = "Windranger"
	HeroNameTable["npc_dota_hero_winter_wyvern"] = "Winter Wyvern"
	HeroNameTable["npc_dota_hero_wisp"] = "Io"
	HeroNameTable["npc_dota_hero_witch_doctor"] = "Witch Doctor"
	HeroNameTable["npc_dota_hero_zuus"] = "Zeus"
	HeroNameTable["npc_dota_hero_dark_willow"] = "Dark Willow"
	HeroNameTable["npc_dota_hero_pangolier"] = "Pangolier"
end

function AbilityInfo.OnGameStart()
  AbilityInfo.init()
end

function AbilityInfo.OnGameEnd()
  AbilityInfo.init()
end
AbilityInfo.init()

return AbilityInfo
