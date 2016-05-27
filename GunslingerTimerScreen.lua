local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
--Function to handle button events
local function StartTimerEvent(event)
	local phase = event.phase
	if "ended" == phase then
		print("You pressed and released the start Timer button!")
		timerStart = true;
	end
end

function Timer()
	--then decrease timerNum by 1
	print("timer hit")
	timerNum= timerNum - 1
	
	if timerNum < 0 then
		timerStart = false
		timerNum = 10
	end
end

local function Update()
		
		print("did")
		
		if timerStart == true then 
			print("timer started")
			Timer()
		end
		
		print(timerNum)
		timerImage:removeSelf()
		timerImage = display.newImageRect(timerArray[timerNum], 200, 250)
		timerImage.x = display.contentCenterX
		timerImage.y = display.contentCenterY
		
end

function scene:create( event )
 
   local sceneGroup = self.view
 
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
	
	local background = display.newImageRect("oldPaper.jpg", 640, 1136) --gunslinger background image
	local title = display.newImageRect("title.png", 350, 80)
	title.x = display.contentCenterX
	title.y = display.contentCenterY -200
	
	--Timer Number Array
	timerStart = false;
	
	timerArray = {}
	timerArray[0] = "TimerNum0.png";
	timerArray[1] = "TimerNum1.png";
	timerArray[2] = "TimerNum2.png";
	timerArray[3] = "TimerNum3.png";
	timerArray[4] = "TimerNum4.png";
	timerArray[5] = "TimerNum5.png";
	timerArray[6] = "TimerNum6.png";
	timerArray[7] = "TimerNum7.png";
	timerArray[8] = "TimerNum8.png";
	timerArray[9] = "TimerNum9.png";
	timerArray[10] = "TimerNum10.png";
	
	timerNum = 10; --current timer number
	
	timerImage = display.newImageRect(timerArray[timerNum], 200, 250)
	timerImage.x = display.contentCenterX
	timerImage.y = display.contentCenterY
	
	local startTimer = widget.newButton
	{
		left = display.contentCenterX,
		top = display.contentCenterY,
		top = 80,
		width = 325,
		defaultFile = "Start_Game_Btn.png",
		overFile = "Start_Game_Btn.png",
		label = "";
		onEvent = StartTimerEvent,
	}
	startTimer.x = display.contentCenterX;
	startTimer.y = display.contentCenterY + 200;
	
	--Add all display objects to the scene
	sceneGroup:insert(background)
	sceneGroup:insert(title)
	sceneGroup:insert(timerImage)
	
	
end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
		
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
	  local uptime = timer.performWithDelay(1000, Update, 0)
	  
	end
end
 
-- "scene:hide()"
function scene:hide( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene