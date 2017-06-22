local blt = require "blt"

local t = blt( io.stdin:read("*a") )

--print(require"mini.tprint.better"(t, {inline=false}))

print( require"json".encode(t))
