-- holopad installation script
--
--
 
local touchpointURL = "https://raw.githubusercontent.com/standal/Holopad/master/lib/touchpoint.lua"
local buttonsURL = "https://raw.githubusercontent.com/standal/Holopad/master/lib/button.lua"
local holodeckiconURL = "https://raw.githubusercontent.com/standal/Holopad/master/lib/holodeckicon.lua"
local startupURL = "https://raw.githubusercontent.com/standal/Holopad/master/holopad.lua"
local lib, startup
local touchpointFile, buttonsFile, holodeckiconFile, startupFile
 
fs.makeDir ("lib")
 
lib = http.get (touchpointURL)
touchpointFile = lib.readAll ()
 
local file1 = fs.open ("lib/touchpoint", "w")
file1.write (touchpointFile)
file1.close ()
 
lib = http.get (buttonsURL)
buttonsFile = lib.readAll ()
 
local file2 = fs.open ("lib/buttons", "w")
file2.write (buttonsFile)
file2.close ()
 
lib = http.get (holodeckiconURL)
holodeckiconFile = lib.readAll ()
 
local file3 = fs.open ("lib/holodeckicon", "w")
file3.write (holodeckiconFile)
file3.close ()
 
startup = http.get (startupURL)
startupFile = startup.readAll ()
 
local file4 = fs.open ("startup", "w")
file4.write (startupFile)
file4.close ()
