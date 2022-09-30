--// Notification
local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
local NotificationHolder = Instance.new("ScreenGui")
NotificationHolder.Name = tostring(math.random())
NotificationHolder.Parent = game.CoreGui
NotificationHolder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local NotificationFrame = game:GetObjects("rbxassetid://6924028278")[1]
NotificationFrame.ZIndex = 1.5
NotificationFrame.Parent = NotificationHolder
script = NotificationFrame.NotifScript
local Notify = loadstring(NotificationFrame.NotifScript.Source)()
script = oldScript
local SolarisLib = {}
function SolarisLib:Notification(title, desc)
    Notify:New(title,desc)
end     
--// End Notification
--[[
    SolarisLib:Notification("[ BxB.xyz ]","Game Check  > "..info.Name)
    wait(5)
    NotificationHolder:Destroy()
]]]--
