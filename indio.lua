

require 'enemy'


local physics = require "physics"
physics.start()
physics.setGravity(0,0)


Indio = {}

function Indio:new()

	local indio = {}

	
	local screen_width = display.contentWidth
	local screen_height = display.contentHeight
	local center_x = display.contentCenterX
	local center_y = display.contentCenterY
	
	
	
	function indio:init()
	
		-- VARIAVEIS DO SPRITE DO INDIO
local screen_width = display.contentWidth
local screen_height = display.contentHeight

local center_x = display.contentCenterX
local center_y = display.contentCenterY


		
		
local data_sheet = {
	width = 95, 
	height = 110, 
	sheetContentWidth = 285,
	sheetContentHeight = 440,
	numFrames = 12
}

local data_sprite = {
	{
		name = 'walk-down',
		start = 1,
		count = 3,
		time = 1000
	},
	
	{
		name = 'walk-left',
		start = 4,
		count = 3,
		time = 1000	
	},
	
	{
		name = 'walk-right',
		start = 7,
		count = 3,
		time = 700
	},
	
	{
		name = 'walk-up',
		start = 10,
		count = 3,
		time = 700
	},
	
	{
		name = 'stopped-down',
		start = 1,
		count = 1,
		time = 1000
	
	
	},
	
	{
		name = 'stopped-up',
		start = 10,
		count = 1,
		time = 1000
	
	
	},
	
	{
		name = 'stopped-right',
		start = 7,
		count = 1,
		time = 1000
	},
	
	{
		name = 'stopped-left',
		start = 4,
		count = 1,
		time = 1000
	}
}
	 
	
	 
	local sound = audio.loadSound('flight.mp3')
	--audio.play(sound,{loop = -1})
	 audio.play(sound)
	
	local function game_over()
				audio.stop( )
				img = display.newImage('img/over.jpg')
				img.x = center_x
				img.y = center_y
				img.xScale = 2
				img.yScale = 2
				indio:removeSelf()
			    princesa:removeSelf()
				monstro:removeSelf()
					
     end	
	 
	 
	 
	 
	
	
	 
      local function game_over_princesa()
	  audio.stop( )	
	  indio:removeSelf()
	  monstro:removeSelf()
	  
	  local som_princesa = audio.loadSound('scream.mp3')
	  audio.play(som_princesa)
	  
	  
	 end
	 
	 
	 
	 
  grupo_lifeP = display.newGroup()	

  local life_princess = display.newImage("img/heart.png",0,0)
  life_princess.alpha = 0

  grupo_lifeP:insert(life_princess)
	 
  function grupo_lifeP:lost_lifeP()
  self:remove( self.numChildren )
	  if self.numChildren == 0 then
	  game_over_princesa()
	  img = display.newImage('img/telaover.jpg')
	  img.x = center_x
	  img.y = center_y
	  end
  end
		
 grupo_life = display.newGroup() 
 
 

 local life1 = display.newImage("img/heart.png",0,0)
 life1.x = screen_width*(0.10)
 life1.y = 15

 local life2 = display.newImage("img/heart.png",0,0)
 life2.x = screen_width*(0.15)
 life2.y = 15

 local life3 = display.newImage("img/heart.png",0,0)
 life3.x = screen_width*(0.20)
 life3.y = 15


 grupo_life:insert(life1)
 grupo_life:insert(life2)
 grupo_life:insert(life3)


function grupo_life:lost_life()
   self:remove( self.numChildren )
   if self.numChildren == 0 then
     game_over()
	 
	
   end
end



	
	
	
indio_sheet = graphics.newImageSheet('img/indioatlas.png',data_sheet)
	
	indio = display.newSprite(indio_sheet, data_sprite)
	indio.x = center_x
	indio.y = center_y
	indio.x_speed = 0
	indio.y_speed = 0
	indio.direction = 'down'
	indio.name = 'indio'
	indio.xScale = 0.6
	indio.yScale = 0.6
	physics.addBody(indio,"dynamic")
	
	-------------------------------------------------------------------------------------
	
	local score = 0
	local arrow_left
	local arrow_right
	local arrow_up
	local arrow_down
	local botao_tiro
	
	grupo_direcional = display.newGroup()

	
	arrow_left = display.newImage("img/left.png",0,0)
	arrow_left.x = 40
	arrow_left.y = screen_height - 100
	arrow_left.alpha = 0.2
	
	arrow_right = display.newImage("img/right.png",0,0)
	arrow_right.x = 160
	arrow_right.y = screen_height - 100
	arrow_right.alpha = 0.2
	
	arrow_down = display.newImage("img/down.png",0,0)
	arrow_down.x = 100
	arrow_down.y = screen_height - 40
	arrow_down.alpha = 0.2
	
	arrow_up = display.newImage("img/up.png",0,0)
	arrow_up.x = 100
	arrow_up.y = screen_height - 160
	arrow_up.alpha = 0.2
	
	grupo_direcional:insert(arrow_left)
	grupo_direcional:insert(arrow_right)
	grupo_direcional:insert(arrow_down)
	grupo_direcional:insert(arrow_up)
	
	
	botao_tiro = display.newImage("img/button.png",0,0)
	botao_tiro.x = 800
	botao_tiro.y = 410
	botao_tiro.xScale = 0.7
	botao_tiro.yScale = 0.7
	botao_tiro.alpha = 0.2
	
	score_display = display.newText('0', 0,0,nil,25)
	score_display.x = screen_width*0.88
	score_display.y = screen_height*0.060
	score_display:setTextColor(255,255,0)
	
local function update()
	indio.x = indio.x + indio.x_speed
	indio.y = indio.y + indio.y_speed
end

--TIRO

local function create_flecha()
	local flecha = display.newImage('img/arrow.png',0,0)
	physics.addBody(flecha, "dynamic")
	flecha.x = indio.x 
	flecha.y = indio.y 
	flecha.direction = 'down'
	flecha.name = 'flecha'
	
	
	local end_flecha_x = 0
	local end_flecha_y = 0
	
	
	if indio.direction == 'left' then
		flecha.rotation = 90
		flecha.x = indio.x - 70
		end_flecha_x = -400
		end_flecha_y = indio.y
	elseif indio.direction == 'right' then
	    flecha.rotation = 270
		flecha.x = indio.x + 70
		end_flecha_x = 1000
		end_flecha_y = indio.y
	elseif indio.direction == 'up' then
		flecha.rotation = 0
		flecha.y = indio.y - 75
		end_flecha_x = indio.x
		end_flecha_y = -400
	elseif indio.direction == 'down' then
		flecha.rotation = 180
		flecha.y = indio.y + 75
		end_flecha_x = indio.x
		end_flecha_y = 1000
	end
	
	physics.addBody(flecha, 'dynamic')
	transition.to(flecha, {time = 500, x = end_flecha_x, y = end_flecha_y ,})
	local som_flecha = audio.loadSound('arrow.mp3')
	audio.play(som_flecha)
end

 local function refresh_score()
	score_display.text = ''..score
	score_display.x = screen_width*0.88
	if score == 3000 then
		score_win = display.newImage('img/victory.png')
		score_win.x = center_x
	    score_win.y = center_y
		indio:removeSelf()
		princesa:removeSelf()
		monstro:removeSelf()
		audio.stop( )
		local som_vitoria = audio.loadSound('victory.mp3')
	    audio.play(som_vitoria) 
		
	end	
end



--Funções para o direcional

local function touch_down(event)
	indio.direction = 'down'

	if event.phase == 'began' then
		indio.x_speed = 0
		indio.y_speed = 5
		indio:setSequence('walk-down')
		indio:play()
		display.getCurrentStage():setFocus(event.target)
	elseif event.phase == 'ended' then
		indio.y_speed = 0
		indio:setSequence('stopped-down')
		indio:play()	
		display.getCurrentStage():setFocus(nil)
	end
end


local function touch_up(event)
	indio.direction = 'up'
	if event.phase == 'began' then
		indio.x_speed = 0
		indio.y_speed = -5
		indio:setSequence('walk-up')
		indio:play()
		display.getCurrentStage():setFocus(event.target)
	elseif event.phase == 'ended' then
		indio.y_speed = 0
		indio:setSequence('stopped-up')
		indio:play()
		display.getCurrentStage():setFocus(nil)
	end
end

local function touch_right(event)
	indio.direction = 'right'
	if event.phase == 'began' then
		indio.x_speed = 5
		indio.y_speed = 0
		indio:setSequence('walk-right')
		indio:play()
		display.getCurrentStage():setFocus(event.target)
	elseif event.phase == 'ended' then
		indio.x_speed = 0
		indio:setSequence('stopped-right')
		indio:play()
		display.getCurrentStage():setFocus(nil)
	end
end

local function touch_left(event)
	indio.direction = 'left'
	if event.phase == 'began' then
		indio.x_speed = -5
		indio.y_speed = 0
		indio:setSequence('walk-left')
		indio:play()
		display.getCurrentStage():setFocus(event.target)
	elseif event.phase == 'ended' then
		indio.x_speed = 0
		indio:setSequence('stopped-left')
		indio:play()
		display.getCurrentStage():setFocus(nil)
	end
end

local function touch_arrow(event)
	if event.phase == 'began' then 
		indio:setSequence('walk-'..indio.direction)
		indio:play()
		create_flecha()
	elseif event.phase == 'ended' then
		indio:setSequence('stopped-'..indio.direction)
		indio:play()
		
	end
end

	
local function collision(event)
 if event.object1.name == 'flecha' and event.object2.name == 'monstro' then
  event.object1:removeSelf()
  event.object1 = nil
  event.object2:removeSelf()
  event.object2 = nil
  score = score + 100
  refresh_score()
 elseif event.object1.name == 'monstro' and event.object2.name == 'flecha' then
  event.object1:removeSelf()
  event.object1 = nil
  event.object2:removeSelf()
  event.object2 = nil
  score = score + 100
  refresh_score()
 elseif event.object1.name == 'flecha' and event.object2.name == 'princesa' then
	event.object1:removeSelf()
	event.object2:removeSelf()
	grupo_lifeP:lost_lifeP()
   elseif event.object1.name == 'princesa' and event.object2.name == 'flecha' then
   event.object2:removeSelf()
   event.object1:removeSelf()
	grupo_lifeP:lost_lifeP()
 elseif event.object1.name == 'indio' and event.object2.name == 'monstro' then
  grupo_life:lost_life()
  event.object2:removeSelf()
  event.object2 = nil
  local punch = audio.loadSound('punch.mp3')
  audio.play(punch)
    elseif event.object1.name == 'monstro' and event.object2.name == 'princesa' then
   event.object1:removeSelf()
   event.object2:removeSelf()
  grupo_lifeP:lost_lifeP()
   elseif event.object1.name == 'princesa' and event.object2.name == 'monstro' then
   event.object1:removeSelf()
   event.object2:removeSelf()
   grupo_lifeP:lost_lifeP()
 end
end
	

	Runtime:addEventListener('enterFrame', update)	
	Runtime:addEventListener('collision', collision)	
	botao_tiro:addEventListener('touch', touch_arrow)
	arrow_down:addEventListener('touch', touch_down)
	arrow_up:addEventListener('touch', touch_up)
	arrow_right:addEventListener('touch', touch_right)
	arrow_left:addEventListener('touch', touch_left)
	
	
	
	
	
	----------------------------------------------------------------------------------------------
	end
	
	
	return indio
end

return Indio