local MultiCheat = {}

MultiCheat.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
MultiCheat.FontSkill = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
MultiCheat.Font2 = Renderer.LoadFont("Tahoma", 11, Enum.FontWeight.EXTRABOLD)
MultiCheat.optionEnable =            Menu.AddOption({"Kostya12rus","MultiCheat"}, "1 Activate", "")
MultiCheat.Rofl =                    Menu.AddOption({"Kostya12rus","MultiCheat"}, "2 Rofle", "")
MultiCheat.Draw_Item =               Menu.AddOption({"Kostya12rus","MultiCheat",  "3 Draw Item"}, "Draw Item ON/OFF", "")
MultiCheat.Draw_Hud_HPandMANA =      Menu.AddOption({"Kostya12rus","MultiCheat",  "3 Draw Item"}, "Draw HP and Mana ON/OFF", "")
MultiCheat.Draw_InPosHeroHpAndMana = Menu.AddOption({"Kostya12rus","MultiCheat",  "3 Draw Item"}, "Draw HP and Mana In hero pos ON/OFF", "")
MultiCheat.Draw_Ultimate =           Menu.AddOption({"Kostya12rus","MultiCheat",  "3 Draw Item"}, "Draw Ultimate ON/OFF", "")
MultiCheat.NickAndItems =            Menu.AddOption({"Kostya12rus","MultiCheat",  "4 Nick And Items"}, "Activate", "")
MultiCheat.NickAndItemsDraw =        Menu.AddOption({"Kostya12rus","MultiCheat",  "4 Nick And Items"}, "Draw Name", "")
MultiCheat.NickAndItemseKey =     Menu.AddKeyOption({"Kostya12rus","MultiCheat",  "4 Nick And Items"}, "Fuck Key",Enum.ButtonCode.KEY_P)
MultiCheat.FurAndShamBlock =         Menu.AddOption({"Kostya12rus","MultiCheat",  "5 FurAndShamBlock"}, "Activate", "")
MultiCheat.BlockKey =             Menu.AddKeyOption({"Kostya12rus","MultiCheat",  "5 FurAndShamBlock"},"BlockKey",Enum.ButtonCode.KEY_D)
MultiCheat.BD =                      Menu.AddOption({"Kostya12rus","MultiCheat",  "6 Break Dance"}, "Break Dance on/off", "")
MultiCheat.BDKey =                Menu.AddKeyOption({"Kostya12rus","MultiCheat",  "6 Break Dance"},"BlockKey",Enum.ButtonCode.KEY_T)
MultiCheat.typemove =                Menu.AddOption({"Kostya12rus","MultiCheat",  "6 Break Dance"},"Type", "", 0, 2, 1)
MultiCheat.CsGoESPbole =             Menu.AddOption({"Kostya12rus","MultiCheat",  "7 CsGO 3D ESP"}, "CsGo ESP on/off", "")
MultiCheat.CsGoESPName =             Menu.AddOption({"Kostya12rus","MultiCheat",  "7 CsGO 3D ESP"}, "CsGo ESP Name Hero on/off", "")
MultiCheat.CsGoESPBox  =             Menu.AddOption({"Kostya12rus","MultiCheat",  "7 CsGO 3D ESP"}, "CsGo ESP Draw Box on/off", "")
MultiCheat.CsGoESPSize =             Menu.AddOption({"Kostya12rus","MultiCheat",  "7 CsGO 3D ESP"}, "CsGo ESP Size", "", 3, 360, 1)
MultiCheat.Test =                    Menu.AddOption({"Kostya12rus","MultiCheat"}, "Test", "")

--local utilitu = require("Kostya12rusUtil/MiniMapHelper")

function MultiCheat.Init()
  NeedTime = 0
  AnimTable = {}
  HeroTable = {}
  castpoint = {}
  TableAbilCoold = {}
  tick = 0
  MultiCheat.ImgItem = {}
  ImgSpeelRange = {}
  Key1 = false
  Key2 = false
  Key3 = false
  msgMyTeam = ""
  msgEnemy = ""
  HeroNameAndAny = {}
  ItemPingTime = 0
end
function MultiCheat.OnGameStart()
  MultiCheat.Init()
end
function MultiCheat.OnGameEnd()
  MultiCheat.Init()
end

function MultiCheat.OnDraw()
	if not Menu.IsEnabled(MultiCheat.optionEnable) then return end
	if not Heroes.GetLocal() then return end 
	if Menu.IsEnabled(MultiCheat.Draw_Item) then MultiCheat.DrawOwerItem() end
	if Menu.IsEnabled(MultiCheat.NickAndItems) then MultiCheat.NickAndItem() end
	if Menu.IsEnabled(MultiCheat.CsGoESPbole) then MultiCheat.CsGoESP() end
    --Renderer.DrawTextCenteredX(MultiCheat.Font, 1000, 500, NPC.GetArmorDamageMultiplier(Heroes.GetLocal()), 1) 
	if Menu.IsEnabled(MultiCheat.Test) then MultiCheat.test() end
end

function MultiCheat.OnUpdate()
  if not Menu.IsEnabled(MultiCheat.optionEnable) then return end
  local myHero = Heroes.GetLocal()
  if not myHero then return end 
  
  if Menu.IsEnabled(MultiCheat.Rofl) and Entity.IsAlive(myHero) then MultiCheat.RoflTime() end -- rofl evry 15 second
  if Menu.IsEnabled(MultiCheat.BD) and Entity.IsAlive(myHero) then MultiCheat.BreakDance(myHero) end
  
  if NPC.GetUnitName(myHero) == "npc_dota_hero_furion" then MultiCheat.Furion()
  elseif NPC.GetUnitName(myHero) == "npc_dota_hero_shadow_shaman" then MultiCheat.Shadowshaman()
  elseif NPC.GetUnitName(myHero) == "npc_dota_hero_bristleback" then MultiCheat.Bristleback()
  else return end
end

function MultiCheat.test() -- RangeSpeel


end

function MultiCheat.CsGoESP()
  local myHero = Heroes.GetLocal()
  local Number_Of_Sides = Menu.GetValue(MultiCheat.CsGoESPSize)
  local teactpos = 360 / Number_Of_Sides
  local distansee = 110
  for a = 1, NPCs.Count() do
    local jeaeke = NPCs.Get(a)
    if Entity.IsHero(jeaeke) and Entity.IsAlive(jeaeke) and not NPC.IsIllusion(jeaeke) then
      if Entity.IsSameTeam(myHero, jeaeke) then Renderer.SetDrawColor(0, 255, 0, 255) else Renderer.SetDrawColor(255, 0, 0, 255) end
      if Menu.IsEnabled(MultiCheat.CsGoESPBox) then
        for o = 1,Number_Of_Sides do
            x1,y1 = Renderer.WorldToScreen(MultiCheat.PositionAngle(jeaeke,teactpos*o+teactpos/2,distansee))
          if o ~= Number_Of_Sides then
            x2,y2 = Renderer.WorldToScreen(MultiCheat.PositionAngle(jeaeke,teactpos*(o+1)+teactpos/2,distansee))
          else
            x2,y2 = Renderer.WorldToScreen(MultiCheat.PositionAngle(jeaeke,teactpos*1+teactpos/2,distansee))
          end
          MultiCheat.DrawLine(x1, y1, x2,  y2)
          MultiCheat.DrawLine(x1, y1, x1, y1-50)
          MultiCheat.DrawLine(x2, y2, x2, y2-50)
          MultiCheat.DrawLine(x1, y1-50, x2,  y2-50)
        end
      end
      if Menu.IsEnabled(MultiCheat.CsGoESPName) then
        local pos = Entity.GetAbsOrigin(jeaeke)
        local x1, y1 = Renderer.WorldToScreen(pos)
        Renderer.DrawTextCenteredX(MultiCheat.Font, x1, y1+40, NPC.GetUnitName(jeaeke), 1)
      end
    end
  end
end

function MultiCheat.NickAndItem()
	local size_x, size_y = Renderer.GetScreenSize()
	local myHero = Heroes.GetLocal()
	local NeddX = 100
	NameKey = 1
	StateKey = 2
	TeamKey = 3
	ValueKill = 4
	Renderer.SetDrawColor(255,255,255,255)
	for l = 1, NPCs.Count() do
		local unitNA = NPCs.Get(l)
		if unitNA then
			if Entity.IsHero(unitNA) and Entity.IsPlayer(Entity.GetOwner(unitNA)) and not NPC.IsIllusion(unitNA) then
				local PlayerName = Player.GetName(Entity.GetOwner(unitNA))
				local PlayerState = Player.GetPlayerData(Entity.GetOwner(unitNA)).connectionState
				local PlayerKills = Player.GetTeamData(Entity.GetOwner(unitNA)).streak
				if Menu.IsEnabled(MultiCheat.NickAndItemsDraw) then
					Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2-100, NeddX, PlayerName, 1)
					Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2+100, NeddX, PlayerState, 1)
					Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2+150, NeddX, type(Chat.GetChannels()), 1)
					NeddX = NeddX + 20
				end
				if HeroNameAndAny[NPC.GetUnitName(unitNA)] == nil then
					HeroNameAndAny[NPC.GetUnitName(unitNA)] = {}
					Herotable = HeroNameAndAny[NPC.GetUnitName(unitNA)]
					Herotable[NameKey] = PlayerName
					Herotable[StateKey] = PlayerState
					Herotable[TeamKey] = Entity.IsSameTeam(myHero, unitNA)
					Herotable[ValueKill] = PlayerKills
				end
			end
			
			if l == NPCs.Count() then
				NeddX = 500
				msgMyTeam = ""
				msgEnemy = ""
				for key,n in pairs(HeroNameAndAny) do
					nick = HeroNameAndAny[key][NameKey]
					status = HeroNameAndAny[key][StateKey]
					teamkey = HeroNameAndAny[key][TeamKey]
					killkey = HeroNameAndAny[key][ValueKill]
					if teamkey then
						if nick ~= Player.GetName(Players.GetLocal()) then
							msgMyTeam = nick ..", ".. msgMyTeam
						end
					else
						msgEnemy = nick ..", ".. msgEnemy
					end
					if Menu.IsEnabled(MultiCheat.NickAndItemsDraw) then
						Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2-200, NeddX, key:gsub("nps_dota_hero_", ""), 1)
						Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2+50, NeddX, nick, 1)
						Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2+150, NeddX, status, 1)
						Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2+250, NeddX, killkey, 1)
						NeddX = NeddX + 20
					end
				end
			end
		end
	end	
	
	local myHero = Heroes.GetLocal()
	local x1 = 1000
	local y1 = 100
	local x2 = x1 + 500
	local y2 = y1
	
	for asf = 1, NPCs.Count() do
	local asfasfa = NPCs.Get(asf) 
		if asfasfa and Entity.IsHero(asfasfa) and not NPC.IsIllusion(asfasfa) and Menu.IsEnabled(MultiCheat.NickAndItemsDraw) then
			local HeroName = NPC.GetUnitName(asfasfa)
			local slotNum = 9
			for q = 0, slotNum-1 do
				local item = NPC.GetItemByIndex(asfasfa, q)
				if item then
					itemName = Ability.GetName(item)
					Renderer.DrawTextCenteredX(MultiCheat.Font, x2, y2, itemName, 1)
					y2 = y2 + 20
				end
			end
			Renderer.DrawText(MultiCheat.Font, x1, y1, HeroName, 1)
			if y1 ~= y2 then y1 = y2 else y1 = y2+20 end
		end
	end
	
end

function MultiCheat.DrawOwerItem()
  local size_x, size_y = Renderer.GetScreenSize()
  TableItemAndHero = {
   [1] =   math.floor(size_x/3+11)         
  ,[2] =  (math.floor(size_x/3+11) + 63)  
  ,[3] =  (math.floor(size_x/3+11) + 126) 
  ,[4] =  (math.floor(size_x/3+11) + 189) 
  ,[5] =  (math.floor(size_x/3+11) + 252) 
  ,[6] =   math.floor(size_x/1.85)         
  ,[7] =  (math.floor(size_x/1.85) + 63)
  ,[8] =  (math.floor(size_x/1.85) + 126)
  ,[9] =  (math.floor(size_x/1.85) + 189)
  ,[10] = (math.floor(size_x/1.85) + 252)}
  ItemPanel = {"item_rapier","item_gem","item_ward_dispenser","item_ward_dispenser_sentry","item_ward_sentry","item_ward_observer","item_dust","item_smoke_of_deceit"}
  for i = 1, NPCs.Count() do
    local entity = NPCs.Get(i) 
    if entity and Entity.IsHero(entity) and not NPC.IsIllusion(entity) then
      local CordY = 85
      local ImgSize = 60
      local ImgSizeY = ImgSize-10
      local Player_ID = Hero.GetPlayerID(entity)+1
      local CordX = TableItemAndHero[Player_ID]
	  if CordX == nil then return end
      Renderer.SetDrawColor(255, 255, 255, 255)
	  for items = 1, #ItemPanel do
		for index_item = 0, 15 do
		  local item = NPC.GetItemByIndex(entity, index_item)
		  if item and Entity.IsAbility(item) then
		  local itemName = Ability.GetName(item)
		    if ItemPanel[items] ==  itemName then
		      tempName = ItemPanel[items]:gsub("item_", "")
		      imageHandle = MultiCheat.ImgItem[tempName]
		      if imageHandle == nil then
		    	imageHandle = MultiCheat.ItemImage(tempName)
		    	MultiCheat.ImgItem[tempName] = imageHandle
		      end
		      Renderer.DrawImage(imageHandle, CordX, CordY, ImgSize, ImgSizeY)
			  if Input.IsCursorInRect(CordX,CordY,ImgSize,ImgSizeY) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PING_ABILITY, 0, Vector(), item, 0, nil)
			  end
		      CordY = (CordY + ImgSizeY - 1)
		    end
		  end
		end
	  end
	  if Menu.IsEnabled(MultiCheat.Draw_Hud_HPandMANA) and Entity.IsAlive(entity) then
	    local Health = Entity.GetHealth(entity)
	    local MaxHealth = Entity.GetMaxHealth(entity)
	    local HealthProc = Health/(MaxHealth/100)
	    local Mana = NPC.GetMana(entity)
	    local MaxMana = NPC.GetMaxMana(entity)
	    local ManaProc = Mana/(MaxMana/100)
	    local SizeHealHud = MultiCheat.toint(ImgSize/100*HealthProc)
	    local SizeManaHud = MultiCheat.toint(ImgSize/100*ManaProc)
		local YposForHP = 62
		local YposForMana = 75
		Renderer.SetDrawColor(255, 255, 255, 255)
	    Renderer.DrawFilledRect(CordX, YposForHP, ImgSize, 10)
	    Renderer.DrawFilledRect(CordX, YposForMana, ImgSize, 10)
	    if HealthProc <= 200 and HealthProc > 80 then Renderer.SetDrawColor(0, 255, 0, 255)
	    elseif HealthProc <= 80 and HealthProc > 60 then Renderer.SetDrawColor(0, 255, 127, 255)
	    elseif HealthProc <= 60 and HealthProc > 40 then Renderer.SetDrawColor(154, 205, 50, 255)
	    elseif HealthProc <= 40 and HealthProc > 20 then Renderer.SetDrawColor(255, 255, 0, 255)
	    elseif HealthProc <= 20 and HealthProc > 10 then Renderer.SetDrawColor(255, 165, 0, 255)
	    elseif HealthProc <= 10 and HealthProc >= 0 then Renderer.SetDrawColor(255, 0, 0, 255) end
	    Renderer.DrawFilledRect(CordX, YposForHP, SizeHealHud, 10)
	    Renderer.DrawOutlineRect(CordX, YposForHP, ImgSize, 10)
	    Renderer.SetDrawColor(0, 0, 255, 255)
	    Renderer.DrawFilledRect(CordX, YposForMana, SizeManaHud, 10)
	    Renderer.DrawOutlineRect(CordX, YposForMana, ImgSize, 10)
	    Renderer.SetDrawColor(0, 0, 0, 255)
	    Renderer.DrawTextCenteredX(MultiCheat.Font2, CordX+30, YposForHP,Health, 1)
	    Renderer.SetDrawColor(0, 0, 0, 255)
	    Renderer.DrawTextCenteredX(MultiCheat.Font2, CordX+30, YposForMana,math.floor(Mana), 1)
	    if Menu.IsEnabled(MultiCheat.Draw_InPosHeroHpAndMana) and not Entity.IsSameTeam(Heroes.GetLocal(), entity) and not Entity.IsDormant(entity) then
	      local HudUnPos = Entity.GetAbsOrigin(entity)
	      local Xhud, Yhud, WorldWisHud= Renderer.WorldToScreen(HudUnPos)
	      Renderer.SetDrawColor(0, 255, 0, 255)
	      Renderer.DrawTextCenteredX(MultiCheat.FontSkill, Xhud, Yhud-110, Health .. "/" .. MaxHealth, 1)
	      Renderer.SetDrawColor(0, 0, 255, 255)
	      Renderer.DrawTextCenteredX(MultiCheat.FontSkill, Xhud, Yhud-100, Mana .. "/" .. MaxMana, 1)
	    end
	  end
	  local myHero = Heroes.GetLocal()
	  if Menu.IsEnabled(MultiCheat.Draw_Ultimate) and not Entity.IsSameTeam(myHero,entity) then
	    for i = 0,24 do
	      local ability = NPC.GetAbilityByIndex(entity, i)
	      if ability ~= nil and Entity.IsAbility(ability) and Ability.IsUltimate(ability) and Ability.GetLevel(ability) > 0 then
	        local abilityName = Ability.GetName(ability)
	        local TimeCooldown = Ability.GetCooldown(ability)
	        local imageHandle = MultiCheat.ImgItem[abilityName]
	        if imageHandle == nil then
	          imageHandle = Renderer.LoadImage("resource/flash3/images/spellicons/" .. abilityName .. ".png")
	          MultiCheat.ImgItem[abilityName] = imageHandle
	        end
	        if Ability.IsReady(ability) then
	          Renderer.SetDrawColor(255,255,255,255)
	          Renderer.DrawImage(imageHandle,CordX+20,40,ImgSize/3,ImgSize/3)
	        else
	          Renderer.SetDrawColor(0,255,255,255)
	          Renderer.DrawImage(imageHandle,CordX+20,40,ImgSize/3,ImgSize/3)
	          Renderer.SetDrawColor(255, 0, 0, 255)
	  		if TableAbilCoold[abilityName] == nil or TableAbilCoold[abilityName] < 0 then TableAbilCoold[abilityName] = 0 end
	  		if TimeCooldown > 0 and TableAbilCoold[abilityName] < GameRules.GetGameTime() then TableAbilCoold[abilityName] = GameRules.GetGameTime() + TimeCooldown
	  		else Renderer.DrawTextCenteredX(MultiCheat.FontSkill, CordX+30, 43, math.floor(GameRules.GetGameTime()-TableAbilCoold[abilityName])*-1, 1)
	  		end
	        end
	      end
	    end
	  end
    end 
  end
end

function MultiCheat.Bristleback()
	local myHero = Heroes.GetLocal()
	local myheroPos = Entity.GetAbsOrigin(myHero)
	local HeroInRadius = 0
	local quill_spray = NPC.GetAbility(myHero,"bristleback_quill_spray")
	local viscous_nasal_goo = NPC.GetAbility(myHero,"bristleback_viscous_nasal_goo")
	local distanse_quill_spray = Ability.GetCastRange(quill_spray)
	local distanse_viscous_nasal_goo = Ability.GetCastRange(viscous_nasal_goo)
	local aganim = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	if MultiCheat.HeroInRadius(distanse_quill_spray) > 1 then
		if Ability.IsReady(quill_spray) and NPC.GetMana(myHero) >= Ability.GetManaCost(quill_spray) then
			Ability.CastNoTarget(quill_spray)
			return
		end
	end
	if MultiCheat.HeroInRadius(distanse_viscous_nasal_goo) > 1 then
		if aganim and Ability.IsReady(viscous_nasal_goo) and NPC.GetMana(myHero) >= Ability.GetManaCost(viscous_nasal_goo) then
			Ability.CastNoTarget(viscous_nasal_goo)
			return
		end
	end
end

function MultiCheat.Furion()
  local myHero = Heroes.GetLocal()
  local myheroPos = Entity.GetAbsOrigin(myHero)
  local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  if enemy == nil then return end
  local enemyPos = Entity.GetAbsOrigin(enemy)
  local MyAndEnemyDistanse = myheroPos:Distance(enemyPos):Length2D()
  local trees = Trees.InRadius(enemyPos, 375, true)
  local sprout = NPC.GetAbilityByIndex(myHero, 0)
  local distanse_sprout = Ability.GetCastRange(sprout)
  local callforce = NPC.GetAbilityByIndex(myHero, 2)
  local lvlcallforce = Ability.GetLevel(callforce)
  local RodOfAtos = NPC.GetItem(myHero, "item_rod_of_atos", true)
  
  if Menu.IsKeyDown(MultiCheat.BlockKey) and MyAndEnemyDistanse <= distanse_sprout and Ability.IsReady(callforce) and lvlcallforce == 4 then
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then 
		Ability.CastTarget(RodOfAtos, enemy) 
		return 
	end
    if Ability.IsReady(sprout) and #trees < 5 then
        Ability.CastTarget(sprout, enemy)
		return
    end
    if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or not NPC.IsRunning(enemy) then
	  Ability.CastPosition(callforce, enemyPos)
	  return
    end
  end
end

function MultiCheat.Shadowshaman()
  local myHero = Heroes.GetLocal()
  local myheroPos = Entity.GetAbsOrigin(myHero)
  local enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
  if enemy == nil then return end
  local enemyPos = Entity.GetAbsOrigin(enemy)
  local MyAndEnemyDistanse = myheroPos:Distance(enemyPos):Length2D()
  local voodoo = NPC.GetAbilityByIndex(myHero, 1)
  local distanse_voodoo = Ability.GetCastRange(voodoo)
  local Serpent_Ward = NPC.GetAbilityByIndex(myHero, 3)
  local RodOfAtos = NPC.GetItem(myHero, "item_rod_of_atos", true)
  local need_mana_for_cast = 0
  if Ability.IsReady(Serpent_Ward) then
    need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(Serpent_Ward)
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then
      need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(RodOfAtos)
      if Ability.IsReady(voodoo) then
        need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(voodoo)
      end
    elseif Ability.IsReady(voodoo) then
      need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(voodoo)
    end
  end
  if Menu.IsKeyDown(MultiCheat.BlockKey) and MyAndEnemyDistanse <= distanse_voodoo and Ability.IsReady(Serpent_Ward) and NPC.GetMana(myHero) >= need_mana_for_cast then
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then Ability.CastTarget(RodOfAtos, enemy) end
    if Ability.IsReady(voodoo) then
      Ability.CastTarget(voodoo, enemy)
    end
    if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
      Ability.CastPosition(Serpent_Ward, enemyPos)
    end
  end
end

function MultiCheat.RoflTime()
  ostime = GameRules.GetGameTime()
  if NeedTime <= ostime then
    Engine.ExecuteCommand("say /laugh")
    NeedTime = ostime + 15
  end
end

local trigerpiper = true
function MultiCheat.BreakDance(hero)
  if Menu.IsKeyDown(MultiCheat.BDKey) then
		if Menu.GetValue(MultiCheat.typemove) == 0 then
			if tick <= GameRules.GetGameTime() then
				NPC.MoveTo(myHero,MultiCheat.PositionAngle(myHero,160,1),false,false)
				tick = GameRules.GetGameTime() + 0.05
			end
		end
		if Menu.GetValue(MultiCheat.typemove) == 1 then
			if tick <= GameRules.GetGameTime() then
				NPC.MoveTo(myHero,MultiCheat.PositionAngle(myHero,100,40),false,false)
				tick = GameRules.GetGameTime() + 0.15
			end
		end
		if Menu.GetValue(MultiCheat.typemove) == 2 then
			if tick <= GameRules.GetGameTime() then
				if trigerpiper then
					minitable = 75
				else
					minitable = -120
				end
				NPC.MoveTo(myHero,MultiCheat.PositionAngle(myHero,minitable,1),false,false)
				tick = GameRules.GetGameTime() + 0.1
				trigerpiper = not trigerpiper
			end
		end
	end
end

--Untility function

-- из float в int
function MultiCheat.toint(n)
    local s = tostring(n)
    local i, j = s:find('%.')
    if i then
        return tonumber(s:sub(1, i-1))
    else
        return n
    end
end
-- Количество героев в радиусе
function MultiCheat.HeroInRadius(radius)
	local myHero = Heroes.GetLocal()
	local myheroPos = Entity.GetAbsOrigin(myHero)
	heroradius = 0
	for i = 1, NPCs.Count() do
		local entity = NPCs.Get(i) 
		if entity and Entity.IsHero(entity) and not NPC.IsIllusion(entity) and not Entity.IsSameTeam(myHero,entity) and not Entity.IsDormant(entity) then
			if Entity.IsAlive(entity) then
				local enemyPos = Entity.GetAbsOrigin(entity)
				local MyAndEnemyDistanse = myheroPos:Distance(enemyPos):Length2D()
				if MyAndEnemyDistanse <= radius then
					heroradius = heroradius + 1
				end
			end
		end 
	end
	return heroradius
end 

--Загрузить картинку вещи
function MultiCheat.ItemImage(item)
  return Renderer.LoadImage("~/Kostya12rus/Items/" ..item..".png")
end 

-- Рисовать линию
function MultiCheat.DrawLine(x1,y1,x2,y2)
  Renderer.DrawLine(x1, y1, x2,  y2)
end

-- Идти моему герою в заданную позицию
function MultiCheat.MoveTo(vector) 
  Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, Heroes.GetLocal(), vector, nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY)
end

-- Найти точку от NPS в заданном угле и дистации
function MultiCheat.PositionAngle(nps,rotation,range)
  local angle = Entity.GetRotation(nps)
  local angleOffset = Angle(0, 45+rotation, 0)
  angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
  local x,y,z = angle:GetVectors()
  local direction = x + y + z
  direction:SetZ(0)
  direction:Normalize()
  direction:Scale(range)
  local origin = NPC.GetAbsOrigin(nps)
  NeedPos = origin + direction
  return NeedPos
end

-- Рисовать круг под NPS
function MultiCheat.DrawCircle(UnitPos, radius, index)
  local size_x, size_y = Renderer.GetScreenSize()
  local x1, y1 = Renderer.WorldToScreen(UnitPos)
  if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
    local x4, y4, x3, y3, visible3
    local dergee = index
    for angle = 0, 360 / dergee do
      x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
      y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
      x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
      Renderer.DrawLine(x1,y1,x3,y3)
      x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
    end
  end
end

MultiCheat.Init()
return MultiCheat