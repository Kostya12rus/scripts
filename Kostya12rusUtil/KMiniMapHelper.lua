local MiniMapKostya12rus = {}
MiniMapKostya12rus.Font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)


function MiniMapKostya12rus.OnDraw()
	Renderer.DrawTextCenteredX(MiniMapKostya12rus.Font, 500, 500, Camera.GetOrigin(), 1)
end
function MiniMapKostya12rus.MiniMapPos(nps)
	
end

return MiniMapKostya12rus
