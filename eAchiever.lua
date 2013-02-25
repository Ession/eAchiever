-- =============================================================================
-- 
--       Filename:  eAchiever.lua
-- 
--    Description:  Takes a screenshot when you earn a achievement.
-- 
--        Version:  5.2.1
-- 
--         Author:  Mathias Jost (mail@mathiasjost.com)
-- 
-- =============================================================================


-- -----------------------------------------------------------------------------
-- Create the main frame and other variables for the addon
-- -----------------------------------------------------------------------------
local eAchiever = CreateFrame("Frame")
local timer     = 0
local threshold = 1.2

-- -----------------------------------------------------------------------------
-- Registers the events
-- -----------------------------------------------------------------------------
eAchiever:RegisterEvent("ACHIEVEMENT_EARNED")


-- -----------------------------------------------------------------------------
-- Eventhandler
-- -----------------------------------------------------------------------------
eAchiever:SetScript("OnEvent", function()
	
	-- Set OnUpdate for timer on earning an achievement
	eAchiever:SetScript("OnUpdate", function(self, elapsed)
	
		-- add the time since the last update occured to the timer
		timer = timer + elapsed
		
		-- if the timer reached it's threshold take a screenshot, 
		-- reset timer and unregister the OnUpdate function
		if timer >= threshold then
			Screenshot()
			timer = 0
			eAchiever:SetScript("OnUpdate", nil)
		end
		
	end)
	
end) -- eAchiever:SetScript("OnEvent", function()
