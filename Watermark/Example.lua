repeat wait() until game:IsLoaded()

library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

local watermark = library:Watermark("grave.xyz | https://discord.gg/2f3CjGtyjc")

local xyz = library:Load{
    Name = "grave.xyz | kaizen",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "json",
    Folder = "grave" 
}

local x = xyz:Tab("Tab")

getgenv().settings = {
    ['farm_mobs'] = false;
    ['chosen_mob'] = nil;
    ['auto_equip'] = false;
    ['a_attack'] = false;
    ['weapon'] = false;
}

local weapons = {}
for i,v in pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren()) do
    if v:IsA('Tool') and v.Name ~= 'Curse Sense' then
        if not table.find(weapons, v.Name) then
            table.insert(weapons, v.Name)
        end
    end
end

local client = game.Players.LocalPlayer;
local char = client.Character
local root = char.HumanoidRootPart
local rs = game:GetService('RunService')
local functions = functions or {}
local flags = {
    mobs = {
        'Fly Head';
        'Crabion';
        'Rogue Sorcerer';
        'Gnasher';
        'Armed Bandit';
        'Fire Shroom';
        'Junior';
        'Hanamato';
        'Rogue Bandit';
        'Saku';
        'Senior';
    };
    settings = {
        ['anti_falldamage'] = false;
        ['inf_cursedenergy'] = false;
        ['infinite_stamina'] = false;
        ['anti_rag'] = false;
        autostats = {
            ['Melee'] = false;
            ['Stamina'] = false;
            ['Defense'] = false;
            ['Curse'] = false;
            ['Weapon'] = false;
            ['Amount'] = 1;
        };
    };
}
