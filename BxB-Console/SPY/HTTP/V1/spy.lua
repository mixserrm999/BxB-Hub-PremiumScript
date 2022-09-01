local HttpSpy = loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Console/SPY/HTTP/V1/init.lua"))({
    AutoDecode = true, -- Automatically decodes JSON
    Highlighting = true, -- Highlights the output
    SaveLogs = true, -- Save logs to a text file
    CLICommands = true, -- Allows you to input commands into the console
    ShowResponse = true, -- Shows the request response
    BlockedURLs = {} -- Blocked urls
});

HttpSpy:HookSynRequest("https://httpbin.org/get", function(response) 
    response.Body = "hi";
    return response;
end);

print(syn.request({ Url = "https://httpbin.org/get" }).Body);
