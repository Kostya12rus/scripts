local Testkekeas = {}
Testkekeas.optionEnable = Menu.AddOption({"Kostya12rus","AllNpcs"}, "Activate", "")
Testkekeas.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
Testkekeas.fontNps = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
function Testkekeas.OnDraw()
    local myHero = Heroes.GetLocal()
	if not myHero or not Menu.IsEnabled(Testkekeas.optionEnable) then return end
	local TableTrees = {}
	local myPos = Entity.GetAbsOrigin(myHero)
	local CointTrees = 0
	local Cointcreep = 0
	local MaxCointTrees = 0
	local MaxCointcreep = 0
	Renderer.DrawText(Testkekeas.font, 500, 100,"NPCs найдены " ..NPCs.Count(), 1)
	
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if Entity.IsAlive(unitNA) then
			local UnitPos = Entity.GetAbsOrigin(unitNA)
			local vector = myPos - UnitPos
			local distance = vector:Length2D()
			local x1, y1 , worldVis= Renderer.WorldToScreen(UnitPos)
			
			if worldVis then	
				CointTrees = CointTrees + 1
				Testkekeas.DrawCircle(UnitPos, 100, i)
				if NPC.GetUnitName(unitNA) then
					Renderer.DrawText(Testkekeas.fontNps, x1-100, y1, NPC.GetUnitName(unitNA), 1)
				end
			end
			
			-- if NPC.IsCreep(unitNA) then
				-- Cointcreep = Cointcreep + 1
			-- end

			-- if i == NPCs.Count() then
				-- local MaxCointTrees = CointTrees
				-- local MaxCointcreep = Cointcreep
				-- Renderer.DrawText(Testkekeas.font, 500, 150,"NPC рядом " ..CointTrees, 1)
				-- Renderer.DrawText(Testkekeas.font, 500, 200,"Крипы рядом " ..Cointcreep, 1)
				-- Renderer.DrawText(Testkekeas.font, 500, 250,"Nick " ..Player.GetName(Players.GetLocal()), 1)
			-- end
		end
	end	
	
end

local size_x, size_y = Renderer.GetScreenSize()

function Testkekeas.DrawCircle(UnitPos, radius, index)
    local x1, y1 = Renderer.WorldToScreen(UnitPos)
    if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
        local x4, y4, x3, y3, visible3
        local dergee = 90
        for angle = 0, 360 / dergee do
            x4 = 0 * math.cos(angle * dergee / 57.3) - radius * math.sin(angle * dergee / 57.3)
            y4 = radius * math.cos(angle * dergee / 57.3) + 0 * math.sin(angle * dergee / 57.3)
            x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
            Renderer.DrawLine(x1,y1,x3,y3)
            x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
        end
    end
end	


	-- for i = 1, Trees.Count() do     -- Нахождение деревьев
		-- local tree = Trees.Get(i)
		-- if Tree.IsActive(tree) then
			-- local TreesPos = Entity.GetAbsOrigin(tree)
			-- local vector = myPos - TreesPos
			-- local distance = vector:Length2D()
			
			-- if distance <= 3000 then
				-- Testkekeas.DrawCircle(TreesPos, 10, i)
			-- end
		-- end
	-- end
	
return Testkekeas