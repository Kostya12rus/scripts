local GUICourier			= {}
GUICourier.Identity			= "bcsitw" -- what does it mean? the one who will guess - I'll give the cake :-D
GUICourier.IdentityCat		= "bcsitw_cat"
GUICourier.IdentityCustom	= "bcsitw_user_"
GUICourier.Locale = {
	["name"] = {
		["english"] = "Courier",
		["russian"] = "Курьер",
		["chinese"] = "信使"
	},
	["desc"] = {
		["english"] = "",
		["russian"] = "",
		["chinese"] = ""
	},
	["useshield"] = {
		["english"] = "Use shield if courier start lose HP",
		["russian"] = "Использует щит если курьер начнёт терять здоровье",
		["chinese"] = "如果信使開始失去惠普使用盾牌"
	},
	["reusecour"] = {
		["english"] = "Reuse courier if courier have your items and someone use courier",
		["russian"] = "Реюзает курьера если курьер нёс вам вещи и кто-то юзнул его",
		["chinese"] = "如果快遞員有你的物品和有人使用快遞，請重複使用快遞"
	},
	["movetogoodpos"] = {
		["english"] = "Move courier to best position",
		["russian"] = "Перемещает курьера на лучшую позицию",
		["chinese"] = "將快遞員移至最佳位置"
	},
	["saferange"] = {
		["english"] = "Send to base if enemy in range",
		["russian"] = "Отправить на базу если противник в радиусе",
		["chinese"] = "如果敵人在範圍內發送到基地"
	},
	["safedev"] = {
		["english"] = "Safe delivery",
		["russian"] = "Безопасная доставка",
		["chinese"] = "安全交貨"
	},
	["benext"] = {
		["english"] = "Use courier next",
		["russian"] = "Использовать курьера следующим",
		["chinese"] = "接下來使用快遞"
	},
	["export"] = {
		["english"] = "Export data",
		["russian"] = "Экспортировать",
		["chinese"] = "導出數據"
	},
	["import"] = {
		["english"] = "Import data",
		["russian"] = "Импортировать",
		["chinese"]	= "導入數據"
	}
}

GUICourier.Player				= nil
GUICourier.Initiated			= {}
GUICourier.Hero					= nil
GUICourier.Courier				= nil
GUICourier.SendItems			= nil
GUICourier.Shield				= nil
GUICourier.PickItems			= nil
GUICourier.NeedInitialize		= true
GUICourier.Sending				= false
GUICourier.Next					= false
GUICourier.ToBase				= false
GUICourier.Time					= {}
GUICourier.Time.BestPosition	= 0
GUICourier.steamIDS				= {}

function GUICourier.OnDraw()
	if GUI == nil then return end
	
	if	Heroes.GetLocal() == nil 
		or GUICourier.Courier == nil 
		or not Engine.IsInGame() 
	then
        GUICourier.NeedInitialize = true
    end
	
	if not GUI.Exist(GUICourier.Identity) then		
		Cat_Object						= {}
		Cat_Object["perfect_name"]		= GUICourier.Locale["name"]
		Cat_Object["perfect_desc"]		= ''
		Cat_Object["perfect_author"]	= 'paroxysm'
		Cat_Object["iscat"]				= true
		Cat_Object["category"]			= GUI.Category.General
		
		GUI.Initialize(GUICourier.IdentityCat, Cat_Object)
		
		local GUI_TestSub				= {}
		GUI_TestSub["perfect_name"]		= GUICourier.Locale["name"]
		GUI_TestSub["perfect_desc"]		= GUICourier.Locale["desc"]
		GUI_TestSub["perfect_author"]	= 'paroxysm'
		GUI_TestSub["perfect_version"]	= 171223
		GUI_TestSub["cat"]				= GUICourier.IdentityCat
		GUI_TestSub["switch"]			= true
		
		GUI.Initialize(GUICourier.Identity, GUI_TestSub)
		
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "safedev",			GUICourier.Locale["safedev"],		GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "saferange",		GUICourier.Locale["saferange"], 	GUI.MenuType.Slider,	100, 1500, 100)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "useshield",		GUICourier.Locale["useshield"], 	GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "reusecour",		GUICourier.Locale["reusecour"], 	GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "movetogoodpos",	GUICourier.Locale["movetogoodpos"], GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "benext",			GUICourier.Locale["benext"],		GUI.MenuType.CheckBox, 0)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "export", 			GUICourier.Locale["export"], 		GUI.MenuType.Button,	GUICourier.Export)
		GUI.AddMenuItem(GUICourier.Identity, GUICourier.Identity .. "import", 			GUICourier.Locale["import"], 		GUI.MenuType.Button,	GUICourier.Import)
		
		GUICourier.OnGameStart()
	end
	
end

function GUICourier.Export()
	Config.WriteString("GUICourier-Data", GUICourier.Identity .. "_ids", tableToString(GUICourier.steamIDS))
	
	for k, v in pairs(GUICourier.steamIDS) do
		Config.WriteString("GUICourier-Data",	GUICourier.IdentityCustom .. k .. "_main", "~"	.. GUI.Get(GUICourier.IdentityCustom .. k .. "_main")		.. "~")
		Config.WriteString("GUICourier-Data",	GUICourier.IdentityCustom .. k .. "_textbox", "~" .. GUI.Get(GUICourier.IdentityCustom .. k .. "_textbox")	.. "~")
	end
end

function GUICourier.Import()
	local ids = stringToTable(Config.ReadString("GUICourier-Data", GUICourier.Identity .. "_ids", tableToString(GUICourier.steamIDS)))
	
	for k, v in pairs(ids) do
		if not GUI.Exist(GUICourier.IdentityCustom .. k .. "_main") then
			GUI.Set(GUICourier.IdentityCustom .. k .. "_main",		Config.ReadString("GUICourier-Data",	GUICourier.IdentityCustom .. k .. "_main", ""))
			GUI.Set(GUICourier.IdentityCustom .. k .. "_textbox",	Config.ReadString("GUICourier-Data",	GUICourier.IdentityCustom .. k .. "_textbox", ""))
			GUICourier.steamIDS[k] = k
		end
	end
	
	GUI.Set(GUICourier.Identity .. "_ids", GUICourier.steamIDS)
end

function GUICourier.OnGameStart()
	if not GUI.Exist(GUICourier.Identity) then return end
	
	if GUI.Get(GUICourier.Identity .. "_ids", 1) ~= nil then
		GUICourier.steamIDS	= GUI.Get(GUICourier.Identity .. "_ids", 1)
	else
		GUI.Set(GUICourier.Identity .. "_ids", GUICourier.steamIDS)
	end
	
	GUICourier.Initialize()
		
	for k,v in pairs(Players.GetAll()) do
		if Entity.IsSameTeam(v, GUICourier.Player) and v ~= GUICourier.Player then
			local data	= Player.GetPlayerData(v)
			
			if data.steamid ~= nil then 
				GUICourier.steamIDS	[data.steamid]		= data.steamid
				GUICourier.Initiated[data.steamid]		= data.steamid
				GUICourier.InitPlayer(Player.GetName(v), Player.GetPlayerID(v), data.steamid)
			end
		end
	end
	
	GUI.Set(GUICourier.Identity .. "_ids", GUICourier.steamIDS)
end

function GUICourier.OnGameEnd()
	GUICourier.Player				= nil
	for k, v in pairs(GUICourier.Initiated) do
		if GUI.Exist(GUICourier.IdentityCustom .. v .. "_main") then
			GUI.DeInitialize(GUICourier.IdentityCustom .. v .. "_main")
		end
	end
	
	GUICourier.Initiated	= {}
	GUICourier.Hero					= nil
	GUICourier.Courier				= nil
	GUICourier.SendItems			= nil
	GUICourier.Shield				= nil
	GUICourier.PickItems			= nil
	GUICourier.NeedInitialize		= true
	GUICourier.Sending				= false
	GUICourier.Next					= false
	GUICourier.ToBase				= false
	GUICourier.Time					= {}
	GUICourier.Time.BestPosition	= 0
	GUICourier.steamIDS				= {}
end

function GUICourier.InitPlayer(name, id, identity)
	local t							= GUI.Get(GUICourier.IdentityCustom .. identity .. "_main")
	local GUI_TestSub				= {}

	GUI_TestSub["perfect_name"]		= id .. '. ' .. name
 	GUI_TestSub["perfect_desc"]		= ''
	GUI_TestSub["perfect_author"]	= 'paroxysm'
	GUI_TestSub["cat"]				= GUICourier.IdentityCat
	GUICourier.Initiated[id] = GUICourier.IdentityCustom .. identity .. "_main"
	GUI.Initialize	(GUICourier.IdentityCustom .. identity .. "_main", GUI_TestSub)
	GUI.AddMenuItem	(GUICourier.IdentityCustom .. identity .. "_main", GUICourier.IdentityCustom .. identity .. "_textbox", 'Commentary', GUI.MenuType.TextBox, "")
	
	if t == "" then GUI.Set(GUICourier.IdentityCustom .. identity .. "_main", 1) end
end

function GUICourier.Initialize()
	GUICourier.NeedInitialize	= false
	GUICourier.Hero				= Heroes.GetLocal()
	GUICourier.Player			= Players.GetLocal()
	
	if GUICourier.Hero ~= nil then 
		for i = 1, NPCs.Count() do
			local npc = NPCs.Get(i)
			
			if	Entity.IsAlive(npc)
				and Entity.IsSameTeam(GUICourier.Hero, npc) 
				and NPC.GetUnitName(npc) == "npc_dota_courier"
			then
				GUICourier.Courier		= npc
				GUICourier.SendItems	= NPC.GetAbility(GUICourier.Courier,	"courier_take_stash_and_transfer_items")
				GUICourier.Shield		= NPC.GetAbility(GUICourier.Courier,	"courier_shield")
				GUICourier.ToBase		= NPC.GetAbilityByIndex(GUICourier.Courier,	0)
			end
		end
	end
end

function GUICourier.OnPrepareUnitOrders(orders)
	if	orders.player == GUICourier.Player	then
		if	orders.ability == GUICourier.SendItems	then
			if	GUICourier.HaveMyItems() then
				if	GUI.IsEnabled(GUICourier.Identity .. "benext") 
					and GUICourier.Courier
					and NPC.IsCourier(GUICourier.Courier)
					and Enum.CourierState.COURIER_STATE_AT_BASE ~= Courier.GetCourierState(GUICourier.Courier)
					and Courier.GetCourierStateEntity(GUICourier.Courier) ~= nil
					and Courier.GetCourierStateEntity(GUICourier.Courier) ~= GUICourier.Hero
				then
					GUICourier.Next	= true
				return false end
			
				GUICourier.Sending	= true
			end
		end
		
		if	orders.ability == GUICourier.ToBase
			and Courier.GetCourierStateEntity(GUICourier.Courier) ~= nil
			and Courier.GetCourierStateEntity(GUICourier.Courier) ~= GUICourier.Hero
		then
			GUICourier.Sending	= false
			GUICourier.Next		= false
		end
	end

	return true
end

function GUICourier.HaveMyItems()
	if GUICourier.Courier == nil then return false end
	
	for i = 0, 9 do
		local item = NPC.GetItemByIndex(GUICourier.Courier, i)
		if item ~= nil then			
			if Item.GetPlayerOwnerID(item) == Player.GetPlayerID(GUICourier.Player) then
				return true
			end
		end
	end
	
	for i = 9, 15 do
		local item = NPC.GetItemByIndex(GUICourier.Hero, i)
		if item ~= nil then			
			if Item.GetPlayerOwnerID(item) == Player.GetPlayerID(GUICourier.Player) then
				return true
			end
		end
	end
	
	return false
end

function GUICourier.OnUpdate()
	if GUI == nil then return end
	if not GUI.IsEnabled(GUICourier.Identity) then return end
	if not Engine.IsInGame() then return end
	if GUICourier.NeedInitialize then
        GUICourier.Initialize()
    end
	if GUICourier.Courier == nil then return end

	if	GUICourier.Courier 
		and NPC.IsCourier(GUICourier.Courier)
	then
		local state			= Courier.GetCourierState(GUICourier.Courier)
		local courierEnt	= Courier.GetCourierStateEntity(GUICourier.Courier)

		if GUI.IsEnabled(GUICourier.Identity .. "safedev") then
			if	Length(NPC.GetHeroesInRadius(GUICourier.Courier, GUI.Get(GUICourier.Identity .. "saferange"), Enum.TeamType.TEAM_ENEMY)) > 0 then
				Ability.CastNoTarget(GUICourier.ToBase)
				GUICourier.Sending	= false
				GUICourier.Next		= false
			return end
		end
		
		if	GUICourier.Next 
		then
			if	GUICourier.HaveMyItems()
			then
				if	(Enum.CourierState.COURIER_STATE_AT_BASE == state or Enum.CourierState.COURIER_STATE_RETURNING_TO_BASE == state)
					and courierEnt == nil 
				then
					if GUI.IsEnabled(GUICourier.Identity .. "benext") then
						Ability.CastNoTarget(GUICourier.SendItems)
						GUICourier.Next = false
						
						if GUI.IsEnabled(GUICourier.Identity .. "reusecour") then
							GUICourier.Sending = true
						end
					end
				end
			else
				GUICourier.Next = false
			end
		end	
		
		if GUICourier.Sending then
			if not Entity.IsAlive(GUICourier.Hero) or Entity.IsDormant(GUICourier.Hero) then
				GUICourier.Sending	= false
			return end
		
			if	GUI.IsEnabled(GUICourier.Identity .. "reusecour")
				and GUICourier.HaveMyItems()
			then
				if courierEnt ~= GUICourier.Hero then
					Ability.CastNoTarget(GUICourier.SendItems)
				end
			else
				GUICourier.Sending	= false
			end
		end
		
		if	GUI.IsEnabled(GUICourier.Identity .. "useshield")
			and Enum.CourierState.COURIER_STATE_AT_BASE ~= state
			and Entity.GetHealth(GUICourier.Courier) ~= Entity.GetMaxHealth(GUICourier.Courier)
			and Ability.IsCastable(GUICourier.Shield, 1, false)
		then
			Ability.CastNoTarget(GUICourier.Shield)
		end

		if	GUI.IsEnabled(GUICourier.Identity .. "movetogoodpos")
			and GameRules.GetGameTime() > GUICourier.Time.BestPosition
			and Enum.CourierState.COURIER_STATE_AT_BASE == state
			and courierEnt == nil 
		then
			local good_pos	= Vector(-6539.75, -6049.96875, 407.53125)
			local evil_pos	= Vector(6553.28125, 6041.031, 512.0)
			local my_pos	= Entity.GetOrigin(GUICourier.Courier)
			
			if my_pos:Distance(good_pos):Length2D() < my_pos:Distance(evil_pos):Length2D() then 
				NPC.MoveTo(GUICourier.Courier, good_pos, false, true)
			else
				NPC.MoveTo(GUICourier.Courier, evil_pos, false, true)
			end

			GUICourier.Time.BestPosition = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1
		end

		if courierEnt == nil then return end
		if not Entity.IsHero(courierEnt) then return end
		
		if courierEnt == GUICourier.Hero then return end
		local ident = GUICourier.IdentityCustom .. Player.GetPlayerData(Entity.GetOwner(courierEnt)).steamid .. "_main"
		if GUI.Exist(ident) and not GUI.IsEnabled(ident) then
			Ability.CastNoTarget(GUICourier.ToBase)
		end
	end
	
end

return GUICourier
