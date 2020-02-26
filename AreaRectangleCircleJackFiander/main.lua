-----------------------------------------------------------------------------------------
--Title: Local variables 
-- Name: Jack Fiander
--course: ICS20
-----------------------------------------------------------------------------------------

-- create my local variables 
local areaText
local textSize = 25
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

--set the BG colour of my screen.remember that colours are between 0 and 1.
display.setDefault("background", 101/255, 121/255, 4/255)

--to remove status bar 
display.setStatusBar(display.HiddenStatusBar)

--draw the ractangle that is half the width and height of the screen size.
myRectangle = display.newRect(0,0, widthOfRectangle, heightOfRectangle)

--anchor the rectangle in the top left corner of the screen and set it's (X,Y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 21
myRectangle.y = 21

--set the width of the boarder 
myRectangle.strokeWidth = 21

--set the colour of the rectangle
myRectangle:setFillColor(0.7, 0.1, 0.3)

myRectangle:setStrokeColor(0, 1, 0)

-- Calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n"..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " plixels².", 0, 0, Slackey, textSize)

areaText.anchorX = 0
areaText.anchorY = 0