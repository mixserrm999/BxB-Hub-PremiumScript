writefile("test.txt", "")

local pages = game:GetService("AssetService"):GetGamePlacesAsync()
while true do
     for _,place in pairs(pages:GetCurrentPage()) do
          print("Name: " .. place.Name)
          print("PlaceId: " .. tostring(place.PlaceId))
     end
     if pages.IsFinished then
          -- we reached the last page of results
          break
     end
     pages:AdvanceToNextPageAsync()
end


game:GetService("LogService").MessageOut:Connect(function(message, type)
    appendfile("test.txt", message.."\n")
end)
