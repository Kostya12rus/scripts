local Enigma = {}

Enigma.optionEnable = Menu.AddOption({"Hero Specific", "Enigma"}, "Enable",  "Combo - Huembo:D")
Enigma.optionKey = Menu.AddKeyOption({"Hero Specific", "Enigma"}, "Key", Enum.ButtonCode.KEY_F)
Enigma.bkb = Menu.AddOption({"Hero Specific", "Enigma"}, "USE BKB",  "")
Enigma.pipeEnable = Menu.AddOption({"Hero Specific", "Enigma"}, "Use Pipe", "")
Enigma.cache= {}
lastcasttime =0

function Enigma.OnUpdate()
    if not Menu.IsEnabled(Enigma.optionEnable) then return true end
    if not Menu.IsKeyDown(Enigma.optionKey) then return end
	
	local myHero = Heroes.GetLocal()

 if NPC.GetUnitName(myHero) ~= "npc_dota_hero_enigma" then return end
	
	 
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
		         Enigma.processHeroes(myHero, point[i], point[j], point[k])
				 local tempPos = Enigma.cache["pos"]
				 local tempCount = Enigma.cache["count"]
				 if tempCount> maxCount then
				     maxCount = tempCount
					 finalPos = tempPos
					 end
			    end
		end
  end
  
  if finalPos == nill or maxCount<2 then return end
  
  
 Enigma.castUlt(myHero, finalPos)

 end
 
 function Enigma.processHeroes(myHero, hero1Pos, hero2Pos, hero3Pos)
 
    local centroid = Enigma.centroid(hero1Pos, hero2Pos, hero3Pos)
    local ccs = Enigma.circumCenter(hero1Pos, hero2Pos, hero3Pos)
    local mid = Enigma.furthestMidPoint(hero1Pos, hero2Pos, hero3Pos)
	
	local centroidHeroCount = Enigma.validateCenter(centroid,myHero)
    local ccsHeroCount = Enigma.validateCenter(ccs,myHero)
    local midCount = Enigma.validateCenter(mid,myHero)
	
	if centroidHeroCount < 2 and ccsHeroCount < 2 and midCount < 2 then
       
        Enigma.cache["pos"] = nill
        Enigma.cache["count"] = 0
        return 
    end
	
	   if centroidHeroCount >= ccsHeroCount and centroidHeroCount >= midCount then 
        Enigma.cache["pos"] = centroid
        Enigma.cache["count"] = centroidHeroCount
        return
    end
    if ccsHeroCount >= centroidHeroCount and ccsHeroCount >= midCount then 
        Enigma.cache["pos"] = ccs
        Enigma.cache["count"] = ccsHeroCount
        return
    end
	
   Enigma.cache["pos"] = mid
    Enigma.cache["count"] = midCount
    return result
    --Enigma.castUlt(myHero, ccs) 
end

function Enigma.furthestMidPoint(a, b, c)
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

function Enigma.circumCenter(a, b, c)
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

function Enigma.castUlt(myHero, pos)
local lastcasttime = 0
local myMana = NPC.GetMana(myHero)
local pipe = NPC.GetItem(myHero, "item_pipe", true)
local ult = NPC.GetAbilityByIndex(myHero,3)
local Mpulse = NPC.GetAbilityByIndex(myHero,2)
local blik = NPC.GetItem(myHero, "item_blink", true)
local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
local sviva = NPC.GetItem(myHero, "item_shivas_guard", true)
local lotus = NPC.GetItem(myHero, "item_lotus_orb", true)




   if blik ~= nill and Ability.IsCastable(ult, myMana) and Ability.IsReady(blik) then
        if NPC.IsPositionInRange(myHero, pos, 1200, 0) then
		    if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
		    if bkb and Menu.IsEnabled(Enigma.bkb) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
			if pipe and Menu.IsEnabled(Enigma.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
		
            Ability.CastPosition(blik, pos)
			lastcasttime = os.clock()
			
	  else
	  local dir = pos - NPC.GetAbsOrigin(myHero)
            dir:SetZ(0)
            dir:Normalize()
            dir:Scale(1199)
            local destination = NPC.GetAbsOrigin(myHero) + dir
			 if lotus and Ability.IsCastable(lotus, myMana) then Ability.CastTarget(lotus, myHero) end
				    if bkb and Menu.IsEnabled(Enigma.bkb) and Menu.IsEnabled(Enigma.pipeEnable) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
						if pipe and Menu.IsEnabled(Enigma.pipeEnable) and Ability.IsCastable(pipe, myMana) then Ability.CastNoTarget(pipe) end
           
            Ability.CastPosition(blik, destination)
			lastcasttime = os.clock()
			
	   end
	   if Ability.IsCastable(Mpulse,myMana) then Ability.CastPosition(Mpulse, pos) end
	end

	if (os.clock() - lastcasttime) < 0.2 then return end
	if ult  and Ability.IsCastable(ult, myMana) then 
	Ability.CastPosition(ult, pos)
	lastcasttime2 = os.clock()
	if sviva and  Ability.IsCastable(sviva, myMana) then Ability.CastNoTarget(sviva)   end
	
    end
	
    	
	
end
	


	
	function Enigma.centroid(a, b, c )
    local result = a + b + c
    result:SetX(result:GetX()/3)
    result:SetY(result:GetY()/3)
    result:SetZ(0)
    return result
end

function Enigma.validateCenter(center, myHero)
    local numOfEnemyInRadius = 0
    local myTeam = Entity.GetTeamNum( myHero )

    for i = 1, Heroes.Count() do
        local hero = Heroes.Get(i)
        if not NPC.IsIllusion(hero) then
            local sameTeam = Entity.GetTeamNum(hero) == myTeam
            if not sameTeam then
                if NPC.IsPositionInRange(hero, center, 420, 0) then 
                    numOfEnemyInRadius = numOfEnemyInRadius + 1
                end
            end
        end
    end
    
    return numOfEnemyInRadius
end 

return Enigma
