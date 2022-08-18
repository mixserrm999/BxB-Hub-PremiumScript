

if not game:IsLoaded() then game.Loaded:Wait() end

--[[ ============ < Functions > ============ ]]--

-- Set up content variables 
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

local st = getexploit()

local plr = game:GetService("Players").LocalPlayer



local placeid = game.PlaceId

local executor = identifyexecutor or getexecutor or getexecutorname
local userid = plr.UserId

executor = (type(executor) == "function" and executor()) or "Unknown"

local wwwjobid = game.JobId

-- Set up local variables
local ins = table.insert
local rem = table.remove


--[[ ============ < Consloe > ============ ]]--

local function rprint(color, msg) 
    rconsoleprint("@@"..color.."@@")
    rconsoleprint(msg)
end
local function check(color, msg) 
    rconsoleprint("@@"..color.."@@")
    rconsoleprint(msg)
end

-- Title
do
    rconsoleclear()
    rconsolename("BxB HUB  |  Console | FB : Boom WrkSs  | "..(DateTime.now():FormatUniversalTime("LL", "en-us")))
    

     rconsoleclear()
    rprint("GREEN",[[
                                ____       ____    _    _       _     
                               |  _ \     |  _ \  | |  | |     | |    
                               | |_) |_  _| |_) | | |__| |_   _| |__  
                               |  _ <\ \/ /  _ <  |  __  | | | | '_ \ 
                               | |_) |>  <| |_) | | |  | | |_| | |_) |
                               |____//_/\_\____/  |_|  |_|\__,_|_.__/ 
                                        
                                        
]])  
wait(.1)
rprint("BLUE",[[
                               -- = [*] +-+-+-+-+-+-+-+-+- [*] = --
                               -- = [*]                    [*] = --
                               -- = [*]       CREDIT       [*] = --
                               -- = [*]      _______       [*] = --
                               -- = [*]      BxB HUB       [*] = --
                               -- = [*]  FB : Boom WrkSs   [*] = --
                               -- = [*]   BxB All Script   [*] = --
                               -- = [*]                    [*] = --
                               -- = [*] +-+-+-+-+-+-+-+-+- [*] = --     
]])
                                                                                         
wait(.1)
 rprint("GREEN","Exploit : "..st)

-- STATUS
 rprint("LIGHT_BLUE","\n\n         Status Script \n\n")
 rprint("GREEN","[ * ]  :  Undetected\n")
 rprint("YELLOW","[ # ]  :  Risky\n")
 rprint("RED","[ X ]  :  Detected (Wait new update)\n")
--SCRIPT
 rprint("LIGHT_BLUE","\n         BxB Hub Game Support \n\n")
 rprint("GREEN","[*]")
 rprint("WHITE","  My Restaurant\n")
 rprint("GREEN","[*]")
 rprint("WHITE","  Bee Swarm Simulator \n")
--COMMANDS PREFIX
 rprint("LIGHT_BLUE","\n         Commands Prefix\n\n")
 rprint("GREEN","[ ! ]")
 rprint("WHITE","  Get Script\n")
 rprint("WHITE","  --> !MR = My Restaurant\n")
 rprint("WHITE","  --> !BSS = Bee Swarm Simulator\n")
 rprint("GREEN","\n[ . ]")
 rprint("WHITE","  Console Settings\n")

end

--commands

local commands = {}
local function addcmd(aliases, func)
    assert(type(aliases) == "table", "Invalid arg 1 supplied")
    assert(type(func) == "function", "Invalid arg 2 supplied")
    commands[aliases] = func
end

local function handlerequest(request)
    request = request:lower():split(" ")
    for i,v in pairs(commands) do
        if table.find(i, request[1]) then
            pcall(function() 
                v((function()
                    local t = {}
                    for ii,__ in pairs(request) do
                        if ii ~= 1 then table.insert(t, 1, request[ii]) end
                    end
                    return t;
                end)()) 
            end)
            write("\n")
            break;
        end
    end
    rprint("WHITE","")
    local input = rconsoleinput()
    handlerequest(input)
end

addcmd({"!MR"}, function(args)
rprint("GREEN","\nMy Restaurant is loaded..\n")
end)


-- logs
rprint("LIGHT_BLUE","\n\nLogs:")
game.Players.PlayerAdded:Connect(function(player)
rprint("BLUE","\n\nName  Player :  ")
rprint("GREEN",""..player.Name.."")
rprint("BLUE","  joined the game!")
rprint("GREEN","\nPlayers in Server : "..game.Players.NumPlayers .. "/"..game.Players.MaxPlayers)
end)
game.Players.PlayerRemoving:Connect(function(player)
rprint("BLUE","\nName  Player :  ")
rprint("RED",""..player.Name.."")
rprint("BLUE","  left the game!")
rprint("GREEN","\nPlayers in Server : "..game.Players.NumPlayers .. "/"..game.Players.MaxPlayers)
end)


handlerequest("")


