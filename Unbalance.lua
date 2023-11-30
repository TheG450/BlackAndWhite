repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
if game.PlaceId == 8829364740 or game.PlaceId == 9032150459 then
    for i, v in pairs(game:GetService("Workspace").Map.Ores:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Base") then
            v:destroy()
        end
    end
end
wait(5)
_G.Setting = {
	Weapon = "...",
	Angle = "...",
	Type = "...",
    Ores = "...",
    WebhookLink = "",
    BossList = "...",
    PortalList = "...",
    ModeList = "...",
    WageList = "...",
	Distance = "10",
    Wakspeed = "25",
    Jumppower = "50",
    ModeSummer = "...",
	Equip = false,
	Teleport = false,
	Attack = false,
    Walk = false,
    Jump = false,
    AutoOre = false,
    Webhook = false,
    TM = false,
    Join = false,
    Vote = false,
    FarmPortal = false,
    Shoot = false,
    AutoAllOre = false,
    OP = false,
    FarmStrongHold = false,
    Summer = false,
    Halloween = false,
    BW = false,
    AutoBuySummer = false,
}
_G.PositionFake1 = {
    Cobalt = "-4108.9292, 82.5383987, 120.870003, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Crystal = "-4159.65967, 81.4133148, 97.6509705, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Diamond = "-4108.9292, 82.5384369, 148.870026, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    ["Forbidden Crystal"] = "-4108.9292, 81.9384689, -66.1299133, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    ["Gemstone of Hatred"] = "-4108.47949, 81.9384079, 23.0016785, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    ["Gemstone of Purity"] = "-4108.47949, 81.9384079, 37.0016747, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Gold = "-4108.9292, 82.5384369, 162.870026, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Hatrite = "-4108.9292, 82.5384979, -5.12997389, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Hellite = "-4108.9292, 82.5384979, -34.1299057, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Hevenite = "-4108.9292, 82.5384979, -19.1299744, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Iron = "-4147.38184, 82.0132904, 97.019043, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Mithril = "-4108.9292, 82.5384979, 64.8700256, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Moonstone = "-4108.9292, 81.9384689, -50.1299133, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Oureclasium = "-4123.9292, 82.5383987, 120.870003, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Purite = "-4108.9292, 82.5384979, 8.87002563, 0, 0, 1, 0, 1, -0, -1, 0, 0",
    Titanium = "-4108.9292, 82.5383987, 78.8700027, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Titanstone = "-4108.9292, 82.5384369, 175.870041, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Tungsten = "-4108.9292, 82.5383987, 92.8700027, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Viridis = "-4108.47949, 81.9384079, 107.001678, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
    Adamantine = "-4108.9292, 82.5383987, 50.8700027, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07",
}
local FileName = tostring(game.Players.LocalPlayer).."_Settings.Blobby"
function SaveSetting()
	local json
	local HttpService = game:GetService("HttpService")
	if(writefile) then
		json = HttpService:JSONEncode(_G.Setting)
		makefolder("SkirtHub")
		writefile("SkirtHub\\"..FileName, json)
	else
		warn("ERROR:Cant Save your Settings")
	end
end
function LoadSetting()
	local HttpService = game:GetService("HttpService")
	if(readfile and isfile and isfile("SkirtHub\\"..FileName)) then
		_G.Setting = HttpService:JSONDecode(readfile("SkirtHub\\"..FileName))
		print("Setting Lodded...")
	end
end
local weapon = {}
local Player = game:GetService("Players").LocalPlayer
local defaultSpeed = Player.Character.Humanoid.WalkSpeed
local defaultJump = Player.Character.Humanoid.JumpPower
local webhookSent = false
local hopChecked = false
local TeleportChecked = false
local TalkChecked = false
function weaponListInsert()
    for i,v in pairs(Player.Backpack:GetDescendants())do
        if v:IsA("Tool") and v.Enabled == true then
            table.insert(weapon,v.Name)
        end
    end
end
function weaponListRemove()
    if weapon ~= nil then
        for i = #weapon, 1, -1 do
            table.remove(weapon, i)
        end
    end
end
function attack(Name)
    pcall(function()
        for i=1,5 do
            task.spawn(function()
                Player.Character[Name].RemoteFunction:InvokeServer("hit", {100000000,1})
            end)
        end
    end)
end
function tween(Para)
	Distance = (Para.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance <= 200 then
		Speed = 150
	elseif Distance >= 400 then
		Speed = 250
	end
	game:GetService("TweenService"):Create(
		game.Players.LocalPlayer.Character.HumanoidRootPart,
		TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		{CFrame = Para}
	):Play()
end
weaponListInsert()
LoadSetting()
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Unbalanced War",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}
GUI:Credit{
	Name = "Creater",
	Description = "Script By.TheG450",
	V3rm = "https://v3rmillion.net/member.php?action=profile&uid=548518",
	Discord = "GZE450#6591"
}
local Tab1 = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://4034483344"
}
local Tab2 = GUI:Tab{
	Name = "Ores",
	Icon = "rbxassetid://12814035449"
}
local Tab3 = GUI:Tab{
	Name = "Player",
	Icon = "rbxassetid://13289762774"
}
local Tab4 = GUI:Tab{
	Name = "Webhook",
	Icon = "rbxassetid://7744394226" 
}
local Tab5 = GUI:Tab{
	Name = "Portal",
	Icon = "rbxassetid://6723742952" 
}
local Tab6 = GUI:Tab{
	Name = "Premium",
	Icon = "rbxassetid://11860847878" 
}
local Weapon = Tab1:Dropdown{
    Name = "Weapon",
    StartingText = _G.Setting.Weapon,
    Description = nil,
    Items = weapon,
    Callback = function(item)
        _G.Setting.Weapon = item
        SaveSetting()
    end
}
Tab1:Button{
	Name = "Refesh Weapon",
	Description = nil,
	Callback = function()
        weaponListRemove()
        weaponListInsert()
        Weapon:Clear()
        wait(0.2)
        Weapon:AddItems(weapon)
    end
}
Tab1:Toggle{
	Name = "Auto Equip",
	StartingState = _G.Setting.Equip,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Equip = state
        SaveSetting()
    end
}
local TeleportAngles = Tab1:Dropdown{
    Name = "Teleport Angles",
    StartingText = _G.Setting.Angle,
    Description = nil,
    Items = {
        {"Over","Over"},
        {"Under","Under"},
        {"Behide","Behide"},
        {"Font","Font"}
    },
    Callback = function(item)
        _G.Setting.Angle = item
        SaveSetting()
    end
}
local TeleportType = Tab1:Dropdown{
    Name = "Teleport Type",
    StartingText = _G.Setting.Type,
    Description = nil,
    Items = {
        {"InstantTeleport","InstantTeleport"},
        {"TweenTeleport","TweenTeleport"},
    },
    Callback = function(item)
        _G.Setting.Type = item
        SaveSetting()
    end
}
Tab1:Slider{
	Name = "Distance",
	Default = _G.Setting.Distance,
	Min = 1,
	Max = 50,
	Callback = function(state)
        _G.Setting.Distance = state
        SaveSetting()
    end
}
Tab1:Toggle{
	Name = "Auto Teleport",
	StartingState = _G.Setting.Teleport,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Teleport = state
        SaveSetting()
    end
}
Tab1:Toggle{
	Name = "Auto Attack",
	StartingState = _G.Setting.Attack,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Attack = state
        SaveSetting()
    end
}
Tab1:Toggle{
	Name = "Auto Shoot",
	StartingState = _G.Setting.Shoot,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Shoot = state
        SaveSetting()
    end
}
Tab1:Toggle{
	Name = "OP Attack!",
	StartingState = _G.Setting.OP,
	Description = nil,
	Callback = function(state) 
        _G.Setting.OP = state
        SaveSetting()
    end
}
Tab2:button({
    Name = "How to use AutoOre",
    Callback = function()
        Tab2:prompt{
            Title = "How to use",
            Text = "Use in Private Server Only",
            Buttons = {
                Ok = function()
                    Tab2:prompt{
                        Followup = true,
                        Title = "Your Understand?",
                        Text = "",
                        Buttons = {
                            Yes = function()
                                return true
                            end,
                            No = function()
                                Player:kick("You aren't stupid")
                            end,
                        }
                    }
                end,
            }
        }
    end,
})
local OresList = Tab2:Dropdown{
    Name = "Ores",
    StartingText = _G.Setting.Ores,
    Description = nil,
    Items = {
        {"Iron", "Iron"},
        {"Gold", "Gold"},
        {"Diamond", "Diamond"},
        {"Cobalt", "Cobalt"},
        {"Crystal", "Crystal"},
        {"Viridis", "Viridis"},
        {"Oureclasium", "Oureclasium"},
        {"Tungsten", "Tungsten"},
        {"Titanium", "Titanium"},
        {"Mithril", "Mithril"},
        {"Adamantine", "Adamantine"},
        {"Titanstone", "Titanstone"},
        {"Gemstone of Purity", "Gemstone of Purity"},
        {"Gemstone of Hatred", "Gemstone of Hatred"},
        {"Purite", "Purite"},
        {"Hatrite", "Hatrite"},
        {"Hevenite", "Hevenite"},
        {"Moonstone", "Moonstone"},
        {"Hellite", "Hellite"},
        {"Forbidden Crystal", "Forbidden Crystal"},
        {"Duranite", "Duranite"},
        {"Aurium", "Aurium"},
        {"Lanite", "Lanite"},
    },
    Callback = function(item)
        _G.Setting.Ores = item
        SaveSetting()
    end
}
Tab2:Toggle{
	Name = "Auto Ore",
	StartingState = _G.Setting.AutoOre,
	Description = nil,
	Callback = function(state) 
        _G.Setting.AutoOre = state
        SaveSetting()
    end
}
Tab2:Toggle{
	Name = "Auto All Ores",
	StartingState = _G.Setting.AutoAllOre,
	Description = nil,
	Callback = function(state) 
        _G.Setting.AutoAllOre = state
        SaveSetting()
    end
}
Tab2:Button{
	Name = "Teleport to the Beneath",
	Description = nil,
	Callback = function() 
        if game.PlaceId == 8829364740 then
            for i, v in pairs(game:GetService("Workspace").Map.BeneathTeleporter:GetDescendants()) do
                if v.Name == "pad" and v:FindFirstChild("TouchInterest") then
                    v.Transparency = 1
                    v.CanCollide = false
                    v.SurfaceLight.Enabled = false
                    v.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        else
            GUI:Notification{
                Title = "Alert",
                Text = "Use At The Caverns Only!",
                Duration = 3,
                Callback = function() end
            }
        end
    end
}
Tab2:Button{
	Name = "Teleport to Ancient Pedestal",
	Description = nil,
	Callback = function() 
        if game.PlaceId == 9032150459 then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1031.87207, 246.237793, 772.087097, -0.998878658, -8.04917804e-08, 0.0473438241, -8.0310258e-08, 1, 5.73636916e-09, -0.0473438241, 1.92774219e-09, -0.998878658)
        else
            GUI:Notification{
                Title = "Alert",
                Text = "Use At The Beneath Only!",
                Duration = 3,
                Callback = function() end
            }
        end
    end
}
Tab2:Button{
	Name = "Teleport to NULL",
	Description = nil,
	Callback = function() 
        if game.PlaceId == 9032150459 then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1196.56628, 213.199951, -783.372498, 0.999356329, -5.46281278e-08, -0.0358734354, 5.39082663e-08, 1, -2.10339426e-08, 0.0358734354, 1.90865279e-08, 0.999356329)
        else
            GUI:Notification{
                Title = "Alert",
                Text = "Use At The Beneath Only!",
                Duration = 3,
                Callback = function() end
            }
        end
    end
}
Tab2:Button{
	Name = "Full Bright",
	Description = nil,
	Callback = function() 
        game.Lighting.GlobalShadows = true
        game.Lighting.Ambient = Color3.new(1,1,1)
        game.Lighting.FogEnd = 1000000
    end
}
Tab3:Slider{
	Name = "Amount",
	Default = _G.Setting.Wakspeed,
	Min = 1,
	Max = 500,
	Callback = function(state)
        _G.Setting.Wakspeed = state
        SaveSetting()
    end
}
Tab3:Toggle{
	Name = "Walkspeed",
	StartingState = _G.Setting.Walk,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Walk = state
        SaveSetting()
    end
}
Tab3:Slider{
	Name = "Amount",
	Default = _G.Setting.Jumppower,
	Min = 1,
	Max = 300,
	Callback = function(state)
        _G.Setting.Jumppower = state
        SaveSetting()
    end
}
Tab3:Toggle{
	Name = "Jump Power",
	StartingState = _G.Setting.Jump,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Jump = state
        SaveSetting()
    end
}
Tab3:Button{
	Name = "Join lowest players server",
	Description = nil,
	Callback = function() 
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
        return Http:JSONDecode(Raw)
        end
        local Server, Next; repeat
        local Servers = ListServers(Next)
        Server = Servers.data[1]
        Next = Servers.nextPageCursor
        until Server
        TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end
}
Tab4:Textbox{
	Name = "Webhok",
	Callback = function(text) 
        _G.Setting.WebhookLink = text
        SaveSetting()
    end
}
local Boss = Tab4:Dropdown{
	Name = "Boss List",
	StartingText = _G.Setting.BossList,
	Description = nil,
	Items = {
        {"None", "None"},
		{"Rain", "Rain"},
        {"The Controller", "The Controller"},
        {"The Paladin", "The Paladin"},
        {"The Ripper", "The Ripper"},
        {"Starfarer", "Starfarer"},
        {"Basilisk", "Basilisk"},
        {"Katharos, the Pure", "Katharos, the Pure"},
        {"Atrocitus, The Corrupted", "Atrocitus, The Corrupted"},
        {"Virtue, Disciple of Heaven", "Virtue, Disciple of Heaven"},
        {"Belial, Envoy of Hell", "Belial, Envoy of Hell"},
        {"Uriel, The Gatekeeper of Heaven", "Uriel, The Gatekeeper of Heaven"},
        {"Beelzebub, The Beast of Gluttony", "Beelzebub, The Beast of Gluttony"},
        {"Equinox Praetor", "Equinox Praetor"},
        {"Benedictus, The Avatar of Luminosity", "Benedictus, The Avatar of Luminosity"},
        {"Astaroth, The Monarch of Darkness", "Astaroth, The Monarch of Darkness"},
	},
	Callback = function(item)
        _G.Setting.BossList = item
        SaveSetting()
    end
}
Tab4:Toggle{
	Name = "Travelling Merchant",
	StartingState = _G.Setting.TM,
	Description = nil,
	Callback = function(state) 
        _G.Setting.TM = state
        SaveSetting()
    end
}
Tab4:Toggle{
	Name = "Webhook",
	StartingState = _G.Setting.Webhook,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Webhook = state
        SaveSetting()
    end
}
Tab4:Button{
	Name = "Test Webhook",
	Description = nil,
	Callback = function() 
        local url = _G.Setting.WebhookLink
        local data = {
        ["content"] = "",
        ["embeds"] = {
            {
                ["title"] = "***Game: Balanced Craftwars Overhaul***",
                ["description"] = "@everyone".."\n\n".."**Test: ** " .."Work!!".."\n"
                                    .."**Time: **"..game:GetService("Workspace").ServerAge.Value.."\n"
                                    .."```".."\n"
                                    .."game:GetService"..'('..'"'.."TeleportService"..'"'..')'..":TeleportToPlaceInstance"..'('..tostring(game.PlaceId)..", "..'"'..tostring(game.JobId)..'"'..", ".."game.Players.LocalPlayer"..")".."\n"
                                    .."```".."",
                ["type"] = "rich",
                ["color"] = tonumber(0x00000),
                ["image"] = {
                    ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                        tostring(game:GetService("Players").LocalPlayer.Name)
                }
            }
        }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = {
        ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local HOOK = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(HOOK)
    end
}
local Portal = Tab5:Dropdown{
	Name = "Portal List",
	StartingText = _G.Setting.PortalList,
	Description = nil,
	Items = {
        {"None","None"},
        {"Aurora Glacier", "auroraglacierteleporter"},
		{"Ring of Fire", "ringoffireteleporter"},
        {"The Blue Sea", "blueseateleporter"},
        {"Eye of the Storm", "eosteleporter"},
        {"Atlas Awakener", "atlasteleporter"},
        {"Khrysos Temple", "khrysosteleporter"},
        {"Helio Vasilias", "solarteleporter"},
	},
	Callback = function(item)
        _G.Setting.PortalList = item
        SaveSetting()
    end
}
local Mode = Tab5:Dropdown{
	Name = "Mode List",
	StartingText = _G.Setting.ModeList,
	Description = nil,
	Items = {
        {"Standard Mode","Standard"},
        {"Torment Mode", "Torment"}, 
	},
	Callback = function(item)
        _G.Setting.ModeList = item
        SaveSetting()
    end
}
local Wage = Tab5:Dropdown{
	Name = "Wage List",
	StartingText = _G.Setting.WageList,
	Description = nil,
	Items = {
        {"The Regular","Standard"},
        {"The Investor", "DoubleCash"},
        {"The Kleptomaniac", "LegendaryItem"},
	},
	Callback = function(item)
        _G.Setting.WageList = item
        SaveSetting()
    end
}
Tab5:Toggle{
	Name = "Auto Vote",
	StartingState = _G.Setting.Vote,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Vote = state
        SaveSetting()
    end
}
Tab5:Toggle{
	Name = "Auto Join",
	StartingState = _G.Setting.Join,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Join = state
        SaveSetting()
    end
}
Tab5:Toggle{
	Name = "Auto Farm",
	StartingState = _G.Setting.FarmPortal,
	Description = nil,
	Callback = function(state) 
        _G.Setting.FarmPortal = state
        SaveSetting()
    end
}
local ModeSummer = Tab6:Dropdown{
	Name = "Mode List",
	StartingText = _G.Setting.ModeSummer,
	Description = nil,
	Items = {
        {"Standard Mode","Standard"},
        {"Torment Mode", "Torment"}, 
	},
	Callback = function(item)
        _G.Setting.ModeSummer = item
        SaveSetting()
    end
}
Tab6:Toggle{
	Name = "Continue When Boss WIP",
	StartingState = _G.Setting.BW,
	Description = nil,
	Callback = function(state) 
        _G.Setting.BW = state
        SaveSetting()
    end
}
Tab6:Toggle{
	Name = "Auto Buy Abitration/Time Piercer",
	StartingState = _G.Setting.AutoBuySummer,
	Description = nil,
	Callback = function(state) 
        _G.Setting.AutoBuySummer = state
        SaveSetting()
    end
}
Tab6:Toggle{
	Name = "Auto Event Summer",
	StartingState = _G.Setting.Summer,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Summer = state
        SaveSetting()
    end
}
Tab6:Toggle{
	Name = "Auto Event Halloween",
	StartingState = _G.Setting.Halloween,
	Description = nil,
	Callback = function(state) 
        _G.Setting.Halloween = state
        SaveSetting()
    end
}
Tab6:Toggle{
	Name = "Auto StrongHold",
	StartingState = _G.Setting.FarmStrongHold,
	Description = nil,
	Callback = function(state) 
        _G.Setting.FarmStrongHold = state
        SaveSetting()
    end
}
--------------------------------------------------------------------------------------------------------------------------//
function DiscordHook(Link, Tags ,Boss, Shop)
    local url = _G.Setting.WebhookLink
    local data = {
    ["content"] = "",
    ["embeds"] = {
        {
            ["title"] = "***Game: Balanced Craftwars Overhaul***",
            ["description"] = Tags.."\n\n".."**Username:** " .."||"..game.Players.LocalPlayer.Name.."||".."\n"
                                .."**Boss: **"..Boss.."\n"
                                .."**Travelling Merchant: **"..Shop.."\n"
                                .."**Rank: **"..game:GetService("Players").LocalPlayer.leaderstats.Rank.Value.."\n"
                                .."**Cash: **"..game:GetService("Players").LocalPlayer.leaderstats.Cash.Value.."\n"
                                .."**Time: **"..game:GetService("Workspace").ServerAge.Value.."\n"
                                .."**OverWorld: **"..tostring(game:GetService("Workspace").Overworld.Value)..""
                                .."```".."\n"
                                .."game:GetService"..'('..'"'.."TeleportService"..'"'..')'..":TeleportToPlaceInstance"..'('..tostring(game.PlaceId)..", "..'"'..tostring(game.JobId)..'"'..", ".."game.Players.LocalPlayer"..")".."\n"
                                .."```".."",
            ["type"] = "rich",
            ["color"] = tonumber(0x00000),
            ["image"] = {
                ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                    tostring(game:GetService("Players").LocalPlayer.Name)
            }
        }
    }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
    ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local HOOK = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(HOOK)
end
function BuySummer(para1,para2)
    local vim = game:GetService'VirtualInputManager'
    local virtualUser = game:GetService('VirtualUser')
    local save = para1
    local buy = para2
    local savebt = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
    vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
    wait(1)
    vim:SendMouseButtonEvent(buy.AbsolutePosition.X+buy.AbsoluteSize.X/2,buy.AbsolutePosition.Y+50,0,true,buy,1)
    vim:SendMouseButtonEvent(buy.AbsolutePosition.X+buy.AbsoluteSize.X/2,buy.AbsolutePosition.Y+50,0,false,buy,1)
    wait(5)
    vim:SendMouseButtonEvent(savebt.AbsolutePosition.X+savebt.AbsoluteSize.X/2,savebt.AbsolutePosition.Y+50,0,true,savebt,1)
    vim:SendMouseButtonEvent(savebt.AbsolutePosition.X+savebt.AbsoluteSize.X/2,savebt.AbsolutePosition.Y+50,0,false,savebt,1)
    wait(1)
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.name == "Azure Orb" then
            v.Parent = game.Players.LocalPlayer.Character
            wait(0.1)
            game.Players.LocalPlayer.Character["Azure Orb"].RemoteEvent:FireServer()
        end
    end
    wait(2)
    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
    wait(0.5)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    ChatBar.Text = "Confirm"
    wait(0.5)
    virtualUser:SetKeyDown('0x0D')
    wait(0.1)
    virtualUser:SetKeyUp('0x0D')
    wait(0.5)
end
function Noti(number)
    GUI:Notification{
        Title = "Alert",
        Text = "Teleporting in "..tostring(number),
        Duration = 2,
        Callback = function() end
    }
    wait(1)
end
function Click()
    if _G.Setting.Join == true then
        local vim = game:GetService'VirtualInputManager'
        local x = game:GetService("Players").LocalPlayer.PlayerGui.TeleportGui.Frame.Yes
        vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
        vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1) 
    elseif _G.Setting.Join == false then
        local vim = game:GetService'VirtualInputManager'
        local x = game:GetService("Players").LocalPlayer.PlayerGui.TeleportGui.Frame.no
        vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
        vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1) 
    end
end
function Facture(Posi)
    local ohString1 = "fracturedworlds"
    local ohTable2 = {
        [1] = Posi,
        [2] = Posi,
        [3] = 9000
    }
    game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
end
function Slicer(Posi)
    local ohString1 = "hit"
    local ohTable2 = {
        [1] = (Posi + Vector3.new(0, 0, 0)),
        [2] = -142.5500030517578,
        [3] = 1,
        [4] = 1
    }
    game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
end
function YY(Posi)
    local ohString1 = "hit"
    local ohTable2 = {
            [1] = (Posi + Vector3.new(5, 0, 10)),
            [2] = (Posi + Vector3.new(5, 0, -10)),
            [3] = math.random(1,2)
        }
        game:GetService("Players").LocalPlayer.Character["Yin Yang"].RemoteFunction:InvokeServer(ohString1, ohTable2)
end
spawn(function()
	while wait() do
        pcall(function()
            local anti = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                anti:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                anti:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Attack == true then
            pcall(function()
                attack(_G.Setting.Weapon)
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Shoot == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                            local ohString1 = "pillar"
                            local ohTable2 = {
                                [1] = v.HumanoidRootPart.Position,
                                [2] = game.Players.LocalPlayer.Character.Torso
                            }
                            game:GetService("Players").LocalPlayer.Character[_G.Setting.Weapon].RemoteFunction:InvokeServer(ohString1, ohTable2)
                        end)
                    end
                end
            end)     
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.OP == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                            local ohString1 = "hit"
                            local ohTable2 = {
                                [1] = (v.Head.Position + Vector3.new(0, 0, 0)),
                                [2] = -142.5500030517578,
                                [3] = 1,
                                [4] = 1
                            }
                            game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                        end)
                    end
                end
            end)     
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Equip == true then
            pcall(function()
                for i,v in pairs(Player.Backpack:GetChildren()) do
                    if v.name == _G.Setting.Weapon then
                        v.Parent = Player.Character
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Teleport == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                        if _G.Setting.Type == "InstantTeleport" then
                            if _G.Setting.Angle == "Under" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,-_G.Setting.Distance,0) * CFrame.Angles(1.5,0,0)
                                GUI:set_status("Status: "..v.Name)
                            elseif _G.Setting.Angle == "Behide" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0)
                                GUI:set_status("Status: "..v.Name)
                            elseif _G.Setting.Angle == "Over" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,_G.Setting.Distance,0) * CFrame.Angles(-1.5,0,0)
                                GUI:set_status("Status: "..v.Name)
                            elseif _G.Setting.Angle == "Font" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,-_G.Setting.Distance) * CFrame.Angles(0,0,0)
                                GUI:set_status("Status: "..v.Name)
                            end
                        elseif _G.Setting.Type == "TweenTeleport" then
                            if _G.Setting.Angle == "Under" then
                                tween(v.Head.CFrame * CFrame.new(0,-_G.Setting.Distance,0) * CFrame.Angles(1.5,0,0))
                                GUI:set_status("Status: "..v.Name)
                            elseif _G.Setting.Angle == "Behide" then
                                tween(v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0))
                                GUI:set_status("Status: "..v.Name)
                            elseif _G.Setting.Angle == "Over" then
                                tween(v.Head.CFrame * CFrame.new(0,_G.Setting.Distance,0) * CFrame.Angles(-1.5,0,0))
                                GUI:set_status("Status: "..v.Name)
                            elseif _G.Setting.Angle == "Font" then
                                tween(v.Head.CFrame * CFrame.new(0,0,-_G.Setting.Distance) * CFrame.Angles(0,0,0))
                                GUI:set_status("Status: "..v.Name) 
                            end   
                        end
                    end
                end 
            end)
        else
            GUI:set_status("Status: ".."Idle")
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Teleport == true or _G.Setting.FarmStrongHold == true then
            Player.Character.Humanoid.Sit = false
            wait(0.1)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Walk == true then
            Player.Character.Humanoid.WalkSpeed = _G.Setting.Wakspeed
        else
            Player.Character.Humanoid.WalkSpeed = defaultSpeed
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Jump == true then
            Player.Character.Humanoid.JumpPower = _G.Setting.Jumppower
        else
            Player.Character.Humanoid.JumpPower = defaultJump
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.AutoOre == true then
            pcall(function()
                if game.PlaceId == 8829364740 or game.PlaceId == 9032150459 then
                    for i, v in pairs(game:GetService("Workspace").Map.Ores:GetChildren()) do
                        if v.Name == _G.Setting.Ores and v.Properties.Hitpoint.Value ~= 0 and v.Base.CFrame ~= _G.PositionFake1[_G.Setting.Ores] then
                            Player.Character.HumanoidRootPart.CFrame = v.Base.CFrame * CFrame.new(0,2.7,5)  
                        end
                    end 
                else
                    GUI:Notification{
                        Title = "Alert",
                        Text = "Use in The Caverns or The Beneath only!",
                        Duration = 3,
                        Callback = function() end
                    }
                    _G.Setting.AutoOre = false
                end
            end)  
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.AutoAllOre == true then
            pcall(function()
                if game.PlaceId == 8829364740 or game.PlaceId == 9032150459 then
                    for i, v in pairs(game:GetService("Workspace").Map.Ores:GetChildren()) do
                        if v:IsA("Model") and v.Properties.Hitpoint.Value ~= 0 and v.Base.CFrame ~= _G.PositionFake1[_G.Setting.Ores] then
                            Player.Character.HumanoidRootPart.CFrame = v.Base.CFrame * CFrame.new(0,2.7,5)  
                        end
                    end 
                else
                    GUI:Notification{
                        Title = "Alert",
                        Text = "Use in The Caverns or The Beneath only!",
                        Duration = 3,
                        Callback = function() end
                    }
                    _G.Setting.AutoOre = false
                end
            end)  
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.AutoOre == true or _G.Setting.AutoAllOre == true then
            for i,v in pairs(Player.Backpack:GetChildren()) do
                if string.find(v.Name, "Pickaxe") and v:IsA("Tool") then
                    v.Parent = Player.Character
                    Player.Character["Pickaxe of Balance"].RemoteFunction:InvokeServer("mine")
                end
            end
            for i,v in pairs(Player.Character:GetChildren())do
                if v.ClassName == "Tool" then
                    Player.Character[v.Name].RemoteFunction:InvokeServer("mine")
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Webhook == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == _G.Setting.BossList and v:FindFirstChild("Head") ~= nil and v:IsA("Model") and _G.Setting.TM and not webhookSent then
                            DiscordHook(_G.Setting.WebhookLink, "Not Tags",_G.Setting.BossList, "None")
                            webhookSent = true
                    elseif v.Name == _G.Setting.BossList and v:FindFirstChild("Head") == nil and v:IsA("Model") then
                        webhookSent = false
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Webhook == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "TravellingMerchantRain" and v:FindFirstChild("Torso") ~= nil and v:IsA("Model") and _G.Setting.TM and not webhookSent then
                            DiscordHook(_G.Setting.WebhookLink, "@everyone","None", "Travelling Merchant Is Spawned!!!")
                            webhookSent = true
                    elseif v.Name == "TravellingMerchantRain" and v:FindFirstChild("Torso") == nil and v:IsA("Model") then
                        webhookSent = false
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Join == true and not hopChecked then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Bases:GetDescendants()) do
                    if v.Name == _G.Setting.PortalList and v:FindFirstChild("pad") and _G.Setting.Join then
                        if game.PlaceId == 8811271345 then
                            wait(5)
                            v.pad.Transparency = 1
                            v.pad.CanCollide = false
                            v.pad.CFrame = Player.Character.HumanoidRootPart.CFrame
                            wait(1)
                            v.RemoteFunction:InvokeServer("Confirm")
                            hopChecked = true
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Vote == true then
            pcall(function()
                if game.PlaceId ~= 8829364740 and game.PlaceId ~= 9032150459 and game.PlaceId ~= 8811271345 then
                    game:GetService("ReplicatedStorage").VoteRemote:InvokeServer(_G.Setting.ModeList)
                    wait(2)
                    game:GetService("ReplicatedStorage").WageRemote:InvokeServer(_G.Setting.WageList)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmPortal == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            if _G.Setting.Type == "InstantTeleport" then
                                if _G.Setting.Angle == "Under" then
                                    Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,-_G.Setting.Distance,0) * CFrame.Angles(1.5,0,0)
                                elseif _G.Setting.Angle == "Behide" then
                                    Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0)
                                elseif _G.Setting.Angle == "Over" then
                                    Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,_G.Setting.Distance,0) * CFrame.Angles(-1.5,0,0)
                                elseif _G.Setting.Angle == "Font" then
                                    Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,-_G.Setting.Distance) * CFrame.Angles(0,0,0)
                                end
                            elseif _G.Setting.Type == "TweenTeleport" then
                                if _G.Setting.Angle == "Under" then
                                    tween(v.Head.CFrame * CFrame.new(0,-_G.Setting.Distance,0) * CFrame.Angles(1.5,0,0))
                                elseif _G.Setting.Angle == "Behide" then
                                    tween(v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0))
                                elseif _G.Setting.Angle == "Over" then
                                    tween(v.Head.CFrame * CFrame.new(0,_G.Setting.Distance,0) * CFrame.Angles(-1.5,0,0))
                                elseif _G.Setting.Angle == "Font" then
                                    tween(v.Head.CFrame * CFrame.new(0,0,-_G.Setting.Distance) * CFrame.Angles(0,0,0))
                                end   
                            end
                        end
                    end 
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmPortal == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 then
                    for i,v in pairs(Player.Backpack:GetChildren()) do
                        if v.name == _G.Setting.Weapon then
                            v.Parent = Player.Character
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmPortal == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 then
                    attack(_G.Setting.Weapon)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Join == true or _G.Setting.FarmStrongHold == true or _G.Setting.Summer == true or Setting.Teleport == true or _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 then
                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                        if v:IsA("Player") and v:FindFirstChild("realstats") then
                            if i > 1 then
                                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
                            else
                                wait(1)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Teleport == true then
            pcall(function()
                if game.PlaceId == 8811271345 then
                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                        if v:IsA("Player") and v:FindFirstChild("realstats") then
                            if i > 1 then
                                _G.Setting.Equip = false
                                SaveSetting()
                                _G.Setting.Teleport = false
                                SaveSetting()
                                _G.Setting.Attack = false
                                SaveSetting()
                                game:GetService("Players").LocalPlayer:kick("Your in public server!!!")
                            else
                                wait()
                            end
                        end
                    end
                end
            end)
        end
    end
end)
---------------------------------------------------------------------------------
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true and not hopChecked then
            pcall(function()
                if game.PlaceId == 8811271345 and game.PlaceId ~= 9036392973 then
                    for i,v in pairs(game:GetService("Workspace").Bases:GetDescendants()) do
                        if v.Name == "auroraglacierteleporter" and v:FindFirstChild("pad") and _G.Setting.FarmStrongHold then
                            wait(5)
                            v.pad.Transparency = 1
                            v.pad.CanCollide = false
                            v.pad.CFrame = Player.Character.HumanoidRootPart.CFrame
                            wait(1)
                            v.RemoteFunction:InvokeServer("Confirm")
                            hopChecked = true
                        end
                    end 
                elseif game.PlaceId == 9036392973 then
                    wait(2)
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.name == "Mysterious Artifact" then
                            v.Parent = game.Players.LocalPlayer.Character
                            wait(0.1)
                            game.Players.LocalPlayer.Character["Mysterious Artifact"].RemoteEvent:FireServer()
                        end
                    end
                    wait(2)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "Confirm"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    hopChecked = true
                elseif game.PlaceId == 9034159990 then
                    wait(5)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "/skipall"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    hopChecked = true
                else
                    wait(1)
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 and game.PlaceId ~= 9280551080 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.name == "The Controller" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            if _G.Setting.Type == "InstantTeleport" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,_G.Setting.Distance,0) * CFrame.Angles(-1.5,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                tween(v.Head.CFrame * CFrame.new(0,_G.Setting.Distance,0) * CFrame.Angles(-1.5,0,0))   
                            end
                        elseif v.name == "The Arbiter" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            if _G.Setting.Type == "InstantTeleport" then
                                Player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,0) * CFrame.Angles(0,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                tween(v.Head.CFrame * CFrame.new(0,0,0) * CFrame.Angles(0,0,0))   
                            end
                        elseif v.name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health == 3200000 then
                            if _G.Setting.Type == "InstantTeleport" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,-_G.Setting.Distance) * CFrame.Angles(0,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                tween(v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0))
                            end
                        elseif v.name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            if _G.Setting.Type == "InstantTeleport" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                tween(v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0))
                            end
                        elseif v.name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 0 then
                            if _G.Setting.Type == "InstantTeleport" then
                                Player.Character.HumanoidRootPart.CFrame = CFrame.new(1531.2677, -1.14999378, 1530.58521, 0.0144568672, -1.06104379e-08, 0.999895513, -4.10990797e-09, 1, 1.06709699e-08, -0.999895513, -4.26374713e-09, 0.0144568672)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                tween(CFrame.new(1531.2677, -1.14999378, 1530.58521, 0.0144568672, -1.06104379e-08, 0.999895513, -4.10990797e-09, 1, 1.06709699e-08, -0.999895513, -4.26374713e-09, 0.0144568672))
                            end
                        elseif v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            if _G.Setting.Type == "InstantTeleport" then
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                tween(v.Head.CFrame * CFrame.new(0,0,_G.Setting.Distance) * CFrame.Angles(0,0,0))
                            end
                        end
                    end 
                elseif game.PlaceId == 9280551080 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.name == "Gilgamesh, the Consumer of Reality" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 and Player.Character.Humanoid.Health > 0 and not game:GetService("Workspace").FilterEffects.Effects:FindFirstChild("Horizon") then
                            if _G.Setting.Type == "InstantTeleport" then
                                v.Head.CanCollide = false
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,25,0) * CFrame.Angles(-1.5,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                v.Head.CanCollide = false
                                tween(v.Head.CFrame * CFrame.new(0,25,0) * CFrame.Angles(-1.5,0,0))   
                            end
                        elseif v.name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 and Player.Character.Humanoid.Health > 0 and not game:GetService("Workspace").FilterEffects.Effects:FindFirstChild("Horizon") then
                            if _G.Setting.Type == "InstantTeleport" then
                                v.Head.CanCollide = false
                                Player.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0,25,0) * CFrame.Angles(-1.5,0,0)
                            elseif _G.Setting.Type == "TweenTeleport" then
                                v.Head.CanCollide = false
                                tween(v.Head.CFrame * CFrame.new(0,25,0) * CFrame.Angles(-1.5,0,0))   
                            end
                        end
                    end 
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true or _G.Setting.Summer == true or _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 and game.PlaceId ~= 9036392973 then
                    for i,v in pairs(Player.Backpack:GetChildren()) do
                        if v.name == "Equinox Slicer" then
                            v.Parent = Player.Character
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true or _G.Setting.Summer == true or _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 and game.PlaceId ~= 9036392973 then
                    for i,v in pairs(Player.Backpack:GetChildren()) do
                        if v.name == "Yin Yang" then
                            v.Parent = Player.Character
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true or _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 and game.PlaceId ~= 9036392973 then
                    for i,v in pairs(Player.Backpack:GetChildren()) do
                        if v.name == "Fang of Gilgamesh" then
                            v.Parent = Player.Character
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true or _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId ~= 8811271345 then
                    attack("Fang of Gilgamesh")
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true and not TeleportChecked then
            pcall(function()
                if game.PlaceId == 9280551080 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.name == "Gilgamesh, the Consumer of Reality" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1 then
                            wait(10)
                            local vim = game:GetService'VirtualInputManager'
                            local virtualUser = game:GetService('VirtualUser')
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(1)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.name == "Mysterious Artifact" then
                                    v.Parent = game.Players.LocalPlayer.Character
                                    wait(0.1)
                                    game.Players.LocalPlayer.Character["Mysterious Artifact"].RemoteEvent:FireServer()
                                end
                            end
                            wait(2)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                            wait(0.5)
                            local Players = game:GetService("Players")
                            local LocalPlayer = Players.LocalPlayer
                            local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            ChatBar.Text = "Confirm"
                            wait(0.5)
                            virtualUser:SetKeyDown('0x0D')
                            wait(0.1)
                            virtualUser:SetKeyUp('0x0D')
                            wait(0.5)
                            TeleportChecked = true
                        elseif v.name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1 then
                            wait(10)
                            local vim = game:GetService'VirtualInputManager'
                            local virtualUser = game:GetService('VirtualUser')
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(1)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.name == "Mysterious Artifact" then
                                    v.Parent = game.Players.LocalPlayer.Character
                                    wait(0.1)
                                    game.Players.LocalPlayer.Character["Mysterious Artifact"].RemoteEvent:FireServer()
                                end
                            end
                            wait(2)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                            wait(0.5)
                            local Players = game:GetService("Players")
                            local LocalPlayer = Players.LocalPlayer
                            local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            ChatBar.Text = "Confirm"
                            wait(0.5)
                            virtualUser:SetKeyDown('0x0D')
                            wait(0.1)
                            virtualUser:SetKeyUp('0x0D')
                            wait(0.5)
                            TeleportChecked = true
                        end
                    end 
                elseif game.PlaceId == 9034159990 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1 then
                            wait(10)
                            local vim = game:GetService'VirtualInputManager'
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(1)
                            TeleportChecked = true
                        end
                    end 
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true then
            if game.PlaceId ~= 8811271345 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "The Arbiter" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.Head.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.HumanoidRootPart.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "The Controller" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.HumanoidRootPart.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Equinox Praetor" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.HumanoidRootPart.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Gilgamesh, the Consumer of Reality" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.HumanoidRootPart.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.HumanoidRootPart.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                                YY(v.Head.Position)
                            end)    
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true then
            if game.PlaceId ~= 8811271345 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "The Arbiter" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Facture(v.HumanoidRootPart.Position)
                            end)
                        elseif v.Name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Facture(v.HumanoidRootPart.Position)
                            end)
                        elseif v.Name == "Equinox Praetor" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Facture(v.HumanoidRootPart.Position)
                            end)
                        elseif v.Name == "Gilgamesh, the Consumer of Reality" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Facture(v.HumanoidRootPart.Position)
                            end)
                        elseif v.Name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Facture(v.HumanoidRootPart.Position)
                            end)    
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true then
            if game.PlaceId == 9280551080 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name ~= "Gilgamesh, the Consumer of Reality" or v.Name ~= "The Supreme Uber Bringer of Light" or v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                local ohString1 = "hit"
                                local ohTable2 = {
                                    [1] = (v.HumanoidRootPart.Position + Vector3.new(0, 0, 0)),
                                    [2] = -142.5500030517578,
                                    [3] = 1,
                                    [4] = 1
                                }
                                game:GetService("Players").LocalPlayer.Character["Equinox Slicer"].RemoteFunction:InvokeServer(ohString1, ohTable2)
                            end)
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true then
            if game.PlaceId ~= 8811271345 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "The Arbiter" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1000 then 
                            Player.Character.Shield.ShieldRemote:FireServer()
                        elseif v.Name == "Alrasid, Archbishop of the Equinox" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1000 then
                            Player.Character.Shield.ShieldRemote:FireServer()
                        elseif v.Name == "Gilgamesh, the Consumer of Reality" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 100000 then
                            Player.Character.Shield.ShieldRemote:FireServer()
                        elseif v.Name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 100000 then
                            Player.Character.Shield.ShieldRemote:FireServer()
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true or _G.Setting.Halloween == true then
            if game.PlaceId == 9280551080 then
                wait(480)
                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
            elseif game.PlaceId == 9034159990 then
                wait(600)
                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
            elseif game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Standard" then
                wait(1200)
                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
            elseif game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Torment" then
                wait(1800)
                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
            elseif game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Standard" then
                wait(1800)
                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
            elseif game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Torment" then
                wait(1800)
                game:GetService("TeleportService"):Teleport(8811271345, game.Players.LocalPlayer)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.FarmStrongHold == true then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("Head") ~= nil and v:IsA("Model") and _G.Setting.FarmStrongHold and not webhookSent then
                            DiscordHook(_G.Setting.WebhookLink, "Not Tags","The Supreme Uber Bringer of Light", "None")
                            webhookSent = true
                    elseif v.Name == "The Supreme Uber Bringer of Light" and v:FindFirstChild("Head") == nil and v:IsA("Model") then
                        webhookSent = false
                    end
                end
            end)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------
spawn(function()
    if _G.Setting.Summer == true or _G.Setting.Halloween == true then
        pcall(function()
            local part = Instance.new("Part")
            part.Anchored = true
            part.Name = "DontTouch"
            part.Parent = workspace
            part.Size = Vector3.new(5,1,5)
            part.Transparency = 1
        end)
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Summer == true and not hopChecked then
            pcall(function()
                if game.PlaceId == 8811271345 then
                    for i,v in pairs(game:GetService("Workspace").Bases:GetDescendants()) do
                        if v.Name == "auroraglacierteleporter" and v:FindFirstChild("pad") and _G.Setting.Summer then
                            wait(5)
                            v.pad.Transparency = 1
                            v.pad.CanCollide = false
                            v.pad.CFrame = Player.Character.HumanoidRootPart.CFrame
                            wait(1)
                            v.RemoteFunction:InvokeServer("Confirm")
                            hopChecked = true
                        end
                    end 
                elseif game.PlaceId == 9036392973 then
                    wait(2)
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.name == "Azure Orb" then
                            v.Parent = game.Players.LocalPlayer.Character
                            wait(0.1)
                            game.Players.LocalPlayer.Character["Azure Orb"].RemoteEvent:FireServer()
                        end
                    end
                    wait(2)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "Confirm"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    hopChecked = true
                elseif game.PlaceId == 10228957718 then
                    wait(5)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "/skipall"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    hopChecked = true
                else
                    wait(1)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Summer == true then
            pcall(function()
                if game.PlaceId == 10228957718 then
                    game:GetService("ReplicatedStorage").VoteRemote:InvokeServer(_G.Setting.ModeSummer)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Summer == true then
            pcall(function()
                if game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Standard" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        end
                    end
                elseif game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Torment" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "Okeania, the Ocean's Authority" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Sea Angel" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Sans, the Justiciar" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Zykinel, the Enforcer" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Vermouda, the Vigilant" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Ahiratha, the Faithful" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Ingvar, the Justiciar" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Lelok, the Enforcer" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Dymiscera, the Heartfelt" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Nephilim, the Soul Soother" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Chirurgia, The Raging Tide" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Squilla, The Island Buster" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Venefille, the Reverberation" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Pablo, the Justiciar" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Battle Tortoise" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Doris, the Magus" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Aqua Warrior" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "Aqua Phalanx" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "SeaSerpentTorment" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "GiantUrchinTorment" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v.Name == "EliteNagaTorment" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        elseif v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Summer == true then
            pcall(function()
                if game.PlaceId == 10228957718 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if _G.Setting.ModeSummer == "Standard" then
                            if v.Name == "DontTouch" then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39.9644623, 275.231476, 42.1731453, 0.981634438, 5.53937163e-09, -0.190771744, 1.46119367e-11, 1, 2.91118347e-08, 0.190771744, -2.85799651e-08, 0.981634438)
                                v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                wait()
                            end
                        elseif _G.Setting.ModeSummer == "Torment" then
                            if v.Name == "DontTouch" then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-870.118896, 670.492981, -1850.60791, -0.827027142, 6.86573216e-08, -0.562161982, 7.28087315e-08, 1, 1.50179584e-08, 0.562161982, -2.85100423e-08, -0.827027142)
                                v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                wait()
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Summer == true then
            if game.PlaceId == 10228957718 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if _G.Setting.ModeSummer == "Standard" then
                            if v.Name == "Chirurgia, The Raging Tide" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            end
                        elseif _G.Setting.ModeSummer == "Torment" then
                            if v.Name == "Okeania, the Ocean's Authority" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Sans, the Justiciar" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Zykinel, the Enforcer" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Vermouda, the Vigilant" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Ahiratha, the Faithful" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Ingvar, the Justiciar" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Lelok, the Enforcer" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            elseif v.Name == "Dymiscera, the Heartfelt" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Nephilim, the Soul Soother" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Chirurgia, The Raging Tide" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Squilla, The Island Buster" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Sea Angel" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Battle Tortoise" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "SeaSerpentTorment" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Venefille, the Reverberation" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Pablo, the Justiciar" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "Aqua Phalanx" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "GiantUrchinTorment" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end) 
                            elseif v.Name == "PotentiafishTorment" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)  
                            end
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Summer == true and not TeleportChecked then
            pcall(function()
                if game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Torment" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "Okeania, the Ocean's Authority" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 0 then
                            wait(23)
                            local vim = game:GetService'VirtualInputManager'
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(0.5)
                            TeleportChecked = true
                        end
                    end
                elseif game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Standard" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "Chirurgia, The Raging Tide" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 0 then
                            wait(200)
                            local vim = game:GetService'VirtualInputManager'
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(0.5)
                            TeleportChecked = true
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.BW == true and not TeleportChecked then
            if game.PlaceId == 10228957718 and _G.Setting.ModeSummer == "Standard" then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.name == "Chirurgia, The Raging Tide" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1 then
                        wait(10)
                        local vim = game:GetService'VirtualInputManager'
                        local virtualUser = game:GetService('VirtualUser')
                        local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                        local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                        vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                        vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                        wait(1)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.name == "Azure Orb" then
                                v.Parent = game.Players.LocalPlayer.Character
                                wait(0.1)
                                game.Players.LocalPlayer.Character["Azure Orb"].RemoteEvent:FireServer()
                            end
                        end
                        wait(2)
                        vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                        vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                        wait(0.5)
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                        ChatBar.Text = "Confirm"
                        wait(0.5)
                        virtualUser:SetKeyDown('0x0D')
                        wait(0.1)
                        virtualUser:SetKeyUp('0x0D')
                        wait(0.5)
                        TeleportChecked = true
                    end
                end 
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.AutoBuySummer == true and not TalkChecked then
            repeat task.wait(5) until game:GetService("Workspace"):FindFirstChild("TravellingMerchantRainSummer")
            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v.Name == "TravellingMerchantRainSummer" then
                    wait(2)
                    _G.Setting.Summer = false
                    wait(0.5)
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(105.237114, 9.2199831, 47.0895996, -0.985426664, -5.09016651e-08, 0.170100927, -5.44320216e-08, 1, -1.60910254e-08, -0.170100927, -2.51154635e-08, -0.985426664)
                    wait(0.5)
                    fireproximityprompt(v.Head.DialoguePrompt)
                    wait(0.5)
                    TalkChecked = true
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.AutoBuySummer == true and not TeleportChecked then
            pcall(function()
                repeat task.wait(35) until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TravellingMerchantShop")
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
                    if v.Name == "TravellingMerchantShop" and v.background.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.slot.slot.slot.Text:find("Arbitration") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    elseif v.Name == "TravellingMerchantShop" and v.background.slot.slot.slot.slot.slot.slot.slot.slot.slot.Text:find("Time Piercer") then
                        wait(5)
                        BuySummer(v.background.slot.slot.slot.slot.slot.slot.slot.slot.slot,v.background.itemframe.button)
                        TeleportChecked = true
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.AutoBuySummer == true and not TeleportChecked then
            pcall(function()
                if game.PlaceId == 10228957718 then
                    repeat task.wait(35) until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TravellingMerchantShop")
                    wait(20)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                    vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                    wait(1)
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.name == "Azure Orb" then
                            v.Parent = game.Players.LocalPlayer.Character
                            wait(0.1)
                            game.Players.LocalPlayer.Character["Azure Orb"].RemoteEvent:FireServer()
                        end
                    end
                    wait(2)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "Confirm"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    TeleportChecked = true
                end
            end)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true and not hopChecked then
            pcall(function()
                if game.PlaceId == 8811271345 then
                    for i,v in pairs(game:GetService("Workspace").Bases:GetDescendants()) do
                        if v.Name == "auroraglacierteleporter" and v:FindFirstChild("pad") and _G.Setting.Halloween then
                            wait(5)
                            v.pad.Transparency = 1
                            v.pad.CanCollide = false
                            v.pad.CFrame = Player.Character.HumanoidRootPart.CFrame
                            wait(1)
                            v.RemoteFunction:InvokeServer("Confirm")
                            hopChecked = true
                        end
                    end 
                elseif game.PlaceId == 9036392973 then
                    wait(2)
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.name == "Suspicious Invitation" then
                            v.Parent = game.Players.LocalPlayer.Character
                            wait(0.1)
                            game.Players.LocalPlayer.Character["Suspicious Invitation"].RemoteEvent:FireServer()
                        end
                    end
                    wait(2)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "Confirm"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    hopChecked = true
                elseif game.PlaceId == 11175531925 then
                    wait(40)
                    local vim = game:GetService'VirtualInputManager'
                    local virtualUser = game:GetService('VirtualUser')
                    local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                    vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                    wait(0.5)
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                    ChatBar.Text = "/skipall"
                    wait(0.5)
                    virtualUser:SetKeyDown('0x0D')
                    wait(0.1)
                    virtualUser:SetKeyUp('0x0D')
                    wait(0.5)
                    hopChecked = true
                else
                    wait(1)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId == 11175531925 then
                    game:GetService("ReplicatedStorage").VoteRemote:InvokeServer(_G.Setting.ModeSummer)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Standard" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                            task.spawn(function()
                                Slicer(v.Head.Position)
                                YY(v.Head.Position)
                            end)
                        end
                    end
                elseif game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Torment" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("Grudeful Puppet") then
                            if v.Name == "Grudeful Puppet" and v:FindFirstChild("EnemyMain") and not v:FindFirstChild("SoulLinked") and not v:FindFirstChild("SoulLinked") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    YY(v.Torso.Position)
                                end)
                            elseif v.Name == "Grudeful Puppet" and v:FindFirstChild("EnemyMain") and v:FindFirstChild("SoulLinked") and v:FindFirstChild("SoulLinked") and v.Humanoid.Health > 0 then
                                wait(1)
                            end
                        elseif not v:FindFirstChild("Grudeful Puppet") then
                            if v.Name == "Lord Umberhallow, The Infernal Insurrectionist" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Head.Position)
                                    YY(v.Head.Position)
                                end)
                            elseif v.Name == "Lord Umberhallow" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Head.Position)
                                    YY(v.Head.Position)
                                end)
                            elseif v.Name == "The Black Death" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Head.Position)
                                    YY(v.Head.Position)
                                end)
                            elseif v.Name == "Blood Monarch" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Head.Position)
                                    YY(v.Head.Position)
                                end)
                            elseif v.Name == "Headless Horseman" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Torso.Position)
                                    YY(v.Torso.Position)
                                end)
                            elseif v.Name == "Bombastic Jack" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Torso.Position)
                                    YY(v.Torso.Position)
                                end)
                            elseif v.Name == "Hallow" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Slicer(v.Torso.Position)
                                    YY(v.Torso.Position)
                                end)
                            elseif v:FindFirstChild("EnemyMain") and not v:FindFirstChild("SoulLinked") and not v:FindFirstChild("SoulLinked") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    YY(v.Torso.Position)
                                end)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true then
            pcall(function()
                if game.PlaceId == 11175531925 then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if _G.Setting.ModeSummer == "Standard" then
                            if v.Name == "DontTouch" then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2995.03906, 1185.91003, -82.3087387, 0.00180449907, 3.69681779e-08, 0.999998391, -1.0189275e-09, 1, -3.69663979e-08, -0.999998391, -9.5221997e-10, 0.00180449907)
                                v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                wait()
                            end
                        elseif _G.Setting.ModeSummer == "Torment" then
                            if v.Name == "DontTouch" then
                                for i2,v2 in pairs(game:GetService("Workspace"):GetChildren()) do
                                    if v2.Name == "Blood Monarch" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(968.455688, -478.139465, -15.9223442, -0.382160634, 2.59551918e-08, 0.924095929, -6.94211906e-08, 1, -5.67963099e-08, -0.924095929, -8.58571525e-08, -0.382160634)
                                        v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                    elseif v2.Name == "Lord Umberhallow, The Infernal Insurrectionist" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    elseif v2.Name == "Lord Umberhallow" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    elseif v2.Name == "The Black Death" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    elseif v2.Name == "Headless Horseman" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    elseif v2.Name == "Bombastic Jack" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    elseif v2.Name == "Hallow" and v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    elseif v2:FindFirstChild("EnemyMain") and v2.Humanoid.Health > 0 then
                                        task.spawn(function()
                                            wait()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1304.0282, 424.361145, 96.568428, -0.0610289797, 7.18267117e-08, 0.998135984, -1.35769632e-10, 1, -7.19691471e-08, -0.998135984, -4.52772042e-09, -0.0610289797)
                                            v.CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true then
            if game.PlaceId == 11175531925 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if _G.Setting.ModeSummer == "Standard" then
                            if v.Name == "The Black Death" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                task.spawn(function()
                                    Facture(v.HumanoidRootPart.Position)
                                end)
                            end
                        elseif _G.Setting.ModeSummer == "Torment" then
                            if v:FindFirstChild("Grudeful Puppet") then
                                wait(1)
                            elseif not v:FindFirstChild("Grudeful Puppet") then
                                if v.Name == "Lord Umberhallow, The Infernal Insurrectionist" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                    task.spawn(function()
                                        Facture(v.HumanoidRootPart.Position)
                                    end)
                                elseif v.Name == "Lord Umberhallow" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                    task.spawn(function()
                                        Facture(v.HumanoidRootPart.Position)
                                    end)
                                elseif v.Name == "The Black Death" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                    task.spawn(function()
                                        Facture(v.HumanoidRootPart.Position)
                                    end)
                                elseif v.Name == "Blood Monarch" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                    task.spawn(function()
                                        Facture(v.HumanoidRootPart.Position)
                                    end)
                                elseif v.Name == "Headless Horseman" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                    task.spawn(function()
                                        Facture(v.HumanoidRootPart.Position)
                                    end)
                                elseif v.Name == "Bombastic Jack" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then
                                    task.spawn(function()
                                        Facture(v.HumanoidRootPart.Position)
                                    end)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true and not TeleportChecked then
            pcall(function()
                if game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Torment" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.name == "Lord Umberhallow, The Infernal Insurrectionist" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1 then
                            wait(10)
                            local vim = game:GetService'VirtualInputManager'
                            local virtualUser = game:GetService('VirtualUser')
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(1)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.name == "Suspicious Invitation" then
                                    v.Parent = game.Players.LocalPlayer.Character
                                    wait(0.1)
                                    game.Players.LocalPlayer.Character["Suspicious Invitation"].RemoteEvent:FireServer()
                                end
                            end
                            wait(2)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                            wait(0.5)
                            local Players = game:GetService("Players")
                            local LocalPlayer = Players.LocalPlayer
                            local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            ChatBar.Text = "Confirm"
                            wait(0.5)
                            virtualUser:SetKeyDown('0x0D')
                            wait(0.1)
                            virtualUser:SetKeyUp('0x0D')
                            wait(0.5)
                            TeleportChecked = true
                        end
                    end 
                elseif game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Standard" then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.name == "Lord Umberhallow, The Infernal Insurrectionist" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1 then
                            wait(10)
                            local vim = game:GetService'VirtualInputManager'
                            local virtualUser = game:GetService('VirtualUser')
                            local save = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.button.savebutton
                            local x = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,true,save,1)
                            vim:SendMouseButtonEvent(save.AbsolutePosition.X+save.AbsoluteSize.X/2,save.AbsolutePosition.Y+50,0,false,save,1)
                            wait(1)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.name == "Suspicious Invitation" then
                                    v.Parent = game.Players.LocalPlayer.Character
                                    wait(0.1)
                                    game.Players.LocalPlayer.Character["Suspicious Invitation"].RemoteEvent:FireServer()
                                end
                            end
                            wait(2)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                            wait(0.5)
                            local Players = game:GetService("Players")
                            local LocalPlayer = Players.LocalPlayer
                            local ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
                            ChatBar.Text = "Confirm"
                            wait(0.5)
                            virtualUser:SetKeyDown('0x0D')
                            wait(0.1)
                            virtualUser:SetKeyUp('0x0D')
                            wait(0.5)
                            TeleportChecked = true
                        end
                    end 
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true then
            if game.PlaceId == 11175531925 then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v.Name == "Grudeful Puppet" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health > 0 then 
                            Player.Character.Shield.ShieldRemote:FireServer()
                        elseif v.Name == "Lord Umberhallow, The Infernal Insurrectionist" and v:FindFirstChild("EnemyMain") and v.Humanoid.Health <= 1000 then
                            Player.Character.Shield.ShieldRemote:FireServer()
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        if game.PlaceId == 11175531925 and Player.Character.Humanoid.Health < Player.Character.Humanoid.MaxHealth then
            Player.Character.Shield.ShieldRemote:FireServer()
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Setting.Halloween == true and not TeleportChecked then
            pcall(function()
                if game.PlaceId == 11175531925 and _G.Setting.ModeSummer == "Torment" then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                        if v.Name == "SubmitToUmberhallow" and v:FindFirstChild("Remote") then
                            wait(1)
                            local vim = game:GetService'VirtualInputManager'
                            local virtualUser = game:GetService('VirtualUser')
                            local x = game:GetService("Players").LocalPlayer.PlayerGui.SubmitToUmberhallow.Frame.No
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
                            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
                            wait(0.5)
                            TeleportChecked = true
                        end
                    end 
                end
            end)
        end
    end
end)