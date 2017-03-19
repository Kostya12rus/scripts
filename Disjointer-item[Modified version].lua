local Disjointer = {}

Disjointer.disjointOption = Menu.AddOption({ "Awareness", "Avoid skill-Item" }, "Enabled", "Avoid skill for Items")

Disjointer.optionBladeMail = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Blade Mail", "")
Disjointer.optionPipe = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Pipe", "")
Disjointer.optionHood = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Hood", "")
Disjointer.optionLink = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Link Spehere", "")
Disjointer.optionCyclone = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Euls Scepter", "")
Disjointer.optionManta = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Manta", "")
Disjointer.optionLotus = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Lotus_orb", "")
Disjointer.optionGlimmer = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Glimmer Cape", "")
Disjointer.optionShadow = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Shadow Blade", "")
Disjointer.optionSilver = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Silver Edge", "")
Disjointer.optionBlink = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Used Blink", "")
Disjointer.optionFriend = Menu.AddOption({ "Awareness", "Avoid skill-Item"}, "Enabled Team_friend", "")

function Disjointer.OnProjectile(projectile)
    if not Menu.IsEnabled(Disjointer.disjointOption) then return end
    if not projectile.source or not projectile.target then return end
    if not projectile.dodgeable then return end
    if not Entity.IsHero(projectile.source) then return end
	
	

        local myHero = Heroes.GetLocal()
	local myTeam = Entity.GetTeamNum( projectile.source, projectile.target )
	local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_FRIEND)
	local heroPos = Entity.GetAbsOrigin(hero)
	local myMana = NPC.GetMana(myHero)
	
	 --风杖 cyclone
	local cyclone = NPC.GetItem(myHero, "item_cyclone", true)
	--分身斧 manta
	local manta = NPC.GetItem(myHero, "item_manta", true)
	--莲花球 lotus_orb
	local lotus_orb = NPC.GetItem(myHero, "item_lotus_orb", true)
	--微光披风 Glimmer Cape 
	local glimmer_cape = NPC.GetItem(myHero, "item_glimmer_cape", true)
	--隐刀 Shadow Blade
	local shadow_blade = NPC.GetItem(myHero, "item_invis_sword", true)
	--大隐刀 Silver Edge
	local silver_edge = NPC.GetItem(myHero, "item_silver_edge", true)
        --跳刀 blink
	local blink = NPC.GetItem(myHero, "item_blink", true)
        --跳刀 Link Sphere
	local link_sphere = NPC.GetItem(myHero, "item_sphere", true)
        --跳刀 Hood
	local Hood_of_Defiance = NPC.GetItem(myHero, "item_hood_of_defiance", true)
        --跳刀 Pipe
	local Pipe_of_Insight = NPC.GetItem(myHero, "item_pipe", true)
        --跳刀 Blade Mail
	local Blade_Mail = NPC.GetItem(myHero, "item_blade_mail", true) 

	
	if projectile.isAttack then  return   end
	
	
	if myTeam then   --if TEAM_FRIEND
		if projectile.target == myHero then  --target myHero
                        if Menu.IsEnabled(Disjointer.optionBladeMail) and Blade_Mail and Ability.IsCastable(Blade_Mail, myMana) then Ability.CastNoTarget(Blade_Mail); return end
                        if Menu.IsEnabled(Disjointer.optionPipe) and Pipe_of_Insight and Ability.IsCastable(Pipe_of_Insight, myMana) then Ability.CastNoTarget(Pipe_of_Insight); return end
                        if Menu.IsEnabled(Disjointer.optionHood) and Hood_of_Defiance and Ability.IsCastable(Hood_of_Defiance, myMana) then Ability.CastNoTarget(Hood_of_Defiance); return end 
			if Menu.IsEnabled(Disjointer.optionCyclone) and cyclone and Ability.IsCastable(cyclone, myMana) then Ability.CastTarget(cyclone, myHero); return end
			if Menu.IsEnabled(Disjointer.optionManta) and manta and Ability.IsCastable(manta, myMana) then Ability.CastNoTarget(manta); return end 
			if Menu.IsEnabled(Disjointer.optionLotus) and lotus_orb and Ability.IsCastable(lotus_orb, myMana) then Ability.CastTarget(lotus_orb, myHero); return end 
			if Menu.IsEnabled(Disjointer.optionGlimmer) and glimmer_cape and Ability.IsCastable(glimmer_cape, myMana) then Ability.CastTarget(glimmer_cape, myHero); return end 
			if Menu.IsEnabled(Disjointer.optionShadow) and shadow_blade and Ability.IsCastable(shadow_blade, myMana) then Ability.CastNoTarget(shadow_blade); return end 
			if Menu.IsEnabled(Disjointer.optionSilver) and silver_edge and Ability.IsCastable(silver_edge, myMana) then Ability.CastNoTarget(silver_edge); return end 
			if Menu.IsEnabled(Disjointer.optionBlink) and blink and Ability.IsCastable(blink, myMana) then Ability.CastPosition(blink, heroPos); return end 
		else  --target TEAM_FRIEND
		    if Menu.IsEnabled(Disjointer.optionFriend) then  --TEAM_FRIEND
                                if Menu.IsEnabled(Disjointer.optionPipe) and Pipe_of_Insight and NPC.IsEntityInRange(myHero, projectile.target, 900) and Ability.IsCastable(Pipe_of_Insight, myMana) then Ability.CastNoTarget(Pipe_of_Insight); return end
                                if Menu.IsEnabled(Disjointer.optionLink) and link_sphere and Ability.IsCastable(link_sphere, myMana) then Ability.CastTarget(link_sphere, projectile.target); return end
                                if Menu.IsEnabled(Disjointer.optionLotus) and lotus_orb and Ability.IsCastable(lotus_orb, myMana) then Ability.CastTarget(lotus_orb, projectile.target); return end 
				if Menu.IsEnabled(Disjointer.optionGlimmer) and glimmer_cape and  NPC.IsEntityInRange(myHero, projectile.target, 1050) and Ability.IsCastable(glimmer_cape, myMana) then Ability.CastTarget(glimmer_cape, projectile.target); return end 
			end
		end
	else
		return
	end

end

return Disjointer
