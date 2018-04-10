local ItemCouer = {}
ItemCouer.optionEnable = Menu.AddOption({"Kostya12rus","Item Couier"}, "On/Off Script", "")
ItemCouer.iconsize = Menu.AddOption({"Kostya12rus","Item Couier"}, "Img Size", "", 8, 128, 8)
ItemCouer.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

function ItemCouer.OnDraw()
    local myHero = Heroes.GetLocal()
	if not myHero or not Menu.IsEnabled(ItemCouer.optionEnable) then return end
	local size_x, size_y = Renderer.GetScreenSize()
	local imgsize = Menu.GetValue(ItemCouer.iconsize)
	local cordpos = {{0,0};{math.floor(size_x*0.3),imgsize+1};{math.floor(size_x*0.7-(imgsize+1)),imgsize+1}}
	for i = 1, NPCs.Count() do
		local unitNA = NPCs.Get(i)
		if Entity.IsHero(unitNA) and not NPC.IsIllusion(unitNA) then
			local tempHeroName = NPC.GetUnitName(unitNA):gsub("npc_dota_hero_", "")
			local imageHandle = imgtable[Hero.GetPlayerID(unitNA)]
			if imageHandle == nil then
				imageHandle = Renderer.LoadImage("resource/flash3/images/heroes/" .. tempHeroName .. ".png")
				imgtable[Hero.GetPlayerID(unitNA)] = imageHandle
			end
		end
		if NPC.IsCourier(unitNA) then
			local CordX = cordpos[Entity.GetTeamNum(unitNA)][1]
			local CordY = cordpos[Entity.GetTeamNum(unitNA)][2]
			for index_item = 0, 15 do
				local item = NPC.GetItemByIndex(unitNA, index_item)
				if item and Entity.IsAbility(item) then
					local itemName = Ability.GetName(item)
					if itemName:find("item_recipe_") then
						tempName = "recipe"
					else
						tempName = itemName:gsub("item_", "")
					end
					imageHandle = imgtable[tempName]
					if imageHandle == nil then
						imageHandle = Renderer.LoadImage("resource/flash3/images/items/" ..tempName..".png")
						imgtable[tempName] = imageHandle
					end
					Renderer.SetDrawColor(255,255,255,255)
					imgsizeX = imgsize
					imgsizeY = imgsize*0.75
					Renderer.DrawImage(imageHandle, CordX, CordY, imgsizeX, imgsizeY)
					if imgtable[Item.GetPlayerOwnerID(item)] then
						Renderer.DrawImage(imgtable[Item.GetPlayerOwnerID(item)], CordX, cordpos[Entity.GetTeamNum(unitNA)][2]-(imgsize*0.75+1), imgsizeX, imgsizeY)
					end
					if Input.IsCursorInRect(CordX,CordY,imgsizeX,imgsizeY) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PING_ABILITY, 0, Vector(), item, 0, nil)
					end
					if Entity.GetTeamNum(unitNA) == 3 then
						CordX = CordX + (imgsize+1)
					elseif Entity.GetTeamNum(unitNA) == 2 then
						CordX = CordX - (imgsize+1)
					end
					
				end
			end
		end
	end	
end

function ItemCouer.init()
	imgtable = {}
	richept = false
end
function ItemCouer.OnGameStart()
	ItemCouer.init()
end
function ItemCouer.OnGameEnd()
	ItemCouer.init()
end
function ItemCouer.OnScriptLoad()
	ItemCouer.init()
end
function ItemCouer.OnScriptUnload()
	ItemCouer.init()
end
return ItemCouer