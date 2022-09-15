-- Anti-Discord Server Invites
-- supported exploits: Synapse X
-- Made by just a tree#0556 for my Synapse fellas
-- Version: 2.1

-- Feel free to modify or improve it idc
-- Settings: ADSI_RetryIfFailed, ADSI_Attempts, ADSI_UseMessages, ADSI_ENABLED
-- Use getgenv() to set the settings
-- Recommended to put it in your autoexec folder

--[[ 
Change logs:

[FIXED] - the script (yes im dumb)
[REMOVED] - support for exploits other than Synapse X (fuck non-SynX kiddies)
[ADDED] - the "Copy the invite link" button (ONLY "IF ASDI_UseMessages" IS ENABLED)
[ADDED] - "getgenv().ASDI_LastInvite" variable

]]

if not syn then
    
    warn("Anti-Discord Server Invites | ERROR: | UNSUPPORTED EXPLOIT")
    return
    
end

if getgenv().ADSI_EXECUTED then
    
    warn("Anti-Discord Server Invites | ERROR: | ALREADY EXECUTED")
    return
    
end

if getgenv().ADSI_RetryIfFailed == nil or type(getgenv().ADSI_RetryIfFailed) ~= "boolean" then
    
    getgenv().ADSI_RetryIfFailed = false
    
end

if getgenv().ADSI_Attempts == nil or type(getgenv().ADSI_Attempts) ~= "number" then
    
    getgenv().ADSI_Attempts = 10
    
end

if getgenv().ADSI_UseMessages == nil or type(getgenv().ADSI_UseMessages) ~= "boolean" then
    
    getgenv().ADSI_UseMessages = true
    
end

if getgenv().ADSI_ENABLED == nil or type(getgenv().ADSI_ENABLED) ~= "boolean" then
    
    getgenv().ADSI_ENABLED = true
    
end

local targets = {
    "http://127.0.0.1:6463/rpc?v=1";
}
local loaded = false

local function message(set)
    
    if getgenv().ADSI_UseMessages then
        
        local success = pcall(function()
            
            game.StarterGui:SetCore("SendNotification", set)
            
        end)
        
        if not success then
            
            local suc = false
            
            repeat pcall(function() game.StarterGui:SetCore("SendNotification", set) suc = true end) task.wait() until suc
            
        end
        
    end
    
end

local callback = Instance.new("BindableFunction")
callback.OnInvoke = function()
    
    setclipboard(getgenv().ASDI_LastInvite)
    message({Title = "Anti-Discord Server Invites", Text = "Copied", Duration = 5})
    
end

local function disable()
    
    setreadonly(syn, false)
    local oldfunc = syn.request
    syn.request = newcclosure(function(data)
        
        if getgenv().ADSI_ENABLED then
            
            local args = data
            local caller = getcallingscript()
            
            if table.find(targets, args["Url"]) then
                
                getgenv().ASDI_LastInvite = "https://discord.gg/"..game:GetService("HttpService"):JSONDecode(args["Body"])["args"]["code"]
                
                warn("Anti-Discord Server Invites | HOOKED DISCORD INVITE | LINK:\nhttps://discord.gg/"..game:GetService("HttpService"):JSONDecode(args["Body"])["args"]["code"])
                message({Title = "Anti-Discord Server Invites", Text = "Hooked Discord invite\nWould you like to copy the invite's link?", Duration = 5, Button1 = "Copy", Callback = callback})
                
                return
                
            else
                
                for _, v in pairs(targets) do
                    
                    if string.match(string.lower(v), string.lower(args["Url"])) then
                        
                        getgenv().ASDI_LastInvite = "https://discord.gg/"..game:GetService("HttpService"):JSONDecode(args["Body"])["args"]["code"]
                        
                        warn("Anti-Discord Server Invites | HOOKED DISCORD INVITE | LINK:\nhttps://discord.gg/"..game:GetService("HttpService"):JSONDecode(args["Body"])["args"]["code"])
                        message({Title = "Anti-Discord Server Invites", Text = "Hooked Discord invite\nWould you like to copy the invite's link?", Duration = 5, Button1 = "Copy", Callback = callback})
                        
                        return
                        
                    else
                        
                        continue
                        
                    end
                    
                end
                
            end
            
            return oldfunc(args)
            
        else
            
            return oldfunc(args)
            
        end
        
    end)
    setreadonly(syn, true)
    
end

if getgenv().ADSI_RetryIfFailed then
    
    local success, errormessage = pcall(function()
        
        disable()
        
    end)
    
    if not success then
        
        local suc = false
        
        for i = 1, getgenv().ADSI_Attempts, 1 do
            
            local success, errormessage = pcall(function()
                
                disable()
                
            end)
            
            if not success then
                
                warn("Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR:\n"..errormessage)
                
            else suc = true loaded = true break end
            
            warn("Anti-Discord Server Invites | RETRIED TO DISABLE")
            
            task.wait(0.05)
            
        end
        
        if not suc then
            
            message({Title = "ERROR", Text = "Failed to disable Discord Server Invites", Duration = 5})
            
        end
        
    end
    
else
    
    local success, errormessage = pcall(function()
        
        disable()
        
    end)
    
    if not success then
        
        warn("Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR:\n"..errormessage)
        message({Title = "ERROR", Text = "Failed to disable Discord Server Invites\n"..errormessage, Duration = 5})
        
    else
        
        loaded = true
        
    end
    
end

if loaded then
    
    getgenv().ADSI_EXECUTED = true
    warn("Anti-Discord Server Invites\nThe script is loaded\nMade by just a tree#0556 for my Synapse fellas")
    message({Title = "Anti-Discord Server Invites", Text = "The script is loaded\nMade by just a tree#0556 for my Synapse fellas", Duration = 5})
    
end
