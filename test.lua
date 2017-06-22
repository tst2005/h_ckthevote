local balot = require "balot"

local t = balot( io.stdin:read("*a") )

--print(require"mini.tprint.better"(t, {inline=false}))

print( require"json".encode(t))
