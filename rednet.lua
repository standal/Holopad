--# Turtle program
--# By Standal
rednet.open ("left")
 
while true do
	id, message = rednet.receive ()
	if message == ("rm1") then
		turtle.select (1)
		turtle.drop ()
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)

	elseif message == ("rm2") then
		turtle.select (2)
		turtle.drop ()
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)

	elseif message == ("rm3") then
		turtle.select (3)
		turtle.drop ()
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)

	elseif message == ("rm4") then
		turtle.select (4)
		turtle.drop ()
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)

	elseif message == ("rm5") then
		turtle.select (5)
		turtle.drop ()
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)

	elseif message == ("rm6") then
		turtle.select (6)
		turtle.drop ()
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)

	elseif message == ("rm7") then
		turtle.suck ()
		turtle.drop ()
		sleep (3)
		redstone.setOutput ("front", true)
		sleep (3)
		redstone.setOutput ("front", false)
		turtle.suck ()
	end
end