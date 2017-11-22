local MeepoHazk = {}
MeepoHazk.optionEnable = Menu.AddOption({"Kostya12rus","MeepoPeppa"},"Activate", "")
MeepoHazk.optionKey = Menu.AddKeyOption({"Kostya12rus","MeepoPeppa"},"Key for waltz",Enum.ButtonCode.KEY_F)
MeepoHazk.FontSkill = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function MeepoHazk.OnUpdate()
	if not Menu.IsEnabled(MeepoHazk.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	if Menu.IsKeyDownOnce(MeepoHazk.optionKey) then 
		local ypos = 100
		for i=1,Heroes.Count() do
			local hero = Heroes.Get(i)
			
			if Entity.IsHero(hero) and Entity.IsAlive(hero) and not NPC.IsIllusion(hero) and Entity.IsSameTeam(hero,myHero) and hero ~= myHero then
				
				if NPC.GetUnitName(hero) == "npc_dota_hero_meepo" then
				
					Renderer.DrawText(MeepoHazk.FontSkill, 500, ypos, NPC.GetUnitName(hero), 1)
					ypos = ypos + 14			
					poof = NPC.GetAbility(hero, "meepo_poof")
					if poof and Ability.IsCastable(poof, NPC.GetMana(hero)) and Ability.IsReady(poof) then 
						MeepoHazk.NeedPoof(hero,myHero,poof)
					end
				end
			end
		end
	end
end

function MeepoHazk.NeedPoof(hero,myhero,poof)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, myhero, Vector(0,0,0), poof, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,hero)
	return
end

function MeepoHazk.init()

end

function MeepoHazk.OnGameStart()

end

function MeepoHazk.OnGameEnd()

end
return MeepoHazk