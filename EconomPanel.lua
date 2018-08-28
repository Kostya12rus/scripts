local EconomPanel = {}
EconomPanel.optionEnable = Menu.AddOption({"Utility", "EconomPanel"}, "Activation", "")
EconomPanel.KeySetting = Menu.AddKeyOption({"Utility", "EconomPanel"}, "Key for Setting", Enum.ButtonCode.BUTTON_CODE_NONE)

function EconomPanel.OnUpdate()
	if not Menu.IsEnabled(EconomPanel.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end
	playert = {}
	for i,hero in pairs(Heroes.GetAll()) do
		if hero and EconomPanel.NeedAdd(hero) then
			havemoney = 0
			for j = 0,14 do
				local item = NPC.GetItemByIndex(hero,j)
				if item and Entity.IsAbility(item) and Item.GetCost(item) then
					local cost = Item.GetCost(item)
					if Ability.GetName(item) == "item_tango" then
						havemoney = havemoney + Item.GetCurrentCharges(item)*(cost/3)
					elseif Ability.GetName(item) == "item_dust" then
						havemoney = havemoney + Item.GetCurrentCharges(item)*(cost/2)
					elseif 	Ability.GetName(item) == "item_tpscroll" or 
							Ability.GetName(item) == "item_ward_observer" or 
							Ability.GetName(item) == "item_ward_sentry" or 
							Ability.GetName(item) == "item_clarity" or 
							Ability.GetName(item) == "item_flask" or
							Ability.GetName(item) == "item_smoke_of_deceit" then
						havemoney = havemoney + Item.GetCurrentCharges(item)*(cost)
					elseif Ability.GetName(item) == "item_ward_dispenser" and Item.GetCurrentCharges(item) > 1 then
						havemoney = havemoney + (cost) + (Item.GetCurrentCharges(item)-1)*cost
					else
						havemoney = havemoney + cost
					end
				end
			end
			table.insert(playert,{hero, math.floor(havemoney)})
		end
	end
	table.sort(playert, function(t1, t2) return t1[2] > t2[2] end)
	if #playert >= 1 then
		canDraw = true
	end
end

function EconomPanel.OnDraw()
	if canDraw then
		xpos = Config.ReadInt("EconomPanel", "xpos", 200)
		ypos = Config.ReadInt("EconomPanel", "ypos", 200)
		sizeamountx = Config.ReadInt("EconomPanel", "sizeIcon", 200)
		visibility = Config.ReadInt("EconomPanel", "visibility", 200)
		
		sizeBarx = sizeamountx/2.5
		sizeBary = sizeBarx*0.55
		if settingactov then
			Renderer.SetDrawColor(100,255,100,visibility)
		else
			Renderer.SetDrawColor(255,100,100,visibility)
		end
		
		if not EconomPanel.Font then 
			EconomPanel.Font = Renderer.LoadFont("Tahoma", math.ceil(sizeBary*0.75), Enum.FontWeight.EXTRABOLD)
		end
		Renderer.DrawImage(settingicon, math.ceil(xpos), math.ceil(ypos-sizeBary), math.ceil(sizeBary), math.ceil(sizeBary))
		if Input.IsCursorInRect(math.ceil(xpos),math.ceil(ypos-sizeBary), math.ceil(sizeBary),math.ceil(sizeBary)) then
			if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
				settingactov = not settingactov 
			end
		end
		if settingactov then
			Renderer.SetDrawColor(255,255,255,visibility)
			Renderer.DrawImage(visicon, math.ceil(xpos+sizeBary), math.ceil(ypos-sizeBary), math.ceil(sizeBary), math.ceil(sizeBary))
			if Input.IsCursorInRect(math.ceil(xpos+sizeBary), math.ceil(ypos-sizeBary), math.ceil(sizeBary), math.ceil(sizeBary)) then
				if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
					vision = not vision 
					if setsize and vision then
						setsize = false
					end
				end
			end
			if vision then
				Renderer.SetDrawColor(0,0,0,visibility)
				Renderer.DrawFilledRect(math.ceil(xpos-sizeBary),math.ceil(ypos),math.ceil(sizeBary),math.ceil(sizeBary*10))
				Renderer.SetDrawColor(255,255,255,visibility)
				Renderer.DrawImage(ringicon,math.ceil(xpos-sizeBary),math.ceil(ypos+((visibility-55)/200)*(sizeBary*9)), math.ceil(sizeBary), math.ceil(sizeBary))
				if Input.IsCursorInRect(math.ceil(xpos-sizeBary),math.ceil(ypos),math.ceil(sizeBary),math.ceil(sizeBary*10)) then
					if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
						ringmove = not ringmove 
					end
				end
				if ringmove then
					if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
						ringmove = false
					end
					local _,y1 = Input.GetCursorPos()
					if y1 >= ypos+sizeBary/2 and y1 <= ypos+sizeBary*10 - sizeBary/2 then
						local prochenty = 200*((y1-ypos-sizeBary/2)/(sizeBary*9/100)/100)+55
						Config.WriteInt("EconomPanel", "visibility", math.ceil(prochenty))
					elseif y1 > ypos+sizeBary/2 then
						Config.WriteInt("EconomPanel", "visibility", 255)
					elseif y1 < ypos+sizeBary*10 - sizeBary/2 then
						Config.WriteInt("EconomPanel", "visibility", 55)
					end
				end
			end
			Renderer.DrawImage(closeicon, math.ceil(xpos + sizeamountx + sizeBary*0.90), math.ceil(ypos-sizeBary), math.ceil(sizeBary), math.ceil(sizeBary))
			if Input.IsCursorInRect(math.ceil(xpos + sizeamountx + sizeBary*0.90), math.ceil(ypos-sizeBary), math.ceil(sizeBary), math.ceil(sizeBary)) then
				if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
					closes = not closes 
					Config.WriteInt("EconomPanel", "closes", 0)
				end
			end	
			if closes then
				vision = false
				setsize = false
				Config.WriteInt("EconomPanel", "closes", 1)
			end
			Renderer.SetDrawColor(255,255,255,visibility)
			Renderer.DrawImage(setsizeicon, math.ceil(xpos+sizeBary*2),math.ceil(ypos-sizeBary),math.ceil(sizeBary),math.ceil(sizeBary))
			if Input.IsCursorInRect(math.ceil(xpos+sizeBary*2),math.ceil(ypos-sizeBary),math.ceil(sizeBary),math.ceil(sizeBary)) then
				if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
					setsize = not setsize 
					if setsize and vision then
						vision = false
					end
				end
			end
			if setsize then
				for i = 0,9 do
					local size = 300-(i*20+20)
					Renderer.SetDrawColor(0,0,0,visibility)
					Renderer.DrawFilledRect(math.ceil(xpos-sizeBarx),math.ceil(ypos+sizeBary*i),math.ceil(sizeBarx-2),math.ceil(sizeBary))
					Renderer.SetDrawColor(255,255,255,visibility)
					Renderer.DrawOutlineRect(math.ceil(xpos-sizeBarx),math.ceil(ypos+sizeBary*i),math.ceil(sizeBarx),math.ceil(sizeBary))
					Renderer.SetDrawColor(255,255,255,visibility)
					Renderer.DrawText(EconomPanel.Font, math.ceil(xpos-sizeBarx),math.ceil(ypos+sizeBary*i), size, 1)
					if Input.IsCursorInRect(math.ceil(xpos-sizeBarx),math.ceil(ypos+sizeBary*i),math.ceil(sizeBarx-2),math.ceil(sizeBary)) then
						if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
							EconomPanel.Font = Renderer.LoadFont("Tahoma", math.ceil((size/2.5)*0.55*0.75), Enum.FontWeight.EXTRABOLD)
							setsize = false
							Config.WriteInt("EconomPanel", "sizeIcon", size)
						end
					end
				end
			end
			if movepanel then
				Renderer.SetDrawColor(0,255,0,visibility)
				vision = false
				xpos,ypos = Input.GetCursorPos()
				Config.WriteInt("EconomPanel", "xpos", xpos)
				Config.WriteInt("EconomPanel", "ypos", ypos)
				if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then
					movepanel = not movepanel 
				end
				moveicon = moveicon2
			else
				Renderer.SetDrawColor(255,0,0,visibility)
				moveicon = moveicon1
			end
			Renderer.SetDrawColor(255,255,255,visibility)
			Renderer.DrawImage(moveicon, math.ceil(xpos-sizeBary),math.ceil(ypos-sizeBary),math.ceil(sizeBary),math.ceil(sizeBary))
			if Input.IsCursorInRect(math.ceil(xpos-sizeBary),math.ceil(ypos-sizeBary),math.ceil(sizeBary),math.ceil(sizeBary)) then
				if Menu.IsKeyDownOnce(EconomPanel.KeySetting) then 
					if not closes then
						movepanel = not movepanel 
					end
				end
			end
		end		
		if not closes and Config.ReadInt("EconomPanel", "closes", 0) == 0 then
			ypos = Config.ReadInt("EconomPanel", "ypos", 200)
			for i,hero in pairs(playert) do
				Renderer.SetDrawColor(255,255,255,visibility)
				if hero[1] and Entity.IsPlayer(Entity.GetOwner(hero[1])) then
					local imageHandle
					if heroicon[NPC.GetUnitName(hero[1])] then
						imageHandle = heroicon[NPC.GetUnitName(hero[1])]
					else
						heroicon[NPC.GetUnitName(hero[1])] = Renderer.LoadImage(string.gsub(heroIconpath, "*", NPC.GetUnitName(hero[1])))
					end
					local prochent = hero[2]/(playert[1][2]/100)/100
					Renderer.DrawImage(imageHandle, math.ceil(xpos), math.ceil(ypos), math.ceil(sizeBarx), math.ceil(sizeBary))
					xpos = xpos + sizeBarx
					if Entity.IsSameTeam(Heroes.GetLocal(),hero[1]) then
						Renderer.SetDrawColor(0,100,0,visibility)
					else
						Renderer.SetDrawColor(100,0,0,visibility)
					end
					Renderer.DrawFilledRect(math.ceil(xpos+1),math.ceil(ypos+1),math.ceil(sizeamountx*prochent),math.ceil(sizeBary-2))
					Renderer.SetDrawColor(0,0,0,visibility)
					Renderer.DrawOutlineRect(math.ceil(xpos),math.ceil(ypos),math.ceil(sizeamountx*prochent)+2,math.ceil(sizeBary))
					Renderer.SetDrawColor(0,255,255,visibility)
					Renderer.DrawTextCenteredY(EconomPanel.Font, math.ceil(xpos + 1), math.ceil(ypos+sizeBary/2), hero[2] .. "|" ..Player.GetNetWorth(Entity.GetOwner(hero[1])), 1) --
					ypos = ypos + sizeBary
					xpos = Config.ReadInt("EconomPanel", "xpos", 200)
					if not hero[1] then
						playert[i] = nil
					end
				end
			end
		end
	end
	Renderer.SetDrawColor(255,255,255,255)
end

function EconomPanel.NeedAdd(npc)
	for i,hero in pairs(playert) do
		if Entity.IsPlayer(Entity.GetOwner(npc)) and Entity.IsPlayer(Entity.GetOwner(hero[1])) then
			if hero and Player.GetPlayerData(Entity.GetOwner(hero[1])).steamid == Player.GetPlayerData(Entity.GetOwner(npc)).steamid then
				return false
			end
		end
	end
	return true
end

function EconomPanel.init()
	canDraw = false
	playert = {}
	heroIconpath = "panorama/images/heroes/*_png.vtex_c"
	moveicon1 = Renderer.LoadImage('resource/cursor/source/cursor_spell_default.png')
	moveicon2 = Renderer.LoadImage('resource/cursor/source/cursor_spell_illegal.png')
	moveicon = moveicon1
	movepanel = false
	settingicon = Renderer.LoadImage('panorama/images/control_icons/settings_png.vtex_c')
	settingactov = false
	closeicon = Renderer.LoadImage('panorama/images/control_icons/quit_png.vtex_c')
	closes = false
	visicon = Renderer.LoadImage('panorama/images/control_icons/eye_png.vtex_c')
	vision = false
	ringicon = Renderer.LoadImage('panorama/images/profile_badges/bg_02_psd.vtex_c')
	ringmove = false
	setsizeicon = Renderer.LoadImage('panorama/images/spellicons/modifier_invulnerable_png.vtex_c')
	setsize = false
	heroicon = {}
end

function EconomPanel.OnGameStart()
  EconomPanel.init()
end

function EconomPanel.OnGameEnd()
  EconomPanel.init()
end

EconomPanel.init()

return EconomPanel