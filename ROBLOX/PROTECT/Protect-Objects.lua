-- Roblox Script security module to protect objects

local security = {}

security.h = getfenv(0)['hookmetamethod'] -- // The function used to hook ("override") metamethods.
security.c = getfenv(0)['checkcaller'] -- // The function which determines if a thread is running on a game thread or exploit thread.
security.m = {'__index', '__newindex', '__namecall'} -- // Metamethods to spoof.
security.r = {game, workspace} -- // Whitelist (security.protect will ignore)

local find = table.find

function security.protect(obj)
	if typeof(obj) == 'Instance' then 
		if find(security.r, obj) then
			return
		end
		task.synchronize()
		for i, v in pairs(security.m) do
			task.spawn(function()
				local m; m = security.h(game, v, function(self, ...)
					local x = m(self, ...)
					if not c() and typeof(x) == 'Instance' and x == obj then
						return nil
					end
					return x
				end)
			end)
		end
		task.desynchronize()
	end
end

return security
