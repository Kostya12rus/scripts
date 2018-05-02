local Overlay = {}
Overlay.Identity = "overlay"
Overlay.Locale = {
	["name"] = {
		["english"] = "Overlay",
		["russian"] = "Overlay",
		["chinese"] = "Overlay"
	},
	["desc"] = {
		["english"] = "Extra information",
		["russian"] = "Дополнительная информация",
		["chinese"] = "額外的信息"
	},
	["size"] = {
		["english"] = "Size",
		["russian"] = "Размер",
		["chinese"] = "大小"
	},
	["show"] = {
		["english"] = "Show item panel",
		["russian"] = "Показывать панель предметов",
		["chinese"] = "显示物品栏面板"
	},
	["cd"] = {
		["english"] = "Show item cooldown",
		["russian"] = "Показывать время перезарядки предмета",
		["chinese"] = "显示物品冷却时间"
	},
	["charges"] = {
		["english"] = "Show item charges",
		["russian"] = "Показывать заряды предметов",
		["chinese"] = "显示物品个数"
	},
	["notify"] = {
		["english"] = "Notify when enemy buy an item",
		["russian"] = "Уведомлять когда противники покупают предмет",
		["chinese"] = "推送物品通知栏"
	},
	["items"] = {
		["english"] = "Items to notify",
		["russian"] = "Уведомлять о предметах",
		["chinese"] = "通知"
	},
	["bought"] = {
		["english"] = "has item",
		["russian"] = "получил предмет",
		["chinese"] = "有物品"
	},
	["time"] = {
		["english"] = "Time to notify",
		["russian"] = "Время уведомления",
		["chinese"] = "通知栏持续时间"
	},
	["above"] = {
		["english"] = "Show items above the hero",
		["russian"] = "Показывать предметы над героем",
		["chinese"] = "显示英雄之上的物品"
	},
	["aboveoffset"] = {
		["english"] = "Offset",
		["russian"] = "Смещением предметов",
		["chinese"] = "对象的位移"
	},
	["opacity"] = {
		["english"] = "Opacity",
		["russian"] = "Непрозрачность",
		["chinese"] = "不透明度"
	},
	["removeopacity"] = {
		["english"] = "Make opaque on mouseover",
		["russian"] = "Сделать непрозрачным при наведении курсора мыши",
		["chinese"] = "使鼠标悬停不透明"
	},
	["showextrainvent"] = {
		["english"] = "Show extra inventory",
		["russian"] = "Показывать запасной инвентарь",
		["chinese"] = "顯示額外的庫存"
	},
	["showally"] = {
		["english"] = "Show allies",
		["russian"] = "Показывать союзников",
		["chinese"] = "顯示盟友"
	},
	["itemalert"] = {
		["english"] = "Ping item when click",
		["russian"] = "Пинговать предмет по клику",
		["chinese"] = "Ping项目点击"
	},
	["showwards"] = {
		["english"] = "Show how much placed observer / sentry",
		["russian"] = "Показать сколько установлено observer / sentry",
		["chinese"] = "顯示安裝了多少個 observer / sentry"
	},
	["showstat"] = {
		["english"] = "Show networth / hero damage / gold spent on support ",
		["russian"] = "Показать networh / hero damage / золото потраченное на support",
		["chinese"] = "顯示 networth / hero damage / gold spent on support "
	},
	["showonlyselected"] = {
		["english"] = "Show only selected items to notify",
		["russian"] = "Показать только предметы выбранные для уведомления",
		["chinese"] = "只显示选定的项目进行通知"
	},
	["showherolevel"] = {
		["english"] = "Show hero level",
		["russian"] = "Показывать уровень героя",
		["chinese"] = "顯示英雄等級"
	},
	["showlastposition"] = {
		["english"] = "Show last hero position",
		["russian"] = "Показывать последнюю позицию героя",
		["chinese"] = "顯示最後的英雄位置"
	},
	["mapsize"] = {
		["english"] = "Hero icon map size",
		["russian"] = "Размер героя на карте",
		["chinese"] = "英雄圖標地圖大小"
	},
	["fixposition"] = {
		["english"] = "Fix panel position",
		["russian"] = "Зафиксировать положение панели",
		["chinese"] = "修復面板位置"
	},
	["timepass"] = {
		["english"] = "Show how much time has passed since last seen",
		["russian"] = "Показывать сколько прошло времени с момента последнего появления",
		["chinese"] = "顯示自上次出現以來經過了多少時間"
	},
	["showhp"] = {
		["english"] = "Show enemy hero latest HP",
		["russian"] = "Показывать последнее известное значение ХП врага",
		["chinese"] = "顯示敵方英雄最新的HP"
	},
	["showmp"] = {
		["english"] = "Show enemy hero latest MP",
		["russian"] = "Показывать последнее известное значение МП врага",
		["chinese"] = "顯示敵方英雄最新的MP"
	},
	["showms"] = {
		["english"] = "Show enemy hero latest MS",
		["russian"] = "Показывать последнее известное значение скорости передвижения врага",
		["chinese"] = "顯示敵方英雄最新的MS"
	},
	["drawpath"] = {
		["english"] = "Show approximate hero location",
		["russian"] = "Показывать примерное местоположение героя",
		["chinese"] = "顯示近似的英雄位置"
	},
	["width"] = {
		["english"] = 240,
		["russian"] = 300,
		["chinese"] = 220
	},
	["author"] = {
		["english"] = 'paroxysm',
		["russian"] = 'paroxysm',
		["chinese"] = 'paroxysm, wwpanbingyi'
	}
} 

Overlay.OnAir = false
Overlay.UsedItems = {}
Overlay.Font		= Renderer.LoadFont("Tahoma", 10, Enum.FontWeight.BOLD)
Overlay.IconFont	= Renderer.LoadFont("Tahoma", 10, Enum.FontWeight.BOLD)
Overlay.IconBigFont	= Renderer.LoadFont("Tahoma", 10, Enum.FontWeight.BOLD)
Overlay.Times		= {}

local offsetPosX = 0
local offsetPosY = 0

function Overlay.OnDraw()
	if GUI == nil then return end
	local locx = GUI.Get(Overlay.Identity .. "locx")
	local locy = GUI.Get(Overlay.Identity .. "locy")
	
	if not GUI.Exist(Overlay.Identity) then
		local GUI_Object = {}
		GUI_Object["perfect_name"] = Overlay.Locale["name"]
		GUI_Object["perfect_desc"] = Overlay.Locale["desc"]
		GUI_Object["perfect_author"] = Overlay.Locale["author"]
		GUI_Object["perfect_version"] = 180303
		GUI_Object["category"] = GUI.Category.General
		GUI.Initialize(Overlay.Identity, GUI_Object)

		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "notify", Overlay.Locale["notify"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "items", Overlay.Locale["items"], 
			GUI.MenuType.ImageBox, Length(GUIDB.Items), GUIDB.Items, GUIDB.ItemPath, "item_", 32, 24, nil, 21)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "time", Overlay.Locale["time"], GUI.MenuType.Slider, 3, 60, 10)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "show", Overlay.Locale["show"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "fixposition", Overlay.Locale["fixposition"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "size", Overlay.Locale["size"], GUI.MenuType.Slider, 16, 64, 24, Overlay.UpdateSize)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "cd", Overlay.Locale["cd"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "charges", Overlay.Locale["charges"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "above", Overlay.Locale["above"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "aboveoffset", Overlay.Locale["aboveoffset"], GUI.MenuType.Slider, 25, 200, 55)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "opacity", Overlay.Locale["opacity"], GUI.MenuType.Slider, 1, 100, 100)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "itemalert", Overlay.Locale["itemalert"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "removeopacity", Overlay.Locale["removeopacity"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showextrainvent", Overlay.Locale["showextrainvent"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showally", Overlay.Locale["showally"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showwards", Overlay.Locale["showwards"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showstat", Overlay.Locale["showstat"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showonlyselected", Overlay.Locale["showonlyselected"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showherolevel", Overlay.Locale["showherolevel"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showlastposition", Overlay.Locale["showlastposition"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "drawpath", Overlay.Locale["drawpath"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "timepass", Overlay.Locale["timepass"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showhp", Overlay.Locale["showhp"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showmp", Overlay.Locale["showmp"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "showms", Overlay.Locale["showms"], GUI.MenuType.CheckBox, 1)
		GUI.AddMenuItem(Overlay.Identity, Overlay.Identity .. "mapsize", Overlay.Locale["mapsize"], GUI.MenuType.Slider, 16, 256, 36, Overlay.UpdateIconSize)

		Overlay.Font		= Renderer.LoadFont("Tahoma", math.floor(GUI.Get(Overlay.Identity .. "size") / 2) - 1, Enum.FontWeight.BOLD)
		Overlay.IconFont	= Renderer.LoadFont("Tahoma", GUI.Get(Overlay.Identity .. "mapsize") - math.floor(GUI.Get(Overlay.Identity .. "mapsize") / 1.4), Enum.FontWeight.BOLD)
		Overlay.IconBigFont	= Renderer.LoadFont("Tahoma", GUI.Get(Overlay.Identity .. "mapsize") - math.floor(GUI.Get(Overlay.Identity .. "mapsize") / 2), Enum.FontWeight.Normal)
		if (locx == "" or locx == nil) then GUI.Set(Overlay.Identity .. "locx", 10) locx = 10 end
		if (locy == "" or locy == nil) then GUI.Set(Overlay.Identity .. "locy", 150) locy = 150 end
	end

	if Overlay.OnAir then 
		local mx, my = Input.GetCursorPos()
		GUI.Set(Overlay.Identity .. "locx", mx - offsetPosX)
		GUI.Set(Overlay.Identity .. "locy", my - offsetPosY)
		if tonumber(GUI.Get(Overlay.Identity .. "locx")) < 1 then GUI.Set(Overlay.Identity .. "locx", 1) end
		if tonumber(GUI.Get(Overlay.Identity .. "locy")) < 1 then GUI.Set(Overlay.Identity .. "locy", 1) end
	end

	local opsett = GUI.Get(Overlay.Identity .. "opacity")
	local isping = GUI.IsEnabled(Overlay.Identity .. "itemalert")

	local opcolor = math.floor( ( 255 / 100 ) * opsett )
	local opcolor_less = math.floor( ( 200 / 100 ) * opsett )
	
    if not GUI.IsEnabled(Overlay.Identity) then return true end
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end

	if GUI.SelectedLanguage == nil then return end
	
	local show	= GUI.IsEnabled(Overlay.Identity .. "show")
	local fixposition	= GUI.IsEnabled(Overlay.Identity .. "fixposition")
	local isremop	= GUI.IsEnabled(Overlay.Identity .. "removeopacity")
	local showextrainv	= GUI.IsEnabled(Overlay.Identity .. "showextrainvent")
	local showally	= GUI.IsEnabled(Overlay.Identity .. "showally")
	local showwards	= GUI.IsEnabled(Overlay.Identity .. "showwards")
	local showstat	= GUI.IsEnabled(Overlay.Identity .. "showstat")
	local showonlyselected = GUI.IsEnabled(Overlay.Identity .. "showonlyselected")
	local showherolevel = GUI.IsEnabled(Overlay.Identity .. "showherolevel")
	local showlastposition = GUI.IsEnabled(Overlay.Identity .. "showlastposition")
	local drawpath = GUI.IsEnabled(Overlay.Identity .. "drawpath")
	local timepass = GUI.IsEnabled(Overlay.Identity .. "timepass")
	local showhp = GUI.IsEnabled(Overlay.Identity .. "showhp")
	local showmp = GUI.IsEnabled(Overlay.Identity .. "showmp")
	local showms = GUI.IsEnabled(Overlay.Identity .. "showms")
	local size = GUI.Get(Overlay.Identity .. "size")
	local mapsize = GUI.Get(Overlay.Identity .. "mapsize")
	local defx, xpos = math.floor(size * 128 / 72)
	local ypos = locy
	local aboveoffset = GUI.Get(Overlay.Identity .. "aboveoffset")
	local iscd = GUI.IsEnabled(Overlay.Identity .. "cd")
	local iscrg = GUI.IsEnabled(Overlay.Identity .. "charges")
	local isnotify = GUI.IsEnabled(Overlay.Identity .. "notify")
	local notify_items = GUI.Get(Overlay.Identity .. "items", 1)
	local tts = GUI.Get(Overlay.Identity .. "time")
	local title = Overlay.Locale["bought"][GUI.SelectedLanguage]
	local width = Overlay.Locale["width"][GUI.SelectedLanguage]
	local above = GUI.IsEnabled(Overlay.Identity .. "above")

	for k, hero in pairs(Heroes.GetAll()) do
		if hero ~= nil and not NPC.IsIllusion(hero) and Entity.IsHero(hero) and (showally or not Entity.IsSameTeam(myHero, hero)) then 
			ypos = ypos + size
			xpos = defx + locx + 5
			
			if showlastposition then 
				Renderer.SetDrawColor(255, 255, 255, 255)
				if	not Entity.IsSameTeam(myHero, hero)
					and Entity.IsAlive(hero)
					and Entity.IsDormant(hero)
				then
					local pos = Entity.GetAbsOrigin(hero)
					local x, y, visible = Renderer.WorldToScreen(pos)
					if visible then
						local star_size = math.ceil(mapsize * 1.6)
						Renderer.DrawImage(GUIDB.Image('star_circle'), x - math.ceil(star_size / 2), y - math.ceil(star_size / 2) - 3, star_size, star_size)
						Renderer.DrawImage(GUIDB.Image('mini_' .. NPC.GetUnitName(hero)), x - math.ceil(mapsize / 2), y - math.ceil(mapsize / 2), mapsize, mapsize)
						
						if showhp then
							local hptext = Entity.GetHealth(hero) .. "/" .. Entity.GetMaxHealth(hero) .. " (".. math.ceil((Entity.GetHealth(hero) / Entity.GetMaxHealth(hero)) * 100) .."%)"
							Renderer.SetDrawColor(hex2rgb('#a2e15e'))
							Renderer.DrawTextCenteredY(Overlay.IconFont, x + math.ceil(star_size / 2) + 10, y - math.floor(mapsize / 5), hptext, true)
						end

						if showmp then
							local mptext = math.ceil(NPC.GetMana(hero)) .. "/" .. math.ceil(NPC.GetMaxMana(hero)) .. " (".. math.ceil((math.ceil(NPC.GetMana(hero)) / math.ceil(NPC.GetMaxMana(hero))) * 100) .."%)"
							Renderer.SetDrawColor(hex2rgb('#5672d3'))
							Renderer.DrawTextCenteredY(Overlay.IconFont, x + math.ceil(star_size / 2) + 10, y + math.floor(mapsize / 5), mptext, true)
						end
						
						if showms then
							Renderer.SetDrawColor(hex2rgb('#ffff01'))
							Renderer.DrawTextCentered(Overlay.IconFont, x, y + mapsize, "MS: " .. math.floor(NPC.GetMoveSpeed(hero)), true)
						end
						
						if Overlay.Times[NPC.GetUnitName(hero)] == nil then
							Overlay.Times[NPC.GetUnitName(hero)] = os.clock()
						end

						if timepass then
							if Overlay.Times[NPC.GetUnitName(hero)] == nil then
								Overlay.Times[NPC.GetUnitName(hero)] = os.clock()
							end
							local seconds = math.floor((os.clock() - Overlay.Times[NPC.GetUnitName(hero)])*10)/10
							local secsize = utf8.len(seconds)
							Renderer.SetDrawColor(hex2rgb('#9da1a0'))
							Renderer.DrawTextCentered(Overlay.IconBigFont, x - math.ceil(star_size / 2) - math.floor(secsize * (GUI.Get(Overlay.Identity .. "mapsize") / 5)), y, seconds, true)
						end
						
						if drawpath then
							local speed = NPC.GetMoveSpeed(hero)
							local angle = Entity.GetRotation(hero)
							local angleOffset = Angle(0, 45, 0)
							angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
							local x,y,z = angle:GetVectors()
							local direction = x + y + z
							direction:SetZ(0)
							direction:Normalize()
							direction:Scale(math.floor(speed * (os.clock() - Overlay.Times[NPC.GetUnitName(hero)])))
							local pos = Entity.GetAbsOrigin(hero)
							local xp, yp, vis = Renderer.WorldToScreen(pos + direction)
							local xz, yz = Renderer.WorldToScreen(pos)
							if vis then
								Renderer.SetDrawColor(255, 255, 255, 100)
								local specsize = mapsize - math.floor(mapsize / 4)
								Renderer.DrawImage(GUIDB.Image('mini_' .. NPC.GetUnitName(hero)), xp - math.ceil(specsize / 2), yp - math.ceil(specsize / 2), specsize, specsize)
							end
						end
					end
				else
					if Overlay.Times[NPC.GetUnitName(hero)] ~= nil then
						Overlay.Times[NPC.GetUnitName(hero)] = nil
					end
				end
			end
			local player = Entity.GetOwner(hero)
			local top = opcolor
			local top_less = opcolor_less
			Renderer.SetDrawColor(255, 255, 255, opcolor)

			local heroImageHandle = GUIDB.Image(NPC.GetUnitName(hero))

			local heroPos = Entity.GetAbsOrigin(hero)
			local heroZ = NPC.GetHealthBarOffset(hero)
			heroPos:SetZ(heroPos:GetZ() + heroZ)

			local heroX, heroY, heroV = Renderer.WorldToScreen(heroPos)
			heroX = heroX - math.floor((size + 8) * 3)
			if showherolevel then
				xpos = xpos + size + 8
			end
			
			local drawHeroY = heroY - size - aboveoffset
			local isAbove = false
			
			if isremop then
				if Input.IsCursorInRect(locx, ypos, ((size + 8) * (showextrainv and 10 or 6)) + 5 + defx, size ) then
					top = 255
					top_less = 200
					Renderer.SetDrawColor(255, 255, 255, 255)
				end
			end
			
			if above and heroV and not Entity.IsDormant(hero) and Entity.IsAlive(hero) then
				isAbove = true
				Renderer.SetDrawColor(0, 0, 0, opcolor_less)
				Renderer.DrawFilledRect(heroX - 2, drawHeroY - 2, math.floor((size + 8) * 6) + 4, size + 4)
				Renderer.SetDrawColor(255, 255, 255, top)
			end
			local maxx = defx + locx + 5

			for i = 0, (showextrainv and 8 or 5) do
				local item = NPC.GetItemByIndex(hero, i)
				if (i == 6) then xpos = xpos + 5 end
				if item ~= nil and Entity.IsAbility(item) and (not showonlyselected or hasValue(notify_items, Ability.GetName(item))) then
					if (xpos + size + 8) > maxx then maxx = (xpos + size + 8) end
					local imageHandle = GUIDB.Image(Ability.GetName(item))

					if isnotify then
						Overlay.Notify(item, notify_items, Ability.GetName(item), title, width, tts, imageHandle, heroImageHandle)
					end

					if show then
						Renderer.SetDrawColor(255, 255, 255, top)
						Renderer.DrawImage(imageHandle, xpos, ypos, size + 8, size)
					end
					
					if isAbove then
						Renderer.SetDrawColor(255, 255, 255, opcolor)
						Renderer.DrawImage(imageHandle, heroX, drawHeroY, size + 8, size)
					end
					
					if (show and Input.IsCursorInRect(xpos, ypos, size + 8, size)) or (isAbove and Input.IsCursorInRect(heroX, drawHeroY, size + 8, size)) then
						if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) and isping then 
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PING_ABILITY, 0, Vector(), item, 0, nil)
						end
					end
					
					local cd = math.ceil(Ability.GetCooldown(item))
					local crg = Item.GetCurrentCharges(item)
					if (crg > 0 and iscrg) or (cd > 0 and iscd) then
						if show then
							Renderer.SetDrawColor(0, 0, 0, top_less)
							Renderer.DrawFilledRect(xpos, ypos, size + 8, size)
						end
						
						if isAbove then
							Renderer.SetDrawColor(0, 0, 0, opcolor_less)
							Renderer.DrawFilledRect(heroX, drawHeroY, size + 8, size)
						end
						
						local d = crg
						if cd > 0 and iscd then d = cd end
						
						if show then
							Renderer.SetDrawColor(255, 255, 255, top)
							Renderer.DrawTextCentered(GUI.Font.ContentBold, xpos + math.ceil((size + 8) / 2), ypos + math.ceil(size / 2), d, true)
						end
						
						if isAbove then
							Renderer.SetDrawColor(255, 255, 255, opcolor)
							Renderer.DrawTextCentered(GUI.Font.ContentBold, heroX + math.ceil((size + 8) / 2), drawHeroY + math.ceil(size / 2), d, true)
						end
					end
					xpos = xpos + size + 8
					heroX = heroX + size + 8
				end
			end
			
			if show then
				if Entity.IsSameTeam(myHero, hero) and showwards and Entity.IsPlayer(player) then	
					local txpos = maxx
					local hsize = math.floor(size / 2)
					Renderer.SetDrawColor(255, 255, 255, opcolor)
					Renderer.DrawImage(GUIDB.Image("ward_observer"),	txpos, ypos, hsize, hsize)
					Renderer.DrawImage(GUIDB.Image("ward_sentry"),		txpos, ypos + hsize, hsize, hsize)
					Renderer.DrawText(Overlay.Font, txpos + hsize + 5, ypos, Player.GetObserverWardsPlaced(player), true)
					Renderer.DrawText(Overlay.Font, txpos + hsize + 5, ypos + hsize, Player.GetSentryWardsPlaced(player), true)
				end
			
				if Input.IsCursorInRect(locx, ypos, defx, size) and not fixposition then
					if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then 
						local mx, my = Input.GetCursorPos()
						offsetPosX = mx - locx
						offsetPosY = my - locy
						if Overlay.OnAir then Overlay.OnAir = false else Overlay.OnAir = true end
					end
				end
				
				if showherolevel then
					Renderer.SetDrawColor(0, 0, 0, top)
					Renderer.DrawFilledRect(locx + defx, ypos, size + 8, size)
					Renderer.SetDrawColor(255, 255, 255, top)
					Renderer.DrawTextCentered(GUI.Font.ContentBold, locx + defx + math.ceil((size + 8) / 2), ypos + math.ceil(size / 2), NPC.GetCurrentLevel(hero), true)
				end
				
				Renderer.SetDrawColor(255, 255, 255, top)
				Renderer.DrawImage(heroImageHandle, locx, ypos, defx, size)
				if Entity.IsSameTeam(myHero, hero) and showstat and Entity.IsPlayer(player) then
					Renderer.DrawText(Overlay.Font, locx, ypos - math.floor(size / 2) + 1, "net: " .. Player.GetNetWorth(player) .. ' / dmg: ' .. Player.GetHeroDamage(player) .. ' / sup: ' .. Player.GetGoldSpentOnSupport(player), true)
					ypos = ypos + math.floor(size / 2) + 2
				end
			end
		end
	end
end

function Overlay.OnGameStart()
	Overlay.UsedItems = {}
end

function Overlay.UpdateSize(key, val)
	Overlay.Font = Renderer.LoadFont("Tahoma", math.floor(val / 2) - 1, Enum.FontWeight.BOLD)
end

function Overlay.UpdateIconSize(key, val)
	Overlay.IconFont = Renderer.LoadFont("Tahoma", val - math.floor(val / 1.4), Enum.FontWeight.BOLD)
	Overlay.IconBigFont = Renderer.LoadFont("Tahoma", val - math.floor(val / 2), Enum.FontWeight.Normal)
end

function Overlay.Notify(item, notify_items, name, ttl, wdt, tts, imageHandle, heroImageHandle)
	local item_index = Ability.GetIndex(item)
	
	if	not hasValue(Overlay.UsedItems, item_index)
		and hasValue(notify_items, name) 
	then
		local Notification = {}
		Notification.identity = Overlay.Identity
		
		local title = {}
		title.text = ttl
		title.color = 'fff'

		Notification.title = title
		Notification.text = nil
		Notification.time = tts
		Notification.width = wdt

		local img_1 = heroImageHandle
		local image_1 = {}
		image_1.img = img_1
		image_1.w = 57
		image_1.h = 32
		
		local img_2 = imageHandle
		local image_2 = {}
		image_2.img = img_2
		image_2.w = 44
		image_2.h = 32
		
		Notification.img_1 = image_1
		Notification.img_2 = image_2
		
		GUI.AddNotification(Notification)
		table.insert(Overlay.UsedItems, item_index)
	end
end

return Overlay
