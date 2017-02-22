local itemFailSwitch = {}

itemFailSwitch.option = Menu.AddOption({ "Utility", "Regen Fail Switch" }, "Regen Fail Switch", "Will not let you use some regen items if your target is already affected by it.")

-- array of fail switch item tables. each table has item, modifier and lastCast.
itemFailSwitch.failSwitchItems = {}

function itemFailSwitch.InsertFailSwitchItem(itemName, modifierName)
    table.insert(itemFailSwitch.failSwitchItems, { item = itemName, modifier = modifierName, lastCast = 0 } )
end

itemFailSwitch.InsertFailSwitchItem("item_bottle", { "modifier_bottle_regeneration" })
itemFailSwitch.InsertFailSwitchItem("item_clarity", { "modifier_clarity_potion" })
itemFailSwitch.InsertFailSwitchItem("item_flask", { "modifier_flask_healing" } )
itemFailSwitch.InsertFailSwitchItem("item_urn_of_shadows", { "modifier_item_urn_heal", "modifier_item_urn_damage" })

function itemFailSwitch.GetFailSwitchItem(item)
    local itemName = Ability.GetName(item)

    for i, v in ipairs(itemFailSwitch.failSwitchItems) do
        if v.item == itemName then return v end
    end

    return nil
end

function itemFailSwitch.ProcessModifier(item, target, failSwitchItem)
    -- latency corrected item activation time.
    local actualActivationTime = GameRules.GetGameTime() + Ability.GetCastPoint(item) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)

    for i, modifierName in ipairs(failSwitchItem.modifier) do
        local modifier = NPC.GetModifier(target, modifierName)

        if modifier ~= nil and actualActivationTime < Modifier.GetDieTime(modifier) then
            return false 
        end 
    end

    return true
end

function itemFailSwitch.ProcessCastNoTarget(orders, failSwitchItem)
    local target = orders.npc

    if not target then 
        target = Entity.GetOwner(orders.ability)
    end

    -- hmmm
    if not target then return true end
    if not Entity.IsNPC(target) then return true end

    return itemFailSwitch.ProcessModifier(orders.ability, target, failSwitchItem)
end

function itemFailSwitch.ProcessCastTarget(orders, failSwitchItem)
    if not orders.target then return true end
    if not Entity.IsNPC(orders.target) then return true end

    return itemFailSwitch.ProcessModifier(orders.ability, orders.target, failSwitchItem)
end

-- callbacks.
function itemFailSwitch.OnPrepareUnitOrders(orders)
    if not Menu.IsEnabled(itemFailSwitch.option) then return true end

    if not orders.ability then return true end
    if not Entity.IsAbility(orders.ability) then return true end

    local failSwitchItem = itemFailSwitch.GetFailSwitchItem(orders.ability)

    if failSwitchItem == nil then return true end

    local curTime = GameRules.GetGameTime()
    local totalLatency = (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) * 2
    local castPoint = Ability.GetCastPoint(orders.ability)

    -- so we don't accidentally spam the item twice due to latency.
    if curTime < failSwitchItem.lastCast + castPoint + totalLatency then
        return false
    end

    local retValue = true
    
    if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET then 
        retValue = itemFailSwitch.ProcessCastNoTarget(orders, failSwitchItem) 
    elseif orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET then 
        retValue = itemFailSwitch.ProcessCastTarget(orders, failSwitchItem) 
    end

    -- store our first successful cast of this item here.
    if retValue then
        failSwitchItem.lastCast = curTime
    end

    return retValue
end

-- since this function can be called at the main menu, we will clear the cast times key table if the hero does not exist.
-- the reason for this is because an old time, say 500 seconds could be kept in the cast times table. when entering a new game, the current time will be less than that, and we wouldn't be able to cast anything.
function itemFailSwitch.OnDraw()
    if Heroes.GetLocal() ~= nil then return end

    for k, v in pairs(itemFailSwitch.failSwitchItems) do
        itemFailSwitch.failSwitchItems[k].lastCast = 0
    end
end

return itemFailSwitch