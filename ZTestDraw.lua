local TestDraw = {}
TestDraw.optionEnable = Menu.AddOption({"Kostya12rus","TestDraw"}, "Activate", "")
TestDraw.optionKey = Menu.AddKeyOption({"Kostya12rus","TestDraw"},"Key for TestDraw",Enum.ButtonCode.KEY_D)
TestDraw.fontNps = Renderer.LoadFont("Tahoma", 12, Enum.FontWeight.EXTRABOLD)

function TestDraw.OnDraw()
	if not Menu.IsEnabled(TestDraw.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	local mypos = Entity.GetAbsOrigin(myHero)
	
	--ckalpos = mypos:Scale(100)
	Renderer.DrawText(TestDraw.fontNps, 1000, 500, tostring(mypos), 1)
	Renderer.DrawText(TestDraw.fontNps, 1000, 520, tostring(Entity.GetAbsOrigin(myHero)), 1)
	--Renderer.DrawText(TestDraw.fontNps, 1000, 500, tostring(ckalpos), 1)
	TestDraw.DrawCircle(mypos, 200)
	
	--x1,y1 = Renderer.WorldToScreen(mypos)
	--x2,y2 = Renderer.WorldToScreen(ckalpos)
	--Renderer.DrawLine(x1,y1,x2,y2)
end

local size_x, size_y = Renderer.GetScreenSize()
function TestDraw.DrawCircle(UnitPos, radius)
    local x1, y1 = Renderer.WorldToScreen(UnitPos)
    if x1 < size_x and x1 > 0 and y1 < size_y and y1 > 0 then
        local x4, y4, x3, y3, visible3
        local dergee = 10
		local x = 1300
		local y = 200
        for angle = 1, 359 / dergee do
            x4 = 0 - radius * math.sin(angle * dergee / 57.3)
			Renderer.DrawText(TestDraw.fontNps, x, y, tostring(x4), 1)
			
            y4 = radius * math.cos(angle * dergee / 57.3)
			Renderer.DrawText(TestDraw.fontNps, x+300, y, tostring(y4), 1)
			y = y + 12
            x3,y3 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
            Renderer.DrawLine(x1,y1,x3,y3)
            x1,y1 = Renderer.WorldToScreen(UnitPos + Vector(x4,y4,0))
        end
    end
end
return TestDraw