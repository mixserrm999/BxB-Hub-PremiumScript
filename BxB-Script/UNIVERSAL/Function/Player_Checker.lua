
local players = game:GetService("Players")

local friendsId = 3658808246
local PlayersFriends = {}

local success, page = pcall(function() return players:GetFriendsAsync(friendsId) end)
if success then
   repeat
   	local info = page:GetCurrentPage()
   	for i, friendInfo in pairs(info) do
   		table.insert(PlayersFriends, friendInfo)
   	end
   	if not page.IsFinished then 
   		page:AdvanceToNextPageAsync()
   	end
   until page.IsFinished
end


for i,v in pairs(PlayersFriends) do
   print("Username = ".. v.Username.." | UserId = ".. v.Id)
end
