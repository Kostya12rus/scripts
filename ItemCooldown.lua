local ItemCooldown = {}

ItemCooldown.optionEnable = Menu.AddOption({ "Awareness" , "Item Cooldown Display Image"}, "Enabled",  "Show items cooldown")
ItemCooldown.spellIconPath = "resource/flash3/images/items/"
ItemCooldown.boxSizeOption = Menu.AddOption({ "Awareness", "Item Cooldown Display Image","Cooldown Display Size" }, "Cooldown Display Size", "", 21, 64, 1)
ItemCooldown.gapy = Menu.AddOption({ "Awareness", "Item Cooldown Display Image","GapY" }, "GapY", "", 20, 65, 1)
ItemCooldown.gapx = Menu.AddOption({ "Awareness", "Item Cooldown Display Image","GapX"}, "GapX", "", 40, 120, 10)
 ItemCooldown.font = Renderer.LoadFont("Tahoma", 18, Enum.FontWeight.EXTRABOLD)
ItemCooldown.cachedIcons = {}

-- important item database
ItemCooldown.importantItems = {}
ItemCooldown.importantItems["item_dagon"] = "dagon" -- "Dagon 1"
ItemCooldown.importantItems["item_dagon_2"] = "dagon_2" -- "Dagon 2"
ItemCooldown.importantItems["item_dagon_3"] = "dagon_3" -- "Dagon 3"
ItemCooldown.importantItems["item_dagon_4"] = "dagon_4" -- "Dagon 4"
ItemCooldown.importantItems["item_dagon_5"] = "dagon_5" -- "Dagon 5"
ItemCooldown.importantItems["item_aegis"] = "aegis" --"Aegis of the Immortal"
ItemCooldown.importantItems["item_blink"] = "blink" -- "Blink Dagger"
ItemCooldown.importantItems["item_cheese"] = "cheese" -- "Cheese"
ItemCooldown.importantItems["item_dust"] = "dust" -- "Dust of Appearance"
ItemCooldown.importantItems["item_faerie_fire"] = "faerie_fire" -- "Faerie Fire"
ItemCooldown.importantItems["item_gem"] = "gem" -- "Gem of True Sight"
ItemCooldown.importantItems["item_ghost"] = "ghost_scepter" -- "Ghost Scepter"
ItemCooldown.importantItems["item_flask"] = "salve" -- "Healing Salve"
ItemCooldown.importantItems["item_infused_raindrop"] = "infused_raindrop" -- "Infused Raindrop"
ItemCooldown.importantItems["item_shadow_amulet"] = "shadow_amulet" -- "Shadow Amulet"
ItemCooldown.importantItems["item_smoke_of_deceit"] = "smoke" -- "Smoke of Deceit"
ItemCooldown.importantItems["item_abyssal_blade"] = "abyssal_blade" -- "Abyssal Blade"
ItemCooldown.importantItems["item_black_king_bar"] = "black_king_bar" -- "Black King Bar"
ItemCooldown.importantItems["item_blade_mail"] = "blade_mail" -- "Blade Mail"
ItemCooldown.importantItems["item_tpscroll"] = "tpscroll" -- "Town Portal Scroll"
ItemCooldown.importantItems["item_travel_boots"] = "travel_boots" -- "Boots of Trave 1"
ItemCooldown.importantItems["item_travel_boots_2"] = "travel_boots_2" -- "Boots of Trave 2"
ItemCooldown.importantItems["item_ethereal_blade"] = "ethereal_blade" -- "Ethereal Blade"
ItemCooldown.importantItems["item_cyclone"] = "cyclone" -- "Eul's Scepter of Divinity"
ItemCooldown.importantItems["item_force_staff"] = "force_staff" -- "Force Staff"
ItemCooldown.importantItems["item_glimmer_cape"] = "glimmer_cape" -- "Glimmer Cape"
ItemCooldown.importantItems["item_guardian_greaves"] = "guardian_greaves" -- "Guardian Greaves"
ItemCooldown.importantItems["item_heavens_halberd"] = "heavens_halberd" -- "Heaven's Halberd"
ItemCooldown.importantItems["item_hurricane_pike"] = "hurricane_pike" -- "Hurricane Pike"
ItemCooldown.importantItems["item_sphere"] = "sphere" -- "Linken's Sphere"
ItemCooldown.importantItems["item_manta"] = "manta" -- "Manta Style"
ItemCooldown.importantItems["item_mekansm"] = "mekansm" -- "Mekansm"
ItemCooldown.importantItems["item_orchid"] = "orchid" -- "Orchid Malevolence"
ItemCooldown.importantItems["item_rapier"] = "rapier" -- "Divine Rapier"
ItemCooldown.importantItems["item_refresher"] = "refresher" -- "Refresher Orb"
ItemCooldown.importantItems["item_rod_of_atos"] = "rod_of_atos" -- "Rod of Atos"
ItemCooldown.importantItems["item_satanic"] = "satanic" -- "Satanic"
ItemCooldown.importantItems["item_sheepstick"] = "sheepstick" -- "Scythe of Vyse"
ItemCooldown.importantItems["item_invis_sword"] = "invis_sword" -- "Shadow Blade"
ItemCooldown.importantItems["item_silver_edge"] = "silver_edge" -- "Silver Edge"
ItemCooldown.importantItems["item_soul_ring"] = "soul_ring" -- "soul_ring"
ItemCooldown.importantItems["item_phase_boots"] = "phase_boots" 
ItemCooldown.importantItems["item_solar_crest"] = "solar_crest" -- "solar_crest"
ItemCooldown.importantItems["item_medallion_of_courage"] = "medallion_of_courage" -- "medallion_of_courage"
ItemCooldown.importantItems["item_arcane_boots"] = "arcane_boots" -- "arcane_boots"
ItemCooldown.importantItems["item_hood_of_defiance"] = "hood_of_defiance" 
ItemCooldown.importantItems["item_veil_of_discord"] = "veil_of_discord" 
ItemCooldown.importantItems["item_armlet"] = "armlet" 
ItemCooldown.importantItems["item_bloodthorn"] = "bloodthorn" 
ItemCooldown.importantItems["item_necronomicon"] = "necronomicon" 
ItemCooldown.importantItems["item_necronomicon_2"] = "necronomicon_2" 
ItemCooldown.importantItems["item_necronomicon_3"] = "necronomicon_3" 
ItemCooldown.importantItems["item_pipe"] = "pipe" 
ItemCooldown.importantItems["item_butterfly"] = "butterfly" 
ItemCooldown.importantItems["item_mask_of_madness"] = "mask_of_madness" 
ItemCooldown.importantItems["item_crimson_guard"] = "crimson_guard" 
ItemCooldown.importantItems["item_lotus_orb"] = "lotus_orb" 
ItemCooldown.importantItems["item_shivas_guard"] = "shivas_guard" 
ItemCooldown.importantItems["item_mjollnir"] = "mjollnir" 
ItemCooldown.importantItems["item_ward_observer"] = "ward_observer" 
ItemCooldown.importantItems["item_ward_dispenser"] = "ward_dispenser" 
ItemCooldown.importantItems["item_ward_sentry"] = "ward_sentry" 	
ItemCooldown.importantItems["item_ward_dispenser_sentry"] = "ward_dispenser_sentry" 
ItemCooldown.importantItems["item_magic_stick"] = "magic_stick" 
ItemCooldown.importantItems["item_magic_wand"] = "magic_wand" 








function ItemCooldown.OnDraw()
	if not Menu.IsEnabled(ItemCooldown.optionEnable) then return end

	local myHero = Heroes.GetLocal()
	if not myHero then return end

	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		if not Entity.IsSameTeam(myHero, hero) and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) and Entity.IsAlive(hero) then
			ItemCooldown.DrawDisplay(hero)
		end
	end

end



function ItemCooldown.InitDisplay()
    ItemCooldown.boxSize = Menu.GetValue(ItemCooldown.boxSizeOption)
    ItemCooldown.innerBoxSize = ItemCooldown.boxSize - 2
    
 
end


function ItemCooldown.OnMenuOptionChange(option, old, new)
    if option == ItemCooldown.boxSizeOption then
        ItemCooldown.InitDisplay()
    end
end










function ItemCooldown.DrawDisplay(hero)
ItemCooldown.InitDisplay()
	local slotNum = 9
	-- draw para
	
	local pos = NPC.GetAbsOrigin(hero)
	local x, y, visible = Renderer.WorldToScreen(pos)
	local gapX = Menu.GetValue(ItemCooldown.gapx)
	local gapY = Menu.GetValue(ItemCooldown.gapy)
	y = y - 6 * gapY
	for i = 0, slotNum-1 do

		local item = NPC.GetItemByIndex(hero, i)
		
		if item then
			local itemName = Ability.GetName(item)
	
			if ItemCooldown.importantItems[itemName] then
				local itemCd = math.ceil(Ability.GetCooldown(item))

				-- draw
				local shortItemName = ItemCooldown.importantItems[itemName]

    local imageHandle = ItemCooldown.cachedIcons[itemName]
				
				    if imageHandle == nil then
        imageHandle = Renderer.LoadImage(ItemCooldown.spellIconPath .. shortItemName .. ".png")
        ItemCooldown.cachedIcons[itemName] = imageHandle
    end
	
	    local imageColor = { 255, 255, 255 }
    local outlineColor = { 0, 255 , 0 }
	
	
	

    local castable = Ability.IsCastable(item, NPC.GetMana(hero), true)

    -- default colors = can cast
    local imageColor = { 255, 255, 255 }
    local outlineColor = { 0, 255 , 0 }

    if not castable then

        if Ability.GetManaCost(item) > NPC.GetMana(hero) then
            imageColor = { 150, 150, 255 }
            outlineColor = { 0, 0, 255 }
        else
            imageColor = { 255, 150, 150 }
            outlineColor = { 255, 0, 0 }
        end
    end

    Renderer.SetDrawColor(imageColor[1], imageColor[2], imageColor[3], 255)
    Renderer.DrawImage(imageHandle, x+gapX, y, ItemCooldown.boxSize, ItemCooldown.boxSize)

    Renderer.SetDrawColor(outlineColor[1], outlineColor[2], outlineColor[3], 255)
    Renderer.DrawOutlineRect(x+gapX, y, ItemCooldown.boxSize, ItemCooldown.boxSize)

    local cdLength = Ability.GetCooldownLength(item)

    if not Ability.IsReady(item) and cdLength > 0.0 then
        local cooldownRatio = Ability.GetCooldown(item) / cdLength
        local cooldownSize = math.floor(ItemCooldown.innerBoxSize * cooldownRatio)

        Renderer.SetDrawColor(255, 255, 255, 50)
        Renderer.DrawFilledRect(x+gapX + 1, y + (ItemCooldown.innerBoxSize - cooldownSize) + 1, ItemCooldown.innerBoxSize, cooldownSize)

        Renderer.SetDrawColor(255, 255, 255)
        Renderer.DrawText(ItemCooldown.font, x+gapX + 1, y, math.floor(Ability.GetCooldown(item)), 1)
    end


	
	
	
	
	
	
	
	
	

				

				y = y + gapY

			end
	
		end
	
	end -- end of big for loop

end

return ItemCooldown