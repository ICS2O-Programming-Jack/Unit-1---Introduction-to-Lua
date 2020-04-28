-----------------------------------------------------------------------------------------
--Tite: Moving Images
--Jack Fiander
--ICS20
--this program displays an image that moves across the screen.
--ive added 2 objects that move across the screen and change in size as
--well as go in diffrent directions and fades out.
----------------------------------------------------------------------------------------
--hide status bar
display.setStatusBar(display.HiddenStatusBar)

local howlingSound = audio.loadSound("Sounds/Howling.mp3")
local howlingSoundChannel

howlingSoundChannel = audio.play(howlingSound)
--Global Variables
scrollspeed = 3
scrollRspeed = -3
--BG image width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
--character image width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

--set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

--Function MoveShip
local function MoveShip(event)
	--add the scroll speed to the x value of the ship 
	beetleship.x = beetleship.x + scrollspeed
	--Change the transparency
	beetleship.yScale = .5
	beetleship.xScale = .5
	beetleship.alpha = beetleship.alpha + 0.01
end

--repeat this over and over
Runtime:addEventListener("enterFrame", MoveShip)

local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

--set the image to be transparent
rocketship.alpha = 1

--set the initial x and y position of the rocketship
rocketship.x = 500
rocketship.y = display.contentHeight*(2/3)

--Function MoveShip
local function MoveRShip(event)
	--add the scroll speed to the x value of the ship 
	rocketship.x = rocketship.x + scrollRspeed
	--Change the transparency
	rocketship:scale(1.004, 1.004)
	rocketship.alpha = rocketship.alpha - 0.00000001

end

--repeat this over and over
Runtime:addEventListener("enterFrame", MoveRShip)



