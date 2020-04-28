-----------------------------------------------------------------------------------------
--This program displays a math question with lives and timers
-- ICS20 - Jack F
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
--sets the background colour to a lime green
display.setDefault("background", .7, .7, .7)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local totalSeconds = 11
local secondsLeft = 11
local clockText 
local countDownTimer 
local heart3
local lives = 4
local heart1
local heart2
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local gameOver
local heart4
local gameOverSound = audio.loadSound("Sounds/Game Over.mp3")
local gameOverSoundChannel
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function updateLives()
	-- body
	lives = lives - 1
    	if (lives == 3) then
    		heart4.isVisible = false
    		wrongSoundChannel = audio.play(wrongSound)
    	elseif (lives == 2) then
    		heart3.isVisible = false
    		wrongSoundChannel = audio.play(wrongSound)
    	elseif (lives == 1) then
    		heart2.isVisible = false
    		wrongSoundChannel = audio.play(wrongSound)
    	elseif (lives == 0) then
    		heart1.isVisible = false
    		gameOver.isVisible = true
    		gameOverSoundChannel = audio.play(gameOverSound)
    		clockText.isVisible = false
    		numericField.isVisible = false
    		
  end 
end

local function UpdateTime()

	--decrease the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object 
    clockText.text = secondsLeft .. ""
    
    if (secondsLeft == 0) then
    	--reset the seconds 
    	secondsLeft = totalSeconds
    	updateLives()
  	end
end
 local function AskQuestion()
	randomNumber1 = math.random(1, 10)
	randomNumber2 = math.random(1, 10)
	
     correctAnswer = randomNumber1 + randomNumber2
	    --create question in text Object
	 questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end
local function HideIncorrect()
	incorrectObject.isVisible = false
	updateLives()
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
			secondsLeft = totalSeconds
			correctSoundChannel = audio.play(correctSound)
			--update it in the display object
		else incorrectObject.isVisible = true 
			secondsLeft = totalSeconds
			correctObject.isVisible = false 
			timer.performWithDelay(2020, HideIncorrect)
		end
	end
end

local function StartTimer()
 -- create a countdown timer that loops infinitely
  countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

 StartTimer()
----------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------------------
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 75 )
questionObject:setTextColor(1 , 1, 1)
questionObject.isVisible = true
--create the correct text object and make it invisible
correctObject = display.newText( "Great!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor (1, 1, 1)
correctObject.isVisible = false
--create the incorrect text and make it invisible
incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject.isVisible = false
--create numeric feild
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

--display the lives on the screen
heart1 = display.newImageRect("Images/heart1.png" , 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart1.png" , 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart1.png" , 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart1.png" , 100, 100)
heart4.x = display.contentWidth * 1 / 2
heart4.y = display.contentHeight * 1 / 7

gameOver = display.newImageRect("Images/Game over.jpg", 1024, 769)
gameOver.x = display.contentWidth/2 
gameOver.y = display.contentHeight/2
gameOver.isVisible = false
--update it in the display object 
--clockText.text = "Time: " .. countDownTimer
 clockText = display.newText("Time: " .. secondsLeft, display.contentHeight/8, 25, nil, 50)
----------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------
--call the function to ask the question
AskQuestion()