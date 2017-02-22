local magnus = {}

magnus.optionEnable = Menu.AddOption({"Hero Specific", "Magnus"}, "Enable",  "Combo - Huembo:D")
magnus.optionKey = Menu.AddKeyOption({"Hero Specific", "Magnus"}, "Key", Enum.ButtonCode.KEY_F)
magnus.bkb = Menu.AddOption({"Hero Specific", "Magnus"}, "USE BKB",  "")
magnus.pipeEnable = Menu.AddOption({"Hero Specific", "Magnus"}, "Use Pipe", "")
magnus.cache= {}

function magnus.OnUpdate()
    if not Menu.IsEnabled(magnus.optionEnable) then return true end
    if not Menu.IsKeyDown(magnus.optionKey) then return end
	
	local myHero = Heroes.GetLocal()

 if NPC.GetUnitName(myHero) ~= "npc_dota_hero_magnataur" then return end
	
	 
	local ultimate = NPC.GetAbilityByIndex(myHero,3)
	if ultimate == nill or not Ability.IsReady(ultimate) then return end
	local enemies = NPC.GetHeroesInRadius(myHero, 1500, Enum.TeamType.TEAM_ENEMY)
	
	local count = 0;
    local point = {}
    for i, enemy in ipairs(enemies) do
        count = count + 1;
        point[i] = NPC.GetAbsOrigin(enemy)
	end
	
	if count<2 then return end
	
	local maxCount = 0
	local finalPos = nill
	local j=0
	for i = 1, count do
	    for j=j+1, count do
		    for k=j+1, count do
		         magnus.processHeroes(myHero, point[i], point[j], point[k])
				 local tempPos = magnus.cache["pos"]
				 local tempCount = magnus.cache["count"]
				 if tempCount> maxCount then
				     maxCount = tempCount
					 finalPos = tempPos
					 end
			    end
		end
  end
  
  if finalPos == nill or maxCount<2 then return end
  
 magnus.castUlt(myHero, finalPos)
 end
 
 function magnus.processHeroes(myHero, hero1Pos, hero2Pos, hero3Pos)
 
    local centroid = magnus.centroid(hero1Pos, hero2Pos, hero3Pos)
    local ccs = magnus.circumCenter(hero1Pos, hero2Pos, hero3Pos)
    local mid = magnus.furthestMidPoint(hero1Pos, hero2Pos, hero3Pos)
	
	local centroidHeroCount = magnus.validateCenter(centroid,myHero)
    local ccsHeroCount = magnus.validateCenter(ccs,myHero)
    local midCount = magnus.validateCenter(mid,myHero)
	
	if centroidHeroCount < 2 and ccsHeroCount < 2 and midCount < 2 then
       
        magnus.cache["pos"] = nill
        magnus.cache["count"] = 0
        return 
    end
	
	   if centroidHeroCount >= ccsHeroCount and centroidHeroCount >= midCount then 
        magnus.cache["pos"] = centroid
        magnus.cache["count"] = centroidHeroCount
        return
    end
    if ccsHeroCount >= centroidHeroCount and ccsHeroCount >= midCount then 
        magnus.cache["pos"] = ccs
        magnus.cache["count"] = ccsHeroCount
        return
    end
	
   magnus.cache["pos"] = mid
    magnus.cache["count"] = midCount
    return result
    --magnus.castUlt(myHero, ccs) 
end

function magnus.furthestMidPoint(a, b, c)
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

function magnus.circumCenter(a, b, c)
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

function magnus.castUlt(myHero, pos)
local lastcasttime = 0
local myMana = NPC.GetMana(myHero)
local pipe = NPC.GetItem(myHero, "item_pipe", true)
local ult = NPC.GetAbilityByIndex(myHero,3)
local blik = NPC.GetItem(myHero, "item_blink", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
local sviva = NPC.GetItem(myHero, "item_shivas_guard", true)
local lotus = NPC.GetItem(myHero, "item_lotus_orb", true)



   if blik ~= nill and Ability.IsCastable(ult, myMana) and Ability.IsReady(blik) then
        if NPC.IsPositionInRange(myHero, pos, 1200, 0) then
		    if bkb and Menu.IsEnabled(magnus.bkb) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
			if pipe and Menu.IsEnabled(magnus.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
		    if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
            Ability.CastPosition(blik, pos)
	  else
	  local dir = pos - NPC.GetAbsOrigin(myHero)
            dir:SetZ(0)
            dir:Normalize()
            dir:Scale(1199)
            local destination = NPC.GetAbsOrigin(myHero) + dir
				    if bkb and Menu.IsEnabled(magnus.bkb) and Menu.IsEnabled(magnus.pipeEnable) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
						if pipe and Menu.IsEnabled(magnus.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
            if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
            Ability.CastPosition(blik, destination)
			
	   end
	end

	
	if ult and NPC.IsPositionInRange(myHero, pos, 410, 0)  and Ability.IsCastable(ult, myMana) then 
	Ability.CastNoTarget(ult, true)
    end
	if sviva and  Ability.IsCastable(sviva, myMana) then Ability.CastNoTarget(sviva)   end

	end


	
	function magnus.centroid(a, b, c )
    local result = a + b + c
    result:SetX(result:GetX()/3)
    result:SetY(result:GetY()/3)
    result:SetZ(0)
    return result
end

function magnus.validateCenter(center, myHero)
    local numOfEnemyInRadius = 0
    local myTeam = Entity.GetTeamNum( myHero )

    for i = 1, Heroes.Count() do
        local hero = Heroes.Get(i)
        if not NPC.IsIllusion(hero) then
            local sameTeam = Entity.GetTeamNum(hero) == myTeam
            if not sameTeam then
                if NPC.IsPositionInRange(hero, center, 410, 0) then 
                    numOfEnemyInRadius = numOfEnemyInRadius + 1
                end
            end
        end
    end
    
    return numOfEnemyInRadius
end 

return magnus
