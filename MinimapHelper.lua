local MinimapHelper = {}

function MinimapHelper:WorldToMiniMap(pos, screenWidth, screenHeight)
	local screenH = screenHeight
	local screenW = screenWidth 
	local MapLeft = -8000
	local MapTop = 7350
	local MapRight = 7500
	local MapBottom = -7200
	local mapWidth = math.abs(MapLeft - MapRight)
	local mapHeight = math.abs(MapBottom - MapTop)
	

	local x = pos:GetX() - MapLeft
	local y = pos:GetY() - MapBottom

	local dx, dy, px, py
	if self.Round(screenW / screenH, 1) >= 1.7 then

		dx = 272 / 1920 * screenW
		dy = 261 / 1080 * screenH
		px = 11 / 1920 * screenW
		py = 11 / 1080 * screenH
	elseif self.Round(screenW / screenH, 1) >= 1.5 then

		dx = 267 / 1680 * screenW
		dy = 252 / 1050 * screenH
		px = 10 / 1680 * screenW
		py = 11 / 1050 * screenH
	else
		dx = 255 / 1280 * screenW
		dy = 229 / 1024 * screenH
		px = 6 / 1280 * screenW
		py = 9 / 1024 * screenH
	end
	local minimapMapScaleX = dx / mapWidth
	local minimapMapScaleY = dy / mapHeight

	local scaledX = math.min(math.max(x * minimapMapScaleX, 0), dx)
	local scaledY = math.min(math.max(y * minimapMapScaleY, 0), dy)

	local screenX = px + scaledX
	local screenY = screenH - scaledY - py

	return Vector(math.floor(screenX - 20), math.floor(screenY - 12), 0)
end

function MinimapHelper.Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

return MinimapHelper