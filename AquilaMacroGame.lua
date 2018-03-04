local AquilaMacroGame = {}
AquilaMacroGame.optionEnable = Menu.AddOption({"Utility", "Aquila Macro Game"}, "Activation", "")
AquilaMacroGame.Font = Renderer.LoadFont("Tahoma", 14, Enum.FontWeight.EXTRABOLD)

function AquilaMacroGame.OnPrepareUnitOrders(orders)
	if orders.ability and orders.order == 9 then
		if Ability.GetName(orders.ability) == "item_ring_of_aquila" then
		  aquila_triger = not aquila_triger
		end
		if Ability.GetName(orders.ability) == "item_ring_of_basilius" then
			basilius_triger = not basilius_triger
		end
	end
	return true
end

function AquilaMacroGame.OnUpdate()
  if not Menu.IsEnabled(AquilaMacroGame.optionEnable) then return end
  local myHero = Heroes.GetLocal()
  if not myHero then return end
  if timer <= GameRules.GetGameTime() and Entity.IsAlive(myHero) then
    if NPC.HasItem(myHero,"item_ring_of_basilius") and basilius_triger then
      ring = NPC.GetItem(myHero,"item_ring_of_basilius")
      AquilaMacroGame.RingGame(ring)
    end
    if NPC.HasItem(myHero,"item_ring_of_aquila") and aquila_triger then
      ring = NPC.GetItem(myHero,"item_ring_of_aquila")
      AquilaMacroGame.RingGame(ring)
	end
  end
end

function AquilaMacroGame.RingGame(ring)
  if ring and Ability.IsReady(ring) then
    if not AquilaMacroGame.NeedActivate() and not Ability.GetToggleState(ring) then
      Ability.Toggle(ring)
      timer = GameRules.GetGameTime() + 0.5
    elseif AquilaMacroGame.NeedActivate() and Ability.GetToggleState(ring) then
      Ability.Toggle(ring)
      timer = GameRules.GetGameTime() + 0.5
    end
  end
end

function AquilaMacroGame.NeedActivate()
  local activ = false
  for _,npc_1 in pairs(NPCs.InRadius(Entity.GetAbsOrigin(Heroes.GetLocal()),900,Entity.GetTeamNum(Heroes.GetLocal()),Enum.TeamType.TEAM_FRIEND)) do
    if npc_1 and NPC.IsLaneCreep(npc_1) and not NPC.IsWaitingToSpawn(npc_1) and Entity.IsAlive(npc_1) then
      local creep_hp = Entity.GetHealth(npc_1)
      for _,npc_2 in pairs(NPCs.InRadius(Entity.GetAbsOrigin(npc_1),1000,Entity.GetTeamNum(npc_1),Enum.TeamType.TEAM_ENEMY)) do
        if npc_2 and NPC.IsHero(npc_2) and Entity.IsAlive(npc_2) and not NPC.IsIllusion(npc_2) then
          local damage_to_creep = ((NPC.GetTrueDamage(npc_2)+NPC.GetTrueMaximumDamage(npc_2))/2)-NPC.GetPhysicalDamageReduction(npc_1)*((NPC.GetTrueDamage(npc_2)+NPC.GetTrueMaximumDamage(npc_2))/2)
          if creep_hp <= damage_to_creep and NPC.IsPositionInRange(npc_2,Entity.GetOrigin(npc_1),NPC.GetAttackRange(npc_2)+20) then
            return true
          elseif creep_hp >= damage_to_creep or not NPC.IsPositionInRange(npc_2,Entity.GetOrigin(npc_1),NPC.GetAttackRange(npc_2)+20) then
            activ = false
          end
        end
      end
    end
  end
  return activ
end

function AquilaMacroGame.init()
  ring = nil
  timer = 0
  aquila_triger = true
  basilius_triger = true
end

function AquilaMacroGame.OnGameStart()
  AquilaMacroGame.init()
end

function AquilaMacroGame.OnGameEnd()
  AquilaMacroGame.init()
end

AquilaMacroGame.init()

return AquilaMacroGame