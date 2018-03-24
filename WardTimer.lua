local WardTimer = {}
WardTimer.optionEnable = Menu.AddOption({"Utility"}, "Ward Timer", "")
WardTimer.Font = Renderer.LoadFont("Utility", 18, Enum.FontWeight.EXTRABOLD)

function WardTimer.OnDraw()
	if not Menu.IsEnabled(WardTimer.optionEnable) then return end
	for _,npc in pairs(NPCs.GetAll()) do
		if npc and Entity.IsAlive(npc) and NPC.HasModifier(npc,"modifier_item_buff_ward") then
			if Heroes.GetLocal() then
				if Entity.IsSameTeam(npc,Heroes.GetLocal()) then
					Renderer.SetDrawColor(0,206,209,255)
				else
					Renderer.SetDrawColor(255,255,0,255)
				end
			else
				Renderer.SetDrawColor(255,255,255,255)
			end
			local x,y,vis = Renderer.WorldToScreen(Entity.GetAbsOrigin(npc))
			local timer = math.floor(Modifier.GetDieTime(NPC.GetModifier(npc,"modifier_item_buff_ward"))-GameRules.GetGameTime())
			local minandsec
			if timer%60 < 10 then
				minandsec = "" .. math.floor(timer/60) .. ":0" .. timer%60 .. ""
			else
				minandsec = "" .. math.floor(timer/60) .. ":" .. timer%60 .. ""
			end
			if vis then
				Renderer.DrawTextCentered(WardTimer.Font,x,y,minandsec,1)
			end
		end
	end
end

return WardTimer