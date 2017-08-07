local Courier = {}

Courier.IsEnabled = Menu.AddOption( {"Utility", "Courier1"}, "Enabled","")
Courier.SendKey = Menu.AddKeyOption({ "Utility","Courier1"}, "Force send key (change sending state)", Enum.ButtonCode.KEY_F)
Courier.SafeRange = Menu.AddOption( {"Utility", "Courier1"}, "Safe range","", 100, 1500, 100)
Courier.SafeDelivery = Menu.AddOption( {"Utility", "Courier1"}, "Safe delivery","")
Courier.SkipSafe = Menu.AddOption( {"Utility", "Courier1"}, "Skip safe check if force sending","")

Courier.Player = nil
Courier.Hero = nil
Courier.Courier = nil
Courier.SendItems = nil
Courier.PickItems = nil
Courier.NeedInitialize = true
Courier.Sending = false
Courier.ToBase = false

function Courier.Initialize()
	Courier.NeedInitialize = false
	Courier.Hero = Heroes.GetLocal()
	Courier.Player = Players.GetLocal()
	
	if Courier.Hero ~= nil then 
		for i = 1, NPCs.Count() do
			local npc = NPCs.Get(i)
			if	Entity.IsAlive(npc)
				and Entity.IsSameTeam(Courier.Hero, npc) 
				and NPC.GetUnitName(npc) == "npc_dota_courier"
			then
				Courier.Courier = npc
				Courier.SendItems = NPC.GetAbilityByIndex(Courier.Courier, 4)
				Courier.PickItems = NPC.GetAbilityByIndex(Courier.Courier, 3)
				Courier.ToBase = NPC.GetAbilityByIndex(Courier.Courier, 0)
			end
		end
	end
end

function Courier.OnUpdate()
	if not Menu.IsEnabled(Courier.IsEnabled) then return end
	if not Engine.IsInGame() then return end
	if Courier.NeedInitialize then
        Courier.Initialize()
    end
	if Menu.IsKeyDownOnce(Courier.SendKey) then 
		if not Courier.Sending then
			Courier.Sending = true 
		else 
			Courier.Sending = false
			Ability.CastNoTarget(Courier.ToBase)
		end
	end	
	
	if Menu.IsEnabled(Courier.SafeDelivery) then
		if	Length(NPC.GetHeroesInRadius(Courier.Courier, Menu.GetValue(Courier.SafeRange), Enum.TeamType.TEAM_ENEMY)) > 0
			and (not Menu.IsEnabled(Courier.SkipSafe) or Courier.Sending == false) then
			Courier.Sending = false
			Ability.CastNoTarget(Courier.ToBase)
		end
	end
	
	if Courier.Sending then
	
		local count = 0
		for i = 9, 14 do
			local item = NPC.GetItemByIndex(Courier.Hero, i)
			if item ~= nil then
				count = count + 1
			end
		end 
		
		if	NPC.HasInventorySlotFree(Courier.Courier, true)
			and count > 0
		then
			Ability.CastNoTarget(Courier.PickItems)
		else 
			local selfItem = 0
			for i = 0, 9 do
				local item = NPC.GetItemByIndex(Courier.Courier, i)
				if item and Item.GetPlayerOwnerID(item) == Hero.GetPlayerID(Courier.Hero) then
					selfItem = selfItem + 1
				end
			end
			
			if	selfItem > 0 
				and Courier.Sending
			then 
				Ability.CastNoTarget(Courier.SendItems)
			return end
			if selfItem == 0 then 
				Courier.Sending = false 
				Ability.CastNoTarget(Courier.ToBase)
			end
		end
	end
end

function Courier.OnDraw()
	if not Menu.IsEnabled(Courier.IsEnabled) then return end
	if Heroes.GetLocal() == nil or Courier.Courier == nil or not Engine.IsInGame() then
        Courier.NeedInitialize = true
    end
end

function Length(t)
	count = 0
	for k,v in pairs(t) do
		 count = count + 1
	end
	
	return count
end

return Courier
