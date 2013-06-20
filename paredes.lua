local physics = require "physics"
physics.start()
physics.setGravity(0,0)

Paredes = {}

function Paredes:new()

	local paredes = {}
	
		function paredes:init()
		
		local paredeTopo
		local paredeBase
		local paredeEsquerda
		local paredeDireita
	
	
		grupo_paredes = display.newGroup()
	
		paredeTopo = display.newRoundedRect(0, 0, 870, 50, 12)
		physics.addBody(paredeTopo,"static")
		paredeTopo.alpha = 0

		paredeBase = display.newRoundedRect(0,420,870,50,12)
		physics.addBody(paredeBase,"static")
		paredeBase.alpha = 0

		paredeEsquerda = display.newRoundedRect(0,0,45,458,12)
		physics.addBody(paredeEsquerda,"static")
		paredeEsquerda.alpha = 0

		paredeDireita = display.newRoundedRect(862,0,45,458,12)
		physics.addBody(paredeDireita,"static")
		paredeDireita.alpha = 0
	
		grupo_paredes:insert(paredeTopo)
		grupo_paredes:insert(paredeBase)
		grupo_paredes:insert(paredeEsquerda)
		grupo_paredes:insert(paredeDireita)
	
	end
	
	return paredes
end

return Paredes