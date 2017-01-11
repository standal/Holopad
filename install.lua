-- holopad installation script
--
--

local libURL = "https://github.com/standal/Holopad/blob/master/lib/button.lua"
local libURL = "https://github.com/standal/Holopad/blob/master/lib/holodeckicon.lua"
local libURL = "https://github.com/standal/Holopad/blob/master/lib/touchpoint.lua"
local startupURL = "https://github.com/standal/Holopad/blob/master/holopad.lua"
local lib, startup
local libFile, startupFile

fs.makeDir("lib")

lib = http.get(libURL)
libFile = lib.readAll()

local file1 = fs.open("lib/f", "w")
file1.write(libFile)
file1.close()

startup = http.get(startupURL)
startupFile = startup.readAll()


local file2 = fs.open("startup", "w")
file2.write(startupFile)
file2.close()