
local TimeCounter = {}

local screen_width = display.contentWidth
local screen_height = display.contentHeight
local center_x = display.contentCenterX
local center_y = display.contentCenterY


TimeCounter.new = function( screen_width )
	local timeCounterDisplay = display.newText('0:00', screen_width*0.5 , 0, nil, 28)
	timeCounterDisplay.x = center_x*1.0
	timeCounterDisplay.y = screen_height*0.055
	timeCounterDisplay.xScale = 1.2
	timeCounterDisplay.yScale = 1.2
	
	timeCounterDisplay.timerCounter = 0
	timeCounterDisplay.timer = nil

	function timeCounterDisplay:start()
		if self.timer then
			self.timer.resume()
		else
			self.timer = timer.performWithDelay( 1000, function()
				self:refresh()
			end, 0 )
		end
	end

	function timeCounterDisplay:pause()
		if self.timer then
			self.timer.pause()
		end
	end

	function timeCounterDisplay:refresh()
		self.timerCounter = self.timerCounter + 1
		self.text = self:format()
		self.x = center_x*1.0
		self.y = screen_height*0.055
	end

	function timeCounterDisplay:format()
		local time = self.timerCounter
		local floor = math.floor
		local minute = tostring( floor( time / 60 ) )
		local second = tostring( floor( time % 60 ) )
		if #second  == 1 then
			second = '0'..second
		end

		return minute..':'..second
	end

	return timeCounterDisplay
end

return TimeCounter