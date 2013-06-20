

Enemy = {}


function Enemy:new()

	local enemy = {}
	
	
	function enemy:princesa()
		princesa = display.newImage("img/yara.png")
		princesa.x = 850
		princesa.y = 200
		princesa.name = 'princesa'
		princesa.xScale = 0.7
		princesa.yScale = 0.7
		
		physics.addBody(princesa,'static')
	end
	
	function enemy:move()
	
	monstro = display.newImage("img/spirit.png")
	monstro.name = 'monstro'
	monstro.xScale = 0.8
	monstro.yScale = 0.8
	
	--monstro.x = math.random(0,479)
	--monstro.y = math.random(0,334)
	  monstro.x = math.random(0,479)
	  monstro.y = math.random(0,500)
	
	local som_inimigo = audio.loadSound('move.mp3')
	audio.play(som_inimigo)
	
	transition.to(monstro, {time=12000, x = princesa.x, y = princesa.y})
	
	physics.addBody(monstro, "dynamic")
	
	
	--timer.performWithDelay(2000, monstro,10)
	end
	
--[[		
local function collision(event)
 if event.object1.name == 'flecha'  and event.object2.name == 'monstro' then
  event.object1:removeSelf()
  event.object2:removeSelf()
 elseif event.object1.name == 'monstro'  and event.object2.name == 'flecha' then
  event.object1:removeSelf()
  event.object2:removeSelf()
 elseif event.object1.name == 'monstro' and event.object2.name == 'indio' then
  grupo_life:lost_life()
  monstro:removeSelf()
 end
end
Runtime:addEventListener('collision', collision)	
]]

	return enemy
end

return Enemy