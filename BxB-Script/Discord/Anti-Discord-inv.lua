-- Anti-Discord Server Invites
-- Made by just a tree#0556 for my Synapse fellas
-- Version: 1.1

-- Feel free to modify or improve it idc
-- Settings: RetryIfFailed, Attempts, UseMessages
-- Use getgenv() to set settings
-- Recommended to put it in your autoexec folder
--[[ EXAMPLE

--loadstring and syn and syn.request

assert(loadstring,"UNSUPPORTED EXPLOIT")
loadstring(syn.request({
    ["Url"] = "https://pastebin.com/raw/Jmn3pBqH",
    ["Method"] = "GET"
    })
    ["Body"])()
]]--

--[[ 
Change logs:

Fixed settings

]]

if not syn then
    
    warn("Anti-Discord Server Invites | ERROR: | UNSUPPORTED EXPLOIT")
    return
    
end

if getgenv().EXECUTED then
    
    warn("Anti-Discord Server Invites | ERROR: | ALREADY EXECUTED")
    return
    
end

if type(getgenv().RetryIfFailed) == nil then
    
    getgenv().RetryIfFailed = false
    
end

if not type(getgenv().Attempts) == nil then
    
    getgenv().Attempts = 10
    
end

if not type(getgenv().UseMessages) == nil then
    
    getgenv().UseMessages = true
    
end

local targeturl = "http://127.0.0.1:6463/rpc?v=1"
local attempts = getgenv().Attempts
local retryiffailed = getgenv().RetryIfFailed
local usemessages = getgenv().UseMessages
local loaded = false

local function message(set)
    
    if usemessages == true then
        
        local success = pcall(function()
            
            game.StarterGui:SetCore("SendNotification", set)
            
        end)
        
        if not success then
            
            local suc = false
            
            repeat pcall(function() game.StarterGui:SetCore("SendNotification", set) suc = true end) task.wait() until suc
            
        end
        
    end
    
end

local function disable()
    
    setreadonly(syn, false)
    local oldfunc = syn.request
    syn.request = newcclosure(function(data)
        
        local args = data
        local caller = getcallingscript()
        
        if args["Url"] == targeturl then
            
            warn("Anti-Discord Server Invites | HOOKED DISCORD INVITE")
            return nil
            
        end
        
        return oldfunc(args)
        
    end)
    setreadonly(syn, true)
    
end

if retryiffailed then
    
    local success, errormessage = pcall(function()
        
        disable()
        
    end)
    
    if not success then
        
        local suc = false
        
        for i = 1, attempts, 1 do
            
            local success, errormessage = pcall(function()
                
                disable()
                
            end)
            
            if not success then
                
                warn("Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR: | "..errormessage)
                
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
        
        warn("Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR: | "..errormessage)
        message({Title = "ERROR", Text = "Failed to disable Discord Server Invites\n"..errormessage, Duration = 5})
        
    else
        
        loaded = true
        
    end
    
end

if loaded then
    
    getgenv().EXECUTED = true
    warn("Anti-Discord Server Invites\nThe script is loaded\nMade by just a tree#0556 for my Synapse fellas")
    message({Title = "Anti-Discord Server Invites", Text = "The script is loaded\n", Duration = 5})
    
end
