if not isfolder("assetCache") then -- checks if the function's cache folder exists
    makefolder("assetCache") -- creates the function's cache folder if one is not found
end

createAsset = function(url, name, ending) -- defines the function
    local filePath -- makes a local var for later use
    local splitUrl = string.split(url, "/") -- splits the input url into its parts
    local file = splitUrl[#splitUrl] -- fetches the last part of the url (usually where the file name is stored)
    local splitFile = string.split(file, ".") -- splits the file name and its extension
    local urlEnding = "." .. splitFile[#splitFile] -- fetches the file extension from the url
    local urlFileName = string.gsub(file, "."..urlEnding, "") -- fetches the files name from the url
    local request = game:HttpGet(url, true) -- makes a request for the needed asset
    if name == nil or name == "" and ending == nil or ending == "" then -- checks if there was a name or ending input to the function
        filePath = "assetCache/"..file -- sets the file path
        writefile(filePath, request) -- creates the file on the users computer
    end
    if name ~= nil and name ~= "" then -- checks if a name was supplied
        if ending == nil or ending == "" then -- checks if a file extension was supplied
            filePath = "assetCache/"..name..urlEnding -- sets the file path
            writefile(filePath, request) -- creates the file on the users computer
        end
        if ending ~= nil and ending ~= "" then -- checks if a file extension was supplied
            filePath = "assetCache/"..name..ending -- sets the file path
            writefile(filePath, request) -- creates the file on the users computer
        end
    end
    if ending ~= nil and ending ~= "" then -- checks if a file extension was supplied
        if name == nil or name == "" then -- checks if a name was supplied
            filePath = "assetCache/"..urlFileName..ending -- sets the file path
            writefile(filePath, request) -- creates the file on the users computer
        end
    end
    return filePath -- returns the file path as a string
end

return createAsset -- returns the function so it can be used with loadstring
