--------------------------CREDITS--------------------------
-------------------Script made by AleXxX-------------------
--      Script made for ZenTrix Romania RolePlay         --
--         Discord: https://discord.gg/BEFrqay           --
--   Copyright 2020 ©AleXxXScript's. All rights served   --
-----------------------------------------------------------


--in english: Primarie = TownHall
--            Aeroport = Airport
--            Sectie = Station

local gps = class("gps", vRP.Extension)


function gps:__construct()
    vRP.Extension.__construct(self)

    local gps = {
        [1] = {name = "Primarie", desc = "Primaria", x = -541.64111328125, y = -210.04814147949},
        [2] = {name = "Fleeca Bank", desc = "Banca Fleeca", x = 151.47482299805, y = -1035.451171875},
        [3] = {name = "Showroom", desc = "Showroom", x = -1159.6904296875, y = -1699.2935791016},
        [4] = {name = "Sectia Noua", desc = "Sectia Politiei/Jandarmeriei/Guvernului", x = -1094.3728027344, y = -807.60302734375},
        [5] = {name = "Sectia veche", desc = "Sectia veche de Politie", x = 429.67095947266, y = -982.52203369141},
        [6] = {name = "Aeroport", desc = "Aeroportul", x = -1037.0020751953, y = -2736.8486328125},
    }

    local function m_gps(menu, aa)
        local user= menu.user
        vRP.EXT.Map.remote._setGPS(user.source, gps[parseInt(aa)].x, gps[parseInt(aa)].y)
    end
    
    vRP.EXT.GUI:registerMenuBuilder("gps", function(menu)
        local user = menu.user
        menu.title = "GPS"
        for k,v in pairs(gps) do
            menu:addOption(v.name, m_gps, v.desc, k)
        end
    end)
    
    
    vRP.EXT.GUI:registerMenuBuilder("main", function(menu)
        local user = menu.user
        menu:addOption("GPS", function(menu)
            menu.user:openMenu("gps")
          end, "Aici poti afla anumite locatii importante de pe server!")
    end)
end


vRP:registerExtension(gps)
