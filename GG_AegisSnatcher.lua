-- https://github.com/marcialpaulg/DOTA-2-script
-- requires dagger

local GG_AegisSnatcher = {}

GG_AegisSnatcher.is_enable = Menu.AddOption({"General Goblin", "Aegis Snatcher"}, "Enabled", "")
GG_AegisSnatcher.is_center = Menu.AddOption({"General Goblin", "Aegis Snatcher"}, "blink in center", "")

function GG_AegisSnatcher.OnChatEvent(chatEvent)
	if not Engine.IsInGame or chatEvent.type ~= 9 or chatEvent.value ~= 150 or not Menu.IsEnabled(GG_AegisSnatcher.is_enable) then return end
	
	--Log.Write(chatEvent.type)
	
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end
	
	local myDagger = NPC.GetItem(myHero, "item_blink")
	
	if myDagger and Ability.IsReady(myDagger) then
		if Menu.IsEnabled(GG_AegisSnatcher.is_center) then 
			-- ROSHAN CENTER PIT
			local blink_to = Vector('-2355.593', '1810.031', '160.00')
			if NPC.IsPositionInRange(myHero, blink_to, 1200, 0) then 
				Engine.ExecuteCommand("chatwheel_say 90")
				Ability.CastPosition(myDagger, blink_to)
			end
		else
			-- ROSHAN EXACT LOCATION
			local blink_to = Vector('-2464.245', '2016.373', '160.00')
			if NPC.IsPositionInRange(myHero, blink_to, 1200, 0) then 
				Engine.ExecuteCommand("chatwheel_say 90")
				Ability.CastPosition(myDagger, blink_to)
			end
		end
	end
end

return GG_AegisSnatcher
