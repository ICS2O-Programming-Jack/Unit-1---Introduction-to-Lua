-----------------------------------------------------------------------------------------
--Touch and Draging objects
--Jack Fiander
--ISC20
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-- variables for backround, girl and planet
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local girl = display.newImageRect("Images/girl5.png", 121, 121)
local girlWidth = girl.girlWidth
local girlHeight = girl.height

local planet = display.newImageRect("Images/planet.png", 120, 120)
local planetWidth = planet.width
local planetHeight = planet.height

local star = display.newImageRect("Images/star.png", 160, 160)
local starWidth = star.width
local starHeight = star.height
-- boolean variables
local alreadyTouchedGirl = false
local alreadyTouchedPlanet = false
local alreadyTouchedstar = false
--place the images 
planet.x = 300
planet.y = 100

star.x = 400
star.y = 300

girl.x = 100
girl.y = 125

--add the functions
local function GirlListner(touch)
	
 if (touch.phase == "began") then
	 if (alreadyTouchedPlanet == false) and (alreadyTouchedstar == false) then
	   alreadyTouchedGirl = true
	 end
 end


  if ( (touch.phase == "moved") and (alreadyTouchedGirl  == true) ) then
	 girl.x = touch.x
	 girl.y = touch.y
  end

    if (touch.phase == "ended") then
     alreadyTouchedPlanet = false
     alreadyTouchedGirl = false
     alreadyTouchedstar = false
	end
end

girl:addEventListener("touch", GirlListner)

local function PlanetListner(touch)
	
 if (touch.phase == "began") then
	 if (alreadyTouchedGirl == false) and (alreadyTouchedstar == false) then
	   alreadyTouchedPlanet = true
	 end
 end


  if ( (touch.phase == "moved") and (alreadyTouchedPlanet  == true) ) then
	 planet.x = touch.x
	 planet.y = touch.y
  end

    if (touch.phase == "ended") then
     alreadyTouchedGirl = false
     alreadyTouchedPlanet = false
     alreadyTouchedstar = false
	end
end

planet:addEventListener("touch", PlanetListner)

local function starListner(touch)
	
 if (touch.phase == "began") then
	 if (alreadyTouchedPlanet == false) and (alreadyTouchedGirl == false) then
	   alreadyTouchedstar = true
	 end
 end


  if ( (touch.phase == "moved") and (alreadyTouchedstar  == true) ) then
	 star.x = touch.x
	 star.y = touch.y
  end

    if (touch.phase == "ended") then
     alreadyTouchedGirl = false
     alreadyTouchedPlanet = false
     alreadyTouchedstar = false
	end
end

star:addEventListener("touch", starListner)