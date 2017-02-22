local Axe = {}

Axe.optionEnable = Menu.AddOption({"Hero Specific", "Axe"}, "Enable",  "Combo - Huembo:D")
Axe.optionKey = Menu.AddKeyOption({"Hero Specific", "Axe"}, "Key", Enum.ButtonCode.KEY_F)
Axe.bkb = Menu.AddOption({"Hero Specific", "Axe"}, "USE BKB",  "")
Axe.pipeEnable = Menu.AddOption({"Hero Specific", "Axe"}, "Use Pipe", "")
Axe.cache= {}

function Axe.OnUpdate()
    if not Menu.IsEnabled(Axe.optionEnable) then return true end
    if not Menu.IsKeyDown(Axe.optionKey) then return end
	
	local myHero = Heroes.GetLocal()

 if NPC.GetUnitName(myHero) ~= "npc_dota_hero_axe" then return end
	
	
	local enemies = NPC.GetHeroesInRadius(myHero, 1500, Enum.TeamType.TEAM_ENEMY)
	
	local count = 0;
    local point = {}
    for i, enemy in ipairs(enemies) do
        count = count + 1;
        point[i] = NPC.GetAbsOrigin(enemy)
	end
	
	if count<2 then 
	Axe.ITABcombo()
	end
	
	
	local maxCount = 0
	local finalPos = nill
	local j=0
	for i = 1, count do
	    for j=j+1, count do
		    for k=j+1, count do
		         Axe.processHeroes(myHero, point[i], point[j], point[k])
				 local tempPos = Axe.cache["pos"]
				 local tempCount = Axe.cache["count"]
				 if tempCount> maxCount then
				     maxCount = tempCount
					 finalPos = tempPos
					 end
			    end
		end
  end
  
  if finalPos == nill or maxCount< 2 then 
  Axe.ITABcombo()
  end
  
 Axe.castUlt(myHero, finalPos)
 end
 
 function Axe.processHeroes(myHero, hero1Pos, hero2Pos, hero3Pos)
 
    local centroid = Axe.centroid(hero1Pos, hero2Pos, hero3Pos)
    local ccs = Axe.circumCenter(hero1Pos, hero2Pos, hero3Pos)
    local mid = Axe.furthestMidPoint(hero1Pos, hero2Pos, hero3Pos)
	
	local centroidHeroCount = Axe.validateCenter(centroid,myHero)
    local ccsHeroCount = Axe.validateCenter(ccs,myHero)
    local midCount = Axe.validateCenter(mid,myHero)
	
	if centroidHeroCount < 2 and ccsHeroCount < 2 and midCount < 2 then
       
        Axe.cache["pos"] = nill
        Axe.cache["count"] = 0
        return 
    end
	
	   if centroidHeroCount >= ccsHeroCount and centroidHeroCount >= midCount then 
        Axe.cache["pos"] = centroid
        Axe.cache["count"] = centroidHeroCount
        return
    end
    if ccsHeroCount >= centroidHeroCount and ccsHeroCount >= midCount then 
        Axe.cache["pos"] = ccs
        Axe.cache["count"] = ccsHeroCount
        return
    end
	
   Axe.cache["pos"] = mid
    Axe.cache["count"] = midCount
    return result
    --Axe.castUlt(myHero, ccs) 
end

function Axe.furthestMidPoint(a, b, c)
    local distanceAB = a:Distance(b)
    local distanceAC = a:Distance(c)
    local distanceBC = b:Distance(c)

    distanceAB = distanceAB:Length()
    distanceAC = distanceAC:Length()
    distanceBC = distanceBC:Length()

    if distanceAB >= distanceAC and distanceAB>= distanceBC then 
        local result = a + b
        result:SetX(result:GetX()/2)
        result:SetY(result:GetY()/2)  
        result:SetZ(0)
        return result
    end 

    if distanceAC >= distanceAB and distanceAC>= distanceBC then 
        local result = a + c
        result:SetX(result:GetX()/2)
        result:SetY(result:GetY()/2)  
        result:SetZ(0)
        return result
    end 

    local result = b + c
    result:SetX(result:GetX()/2)
    result:SetY(result:GetY()/2)  
    result:SetZ(0)
    return result
end

function Axe.circumCenter(a, b, c)
    a:SetZ(0)
    b:SetZ(0)
    c:SetZ(0)
    
    local xa = a:GetX()
    local ya = a:GetY()
    local xb = b:GetX()
    local yb = b:GetY()
    local xc = c:GetX()
    local yc = c:GetY()

    local delta = 2*(xa-xb)*(yc-yb) - 2*(ya-yb)*(xc-xb)
    local deltaX = (yc-yb)*(xa*xa + ya*ya - xb*xb - yb*yb) - (ya-yb)*(xc*xc + yc*yc - xb*xb - yb*yb)
    local deltaY = (xa-xb)*(xc*xc + yc*yc - xb*xb - yb*yb) - (xc-xb)*(xa*xa + ya*ya - xb*xb - yb*yb) 

    local resultX = deltaX/delta
    local resultY = deltaY/delta
    return Vector(resultX, resultY, 0)
end

function Axe.castUlt(myHero, pos)
local lastcasttime = 0
local myMana = NPC.GetMana(myHero)
local pipe = NPC.GetItem(myHero, "item_pipe", true)
local arg = NPC.GetAbilityByIndex(myHero, 0)
local ult = NPC.GetAbilityByIndex(myHero,1)
local blik = NPC.GetItem(myHero, "item_blink", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
local sviva = NPC.GetItem(myHero, "item_shivas_guard", true)
local lotus = NPC.GetItem(myHero, "item_lotus_orb", true)
local bm = NPC.GetItem(myHero, "item_blade_mail", true)



   if blik ~= nill and Ability.IsCastable(ult, myMana) and Ability.IsReady(blik) then
        if NPC.IsPositionInRange(myHero, pos, 1200, 0) then
		    if bkb and Menu.IsEnabled(Axe.bkb) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
			if bm and Ability.IsReady(bm) then Ability.CastNoTarget(bm) end
			if pipe and Menu.IsEnabled(Axe.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
		    if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
            Ability.CastPosition(blik, pos)
	  else
	  local dir = pos - NPC.GetAbsOrigin(myHero)
            dir:SetZ(0)
            dir:Normalize()
            dir:Scale(1199)
            local destination = NPC.GetAbsOrigin(myHero) + dir
				    if bkb and Menu.IsEnabled(Axe.bkb) and Menu.IsEnabled(Axe.pipeEnable) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
						if bm and Ability.IsReady(bm) then Ability.CastNoTarget(bm) end
						if pipe and Menu.IsEnabled(Axe.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
            if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
            Ability.CastPosition(blik, destination)
			
	   end
	end

	
	if  Ability.IsCastable(arg, myMana) then 
	Ability.CastNoTarget(arg, true)
    end
	if sviva and  Ability.IsCastable(sviva, myMana) then Ability.CastNoTarget(sviva)   end

	end


	
	function Axe.centroid(a, b, c )
    local result = a + b + c
    result:SetX(result:GetX()/3)
    result:SetY(result:GetY()/3)
    result:SetZ(0)
    return result
end

function Axe.validateCenter(center, myHero)
    local numOfEnemyInRadius = 0
    local myTeam = Entity.GetTeamNum( myHero )

    for i = 1, Heroes.Count() do
        local hero = Heroes.Get(i)
        if not NPC.IsIllusion(hero) then
            local sameTeam = Entity.GetTeamNum(hero) == myTeam
            if not sameTeam then
                if NPC.IsPositionInRange(hero, center, 300, 0) then 
                    numOfEnemyInRadius = numOfEnemyInRadius + 1
                end
            end
        end
    end
    
    return numOfEnemyInRadius
end 

function Axe.ITABcombo()

local myHero = Heroes.GetLocal()

local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) --!
if not hero then return end

local heroPos = NPC.GetAbsOrigin(hero)
local stan = NPC.GetAbilityByIndex(myHero,0)
local ult = NPC.GetAbilityByIndex(myHero,1)
lastcasttime = 0
local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
local lotus = NPC.GetItem(myHero,"item_lotus_orb", true)
local bm = NPC.GetItem(myHero,"item_blade_mail", true)
local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
local crest = NPC.GetItem(myHero, "item_solar_crest", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
local crimson = NPC.GetItem(myHero, "item_crimson_guard", true)
local staff = NPC.GetItem(myHero, "item_force_staff")
local pipe = NPC.GetItem(myHero, "item_pipe")
 local myMana = NPC.GetMana(myHero)
 local blik = NPC.GetItem(myHero, "item_blink", true) 
 local mousePos = Input.GetWorldCursorPos()
  --lotus
 if lotus and Ability.IsCastable(lotus,myMana)  then Ability.CastTarget(lotus,myHero)  end
 
 if bkb and Ability.IsCastable(bkb,myMana) and Menu.IsEnabled(Axe.bkbEnable) and Menu.IsEnabled(Axe.bkbEnable) then Ability.CastNoTarget(bkb)  end
 if crimson and Ability.IsCastable(crimson, myMana)  then Ability.CastNoTarget(crimson)  end
 if pipe and Ability.IsCastable(pipe, myMana)  and Menu.IsEnabled(Axe.pipeEnable) then Ability.CastNoTarget(pipe)  end
 --blink 
 
 if blik ~= nill and Ability.IsCastable(ult, myMana) and Ability.IsReady(blik) then
        if NPC.IsPositionInRange(myHero,  NPC.GetAbsOrigin(hero), 1200, 0) then
		    if bkb and Menu.IsEnabled(Axe.bkb) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
			if bm and Ability.IsReady(bm) then Ability.CastNoTarget(bm) end
			if pipe and Menu.IsEnabled(Axe.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
		    if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
            Ability.CastPosition(blik, heroPos)
	  else
	  local dir = NPC.GetAbsOrigin(hero)- NPC.GetAbsOrigin(myHero)
            dir:SetZ(0)
            dir:Normalize()
            dir:Scale(1199)
            local destination = NPC.GetAbsOrigin(myHero) + dir
				    if bkb and Menu.IsEnabled(Axe.bkb) and Menu.IsEnabled(Axe.pipeEnable) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
						if bm and Ability.IsReady(bm) then Ability.CastNoTarget(bm) end
						if pipe and Menu.IsEnabled(Axe.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
            if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
            Ability.CastPosition(blik, destination)
			
	   end
	end
 
  if bm and hero and Ability.IsCastable(bm, myMana) then Ability.CastNoTarget(bm)  end
 if shiva and Ability.IsCastable(shiva,myMana) then Ability.CastNoTarget(shiva)  end
 --medallion
 if medallion and Ability.IsCastable(medallion,myMana) then Ability.CastTarget(medallion,hero)  end
 if crest and Ability.IsCastable(crest,myMana) then Ability.CastTarget(crest,hero) return end
 
 
 if Ability.IsCastable(stan, myMana)   then
 Ability.CastNoTarget(stan, true)
lastcasttime = os.clock() 
  end
  
  if not Ability.GetCastPoint(stan) and Ability.IsCastable(ult, myMana) then Ability.CastTarget(ult,hero) end

 end


return Axe
