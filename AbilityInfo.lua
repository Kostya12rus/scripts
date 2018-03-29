local AbilityInfom = {}
AbilityInfom.optionEnable = Menu.AddOption({"Kostya12rus", "Ability Info"}, "On/Off script", "Shows used abilities")
AbilityInfom.SizePanel = Menu.AddOption({"Kostya12rus", "Ability Info"}, "Panel size", "customizing the panel size", 50, 500, 10)

function AbilityInfom.OnLinearProjectileCreate(projectile)
	if not Menu.IsEnabled(AbilityInfom.optionEnable) then return end
	if not Heroes.GetLocal() then return end
	local temptable = {}
	if not Entity.IsSameTeam(Heroes.GetLocal(),projectile.source) then
		if projectile.name == "mirana_spell_arrow" then
			temptable = 
			{
				name = "mirana_arrow",
				sourse = projectile.source,
				target = projectile.source,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		end
	end
end

function AbilityInfom.OnParticleCreate(particle)
	if not Menu.IsEnabled(AbilityInfom.optionEnable) then return end
	if not Heroes.GetLocal() then return end
	local temptable = {}
	if (particle.entity and not Entity.IsSameTeam(Heroes.GetLocal(),particle.entity)) or not particle.entity then
		if particle.name == "smoke_of_deceit" then
			temptable = 
			{
				name = "smoke_of_deceit",
				sourse = nil,
				target = nil,
				timer = GameRules.GetGameTime() + 10,
				format = true,
				numberpart = particle.index,
				vector = nil
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "nyx_assassin_vendetta_start" then
			temptable = 
			{
				name = "nyx_assassin_vendetta",
				sourse = nil,
				target = nil,
				timer = GameRules.GetGameTime() + 20,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "spirit_breaker_charge_start" then
			temptable = 
			{
				name = "spirit_breaker_charge_of_darkness",
				sourse = particle.entity,
				target = nil,
				timer = GameRules.GetGameTime() + 10,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "mirana_moonlight_cast" then
			temptable = 
			{
				name = "mirana_invis",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 20,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "clinkz_windwalk" then
			temptable = 
			{
				name = "clinkz_wind_walk",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "bounty_hunter_windwalk" then
			temptable = 
			{
				name = "bounty_hunter_wind_walk",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "sven_spell_gods_strength" then
			temptable = 
			{
				name = "sven_gods_strength",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 10,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "wisp_relocate_channel" then
			temptable = 
			{
				name = "wisp_relocate",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "lycan_shapeshift_cast" then
			temptable = 
			{
				name = "lycan_shapeshift",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "alchemist_unstableconc_bottles" then
			temptable = 
			{
				name = "alchemist_unstable_concoction_throw",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "alchemist_chemichalrage_effect" then
			temptable = 
			{
				name = "alchemist_chemical_rage",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "centaur_stampede" then
			temptable = 
			{
				name = "centaur_stampede",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "teleport_start" and not Entity.IsSameTeam(Heroes.GetLocal(),particle.entityForModifiers) then
			temptable = 
			{
				name = "tpscroll",
				sourse = particle.entityForModifiers,
				target = particle.entityForModifiers,
				timer = GameRules.GetGameTime() + 4,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "sandking_epicenter_tell" then
			temptable = 
			{
				name = "sandking_epicenter",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "pudge_meathook" and not Entity.IsSameTeam(Heroes.GetLocal(),particle.entityForModifiers) then
			temptable = 
			{
				name = "pudge_meat_hook",
				sourse = particle.entityForModifiers,
				target = nil,
				timer = GameRules.GetGameTime() + 5,
				format = true,
				numberpart = particle.index,
				startpos = nil,
				endpos = nil
			}
			table.insert(wellwellpel,temptable)
		elseif particle.name == "ursa_enrage_buff" then
			temptable = 
			{
				name = "ursa_enrage",
				sourse = particle.entity,
				target = particle.entity,
				timer = GameRules.GetGameTime() + 5,
				format = true
			}
			table.insert(wellwellpel,temptable)
		end
	end
	if particle.name == "roshan_spawn" then
		temptable = 
		{
			name = "roshan_halloween_angry",
			sourse = nil,
			target = nil,
			timer = GameRules.GetGameTime() + 20,
			format = true
		}
		table.insert(wellwellpel,temptable)
	elseif particle.name == "roshan_slam" then
		temptable = 
		{
			name = "roshan_slam",
			sourse = nil,
			target = nil,
			timer = GameRules.GetGameTime() + 5,
			format = true
		}
		table.insert(wellwellpel,temptable)
	end
end

function AbilityInfom.OnParticleUpdate(particle)
	for _,parttable in pairs(wellwellpel) do
		if parttable and particle.index == parttable.numberpart then
			if parttable.name == "smoke_of_deceit" and particle.controlPoint == 0 then
				parttable.vector = particle.position
			elseif parttable.name == "pudge_meat_hook" and particle.controlPoint == 1 then
				parttable.endpos = particle.position
				parttable.target = AbilityInfom.FindTargetVector(parttable.startpos,particle.position)
			end
		end
	end
end

function AbilityInfom.OnParticleUpdateEntity(particle)
	for _,parttable in pairs(wellwellpel) do
		if parttable and particle.index == parttable.numberpart then
			if parttable.name == "pudge_meat_hook" and particle.controlPoint == 0 then
				parttable.startpos = particle.position
			end
		end
	end
end

function AbilityInfom.OnUpdate()
	if not Menu.IsEnabled(AbilityInfom.optionEnable) then drawimg = false return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	local npcSource = nil
	local npcTarget = nil
	local nameabill = nil
	for _,npc1 in pairs(NPCs.GetAll()) do
		if npc1 and NPC.HasModifier(npc1,"modifier_invoker_sun_strike") and not Entity.IsSameTeam(Heroes.GetLocal(),npc1) and timerss <= GameRules.GetGameTime() then
			nameabill = "invoker_sun_strike"
			for _,nps2 in pairs(NPCs.GetAll()) do
				if nps2 and not Entity.IsSameTeam(Heroes.GetLocal(),nps2) and NPC.HasAbility(nps2,"invoker_sun_strike") then
					npcSource = nps2
				end
			end
			local heroinradius = Heroes.InRadius(Entity.GetAbsOrigin(npc1),1000,Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_FRIEND)
			if #heroinradius ~= 0 then
				npcTarget = heroinradius[1]
			end
			timerss = GameRules.GetGameTime() + 3
		elseif npc1 and NPC.HasModifier(npc1,"modifier_kunkka_torrent_thinker") and not Entity.IsSameTeam(Heroes.GetLocal(),npc1) and timertorrent <= GameRules.GetGameTime() then
			nameabill = "kunkka_torrent"
			for _,nps2 in pairs(NPCs.GetAll()) do
				if nps2 and not Entity.IsSameTeam(Heroes.GetLocal(),nps2) and NPC.HasAbility(nps2,"kunkka_torrent") then
					npcSource = nps2
				end
			end
			local heroinradius = Heroes.InRadius(Entity.GetAbsOrigin(npc1),1000,Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_FRIEND)
			if #heroinradius ~= 0 then
				npcTarget = heroinradius[1]
			end
			timertorrent = GameRules.GetGameTime() + 3
		end 
		if npc1 and NPC.HasModifier(npc1,"modifier_item_invisibility_edge_windwalk") and not NPC.HasState(npc1,Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not Entity.IsSameTeam(Heroes.GetLocal(),npc1) then
			local writeinfo = true
			for _,abiltable in pairs(wellwellpel) do
				if abiltable.name == "invis_sword" and npc1 == abiltable.sourse then
					writeinfo = false
				end
			end
			if writeinfo then
				local temptable1 = 
				{
					name = "invis_sword",
					sourse = npc1,
					target = npc1,
					timer = GameRules.GetGameTime() + 5,
					format = true
				}
				table.insert(wellwellpel,temptable1)
			end
		elseif npc1 and NPC.HasModifier(npc1,"modifier_item_silver_edge_windwalk") and not NPC.HasState(npc1,Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not Entity.IsSameTeam(Heroes.GetLocal(),npc1) then
			local writeinfo = true
			for _,abiltable in pairs(wellwellpel) do
				if abiltable.name == "silver_edge" and npc1 == abiltable.sourse then
					writeinfo = false
				end
			end
			if writeinfo then
				local temptable1 = 
				{
					name = "silver_edge",
					sourse = npc1,
					target = npc1,
					timer = GameRules.GetGameTime() + 5,
					format = true
				}
				table.insert(wellwellpel,temptable1)
			end
		end
	end
	if npcSource or npcTarget then
		local temptable = 
		{
			name = nameabill,
			sourse = npcSource,
			target = npcTarget,
			timer = GameRules.GetGameTime() + 3,
			format = true
		}
		local writess = true
		local writetorent = true
		for _,abiltable in pairs(wellwellpel) do
			if abiltable.name == "invoker_sun_strike" and timerss > GameRules.GetGameTime()then
				writess = false
			elseif abiltable.name == "kunkka_torrent" and timertorrent > GameRules.GetGameTime() then
				writetorent = false
			end
		end
		if writess or writetorent then
			table.insert(wellwellpel,temptable)
		end
	end
	for i,clear in pairs(wellwellpel) do
		if clear then
			if clear.timer <= GameRules.GetGameTime() then
				wellwellpel[i] = nil
			end
			if not clear.sourse or not clear.target then
				for _,hero in pairs(NPCs.GetAll()) do
					if not Entity.IsSameTeam(Heroes.GetLocal(),hero) then
						if clear.name == "nyx_assassin_vendetta" and hero and NPC.HasAbility(hero,"nyx_assassin_vendetta") then
							clear.sourse = hero
							clear.target = hero
						elseif clear.name == "bounty_hunter_wind_walk" and hero and NPC.HasAbility(hero,"bounty_hunter_wind_walk") then
							clear.sourse = hero
							clear.target = hero
						elseif clear.name == "sven_gods_strength" and hero and NPC.HasAbility(hero,"sven_gods_strength") then
							clear.sourse = hero
							clear.target = hero
						end
					else
						if clear.name == "spirit_breaker_charge_of_darkness" and hero and NPC.HasModifier(hero,"modifier_spirit_breaker_charge_of_darkness_vision") then
							clear.target = hero
						end
						if clear.name == "smoke_of_deceit" and NPC.HasModifier(hero,"modifier_smoke_of_deceit") then
							if Entity.GetAbsOrigin(hero):Distance(clear.vector):Length2D() < 500 then
								wellwellpel[i] = nil
							end
						end
					end
				end
			end
		end
	end
	for i,hero in pairs(Heroes.GetAll()) do
		if hero then
			if not HeroImg[NPC.GetUnitName(hero)] then
				HeroImg[NPC.GetUnitName(hero)] = Renderer.LoadImage(heroIcon .. NPC.GetUnitName(hero) .. ".png")
			end
		end
	end
	drawimg = true
end

function AbilityInfom.OnDraw()
	if not Heroes.GetLocal() then return end
	if not drawimg then return end
	for i,abil in pairs(wellwellpel) do
		if abil then
			local img2 
			if abil.name == "smoke_of_deceit" or abil.name == "tpscroll" or abil.name == "invis_sword" or abil.name == "silver_edge" then
				if not HeroImg[abil.name] then
					HeroImg[abil.name] = Renderer.LoadImage("resource/flash3/images/items/" .. abil.name .. ".png")
				end
				img2 = HeroImg[abil.name]
			else
				if not HeroImg[abil.name] then
					HeroImg[abil.name] = Renderer.LoadImage(spellIconpath .. abil.name .. ".png")
				end
				img2 = HeroImg[abil.name]
			end
			
			local img1
			if abil.sourse then
				img1 = HeroImg[NPC.GetUnitName(abil.sourse)]
			else
				img1 = img2
			end
			
			local img3
			local imgformat = nil
			if abil.target then
				img3 = HeroImg[NPC.GetUnitName(abil.target)]
				imgformat = false
			else
				img3 = img2
				imgformat = true
			end
			AbilityInfom.DrawInfo(img1,img2,img3,i,imgformat)
		end
	end
end

function AbilityInfom.FindTargetVector(startpos,endpos)
	local rangehook = math.floor(startpos:Distance(endpos):Length2D())
	for i = 100,rangehook,100 do
		Log.Write(i)
		local VectorToEnd = AbilityInfom.GetVec(startpos,endpos,i)
		if VectorToEnd then
			local heroes = Heroes.InRadius(VectorToEnd,200,Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_FRIEND)
			if heroes[1] then
				return heroes[1]
			end
		end
	end
end

function AbilityInfom.GetVec(poss1,poss2,range)
	if poss1 and poss2 and range then
		local pos1 = poss1
		local pos2 = poss1
		local pos3 = poss2
		pos1:SetZ(0)
		pos3:SetZ(0)
		return pos2 + ((pos3 - pos1):Normalized()):Scaled(range)
	else
		return nil
	end
end

function AbilityInfom.DrawInfo(img1,img2,img3,index,formats)
	backgroundsize = Menu.GetValue(AbilityInfom.SizePanel)
	imgsize = math.ceil(backgroundsize*0.75)
	size_x, size_y = Renderer.GetScreenSize()
	
	Renderer.SetDrawColor(255,255,255,255)
	local posx = math.ceil(size_x-backgroundsize*3)
	local posy = math.ceil(size_y-200-backgroundsize*1.1*index)
	Renderer.DrawImage(blankcard,posx,posy,backgroundsize*3,backgroundsize)
	
	
	local imgposx1 = math.ceil(posx+backgroundsize*0.39)
	local imgposy1 = math.ceil(posy + (backgroundsize-imgsize)/2)
	Renderer.DrawImage(img1,imgposx1,imgposy1,math.ceil(imgsize*0.80),imgsize)
	
	local imgsize2 = math.ceil(imgsize*0.9)
	local imgposx2 = math.ceil(posx+(backgroundsize*3)/2-imgsize2/2)
	local imgposy2 = math.ceil(posy + (backgroundsize-imgsize2)/2)
	Renderer.DrawImage(img2,imgposx2,imgposy2,imgsize2,imgsize2)
	
	local imgposx3 = math.ceil(posx+backgroundsize*2)
	local imgposy3 = math.ceil(posy + (backgroundsize-imgsize)/2)
	if formats then
		Renderer.DrawImage(img3,imgposx3,imgposy3,imgsize,imgsize)
	else
		Renderer.DrawImage(img3,imgposx3,imgposy3,math.ceil(imgsize*0.80),imgsize)
	end
end

function AbilityInfom.init()
	blankcard = Renderer.LoadImage('resource/flash3/images/heroes/selection/blankcard_loadout.png')
	cleercard = Renderer.LoadImage('resource/flash3/images/spellicons/invoker_empty1.png')
	heroIcon = "resource/flash3/images/heroes/selection/"
	heroIconpaths = "resource/flash3/images/heroes/"
	spellIconpath = "resource/flash3/images/spellicons/"
	ItemIconpath = "resource/flash3/images/items/"
	HeroImg = {}
	timerss = 0
	timertorrent = 0
	drawimg = false
	wellwellpel = {}
	InvisInfo = {}
end

function AbilityInfom.OnGameStart()
  AbilityInfom.init()
end

function AbilityInfom.OnGameEnd()
  AbilityInfom.init()
end
AbilityInfom.init()

return AbilityInfom