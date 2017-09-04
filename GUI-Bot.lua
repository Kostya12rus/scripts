local AutoBot = {}
AutoBot.Identity = "optimus_prime"
AutoBot.Locale = {
	["name"] = {
		["english"] = "Bot",
		["russian"] = "Бот",
		["chinese"] = "船",
	},
	["desc"] = {
		["english"] = "Playing for you.",
		["russian"] = "Играет вместо вас.",
		["chinese"] = "他效力於你"
	},
	["lvlupabilities"] = {
		["english"] = "Learn abilities",
		["russian"] = "Прокачивать способности",
		["chinese"] = "泵的容量"
	},
	["selecttype"] = {
		["english"] = "Bot type",
		["russian"] = "Тип бота",
		["chinese"] = "BOT方式"
	},
	["centercamera"] = {
		["english"] = "Center camera",
		["russian"] = "Центрировать камеру",
		["chinese"] = "中心相機"
	},
	["onlowhp"] = {
		["english"] = "On low HP go to fountain (only in play type)",
		["russian"] = "При малом здоровье бежать на базу (только в режиме игры)",
		["chinese"] = "在小健康運行的基礎（只在遊戲模式）"
	},
	["autoqueue"] = {
		["english"] = "Auto queue",
		["russian"] = "Автоматический поиск игры",
		["chinese"] = "自动游戏搜索"
	}
}

AutoBot.Hero = nil
AutoBot.MP = 0
AutoBot.Fountain = nil
AutoBot.EnemyFountain = nil
AutoBot.Work = false
AutoBot.CurrentTime = 0
AutoBot.NextTime = 0
AutoBot.FollowHero = nil
AutoBot.AQ = false

function AutoBot.OnDraw()
	if GUI == nil then return end
	if not GUI.Exist(AutoBot.Identity) then
		
		local GUI_Object = {}
		GUI_Object["perfect_name"] = AutoBot.Locale["name"]
		GUI_Object["perfect_desc"] = AutoBot.Locale["desc"]
		GUI_Object["perfect_author"] = 'paroxysm'
		GUI_Object["perfect_version"] = 170708
		GUI_Object["category"] = GUI.Category.General
		GUI.Initialize(AutoBot.Identity, GUI_Object)
		
		local arr  = {
			["english"] = {
				["none"] = "Do nothing",
				["fountain"] = "Fountain",
				["tower"] = "Tower",
				["feed"] = "Feed",
				["play"] = "Play"
			},
			["russian"] = {
				["none"] = "Ничего не делать",
				["fountain"] = "Фонтан",
				["tower"] = "Здание",
				["feed"] = "Feed",
				["play"] = "Играть"
			}
		}
		
		GUI.AddMenuItem(AutoBot.Identity, AutoBot.Identity .. "select", AutoBot.Locale["selecttype"], GUI.MenuType.SelectBox, arr, { "fountain" }, 1)
		GUI.AddMenuItem(AutoBot.Identity, AutoBot.Identity .. "onlowhp", AutoBot.Locale["onlowhp"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(AutoBot.Identity, AutoBot.Identity .. "lvlupabilities", AutoBot.Locale["lvlupabilities"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(AutoBot.Identity, AutoBot.Identity .. "centercamera", AutoBot.Locale["centercamera"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(AutoBot.Identity, AutoBot.Identity .. "autoqueue", AutoBot.Locale["autoqueue"], GUI.MenuType.CheckBox, 0)
		GUI.Subscribe(AutoBot.Identity, GUI.GameStates.OnGameEnd, AutoBot.OnEnd)
	end
	if GUI.IsEnabled(AutoBot.Identity .. "autoqueue") and AutoBot.AQ and GUI.SleepReady("queue_timeout") then
		Menu.SetValue(Menu.GetOption({"Utility"}, "Auto Queue"), 1)
		AutoBot.AQ = false
	end
	if AutoBot.NextTime ~= 0 and not Engine.IsInGame() then AutoBot.Reset() end
end


function AutoBot.OnUpdate()
	if GUI == nil then return end
	AutoBot.Initialize()
	if not AutoBot.Work then return end
	AutoBot.CurrentTime = GameRules.GetGameTime()
	if AutoBot.CurrentTime <= AutoBot.NextTime then return end
	
	local bot_type = "fountain"
	local bot_table = GUI.Get(AutoBot.Identity .. "select", 1)
	if bot_table ~= nil then
		for k, v in pairs(bot_table) do
			bot_type = v
		end
	end
	
	if bot_type == "fountain" then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, AutoBot.Fountain, Entity.GetOrigin(AutoBot.Fountain):__add(Vector(math.random(-500,500),math.random(-500,500),0)),
			nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
	end
	
	if bot_type == "feed" then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, AutoBot.EnemyFountain, Entity.GetOrigin(AutoBot.EnemyFountain):__add(Vector(math.random(-500,500),math.random(-500,500),0)),
			nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
	end
		
	if bot_type == "play" then
			
		if GUI.IsEnabled(AutoBot.Identity .. "onlowhp") then
			local perc = math.floor(Entity.GetHealth(AutoBot.Hero) / Entity.GetMaxHealth(AutoBot.Hero) * 100)		
			if perc < 15 or Entity.GetHealth(AutoBot.Hero) < 200 then 
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, AutoBot.Fountain, Entity.GetOrigin(AutoBot.Fountain):__add(Vector(math.random(-500,500),math.random(-500,500),0)),
					nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
				AutoBot.NextTime = AutoBot.CurrentTime + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 6
			return end
		end
	
	
		local followhero = AutoBot.FollowHero
		local minhp = 0
		if AutoBot.FollowHero == nil or Entity.GetHealth(AutoBot.FollowHero) < 300 then
			for k,v in pairs(Heroes.GetAll()) do
				if Entity.IsSameTeam(AutoBot.Hero, v) 
					and Entity.IsAlive(v)
					and not NPC.IsIllusion(v) 
					and not Entity.IsDormant(v) 
					and Entity.GetHealth(v) > minhp
					and AutoBot.Hero ~= v
					and not NPC.HasModifier(v, "modifier_fountain_aura_buff")
					then
					minhp = Entity.GetHealth(v)
					followhero = v
				end
			end
		end
		
		if followhero ~= nil then
			local vec = nil
			
			if not NPC.IsEntityInRange(AutoBot.Hero, followhero, 300) then
				local enemyPos = Entity.GetAbsOrigin(followhero)
				local unitPos = Entity.GetAbsOrigin(AutoBot.Hero)
				local mp = Entity.GetOrigin(Heroes.GetLocal())
				local dir = unitPos - enemyPos
				dir:SetZ(0)
				dir:Normalize()
				dir:Scale(600)
				vec = (mp - dir)
			else
				local enemyPos = Entity.GetAbsOrigin(followhero)
				local unitPos = Entity.GetAbsOrigin(AutoBot.Hero)
				local mp = Entity.GetOrigin(Heroes.GetLocal())
				local dir = unitPos - enemyPos
				dir:SetZ(0)
				dir:Normalize()
				dir:Scale(100)
				vec = (mp + dir):__add(Vector(math.random(-50,50), math.random(-50,50),0))
			end

			if Length(NPC.GetHeroesInRadius(AutoBot.Hero, 800, Enum.TeamType.TEAM_ENEMY)) > (Length(NPC.GetHeroesInRadius(AutoBot.Hero, 800, Enum.TeamType.TEAM_FRIEND)) + 1) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, followhero,
					vec,
					nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
			else
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, followhero,
					vec,
					nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
			end
				
			AutoBot.FollowHero = followhero
		end
		
	end
		
	if bot_type == "tower" then
		local t = false
		for i = 1, NPCs.Count() do
			local npc = NPCs.Get(i)
			if	NPC.IsTower(npc)
				and Entity.IsSameTeam(AutoBot.Hero, npc)
				and Entity.IsAlive(npc)
				and not NPC.HasModifier(npc, "modifier_invulnerable")
			then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, npc, Entity.GetOrigin(npc):__add(Vector(math.random(-500,500),math.random(-500,500),0)),
					nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
				t = true
			end
		end
		if not t then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, AutoBot.Fountain, Entity.GetOrigin(AutoBot.Fountain):__add(Vector(math.random(-500,500),math.random(-500,500),0)),
				nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
		end
	end
	
	if GUI.IsEnabled(AutoBot.Identity .. "lvlupabilities") then
		if Hero.GetAbilityPoints(AutoBot.Hero) > 0 then
			local c = ((math.floor(NPC.GetCurrentLevel(AutoBot.Hero) / 5) - 1) * 2) + 3

			local table = {}
			for i = 0, c do
				table[i] = i
			end
			
			for i = 0, c do
				table = swapElements(table, math.random(0, c), math.random(0, c))
			end
			
			for i = 0, c do
				if Hero.GetAbilityPoints(Heroes.GetLocal()) == 0 then return end
				local train_ability = NPC.GetAbilityByIndex(AutoBot.Hero, table[i])
				if train_ability ~= nil then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_TRAIN_ABILITY, AutoBot.Hero, Vector(0,0,0), train_ability,
						Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, AutoBot.Hero, true, true)
				end
			end
		end
	end
		
	AutoBot.NextTime = AutoBot.CurrentTime + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + (math.random(1, 12) / 10)
end

function AutoBot.Reset()
	AutoBot.Hero = nil
	AutoBot.MP = 0
	AutoBot.Fountain = nil
	AutoBot.EnemyFountain = nil
	AutoBot.Work = false
	AutoBot.CurrentTime = 0
	AutoBot.NextTime = 0
	AutoBot.FollowHero = nil
end

function AutoBot.OnGameStart()
	if GUI.IsEnabled(AutoBot.Identity .. "autoqueue") then
		Menu.SetValue(Menu.GetOption({"Utility"}, "Auto Queue"), 0)
	end
end

function AutoBot.OnEnd(oldstate, newstate)
	if GUI.IsEnabled(AutoBot.Identity .. "autoqueue") then
		Engine.ExecuteCommand("disconnect")
		GUI.Sleep("queue_timeout", 15)
		AutoBot.AQ = true
	end
end

function AutoBot.Initialize()
	AutoBot.Work = false
	if not GUI.IsEnabled(AutoBot.Identity) then return end
	AutoBot.Hero = Heroes.GetLocal()
	if AutoBot.Hero == nil then return end
	if not Entity.IsAlive(AutoBot.Hero) then return end
	if GUI.IsEnabled(AutoBot.Identity .. "centercamera") then
		Engine.ExecuteCommand("dota_camera_center")
	end
	AutoBot.MP = NPC.GetMana(AutoBot.Hero)
	
	if AutoBot.Fountain == nil then
		for i = 1, NPCs.Count() do 
			local npc = NPCs.Get(i)
			if NPC.IsStructure(npc) then
				local name = NPC.GetUnitName(npc)
				if name ~= nil and name == "dota_fountain" then
					if Entity.IsSameTeam(AutoBot.Hero, npc) then
						AutoBot.Fountain = npc
					else
						AutoBot.EnemyFountain = npc
					end
				end
			end
		end
	end
	
	AutoBot.Work = true
end

return AutoBot
