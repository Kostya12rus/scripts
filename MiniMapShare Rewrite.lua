local MiniMapShare = {}
local KostyaUtils = require("KostyaUtils/Utils")
MiniMapShare.Font = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
MiniMapShare.HeroIcom = nil
MiniMapShare.optionEnable =                 Menu.AddOption({"Awareness", "MiniMapShare"}, "1. MiniMapShare", "")
MiniMapShare.DrawJungle =                   Menu.AddOption({"Awareness", "MiniMapShare"}, "2. Draw enemy jungle farm and roshan for allies", "")
MiniMapShare.DrawTP =                       Menu.AddOption({"Awareness", "MiniMapShare"}, "3. Draw enemy tp", "")
MiniMapShare.optionChatAlertEnable =        Menu.AddOption({"Awareness", "MiniMapShare"}, "4. Chat alert for enemy tp", "")
MiniMapShare.optionLanguage =               Menu.AddOption({"Awareness", "MiniMapShare"}, "5. Language for chat alert", "", 0, 2, 1)
MiniMapShare.MiniMapDrawDelay =             Menu.AddOption({"Awareness", "MiniMapShare"}, "6. Delay for drawing on minimap", "", 1 ,20 , 1)
MiniMapShare.SizeBoxInJangle =              Menu.AddOption({"Awareness", "MiniMapShare"}, "7. Size for squares on minimap", "", 100 ,500 , 50)
MiniMapShare.MiniMapJungleDrawDelay =       Menu.AddOption({"Awareness", "MiniMapShare"}, "8. Frequency of drawing on the minimap", "", 1, 7, 1)

for i=1,20,1 do
    Menu.SetValueName(MiniMapShare.MiniMapDrawDelay, i, i*0.01)
end

Menu.SetValueName(MiniMapShare.optionLanguage, 0, "English")
Menu.SetValueName(MiniMapShare.optionLanguage, 1, "Русский")
Menu.SetValueName(MiniMapShare.optionLanguage, 2, "Український")

MiniMapShare.JangleSpots = 
{
    {pos = Vector(-1873,-4250,256), timer = 0, triger = false},{pos = Vector(-227,-3346,384),timer = 0},{pos = Vector(423,-4653,384), timer = 0, triger = false},
    {pos = Vector(2944,-4531,256),  timer = 0, triger = false},{pos = Vector(4491,-4417,256),timer = 0},{pos = Vector(99,-1906,256),  timer = 0, triger = false},
    {pos = Vector(-4969,-337,384),  timer = 0, triger = false},{pos = Vector(-3682,884,384), timer = 0},{pos = Vector(-2581,-562,384),timer = 0, triger = false},
    {pos = Vector(1284,3327,384),   timer = 0, triger = false},{pos = Vector(-200,3376,384), timer = 0},{pos = Vector(-1808,4368,384),timer = 0, triger = false},
    {pos = Vector(-2523,4808,256),  timer = 0, triger = false},{pos = Vector(-4195,3453,256),timer = 0},{pos = Vector(-849,2305,384), timer = 0, triger = false},
    {pos = Vector(4398,824,384),    timer = 0, triger = false},{pos = Vector(2568,77,384),   timer = 0},{pos = Vector(4172,-376,384), timer = 0, triger = false},
    {pos = Vector(-2373,1852,159),  timer = 0, triger = false}
}
MiniMapShare.ParticleList = {}
MiniMapShare.MiniMapList = {}
MiniMapShare.MiniMapTiming = 0
MiniMapShare.MiniMapTriger = 0
local myHero

function MiniMapShare.OnUpdate()
    MiniMapShare.CanWork = false
    if not Menu.IsEnabled(MiniMapShare.optionEnable) or not Engine.IsInGame() or not Heroes.GetLocal() then return end
    MiniMapShare.time = GameRules.GetGameTime()
    for i,j in pairs(MiniMapShare.ParticleList) do
        if i and NPCs.Contains(i) then
            if not tostring(j.starttp):find("Vector") or not tostring(j.endtp):find("Vector") then 
                MiniMapShare.ParticleList[i] = {}
                MiniMapShare.ParticleList[i] = nil
            else
                local triger = 0
                while triger <= 2  do
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.starttp, endpos = j.endtp}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.endtp, endpos = MiniMapShare.PositionAngle(j.starttp, j.endtp,180+30, j.starttp:Distance(j.endtp):Length2D()*0.25)}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.endtp, endpos = MiniMapShare.PositionAngle(j.starttp, j.endtp,180-30, j.starttp:Distance(j.endtp):Length2D()*0.25)}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    triger = triger + 1
                end
                if Menu.IsEnabled(MiniMapShare.optionChatAlertEnable) then
                    if not Entity.IsSameTeam(myHero, i) then
                        local language = Menu.GetValue(MiniMapShare.optionLanguage)
                        if language == 0 then
                            Engine.ExecuteCommand("say_team "..KostyaUtils.GetRealNameHero(nil,i).." is teleporting")
                        elseif language == 1 then
                            Engine.ExecuteCommand("say_team "..KostyaUtils.GetRealNameHero(nil,i).." телепортируется")
                        else
                            Engine.ExecuteCommand("say_team "..KostyaUtils.GetRealNameHero(nil,i).." переміщується")	
                        end
                    end
                end
                MiniMapShare.ParticleList[i] = {}
                MiniMapShare.ParticleList[i] = nil
            end
        end
    end
    for i,j in pairs(MiniMapShare.JangleSpots) do
        if j.timer and j.timer < MiniMapShare.time and j.triger then
            MiniMapShare.JangleSpots[i].timer = 0
            MiniMapShare.JangleSpots[i].triger = false
        end
    end
    if MiniMapShare.MiniMapTiming < MiniMapShare.time then
        for i,j in pairs(MiniMapShare.MiniMapList) do
            if j.startpos and j.endpos then
                if MiniMapShare.MiniMapTiming < MiniMapShare.time then
                    MiniMap.DrawLine(j.startpos, j.endpos)
                    MiniMapShare.MiniMapList[i] = nil
                    MiniMapShare.MiniMapTiming = MiniMapShare.time + (Menu.GetValue(MiniMapShare.MiniMapDrawDelay) * 0.01)
                end
            end
        end
    end

    MiniMapShare.CanWork = true
end

function MiniMapShare.OnUnitAnimation(animation)
    if not MiniMapShare.CanWork or not Menu.IsEnabled(MiniMapShare.DrawJungle) or not Entity.IsDormant(animation.unit) then return end
    local minus = Menu.GetValue(MiniMapShare.SizeBoxInJangle) * -1
    local plus = Menu.GetValue(MiniMapShare.SizeBoxInJangle)
    if NPC.IsRoshan(animation.unit) then
        local rochpos = MiniMapShare.JangleSpots[19]
        if not rochpos.triger and rochpos.timer < MiniMapShare.time then
            local triger = 0
            while triger <= 2  do
                MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = rochpos.pos + Vector(minus, minus, 0), endpos = rochpos.pos + Vector(minus, plus , 0)}
                MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = rochpos.pos + Vector(minus, plus , 0), endpos = rochpos.pos + Vector(plus , plus , 0)}
                MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = rochpos.pos + Vector(plus , plus , 0), endpos = rochpos.pos + Vector(plus , minus, 0)}
                MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = rochpos.pos + Vector(plus , minus, 0), endpos = rochpos.pos - Vector(plus , plus , 0)}
                MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                triger = triger + 1
            end
            MiniMapShare.JangleSpots[19].timer = MiniMapShare.time + Menu.GetValue(MiniMapShare.MiniMapJungleDrawDelay)
            MiniMapShare.JangleSpots[19].triger = true
        end
    elseif NPC.IsNeutral(animation.unit) then
        for i,j in pairs(MiniMapShare.JangleSpots) do
            if not j.triger and j.timer < MiniMapShare.time and KostyaUtils.Distance2Objects(j.pos, animation.unit) <= 700 then
                local triger = 0
                while triger <= 2  do
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.pos + Vector(minus, minus, 0), endpos = j.pos + Vector(minus, plus , 0)}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.pos + Vector(minus, plus , 0), endpos = j.pos + Vector(plus , plus , 0)}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.pos + Vector(plus , plus , 0), endpos = j.pos + Vector(plus , minus, 0)}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    MiniMapShare.MiniMapList[MiniMapShare.MiniMapTriger] = {startpos = j.pos + Vector(plus , minus, 0), endpos = j.pos - Vector(plus , plus , 0)}
                    MiniMapShare.MiniMapTriger = MiniMapShare.MiniMapTriger + 1
                    triger = triger + 1
                end
                MiniMapShare.JangleSpots[i].timer = MiniMapShare.time + Menu.GetValue(MiniMapShare.MiniMapJungleDrawDelay)
                MiniMapShare.JangleSpots[i].triger = true
            end
        end 
    end
end

function MiniMapShare.PositionAngle(startpos,endpos,rotation,range)
	local angle = (endpos - startpos):ToAngle()
	local angleOffset = Angle(0, 45+rotation, 0)
	angle:SetYaw(angle:GetYaw() + angleOffset:GetYaw())
	local x,y,z = angle:GetVectors()
	local direction = x + y + z
	direction:SetZ(0)
	direction:Normalize()
	direction:Scale(range)
	local origin = endpos
	NeedPos = origin + direction
	return NeedPos
end

function MiniMapShare.OnParticleCreate(particle)
    if not MiniMapShare.CanWork or not Menu.IsEnabled(MiniMapShare.DrawTP) then return end
    if not particle.name:find("teleport_start") and not particle.name:find("teleport_end") then return end
    if particle.entityForModifiers and NPCs.Contains(particle.entityForModifiers) then
        if not MiniMapShare.ParticleList[particle.entityForModifiers] then
            MiniMapShare.ParticleList[particle.entityForModifiers] =
            {
                starttp = nil,
                endtp = nil
            }
        end
        if MiniMapShare.ParticleList[particle.entityForModifiers] then
            if Entity.IsSameTeam(myHero,particle.entityForModifiers) then return end
            if particle.name:find("teleport_start") then
                MiniMapShare.ParticleList[particle.entityForModifiers] =
                {
                    starttp = particle.index,
                    endtp = MiniMapShare.ParticleList[particle.entityForModifiers].endtp
                }
            elseif particle.name:find("teleport_end") then
                MiniMapShare.ParticleList[particle.entityForModifiers] =
                {
                    starttp = MiniMapShare.ParticleList[particle.entityForModifiers].starttp,
                    endtp = particle.index
                }
            end
        end
    end
end

function MiniMapShare.OnParticleUpdate(particle)
    if not MiniMapShare.CanWork then return end
    if MiniMapShare.ParticleList and particle.controlPoint == 0 then
        for i,j in pairs(MiniMapShare.ParticleList) do
            if i and NPCs.Contains(i) then
                if particle.index == j.starttp then
                    MiniMapShare.ParticleList[i].starttp = particle.position
                end
                if particle.index == j.endtp then
                    MiniMapShare.ParticleList[i].endtp = particle.position
                end
            end
        end
    end
end

function MiniMapShare.OnParticleUpdateEntity(particle)    
    if not MiniMapShare.CanWork then return end
    if MiniMapShare.ParticleList and particle.controlPoint == 0 then
        for i,j in pairs(MiniMapShare.ParticleList) do
            if i and NPCs.Contains(i) then
                if particle.index == j.starttp then
                    MiniMapShare.ParticleList[i].starttp = particle.position
                end
                if particle.index == j.endtp then
                    MiniMapShare.ParticleList[i].endtp = particle.position
                end
            end
        end
    end
end

function MiniMapShare.Init()
    MiniMapShare.ParticleList = {}
    MiniMapShare.MiniMapList = {}
    MiniMapShare.MiniMapTiming = 0
    MiniMapShare.MiniMapTriger = 0
    myHero = Heroes.GetLocal()
end
function MiniMapShare.OnGameStart()
	MiniMapShare.Init()
end
function MiniMapShare.OnGameEnd()
	MiniMapShare.Init()
end
MiniMapShare.Init()
return MiniMapShare
