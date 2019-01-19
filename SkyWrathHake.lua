local SkyWrathHake = {}

SkyWrathHake.IsToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Enabled", "")
SkyWrathHake.IsTargetParticleEnabled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Target indicator", "Draws particle for current target")
SkyWrathHake.IsConcShotParticleEnabled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Concussive shot indicator", "Draws concussive shot particle if enemy is in range of cast")
SkyWrathHake.combokey = Menu.AddKeyOption({"Hero Specific", "SkyWrathHake"}, "Combo Key", Enum.ButtonCode.KEY_F)
SkyWrathHake.harraskey = Menu.AddKeyOption({"Hero Specific", "SkyWrathHake"}, "Harras Key", Enum.ButtonCode.KEY_D)
SkyWrathHake.enemyInRange = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Closest to mouse range", "Range that makes assembly checking for enemy in selected range.", 100, 600, 100)

SkyWrathHake.menuItems = {atos = "Rod of Atos", hex = "Scythe of Vyse", eblade = "Ethereal Blade", veil = "Veil of Discrod", dagon = "Dagon", orchid = "Orchid", blood = "Bloodthorn", shiva = "Shiva's guard", nullifier = "Nullifier"}
SkyWrathHake.ItemsOptionID = {atos, hex, eblade, veil, dagon, orchid, blood, shiva, nullifier}
for k, v in pairs(SkyWrathHake.menuItems) do
	SkyWrathHake.ItemsOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Magic Damage Items"}, SkyWrathHake.menuItems[k], "")
end

SkyWrathHake.menuAbilities = {bolt = "Arcane Bolt", slow = "Concussive Shot", silence = "Ancient Seal", ulti = "Mystic Flare"}
SkyWrathHake.AbilitiesOptionID = {bolt, slow, silence, ulti}
for k, v in pairs(SkyWrathHake.menuAbilities) do
	SkyWrathHake.AbilitiesOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Abilities"}, SkyWrathHake.menuAbilities[k], "")
end

SkyWrathHake.IsPopLinkenToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Pop Linkens Items"}, "Enabled Pop Linken", "")
SkyWrathHake.menuPopupLinkens = {nullifier = "Pop with Nullifier", cyclone = "Pop with Eul's Scepter of Divinity", atos = "Pop with Rod of Atos", hex = "Pop with Scythe of Vyse", forcestaff = "Pop with Force Staff", dagon = "Pop with Dagon", orchid = "Pop with Orchid", bloodthorn = "Pop with Bloodthorn", silence = "Pop with Ancient Seal", bolt = "Pop with Arcane Bolt", hurricane = "Pop with Hurricane Pike"}
SkyWrathHake.PopLinkensOptionID = {nullifier, cyclone, atos, hex, forcestaff, dagon, orchid, blood, silence, bolt, hurricane}
for k, v in pairs(SkyWrathHake.menuPopupLinkens) do
	SkyWrathHake.PopLinkensOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Pop Linkens Items"}, SkyWrathHake.menuPopupLinkens[k], "")
end

SkyWrathHake.IsPopAMReflectToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Pop Antimage's Reflect Items"}, "Enabled Pop AM Reflect", "")
SkyWrathHake.menuPopupAMReflect = {nullifier = "Pop with Nullifier", cyclone = "Pop with Eul's Scepter of Divinity", atos = "Pop with Rod of Atos", forcestaff = "Pop with Force Staff", dagon = "Pop with Dagon", bolt = "Pop with Arcane Bolt" }
SkyWrathHake.PopupAMReflectOptionID = {nullifier, cyclone, atos, hex, forcestaff, dagon, orchid, blood, silence, bolt, hurricane}
for k, v in pairs(SkyWrathHake.menuPopupAMReflect) do
	SkyWrathHake.PopupAMReflectOptionID[k] = Menu.AddOption({"Hero Specific", "SkyWrathHake", "Pop Antimage's Reflect Items"}, SkyWrathHake.menuPopupAMReflect[k], "")
end

SkyWrathHake.IsBMToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Check for BladeMail", "")
SkyWrathHake.IsAMCounterSpellToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Check for AM Counterspell", "")
SkyWrathHake.IsPWToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Check for Pugna Ward", "")
SkyWrathHake.IsSRToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Use Soul Ring", "")
SkyWrathHake.IsBlinkToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Use Blink Dagger", "Auto-blink to target when Combo key is pressed.")
SkyWrathHake.IsEZKChecked = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Check for EZ Kill", "Check if an enemy is ez-killable (low-mana costs and the fastest way to slay an enemy).")
SkyWrathHake.EZTogglerKey = Menu.AddKeyOption({"Hero Specific", "SkyWrathHake"}, "EZ Kill Toggle Key", Enum.ButtonCode.KEY_Z)
SkyWrathHake.IsDoubleUltiToggled = Menu.AddOption({"Hero Specific", "SkyWrathHake"}, "Double ulti mode", "Casts double ulti with aghanim scepter item/buff equiped.")

Modifiers = {[0] = "modifier_medusa_stone_gaze_stone",[1] = "modifier_winter_wyvern_winters_curse",[2] = "modifier_item_lotus_orb_active"}

targetParticle = 0
cshotParticle = 0
cshotParticleEnemy = nil

IsEZKillable = false
lastCheckTime = 0
FarPredict = 390					
DoubleMFRootedPredict = 610		
DoubleMFUnrootedPredict = 750		
CloseInPredict = 300	
Font = Renderer.LoadFont("Tahoma", 18, Enum.FontWeight.BOLD)			

function SkyWrathHake.OnGameStart()
	lastCheckTime = 0
	targetParticle = 0
	cshotParticle = 0
	cshotParticleEnemy = nil
end

function SkyWrathHake.OnGameEnd()
	lastCheckTime = 0
	targetParticle = 0
	cshotParticle = 0
	cshotParticleEnemy = nil
	myHero = nil
	enemy = nil
end

function SkyWrathHake.OnUpdate()
	if not Engine.IsInGame() or not Heroes.GetLocal() or not Menu.IsEnabled(SkyWrathHake.IsToggled) or GameRules.IsPaused() then return end
	myHero = Heroes.GetLocal()
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_skywrath_mage" or not Entity.IsAlive(myHero) then
		return
	end
	if Menu.IsKeyDownOnce(SkyWrathHake.EZTogglerKey) then
		if Menu.IsEnabled(SkyWrathHake.IsEZKChecked) then
			Menu.SetValue(SkyWrathHake.IsEZKChecked, 0, false)
		else 
			Menu.SetValue(SkyWrathHake.IsEZKChecked, 1, true)
		end		
	end
	myPlayer = Players.GetLocal()	
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if Menu.IsEnabled(SkyWrathHake.IsConcShotParticleEnabled) then	
		SkyWrathHake.GetCshotEnemy()
	end 
	SkyWrathHake.PrayToDog()
	SkyWrathHake.ArcaneHarras()
end

function SkyWrathHake.GetCshotEnemy()
	cshotenemy = nil
	local cshot = NPC.GetAbility(myHero, "skywrath_mage_concussive_shot")
	if not cshot then return end
	local heroes = Heroes.InRadius(Entity.GetAbsOrigin(myHero), Ability.GetCastRange(cshot), Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if not heroes then return end
	if cshot and heroes then			
		local compDistance = Ability.GetCastRange(cshot)
		for k, v in pairs(heroes) do
			local curHero = heroes[k]
			local distance = Entity.GetAbsOrigin(curHero):Distance(Entity.GetAbsOrigin(myHero)):Length2D()
			if distance < compDistance then
				cshotenemy = curHero
				compDistance = distance
			end			
		end
	end		
end


function SkyWrathHake.OnDraw()
	if not Heroes.GetLocal() then return end
	if myHero == nil or NPC.GetUnitName(myHero) ~= "npc_dota_hero_skywrath_mage" or not Entity.IsAlive(myHero) then
		if targetParticle ~= 0 then
			Particle.Destroy(targetParticle)			
			targetParticle = 0
			particleEnemy = enemy
		end
		if cshotParticle ~= 0 then
			Particle.Destroy(cshotParticle)			
			cshotParticle = 0
		end
		return
	end
	local ezKillMode
	local x, y = Renderer.GetScreenSize()
	if x == 1920 and y == 1080 then
		x, y = 1150, 910
	elseif x== 1600 and y == 900 then
		x, y = 950, 755
	elseif x== 1366 and y == 768 then
		x, y = 805, 643
	elseif x==1280 and y == 720 then
		x, y = 752, 600
	elseif x==1280 and y == 1024 then
		x, y = 800, 860
	elseif x==1440 and y == 900 then
		x, y = 870, 755
	elseif x== 1680 and y == 1050 then
		x, y = 1025, 885
	end
	if Menu.IsEnabled(SkyWrathHake.IsEZKChecked) then
		Renderer.SetDrawColor(90, 255, 100)
		ezKillMode = "ON"		
	else
		Renderer.SetDrawColor(255, 90, 100)
		ezKillMode = "OFF"
	end
	Renderer.DrawText(Font, x, y, "[EZ KILL: "..ezKillMode.."]")
	local particleEnemy = enemy
	if Menu.IsEnabled(SkyWrathHake.IsTargetParticleEnabled) then	
		if not particleEnemy or(not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) and targetParticle ~= 0) or enemy ~= particleEnemy then
			Particle.Destroy(targetParticle)			
			targetParticle = 0
			particleEnemy = enemy
		else
			if targetParticle == 0 and NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) then
				targetParticle = Particle.Create("particles/ui_mouseactions/range_finder_tower_aoe.vpcf", Enum.ParticleAttachment.PATTACH_INVALID, enemy)				
			end
			if targetParticle ~= 0 then
				Particle.SetControlPoint(targetParticle, 2, Entity.GetOrigin(myHero))
				Particle.SetControlPoint(targetParticle, 6, Vector(1, 0, 0))
				Particle.SetControlPoint(targetParticle, 7, Entity.GetOrigin(enemy))
			end
		end
	else 
		if targetParticle ~= 0 then
			Particle.Destroy(targetParticle)			
			targetParticle = 0
		end
	end

	local cshot = NPC.GetAbility(myHero, "skywrath_mage_concussive_shot")
	if Menu.IsEnabled(SkyWrathHake.IsConcShotParticleEnabled) then	
		if not Ability.IsReady(cshot) or(not cshotenemy and cshotParticle ~= 0) or cshotenemy ~= cshotParticleEnemy then
			Particle.Destroy(cshotParticle)			
			cshotParticle = 0
			cshotParticleEnemy = cshotenemy
		else
			if Ability.IsReady(cshot) and cshotParticle == 0 and cshotenemy then				
				cshotParticle = Particle.Create("particles/units/heroes/hero_skywrath_mage/skywrath_mage_concussive_shot.vpcf")
			end
			if cshotParticle ~= 0 then
				local customOrigin = Entity.GetAbsOrigin(cshotenemy)
				local zOrigin = customOrigin:GetZ()
				customOrigin:SetZ(zOrigin + 310)
				Particle.SetControlPoint(cshotParticle, 0, customOrigin)
				Particle.SetControlPoint(cshotParticle, 1, customOrigin)
				Particle.SetControlPoint(cshotParticle, 2, Vector(500, 0, 0))					
			end
		end
	else 
		if cshotParticle ~= 0 then
			Particle.Destroy(cshotParticle)			
			cshotParticle = 0
		end
	end
end

function SkyWrathHake.PrayToDog()	
	if not Menu.IsKeyDown(SkyWrathHake.combokey) then return end
	if not enemy or not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) then
		return
	end
	
	enemyPos = Entity.GetAbsOrigin(enemy)
	if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) then	
		Player.AttackTarget(myPlayer, myHero, enemy, false)
	end
	if not SkyWrathHake.CheckForModifiers() or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or NPC.HasModifier(enemy, "modifier_oracle_fates_edict") then
		return
	end

	SkyWrathHake.GetAbilities()
	SkyWrathHake.GetItems()
	SkyWrathHake.isFullDebuffed = SkyWrathHake.IsFullDebuffed()

	if Menu.IsEnabled(SkyWrathHake.IsPopAMReflectToggled) and NPC.GetUnitName(enemy) == "npc_dota_hero_antimage" and not NPC.HasModifier(enemy, "modifier_silver_edge_debuff") and not NPC.HasModifier(enemy, "modifier_viper_nethertoxin") and(NPC.GetItem(enemy, "item_ultimate_scepter", true) or NPC.HasModifier(enemy, "modifier_item_ultimate_scepter_consumed")) and Ability.IsReady(NPC.GetAbility(enemy, "antimage_spell_shield")) then
		if SkyWrathHake.PopLinkens(forcestaff, SkyWrathHake.PopupAMReflectOptionID["forcestaff"]) then return end
		if SkyWrathHake.PopLinkens(cyclone, SkyWrathHake.PopupAMReflectOptionID["cyclone"]) then return end
		if SkyWrathHake.PopLinkens(dagon, SkyWrathHake.PopupAMReflectOptionID["dagon"]) then return end
		if SkyWrathHake.PopLinkens(bolt, SkyWrathHake.PopupAMReflectOptionID["bolt"]) then return end
		if SkyWrathHake.PopLinkens(atos, SkyWrathHake.PopupAMReflectOptionID["atos"]) then return end		
		return 
	end
		
	if NPC.IsLinkensProtected(enemy) and Menu.IsEnabled(SkyWrathHake.IsPopLinkenToggled) then
		if SkyWrathHake.PopLinkens(cyclone, SkyWrathHake.PopLinkensOptionID["cyclone"]) then return end
		if SkyWrathHake.PopLinkens(forcestaff, SkyWrathHake.PopLinkensOptionID["forcestaff"]) then return end
		if SkyWrathHake.PopLinkens(orchid, SkyWrathHake.PopLinkensOptionID["orchid"]) then return end
		if SkyWrathHake.PopLinkens(blood, SkyWrathHake.PopLinkensOptionID["blood"]) then return end
		if SkyWrathHake.PopLinkens(hurricane, SkyWrathHake.PopLinkensOptionID["hurricane"]) then return end	
		if SkyWrathHake.PopLinkens(silence, SkyWrathHake.PopLinkensOptionID["silence"]) then return end
		if SkyWrathHake.PopLinkens(bolt, SkyWrathHake.PopLinkensOptionID["bolt"]) then return end		
		if SkyWrathHake.PopLinkens(atos, SkyWrathHake.PopLinkensOptionID["atos"]) then return end		
		if SkyWrathHake.PopLinkens(nullifier, SkyWrathHake.PopLinkensOptionID["nullifier"]) then return end 
		if SkyWrathHake.PopLinkens(hex, SkyWrathHake.PopLinkensOptionID["hex"]) then return end
		if SkyWrathHake.PopLinkens(dagon, SkyWrathHake.PopLinkensOptionID["dagon"]) then return end
		return 
	end
	if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
		if SkyWrathHake.UseItem(hex, SkyWrathHake.ItemsOptionID["hex"]) then return end
	end	
	
	if NPC.IsEntityInRange(myHero, enemy, 700) and not NPC.HasModifier(enemy, "modifier_teleporting") then			                    
		IsEZKillable = SkyWrathHake.IsEZKillableCheck()   
	end

	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	if soulring and Menu.IsEnabled(SkyWrathHake.IsSRToggled) and Ability.IsReady(soulring) and Ability.IsCastable(soulring, Ability.GetManaCost(soulring)) then
		Ability.CastNoTarget(soulring)
		return
	end
	if SkyWrathHake.UseBlink() then return end
	if SkyWrathHake.AeonDispelling() then return end
	if SkyWrathHake.CastAbility(slow, SkyWrathHake.AbilitiesOptionID["slow"]) then return end
	if SkyWrathHake.UseItem(atos, SkyWrathHake.ItemsOptionID["atos"]) then return end
	if SkyWrathHake.CastAbility(silence, SkyWrathHake.AbilitiesOptionID["silence"]) then return end
	if SkyWrathHake.UseItem(veil, SkyWrathHake.ItemsOptionID["veil"]) then return end
	if SkyWrathHake.UseItem(eblade, SkyWrathHake.ItemsOptionID["eblade"]) then return end
	if SkyWrathHake.CastAbility(bolt, SkyWrathHake.AbilitiesOptionID["bolt"]) then return end
	if SkyWrathHake.CastAbility(ulti, SkyWrathHake.AbilitiesOptionID["ulti"]) then return end 	
	if SkyWrathHake.UseItem(orchid, SkyWrathHake.ItemsOptionID["orchid"]) then return end
	if SkyWrathHake.UseItem(dagon, SkyWrathHake.ItemsOptionID["dagon"]) then return end
	if SkyWrathHake.UseItem(blood, SkyWrathHake.ItemsOptionID["blood"]) then return end
	if SkyWrathHake.UseItem(shiva, SkyWrathHake.ItemsOptionID["shiva"]) then return end
	if not NPC.HasModifier(enemy, "modifier_item_nullifier_mute") and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
		if NPC.GetItem(enemy, "item_aeon_disk", true) and not Ability.IsReady(NPC.GetItem(enemy, "item_aeon_disk", true)) then
			if SkyWrathHake.UseItem(nullifier, SkyWrathHake.ItemsOptionID["nullifier"]) then return end
		elseif not NPC.GetItem(enemy, "item_aeon_disk", true) then
			if SkyWrathHake.UseItem(nullifier, SkyWrathHake.ItemsOptionID["nullifier"]) then return end
		end	
		return
	end
end

function SkyWrathHake.AeonDispelling()
	local aeonDiskBuff = NPC.GetModifier(enemy, "modifier_item_aeon_disk_buff")
	if NPC.GetItem(enemy, "item_aeon_disk", true) and(Entity.GetHealth(enemy) / Entity.GetMaxHealth(enemy) < 0.73 or aeonDiskBuff) and nullifier and Ability.IsReady(nullifier) and Ability.IsCastable(nullifier, Ability.GetManaCost(nullifier)) then
		Ability.CastTarget(nullifier, enemy)
		return true
	end
	return false
end

function SkyWrathHake.ArcaneHarras()
	if not Menu.IsKeyDown(SkyWrathHake.harraskey) then return end		
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	if not enemy or not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(SkyWrathHake.enemyInRange), 0) then
		return
	end
	enemyPos = Entity.GetAbsOrigin(enemy)
	if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ATTACK_IMMUNE) then	
		Player.AttackTarget(myPlayer, myHero, enemy, false)
	end	
	
	if not SkyWrathHake.CheckForModifiers() or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		return
	end
	SkyWrathHake.GetAbilities()		
	if SkyWrathHake.CastAbility(bolt, SkyWrathHake.AbilitiesOptionID["bolt"]) then return end
end

function SkyWrathHake.GetAmplifiers()
	local amplfs = 0
	if NPC.HasModifier(myHero, "modifier_bloodseeker_bloodrage") then
		amplfs = amplfs + Modifier.GetConstantByIndex(NPC.GetModifier(myHero, "modifier_bloodseeker_bloodrage"), 1) / 100
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
	bolt = NPC.GetAbility(myHero, "skywrath_mage_arcane_bolt")
	slow = NPC.GetAbility(myHero, "skywrath_mage_concussive_shot")
	silence = NPC.GetAbility(myHero, "skywrath_mage_ancient_seal")
	ulti = NPC.GetAbility(myHero, "skywrath_mage_mystic_flare")
end

function SkyWrathHake.GetItems()
	atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
	nullifier = NPC.GetItem(myHero, "item_nullifier", true)
	hex = NPC.GetItem(myHero, "item_sheepstick", true)
	veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	eblade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	nullifier = NPC.GetItem(myHero, "item_nullifier", true)
	dagon = NPC.GetItem(myHero, "item_dagon", true)
	if not dagon then
		for i = 2, 5 do
			dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
			if dagon then break end
		end
	end
	orchid = NPC.GetItem(myHero, "item_orchid", true)
	blood = NPC.GetItem(myHero, "item_bloodthorn", true)
	shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
	cyclone = NPC.GetItem(myHero, "item_cyclone", true)
	forcestaff = NPC.GetItem(myHero, "item_force_staff", true)
	hurricane = NPC.GetItem(myHero, "item_hurricane_pike", true)
end

function SkyWrathHake.PopLinkens(item, optionID)
	if item and Menu.IsEnabled(optionID) and Ability.IsReady(item) and Ability.IsCastable(item, Ability.GetManaCost(item)) then
		Ability.CastTarget(item, enemy)
		return true
	end
	return false
end

function SkyWrathHake.CastAbility(ability, optionID)
	if ability and Menu.IsEnabled(optionID) and Ability.IsReady(ability) and Ability.IsCastable(ability, Ability.GetManaCost(ability)) and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(ability)) then
		if ability == slow then
			Ability.CastNoTarget(ability)
			return true
		end		
		if ability == ulti then
			if SkyWrathHake.isFullDebuffed and not IsEZKillable then		
				SkyWrathHake.CastToPrediction() 
				return true
			end
		else Ability.CastTarget(ability, enemy)
			return true
		end
	end
	return false
end

function SkyWrathHake.CastToPrediction()
	local agh = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local aghBuff = NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed")
	atosleep = 0
	if(agh or aghBuff) and Menu.IsEnabled(SkyWrathHake.IsDoubleUltiToggled) then
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_STUNNED) then
			Ability.CastPosition(ulti, SkyWrathHake.InFront(DoubleMFRootedPredict))
		elseif NPC.IsRunning(enemy) then
			Ability.CastPosition(ulti, SkyWrathHake.InFront(DoubleMFUnrootedPredict))
		else Ability.CastPosition(ulti, SkyWrathHake.InFront(630))
		end		
		return
	end
	if NPC.HasModifier(enemy, "modifier_rune_haste") then
		if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then
			Ability.CastPosition(ulti, SkyWrathHake.InFront(CloseInPredict))
		else return end
	end		
	if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_ROOTED) then
		Ability.CastPosition(ulti, SkyWrathHake.InFront(CloseInPredict))
		return
	end
	Ability.CastPosition(ulti, SkyWrathHake.InFront(FarPredict))
end


function SkyWrathHake.CheckForModifiers()
	if (Menu.IsEnabled(SkyWrathHake.IsBMToggled) and NPC.HasModifier(enemy, "modifier_item_blade_mail_reflect")) or (Menu.IsEnabled(SkyWrathHake.IsPWToggled) and NPC.HasModifier(myHero, "modifier_pugna_nether_ward_aura")) or (Menu.IsEnabled(SkyWrathHake.IsAMCounterSpellToggled) and NPC.HasModifier(enemy, "modifier_antimage_counterspell")) then
		return false
	end	
	for i = 0, 2 do
		if NPC.HasModifier(enemy, Modifiers[i]) then
			return false
		end
	end
	return true
end

function SkyWrathHake.UseItem(item, optionID)
	if item and Menu.IsEnabled(optionID) and Ability.IsReady(item) and Ability.IsCastable(item, Ability.GetManaCost(item)) and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(item)) then
		if item == shiva then
			Ability.CastNoTarget(item)
			return true
		end
		if item == dagon and SkyWrathHake.isFullDebuffed then
			Ability.CastTarget(item, enemy)
			return true
		end
		if item == veil then
			Ability.CastPosition(item, enemyPos)
			return true
		end
		if item ~= dagon then
			Ability.CastTarget(item, enemy)
			return true
		end		
	end
	return false
end

function SkyWrathHake.UseBlink()
	local blink = NPC.GetItem(myHero, "item_blink", true)
	if blink and Menu.IsEnabled(SkyWrathHake.IsBlinkToggled) and Ability.IsReady(blink) then
		local castRange = Ability.GetLevelSpecialValueFor(blink, "blink_range") + NPC.GetCastRangeBonus(myHero)
    
		if NPC.IsEntityInRange(myHero, enemy, 600) then return end

		local myloc = Entity.GetAbsOrigin(myHero)
		local distance = enemyPos - myloc

		distance:SetZ(0)
		distance:Normalize()
		distance:Scale(castRange - 1)

		local blinkpos = myloc + distance
		Player.PrepareUnitOrders(myPlayer, Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, enemy, blinkpos, blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, myHero, false, false)
		return true
	end
	return false
end

function SkyWrathHake.IsFullDebuffed()
	if atos and Ability.IsReady(atos) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["atos"]) and not NPC.HasModifier(enemy, "modifier_item_rod_of_atos") then return false end
	if veil and Ability.IsReady(veil) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["veil"]) and not NPC.HasModifier(enemy, "modifier_item_veil_of_discord") then return false end
	if silence and Ability.IsReady(silence) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["silence"]) and not NPC.HasModifier(enemy, "modifier_skywrath_mage_ancient_seal") then return false end
	if orchid and Ability.IsReady(orchid) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["orchid"]) and not NPC.HasModifier(enemy, "modifier_item_orchid_malevolence") then return false end
	if eblade and Ability.IsReady(eblade) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["eblade"]) and not NPC.HasModifier(enemy, "modifier_item_ethereal_blade_slow") then return false end
	if blood and Ability.IsReady(blood) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["blood"]) and not NPC.HasModifier(enemy, "modifier_item_bloodthorn") then return false end
	if slow and Ability.IsReady(slow) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["slow"]) and not NPC.HasModifier(enemy, "modifier_skywrath_mage_concussive_shot_slow") then return false end
	return true
end

function SkyWrathHake.IsEZKillableCheck()
	if not Menu.IsEnabled(SkyWrathHake.IsEZKChecked) then return false end
	if os.clock() < lastCheckTime + 4 then return true end
	local modifamplifiers = SkyWrathHake.GetAmplifiers()
	local totalDamage = 0
	local veilAmp = 0	
	local silenceAmp = 0
	local talentAmp = NPC.GetAbilityByIndex(myHero, 11)
	if Ability.GetLevel(talentAmp) > 0 then
		silenceAmp = silenceAmp + 0.15
	end
	local ebladeAmp = 0
	local reqMana = 0
	local perkAmp = Hero.GetIntellectTotal(myHero) / 100 * 0.066891

	if veil and Ability.IsReady(veil) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["veil"]) then
		veilAmp = 0.25
		reqMana = reqMana + Ability.GetManaCost(veil)
	end	

	if silence and Ability.IsReady(silence) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["silence"]) then
		silenceAmp = silenceAmp + (Ability.GetLevel(silence) * 5 + 30) / 100
		reqMana = reqMana + Ability.GetManaCost(silence)
	end

	if eblade and Ability.IsReady(eblade) and Menu.IsEnabled(SkyWrathHake.ItemsOptionID["eblade"]) then
		local ebladedamage = Hero.GetIntellectTotal(myHero) * 2 + 75
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + modifamplifiers) * (ebladedamage + ebladedamage * perkAmp)
		ebladeAmp = 0.4
		reqMana = reqMana + Ability.GetManaCost(eblade)
	end	

	if dagon and Ability.IsReady(dagon) then
		local dagondmg = Ability.GetLevelSpecialValueFor(dagon, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (1 + modifamplifiers) * (dagondmg + dagondmg * perkAmp)
		reqMana = reqMana + Ability.GetManaCost(dagon)
	end
                
	if bolt and Ability.IsReady(bolt) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["bolt"]) then
		local boldamage = Ability.GetLevelSpecialValueFor(bolt, "bolt_damage") + Hero.GetIntellectTotal(myHero) * 1.6
		if Ability.GetLevel(bolt) < 3 then
			totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (1 + modifamplifiers) * (boldamage + boldamage * perkAmp)
			reqMana = reqMana + Ability.GetManaCost(bolt)                    
		else
			totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (1 + modifamplifiers) * (boldamage + boldamage * perkAmp) * 2
			reqMana = reqMana + Ability.GetManaCost(bolt) * 2
		end
	end

	if slow and Ability.IsReady(slow) and Menu.IsEnabled(SkyWrathHake.AbilitiesOptionID["slow"]) then
		local slowdamage = Ability.GetLevelSpecialValueFor(slow, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (1 + modifamplifiers) * (slowdamage + slowdamage * perkAmp)
		reqMana = reqMana + Ability.GetManaCost(slow)
	end               

	if reqMana < NPC.GetMana(myHero) and Entity.GetHealth(enemy) < totalDamage + 70 then		
		lastCheckTime = os.clock()
		return true
	else
		return false
	end
end

function SkyWrathHake.InFront(delay)
	local enemyPos = Entity.GetAbsOrigin(enemy)
	local vec = Entity.GetRotation(enemy):GetVectors()
	local adjusment = NPC.GetMoveSpeed(enemy)
	if delay == 610 then
		adjusment = 300
	end
	if vec then		
		local x = enemyPos:GetX() + vec:GetX() *(delay / 1000) * adjusment
		local y = enemyPos:GetY() + vec:GetY() *(delay / 1000) * adjusment
		return Vector(x, y, enemyPos:GetZ())
	end
end

return SkyWrathHake
