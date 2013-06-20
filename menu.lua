local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


local screen_width = display.contentWidth
local screen_height = display.contentHeight
local center_x = display.contentCenterX
local center_y = display.contentCenterY

local menu_background

local function onSceneTouch(self, event)
	if event.phase == "began" then
		local som_start = audio.loadSound('start.mp3')
	    audio.play(som_start) 
		storyboard.gotoScene( "selecao" )
		
		return true
	end
end



function scene:createScene( event )
     local group = self.view
		
		--group:insert( scren_width )
		--group:insert( screen_height )
		--group:insert( center_x )
		--group:insert( center_y )
	 
	 
  
	   menu_background = display.newImage("img/eternaldark.jpg")
	   menu_background.x = 450
	   group:insert( menu_background )
	   
	   menu_background.touch = onSceneTouch
		
      
	 
	   print( "\n1: createScene event")
			
end

function scene:enterScene( event )

	print( "1: enterScene event" )
	storyboard.purgeAll()
	storyboard.purgeScene( storyboard.getPrevious())
	menu_background:addEventListener( "touch", menu_background )
  
end

function scene:exitScene( event )
        print( "1: exitScene event" )
	    menu_background:removeEventListener( "touch", menu_background )
		
end

function scene:destroyScene( event )
	print("destroy")
	
	--inicio:removeEventListener('tap', inicioTap)
	--fases:removeEventListener('tap', fasesTap)
 
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene
 
 