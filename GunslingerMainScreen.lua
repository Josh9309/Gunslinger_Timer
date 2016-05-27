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
local function handleStartButtonEvent(event)
	local phase = event.phase
	if "ended" == phase then
		print("You pressed and released the start button!")
		composer.gotoScene("GunslingerTimerScreen")
	end
end

function scene:create( event )
 
   local sceneGroup = self.view
 
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
	
	local background = display.newImageRect("oldPaper.jpg", 640, 1136) --gunslinger background image
	local title = display.newImageRect("title.png", 350, 80)
	title.x = display.contentCenterX
	title.y = display.contentCenterY -200
	local skull = display.newImageRect("skull.jpg", 200, 250)
	skull.x = display.contentCenterX
	skull.y = display.contentCenterY
	
	local start = widget.newButton
	{
		left = display.contentCenterX,
		top = display.contentCenterY,
		top = 80,
		width = 325,
		defaultFile = "Start_Game_Btn.png",
		overFile = "Start_Game_Btn.png",
		label = "";
		onEvent = handleStartButtonEvent,
	}
	start.x = display.contentCenterX;
	start.y = display.contentCenterY + 200;
	
	--Add all display objects to the scene
	sceneGroup:insert(background)
	sceneGroup:insert(title)
	sceneGroup:insert(skull)
	
	
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