local TestDraw = {}
TestDraw.optionEnable = Menu.AddOption({"Kostya12rus","TestDraw"}, "Activate", "")
TestDraw.optionKey = Menu.AddKeyOption({"Kostya12rus","TestDraw"},"Key for TestDraw",Enum.ButtonCode.KEY_D)
TestDraw.fontNps = Renderer.LoadFont("Tahoma", 12, Enum.FontWeight.EXTRABOLD)

local partikle = nil
function TestDraw.OnDraw()
	if not Menu.IsEnabled(TestDraw.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	if not myHero then return end  
	local mypos = Entity.GetAbsOrigin(myHero)
	x1,y1 = Renderer.WorldToMinimap(mypos)
	Renderer.DrawText(Frostif.fontNps, x1, y1, "X", 1)
	
	if Menu.IsKeyDown(TestDraw.optionKey) and not partikle then
		particle = Particle.Create("particles\\ui_mouseactions\\drag_selected_ring.vpcf")
		Particle.SetControlPoint(particle, 1, Vector(255, 80, 80))
		Particle.SetControlPoint(particle, 3, Vector(9, 0, 0))
		Particle.SetControlPoint(particle, 0, Input.GetWorldCursorPos())
		partikle = particle
	elseif Menu.IsKeyDown(TestDraw.optionKey) and partikle then
		Particle.SetControlPoint(particle, 0, Input.GetWorldCursorPos())
		for k = 100,1000,100 do
			Particle.SetControlPoint(particle, 2, Vector(k, 255, 0))
		end
	elseif not Menu.IsKeyDown(TestDraw.optionKey) and partikle then
		Particle.Destroy(partikle)
		partikle = nil
	end
end

return TestDraw