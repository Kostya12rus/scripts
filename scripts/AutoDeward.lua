local AD = {}

AD.optionEnable = Menu.AddOption({ "Awareness", "Auto Deward" }, "Enable", "Auto Deward. Script by Rednelss")
AD.tango = Menu.AddOption({ "Awareness", "Auto Deward" }, "Tango", "Tango Auto Deward. Script by Rednelss")

local time = os.clock()

function AD.OnUpdate()
	if not Menu.IsEnabled(AD.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	local myTeam = Entity.GetTeamNum(myHero)
	local it = NPC.GetItem(myHero, "item_iron_talon", true)
	local bf = NPC.GetItem(myHero, "item_bfury", true)
	local qb = NPC.GetItem(myHero, "item_quelling_blade", true)
	local tango = NPC.GetItem(myHero, "item_tango", true)
	for i = 1, NPCs.Count() do
		local tNPC = NPCs.Get(i)
		local sameTeam = Entity.GetTeamNum(tNPC) == myTeam
		if not sameTeam and not Entity.IsDormant(tNPC) and Entity.GetHealth(tNPC) > 0 then
			if NPC.GetUnitName(tNPC) == "npc_dota_observer_wards" or NPC.GetUnitName(tNPC) == "npc_dota_sentry_wards" then
				if NPC.IsEntityInRange(tNPC, myHero, 435) and (os.clock() - time) > 0.5 then
					if it and Ability.IsReady(it) then
						Ability.CastTarget(it, tNPC)
					end
					if bf and Ability.IsReady(bf) then
						Ability.CastTarget(bf, tNPC)
					end
					if qb and Ability.IsReady(qb) then
						Ability.CastTarget(qb, tNPC)
					end
					if Menu.IsEnabled(AD.tango) then
						if tango and Ability.IsReady(tango) then
							Ability.CastTarget(tango, tNPC)
						end
					end
					time = os.clock()
				end
			end
		end
	end
end

return AD
