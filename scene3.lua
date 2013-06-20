require 'background3' 
require 'indio'
require 'paredes'
require 'enemy'

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()



local fundo, time_counter, parede, heroi, princesa, aranha, aranha2





function scene:createScene( event )
		local group = self.view
		
	    local screen_width = display.contentWidth
		local screen_height = display.contentHeight
		local center_x = display.contentCenterX
		local center_y = display.contentCenterY
		
	   
		fundo = Background3:new() 
		fundo.init()
		
		
		
		
		
		
		local TimeCounter = require 'clock'
		time_counter = TimeCounter.new( display.contentWidth )
		time_counter:start()
		
		
	
		parede = Paredes.new()
		parede.init()
		
		
		
		
   
		heroi = Indio:new()
		heroi.init()
		
		
		
		
		
		
		
		princesa = Enemy:new()
		princesa.princesa()
		
		aranha = Enemy:new()
		
		local function mover()
			aranha.move()
		end
		 timer_criacao = timer.performWithDelay(4000, mover,0)
	    
	
		aranha2 = Enemy:new()
		aranha2.x = 190
		--aranha2.y = 200
		aranha2.y = 150
		
		local function mover2()
			aranha2.move()
		end
		 timer_criacao2 = timer.performWithDelay(4000, mover2,0)
		
			
		function grupo_life:lost_life()
		self:remove( self.numChildren )
		if self.numChildren == 0 then
			physics.pause()
			audio.stop()
			img = display.newImage('img/telaover.jpg')
			img.x = center_x
			img.y = center_y
			timer.cancel(timer_criacao)
			timer.cancel(timer_criacao2)
		end
		end
		
		function grupo_lifeP:lost_lifeP()
		self:remove( self.numChildren )
		if self.numChildren == 0 then
		audio.stop()
		img = display.newImage('img/overprincess.png')
		img.x = center_x
		img.y = center_y
		timer.cancel(timer_criacao)
		timer.cancel(timer_criacao2)
		end
		end
		
		
		
		
		
        
		print( "\n1: createScene event da cena 1")
end
 
 
 
 function scene:enterScene( event )
	
	print( "1: enterScene event da cena 1" )
	
	--storyboard.purgeScene( storyboard.getPrevious())
	storyboard.purgeAll()
	--volta:addEventListener( "touch", volta )
	--restart_button:addEventListener( "touch", restart_button )

 
end

function scene:exitScene( event )
		print( "1: exitScene event da cena 1" )	
		--volta:removeEventListener( "touch", volta )	
		restart_button:removeEventListener( "touch", restart_button )
end


function scene:destroyScene( event )
 local group = self.view
	print( "((destroying scene ))" )
	 
end



scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene