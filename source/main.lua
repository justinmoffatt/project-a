--
--	Main game loop
--	Requires:	
--

function love.load()
	GRAVITY = -5
	FRICTION = -5

	WIDTH, HEIGHT = love.graphics.getDimensions( )
	WIDTH=WIDTH/2
	HEIGHT=HEIGHT/2
	SCALE=1
	RAD = math.pi/180

	-- an OBJECT is anything existing within the game world
	OBJECT = {
		r = {x=0,y=0},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("asset/default.png"),
		sound = nil
	}

	-- player character
	player = {
		r = {x=WIDTH,y=HEIGHT},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("/asset/dude.png"),
		sound = nil
	}


	-- some objects
	o1 = {
		r = {x=0,y=0},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("asset/default.png"),
		sound = nil
	}
	o2 = {
		r = {x=0+8,y=0},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("asset/default.png"),
		sound = nil
	}
	o3 = {
		r = {x=0+16,y=0},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("asset/default.png"),
		sound = nil
	}
	o4 = {
		r = {x=0+8,y=0+8},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("asset/default.png"),
		sound = nil
	}
	o5 = {
		r = {x=0+16,y=0+8},
		v = {x=0,y=0},
		a = {x=0,y=0},
		colide = {x=false, y=false},
		rotation = 0,
		image = love.graphics.newImage("asset/default.png"),
		sound = nil
	}
	
	-- defines the camera parameters to derive the drawing off
	camera = {
		r = {x=0,y=0},
		zoom = 0,
		rotate = 0
	}

end

function love.draw()
	love.graphics.draw(player.image,player.r.x,player.r.y,0,SCALE,SCALE,0,0)
	love.graphics.draw(o1.image,rotx(o1),roty(o1),camera.rotate,SCALE,SCALE,0,0)
	love.graphics.draw(o2.image,rotx(o2),roty(o2),camera.rotate,SCALE,SCALE,0,0)
	love.graphics.draw(o3.image,rotx(o3),roty(o3),camera.rotate,SCALE,SCALE,0,0)
	love.graphics.draw(o4.image,rotx(o4),roty(o4),camera.rotate,SCALE,SCALE,0,0)
	love.graphics.draw(o5.image,rotx(o5),roty(o5),camera.rotate,SCALE,SCALE,0,0)
end

function love.update(dt)
	-- rotation
	if love.keyboard.isDown('q') then
		camera.rotate = camera.rotate -RAD
		if camera.rotate < 0 then
			camera.rotate = 2*math.pi-RAD
		end
	end
	if love.keyboard.isDown('e') then
		camera.rotate = camera.rotate + RAD
		if camera.rotate > 2*math.pi-RAD then
			camera.rotate = 0
		end
	end

	--movement
	if love.keyboard.isDown('a') then
		HEIGHT = HEIGHT + math.sin(camera.rotate)
		WIDTH = WIDTH + math.cos(camera.rotate)
	end
	if love.keyboard.isDown('d') then 
		HEIGHT = HEIGHT - math.sin(camera.rotate)
		WIDTH = WIDTH - math.cos(camera.rotate)
	end
	if love.keyboard.isDown('w') then
		HEIGHT = HEIGHT + math.cos(camera.rotate)
		WIDTH = WIDTH + math.sin(camera.rotate)
	end
	if love.keyboard.isDown('s') then
		HEIGHT = HEIGHT - math.cos(camera.rotate)
		WIDTH = WIDTH - math.sin(camera.rotate)
	end
end

function dophysics(object)
	if object.a.x ~= 0 and object.colide.x == false then
		object.a.x = FRICTION + object.a.x
	end
	if object.a.y ~= -9.8 and object.colide.y== false then
		object.a.y = GRAVITY + object.a.y
	end

	object.v = object.v + object.a
	object.x = object.v + object.v
end

-- input stuffs
function love.keypressed(key)
	
end

function redraw(object)
	
end

function rotx(object)
	return((object.r.x^2+object.r.y^2)*math.cos(camera.rotate)+WIDTH)
end

function roty(object)
	return((object.r.x^2+object.r.y^2)*math.sin(camera.rotate)+HEIGHT)
end
