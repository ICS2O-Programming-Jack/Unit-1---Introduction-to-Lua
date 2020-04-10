--Math Fun
--Jack Fiander
--ICS20
--This program displays a math question (+ - * and division)
-----------------------------------------------------------------------------------------

-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour to a lime green
display.setDefault("background", 0, 0, 0)

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
local incorrectObject
local randomOperator
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function AskQuestion()
	-- generate 2 random nembers between 1 and 10
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)
    randomOperator = math.random(1, 4)
	
    if (randomOperator == 1) then
    	--calculate the answer 
     correctAnswer = randomNumber1 + randomNumber2
	    --create question in text Object
	 questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    elseif (randomOperator == 2) then 
    	correctAnswer = randomNumber1 - randomNumber2
	    --create question in text Object
	 questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
    elseif (randomOperator == 3) then
     	correctAnswer = randomNumber1 * randomNumber2
	    --create question in text Object
	 questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
    else correctAnswer = randomNumber1 / randomNumber2
	    --create question in text Object
	 questionObject.text = randomNumber1 .. " ÷ " .. randomNumber2 .. " = "
    correctAnswer = randomNumber1 / randomNumber2
    correctAnswer = correctAnswer * 10
    correctAnswer = math.round(correctAnswer)
    correctAnswer = correctAnswer / 10 
    end
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )
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
			incorrectObject.isVisible = false
			timer.performWithDelay(2020, HideCorrect)
			--update it in the display object 
		else incorrectObject.isVisible = true 
			correctObject.isVisible = false
			timer.performWithDelay(2020, HideIncorrect)
		end

	end
end


----------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------------------

questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(1 , 1, 1)
questionObject.isVisible = true
--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor (1, 1, 1)
correctObject.isVisible = false
--create the incorrect text and make it invisible
incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject.isVisible = false
--create numeric feild
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight/2, 150, 80 )
if (randomOperator == 4) then
 numericField.inputType = "decimal"
else  numericField.inputType = "number"
end

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

----------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------
--call the function to ask the question
AskQuestion()