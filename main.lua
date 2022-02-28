--local img, flip

local anim8 = require 'libs/anim8'
local player = {x = 100, y = 400, flip = false, iW = nil, img = nil, SCALE = 0.7, hp = 1000, img = love.graphics.newImage("player3.png"), img1 = love.graphics.newImage("player_stand.png"),img2 = love.graphics.newImage("player_rotate.png") }
local enemy = {x = 100, y = 500, speed = 200}
function love.load()
	camera = require "libs/gamera"
	cam = camera.new(0,0,400,400)
	cam:setWorld(0,0,2000,2000)	
	cam:setWindow(0,0, 800,600) 
 	x, y = 0, 0
	scale = 1
	newAngle = 0
	
	pic = love.graphics.newImage("background3.png")
	--ground = love.graphics.newImage("platform.png")
	--cave = love.graphics.newImage("cave.png")
	local g = anim8.newGrid(113, 194, player.img:getWidth(), player.img:getHeight())	-- указать значение, равное ширине, деленное на кол-во кадров 950/5 = 190
	player.animation = anim8.newAnimation(g('1-6',1), 0.1)
	player.animation_stand = anim8.newAnimation(g('1-6',1), 0.5)
	player.animation_rotate = anim8.newAnimation(g('1-6',1), 0.1)
end


function love.update(dt)
	if love.keyboard.isDown("up") then
		player.animation:update(dt)
		player.y = player.y - 410 * dt
		elseif love.keyboard.isDown("down") then
		player.animation:update(dt)
		player.y = player.y + 410 * dt
	end
		
	if love.keyboard.isDown("right") then
			if not player.flip then
			player.flip = true
			player.animation:flipH()
				end
				player.animation:update(dt)
				player.x = player.x + 410 * dt
	elseif love.keyboard.isDown("left") then
			if player.flip then
			player.flip = false
			player.animation:flipH()
				end
				player.animation:update(dt)
				player.x = player.x - 410 * dt
	end
			player.animation_stand:update(dt)	
cam:setPosition(player.x, player.y)
end

function love.draw()
	cam:draw(function(l,t,w,h)
		love.graphics.draw(pic, 0,0 )
	--	love.graphics.draw(cave, 1400, 235, 0, 0.5, 0.5)
	--	love.graphics.draw(ground, 0,150 )

		if love.keyboard.isDown("right") or love.keyboard.isDown("left")
			then player.animation:draw(player.img, player.x, player.y, 0, player.SCALE, player.SCALE)
		elseif  love.keyboard.isDown("up") or love.keyboard.isDown("down")
			then player.animation:draw(player.img2, player.x, player.y, 0, player.SCALE, player.SCALE)
		else player.animation_stand:draw(player.img1, player.x, player.y, 0, player.SCALE, player.SCALE) end
	end)

	love.graphics.setColor(255,56,56)
	love.graphics.print("X,Y:"..player.x..","..player.y, 10,30)
end

--function love.keyreleased(key)
 --if key == 'right' or key == 'left' then
   -- player.animation:gotoFrame(1) 
 --end
 --end

require ("libs/menu")