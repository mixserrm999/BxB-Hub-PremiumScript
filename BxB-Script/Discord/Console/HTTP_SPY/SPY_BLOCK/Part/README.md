# HttpSpy
A powerful and highly efficient network debugging tool for Roblox (and exploits)

## Alert
This project will not be updated until the release of Synapse V3.

## Usage
> Be sure to execute the HttpSpy before the target script!

```lua
assert(rconsoleprint ~= nil, "your exploit doesnt have rconsoleprint")

if import then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua"))()
end

local uis = game:GetService("UserInputService")
local methodcolors = {
	GET = "light blue",
	POST = "light green",
	PATCH = "orange",
	HEAD = "magenta",
	DELETE = "red"
}
local hooks = {}
local hooked = {
	HttpGet = false,
	HttpGetAsync = false,
	HttpPost = false,
	HttpPostAsync = false,
	request = false
}
local loaded = false

local BLOCK_WEBHOOKS = true
local BLOCK_REQUESTS = true
local PAUSED = false

local print = rconsoleprint
local function color(c)
	print("@@"..c:upper():gsub(" ", "_").."@@")
end
local function prefix(text, _color, spaced, newline)
	color("light gray")
	print("[")
	print(spaced and " " or "")
	color(_color)
	print(text)
	print(spaced and " " or "")
	color("light gray")
	print("] ")
	print(newline and "\n" or "")
end
local function nameprefix(name, method)
	local spaces1 = 7 - method:len()
	local spaces2 = 21 - method:len() - spaces1 - name:len()
	for _ = 1, spaces1 do
		print(" ")
	end
	print(name)
	for _ = 1, spaces2 do
		print(" ")
	end
end
local function isblocked(url)
	return (BLOCK_WEBHOOKS and (url:find("webhook") or url:find("websec"))) or BLOCK_REQUESTS
end
local function hook(func, name, method, requestfunc)
	local old;old = hookfunction(func, requestfunc and function(data)
		local blocked = isblocked(data.Url)
		if not PAUSED then
			prefix(blocked and "BLOCKED" or "ALLOWED", blocked and "red" or "light green")
			prefix(data.Method, methodcolors[data.Method])
			nameprefix(name, data.Method)
			print(" | "..data.Url.."\n")
		end
		if blocked then
			return {
				StatusMessage = "Bad request",
				Success = false,
				StatusCode = 400,
				Body = "",
				Headers = {}
			}
		end
		return old(data)
	end or function(self, url)
		local blocked = isblocked(url)
		if not PAUSED then
			prefix(blocked and "BLOCKED" or "ALLOWED", blocked and "red" or "light green")
			prefix(method, methodcolors[method])
			nameprefix(name, method)
			print(" | "..url.."\n")
		end
		if blocked then
			return nil
		end
		return old(self, url)
	end)
	hooks[func] = old
	return old
end
local loading = false
local function start()
	if loading then return end
	loading = true
	rconsoleclear()
	prefix("http spy by zzerexx#3970", "cyan", true) prefix("v1.0.0", "cyan", true, true) print("\n")

	prefix("controls", "cyan", true, true)
	prefix("-", "light green") prefix("focus on the roblox window to use these controls", "yellow", true, true)
	prefix("!", "red") prefix("toggling any of the settings will clear your logs", "yellow", true, true)

	prefix("CTRL + 1", "light green", true)  print("         clear logs\n")
	prefix("CTRL + 2", "light green", true)  print("         pause/resume log        ") prefix(PAUSED and "PAUSED" or "RUNNING", PAUSED and "red" or "light green", false, true)
	prefix("CTRL + 3", "light green", true)  print("         block discord webhooks  ") prefix(BLOCK_WEBHOOKS and "YES" or "NO", BLOCK_WEBHOOKS and "light green" or "red", false, true)
	prefix("CTRL + 4", "light green", true)  print("         block all requests      ") prefix(BLOCK_REQUESTS and "YES" or "NO", BLOCK_REQUESTS and "light green" or "red", false, true)
	prefix("CTRL + BACKSPACE", "light green", true)  print(" unload http spy\n\n")

	prefix("request methods", "cyan", true, true)
	prefix("-", "light green") prefix("these are the methods that will be logged", "yellow", true, true)
	prefix("-", "light green") prefix("some methods may not work due to your exploit", "yellow", true, true)
	prefix("HttpGet", "light green", true) print("       ") prefix(hooked.HttpGet       and "YES" or "NO", hooked.HttpGet       and "light green" or "red", false, true)
	prefix("HttpGetAsync", "light green", true) print("  ") prefix(hooked.HttpGetAsync  and "YES" or "NO", hooked.HttpGetAsync  and "light green" or "red", false, true)
	prefix("HttpPost", "light green", true) print("      ") prefix(hooked.HttpPost      and "YES" or "NO", hooked.HttpPost      and "light green" or "red", false, true)
	prefix("HttpPostAsync", "light green", true) print(" ") prefix(hooked.HttpPostAsync and "YES" or "NO", hooked.HttpPostAsync and "light green" or "red", false, true)
	prefix("request", "light green", true) print("       ") prefix(hooked.request       and "YES" or "NO", hooked.request       and "light green" or "red", false, true) print("\n")
	
	prefix("request log", "cyan", true, true)
	loading = false
end

rconsolename("Http Spy // zzerexx#3970")

local suc, err = pcall(function()
	hooked.HttpGet = hook(game.HttpGet, "HttpGet", "GET", false)
	hooked.HttpGetAsync = hook(game.HttpGetAsync, "HttpGetAsync", "GET", false)
	hooked.HttpPost = hook(game.HttpPost, "HttpPost", "POST", false)
	hooked.HttpPostAsync = hook(game.HttpPostAsync, "HttpPostAsync", "POST", false)
	local a
	if syn then
		a = hook(syn.request, "syn.request", "", true)
	end
	if http then
		a = hook(http.request, "http.request", "", true)
	end
	for _,v in next, {"request", "http_request"} do
		if getgenv()[v] then
			a = hook(getgenv()[v], v, "", true)
		end
	end
	hooked.request = a
end)
if not suc then
	prefix("an error occurred while trying to load http spy: "..err, "red", true, true)
end

start()

local CTRL_DOWN = false
uis.InputBegan:Connect(function(i, gp)
	if not gp then
		local key = i.KeyCode.Name
		if key:find("Control") then
			CTRL_DOWN = true
		end
		if loaded and CTRL_DOWN then
			if key == "One" then
				start()
			elseif key == "Two" then
				PAUSED = not PAUSED
				start()
				--prefix("request log has been "..(PAUSED and "paused" or "resumed"), "cyan", true) print("\n")
			elseif key == "Three" then
				BLOCK_WEBHOOKS = not BLOCK_WEBHOOKS
				start()
			elseif key == "Four" then
				BLOCK_REQUESTS = not BLOCK_REQUESTS
				start()
			elseif key == "Backspace" then
				for func,original in next, hooks do
					loaded = false
					hookfunction(func, original)
				end
				if rconsoleclose then
					rconsoleclose()
				else
					prefix("http spy has been unloaded", "red", true)
				end
			end
		end
	end
end)
uis.InputEnded:Connect(function(i, gp)
	if not gp then
		if i.KeyCode.Name:find("Control") then
			CTRL_DOWN = false
		end
	end
end)
loaded = true
```
