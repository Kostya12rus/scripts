-- Author: paroxysm
-- Version: 1
-- Created: 08.02.2017
local AutoKill = {}

AutoKill.Enabled = Menu.AddOption({ "Utility","Auto Kill" }, "Enabled", "")
Menu.AddOption({ "Utility","Auto Kill" }, "Version", "Author: paroxysm", 1, 1, 1)

function AutoKill.OnUpdate()
	if not Menu.IsEnabled( AutoKill.Enabled ) then return end	

	local myHero = Heroes.GetLocal()
	if myHero == nil then return end
	
	local myRange = NPC.GetAttackRange( myHero )
	local myDamage = NPC.GetTrueDamage( myHero )

	for k, v in pairs(NPC.GetHeroesInRadius(myHero, myRange, Enum.TeamType.TEAM_ENEMY)) do
	
		if not NPC.IsIllusion(v) and NPC.IsKillable(v) then
		
			local hp = Entity.GetHealth(v)
			local pm = NPC.GetArmorDamageMultiplier(v)
			local fd = (myDamage * pm)

			if hp < fd then
				Player.AttackTarget( Players.GetLocal(), myHero , v , false )
			end
			
		end
		
	end
end

return AutoKill