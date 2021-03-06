-----------------------------------------------------------------------------------------
--Touch And React
-- Jack F
--ICS20
--This program diplays a button that changes when it is clicked 
-----------------------------------------------------------------------------------------
display.setDefault ("background", 153/255, 20/255, 255,255)
--hide status bar
display.setStatusBar(display.HiddenStatusBar)
--sound variables 
local beepSound = audio.loadSound ("Sounds/beep.mp3")
local beepSoundChannel

local correctSoundChannel
local BuzzerSound = audio.loadSound( "Sounds/Buzzer.mp3")
--create blue button, set position to make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 
--create red button, set its positionand make it invisible 
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false
--X variable 
local X = display.newImageRect("Images/X.png",198, 96)
X.x = display.contentWidth/2
X.y = 45
X.isVisible = false
--Create text object, set the position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1,1,0)

textObject.isVisible = false

--When the blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function RedButtonListener(touch)
	if (touch.phase == "ended") then
		redButton.isVisible = false
		X.isVisible = false
		textObject.isVisible = false
		blueButton.isVisible = true
		beepSoundChannel = audio.play(beepSound)
	end
	if (touch.phase == "began") then
		redButton.isVisible = false
		X.isVisible = false
		textObject.isVisible = false
		blueButton.isVisible = true
	end
end
 

local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		X.isVisible = true
		redButton.isVisible = true
		textObject.isVisible = true
		correctSoundChannel = audio.play(BuzzerSound)
	end

	if (touch.phase == "ended") then 
		X.isVisible = false
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

blueButton:addEventListener("touch",BlueButtonListener)
redButton:addEventListener("touch",RedButtonListener)