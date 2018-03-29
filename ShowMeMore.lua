local ShowMeMore = {}
ShowMeMore.shrines = Menu.AddOption({"Kostya12rus","Show Me More"}, "Shrines Information", "A lot of information about the shrines")
ShowMeMore.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function ShowMeMore.OnDraw()
	if Heroes.GetLocal() then
		for _,npc in pairs(NPCs.GetAll()) do
			if Menu.IsEnabled(ShowMeMore.shrines) then
				local filler = NPC.GetAbility(npc,"filler_ability")
				if filler and (Entity.IsSameTeam(npc,Heroes.GetLocal()) or not Heroes.GetLocal())then
					ShowMeMore.ShrinesInfo(npc,filler)
				end
			else
				if particletable[npc] then
					Particle.Destroy(particletable[npc])
					particletable[npc] = nil
				end
			end
		end
	end
end

function ShowMeMore.ShrinesInfo(npc,filler)
	local x,y,vis = Renderer.WorldToScreen(Entity.GetAbsOrigin(npc))
	if vis then
		Renderer.SetDrawColor(29,49,54,200)
		Renderer.DrawFilledRect(x-102,y-12,204,24)
		if 300 - Ability.GetCooldown(filler) <= 5 then
			prochent = (5 - (300 - Ability.GetCooldown(filler))) / 5
		else
			prochent = (300 - Ability.GetCooldown(filler)) / 300
		end
			Renderer.SetDrawColor(0,208,255,100)
			Renderer.DrawFilledRect(x-100,y-10,math.floor(200*prochent),20)
		local shraininfo
		if Ability.IsReady(filler) then
			shraininfo = "Ready"
		else
			shraininfo = math.floor(prochent*100) .. "%"
		end
		if not particletable[npc] then
			particletable[npc] = {}
			particletable[npc] = Particle.Create("particles/econ/generic/generic_progress_meter/generic_progress_circle_b.vpcf")
			Particle.SetControlPoint(particletable[npc], 1, Vector(500, 1, 1))
			Particle.SetControlPoint(particletable[npc], 15, Vector(0, 208, 255))
			Particle.SetControlPoint(particletable[npc], 16, Vector(1, 0, 0))
		end
		if Ability.IsReady(filler) or NPC.HasModifier(npc,"modifier_filler_heal_aura") then
			Particle.SetControlPoint(particletable[npc], 0, Entity.GetAbsOrigin(npc))
		else
			Particle.Destroy(particletable[npc])
			particletable[npc] = nil
		end
		Renderer.SetDrawColor(255,0,0,255)
		Renderer.DrawTextCentered(ShowMeMore.Font,x+70,y, shraininfo,1)
	end
end

function ShowMeMore.init()
	trigerTimes = 0
	particletable = {}
end
function ShowMeMore.OnGameStart()
	ShowMeMore.init()
end
ShowMeMore.init()

return ShowMeMore