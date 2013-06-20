local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function scene:createScene( event )
        local group = self.view
end


function scene:enterScene( event )

  local group = self.view
  
  local logo = display.newImage("img/lionhead.png",0,0)
  group:insert( logo )
  
  transition.to(group, {time = 3000, x = 300, onComplete = function() storyboard.gotoScene( "menu", "fade", 400 ) end})
  --transition.to(group, {time = 10000, x = 300})
  
  --storyboard.gotoScene( "scene1" )
 
 
 --storyboard.purgeScene( storyboard.getPrevious() )
end


function scene:exitScene( event )
        local group = self.view   
		
end

function scene:destroyScene( event )
 local group = self.view
 
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene