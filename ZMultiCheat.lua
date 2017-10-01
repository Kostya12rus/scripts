local MultiCheat = {}

MultiCheat.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
MultiCheat.FontSkill = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
MultiCheat.Font2 = Renderer.LoadFont("Tahoma", 11, Enum.FontWeight.EXTRABOLD)
MultiCheat.optionEnable = Menu.AddOption({"Kostya12rus","MultiCheat"}, "1 Activate", "")
MultiCheat.Rofl = Menu.AddOption({"Kostya12rus","MultiCheat"}, "2 Rofle", "")
MultiCheat.Draw_Item = Menu.AddOption({"Kostya12rus","MultiCheat","3 Draw Item"}, "Draw Item ON/OFF", "")
MultiCheat.Draw_Hud_HPandMANA = Menu.AddOption({"Kostya12rus","MultiCheat","3 Draw Item"}, "Draw HP and Mana ON/OFF", "")
MultiCheat.Draw_InPosHeroHpAndMana = Menu.AddOption({"Kostya12rus","MultiCheat","3 Draw Item"}, "Draw HP and Mana In hero pos ON/OFF", "")
MultiCheat.NickAndItems = Menu.AddOption({"Kostya12rus","MultiCheat"}, "4 Nick And Items", "")
MultiCheat.FurAndShamBlock = Menu.AddOption({"Kostya12rus","MultiCheat","5 FurAndShamBlock"}, "Activate", "")
MultiCheat.BlockKey = Menu.AddKeyOption({"Kostya12rus","MultiCheat","5 FurAndShamBlock"},"BlockKey",Enum.ButtonCode.KEY_D)
MultiCheat.BD = Menu.AddOption({"Kostya12rus","MultiCheat","6 Break Dance"}, "Break Dance on/off", "")
MultiCheat.BDKey = Menu.AddKeyOption({"Kostya12rus","MultiCheat","6 Break Dance"},"BlockKey",Enum.ButtonCode.KEY_T)
MultiCheat.CsGoESPbole = Menu.AddOption({"Kostya12rus","MultiCheat","7 CsGO 3D ESP"}, "CsGo ESP on/off", "")
MultiCheat.CsGoESPName = Menu.AddOption({"Kostya12rus","MultiCheat","7 CsGO 3D ESP"}, "CsGo ESP Name Hero on/off", "")
MultiCheat.CsGoESPBox  = Menu.AddOption({"Kostya12rus","MultiCheat","7 CsGO 3D ESP"}, "CsGo ESP Draw Box on/off", "")
MultiCheat.CsGoESPSize = Menu.AddOption({"Kostya12rus","MultiCheat","7 CsGO 3D ESP"}, "CsGo ESP Size", "", 3, 360, 1)
MultiCheat.Test = Menu.AddOption({"Kostya12rus","MultiCheat"}, "Test", "")

NeedTime = 0
AnimTable = {}
HeroTable = {}
castpoint = {}
TableItemAndHero = {}
tick = 0
MultiCheat.ImgItem = {}
MultiCheat.boolean = false

function MultiCheat.OnGameStart()
  NeedTime = 0
  tick = 0
end

function MultiCheat.OnUnitAnimation(animation)
    if #AnimTable >= 10 then
        for j=1,9 do
            AnimTable[j] = AnimTable[j + 1] 
            HeroTable[j] = HeroTable[j + 1] 
            castpoint[j] = castpoint[j + 1] 
        end
        table.remove(AnimTable)
        table.remove(HeroTable)
        table.remove(castpoint)
    end
    table.insert(AnimTable, animation.sequenceName)
    table.insert(HeroTable, NPC.GetUnitName(animation.unit))
    table.insert(castpoint, animation.playbackRate)
	if animation.unit ~= Heroes.GetLocal() then return end
	if (animation.activity == Enum.GameActivity.ACT_DOTA_RUN or animation.activity == Enum.GameActivity.ACT_DOTA_IDLE_RARE) then
		Renderer.DrawTextCenteredX(MultiCheat.Font, 1000, 500, "true", 1)
	end
end

function MultiCheat.OnDraw()
	if not Menu.IsEnabled(MultiCheat.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end 
	if Menu.IsEnabled(MultiCheat.Draw_Item) then MultiCheat.DrawOwerItem() end
	if Menu.IsEnabled(MultiCheat.NickAndItems) then MultiCheat.NickAndItem() end
	if Menu.IsEnabled(MultiCheat.CsGoESPbole) then MultiCheat.CsGoESP() end
	
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
  else return end
end

function MultiCheat.test()
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
	msg = ""
	local myHero = Heroes.GetLocal()
	for l = 1, NPCs.Count() do
		local unitNA = NPCs.Get(l)
		if unitNA then
			if Entity.IsHero(unitNA) and Entity.IsSameTeam(myHero, unitNA)then
				local PlayerName = Player.GetName(Entity.GetOwner(unitNA))
				if PlayerName ~= Player.GetName(Players.GetLocal()) then
					msg = PlayerName ..", ".. msg
				end
			end 
			if l == NPCs.Count() then
				 Renderer.DrawTextCenteredX(MultiCheat.Font, size_x/2, 50, msg, 1)
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
		if asfasfa and Entity.IsHero(asfasfa) then
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
			if y1 ~= y2 then
				y1 = y2
			else
				y1 = y2+20
			end
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
    if entity and Entity.IsHero(entity) then
      local CordY = 65
      local ImgSize = 60
      local ImgSizeY = ImgSize-10
      local Player_ID = Hero.GetPlayerID(entity)+1
      local CordX = TableItemAndHero[Player_ID]
	  if CordX == nil then return end
      Renderer.SetDrawColor(255, 255, 255, 255)
	  for items = 1, #ItemPanel do
		for index_item = 0, 15 do
		  local item = NPC.GetItemByIndex(entity, index_item)
		  if item then
		  local itemName = Ability.GetName(item)
		    if ItemPanel[items] ==  itemName then
		      tempName = ItemPanel[items]:gsub("item_", "")
		      imageHandle = MultiCheat.ImgItem[tempName]
		      if imageHandle == nil then
		    	imageHandle = MultiCheat.ItemImage(tempName)
		    	MultiCheat.ImgItem[tempName] = imageHandle
		      end
		      Renderer.DrawImage(imageHandle, CordX, CordY, ImgSize, ImgSizeY)
		      CordY = (CordY + ImgSizeY - 1)
		    end
		  end
		end
	  end
	  if Menu.IsEnabled(MultiCheat.Draw_Hud_HPandMANA) and Entity.IsAlive(entity) and not NPC.IsIllusion(entity) then
	    local Health = Entity.GetHealth(entity)
	    local MaxHealth = Entity.GetMaxHealth(entity)
	    local HealthProc = Health/(MaxHealth/100)
	    local Mana = NPC.GetMana(entity)
	    local MaxMana = NPC.GetMaxMana(entity)
	    local ManaProc = Mana/(MaxMana/100)
	    local SizeHealHud = MultiCheat.toint(ImgSize/100*HealthProc)
	    local SizeManaHud = MultiCheat.toint(ImgSize/100*ManaProc)
		Renderer.SetDrawColor(255, 255, 255, 255)
	    Renderer.DrawFilledRect(CordX, 42, ImgSize, 10)
	    Renderer.DrawFilledRect(CordX, 55, ImgSize, 10)
	    if HealthProc <= 200 and HealthProc > 80 then Renderer.SetDrawColor(0, 255, 0, 255)
	    elseif HealthProc <= 80 and HealthProc > 60 then Renderer.SetDrawColor(0, 255, 127, 255)
	    elseif HealthProc <= 60 and HealthProc > 40 then Renderer.SetDrawColor(154, 205, 50, 255)
	    elseif HealthProc <= 40 and HealthProc > 20 then Renderer.SetDrawColor(255, 255, 0, 255)
	    elseif HealthProc <= 20 and HealthProc > 10 then Renderer.SetDrawColor(255, 165, 0, 255)
	    elseif HealthProc <= 10 and HealthProc >= 0 then Renderer.SetDrawColor(255, 0, 0, 255) end
	    Renderer.DrawFilledRect(CordX, 42, SizeHealHud, 10)
	    Renderer.DrawOutlineRect(CordX, 42, ImgSize, 10)
	    Renderer.SetDrawColor(0, 0, 255, 255)
	    Renderer.DrawFilledRect(CordX, 55, SizeManaHud, 10)
	    Renderer.DrawOutlineRect(CordX, 55, ImgSize, 10)
	    Renderer.SetDrawColor(0, 0, 0, 255)
	    Renderer.DrawTextCenteredX(MultiCheat.Font2, CordX+30, 42,Health, 1)
	    Renderer.SetDrawColor(0, 0, 0, 255)
	    Renderer.DrawTextCenteredX(MultiCheat.Font2, CordX+30, 55,Mana, 1)
	    if Menu.IsEnabled(MultiCheat.Draw_InPosHeroHpAndMana) and not Entity.IsSameTeam(Heroes.GetLocal(), entity) and not Entity.IsDormant(entity) then
	      local HudUnPos = Entity.GetAbsOrigin(entity)
	      local Xhud, Yhud, WorldWisHud= Renderer.WorldToScreen(HudUnPos)
	      Renderer.SetDrawColor(0, 255, 0, 255)
	      Renderer.DrawTextCenteredX(MultiCheat.FontSkill, Xhud, Yhud-110, Health .. "/" .. MaxHealth, 1)
	      Renderer.SetDrawColor(0, 0, 255, 255)
	      Renderer.DrawTextCenteredX(MultiCheat.FontSkill, Xhud, Yhud-100, Mana .. "/" .. MaxMana, 1)
	    end
	  end
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
  local need_mana_for_cast = 0
  if Ability.IsReady(callforce) then
    need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(callforce)
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then
      need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(RodOfAtos)
      if Ability.IsReady(sprout) then
        need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(sprout)
      end
    elseif Ability.IsReady(sprout) then
      need_mana_for_cast = need_mana_for_cast + Ability.GetManaCost(sprout)
    end
  end
  if Menu.IsKeyDown(MultiCheat.BlockKey) and MyAndEnemyDistanse <= distanse_sprout and Ability.IsReady(callforce) and lvlcallforce == 4 and NPC.GetMana(myHero) >= need_mana_for_cast then
    if RodOfAtos and Ability.IsCastable(RodOfAtos, NPC.GetMana(myHero)) then Ability.CastTarget(RodOfAtos, enemy) end
    if Ability.IsReady(sprout) and #trees < 5 then
        Ability.CastTarget(sprout, enemy)
    end
    if #trees >= 5 or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then
      if Ability.GetCooldown(RodOfAtos) <= 15 then
        Ability.CastPosition(callforce, enemyPos)
      elseif not RodOfAtos then
        Ability.CastPosition(callforce, enemyPos)
      end
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

function MultiCheat.BreakDance(hero)
  if Menu.IsKeyDown(MultiCheat.BDKey) then
    if tick <= GameRules.GetGameTime() then
      local NeedPosinot = MultiCheat.PositionAngle(hero,180,1)
      MultiCheat.MoveTo(NeedPosinot)
      tick = GameRules.GetGameTime() + 0.001
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

return MultiCheat