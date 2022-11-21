--[[
local Library = {} -- coded this while jamming shinitai chan - jack @ 10:06AM PST, 3/24/2021 (took me 3 hrs 22 seconds (i had to recode it))
Library.flags = {}

local TweenService = game:GetService'TweenService'
local UDim2_new, Color3_new = UDim2.new, Color3.fromRGB

function Library:Create(Class, Properties)
    Properties = Properties or {}

    local Obj = Instance.new(Class)

    for K, V in next, Properties do
        local Success, _ = pcall(function()
            local I = Obj[K]
        end)

        if Success then
            Obj[K] = V;
        end
    end

    return Obj
end

local UI = Library:Create('ScreenGui', {
    Name = 'UI',
    Parent = game:GetService'CoreGui'
})

local Colors = {
    Main = Color3_new(30, 30, 30),
    MainBorder = Color3_new(20, 20, 20),
    Mid = Color3_new(25, 25, 25),
    Border = Color3_new(40, 40, 40)
}

local AddSection = function(UI, Parameters)
    local Holder = UI.Background.Holder.Sections
        
    local Section = Library:Create('Frame', {
        Name = 'Section',
        BackgroundColor3 = Colors.MainBorder,
        BorderColor3 = Colors.Border,
        Parent = Holder
    }); Library:Create('ScrollingFrame', {
        Parent = Section,
        Name = 'Main',
        BorderSizePixel = 0,
        BackgroundColor3 = Colors.MainBorder,
        Position = UDim2_new(0, 0, 0.06, 0),
        Size = UDim2_new(1, 0, 0.94, 0),
        ClipsDescendants = true,
        BottomImage = 'http://www.roblox.com/asset/?id=58757773',
        MidImage = 'http://www.roblox.com/asset/?id=58757773',
        TopImage = 'http://www.roblox.com/asset/?id=58757773',
        ScrollBarImageColor3 = Color3_new(117, 117, 117),
        ScrollBarThickness = 5
    }); Library:Create('UIListLayout', {
        Parent = Section.Main,
        SortOrder = Enum.SortOrder.LayoutOrder
    }); Library:Create('TextLabel', {
        Parent = Section,
        Name = 'Text',
        TextSize = 14,
        TextColor3 = Color3_new(255, 255, 255),
        Font = Enum.Font.Code,
        BackgroundColor3 = Colors.MainBorder,
        BorderSizePixel = 0,
        Position = UDim2_new(0.075, 0, -0.03, 0),
        Size = UDim2_new(0, (9 * Parameters.SectionText:len()), 0, 15),
        Text = Parameters.SectionText
    })

    for Type, Info in next, Parameters do
        if Type:match('Toggle') then
            local Toggle = Library:Create('Frame', {
                Parent = Section.Main,
                Name = Type,
                Size = UDim2_new(1, 0, 0.069, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
            }); Library:Create('ImageButton', {
                Parent = Toggle,
                Name = 'Button',
                BackgroundColor3 = Colors.Mid,
                BorderColor3 = Colors.Border,
                BorderSizePixel = 1,
                Size = UDim2_new(0.12, 0, 0.8, 0),
                Position = UDim2_new(0.04, 0, 0.1, 0),
                Text = '',
                TextSize = 14,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = (Info[2] and 0) or 1,
                Image = 'http://www.roblox.com/asset/?id=4776914445',
                ScaleType = Enum.ScaleType.Fit,
            }); Library:Create('TextLabel', {
                Parent = Toggle,
                Name = 'Label',
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2_new(0.2, 0, 0.1, 0),
                Size = UDim2_new(0.7, 0, 0.8, 0),
                Text = Info[1] or 'Toggle',
                Font = Enum.Font.Code,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3_new(255, 255, 255)
            })
            
            local Flag = Info[3]
            Library.flags[Flag] = Info[2]
            
            Toggle.Button.MouseButton1Click:Connect(function()
                Library.flags[Flag] = not Library.flags[Flag]
                local Bool = Library.flags[Flag]
                
                Toggle.Button.ImageTransparency = (Bool and 0) or 1

                Info[4](Bool)
            end)
        elseif Type:match('Box') then
            local Box = Library:Create('Frame', {
                BackgroundTransparency = 1,
                Parent = Section.Main,
                Name = Type,
                Size = UDim2_new(1, 0, 0.11, 0)
            }); Library:Create('TextLabel', {
                BackgroundTransparency = 1,
                Parent = Box,
                Size = UDim2_new(0.9, 0, 0.3, 0),
                Position = UDim2_new(0.06, 0, 0.1, 0),
                Font = Enum.Font.Code,
                Text = Info[1],
                TextColor3 = Color3_new(255, 255, 255),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            }); Library:Create('TextBox', {
                Font = Enum.Font.Code,
                Text = '',
                PlaceholderText = 'Input',
                PlaceholderColor3 = Color3_new(178, 178, 178),
                TextColor3 = Color3_new(255, 255, 255),
                TextSize = 14,
                BackgroundTransparency = 0,
                BackgroundColor3 = Colors.Mid,
                BorderColor3 = Colors.Border,
                BorderSizePixel = 1,
                Position = UDim2_new(0.04, 0, 0.44, 0),
                Size = UDim2_new(0.9, 0, 0.43, 0),
                Parent = Box
            })
            
            Box.TextBox.FocusLost:Connect(function()
                Info[2](Box.TextBox.Text)
            end)
        elseif Type:match('Button') then
            local Button = Library:Create('Frame', {
                Name = Type,
                Size = UDim2_new(1, 0, 0.069, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Parent = Section.Main
            }); Library:Create('TextButton', {
                Parent = Button,
                BackgroundColor3 = Colors.Mid,
                BorderColor3 = Colors.Border,
                Position = UDim2_new(0.04, 0, 0.1, 0),
                Size = UDim2_new(0.9, 0, 0.8, 0),
                Font = Enum.Font.Code,
                Text = Info[1],
                TextSize = 14,
                TextColor3 = Color3_new(255, 255, 255)
            })
            
            Button.TextButton.MouseButton1Click:Connect(Info[2])
        end
    end

    return Section
end

Library.Notify = {}
local Notify = Library.Notify
Notify.Notifications = {}

function Notify:new(Title, Text, Time)
    Title = Title or 'Notification'; Text = Text or 'Blacks in the premice!'; Time = Time or 5;

    local Notification = {}

    local Object = Library:Create('TextButton', {
        Name = 'Notification',
        BackgroundColor3 = Colors.MainBorder,
        BorderColor3 = Colors.Border,
        BackgroundTransparency = 0,
        BorderSizePixel = 2,
        Position = UDim2_new(1.5, -270, 1, -104),
        Size = UDim2_new(0, 270, 0, 80),
        Text = ''
    }); Library:Create('Frame', {
        Name = 'Topbar',
        Position = UDim2_new(0, 0, 0, 0),
        Size = UDim2_new(1, 0, 0.3, 0),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3_new(255, 255, 255),
        Parent = Object
    }); Library:Create('UIGradient', {
        Parent = Object.Topbar,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3_new(129, 129, 129)),
            ColorSequenceKeypoint.new(0.128, Color3_new(40, 40, 40)),
            ColorSequenceKeypoint.new(1, Color3_new(20, 20, 20))
        }),
        Rotation = 90
    }); Library:Create('TextLabel', {
        BackgroundTransparency = 1,
        Position = UDim2_new(0, 0, 0, 0),
        Size = UDim2_new(1, 0, 0.8, 0),
        Font = Enum.Font.Code,
        Text = ' ' .. Title,
        TextColor3 = Color3_new(255, 255, 255),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Name = 'Title',
        Parent = Object.Topbar
    }); Library:Create('TextLabel', {
        Text = Text,
        TextColor3 = Color3_new(255, 255, 255),
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextSize = 15,
        Font = Enum.Font.Code,
        BackgroundTransparency = 1,
        Position = UDim2_new(0.026, 0, 0.299, 0),
        Size = UDim2_new(0.98, 0, 0.7, 0),
        Parent = Object
    })

    Notification.Object = Object

    function Notification:Close()
        return TweenService:Create(Object, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
            Position = UDim2.new(1.3, 0, Object.Position.Y.Scale, 0)
        }):Play()
    end

    Object.MouseButton1Click:Connect(function()
        Notification:Close()
    end)

    Object.Parent = UI

    table.insert(Notify.Notifications, Notification)

    for I, FoundNotification in next, Notify.Notifications do
        if FoundNotification ~= Notification then
            TweenService:Create(FoundNotification.Object, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
                Position = UDim2_new(1, -270, 1, (-104 - (90 * (#Notify.Notifications - I))))
            }):Play()
        end
    end

    TweenService:Create(Object, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
        Position = UDim2_new(1, -270, 1, -104)
    }):Play()

    coroutine.wrap(function()
        wait(Time)

        if Notification then
            Notification:Close()

            local Obj = Notification.Object

            table.remove(Notify.Notifications, table.find(Notify.Notifications, Notification))

            wait(0.5)

            Obj:Destroy()
        end
    end)()

    return Notification
end

function Library:new(Parameters)
    Parameters = Parameters or {
        Name = 'dot_mp4 wuz here :D',
        Tab = {
            Text = 'stuffz',
            Section1 = {
                SectionText = 'sec',
                Toggle = {
                    'zup',
                    true,
                    'flag1',
                    function(bool)
                        print('zup toggle set to: ', bool)
                    end
                },
                Box = {
                    'print text',
                    function(str)
                        print(str)
                    end
                },
                Button = {
                    'balls',
                    function()
                        local Player = game:GetService'Players'.LocalPlayer
                        if Player.Character then
                            Player.Character:ClearAllChildren()
                        end
                    end
                },
                NotifButton = {
                    'notif',
                    function()
                        Notify:new('Test', 'test', 3)
                    end
                }
            }
        }
    }

    local Background = self:Create('Frame', {
        Name = 'Background',
        Size = UDim2_new(0, 385, 0, 263),
        Position = UDim2_new(0.5, 0, 0.5, 0),
        BackgroundColor3 = Colors.Main,
        BorderColor3 = Colors.MainBorder,
        BorderSizePixel = 2,
        Active = true,
        Selectable = true,
        Draggable = true,
        Parent = UI
    })

    local Topbar = self:Create('Frame', {
        Parent = Background,
        Name = 'Topbar',
        BackgroundColor3 = Color3_new(255, 255, 255),
        BorderSizePixel = 0,
        Position = UDim2_new(0, 0, 0, 0),
        Size = UDim2_new(0, 385, 0, 25)
    }); self:Create('UIGradient', {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Colors.MainBorder),
            ColorSequenceKeypoint.new(0.356, Colors.MainBorder),
            ColorSequenceKeypoint.new(1, Colors.Main)
        }),
        Rotation = 90,
        Parent = Topbar
    }); self:Create('TextLabel', {
        Parent = Topbar,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2_new(0, 200, 0, 25),
        Position = UDim2_new(0.018, 0, 0, 0),
        Font = Enum.Font.Code,
        Text = Parameters.Name,
        TextColor3 = Color3_new(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local Detail = self:Create('Frame', {
        Parent = Background,
        Name = 'Detail',
        Position = UDim2_new(1, -318, 0, 37),
        Size = UDim2_new(0, 293, 0, 15),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3_new(255, 255, 255),
    }); self:Create('UIGradient', {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Colors.MainBorder),
            ColorSequenceKeypoint.new(0.541, Colors.Mid),
            ColorSequenceKeypoint.new(1, Colors.Main)
        }),
        Rotation = -90,
        Parent = Detail
    })

    local Holder = self:Create('Frame', {
        Parent = Background,
        Name = 'Holder',
        BackgroundColor3 = Colors.MainBorder,
        BorderColor3 = Colors.Border,
        BorderSizePixel = 1,
        Size = UDim2_new(0, 371, 0, 205),
        Position = UDim2_new(0, 7, 1, -212)
    }); self:Create('Frame', {
        Parent = Holder,
        Name = 'Sections',
        Size = UDim2_new(0, 353, 0, 186),
        Position = UDim2_new(0.024, 0, 0.049, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Colors.Mid
    }); self:Create('UIGridLayout', {
        Parent = Holder.Sections,
        CellSize = UDim2_new(0.493, 0, 1, 0)
    }); self:Create('TextButton', {
        Parent = Background,
        Name = 'Exit',
        Size = UDim2_new(0, 24, 0, 24),
        Position = UDim2_new(0.92, 0, 0.106, 0),
        BorderSizePixel = 1,
        BorderColor3 = Colors.Border,
        BackgroundColor3 = Colors.MainBorder,
        Text = 'X',
        TextColor3 = Color3_new(255, 255, 255),
        TextSize = 8
    }); self:Create('TextLabel', {
        Parent = Background,
        Name = 'Label',
        Size = UDim2_new(0, 60, 0, 22),
        Position = UDim2_new(0, 7, 0, 30),
        TextColor3 = Color3_new(255, 255, 255),
        BorderSizePixel = 1,
        BorderColor3 = Colors.Border,
        BackgroundColor3 = Colors.MainBorder,
        Text = Parameters.Tab.Text or 'Main',
        Font = Enum.Font.Code,
        TextSize = 14
    })

    self:Create('Frame', {
        Name = 'Connector',
        Parent = Background.Exit,
        BackgroundColor3 = Colors.MainBorder,
        BorderSizePixel = 0,
        ZIndex = 2,
        Size = UDim2_new(1.1, 0, 0.2, 0),
        Position = UDim2_new(-0.1, 0, 0.97, 0)
    }); self:Create('Frame', {
        Name = 'Connector',
        Parent = Background.Label,
        BackgroundColor3 = Colors.MainBorder,
        BorderSizePixel = 0,
        ZIndex = 2,
        Size = UDim2_new(1.1, 0, 0.2, 0),
        Position = UDim2_new(0, 0, 0.97, 0)
    })

    UI.Background.Exit.MouseButton1Click:Connect(function()
        UI:Destroy()
    end)

    local Sections = {}; do
        for Index, Info in next, Parameters.Tab do
            if Index:lower():match'section' and #Sections < 2 then
                Sections[#Sections+1] = Info
            end
        end
    end

    for _, Info in next, Sections do
        AddSection(UI, Info)
    end

    return UI
end

return Library



]]--




local UI = loadstring(game:HttpGet('https://raw.githubusercontent.com/antisteal/antisteal-main/master/ui.lua', true))()

local Players = game:GetService'Players'
local LocalPlayer = Players.LocalPlayer

local HttpService = game:GetService'HttpService'
local IsA, WaitForChild = game.IsA, game.WaitForChild

local RunService = game:GetService'RunService'
local MarketplaceService = game:GetService'MarketplaceService'

local Rand = Random.new()
local NextInt = Rand.NextInteger

local Settings = {
    Encode = true,
    Hex = true,
    Message = 'i am cool (me: ' .. LocalPlayer.Name .. ')',
    AssetId = ''
}

local SaveSettings = function()
    writefile('AntistealSettings.json', HttpService:JSONEncode(Settings))
end

if not isfile('AntistealSettings.json') then
    SaveSettings()
end

Settings = HttpService:JSONDecode(readfile('AntistealSettings.json'))

local RemoteArg = (game.PlaceId == 455366377 or game.PlaceId == 4669040 and 'play') or 'PlaySong'

local Encode = function(AssetId)
    Settings.AssetId = AssetId
    return game:HttpPost('https://dot-mp4.dev/free/anti-steal.php', HttpService:JSONEncode(Settings))
end

local SyncTime = 0
local Sync = function(Time)
    local Character = LocalPlayer.Character
    if not Character then
        return UI.Notify:new('Warning', 'No Character.')
    end

    local Selected = Character:FindFirstChildOfClass'Tool'
    if not Selected then
        return UI.Notify:new('Warning', 'No tool to sync from found.')
    end

    local Sound; do
        repeat
            local SelectedDescendants = Selected:GetDescendants()
            for I = 1, #SelectedDescendants do
                local V = SelectedDescendants[I]
                if IsA(V, 'Sound') and V.IsLoaded and V.TimeLength > 0 and V.SoundId:match('DMakTbZ') then
                    Sound = V; break;
                end
            end
            wait(.06)
        until Sound
    end

    local CharacterDescendants = Character:GetDescendants()
    for I = 1, #CharacterDescendants do
        local V = CharacterDescendants[I]
        if IsA(V, 'Sound') then
            V.TimePosition = Time or (math.round(Sound.TimePosition) - .5)
        end
    end
end

local MassPlay = function(AssetId)
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid = Character:FindFirstChildOfClass('Humanoid')
        if Humanoid then
            Humanoid:UnequipTools()
            
            local EncodedId = Encode(AssetId)
            if EncodedId:match'Error:' then
                return UI.Notify:new('Failed', 'Your audio didnt encode properly.')
            end

            local Tools = {}; do
                for _, Tool in next, LocalPlayer.Backpack:GetChildren() do
                    if Tool.Name:lower():match('boombox') then
                        Tools[#Tools+1] = Tool
                    end
                end
            end

            local Selected = Tools[1]

            for _, Tool in next, Tools do
                Tool.Parent = Character
            end

            wait(.2)

            for _, Tool in next, Tools do
                local Remote = Tool:FindFirstChildOfClass('RemoteEvent')
                if Remote then
                    Remote:FireServer(RemoteArg, EncodedId)
                end
            end

            wait(2)

            Sync()
        end
    end
end

local Duping, DupeAmount = false, 8

local Dupe = function(Amount)
    UI.Notify:new('Dupe', ('Amount: %s'):format(Amount))

    Duping = true

    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = WaitForChild(Character, 'Humanoid', 10)

    if not Humanoid then
        return UI.Notify:new('Warning', 'No compatible humanoid found.')
    end

    local Root = WaitForChild(Character, 'HumanoidRootPart', 10)

    if not Root then
        return UI.Notify:new('Warning', 'No root found.')
    end

    do
        local FoundTools = {}
        Humanoid:UnequipTools()

        for _, Tool in next, LocalPlayer.Backpack:GetChildren() do
            if Tool.Name:lower():match('boombox') then
                table.insert(FoundTools, Tool)
            end
        end

        if #FoundTools < 1 then
            return UI.Notify:new('Error', 'You do not have any compatible tools to dupe.')
        end
    end

    local FoundTools = {}

    local RCF = Root.CFrame

    local GrabTool = function(Tool)
        Tool.Handle.Anchored = false

        Tool.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame

        pcall(firetouchinterest, Root, Tool.Handle, 0)
    end

    for IDX = 1, Amount do
        if not Duping then
            break
        end

        local CCF = CFrame.new(NextInt(Rand, -2e4, 2e4), 2e4, NextInt(Rand, -2e4, 2e4))

        wait(.2)

        Root.CFrame = CCF

        wait(.2)

        Root.Anchored = true
        
        wait(.2)

        for _, Tool in next, LocalPlayer.Backpack:GetChildren() do
            if Tool.Name:lower():match'boombox' then
                Tool.Parent = Character
                Tool.Handle.Anchored = true
                table.insert(FoundTools, Tool)
            end
        end

        wait(.2)

        for I = 1, #FoundTools do
            Root.CFrame = Root.CFrame
            FoundTools[I].Parent = workspace
        end

        wait(.2)

        Character:BreakJoints()

        Character = LocalPlayer.CharacterAdded:Wait()
        LocalPlayer.CharacterAppearanceLoaded:Wait()

        Root = WaitForChild(Character, 'HumanoidRootPart')
        Humanoid = WaitForChild(Character, 'Humanoid')
    end

    UI.Notify:new('Dupe complete.', ('Finished with %s tools. %s of them were stolen.'):format(#FoundTools, (function() 
        local StolenTools = 0
        
        for _, Tool in next, FoundTools do
            if Tool.Parent ~= workspace and Tool.Parent ~= Character and Tool.Parent ~= LocalPlayer.Backpack then
                StolenTools = StolenTools + 1
            end
        end

        if StolenTools == #FoundTools then
            return 'All'
        end

        if StolenTools == 0 then
            return 'None'
        end

        return tostring(StolenTools)
    end)()))

    for _, Tool in next, FoundTools do
        GrabTool(Tool)
    end

    Root.CFrame = RCF
end

local ASUI = UI:new({
    Name = 'antisteal v7 [discontinued]',
    Tab = {
        Text = 'Main',
        Section2 = {
            SectionText = 'Other',
            MassPlayButton = {
                'Mass Play',
                function()
                    MassPlay(Settings.AssetId)
                end
            },
            DupeAmountBox = {
                'Dupe Amount [D: 8]',
                function(Amount)
                    DupeAmount = tonumber(Amount) or 8
                end
            },
            DupeButton = {
                'Dupe',
                function()
                    Dupe(DupeAmount)
                end
            },
            CDupeButton = {
                'Cancel Dupe',
                function()
                    Duping = false
                end
            },
            SyncTimeBox = {
                'Sync Time [D: 0]',
                function(Time)
                    SyncTime = tonumber(Time) or nil
                end
            },
            SyncButton = {
                'Sync',
                function()
                    Sync(SyncTime)
                end
            }
        },
        Section1 = {
            SectionText = 'Anti-Log',
            AssetBox = {
                'Set Asset Id',
                function(AssetId)
                    if tonumber(AssetId) and pcall(MarketplaceService.GetProductInfo, MarketplaceService, tonumber(AssetId)) and MarketplaceService:GetProductInfo(tonumber(AssetId)).Name then
                        UI.Notify:new('Success', 'Your selected AssetId has been set to "' .. AssetId .. '"', 5)
                        Settings.AssetId = AssetId
                        return
                    end
                        
                    UI.Notify:new('Failed', 'Not a valid AssetId', 5)
                end
            },
            EncodeToggle = {
                'Encode Baits',
                Settings.Encode,
                'Encode',
                function(Bool)
                    Settings.Encode = Bool
                    SaveSettings()
                end
            },
            HexToggle = {
                'Hex',
                Settings.Hex,
                'Hex',
                function(Bool)
                    Settings.Hex = Bool
                    SaveSettings()
                end
            },
            MessageBox = {
                'Custom Message',
                function(Message)
                    Settings.Message = Message
                end
            },
            PlayButton = {
                'Play',
                function()
                    local Character = LocalPlayer.Character
                    if Character then
                        local Radio = Character:FindFirstChildOfClass'Tool' or (function() 
                            for _, Tool in next, LocalPlayer.Backpack:GetChildren() do
                                if Tool.Name:lower():match'boombox' then
                                    return Tool
                                end
                            end
                        end)()

                        if Radio then
                            Radio.Parent = Character
                            local Remote = Radio:FindFirstChildOfClass'RemoteEvent'
                            if Remote then
                                local EncodedId = Encode(Settings.AssetId)

                                if EncodedId and not EncodedId:match'Error:' then
                                    return Remote:FireServer(RemoteArg, EncodedId)
                                end

                                return UI.Notify:new('Failed', 'Your audio didnt encode properly.')
                            end

                            return UI.Notify:new('Failed', 'Your radio is incompatible.')
                        end

                        return UI.Notify:new('Failed', 'Your radio is incompatible or none have been found.')
                    end
                end
            }
        }
    }
})

local UserInputService = game:GetService'UserInputService'

UserInputService.InputBegan:Connect(function(InputObject)
    if not UserInputService:GetFocusedTextBox() then
        if InputObject.KeyCode == Enum.KeyCode.J then
            ASUI.Enabled = not ASUI.Enabled 
        end
    end
end)
