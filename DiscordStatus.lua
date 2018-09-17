local DiscordHack = {}

function DiscordHack.OnDraw()

  local State = Config.ReadString("ForDiscord", "State", "nil")
  local Details = Config.ReadString("ForDiscord", "Details", "nil")
  local SmallImage = Config.ReadString("ForDiscord", "SmallImage", "nil")
  local SmallImageTooltip = Config.ReadString("ForDiscord", "SmallImageTooltip", "nil")

  local textforState = DiscordHack.Gamestate()
  if textforState ~= State then
    Config.WriteString("ForDiscord", "State", textforState)
  end

  local textmode = DiscordHack.GameMode()
  if Details ~= textmode then
    Config.WriteString("ForDiscord", "Details", textmode)
  end

  if Heroes.GetLocal() then
    if NPC.GetUnitName(Heroes.GetLocal()) ~= SmallImage then
      Config.WriteString("ForDiscord", "SmallImage", NPC.GetUnitName(Heroes.GetLocal()))
    end
    
    local kda = "0|0|0"
    if Players.GetLocal() then
      kda = Player.GetTeamData(Players.GetLocal()).kills .. "|" .. Player.GetTeamData(Players.GetLocal()).deaths .. "|" .. Player.GetTeamData(Players.GetLocal()).assists
    end
    Config.WriteString("ForDiscord", "SmallImageTooltip", DiscordHack.HeroNameTable[NPC.GetUnitName(Heroes.GetLocal())] .. " (KDA - " .. kda .. ")")
  end
  if not Engine.IsInGame() then
    if SmallImage ~= "close" then
      Config.WriteString("ForDiscord", "SmallImage", "close")
    end
    if SmallImageTooltip ~= "В главном меню" then
      Config.WriteString("ForDiscord", "SmallImageTooltip", "В главном меню")
    end
  end
end

function DiscordHack.GameMode()
  local textmode = "В главном меню"
  if GameRules.GetGameMode() then
    if GameRules.GetGameMode() == -1 then
      textmode = "В главном меню"
    elseif GameRules.GetGameMode() == 1 then
      textmode = "All Pick"
    elseif GameRules.GetGameMode() == 2 then
      textmode = "Captains Mode"
    elseif GameRules.GetGameMode() == 3 then
      textmode = "Random Draft"
    elseif GameRules.GetGameMode() == 4 then
      textmode = "Single Draft"
    elseif GameRules.GetGameMode() == 5 then
      textmode = "All Random"
    elseif GameRules.GetGameMode() == 8 then
      textmode = "Reverse Captains Mode"
    elseif GameRules.GetGameMode() == 11 then
      textmode = "Mid Only"
    elseif GameRules.GetGameMode() == 12 then
      textmode = "Least Played"
    elseif GameRules.GetGameMode() == 15 then
      textmode = "Testing Hero"
    elseif GameRules.GetGameMode() == 16 then
      textmode = "Captains Draft"
    elseif GameRules.GetGameMode() == 18 then
      textmode = "Ability Draft"
    elseif GameRules.GetGameMode() == 20 then
      textmode = "All Random Deathmatch"
    elseif GameRules.GetGameMode() == 21 then
      textmode = "1V1 Solo Mid"
    elseif GameRules.GetGameMode() == 22 then
      textmode = "All Pick - Рейтинговый"
    elseif GameRules.GetGameMode() == 23 then
      textmode = "Turbo"
    elseif GameRules.GetGameMode() == 24 then
      textmode = "Mutation"
    end
  end
  return textmode
end

function DiscordHack.Gamestate()
  local textforState = "Поиск игры"
  if GameRules.GetGameState() then
    if GameRules.GetGameState() == -1 then
      textforState = "Поиск игры"
    elseif GameRules.GetGameState() == 0 then
      textforState = "Загрузка в игру"
    elseif GameRules.GetGameState() == 1 then
      textforState = "Ожидание игроков"
    elseif GameRules.GetGameState() == 2 then
      textforState = "Выбор героев"
    elseif GameRules.GetGameState() == 3 then
      textforState = "Стадия планирования"
    elseif GameRules.GetGameState() == 4 then
      textforState = "Начало матча"
    elseif GameRules.GetGameState() == 5 then
      if Heroes.GetLocal() then
        textforState = DiscordHack.TimeSecToNormal(GameRules.GetGameTime() - GameRules.GetGameStartTime()) .. " - " .. DiscordHack.HeroNameTable[NPC.GetUnitName(Heroes.GetLocal())]  .. " (" .. NPC.GetCurrentLevel(Heroes.GetLocal()) .. " lvl)"
      else
        textforState = "Просмотр матча" .. " " .. DiscordHack.TimeSecToNormal(GameRules.GetGameTime() - GameRules.GetGameStartTime())
      end
    elseif GameRules.GetGameState() == 6 then
      textforState = "Игра завершена"
    end
  end
  return textforState
end

function DiscordHack.TimeSecToNormal(time)
  if time then
      local string = ""
      if time%60 < 10 then
          string = math.floor(time/60) .. ":0" .. math.floor(time%60)
      else
          string =  math.floor(time/60) .. ":" .. math.floor(time%60)
      end
      return string
  end
end

do
  DiscordHack.HeroNameTable = {}
  DiscordHack.HeroNameTable["npc_dota_hero_abaddon"] = "Abaddon"
  DiscordHack.HeroNameTable["npc_dota_hero_abyssal_underlord"] = "Abyssal Underlord"
  DiscordHack.HeroNameTable["npc_dota_hero_alchemist"] = "Alchemist"
  DiscordHack.HeroNameTable["npc_dota_hero_ancient_apparition"] = "Ancient Apparition"
  DiscordHack.HeroNameTable["npc_dota_hero_antimage"] = "Anti-Mage"
  DiscordHack.HeroNameTable["npc_dota_hero_arc_warden"] = "Arc Warden"
  DiscordHack.HeroNameTable["npc_dota_hero_axe"] = "Axe"
  DiscordHack.HeroNameTable["npc_dota_hero_bane"] = "Bane"
  DiscordHack.HeroNameTable["npc_dota_hero_batrider"] = "Batrider"
  DiscordHack.HeroNameTable["npc_dota_hero_beastmaster"] = "Beastmaster"
  DiscordHack.HeroNameTable["npc_dota_hero_bloodseeker"] = "Bloodseeker"
  DiscordHack.HeroNameTable["npc_dota_hero_bounty_hunter"] = "Bounty Hunter"
  DiscordHack.HeroNameTable["npc_dota_hero_brewmaster"] = "Brewmaster"
  DiscordHack.HeroNameTable["npc_dota_hero_bristleback"] = "Bristleback"
  DiscordHack.HeroNameTable["npc_dota_hero_broodmother"] = "Broodmother"
  DiscordHack.HeroNameTable["npc_dota_hero_centaur"] = "Centaur Warrunner"
  DiscordHack.HeroNameTable["npc_dota_hero_chaos_knight"] = "Chaos Knight"
  DiscordHack.HeroNameTable["npc_dota_hero_chen"] = "Chen"
  DiscordHack.HeroNameTable["npc_dota_hero_clinkz"] = "Clinkz"
  DiscordHack.HeroNameTable["npc_dota_hero_crystal_maiden"] = "Crystal Maiden"
  DiscordHack.HeroNameTable["npc_dota_hero_dark_seer"] = "Dark Seer"
  DiscordHack.HeroNameTable["npc_dota_hero_dazzle"] = "Dazzle"
  DiscordHack.HeroNameTable["npc_dota_hero_death_prophet"] = "Death Prophet"
  DiscordHack.HeroNameTable["npc_dota_hero_disruptor"] = "Disruptor"
  DiscordHack.HeroNameTable["npc_dota_hero_doom_bringer"] = "Doom"
  DiscordHack.HeroNameTable["npc_dota_hero_dragon_knight"] = "Dragon Knight"
  DiscordHack.HeroNameTable["npc_dota_hero_drow_ranger"] = "Drow Ranger"
  DiscordHack.HeroNameTable["npc_dota_hero_earth_spirit"] = "Earth Spirit"
  DiscordHack.HeroNameTable["npc_dota_hero_earthshaker"] = "Earthshaker"
  DiscordHack.HeroNameTable["npc_dota_hero_elder_titan"] = "Elder Titan"
  DiscordHack.HeroNameTable["npc_dota_hero_ember_spirit"] = "Ember Spirit"
  DiscordHack.HeroNameTable["npc_dota_hero_enchantress"] = "Enchantress"
  DiscordHack.HeroNameTable["npc_dota_hero_enigma"] = "Enigma"
  DiscordHack.HeroNameTable["npc_dota_hero_faceless_void"] = "Faceless Void"
  DiscordHack.HeroNameTable["npc_dota_hero_furion"] = "Nature's Prophet"
  DiscordHack.HeroNameTable["npc_dota_hero_gyrocopter"] = "Gyrocopter"
  DiscordHack.HeroNameTable["npc_dota_hero_huskar"] = "Huskar"
  DiscordHack.HeroNameTable["npc_dota_hero_invoker"] = "Invoker"
  DiscordHack.HeroNameTable["npc_dota_hero_jakiro"] = "Jakiro"
  DiscordHack.HeroNameTable["npc_dota_hero_juggernaut"] = "Juggernaut"
  DiscordHack.HeroNameTable["npc_dota_hero_keeper_of_the_light"] = "Keeper of the Light"
  DiscordHack.HeroNameTable["npc_dota_hero_kunkka"] = "Kunkka"
  DiscordHack.HeroNameTable["npc_dota_hero_legion_commander"] = "Legion Commander"
  DiscordHack.HeroNameTable["npc_dota_hero_leshrac"] = "Leshrac"
  DiscordHack.HeroNameTable["npc_dota_hero_lich"] = "Lich"
  DiscordHack.HeroNameTable["npc_dota_hero_life_stealer"] = "Lifestealer"
  DiscordHack.HeroNameTable["npc_dota_hero_lina"] = "Lina"
  DiscordHack.HeroNameTable["npc_dota_hero_lion"] = "Lion"
  DiscordHack.HeroNameTable["npc_dota_hero_lone_druid"] = "Lone Druid"
  DiscordHack.HeroNameTable["npc_dota_hero_luna"] = "Luna"
  DiscordHack.HeroNameTable["npc_dota_hero_lycan"] = "Lycan"
  DiscordHack.HeroNameTable["npc_dota_hero_magnataur"] = "Magnus"
  DiscordHack.HeroNameTable["npc_dota_hero_medusa"] = "Medusa"
  DiscordHack.HeroNameTable["npc_dota_hero_meepo"] = "Meepo"
  DiscordHack.HeroNameTable["npc_dota_hero_mirana"] = "Mirana"
  DiscordHack.HeroNameTable["npc_dota_hero_monkey_king"] = "Monkey King"
  DiscordHack.HeroNameTable["npc_dota_hero_morphling"] = "Morphling"
  DiscordHack.HeroNameTable["npc_dota_hero_naga_siren"] = "Naga Siren"
  DiscordHack.HeroNameTable["npc_dota_hero_necrolyte"] = "Necrophos"
  DiscordHack.HeroNameTable["npc_dota_hero_nevermore"] = "Shadow Fiend"
  DiscordHack.HeroNameTable["npc_dota_hero_night_stalker"] = "Night Stalker"
  DiscordHack.HeroNameTable["npc_dota_hero_nyx_assassin"] = "Nyx Assassin"
  DiscordHack.HeroNameTable["npc_dota_hero_obsidian_destroyer"] = "Outworld Devourer"
  DiscordHack.HeroNameTable["npc_dota_hero_ogre_magi"] = "Ogre Magi"
  DiscordHack.HeroNameTable["npc_dota_hero_omniknight"] = "Omniknight"
  DiscordHack.HeroNameTable["npc_dota_hero_oracle"] = "Oracle"
  DiscordHack.HeroNameTable["npc_dota_hero_phantom_assassin"] = "Phantom Assassin"
  DiscordHack.HeroNameTable["npc_dota_hero_phantom_lancer"] = "Phantom Lancer"
  DiscordHack.HeroNameTable["npc_dota_hero_phoenix"] = "Phoenix"
  DiscordHack.HeroNameTable["npc_dota_hero_puck"] = "Puck"
  DiscordHack.HeroNameTable["npc_dota_hero_pudge"] = "Pudge"
  DiscordHack.HeroNameTable["npc_dota_hero_pugna"] = "Pugna"
  DiscordHack.HeroNameTable["npc_dota_hero_queenofpain"] = "Queen of Pain"
  DiscordHack.HeroNameTable["npc_dota_hero_rattletrap"] = "Clockwerk"
  DiscordHack.HeroNameTable["npc_dota_hero_razor"] = "Razor"
  DiscordHack.HeroNameTable["npc_dota_hero_riki"] = "Riki"
  DiscordHack.HeroNameTable["npc_dota_hero_rubick"] = "Rubick"
  DiscordHack.HeroNameTable["npc_dota_hero_sand_king"] = "Sand King"
  DiscordHack.HeroNameTable["npc_dota_hero_shadow_demon"] = "Shadow Demon"
  DiscordHack.HeroNameTable["npc_dota_hero_shadow_shaman"] = "Shadow Shaman"
  DiscordHack.HeroNameTable["npc_dota_hero_shredder"] = "Timbersaw"
  DiscordHack.HeroNameTable["npc_dota_hero_silencer"] = "Silencer"
  DiscordHack.HeroNameTable["npc_dota_hero_skeleton_king"] = "Wraith King"
  DiscordHack.HeroNameTable["npc_dota_hero_skywrath_mage"] = "Skywrath Mage"
  DiscordHack.HeroNameTable["npc_dota_hero_slardar"] = "Slardar"
  DiscordHack.HeroNameTable["npc_dota_hero_slark"] = "Slark"
  DiscordHack.HeroNameTable["npc_dota_hero_sniper"] = "Sniper"
  DiscordHack.HeroNameTable["npc_dota_hero_spectre"] = "Spectre"
  DiscordHack.HeroNameTable["npc_dota_hero_spirit_breaker"] = "Spirit Breaker"
  DiscordHack.HeroNameTable["npc_dota_hero_storm_spirit"] = "Storm Spirit"
  DiscordHack.HeroNameTable["npc_dota_hero_sven"] = "Sven"
  DiscordHack.HeroNameTable["npc_dota_hero_techies"] = "Techies"
  DiscordHack.HeroNameTable["npc_dota_hero_templar_assassin"] = "Templar Assassin"
  DiscordHack.HeroNameTable["npc_dota_hero_terrorblade"] = "Terrorblade"
  DiscordHack.HeroNameTable["npc_dota_hero_tidehunter"] = "Tidehunter"
  DiscordHack.HeroNameTable["npc_dota_hero_tinker"] = "Tinker"
  DiscordHack.HeroNameTable["npc_dota_hero_tiny"] = "Tiny"
  DiscordHack.HeroNameTable["npc_dota_hero_treant"] = "Treant Protector"
  DiscordHack.HeroNameTable["npc_dota_hero_troll_warlord"] = "Troll Warlord"
  DiscordHack.HeroNameTable["npc_dota_hero_tusk"] = "Tusk"
  DiscordHack.HeroNameTable["npc_dota_hero_undying"] = "Undying"
  DiscordHack.HeroNameTable["npc_dota_hero_ursa"] = "Ursa"
  DiscordHack.HeroNameTable["npc_dota_hero_vengefulspirit"] = "Vengeful Spirit"
  DiscordHack.HeroNameTable["npc_dota_hero_venomancer"] = "Venomancer"
  DiscordHack.HeroNameTable["npc_dota_hero_viper"] = "Viper"
  DiscordHack.HeroNameTable["npc_dota_hero_visage"] = "Visage"
  DiscordHack.HeroNameTable["npc_dota_hero_warlock"] = "Warlock"
  DiscordHack.HeroNameTable["npc_dota_hero_weaver"] = "Weaver"
  DiscordHack.HeroNameTable["npc_dota_hero_windrunner"] = "Windranger"
  DiscordHack.HeroNameTable["npc_dota_hero_winter_wyvern"] = "Winter Wyvern"
  DiscordHack.HeroNameTable["npc_dota_hero_wisp"] = "Io"
  DiscordHack.HeroNameTable["npc_dota_hero_witch_doctor"] = "Witch Doctor"
  DiscordHack.HeroNameTable["npc_dota_hero_zuus"] = "Zeus"
  DiscordHack.HeroNameTable["npc_dota_hero_dark_willow"] = "Dark Willow"
  DiscordHack.HeroNameTable["npc_dota_hero_pangolier"] = "Pangolier"
  DiscordHack.HeroNameTable["npc_dota_hero_grimstroke"] = "Grimstroke"
end
return DiscordHack