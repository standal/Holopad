--# Add pastebin/ekn7fgXg "touchpoint"
--# Add pastebin/5UweQ8GF "holodeckicon" 
--# Add pastebin/8N4wsgmg "buttons"
--# Find an attached monitor, open modem and rednet!
--# Add wireless turtle pastebin/bwGkEmHx "autorun"
--# Monitor size 3X7
--# Run computer holopad
--# load the touchpoint API
--# By. Standal
os.loadAPI ("lib/touchpoint")


local
buttons = touchpoint.new ("monitor")
close = touchpoint.new ("monitor")
loading = touchpoint.new ("monitor")
t = touchpoint.new ("monitor")
mon = f.periphSearch ("monitor")
mon.setTextScale (0.5)
local modem = peripheral.wrap ("right")
t = touchpoint.new ("monitor")
rednet.open ("left")
active = false
program = 0

function closeHolodeck ()
	rs.setOutput ("back", false)
	t = loading
	t:draw ()
	drawUI ()
	rednet.broadcast (program)
	sleep (3)
	rs.setOutput ("bottom", true)
	sleep (3)
	rs.setOutput ("bottom", false)
	active = false
end

function loadHolodeck (n)
	t = loading
	t:draw ()
	drawUI ()
	program = n
	rednet.broadcast ("n")
	sleep (3)
	rs.setOutput ("bottom", true)
	sleep (3)
	rs.setOutput ("bottom", false)
	active = true
	rs.setOutput ("back", true)
end

math.randomseed (os.time ())
function writeNumbers ()
	term.write (math.random (1000, 9999) .. "   " .. math.random (100000, 999999) .. "  " .. math.random (10, 99) .. "  " .. math.random (1000, 9999) .. "  " .. math.random (1000, 9999) .. "  " .. math.random (1000, 9999) .. "  " .. math.random (1000, 9999) .. "  " .. math.random (10, 99))
end

function drawUI ()
	paintutils.drawFilledBox (1, 1, 8, 4, 6)
	paintutils.drawFilledBox (1, 6, 8, 9, 8)
	paintutils.drawFilledBox (2, 10, 8, 10, 8)
	paintutils.drawFilledBox (4, 11, 143, 11, 8)
	paintutils.drawFilledBox (1, 15, 8, 25, 16384)
	paintutils.drawFilledBox (1, 27, 8, 39, 2)
	paintutils.drawFilledBox (2, 14, 8, 14, 16384)
	paintutils.drawFilledBox (4, 13, 143, 13, 16384)
	local icon = paintutils.loadImage ("lib/holodeckicon")
	local buttons = paintutils.loadImage ("lib/buttons")
	paintutils.drawImage (icon, 98, 1)
	paintutils.drawImage (buttons, 60, 1)
	term.setTextColor (2)
	term.setBackgroundColor (32768)
	term.setCursorPos (12, 6)
	writeNumbers ()
	term.setCursorPos (12, 7)
	writeNumbers ()
	term.setCursorPos (12, 8)
	writeNumbers ()
	term.setCursorPos (12, 9)
	writeNumbers ()
	term.setBackgroundColor (2)
	term.setTextColor (32768)
	term.setCursorPos (67, 9)
	term.write (math.random (1000, 9999) .. "-" .. math.random (100, 999))
	term.setCursorPos (86, 4)
	term.write (math.random (1000, 9999) .. "-" .. math.random (100, 999))
	term.setBackgroundColor (8)
	term.setCursorPos (67, 4)
	term.write (math.random (1000, 9999) .. "-" .. math.random (100, 999))
	term.setCursorPos (86, 9)
	term.write (math.random (1000, 9999) .. "-" .. math.random (100, 999))
end

close:add ("Close", nil, 10, 15, 143, 37, colors.red, colors.red)
loading:add ("Loading...", nil, 10, 15, 143, 37, colors.gray, colors.gray)
r1 = "Room 1"
r2 = "Room 2"
r3 = "Room 3"
r4 = "Room 4"
r5 = "Room 5"
r6 = "Room 6"
buttons:add (r1, nil, 10, 15, 53, 25, 2, 2)
buttons:add (r2, nil, 55, 15, 98, 25, 2, 2)
buttons:add (r3, nil, 100, 15, 143, 25, 2, 2)
buttons:add (r4, nil, 10, 27, 53, 37, 8, 8)
buttons:add (r5, nil, 55, 27, 98, 37, 8, 8)
buttons:add (r6, nil, 100, 27, 143, 37, 8, 8)

while true do
	if active then
		t = close
	else
		t = buttons
	end
	t:draw ()
	term.redirect (mon)
	drawUI ()

	local event, p1, p2, p3, p4 = t:handleEvents (os.pullEvent ())
	if event == "modem_message" then
		if p4 == "close" and active then
			closeHolodeck ()
		elseif p4 == "p1" and not active then
			loadHolodeck (1)
		elseif p4 == "p2" and not active then
			loadHolodeck (2)
		elseif p4 == "p3" and not active then
			loadHolodeck (3)
		elseif p4 == "p4" and not active then
			loadHolodeck (4)
		elseif p4 == "p5" and not active then
			loadHolodeck (5)
		elseif p4 == "p6" and not active then
			loadHolodeck (6)
		end
	elseif event == "button_click" then
		if active then
			if p1 == "Close" then
				closeHolodeck ()
				rednet.broadcast ("rm7")
			end
		else
			if p1 == r1 then
				loadHolodeck (1)
				rednet.broadcast ("rm1")
			elseif p1 == r2 then
				loadHolodeck (2)
				rednet.broadcast ("rm2")
			elseif p1 == r3 then
				loadHolodeck (3)
				rednet.broadcast ("rm3")
			elseif p1 == r4 then
				loadHolodeck (4)
				rednet.broadcast ("rm4")
			elseif p1 == r5 then
				loadHolodeck (5)
				rednet.broadcast ("rm5")
			elseif p1 == r6 then
				loadHolodeck (6)
				rednet.broadcast ("rm6")
			end
		end
	end
end
