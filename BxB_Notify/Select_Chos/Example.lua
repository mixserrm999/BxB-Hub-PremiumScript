local notifLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB_Notify/Select_Chos/library.lua"))()

notifLib:CreatePromptNotif({
 TweenSpeed = 3,
 Title = "Prompt Notification",
 Text = "Paragraph Text",
 Duration = 5,
 Callback = function(Value)
   print(Value)
 end
})
