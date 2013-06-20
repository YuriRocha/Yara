local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


local screen_width = display.contentWidth
local screen_height = display.contentHeight
local center_x = display.contentCenterX
local center_y = display.contentCenterY

local selecao_background, fase_um, fase_dois, fase_tres

local function onFaseumTouch(self, event)
	if event.phase == "began" then
		local som_start = audio.loadSound('start.mp3')
	    audio.play(som_start) 
		storyboard.gotoScene( "scene1" )
		return true
	end
end


local function onFasedoisTouch(self, event)
	if event.phase == "began" then
		local som_start = audio.loadSound('start.mp3')
	    audio.play(som_start) 
		storyboard.gotoScene( "scene2" )
		return true
	end
end

local function onFasetresTouch(self, event)
	if event.phase == "began" then
		local som_start = audio.loadSound('start.mp3')
	    audio.play(som_start) 
		storyboard.gotoScene( "scene3" )
		return true
	end
end



function scene:createScene( event )
        local group = self.view
		
	   selecao_background = display.newImage("img/tela1.png")
	   selecao_background.x = 435
	   group:insert( selecao_background )
	   
	  
	   
	   
	   fase_um = display.newImage("img/quadro1.png")
	   fase_um.x = 300
	   fase_um.y = 170
	   group:insert( fase_um )
	   fase_um.touch = onFaseumTouch
	   
	   fase_dois = display.newImage("img/quadro2.png")
	   fase_dois.x = 650
	   fase_dois.y = 170
	   group:insert( fase_dois )
	   fase_dois.touch = onFasedoisTouch
	   
	   fase_tres = display.newImage("img/quadro3.png")
	   group:insert( fase_tres )
	   fase_tres.x = 470
	   fase_tres.y = 380
	   fase_tres.touch = onFasetresTouch
		
		
		
		
		
end


function scene:enterScene( event )

  local group = self.view
  
    storyboard.purgeScene( storyboard.getPrevious())
	fase_um:addEventListener( "touch", fase_um )
    fase_dois:addEventListener( "touch", fase_dois )
	fase_tres:addEventListener( "touch", fase_tres ) 

end


function scene:exitScene( event )
        local group = self.view   
		
		fase_um:removeEventListener( "touch", fase_um )
		fase_dois:removeEventListener( "touch", fase_dois )
		fase_tres:removeEventListener( "touch", fase_tres )
end

function scene:destroyScene( event )
 local group = self.view
	
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene