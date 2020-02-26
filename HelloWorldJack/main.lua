-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


-- Your code here

-- print a greeting to the console
print ("**** Hello Jack!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the colour of the backround
display.setDefault("background", 105/255, 61/255, 109/255)

-- create local variable
local textObject

--Displays text on the screen at position X = 500 and Y = 500 with
--a default font style and font size of 50
textObject = display.newText( "Hello, Sam Fiander!", 500, 250, nil, 70 )

--sets the colour of the text 
textObject:setTextColor(204/255, 204/255, 0/255)

local textObjectSignature

textObjectSignature = display.newText( "Created By: Jack Fiander", 500, 500, nil, 40) 

textObjectSignature:setTextColor(52/255, 122/255, 54/255)