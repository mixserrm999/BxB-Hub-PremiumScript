warn("Requiring API")do
   loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Restaurant-Tycoon-2/CODE/AutoCollect/API.lua"))();
end warn("API Loaded")

local child = getgenv().object.child
local descendant = getgenv().object.descendant
local check = getgenv().object.check

local Tycoon = game.Players.LocalPlayer.Tycoon.Value
descendant.foreach(Tycoon.Items.OftenFiltered.Surface,"Bill",function(Bill)
   local Settings = {
           ["name"] = "CollectBill",
           ["model"] = Bill.Parent
   }
   
   game.ReplicatedStorage.Events.ClientTycoonInput:FireServer(Tycoon,Settings)
end)

local Connection,Code = descendant.on_add(Tycoon.Items.OftenFiltered.Surface,function(Bill)
   check.it(Bill.Name == "Bill",function()
       local Settings = {
               ["name"] = "CollectBill",
               ["model"] = Bill.Parent
       }
       
       game.ReplicatedStorage.Events.ClientTycoonInput:FireServer(Tycoon,Settings)
   end)
end)
