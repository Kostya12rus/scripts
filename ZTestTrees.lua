local Testkekeas = {}
Testkekeas.optionEnable = Menu.AddOption({"Kostya12rus","TreeTest"}, "Activate", "")
Testkekeas.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
function Testkekeas.OnDraw()
    local myHero = Heroes.GetLocal()
	if not myHero or not Menu.IsEnabled(Testkekeas.optionEnable) then return end
	local treeeiconca = Renderer.LoadImage("resource/flash3/images/broadcast/statpop_star.png")
	local TableTrees = {}
	local myPos = Entity.GetAbsOrigin(myHero)
	local CointTrees = 0
	
	
	for i = 1, Trees.Count() do
		local tree = Trees.Get(i)
		Renderer.DrawText(Testkekeas.font, 500, 100,"Деревья найдены " ..Trees.Count(), 1)
		if Tree.IsActive(tree) then
			local TreesPos = Entity.GetAbsOrigin(tree)
			local Xtree = TreesPos:GetX()
			local Ytree = TreesPos:GetY()
			if TreesPos:Distance(myPos) >= 500 then
				coint += 1
				Renderer.DrawText(Testkekeas.font, 500, 100,"Деревья рядом " ..coint, 1)
			end
		end
	end
	
end

-- function Testkekeas.FindTree()
	-- for i = 1, Trees.Count() do
		-- local tree = Trees.Get(i)
		-- Renderer.DrawText(Testkekeas.font, 500, 100,"Деревья найдены" ..Trees.Count(), 1)
		-- if Tree.IsActive(tree) then
			-- local pos = Entity.GetAbsOrigin(tree)
			-- local Xtree = pos:GetX()
			-- local Ytree = pos:GetY()
			-- table.insert(TableTrees,i,Xtree)
			-- table.insert(TableTrees,i,Ytree)
		-- end
		-- if i == Trees.Count() then
			-- return
		-- end
	-- end
-- end

-- function Testkekeas.DrawTree(Xtree, Ytree)
	-- Renderer.SetDrawColor(255, 255, 255, 255)
	-- Renderer.DrawImage(treeeiconca, Xtree, Ytree, 16, 16)
-- end
return Testkekeas