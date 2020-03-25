-----------------------------------------------------------------------------------------
--Touch And React
-- Jack F
--ICS20
--This program diplays a button that changes when it is clicked 
-----------------------------------------------------------------------------------------
display.setDefault ("background", 153/255, 204/255, 255,255)
--hide status bar
display.setStatusBar(display.HiddenStatusBar)
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

--Create text object, set the position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1,1,0)

textObject.isVisible = false

--When the blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then 
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

blueButton:addEventListener("touch",BlueButtonListener)

