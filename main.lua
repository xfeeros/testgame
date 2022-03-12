	function Sort(a,b)         
        if a > b then 
           return true
        else 
           return false;
        end
     end
	
	local canvas = love.graphics.newCanvas()
    local point_max = {0,1,2}
	local clear
	local box_item = {
    { 111, 140 },  --верхнее окно
    { 46, 76 },
	{ 77, 104 }, --броня
    { 441, 469 },
	{94, 125}, --нижнее окно
	{237, 267}
}
	
local box = {
    { 117, 161 },
    { 382, 401 }
}

local box_stone = {
    { 109, 139 },
    { 441, 469 }
}

local box_stone1 = {
    { 144, 171 },
    { 441, 469 }
}

	local show = false
	local point = 0
	local luck = {
				 {50,30,30,30,30,30,30,30,25,20,12,5},
				 {65,45,45,45,45,45,45,45,40,35,27,20},
				 {53.5, 33.5, 33.5, 33.5, 33.5, 33.5, 33.5, 33.5, 28.5, 23.5, 15.5, 8.5}
				 }
	local list = 0
	local count_mira = 300
function love.load()
font = love.graphics.newFont("libs/arialbold.ttf", 11.4)
cursor = love.mouse.newCursor("libs/finger3.png", 0, 0)
love.mouse.setCursor(cursor)
pic = love.graphics.newImage("libs/window.png")
inv = love.graphics.newImage("libs/inventar.png")
back = love.graphics.newImage("libs/back.png")
mirage = love.graphics.newImage("libs/mirage.png")
result = love.graphics.newImage("libs/result.png")
item = {
x = 75,
y = 442,
width = 45,
height = 45,
inf = love.graphics.newImage("libs/item.png"),
infotab = love.graphics.newImage("libs/item_inf2.png"),
dragging = {
active = false,
distX = 0,
distY = 0
	}
}

stone = {
x = 109,
y = 442,
width = 45,
height = 45,
sky = love.graphics.newImage("libs/nebes.png"),
infotab1 = love.graphics.newImage("libs/item_inf3.png"),
dragging_s = {
active_s = false,
distX = 0,
distY = 0
	}
}

stone1 = {
x = 142,
y = 442,
width = 45,
height = 45,
grd = love.graphics.newImage("libs/podzem.png"),
infotab2 = love.graphics.newImage("libs/item_inf4.png"),
dragging_ss = {
active_ss = false,
distX = 0,
distY = 0
	}
}
	
	
ok = {
x = 116,
y = 382,
im = love.graphics.newImage("libs/ok.png")
}

src2 = love.audio.newSource("libs/pwgm.mp3", "stream")
src2:setVolume(0.05)
src2:play()
end

function love.update(dt)
x, y = love.mouse.getPosition()
count = point + 1
if item.dragging.active then
item.x = love.mouse.getX() - item.dragging.distX
item.y = love.mouse.getY() - item.dragging.distY
end
if stone.dragging_s.active_s then
stone.x = love.mouse.getX() - stone.dragging_s.distX
stone.y = love.mouse.getY() - stone.dragging_s.distY
end
if stone1.dragging_ss.active_ss then
stone1.x = love.mouse.getX() - stone1.dragging_ss.distX
stone1.y = love.mouse.getY() - stone1.dragging_ss.distY
end
end



function love.mousepressed(x, y, button, istouch)
	if button == 1 and
		x >= box_item[3][1] and
        x <= box_item[3][2] and
        y >= box_item[4][1] and
        y <= box_item[4][2] then 
		item.dragging.active = true
		item.dragging.distX = x - item.x
		item.dragging.distY = y - item.y
	elseif
		x >= box_item[1][1] and
        x <= box_item[1][2] and
        y >= box_item[2][1] and
        y <= box_item[2][2] then
		item.dragging.active = true
		item.dragging.distX = x - item.x
		item.dragging.distY = y - item.y
	elseif
		x >= box_stone[1][1] and
        x <= box_stone[1][2] and
        y >= box_stone[2][1] and
        y <= box_stone[2][2] then
		stone.dragging_s.active_s = true
		stone.dragging_s.distX = x - stone.x
		stone.dragging_s.distY = y - stone.y
	elseif 	
		x >= box_stone1[1][1] and
        x <= box_stone1[1][2] and
        y >= box_stone1[2][1] and
        y <= box_stone1[2][2] then
		stone1.dragging_ss.active_ss = true
		stone1.dragging_ss.distX = x - stone1.x
		stone1.dragging_ss.distY = y - stone1.y
	end
	if
        x >= box[1][1] and
        x <= box[1][2] and
        y >= box[2][1] and
        y <= box[2][2] and
		item.x >= 100 and
        item.y >= 40
	then unluck = love.math.random(0, 100)
	list = ( list + 10)
	show = not show
	count_mira = (count_mira - 1)
	else return count
	end

		if
		stone.x >= 93 and
		stone.y <= 260 then
		luck[1]= luck[2]
		end
		if
		stone1.x >= 93 and
		stone1.y <= 260 then
		luck[1]= luck[3]
		end
		if unluck <= luck[1][count] then 
		point = (point + 1)
		table.insert(point_max, point)
		elseif 
		stone1.x >= 93 and
		stone1.y <= 260 then
		point = (point - 1)
			else point = 0
				end	
		if 	point <= 0 then point = 0 end	--обработчик ошибок, чтобы не вылетала игра при заточке подземкой
				
canvas:renderTo( function()
        if clear or list >= 70
		then
            love.graphics.clear()
			list = 10
        end
		if unluck <= luck[1][count]
		then
		love.graphics.setColor(0, 180, 0)
	    love.graphics.print ("Усовершенствование прошло успешно!", 0, list)
		love.graphics.setColor(1, 1, 1)
		else 
		love.graphics.setColor(0.93, 0.75, 0.28)
		love.graphics.print ("Не удалось усовершенствовать", 0, list)
		love.graphics.setColor(1, 1, 1)
		end
		end)
end

function love.draw()
love.graphics.draw(back)
love.graphics.draw(inv, 25, 430)
love.graphics.draw(pic, 38, 0)
love.graphics.print (x..","..y)
love.graphics.draw(ok.im, ok.x, ok.y)

		if
		stone.x >= 93 and
		stone.y <= 260 then
		love.graphics.print (luck[2][count].."%", 145 , 247)
		elseif
		stone1.x >= 93 and
		stone1.y <= 260 then
		love.graphics.print (luck[3][count].."%", 145 , 247)
		else
		love.graphics.print (luck[1][count].."%", 145 , 247)
		end		
		
love.graphics.draw( canvas, 59 , 288 ) -- информационное окно
love.graphics.setFont(font)
love.graphics.draw(mirage, 42, 441)
love.graphics.print (count_mira, 42, 461)
love.graphics.print ("1/"..count_mira, 211, 197)
love.graphics.draw(stone.sky, stone.x,stone.y)
love.graphics.draw(stone1.grd, stone1.x,stone1.y)
love.graphics.draw(item.inf, item.x,item.y)

if x >= item.x
	and x <= item.x + item.width
	and y >= item.y
	and y <= item.y + item.height
	and item.dragging.active == false
	then
	love.graphics.draw(item.infotab, item.x+10, item.y+10)
	love.graphics.print ("+"..point, item.x+104 , item.y+16)
		elseif 
			x >= stone.x
			and x <= stone.x + stone.width
			and y >= stone.y
			and y <= stone.y + stone.height
			and stone.dragging_s.active_s == false
			then
		love.graphics.draw(stone.infotab1, stone.x+10, stone.y+10)
		elseif 
			x >= stone1.x
			and x <= stone1.x + stone1.width
			and y >= stone1.y
			and y <= stone1.y + stone1.height
			and stone1.dragging_ss.active_ss == false
			then
		love.graphics.draw(stone1.infotab2, stone1.x+10, stone1.y+10)
end
if count_mira <= 0 then love.graphics.draw(result)
love.graphics.print("Максимальный результат: +"..point_max[1], 100, 435)
end
table.sort(point_max, Sort)
end

function love.mousereleased(x, y, button)
if button == 1
and
		x >= box_item[3][1] and
        x <= box_item[3][2] and
        y >= box_item[4][1] and
        y <= box_item[4][2] then
item.dragging.active = false
elseif
		x >= box_item[1][1] and
        x <= box_item[1][2] and
        y >= box_item[2][1] and
        y <= box_item[2][2] then
item.dragging.active = false
elseif
	    x >= box[1][1] and
        x <= box[1][2] and
        y >= box[2][1] and
        y <= box[2][2] then
item.dragging.active = false -- мини багос, финксить мб надо
elseif  x >= box_item[5][1] and
        x <= box_item[5][2] and
        y >= box_item[6][1] and
        y <= box_item[6][2] then
stone.dragging_s.active_s = false
stone1.dragging_ss.active_ss = false
	
else
item = {x = 75,y = 442,width = 100,height = 100,inf = love.graphics.newImage("libs/item.png"),infotab = love.graphics.newImage("libs/item_inf2.png"),dragging = {distX = 0,distY = 0}}
stone = {x = 109,y = 442,width = 45,height = 45,sky = love.graphics.newImage("libs/nebes.png"),infotab1 = love.graphics.newImage("libs/item_inf3.png"),dragging_s = {active_s = false, distX = 0,distY = 0}}
stone1 = {x = 142,y = 442,width = 45,height = 45,grd = love.graphics.newImage("libs/podzem.png"),infotab2 = love.graphics.newImage("libs/item_inf4.png"),dragging_ss = {active_ss = false, distX = 0,distY = 0}}
end
end

function love.keypressed(k)
if count_mira <= 0 then
do
   if k == 'y' then
      love.event.quit("restart")
	elseif k == 'n' then
	love.event.quit()
   end
   end
   end
end