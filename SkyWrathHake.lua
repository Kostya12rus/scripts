local SkyWrathHake = {}

SkyWrathHake.IsToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Enabled", "")
SkyWrathHake.IsTargetParticleEnabled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Target indicator", "Draws particle for current target")
SkyWrathHake.IsConcShotParticleEnabled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Concussive shot indicator", "Draws concussive shot particle if enemy is in range of cast")
SkyWrathHake.combokey = Menu.AddKeyOption({"Hero Specific", "SkyWrathHake"}, "Combo Key", Enum.ButtonCode.KEY_F)
SkyWrathHake.harraskey = Menu.AddKeyOption({"Hero Specific", "SkyWrathHake"}, "Harras Key", Enum.ButtonCode.KEY_D)
SkyWrathHake.enemyInRange = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Closest to mouse range", "Range that makes assembly checking for enemy in selected range.", 100, 600, 100)

SkyWrathHake.menuItems = {atos = "Rod of Atos", hex = "Scythe of Vyse", eblade = "Ethereal Blade", veil = "Veil of Discrod", dagon = "Dagon", orchid = "Orchid", blood = "Bloodthorn", shiva = "Shiva's guard"}
SkyWrathHake.ItemsOptionID = {atos, hex, eblade, veil, dagon, orchid, blood, shiva}
for k, v in pairs(SkyWrathHake.menuItems) do
	SkyWrathHake.ItemsOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Magic Damage Items"}, SkyWrathHake.menuItems[k], "")
end

SkyWrathHake.menuAbilities = {bolt = "Arcane Bolt", slow = "Concussive Shot", silence = "Ancient Seal", ulti = "Mystic Flare"}
SkyWrathHake.AbilitiesOptionID = {bolt, slow, silence, ulti}
for k, v in pairs(SkyWrathHake.menuAbilities) do
	SkyWrathHake.AbilitiesOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Abilities"}, SkyWrathHake.menuAbilities[k], "")
end

SkyWrathHake.IsPopLinkenToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Pop Linkens Items"}, "Enabled Pop Linken", "")
SkyWrathHake.menuPopupLinkens = {cyclone = "Pop with Eul's Scepter of Divinity", atos = "Pop with Rod of Atos", hex = "Pop with Scythe of Vyse", forcestaff = "Pop with Force Staff", dagon = "Pop with Dagon", orchid = "Pop with Orchid", bloodthorn = "Pop with Bloodthorn", silence = "Pop with Ancient Seal", bolt = "Pop with Arcane Bolt", hurricane = "Pop with Hurricane Pike"}
SkyWrathHake.PopLinkensOptionID = {cyclone, atos, hex, forcestaff, dagon, orchid, blood, silence, bolt, hurricane}
for k, v in pairs(SkyWrathHake.menuPopupLinkens) do
	SkyWrathHake.PopLinkensOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Pop Linkens Items"}, SkyWrathHake.menuPopupLinkens[k], "")
end
SkyWrathHake.IsBMToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Check for BladeMail", "")
SkyWrathHake.IsSRToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Use Soul Ring", "")
SkyWrathHake.IsBlinkToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Use Blink Dagger", "Auto-blink to target when Combo key is pressed.")
SkyWrathHake.IsEZKChecked = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Check for EZ Kill", "Check if an enemy is ez-killable (low-mana costs and the fastest way to slay an enemy).")
SkyWrathHake.IsDoubleUltiToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Double ulti mode", "Casts double ulti with aghanim scepter item/buff equiped.")

SkyWrathHake.Modifiers = {[0] = "modifier_medusa_stone_gaze_stone", [1] = "modifier_winter_wyvern_winters_curse", [2] = "modifier_item_lotus_orb_active"}
SkyWrathHake.sleepers = {}

SkyWrathHake.targetParticle = 0
SkyWrathHake.cshotParticle = 0
SkyWrathHake.cshotParticleEnemy = nil

SkyWrathHake.isezkillable = false
SkyWrathHake.FarPredict = 390					
SkyWrathHake.DoubleMFRootedPredict = 610		
SkyWrathHake.DoubleMFUnrootedPredict = 630		
SkyWrathHake.CloseInPredict = 300				

function SkyWrathHake.OnGameStart()
	SkyWrathHake.sleepers = {}
	SkyWrathHake.targetParticle = 0
	SkyWrathHake.cshotParticle = 0
	SkyWrathHake.cshotParticleEnemy = nil
end

function SkyWrathHake.OnUpdate()
	if not Menu.IsEnabled(SkyWrathHake.IsToggled) then return
	end
	SkyWrathHake.hero = Heroes.GetLocal()
	if NPC.GetUnitName(SkyWrathHake.hero) ~= "npc_dota_hero_skywrath_mage" or not Entity.IsAlive(SkyWrathHake.hero) then
		return
	end
	SkyWrathHake.player = Players.GetLocal()	
	SkyWrathHake.enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(SkyWrathHake.hero), Enum.TeamType.TEAM_ENEMY)
	 
	if Menu.IsEnabled(SkyWrathHake.IsConcShotParticleEnabled) then	
		SkyWrathHake.GetCshotEnemy()
	end 
	SkyWrathHake.PrayToDog()
	SkyWrathHake.ArcaneHarras()
end

function SkyWrathHake.GetCshotEnemy()
	SkyWrathHake.cshotenemy = nil
	local cshot = NPC.GetAbilityByIndex(SkyWrathHake.hero, 1)
	if not cshot then return end
	local heroes = Heroes.InRadius(Entity.GetAbsOrigin(SkyWrathHake.hero), Ability.GetCastRange(cshot), Entity.GetTeamNum(SkyWrathHake.hero), Enum.TeamType.TEAM_ENEMY)
	if not heroes then return end
	if cshot and heroes then			
		local compDistance = Ability.GetCastRange(cshot)
		for k, v in pairs(heroes) do
			local curHero = heroes[k]
			local distance = Entity.GetAbsOrigin(curHero):Distance(Entity.GetAbsOrigin(SkyWrathHake.hero)):Length2D()
			if distance < compDistance then
				SkyWrathHake.cshotenemy = curHero
				compDistance = distance
			end			
		end
	end		
end

function SkyWrathHake.OnDraw()
	if SkyWrathHake.hero == nil or NPC.GetUnitName(SkyWrathHake.hero) ~= "npc_dota_hero_skywrath_mage" or not Entity.IsAlive(SkyWrathHake.hero) then
		if SkyWrathHake.targetParticle ~= 0 then
			Particle.Destroy(SkyWrathHake.targetParticle)			
			SkyWrathHake.targetParticle = 0
			particleEnemy = SkyWrathHake.enemy
		end
		if SkyWrathHake.cshotParticle ~= 0 then
			Particle.Destroy(SkyWrathHake.cshotParticle)			
			SkyWrathHake.cshotParticle = 0
		end
		return
	end
	local particleEnemy = SkyWrathHake.enemy
	if Menu.IsEnabled(SkyWrathHake.IsTargetParticleEnabled) then	
		if not particleEnemy or(not NPC.IsPositionInRange(SkyWrathHake.enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) and SkyWrathHake.targetParticle ~= 0) or SkyWrathHake.enemy ~= particleEnemy then
			Particle.Destroy(SkyWrathHake.targetParticle)			
			SkyWrathHake.targetParticle = 0
			particleEnemy = SkyWrathHake.enemy
		else
			if SkyWrathHake.targetParticle == 0 and NPC.IsPositionInRange(SkyWrathHake.enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) then
				SkyWrathHake.targetParticle = Particle.Create("particles/ui_mouseactions/range_finder_tower_aoe.vpcf", Enum.ParticleAttachment.PATTACH_INVALID, SkyWrathHake.enemy)				
			end
			if SkyWrathHake.targetParticle ~= 0 then
				Particle.SetControlPoint(SkyWrathHake.targetParticle, 2, Entity.GetOrigin(SkyWrathHake.hero))
				Particle.SetControlPoint(SkyWrathHake.targetParticle, 6, Vector(1, 0, 0))
				Particle.SetControlPoint(SkyWrathHake.targetParticle, 7, Entity.GetOrigin(SkyWrathHake.enemy))
			end
		end
	else 
		if SkyWrathHake.targetParticle ~= 0 then
			Particle.Destroy(SkyWrathHake.targetParticle)			
			SkyWrathHake.targetParticle = 0
		end
	end

	local cshot = NPC.GetAbilityByIndex(SkyWrathHake.hero, 1)
	if Menu.IsEnabled(SkyWrathHake.IsConcShotParticleEnabled) then	
		if not Ability.IsReady(cshot) or(not SkyWrathHake.cshotenemy and SkyWrathHake.cshotParticle ~= 0) or SkyWrathHake.cshotenemy ~= SkyWrathHake.cshotParticleEnemy then
			Particle.Destroy(SkyWrathHake.cshotParticle)			
			SkyWrathHake.cshotParticle = 0
			SkyWrathHake.cshotParticleEnemy = SkyWrathHake.cshotenemy
		else
			if Ability.IsReady(cshot) and SkyWrathHake.cshotParticle == 0 and SkyWrathHake.cshotenemy then				
				SkyWrathHake.cshotParticle = Particle.Create("particles/units/heroes/hero_skywrath_mage/skywrath_mage_concussive_shot.vpcf")
			end
			if SkyWrathHake.cshotParticle ~= 0 then
				local customOrigin = Entity.GetAbsOrigin(SkyWrathHake.cshotenemy)
				local zOrigin = customOrigin:GetZ()
				customOrigin:SetZ(zOrigin + 310)
				Particle.SetControlPoint(SkyWrathHake.cshotParticle, 0, customOrigin)
				Particle.SetControlPoint(SkyWrathHake.cshotParticle, 1, customOrigin)
				Particle.SetControlPoint(SkyWrathHake.cshotParticle, 2, Vector(500, 0, 0))					
			end
		end
	else 
		if SkyWrathHake.cshotParticle ~= 0 then
			Particle.Destroy(SkyWrathHake.cshotParticle)			
			SkyWrathHake.cshotParticle = 0
		end
	end
end

function SkyWrathHake.PrayToDog()	
	if not Menu.IsKeyDown(SkyWrathHake.combokey) then return end
	
	if not SkyWrathHake.enemy or not NPC.IsPositionInRange(SkyWrathHake.enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) then
		return
	end
	
	SkyWrathHake.enemyPos = Entity.GetAbsOrigin(SkyWrathHake.enemy)

	if not NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) and not SkyWrathHake.SleepCheck(0.05, "combosleep") then	
		Player.AttackTarget(SkyWrathHake.player, SkyWrathHake.hero, SkyWrathHake.enemy, false)
	end	

	if not SkyWrathHake.CheckForModifiers() or NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		return
	end

	SkyWrathHake.GetAbilities()
	SkyWrathHake.GetItems()
	SkyWrathHake.isFullDebuffed = SkyWrathHake.IsFullDebuffed()

	if NPC.GetUnitName(SkyWrathHake.enemy) == "npc_dota_hero_antimage" and NPC.GetItem(SkyWrathHake.enemy, "item_ultimate_scepter", true) then
		SkyWrathHake.PopLinkens(SkyWrathHake.forcestaff, SkyWrathHake.PopLinkensOptionID["forcestaff"])
		SkyWrathHake.PopLinkens(SkyWrathHake.dagon, SkyWrathHake.PopLinkensOptionID["dagon"])
		SkyWrathHake.PopLinkens(SkyWrathHake.bolt, SkyWrathHake.PopLinkensOptionID["bolt"])		
		SkyWrathHake.PopLinkens(SkyWrathHake.hurricane, SkyWrathHake.PopLinkensOptionID["hurricane"])
	end
		
	if NPC.IsLinkensProtected(SkyWrathHake.enemy) and Menu.IsEnabled(SkyWrathHake.IsPopLinkenToggled) and SkyWrathHake.SleepCheck(0.1, "poplinkensleep") then
		SkyWrathHake.PopLinkens(SkyWrathHake.cyclone, SkyWrathHake.PopLinkensOptionID["cyclone"])
		SkyWrathHake.PopLinkens(SkyWrathHake.forcestaff, SkyWrathHake.PopLinkensOptionID["forcestaff"])
		SkyWrathHake.PopLinkens(SkyWrathHake.silence, SkyWrathHake.PopLinkensOptionID["silence"])
		SkyWrathHake.PopLinkens(SkyWrathHake.bolt, SkyWrathHake.PopLinkensOptionID["bolt"])
		SkyWrathHake.PopLinkens(SkyWrathHake.dagon, SkyWrathHake.PopLinkensOptionID["dagon"])
		SkyWrathHake.PopLinkens(SkyWrathHake.atos, SkyWrathHake.PopLinkensOptionID["atos"])
		SkyWrathHake.PopLinkens(SkyWrathHake.hex, SkyWrathHake.PopLinkensOptionID["hex"])
		SkyWrathHake.PopLinkens(SkyWrathHake.orchid, SkyWrathHake.PopLinkensOptionID["orchid"])
		SkyWrathHake.PopLinkens(SkyWrathHake.blood, SkyWrathHake.PopLinkensOptionID["blood"])
		SkyWrathHake.PopLinkens(SkyWrathHake.hurricane, SkyWrathHake.PopLinkensOptionID["hurricane"])
		SkyWrathHake.Sleep(0.1, "poplinkensleep")	  
	else
		if not SkyWrathHake.SleepCheck(0.05, "combosleep") or NPC.IsLinkensProtected(SkyWrathHake.enemy) then return end		
		if NPC.IsEntityInRange(SkyWrathHake.hero, SkyWrathHake.enemy, 700) then			                    
			SkyWrathHake.isezkillable = SkyWrathHake.IsEzKillable()   
		end
		

		local soulring = NPC.GetItem(SkyWrathHake.hero, "item_soul_ring", true)
		if soulring and Menu.IsEnabled(SkyWrathHake.IsSRToggled) and Ability.IsReady(soulring) and Ability.IsCastable(soulring, Ability.GetManaCost(soulring)) then
			Ability.CastNoTarget(soulring)
		end

		SkyWrathHake.UseBlink()

		if not NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
			SkyWrathHake.UseItem(SkyWrathHake.hex, SkyWrathHake.ItemsOptionID["hex"])
		end
		
		SkyWrathHake.CastAbility(SkyWrathHake.slow, SkyWrathHake.AbilitiesOptionID["slow"])
		SkyWrathHake.UseItem(SkyWrathHake.atos, SkyWrathHake.ItemsOptionID["atos"])
		SkyWrathHake.CastAbility(SkyWrathHake.silence, SkyWrathHake.AbilitiesOptionID["silence"])
		SkyWrathHake.UseItem(SkyWrathHake.veil, SkyWrathHake.ItemsOptionID["veil"])
		SkyWrathHake.UseItem(SkyWrathHake.eblade, SkyWrathHake.ItemsOptionID["eblade"])
		SkyWrathHake.CastAbility(SkyWrathHake.bolt, SkyWrathHake.AbilitiesOptionID["bolt"])
		SkyWrathHake.CastAbility(SkyWrathHake.ulti, SkyWrathHake.AbilitiesOptionID["ulti"])				
		SkyWrathHake.UseItem(SkyWrathHake.orchid, SkyWrathHake.ItemsOptionID["orchid"])
		SkyWrathHake.UseItem(SkyWrathHake.dagon, SkyWrathHake.ItemsOptionID["dagon"])
		SkyWrathHake.UseItem(SkyWrathHake.blood, SkyWrathHake.ItemsOptionID["blood"])
		SkyWrathHake.UseItem(SkyWrathHake.shiva, SkyWrathHake.ItemsOptionID["shiva"])		
		SkyWrathHake.Sleep(0.05, "combosleep")		
	end	
end

function SkyWrathHake.ArcaneHarras()
	if not Menu.IsKeyDown(SkyWrathHake.harraskey) then return end	
	
	SkyWrathHake.enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(SkyWrathHake.hero), Enum.TeamType.TEAM_ENEMY)
	if not SkyWrathHake.enemy or not NPC.IsPositionInRange(SkyWrathHake.enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) then
		return
	end
	SkyWrathHake.enemyPos = Entity.GetAbsOrigin(SkyWrathHake.enemy)

	if not NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) then	
		Player.AttackTarget(SkyWrathHake.player, SkyWrathHake.hero, SkyWrathHake.enemy, false)
	end	

	if not SkyWrathHake.CheckForModifiers() or NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or not SkyWrathHake.SleepCheck(0.05, "harrassleep") then
		return
	end

	SkyWrathHake.GetAbilities()		
	SkyWrathHake.CastAbility(SkyWrathHake.bolt, SkyWrathHake.AbilitiesOptionID["bolt"])
	SkyWrathHake.Sleep(0.05, "harrassleep")
	if not NPC.IsAttacking(SkyWrathHake.hero) then
		Player.PrepareUnitOrders(SkyWrathHake.player, Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET, SkyWrathHake.enemy, Vector(0, 0, 0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, SkyWrathHake.hero, false, false)
	end
end

function SkyWrathHake.GetAmplifiers(hero, enemy)
	local amplfs = 0
	if NPC.HasModifier(hero, "modifier_bloodseeker_bloodrage") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(hero, "modifier_bloodseeker_bloodrage"), 1) / 100
	end
	if NPC.HasModifier(enemy, "modifier_bloodseeker_bloodrage") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(enemy, "modifier_bloodseeker_bloodrage"), 1) / 100
	end
	if NPC.HasModifier(enemy, "modifier_chen_penitence") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(enemy, "modifier_chen_penitence"), 1) / 100
	end
	if NPC.HasModifier(enemy, "modifier_shadow_demon_soul_catcher") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(enemy, "modifier_shadow_demon_soul_catcher"), 0) / 100
	end

	if NPC.HasModifier(enemy, "modifier_slardar_sprint") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(enemy, "modifier_slardar_sprint"), 0) / 100
	end

	if NPC.HasModifier(enemy, "modifier_slardar_sprint") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(enemy, "modifier_slardar_sprint"), 0) / 100
	end

	if NPC.HasModifier(enemy, "modifier_item_mask_of_death") then
		amplfs = amplfs + 25 / 100
	end

	if NPC.HasModifier(enemy, "modifier_item_orchid_malevolence") then
		amplfs = amplfs + 30 / 100
	end

	return amplfs
end

function SkyWrathHake.GetAbilities()
	if not SkyWrathHake.SleepCheck(1.0, "GetAbilities") then return end
	SkyWrathHake.bolt = NPC.GetAbility(SkyWrathHake.hero, "skywrath_mage_arcane_bolt")
	SkyWrathHake.slow = NPC.GetAbility(SkyWrathHake.hero, "skywrath_mage_concussive_shot")
	SkyWrathHake.silence = NPC.GetAbility(SkyWrathHake.hero, "skywrath_mage_ancient_seal")
	SkyWrathHake.ulti = NPC.GetAbility(SkyWrathHake.hero, "skywrath_mage_mystic_flare")
	SkyWrathHake.Sleep(1.0, "GetAbilities")
end

function SkyWrathHake.GetItems()
	if not SkyWrathHake.SleepCheck(1.0, "GetItems") then return end
	SkyWrathHake.atos = NPC.GetItem(SkyWrathHake.hero, "item_rod_of_atos", true)
	SkyWrathHake.hex = NPC.GetItem(SkyWrathHake.hero, "item_sheepstick", true)
	SkyWrathHake.veil = NPC.GetItem(SkyWrathHake.hero, "item_veil_of_discord", true)
	SkyWrathHake.eblade = NPC.GetItem(SkyWrathHake.hero, "item_ethereal_blade", true)
	SkyWrathHake.dagon = NPC.GetItem(SkyWrathHake.hero, "item_dagon", true)
	if not SkyWrathHake.dagon then
		for i = 2, 5 do
			SkyWrathHake.dagon = NPC.GetItem(SkyWrathHake.hero, "item_dagon_" .. i, true)
			if SkyWrathHake.dagon then break end
		end
	end
	SkyWrathHake.orchid = NPC.GetItem(SkyWrathHake.hero, "item_orchid", true)
	SkyWrathHake.blood = NPC.GetItem(SkyWrathHake.hero, "item_bloodthorn", true)
	SkyWrathHake.shiva = NPC.GetItem(SkyWrathHake.hero, "item_shivas_guard", true)
	SkyWrathHake.cyclone = NPC.GetItem(SkyWrathHake.hero, "item_cyclone", true)
	SkyWrathHake.forcestaff = NPC.GetItem(SkyWrathHake.hero, "item_force_staff", true)
	SkyWrathHake.hurricane = NPC.GetItem(SkyWrathHake.hero, "item_hurricane_pike", true)
	SkyWrathHake.Sleep(1.0, "GetItems")
end

function SkyWrathHake.PopLinkens(item, optionID)
	if item and Menu.IsEnabled(optionID) and Ability.IsCastable(item, Ability.GetManaCost(item)) then
		Ability.CastTarget(item, SkyWrathHake.enemy)
	end
end

function SkyWrathHake.CastAbility(ability, optionID)
	if ability and Menu.IsEnabled(optionID) and Ability.IsReady(ability) and Ability.IsCastable(ability, Ability.GetManaCost(ability)) and NPC.IsEntityInRange(SkyWrathHake.hero, SkyWrathHake.enemy, Ability.GetCastRange(ability)) then
		if ability == SkyWrathHake.slow then
			Ability.CastNoTarget(ability)
			return
		end		
		if ability == SkyWrathHake.ulti then
			if SkyWrathHake.isFullDebuffed and not SkyWrathHake.isezkillable then		
				SkyWrathHake.CastToPrediction() 
				return
			end
		else Ability.CastTarget(ability, SkyWrathHake.enemy)
		end
	end
end

function SkyWrathHake.CastToPrediction()
	local agh = NPC.GetItem(SkyWrathHake.hero, "item_ultimate_scepter", true)
	local aghBuff = NPC.HasModifier(SkyWrathHake.hero, "modifier_item_ultimate_scepter_consumed")
	SkyWrathHake.atoSleep = 0
	if(agh or aghBuff) and Menu.IsEnabled(SkyWrathHake.IsDoubleUltiToggled) then
		if NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
			Ability.CastPosition(SkyWrathHake.ulti, SkyWrathHake.InFront(SkyWrathHake.DoubleMFRootedPredict))
		else
			Ability.CastPosition(SkyWrathHake.ulti, SkyWrathHake.InFront(SkyWrathHake.DoubleMFUnrootedPredict))
		end		
		return
	end
	if NPC.HasModifier(SkyWrathHake.enemy, "modifier_rune_haste") then
		if NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then
			Ability.CastPosition(SkyWrathHake.ulti, SkyWrathHake.InFront(SkyWrathHake.CloseInPredict))
		else return end
	end		
	if NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) or NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then
		Ability.CastPosition(SkyWrathHake.ulti, SkyWrathHake.InFront(SkyWrathHake.CloseInPredict))
		return
	end
	Ability.CastPosition(SkyWrathHake.ulti, SkyWrathHake.InFront(SkyWrathHake.FarPredict))
end


function SkyWrathHake.CheckForModifiers()
	if Menu.IsEnabled(SkyWrathHake.IsBMToggled) and NPC.HasModifier(SkyWrathHake.enemy, "modifier_item_blade_mail_reflect") then
		return false
	end	
	for i = 0, 2 do
		if NPC.HasModifier(SkyWrathHake.enemy, SkyWrathHake.Modifiers[i]) then
			return false
		end
	end
	return true
end

function SkyWrathHake.UseItem(item, optionID)
	if item and Menu.IsEnabled(optionID) and Ability.IsReady(item) and Ability.IsCastable(item, Ability.GetManaCost(item)) and NPC.IsEntityInRange(SkyWrathHake.hero, SkyWrathHake.enemy, Ability.GetCastRange(item)) then
		if item == SkyWrathHake.shiva then
			Ability.CastNoTarget(item)
			return
		end
		if item == SkyWrathHake.dagon and SkyWrathHake.isFullDebuffed then
			Ability.CastTarget(item, SkyWrathHake.enemy)
			return
		end
		if item == SkyWrathHake.veil then
			Ability.CastPosition(item, SkyWrathHake.enemyPos)
			return
		end
		if item ~= SkyWrathHake.dagon then
			Ability.CastTarget(item, SkyWrathHake.enemy)
			return
		end		
	end
end

function SkyWrathHake.UseBlink()
	local blink = NPC.GetItem(SkyWrathHake.hero, "item_blink", true)
	if blink and Menu.IsEnabled(SkyWrathHake.IsBlinkToggled) and Ability.IsReady(blink) and SkyWrathHake.SleepCheck(1, "blink") then
		local castRange = Ability.GetLevelSpecialValueFor(blink, "blink_range") + NPC.GetCastRangeBonus(SkyWrathHake.hero)
    
		if NPC.IsEntityInRange(SkyWrathHake.hero, SkyWrathHake.enemy, 600) then return end

		local myloc = Entity.GetAbsOrigin(SkyWrathHake.hero)
		local distance = SkyWrathHake.enemyPos - myloc

		distance:SetZ(0)
		distance:Normalize()
		distance:Scale(castRange - 1)

		local blinkpos = myloc + distance
		Player.PrepareUnitOrders(SkyWrathHake.player, Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, SkyWrathHake.enemy, blinkpos, blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, SkyWrathHake.hero, false, false)
		SkyWrathHake.Sleep(1, "blink")
	end
end

function SkyWrathHake.IsFullDebuffed()
	if SkyWrathHake.atos and Ability.IsReady(SkyWrathHake.atos) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["atos"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_item_rod_of_atos") then return false end
	if SkyWrathHake.veil and Ability.IsReady(SkyWrathHake.veil) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["veil"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_item_veil_of_discord") then return false end
	if SkyWrathHake.silence and Ability.IsReady(SkyWrathHake.silence) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["silence"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_skywrath_mage_ancient_seal") then return false end
	if SkyWrathHake.orchid and Ability.IsReady(SkyWrathHake.orchid) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["orchid"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_item_orchid_malevolence") then return false end
	if SkyWrathHake.eblade and Ability.IsReady(SkyWrathHake.eblade) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["eblade"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_item_ethereal_blade_slow") then return false end
	if SkyWrathHake.blood and Ability.IsReady(SkyWrathHake.blood) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["blood"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_item_bloodthorn") then return false end
	if SkyWrathHake.slow and Ability.IsReady(SkyWrathHake.slow) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["slow"]) and not NPC.HasModifier(SkyWrathHake.enemy, "modifier_skywrath_mage_concussive_shot_slow") then return false end
	return true
end

function SkyWrathHake.SpellDamageTaken(magicresist)
	local amplf =(1 - NPC.GetMagicalArmorValue(SkyWrathHake.enemy) / 100) *(1 + magicresist / 100)
	return amplf
end

function SkyWrathHake.IsEzKillable()
	if not Menu.IsEnabled(SkyWrathHake.IsEZKChecked) then return false end
	if not SkyWrathHake.SleepCheck(3.0, "ezkillcheck") then return true end
	local modifamplifiers = SkyWrathHake.GetAmplifiers(SkyWrathHake.hero, SkyWrathHake.enemy)
	local totalDamage = 0
	local veilAmp = 0
	local silenceAmp = 0
	local ebladeAmp = 0
	local reqMana = 0

	if SkyWrathHake.veil and Ability.IsReady(SkyWrathHake.veil) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["veil"]) then
		veilAmp = 0.25
		reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.veil)
	end	

	if SkyWrathHake.silence and Ability.IsReady(SkyWrathHake.silence) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["silence"]) then
		silenceAmp =(Ability.GetLevel(SkyWrathHake.silence) * 5 + 30) / 100
		reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.silence)
	end

	if SkyWrathHake.eblade and Ability.IsReady(SkyWrathHake.eblade) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["eblade"]) then
		local ebladedamage = Hero.GetIntellectTotal(SkyWrathHake.hero) * 2 + 75
		totalDamage = totalDamage +(1 - NPC.GetMagicalArmorValue(SkyWrathHake.enemy)) *(1 + silenceAmp) *(1 + veilAmp) *(1 + modifamplifiers) *(ebladedamage + ebladedamage *(Hero.GetIntellectTotal(SkyWrathHake.hero) / 14 / 100))
		ebladeAmp = 0.4
		reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.eblade)
	end	

	if SkyWrathHake.dagon and Ability.IsReady(SkyWrathHake.dagon) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["dagon"]) then
		local dagondmg = Ability.GetLevelSpecialValueFor(SkyWrathHake.dagon, "damage")
		totalDamage = totalDamage +(1 - NPC.GetMagicalArmorValue(SkyWrathHake.enemy)) *(1 + silenceAmp) *(1 + veilAmp) *(1 + ebladeAmp) *(1 + modifamplifiers) *(dagondmg + dagondmg *(Hero.GetIntellectTotal(SkyWrathHake.hero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.dagon)
	end
                
	if SkyWrathHake.bolt and Ability.IsReady(SkyWrathHake.bolt) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["bolt"]) then
		local boldamage = Ability.GetLevelSpecialValueFor(SkyWrathHake.bolt, "bolt_damage") + Hero.GetIntellectTotal(SkyWrathHake.hero) * 1.6
		if Ability.GetLevel(SkyWrathHake.bolt) < 3 then
			totalDamage = totalDamage +(1 - NPC.GetMagicalArmorValue(SkyWrathHake.enemy)) *(1 + silenceAmp) *(1 + veilAmp) *(1 + ebladeAmp) *(1 + modifamplifiers) *(boldamage + boldamage *(Hero.GetIntellectTotal(SkyWrathHake.hero) / 14 / 100))
			reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.bolt)                    
		else
			totalDamage = totalDamage +(1 - NPC.GetMagicalArmorValue(SkyWrathHake.enemy)) *(1 + silenceAmp) *(1 + veilAmp) *(1 + ebladeAmp) *(1 + modifamplifiers) *(boldamage + boldamage *(Hero.GetIntellectTotal(SkyWrathHake.hero) / 14 / 100)) * 2
			reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.bolt) * 2
		end
	end

	if SkyWrathHake.slow and Ability.IsReady(SkyWrathHake.slow) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["slow"]) then
		local slowdamage = Ability.GetLevelSpecialValueFor(SkyWrathHake.slow, "damage")
		totalDamage = totalDamage +(1 - NPC.GetMagicalArmorValue(SkyWrathHake.enemy)) *(1 + silenceAmp) *(1 + veilAmp) *(1 + ebladeAmp) *(1 + modifamplifiers) *(slowdamage + slowdamage *(Hero.GetIntellectTotal(SkyWrathHake.hero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(SkyWrathHake.slow)
	end
                
--	if not NPC.HasState(SkyWrathHake.hero, Enum.ModifierState.MODIFIER_STATE_DISARMED) and not NPC.HasState(SkyWrathHake.enemy, Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) then
--		totalDamage = totalDamage + NPC.GetTrueDamage(SkyWrathHake.hero) * NPC.GetArmorDamageMultiplier(SkyWrathHake.enemy) * 2
--	end
	
	if reqMana < NPC.GetMana(SkyWrathHake.hero) and Entity.GetHealth(SkyWrathHake.enemy) < totalDamage + 70 then
		SkyWrathHake.Sleep(3.0, "ezkillcheck")		
		return true
	else
		return false
	end
end

function SkyWrathHake.InFront(delay)
	local vec = Entity.GetRotation(SkyWrathHake.enemy):GetVectors()
	local adjusment = NPC.GetMoveSpeed(SkyWrathHake.enemy)
	if delay == 610 then
		adjusment = 300
	end
	if vec then		
		local x = SkyWrathHake.enemyPos:GetX() + vec:GetX() * (delay / 1000) * adjusment
		local y = SkyWrathHake.enemyPos:GetY() + vec:GetY() * (delay / 1000) * adjusment
		return Vector(x, y, 0)
	end
end

function SkyWrathHake.UnitVectorFromXYAngle(alpha)
	return Vector(math.cos(alpha), math.sin(alpha), 0)
end

function SkyWrathHake.SleepCheck(delay, id)
	if not SkyWrathHake.sleepers[id] or(os.clock() - SkyWrathHake.sleepers[id]) > delay then
		return true
	end
	return false
end

function SkyWrathHake.Sleep(delay, id)
	if not SkyWrathHake.sleepers[id] or SkyWrathHake.sleepers[id] < os.clock() + delay then
		SkyWrathHake.sleepers[id] = os.clock() + delay
	end
end

return SkyWrathHake
