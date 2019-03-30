local BackCast = {}
BackCast.IsEnabled = Menu.AddOption({ "Utility","BackCast" }, "Enabled", "")
local working_spells = {
	"pudge_meat_hook",
	"windrunner_powershot",
	"death_prophet_carrion_swarm",
	"mars_spear",
	"vengefulspirit_wave_of_terror",
	"rattletrap_hookshot",
	"mirana_arrow",
	"queenofpain_sonic_wave",
	"keeper_of_the_light_illuminate",
	"drow_ranger_wave_of_silence",
	"dragon_knight_breathe_fire",
	"nyx_assassin_impale",
	"earthshaker_fissure",
	"shredder_timber_chain",
	"jakiro_ice_path",
	"venomancer_venomous_gale",
	"weaver_the_swarm",
	"invoker_deafening_blast",
	"invoker_tornado",
	"jakiro_dual_breath",
	"jakiro_ice_path",
	"jakiro_macropyre",
	"lina_dragon_slave",
	"lion_impale",
	"magnataur_shockwave",
	"phoenix_icarus_dive",
	"puck_illusory_orb",
	"shadow_demon_shadow_poison",
	"spectre_spectral_dagger",
	"tidehunter_gush",
	"tinker_march_of_the_machines",
	"ancient_apparition_ice_blast",
	"troll_warlord_whirling_axes_ranged",
	--"monkey_king_boundless_strike",
}

local used = 0;
local time = 0;
local myHero
local play
local ord
local pos
local targ
local result_vec
local abil
local iss
local np
local myHeroPos

function BackCast.OnUpdate(orders)
	if used == 1 and Entity.GetVelocity(myHero):Length2DSqr() == 0 then
		--Log.Write(Ability.GetName(abil))
		myHeroPos = Entity.GetAbsOrigin(myHero)
		result_vec = myHeroPos + ((pos - myHeroPos):Normalized():Scaled(1.3))	
		Player.PrepareUnitOrders(play, ord, targ, result_vec, abil, iss, np, false, true)
		used = 0;
	end
end

function BackCast.OnPrepareUnitOrders(orders)
	if orders.order ~= 5 then return true end
	if not Menu.IsEnabled(BackCast.IsEnabled) then return true end
	myHero = Heroes.GetLocal()
	local abil_name = Ability.GetName(orders.ability)
	Console.Print(abil_name)
	Log.Write(abil_name)
	local enable = false
	for i, name in pairs(working_spells) do
		if abil_name == name then
			enable = true
			break;
		end
	end
	if not enable then  return true end 
	if NPC.IsChannellingAbility(myHero) then return false end
	if NPC.HasModifier(myHero, "modifier_teleporting") then return end	
	if (Ability.GetCastRange(orders.ability) + NPC.GetCastRangeBonus(myHero) < (orders.position - Entity.GetAbsOrigin(myHero)):Length2D()) and (not (abil_name == "tinker_march_of_the_machines")) then return true end	
	Player.PrepareUnitOrders(orders.player, Enum.UnitOrder.DOTA_UNIT_ORDER_STOP, orders.target, Vector(0, 0, 0), orders.ability, orders.orderIssuer, orders.npc, orders.queue, orders.showEffects)
	play = orders.player
	ord = orders.order
	targ = orders.target
	abil = orders.ability
	iss = orders.orderIssuer
	np = orders.npc
	pos = orders.position
	used = 1;
	return false
end

return BackCast