_G.Amount = 10

local keys = {}
for _ = 1,_G.Amount do
--// if [ false = KEY ] else [ true = {KEY} ]
table.insert(keys,game:GetService('HttpService'):GenerateGUID(false)) -- BIG TEXT/No {}
  --table.insert(keys,game:GetService("HttpService"):GenerateGUID(false):lower()) -- Small Text 
end
setclipboard(table.concat(keys,"\n"))
print(table.concat(keys,"\n"))
--// Webhook \\--

getgenv().weburl = "https://discordapp.com/api/webhooks/1042447828242407494/RfSY8XrvdIuxTyyR5V1M-gQQzBfC3m24Phe-rvb86fJq7MZIgGbxXvWuBIZKkR8LEqOX"
_G.Amount = 25

local keys = {}
for _ = 1,_G.Amount do
--// if [ false = KEY ] else [ true = {KEY} ]
table.insert(keys,game:GetService('HttpService'):GenerateGUID(false)) -- BIG TEXT/No {}
  --table.insert(keys,game:GetService("HttpService"):GenerateGUID(false):lower()) -- Small Text 
end
if _G.Amount >= 26 then
    warn("Please select an amount less than 26")
    error("Please select an amount less than 26")
end
local function webhook()
	pcall(function()
		local url = tostring(getgenv().weburl) --webhook
		print("webhook?")
		if url == "" then
			return
		end 


		local data = {
			["content"] = "",
			["username"] = "BxB.xyz | Keys Generate Service",
			["avatar_url"] = "https://tse4.mm.bing.net/th?id=OIP.BpmEX2MHrd0IZnD0yibKlAHaEy&pid=Api&P=0",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "✅  BxB.xyz Keys Generate Service ✅",
						["icon_url"] = "https://cdn2.iconfinder.com/data/icons/social-flat-buttons-3/512/anonymous-512.png"
					},
					["description"] = "",
					["color"] = 110335,


					["fields"] = {
						{
							["name"] = "Keys Generate : ",
							["value"] = "```"..table.concat(keys,"\n").."```",
							["inline"] = true
						},
						
					}
				}
			}
		}

		local porn = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local sex = {Url = url, Body = porn, Method = "POST", Headers = headers}
		warn("Sending keys generate to webhook...")
		request(sex)
	end)
end

webhook()
