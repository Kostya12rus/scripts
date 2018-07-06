local BackCast = {}

local working_spells = {
	"pudge_meat_hook",
	"rattletrap_hookshot",
	"mirana_arrow",
	"queenofpain_sonic_wave",
	"keeper_of_the_light_illuminate",
	"drow_ranger_wave_of_silence",
	"dragon_knight_breathe_fire",
	"nyx_assassin_impale",
	"earthshaker_fissure",
	"shredder_timber_chain",
	"jakiro_ice_path"
}

function BackCast.OnPrepareUnitOrders(orders)

	if orders.order ~= 5 then return true end
	local abil_name = Ability.GetName(orders.ability)
	--Console.Print(abil_name)
	--Log.Write(abil_name)
	local enable = false
	for i, name in pairs(working_spells) do
		if abil_name == name then
			enable = true
			break;
		end
	end
	if not enable then return true end
	
	local myHero = Heroes.GetLocal()
	if Entity.GetVelocity(myHero):Length2DSqr() == 0 then -- not working if hero is moving
		local myHeroPos = Entity.GetAbsOrigin(myHero)
		local result_vec = myHeroPos + ((orders.position - myHeroPos):Normalized():Scaled(1.3))
		
		Player.PrepareUnitOrders(orders.player, orders.order, orders.target, result_vec, orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
		return false
	end

	return true
end

return BackCast