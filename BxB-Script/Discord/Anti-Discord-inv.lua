-- Anti-Discord Server Invites
-- Version: 1.1

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
    rconsoleprint('@@RED@@')
    rconsoleprint('Anti-Discord Server Invites | ERROR: | UNSUPPORTED EXPLOIT\n')
    warn("Anti-Discord Server Invites | ERROR: | UNSUPPORTED EXPLOIT")
    return
    
end

if getgenv().EXECUTED then
    rconsoleprint('@@RED@@')
rconsoleprint('Anti-Discord Server Invites | ERROR: | ALREADY EXECUTED\n')
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
            rconsoleprint('@@GREEN@@')
rconsoleprint('Anti-Discord Server Invites | HOOKED DISCORD INVITE\n')
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
                rconsoleprint('@@RED@@')
rconsoleprint('Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR: | '..errormessage.."\n")
                warn("Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR: | "..errormessage)
                
            else suc = true loaded = true break end
            rconsoleprint('@@BLUE@@')
rconsoleprint('Anti-Discord Server Invites | RETRIED TO DISABLE\n')
            warn("Anti-Discord Server Invites | RETRIED TO DISABLE")
            
            task.wait(0.05)
            
        end
        
        if not suc then
            rconsoleprint('@@RED@@')
rconsoleprint('Failed to disable Discord Server Invites')
            message({Title = "ERROR", Text = "Failed to disable Discord Server Invites", Duration = 5})
            
        end
        
    end
    
else
    
    local success, errormessage = pcall(function()
        
        disable()
        
    end)
    
    if not success then
        rconsoleprint('@@RED@@')
rconsoleprint('Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR: | '..errormessage.."\n")
        warn("Anti-Discord Server Invites | Failed to disable Discord Server Invites | ERROR: | "..errormessage)
        message({Title = "ERROR", Text = "Failed to disable Discord Server Invites\n"..errormessage, Duration = 5})
        
    else
        
        loaded = true
        
    end
    
end

if loaded then
    
    getgenv().EXECUTED = true
    rconsoleprint('@@Green@@')
rconsoleprint('Anti-Discord Server Invites\nThe script is loaded\n\n')
    warn("Anti-Discord Server Invites\nThe script is loaded")
    message({Title = "Anti-Discord Server Invites", Text = "The script is loaded\n", Duration = 5})
    
end
