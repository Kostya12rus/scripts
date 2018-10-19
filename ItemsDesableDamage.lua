local DisableDamageItem = {}
DisableDamageItem.TrigerActiv = Menu.AddOption({"Utility", "DisableDamageItem"}, "Disable Damage items", "")

function DisableDamageItem.OnUpdate()
    if not Menu.IsEnabled(DisableDamageItem.TrigerActiv) then return end
        if Heroes.GetLocal() and Engine.IsInGame() then
        DisableDamageItem.TrigerActivation = false
        local mod = NPC.GetModifier(Heroes.GetLocal(), "modifier_axe_berserkers_call")
        if mod then
            local owner = Modifier.GetCaster(mod)
            if owner and NPCs.Contains(owner) and NPC.HasModifier(owner, "modifier_item_blade_mail_reflect") then
                DisableDamageItem.TrigerActivation = true
            end
        end
        local mod = NPC.GetModifier(Heroes.GetLocal(), "modifier_legion_commander_duel")
        if mod then
            local owner = Modifier.GetCaster(mod)
            if owner and NPCs.Contains(owner) and NPC.HasModifier(owner, "modifier_item_blade_mail_reflect") then
                DisableDamageItem.TrigerActivation = true
            end
        end
        local mod = NPC.GetModifier(Heroes.GetLocal(), "modifier_winter_wyvern_winters_curse")
        if mod then
            DisableDamageItem.TrigerActivation = true
        end

        if not DisableDamageItem.TrigerActivation then
            DisableDamageItem.triger = 0 
            DisableDamageItem.timer = 0
        end
        if DisableDamageItem.TrigerActivation and DisableDamageItem.timer < GameRules.GetGameTime() and DisableDamageItem.triger == 0 then
            for i = 0, 2 do
                local item = NPC.GetItemByIndex(Heroes.GetLocal(), i)
                if item and Abilities.Contains(item) and Ability.IsItem(item) and DisableDamageItem.CheckItem(item) then
                    DisableDamageItem.ItemStashAbuse(item, 6 + i)
                end
            end
            DisableDamageItem.triger = 1
            DisableDamageItem.timer = GameRules.GetGameTime() + 0.2 + NetChannel.GetAvgLatency(Enum.Flow.MAX_FLOWS)
        end
        if DisableDamageItem.triger == 1 and DisableDamageItem.timer < GameRules.GetGameTime() then
            for i = 6, 9 do
                local item = NPC.GetItemByIndex(Heroes.GetLocal(), i)
                if item and Abilities.Contains(item) and Ability.IsItem(item) and DisableDamageItem.CheckItem(item) then
                    DisableDamageItem.ItemStashAbuse(item, (-6 + i))
                end
            end
            DisableDamageItem.triger = 2
            DisableDamageItem.timer = GameRules.GetGameTime() + 0.2 + NetChannel.GetAvgLatency(Enum.Flow.MAX_FLOWS)
        end
        if DisableDamageItem.triger == 2 and DisableDamageItem.timer < GameRules.GetGameTime() then
            for i = 3, 6 do
                local item = NPC.GetItemByIndex(Heroes.GetLocal(), i)
                if item and Abilities.Contains(item) and Ability.IsItem(item) and DisableDamageItem.CheckItem(item) then
                    DisableDamageItem.ItemStashAbuse(item, 6 + (-3 + i))
                end
            end
            DisableDamageItem.triger = 3
            DisableDamageItem.timer = GameRules.GetGameTime() + 0.2 + NetChannel.GetAvgLatency(Enum.Flow.MAX_FLOWS)
        end
        if DisableDamageItem.triger == 3 and DisableDamageItem.timer < GameRules.GetGameTime() then
            for i = 6, 9 do
                local item = NPC.GetItemByIndex(Heroes.GetLocal(), i)
                if item and Abilities.Contains(item) and Ability.IsItem(item) and DisableDamageItem.CheckItem(item) then
                    DisableDamageItem.ItemStashAbuse(item, 3 + (-6 + i))
                end
            end
            DisableDamageItem.triger = 4
            DisableDamageItem.timer = GameRules.GetGameTime() + 0.2 + NetChannel.GetAvgLatency(Enum.Flow.MAX_FLOWS)
        end
    end
end

function DisableDamageItem.CheckItem(item)
    if item then
        for _,name in pairs(DisableDamageItem.ItemsForSwap) do
            if Ability.GetName(item) == name then
                return true
            end
        end
    end
    return false
end

function DisableDamageItem.ItemStashAbuse(item,slot)
    Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_ITEM, slot, Vector(0, 0, 0), item, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,Heroes.GetLocal())
end

function DisableDamageItem.init()
    DisableDamageItem.TrigerActivation = false
    DisableDamageItem.triger = 0 
    DisableDamageItem.timer = 0
    DisableDamageItem.ItemsForSwap = 
    {
         "item_butterfly"
        ,"item_greater_crit"
        ,"item_monkey_king_bar"
        ,"item_radiance"
        ,"item_basher"
        ,"item_bfury"
        ,"item_lesser_crit"
        ,"item_faerie_fire"
        ,"item_branches"
        ,"item_blade_of_alacrity"
        ,"item_boots_of_elves"
        ,"item_blight_stone"
        ,"item_blades_of_attack"
        ,"item_quarterstaff"
        ,"item_broadsword"
        ,"item_claymore"
        ,"item_javelin"
        ,"item_mithril_hammer"
        ,"item_gloves"
        ,"item_wraith_band"
        ,"item_phase_boots"
        ,"item_power_treads"
        ,"item_oblivion_staff"
        ,"item_moon_shard"
        ,"item_ring_of_basilius"
        ,"item_ring_of_aquila"
        ,"item_vladmir"
        ,"item_nullifier"
        ,"item_bloodthorn"
        ,"item_ethereal_blade"
    }
end

function DisableDamageItem.OnGameStart()
    DisableDamageItem.init()
end

function DisableDamageItem.OnGameEnd()
    DisableDamageItem.init()
end
DisableDamageItem.init()

return DisableDamageItem