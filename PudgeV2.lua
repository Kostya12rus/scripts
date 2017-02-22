local Pudge = {}
Pudge.option = Menu.AddOption({ "Hero Specific", "Pudge" }, " 1. Turn Me On", "")
Pudge.Deny = Menu.AddOption({ "Hero Specific", "Pudge" }, " 2. Pudge Auto Suicide", "Trying to get you a Suicide")
Pudge.thresholdofrot = Menu.AddOption({ "Hero Specific", "Pudge" }, "4. Hp count threshhold", "", 2, 10, 2)
Pudge.SRDeny = Menu.AddOption({"Hero Specific", "Pudge"}, "3. SoulRing Deny", "Try to deny after using SR")
Pudge.SRthresholdofrot = Menu.AddOption({ "Hero Specific", "Pudge" }, "5.Soul Ring Hp Count Threshhold", "", 6, 48, 2)

function Pudge.OnUpdate()

local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_pudge" then return end
local rotAbility = NPC.GetAbilityByIndex(myHero, 1)
    if not Ability.IsCastable(rotAbility, NPC.GetMana(myHero)) then end
    if Menu.IsEnabled(Pudge.Deny) then
     Pudge.EnableRot(myHero, rotAbility, Menu.GetValue(Pudge.thresholdofrot))
   end
local soulAbility = NPC.GetItem(myHero, "item_soul_ring", true)
    if Menu.IsEnabled(Pudge.SRDeny) then
      Pudge.SoulDeny(myHero, soul, Menu.GetValue(Pudge.SRthresholdofrot))
 end
end

function Pudge.SoulDeny(myHero, soulAbility, SRthresholdofrot)
 local soul = NPC.GetItem(myHero, "item_soul_ring", true)
 local min1 = 999
 local myHero = (1)
 local pfg = Heroes.Get(myHero)
 local  dil1 = math.floor(Entity.GetHealth(pfg) / Entity.GetMaxHealth(pfg) * 100)
 if not soul then return end
   if Entity.GetHealth(pfg) > 0 and Entity.GetHealth(pfg) < min1 and dil1 <= SRthresholdofrot then
     min1 = Entity.GetHealth(pfg)
   end
  if (min1 < 999) then
    Ability.CastNoTarget(soul)
  end
end

function Pudge.EnableRot(myHero, rotAbility, thresholdofrot)

local  min = 999

local  pdg = myHero
  local  dil = math.floor(Entity.GetHealth(pdg) / Entity.GetMaxHealth(pdg) * 100)
      if Entity.GetHealth(pdg) > 0 and Entity.GetHealth(pdg) < min and dil <= thresholdofrot then
       min = Entity.GetHealth(pdg)
     end

   if(min < 999) then
     Ability.Toggle(rotAbility)
   end
end



return Pudge
