-----------------------------------------------------------------------------------------
-- This program displays gravity to objects
-- ICS20
--Jack Fiander
-----------------------------------------------------------------------------------------
-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
-----------------------------------------------------------------------------------------------
--Objects 
-----------------------------------------------------------------------------------------------
--Ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = 740
ground.width = display.contentWidth


--Add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

local beam = display.newImage("Images/beam.png")
--set the x and y

beam.x = 100
beam.y = 650
-- rotate beam
beam:rotate(135)
beam:toBack()

beam.yScale = 5
beam.xScale = 5
--add physics 
physics.addBody(beam,"static", {friction=0.5, bounce=0.3})

--create bkg
local bkg = display.newImage("Images/bkg.png",0,0)
--set the x and y
bkg.x = display.contentCentreX
bkg.y = display.contentCentreY

bkg.x = display.contentWidth/2
bkg.y = display.contentHeight/2

bkg.width = display.contentWidth
bkg.height = display.contentHeight

--send to back 
bkg:toBack()
------------------------------------------------------------------------------------
--Functions
------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png",0 ,0)
	--add to physics 
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, redius=25})
end

local function secondBall()
	local ball2 = display.newImage("Images/super_ball.png" ,0 ,0)
	--add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})
	ball2.xScale = .5
	ball2.yScale = .5
end

------------------------------------------------------------------------------------
--Timer Delays - call each function 
------------------------------------------------------------------------------------
timer.preformWithDelay( 0, firstBall)
timer.preformWithDelay( 500, secondBall)
firstBall()
secondBall()
