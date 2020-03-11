-----------------------------------------------------------------------------------------
--Numeric Text Feilds 
--Jack Fiander
--ICS20
--This program displays a math question and asks the 
--user to answer in a numeric textfeild.
-----------------------------------------------------------------------------------------

-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour to a lime green
display.setDefault("background", .5, 1, .5)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function AskQuestion()
	-- generate 2 random nembers between 1 and 10
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text Object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function numericFieldListener( event )
	-- user begins editing "numericFeild"
	if ( event.phase == "began" ) then
		--Clear text feild--
		event.target.text = ""

	elseif event.phase == "submitted" then 
		--When the answer is submitted (enter key is touched) set user input to answer
		userAnswer = tonumber(event.target.text)
		--if the user answer and the right answer are the same 
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.preformWithDelay(3000, HideCorrect)

		end
	end
end

----------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------------------

--displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(.8, .8, .8)
questionObject.isVisible = true
--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(.8, .8, .8)
correctObject.isVisible = false

--create numeric feild
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

----------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------
--call the function to ask the question
AskQuestion()