-- Author: paroxysm
-- Version: 2
-- Updated: 20.02.2017
local Radar = {}

Radar.Enabled = Menu.AddOption({ "Utility","Radar" }, "Enabled", "")
Radar.Key = Menu.AddKeyOption({ "Utility", "Radar" }, "Key", Enum.ButtonCode.KEY_F)
Radar.Display = Menu.AddOption({ "Utility","Radar" }, "Mode", "", 1, 3)
Radar.Friend = Menu.AddOption({ "Utility","Radar" }, "Display Aly", "")
Radar.IconPath = "resource/flash3/images/miniheroes/"
Radar.Icons = {}
Menu.SetValueName(Radar.Display, 1, "Point")
Menu.SetValueName(Radar.Display, 2, "Name")
Menu.SetValueName(Radar.Display, 3, "Icon")

Radar.alert = Menu.AddOption({ "Utility","Radar", "Notice" }, "Notice on enemy near you", "")
Radar.alertradius = Menu.AddOption({ "Utility","Radar", "Notice" }, "Notice radius", "", 400,2000, 100)


Menu.AddOption({ "Utility","Radar" }, "Version", "Author: Paroxysm", 2, 2, 1)




Radar.Font = Renderer.LoadFont("Arial", 10 , Enum.FontWeight.EXTRABOLD)
Radar.IsOpen = false
Radar.Radius = 5
Radar.Colors =	{	
					[0]	= { ["0"] = 51,	["1"] = 117,	["2"] = 255,	["3"] = 255 }, 
					[1]	= { ["0"] = 102,	["1"] = 255,	["2"] = 191,	["3"] = 255 },
					[2]	= { ["0"] = 191,	["1"] = 0,	["2"] = 191,	["3"] = 255 },
					[3]	= { ["0"] = 243,	["1"] = 240,	["2"] = 11,	["3"] = 255 },
					[4]	= { ["0"] = 255,	["1"] = 107,	["2"] = 0,	["3"] = 255 },
					[5]	= { ["0"] = 254,	["1"] = 134,	["2"] = 194,	["3"] = 255 }, 
					[6]	= { ["0"] = 161,	["1"] = 180,	["2"] = 71,	["3"] = 255 },
					[7]	= { ["0"] = 101,	["1"] = 217,	["2"] = 247,	["3"] = 255 },
					[8]	= { ["0"] = 0,	["1"] = 131,	["2"] = 33,	["3"] = 255 },
					[9]	= { ["0"] = 164,	["1"] = 105,	["2"] = 0,	["3"] = 255 },
					[10]	= { ["0"] = 255,	["1"] = 255,	["2"] = 255,	["3"] = 255 }
				}

Radar.heroes = {}
Radar.heroes["npc_dota_hero_abaddon"] = "Abaddon"
Radar.heroes["npc_dota_hero_alchemist"] = "Alchemist"
Radar.heroes["npc_dota_hero_antimage"] = "Anti-Mage"
Radar.heroes["npc_dota_hero_ancient_apparition"] = "Ancient Apparition"
Radar.heroes["npc_dota_hero_arcwarden"] = "Arc Warden"
Radar.heroes["npc_dota_hero_axe"] = "Axe"
Radar.heroes["npc_dota_hero_bane"] = "Bane"
Radar.heroes["npc_dota_hero_batrider"] = "Batrider"
Radar.heroes["npc_dota_hero_beastmaster"] = "Beastmaster"
Radar.heroes["npc_dota_hero_bloodseeker"] = "Bloodseeker"
Radar.heroes["npc_dota_hero_bounty_hunter"] = "Bounty Hunter"
Radar.heroes["npc_dota_hero_brewmaster"] = "Brewmaster"
Radar.heroes["npc_dota_hero_bristleback"] = "Bristleback"
Radar.heroes["npc_dota_hero_broodmother"] = "Broodmother"
Radar.heroes["npc_dota_hero_centaur"] = "Centaur Warrunner"
Radar.heroes["npc_dota_hero_chaos_knight"] = "Chaos Knight"
Radar.heroes["npc_dota_hero_chen"] = "Chen"
Radar.heroes["npc_dota_hero_clinkz"] = "Clinkz"
Radar.heroes["npc_dota_hero_rattletrap"] = "Clockwerk"
Radar.heroes["npc_dota_hero_crystal_maiden"] = "Crystal Maiden"
Radar.heroes["npc_dota_hero_dark_seer"] = "Dark Seer"
Radar.heroes["npc_dota_hero_dazzle"] = "Dazzle"
Radar.heroes["npc_dota_hero_death_prophet"] = "Death Prophet"
Radar.heroes["npc_dota_hero_disruptor"] = "Disruptor"
Radar.heroes["npc_dota_hero_doom_bringer"] = "Doom"
Radar.heroes["npc_dota_hero_dragon_knight"] = "Dragon Knight"
Radar.heroes["npc_dota_hero_drow_ranger"] = "Drow Ranger"
Radar.heroes["npc_dota_hero_earth_spirit"] = "Earth Spirit"
Radar.heroes["npc_dota_hero_earthshaker"] = "Earthshaker"
Radar.heroes["npc_dota_hero_elder_titan"] = "Elder Titan"
Radar.heroes["npc_dota_hero_ember_spirit"] = "Ember Spirit"
Radar.heroes["npc_dota_hero_enchantress"] = "Enchantress"
Radar.heroes["npc_dota_hero_enigma"] = "Enigma"
Radar.heroes["npc_dota_hero_faceless_void"] = "Faceless Void"
Radar.heroes["npc_dota_hero_gyrocopter"] = "Gyrocopter"
Radar.heroes["npc_dota_hero_huskar"] = "Huskar"
Radar.heroes["npc_dota_hero_invoker"] = "Invoker"
Radar.heroes["npc_dota_hero_wisp"] = "Io"
Radar.heroes["npc_dota_hero_jakiro"] = "Jakiro"
Radar.heroes["npc_dota_hero_juggernaut"] = "Juggernaut"
Radar.heroes["npc_dota_hero_keeper_of_the_light"] = "Keeper of the Light"
Radar.heroes["npc_dota_hero_kunkka"] = "Kunkka"
Radar.heroes["npc_dota_hero_legion_commander"] = "Legion Commander"
Radar.heroes["npc_dota_hero_leshrac"] = "Leshrac"
Radar.heroes["npc_dota_hero_lich"] = "Lich"
Radar.heroes["npc_dota_hero_life_stealer"] = "Lifestealer"
Radar.heroes["npc_dota_hero_lina"] = "Lina"
Radar.heroes["npc_dota_hero_lion"] = "Lion"
Radar.heroes["npc_dota_hero_lone_druid"] = "Lone Druid"
Radar.heroes["npc_dota_hero_luna"] = "Luna"
Radar.heroes["npc_dota_hero_lycan"] = "Lycan"
Radar.heroes["npc_dota_hero_magnataur"] = "Magnus"
Radar.heroes["npc_dota_hero_medusa"] = "Medusa"
Radar.heroes["npc_dota_hero_meepo"] = "Meepo"
Radar.heroes["npc_dota_hero_mirana"] = "Mirana"
Radar.heroes["npc_dota_hero_morphling"] = "Morphling"
Radar.heroes["npc_dota_hero_monkey_king"] = "Monkey King"
Radar.heroes["npc_dota_hero_naga_siren"] = "Naga Siren"
Radar.heroes["npc_dota_hero_furion"] = "Nature's Prophet"
Radar.heroes["npc_dota_hero_necrolyte"] = "Necrophos"
Radar.heroes["npc_dota_hero_night_stalker"] = "Night Stalker"
Radar.heroes["npc_dota_hero_nyx_assassin"] = "Nyx Assassin"
Radar.heroes["npc_dota_hero_ogre_magi"] = "Ogre Magi"
Radar.heroes["npc_dota_hero_omniknight"] = "Omniknight"
Radar.heroes["npc_dota_hero_oracle"] = "Oracle"
Radar.heroes["npc_dota_hero_obsidian_destroyer"] = "Outworld Devourer"
Radar.heroes["npc_dota_hero_phantom_assassin"] = "Phantom Assassin"
Radar.heroes["npc_dota_hero_phantom_lancer"] = "Phantom Lancer"
Radar.heroes["npc_dota_hero_phoenix"] = "Phoenix"
Radar.heroes["npc_dota_hero_puck"] = "Puck"
Radar.heroes["npc_dota_hero_pudge"] = "Pudge"
Radar.heroes["npc_dota_hero_pugna"] = "Pugna"
Radar.heroes["npc_dota_hero_queenofpain"] = "Queen of Pain"
Radar.heroes["npc_dota_hero_razor"] = "Razor"
Radar.heroes["npc_dota_hero_riki"] = "Riki"
Radar.heroes["npc_dota_hero_rubick"] = "Rubick"
Radar.heroes["npc_dota_hero_sand_king"] = "Sand King"
Radar.heroes["npc_dota_hero_shadow_demon"] = "Shadow Demon"
Radar.heroes["npc_dota_hero_nevermore"] = "Shadow Fiend"
Radar.heroes["npc_dota_hero_shadow_shaman"] = "Shadow Shaman"
Radar.heroes["npc_dota_hero_silencer"] = "Silencer"
Radar.heroes["npc_dota_hero_skywrath_mage"] = "Skywrath Mage"
Radar.heroes["npc_dota_hero_slardar"] = "Slardar"
Radar.heroes["npc_dota_hero_slark"] = "Slark"
Radar.heroes["npc_dota_hero_sniper"] = "Sniper"
Radar.heroes["npc_dota_hero_spectre"] = "Spectre"
Radar.heroes["npc_dota_hero_spirit_breaker"] = "Spirit Breaker"
Radar.heroes["npc_dota_hero_storm_spirit"] = "Storm Spirit"
Radar.heroes["npc_dota_hero_sven"] = "Sven"
Radar.heroes["npc_dota_hero_techies"] = "Techies"
Radar.heroes["npc_dota_hero_templar_assassin"] = "Templar Assassin"
Radar.heroes["npc_dota_hero_terrorblade"] = "Terrorblade"
Radar.heroes["npc_dota_hero_tidehunter"] = "Tidehunter"
Radar.heroes["npc_dota_hero_shredder"] = "Timbersaw"
Radar.heroes["npc_dota_hero_tinker"] = "Tinker"
Radar.heroes["npc_dota_hero_tiny"] = "Tiny"
Radar.heroes["npc_dota_hero_treant"] = "Treant Protector"
Radar.heroes["npc_dota_hero_troll_warlord"] = "Troll Warlord"
Radar.heroes["npc_dota_hero_tusk"] = "Tusk"
Radar.heroes["npc_dota_hero_abyssal_underlord"] = "Underlord"
Radar.heroes["npc_dota_hero_undying"] = "Undying"
Radar.heroes["npc_dota_hero_ursa"] = "Ursa"
Radar.heroes["npc_dota_hero_vengefulspirit"] = "Vengeful Spirit"
Radar.heroes["npc_dota_hero_venomancer"] = "Venomancer"
Radar.heroes["npc_dota_hero_viper"] = "Viper"
Radar.heroes["npc_dota_hero_visage"] = "Visage"
Radar.heroes["npc_dota_hero_warlock"] = "Warlock"
Radar.heroes["npc_dota_hero_weaver"] = "Weaver"
Radar.heroes["npc_dota_hero_windrunner"] = "Windranger"
Radar.heroes["npc_dota_hero_winter_wyvern"] = "Winter Wyvern"
Radar.heroes["npc_dota_hero_witch_doctor"] = "Witch Doctor"
Radar.heroes["npc_dota_hero_skeleton_king"] = "Wraith King"
Radar.heroes["npc_dota_hero_zuus"] = "Zeus"


function Radar.OnUpdate()

	if Menu.IsKeyDownOnce(Radar.Key) and Menu.IsEnabled(Radar.Enabled) then 	
		if Radar.IsOpen then Radar.IsOpen = false
		else Radar.IsOpen = true end
	end
	
end

function Radar.OnDraw()
	if Radar.IsOpen then 
		local myHero = Heroes.GetLocal()
		if myHero == nil then return end
		local myTeam = Entity.GetTeamNum( myHero )

		Renderer.SetDrawColor(0, 0, 0, 255)
		Renderer.DrawFilledRect(10, 115, 155, 150 )
		for i = 1, Heroes.Count() do
			local hero = Heroes.Get(i)
			if Menu.IsEnabled(Radar.Friend) or not Entity.IsSameTeam(myHero, hero) or hero == myHero
			then
				local subx = 10 + (153 / 2) + math.floor(Entity.GetOrigin(hero):GetX() / 100)
				local suby = 120 + ((146 / 2) - math.floor(Entity.GetOrigin(hero):GetY() / 100))
				local id = Hero.GetPlayerID(hero)
				if id > 9 then id = 10 end
				Draw(Radar.Colors[id],subx,suby, hero)
			end
		end
	end
	
	if Menu.IsEnabled(Radar.alert) then
		local myHero = Heroes.GetLocal()
		if myHero == nil then return end
		
		local temp = NPC.GetHeroesInRadius(myHero, Menu.GetValue(Radar.alertradius), Enum.TeamType.TEAM_ENEMY)
		if Length(temp) > 0 then
			Renderer.SetDrawColor(255, 30, 0, 255)
			Renderer.DrawFilledRect(0, 0, Renderer.GetScreenSize(), 5)
		end
	end
end


function Draw(color, subx, suby, hero)
	if Menu.GetValue(Radar.Display) == 1 then
		Renderer.SetDrawColor(color["0"], color["1"], color["2"], color["3"])
		Renderer.DrawFilledRect( math.floor(subx - 2), math.floor(suby - 2), 5, 5 )
	elseif Menu.GetValue(Radar.Display) == 2 then
		Renderer.SetDrawColor(color["0"], color["1"], color["2"], color["3"])
		Renderer.DrawTextCentered(Radar.Font, math.floor(subx), math.floor(suby), Radar.heroes[NPC.GetUnitName(hero)], false)
	else 
		local tempName = NPC.GetUnitName(hero)
		tempName = tempName:gsub("npc_dota_hero_", "")
		local imageHandle = Radar.Icons[tempName]
		if imageHandle == nil then
			imageHandle = Renderer.LoadImage(Radar.IconPath .. tempName .. ".png")
			Radar.Icons[tempName] = imageHandle
		end
		Renderer.SetDrawColor(255, 255, 255, 255)
		Renderer.DrawImage(imageHandle, math.floor(subx - 8), math.floor(suby - 8), 16, 16)
	end
end


function Length(t)
	count = 0
	for k,v in pairs(t) do
		 count = count + 1
	end
	
	return count
end

return Radar