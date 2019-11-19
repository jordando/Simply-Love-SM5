local player = ...
local game = GAMESTATE:GetCurrentGame():GetName()

local af = Def.ActorFrame{
	Name="Pane2",
	-- ExpandForDoubleCommand() does not do anything here, but we check for its presence in
	-- this ActorFrame in ./InputHandler to determine which panes to expand the background for
	ExpandForDoubleCommand=function() end,
	InitCommand=function(self)
		local style = ToEnumShortString(GAMESTATE:GetCurrentStyle():GetStyleType())
		if style == "OnePlayerTwoSides" then
			if IsUsingWideScreen() then
				self:x( -107 )
			else
				self:x( -_screen.w/6 )
			end
		end

		self:visible(false)
	end
}

af[#af+1] = LoadActor("./Percentage.lua", player)
af[#af+1] = LoadActor("./JudgmentLabels.lua", player)
af[#af+1] = LoadActor("./Arrows.lua", player)

return af