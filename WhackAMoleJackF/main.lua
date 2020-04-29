-----------------------------------------------------------------------------------------
--This program displays a mole that hops around the screen waiting to be clicked
--ICS20
--Jack F
-----------------------------------------------------------------------------------------

--- hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Creating Background
local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight )
bkg:setFillColor(.7, 0, .7)

--setting position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0
bkg:toBack()
--Creating mole
local mole = display.newImage( "Images/mole.png", 0, 0)
--setting position 
mole.x = display.contentCenterX
mole.y = display.contentCenterY
mole:scale(.33333,.33333)
mole.isVisible = false

local points = 0
local pointsText 
pointsText = display.newText("Score = " .. points, display.contentWidth/2,250, nil, 50)

	--update it in the display object 
	pointsText.text = "Score = " .. points 

function PopUp( )
	--random points on the screen 
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)
	mole.isVisible = true
	timer.performWithDelay(500, Hide)
end

function PupUpDelay( )
    timer.performWithDelay( 3000, PopUp)
end

pointsText.x = display.contentWidth/2
pointsText.y = display.contentHeight/2



function Hide( )
	mole.isVisible = false
	PupUpDelay()
end

--starts the game
function StartGame( )
	PupUpDelay()
end
--Up's the score if the mole is clicked 
function Whacked( event )
	-- if thouch faze started
	if (event.phase == "began") then
		points = points + 1 
		pointsText.text = "Score = " .. points 
		--pointsText = display.newImage("Score = " .. points)
	end
end
--add points for when its touched
mole:addEventListener( "touch",Whacked )
StartGame()
--Runtime:addEventListener("enterFrame", StartGame)