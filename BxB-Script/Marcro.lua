--[[
Records:
- Mouse Cursor Movement
- Left Mouse Click
- Right Mouse Click
- Key Press (Not all keys A-Z,0-9, and Space)
- Camera Position/Movement
- Character Position
- Loopable
  Chat commands (case insensitive):
  load <filename> --> Loads a saved macro
  save <name> --> Saves macro to workspace folder
 
--]]

local binds = { -- Only set these to keys that you know you won't use
   ToggleRecording = "F", -- Start/stop recording inputs
   PlayRecording = "G", -- Start/stop playing a macro
   ToggleLoop = "H" -- Enable/disable looping
}


if getgenv().binds then return end
getgenv().binds = binds

loadstring(game:HttpGet(BxB_Record))()



local BxB_Record = ([[
local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local mouse = LocalPlayer:GetMouse()

local currentRecording = {inputBin = {},startingCFrame = nil,cameraCFrame = nil,name = "Recording1"}
local commands = {loadMacro = "load ",saveRecording = "save"}
local bin = {recording = false,playing = false,loop = false,loopPlaying = false,startTime = 0,keyBin = HttpService:JSONDecode(game:HttpGet("https://pastebin.com/raw/Gc7tL3h2"))}

local newInput = function(data) -- Logs key/mouse/camera input
    if bin.recording then
        if not input then
            input = ""
        end
        local recordedData = {
            Time = tick() - bin.startTime -- To know when the input should began when being played
        }
        for key,value in pairs(data) do
            recordedData[key] = value -- Set extra data
        end
        table.insert(currentRecording.inputBin,recordedData) -- Add to recorded inputs table
    end
end

bin.play = function()
    local character = LocalPlayer.Character 
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(unpack(currentRecording.startingCFrame)) -- Set character to starting position
        workspace.CurrentCamera.CFrame = CFrame.new(unpack(currentRecording.cameraCFrame)) -- Set camera to starting position
        bin.playing = true

        -- Start playing recording
        for index,input in ipairs(currentRecording.inputBin) do -- Iterate through all inputs from the recording
            if not bin.playing then return end
            coroutine.resume(coroutine.create(function()
                task.wait(input.Time) -- Waits for when it's the appropriate time to simulate the input
                if not bin.playing then return end
                if input.Type == "KeyInput" then
                    if not input.Release then
                        keypress(input.Input) -- Key down
                    else
                        keyrelease(input.Input) -- Key up
                    end

                elseif input.Type == "MouseMoveInput" then
                    mousemoveabs(input.MouseX,input.MouseY) -- Moves cursor

                elseif input.Type == "MouseButton1" then
                    if not input.Release then
                        mouse1press() -- Left click press
                    else 
                        mouse1release() -- Left click release
                    end

                elseif input.Type == "MouseButton2" then
                    if not input.Release then
                        mouse2press() -- Right click press
                    else
                        mouse2release() -- Right click release
                    end

                elseif input.Type == "CameraMove" then
                    local camera = workspace:FindFirstChild("CurrentCamera") or workspace:FindFirstChild("Camera")
                    if camera then
                        camera.CFrame = CFrame.new(unpack(input.CFrame)) -- Simulate camera cframe
                    end
                end

                if index == #currentRecording.inputBin then
                    bin.playing = false
                end
            end))
        end
    end
end

-- Mouse and Keyboard Input Detections
mouse.KeyDown:Connect(function(key) -- Key press detect
    -- Record key bind pressed
    if key == binds.ToggleRecording:lower() then
        if bin.playing then return end -- Won't record if there's a macro playing
        if not bin.recording then -- Start recording
            currentRecording = {inputBin = {},startingCFrame = {Position = {X=0,Y=0,Z=0},LookVector = {X=0,Y=0,Z=0}},cameraCFrame = {Position = {X=0,Y=0,Z=0},LookVector = {X=0,Y=0,Z=0}},name = "Recording 1"}
            local character = LocalPlayer.Character 
            local startCFrame = CFrame.new(0,0,0)
            if character and character:FindFirstChild("HumanoidRootPart") then
                startCFrame = character.HumanoidRootPart.CFrame
            end
            currentRecording.startingCFrame = {startCFrame:GetComponents()}
            currentRecording.cameraCFrame = {workspace.CurrentCamera.CFrame:GetComponents()}

            bin.recording = true
            bin.startTime = tick()
            bin:chatMessage({Text = "Recording started!",Color = Color3.new(255,255,0)})
        else -- End recording
            bin.recording = false
            bin:chatMessage({Text = "Recording ended!",Color = Color3.new(255,255,0)})
        end
        return
    
    -- Play key bind pressed
    elseif key == binds.PlayRecording:lower() then -- Play macro
        if bin.playing then 
            bin.playing = false -- Cancel playing recording
            return
        end
        if bin.recording then return end -- Won't play if it is being recorded
        if bin.loop then
            bin.loopPlaying = true
        end
        bin:play()
        return
    
    -- Loop key bind pressed
    elseif key == binds.ToggleLoop:lower() then
        if not bin.loop then
            bin.loop = true -- Enable looping
            bin:chatMessage({Text = "Looping enabled!",Color = Color3.fromRGB(168, 50, 168)})
        else
            bin.loop = false -- Disable looping
            bin.loopPlaying = false
            bin:chatMessage({Text = "Looping disabled!",Color = Color3.fromRGB(168, 95, 50)})
        end
    end
    newInput({Input = bin.keyBin[key:upper()] or bin.keyBin[key],Release = false,Type = "KeyInput"}) -- If it isn't a bind key it'll add to recorded inputs
end)
mouse.KeyUp:Connect(function(key) -- Key release detect
    for _,keyBind in pairs(binds) do
        if keyBind:lower() == key:lower() then
            return -- If it's a bind key then it won't log it as an input
        end
    end
    newInput({Input = bin.keyBin[key:upper()],Release = true,Type = "KeyInput"})
end)
mouse.Move:Connect(function() -- Cursor move detect
    newInput({MouseX = mouse.X,MouseY = mouse.Y,Type = "MouseMoveInput"})
end)
mouse.Button1Down:Connect(function() -- Left mouse press detect
    newInput({Type = "MouseButton1",Release = false})
end)
mouse.Button1Up:Connect(function() -- Left mouse release detect
    newInput({Type = "MouseButton1",Release = true})
end)
mouse.Button2Down:Connect(function() -- Right mouse press detect
    newInput({Type = "MouseButton2",Release = false})
end)
mouse.Button2Up:Connect(function() -- Right mouse release detect
    newInput({Type = "MouseButton2",Release = true})
end)

-- Record camera movement
coroutine.resume(coroutine.create(function()
    local oldCFrame = nil
    while true do wait()
        local camera = workspace:FindFirstChild("CurrentCamera") or workspace:FindFirstChild("Camera")
        if camera and camera.CFrame ~= oldCFrame and bin.recording then
            oldCFrame = camera.CFrame 
            newInput({Type = "CameraMove",CFrame = {camera.CFrame:GetComponents()}})
        end
    end
end))

bin.chatMessage = function(self,data)
    return game:GetService("StarterGui"):SetCore( "ChatMakeSystemMessage",  { Text = data.Text, Color = data.Color or Color3.new(255,255,255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size18} )
end

-- Chat commands
local old = nil
old = hookmetamethod(game,"__namecall",function(object,...)
    local args = {...}
    if getnamecallmethod() == "FireServer" and tostring(object) == "SayMessageRequest" then
        local message = args[1]
        if message:sub(1,#commands.loadMacro):lower() == commands.loadMacro then -- load command
            if bin.recording then
                bin:chatMessage({Text = "Stop your recording before loading another!",Color = Color3.new(0,255,0)})
                return
            end

            local macro = message:sub(#commands.loadMacro+1)
            if isfile("Recordings\\"..macro..".json") then
                currentRecording = HttpService:JSONDecode(readfile("Recordings\\"..macro..".json")) -- Load macro recording
                bin.playing = false
                bin:chatMessage({Text = macro.." has been loaded!",Color = Color3.new(0,255,0)})
            else
                bin:chatMessage({Text = "Macro not found!",Color = Color3.new(255,0,0)})
            end
            return

        elseif message:sub(1,#commands.saveRecording):lower() == commands.saveRecording then -- save command
            if bin.recording then
                bin:chatMessage({Text = "Stop your recording before saving it!",Color = Color3.new(0,255,0)})
                return
            end
            
            local filename = message:sub(#commands.saveRecording+2)..".json"
            bin:chatMessage({Text = "Saved recording to "..filename,Color = Color3.new(0,255,0)})
            writefile("Recordings\\"..filename,HttpService:JSONEncode(currentRecording)) -- Save to file
            return
        end
    end
    return old(object,...)
end)

-- Loop
while wait() do
    if bin.loop and not bin.playing and bin.loopPlaying then
        bin:play()
    end
end
]]
