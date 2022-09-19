function anti()
    local hook = hookfunction or hookfunc
    local Antiprint
    Antiprint = hook(print, function(Self, ...)
        return
    end)
    local Antiwarn
    Antiwarn = hook(warn, function(Self, ...)
        return
    end)
    local Antierror
    Antierror = hook(error, function(Self, ...)
        return
    end)
    local Antirconsoleprint
    Antirconsoleprint = hook(rconsoleprint, function(Self, ...)
        return
    end)
    local Antirconsoleinfo
    Antirconsoleinfo = hook(rconsoleinfo, function(Self, ...)
        return
    end)
    local Antirconsolewarn
    Antirconsolewarn = hook(rconsolewarn, function(Self, ...)
        return
    end)
    local Antirconsoleerr
    Antirconsoleerr = hook(rconsoleerr, function(Self, ...)
        return
    end)
    local Antirconsolename
    Antirconsolename = hook(rconsolename, function(Self, ...)
        return
    end)
    local Antihookfunction;
    Antihookfunction = hookfunction(hookfunction, function(Self, ...)
        return
    end)
    local Antihook;
    Antihook = hookfunc(hookfunc, function(Self, ...)
        return
    end)
end
anti()
anti()
