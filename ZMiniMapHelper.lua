local MiniMapKostya12rus = {}
-- MiniMapKostya12rus.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)
-- MiniMapKostya12rus.key = Menu.AddKeyOption({"Kostya12rus","test minimap"},"Key for ...",Enum.ButtonCode.BUTTON_CODE_NONE)


-- function MiniMapKostya12rus.OnDraw()
	-- local XSize,ZSize = Renderer.GetScreenSize()
	-- local XglobalPos,YglobalPos = 16176, 16254
								-- --8201 + 8175 , 8177 + 8177
	
	-- size = math.floor(ZSize/100*26)
	-- Renderer.DrawOutlineRect(0,ZSize-size,size,size)
	-- myhero = Heroes.GetLocal()
	-- Xpos,Ypos = MiniMapKostya12rus.NeedXY(myhero)
	-- local xprochent = Xpos/(XglobalPos/100)
	-- local yprochent = 100-Ypos/(YglobalPos/100)
	-- Renderer.DrawTextCenteredX(MiniMapKostya12rus.Font, 500, 500, xprochent .. " - x | " .. yprochent .. " - y", 1)
	-- Renderer.DrawTextCenteredX(MiniMapKostya12rus.Font, 500, 522, tostring(Input.GetWorldCursorPos()), 1)
	-- Renderer.DrawTextCenteredX(MiniMapKostya12rus.Font, 500, 544, tostring(Entity.GetAbsOrigin(Heroes.GetLocal())), 1)
	-- local XMinimapPos = math.floor(size/100*xprochent)
	-- local YMinimapPos = math.floor(size/100*yprochent+(ZSize-size))
	-- Renderer.SetDrawColor(255, 0, 0, 255)
	-- Renderer.DrawPixel(XMinimapPos,YMinimapPos)
	-- Renderer.DrawTextCentered(MiniMapKostya12rus.Font, XMinimapPos, YMinimapPos, "X", 1)
	-- if Menu.IsKeyDownOnce(MiniMapKostya12rus.key) then
		-- NPC.MoveTo(Heroes.GetLocal(),Vector(0,0,0))
	-- end
-- end


-- function MiniMapKostya12rus.MiniMapPos(nps)
	
-- end
-- function MiniMapKostya12rus.NeedXY(nps)
	-- local MinimapBot = 8125 -- -7550
	-- local MinimapLeft = 8127 -- -8200
	-- return math.floor(Entity.GetAbsOrigin(nps):GetX()+MinimapLeft),math.floor(Entity.GetAbsOrigin(nps):GetY()+MinimapBot)
-- end


return MiniMapKostya12rus
