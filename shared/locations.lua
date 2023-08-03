Config = Config or {}

Config.Locations = {
    ['Polis1'] = {
        settings = {
            label = 'Police Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Police Mekanik',
            coords = vector3(450.18, -975.92, 25.7),
            sprite = 643,
            scale = 0.65,
            color = 5,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "police",
            deniedClasses = { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 15 }
        },
        zones = {
            { coords = vector3(450.18, -975.92, 25.7), length = 4.4, width = 9.2, heading = 0.0, minZ = 24.7, maxZ = 28.01 },
            { coords = vector3(377.73, -1629.61, 29.29), length = 4.8, width = 9.0, heading = 320.0, minZ = 28.29, maxZ = 32.09 },
            { coords = vector3(-464.66, 6023.99, 31.34), length = 4.8, width = 9.4, heading = 315, minZ = 29.14, maxZ = 33.14 },
        }
    },
    ['EMSMekanik'] = {
        settings = {
            label = 'EMS Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'EMS Mekanik',
            coords = vector3(450.18, -975.92, 25.7),
            sprite = 643,
            scale = 0.65,
            color = 5,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = false,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "ambulance",
            deniedClasses = { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 15 }
        },
        zones = {
            { coords = vector3(300.32, -617.46, 43.41), length = 4.4, width = 9.2, heading = 250, minZ = 40.41, maxZ = 44.41 },
            { coords = vector3(280.0, -613.26, 42.97), length = 4.8, width = 9.0, heading = 70, minZ = 28.29, maxZ = 32.09 },
            --[[ { coords = vector3(-464.66, 6023.99, 31.34), length = 4.8, width = 9.4, heading = 315, minZ = 29.14, maxZ = 33.14 }, ]]
        }
    },
    --[[ ['Mekanik1'] = { ---SS bölgesinde bulunduğu için kapatıldı.
        settings = {
            label = 'Bennys Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Bennys Mekanik',
            coords = vector3(-213.79, -1327.56, 30.88),
            sprite = 643,
            scale = 0.65,
            color = 5,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "bennys",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(-223.1, -1329.25, 30.89), length = 5.6, width = 8.4, heading = 0.0, minZ = 29.88, maxZ = 34.48 },
            { coords = vector3(-212.73, -1325.21, 30.89), length = 18.2, width = 7.6, heading = 0.0, minZ = 29.88, maxZ = 33.48 },
        }
    }, ]]
    ['Mekanik2'] = {
        settings = {
            label = 'Tunner Shop Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Tunner Shop Mekanik',
            coords = vector3(140.94, -3031.05, 6.62),
            sprite = 643,
            scale = 0.65,
            color = 7,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "tunnershop",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(124.63, -3047.41, 6.62), length = 6.0, width = 4.0, heading = 88.0, minZ = 5.62, maxZ = 9.62 },
            { coords = vector3(125.00, -3022.99, 6.62), length = 6.0, width = 4.0, heading = 88.0, minZ = 5.62, maxZ = 9.62 },
            { coords = vector3(135.95, -3031.21, 6.62), length = 6.0, width = 4.0, heading = 359.0, minZ = 5.62, maxZ = 9.62 },
            { coords = vector3(145.01, -3031.02, 6.62), length = 6.0, width = 4.0, heading = 359.0, minZ = 5.62, maxZ = 9.62 },
            { coords = vector3(145.08, -3044.54, 6.62), length = 6.0, width = 4.0, heading = 359.0, minZ = 5.62, maxZ = 9.62 },
            { coords = vector3(135.85, -3044.85, 6.62), length = 6.0, width = 4.0, heading = 359.0, minZ = 5.62, maxZ = 9.62 },
        }
    },
    ['Mekanik3'] = {
        settings = {
            label = 'Auto Care Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Auto Care Mekanik',
            coords = vector3(938.18, -970.69, 39.54),
            sprite = 643,
            scale = 0.65,
            color = 3,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "autocare",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(937.92, -970.73, 39.12), length = 6.0, width = 4.0, heading = 274.0, minZ = 38.12, maxZ = 42.12 },
            { coords = vector3(916.47, -981.43, 39.12), length = 6.0, width = 4.0, heading = 274.0, minZ = 38.12, maxZ = 42.12 },
            { coords = vector3(918.04, -974.58, 39.12), length = 6.0, width = 4.0, heading = 185.0, minZ = 38.12, maxZ = 42.12 },
            { coords = vector3(913.69, -958.61, 39.12), length = 6.0, width = 4.0, heading = 274.0, minZ = 38.12, maxZ = 42.12 },
            { coords = vector3(951.93, -946.46, 39.12), length = 6.0, width = 4.0, heading = 1.0, minZ = 38.12, maxZ = 42.12 },
            { coords = vector3(939.65, -957.79, 39.12), length = 6.0, width = 4.0, heading = 94.0, minZ = 38.12, maxZ = 42.12 },
        }
    },
   --[[  ['Mekanik4'] = { ---Kaan tarafından gereksiz görüldüğü için kapatıldı.
        settings = {
            label = 'LSCustom Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'LSCustom Mekanik',
            coords = vector3(732.25, -1077.35, 22.17),
            sprite = 643,
            scale = 0.65,
            color = 47,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "lscustom2",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(731.82, -1088.81, 21.75), length = 6.0, width = 4.0, heading = 271.0, minZ = 20.75, maxZ = 24.75 },
            { coords = vector3(729.47, -1072.20, 21.75), length = 6.0, width = 4.0, heading = 88.00, minZ = 20.75, maxZ = 24.75 },
            { coords = vector3(733.25, -1077.58, 21.75), length = 6.0, width = 4.0, heading = 180.0, minZ = 20.75, maxZ = 24.75 },
        }
    }, ]]
    -- ['Mekanik5'] = {
    --     settings = {
    --         label = 'Ottos Auto Mekanik',
    --         welcomeLabel = "Mekanik Menüsü",
    --         enabled = true,
    --     },
    --     blip = {
    --         label = 'Ottos Auto Mekanik',
    --         coords = vector3(830.62, -813.53, 25.92),
    --         sprite = 643,
    --         scale = 0.65,
    --         color = 8,
    --         display = 4,
    --         enabled = true,
    --     },
    --     categories = {
    --         mods = true,
    --         turbo = true,
    --         repair = true,
    --         respray = true,
    --         liveries = true,
    --         wheels = true,
    --         tint = true,
    --         plate = true,
    --         extras = true,
    --         neons = true,
    --         xenons = true,
    --         horn = true,
    --         cosmetics = true,
    --     },
    --     drawtextui = {
    --         text = "Mekanik Menüsü"
    --     },
    --     restrictions = { 
    --         job = "mechanic5",
    --         deniedClasses = { 15 } 
    --     },
    --     zones = {
    --         { coords = vector3(829.62, -820.21, 25.92), length = 6.0, width = 4.0, heading = 270.0, minZ = 24.92, maxZ = 27.92 },
    --         { coords = vector3(830.95, -806.63, 25.92), length = 6.0, width = 4.0, heading = 270.0, minZ = 24.92, maxZ = 27.92 },
    --         { coords = vector3(831.40, -813.49, 25.92), length = 6.0, width = 4.0, heading = 270.0, minZ = 24.92, maxZ = 27.92 },
    --     }
    -- },
    ['Mekanik6'] = {
        settings = { --Map boş lakin tamamını kapattığımda hata aldığım için sadece blip'i kapattım. 
            label = 'Hayes Auto Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Hayes Auto Mekanik',
            coords = vector3(-1417.53, -446.18, 35.90),
            sprite = 643,
            scale = 0.65,
            color = 24,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "hayesauto",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(-1423.94, -449.83, 35.50), length = 6.0, width = 4.0, heading = 270.0, minZ = 34.50, maxZ = 37.50 },
            { coords = vector3(-1411.66, -441.88, 35.50), length = 6.0, width = 4.0, heading = 270.0, minZ = 34.50, maxZ = 37.50 },
            { coords = vector3(-1417.45, -445.93, 35.50), length = 6.0, width = 4.0, heading = 270.0, minZ = 34.50, maxZ = 37.50 },
        }
    },
    ['Mekanik7'] = {
        settings = {
            label = 'LSCustom Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'LSCustom Mekanik',
            coords = vector3(-341.29, -140.93, 39.03),
            sprite = 643,
            scale = 0.65,
            color = 47,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "lscustom",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(-318.63, -119.83, 38.42), length = 6.0, width = 4.0, heading = 250.0, minZ = 37.42, maxZ = 41.42 },
            { coords = vector3(-321.59, -125.92, 38.41), length = 6.0, width = 4.0, heading = 250.0, minZ = 37.42, maxZ = 41.42 },
            { coords = vector3(-324.13, -132.66, 38.39), length = 6.0, width = 4.0, heading = 250.0, minZ = 37.42, maxZ = 41.42 },
            { coords = vector3(-327.07, -144.58, 38.48), length = 6.0, width = 4.0, heading = 250.0, minZ = 37.42, maxZ = 41.42 },
            { coords = vector3(-336.13, -117.62, 38.43), length = 6.0, width = 4.0, heading = 160.0, minZ = 37.42, maxZ = 41.42 },
            { coords = vector3(-335.10, -130.8, 38.43), length = 6.0, width = 4.0, heading = 160.0, minZ = 37.42, maxZ = 41.42 },
        }
    },
    --[[ ['Mekanik8'] = { ---Gereksiz olduğu gerekçesiyle Kaan tarafından kapatıldı.
        settings = {
            label = 'LSCustom Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'LSCustom Mekanik',
            coords = vector3(-1167.06, -2013.05, 12.65),
            sprite = 643,
            scale = 0.65,
            color = 47,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "lscustom3",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(-1167.06, -2013.05, 12.65), length = 6.0, width = 4.0, heading = 135.0, minZ = 11.65, maxZ = 14.65 },
            { coords = vector3(-1157.66, -2021.35, 12.65), length = 6.0, width = 4.0, heading = 135.0, minZ = 11.65, maxZ = 14.65 },
            { coords = vector3(-1152.79, -2026.56, 12.65), length = 6.0, width = 4.0, heading = 135.0, minZ = 11.65, maxZ = 14.65 },
            { coords = vector3(-1148.31, -2031.02, 12.65), length = 6.0, width = 4.0, heading = 135.0, minZ = 11.65, maxZ = 14.65 },
            { coords = vector3(-1140.17, -2017.23, 12.65), length = 6.0, width = 4.0, heading = 45.00, minZ = 11.65, maxZ = 14.65 },
            { coords = vector3(-1151.47, -2010.68, 12.65), length = 6.0, width = 4.0, heading = 45.00, minZ = 11.65, maxZ = 14.65 },
        }
    }, ]]
    ['Mekanik9'] = {
        settings = {
            label = 'East Custom Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'East Custom Mekanik',
            coords = vector3(886.58, -2113.5, 30.46),
            sprite = 643,
            scale = 0.65,
            color = 46,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "eastcustom",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(876.03, -2124.96, 30.14), length = 6.0, width = 4.0, heading = 175.0, minZ = 29.14, maxZ = 33.14 },
            { coords = vector3(887.29, -2125.93, 30.14), length = 6.0, width = 4.0, heading = 175.0, minZ = 29.14, maxZ = 33.14 },
            { coords = vector3(897.95, -2126.97, 30.14), length = 6.0, width = 4.0, heading = 175.0, minZ = 29.14, maxZ = 33.14 },
            { coords = vector3(909.19, -2127.83, 30.14), length = 6.0, width = 4.0, heading = 175.0, minZ = 29.14, maxZ = 33.14 },
            { coords = vector3(895.91, -2102.45, 30.14), length = 6.0, width = 4.0, heading = 175.0, minZ = 29.14, maxZ = 33.14 },
            { coords = vector3(888.20, -2101.92, 30.14), length = 6.0, width = 4.0, heading = 175.0, minZ = 29.14, maxZ = 33.14 },
        }
    },

    ['Mekanik10'] = {
        settings = {
            label = 'Domestic Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Domestic Mekanik',
            coords = vector3(531.21, -182.77, 54.2),
            sprite = 643,
            scale = 0.65,
            color = 46,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            job = "domestic",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(548.28, -199.08, 54.07), length = 6.0, width = 4.0, heading = 179.0, minZ = 50.88, maxZ = 58 },
            { coords = vector3(545.9, -189.4, 54.07), length = 6.0, width = 4.0, heading = 89.0, minZ = 50.88, maxZ = 58 },
            { coords = vector3(544.35, -178.93, 54.07), length = 6.0, width = 4.0, heading = 94.0, minZ = 50.88, maxZ = 58 },
            { coords = vector3(537.2, -169.04, 54.07), length = 6.0, width = 4.0, heading = 181.0, minZ = 50.88, maxZ = 58 },
        }
    },
    -- ['Mekanik10'] = {
    --     settings = {
    --         label = 'Paleto Bay Mekanik',
    --         welcomeLabel = "Mekanik Menüsü",
    --         enabled = true,
    --     },
    --     blip = {
    --         label = 'Paleto Bay Mekanik',
    --         coords = vector3(108.39, 6623.51, 31.36),
    --         sprite = 643,
    --         scale = 0.65,
    --         color = 31,
    --         display = 4,
    --         enabled = true,
    --     },
    --     categories = {
    --         mods = true,
    --         turbo = true,
    --         repair = true,
    --         respray = true,
    --         liveries = true,
    --         wheels = true,
    --         tint = true,
    --         plate = true,
    --         extras = true,
    --         neons = true,
    --         xenons = true,
    --         horn = true,
    --         cosmetics = true,
    --     },
    --     drawtextui = {
    --         text = "Mekanik Menüsü"
    --     },
    --     restrictions = { 
    --         job = "mechanic10",
    --         deniedClasses = { 15 } 
    --     },
    --     zones = {
    --         { coords = vector3(111.21, 6626.1, 31.36), length = 6.0, width = 4.0, heading = 43.0, minZ = 30.36, maxZ = 34.36 },
    --         { coords = vector3(105.34, 6622.0, 31.36), length = 6.0, width = 4.0, heading = 43.0, minZ = 30.36, maxZ = 34.36 },
    --     }
    -- },
    -- ['Mekanik11'] = {
    --     settings = {
    --         label = 'LSCustom Mekanik',
    --         welcomeLabel = "Mekanik Menüsü",
    --         enabled = true,
    --     },
    --     blip = {
    --         label = 'LSCustom Mekanik',
    --         coords = vector3(1174.77, 2640.45, 37.33),
    --         sprite = 643,
    --         scale = 0.65,
    --         color = 47,
    --         display = 4,
    --         enabled = true,
    --     },
    --     categories = {
    --         mods = true,
    --         turbo = true,
    --         repair = true,
    --         respray = true,
    --         liveries = true,
    --         wheels = true,
    --         tint = true,
    --         plate = true,
    --         extras = true,
    --         neons = true,
    --         xenons = true,
    --         horn = true,
    --         cosmetics = true,
    --     },
    --     drawtextui = {
    --         text = "Mekanik Menüsü"
    --     },
    --     restrictions = { 
    --         job = "mechanic11",
    --         deniedClasses = { 15 } 
    --     },
    --     zones = {
    --         { coords = vector3(1174.77, 2640.45, 37.33), length = 6.0, width = 4.0, heading = 180.0, minZ = 36.33, maxZ = 40.33 },
    --         { coords = vector3(1181.59, 2640.12, 37.33), length = 6.0, width = 4.0, heading = 180.0, minZ = 36.33, maxZ = 40.33 },
    --     }
    -- },
    ['lostmcmekanik'] = {
        settings = {
            label = 'Lost MC Mekanik',
            welcomeLabel = "Mekanik Menüsü",
            enabled = true,
        },
        blip = {
            label = 'Lost MC Mekanik',
            coords = vector3(987.68, -129.38, 74.06),
            sprite = 643,
            scale = 0.65,
            color = 46,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Menüsü"
        },
        restrictions = { 
            gang = "lostmc",
            deniedClasses = { 15 } 
        },
        zones = {
            { coords = vector3(981.3, -133.97, 74.06), length = 6.0, width = 4.0, heading = 59, minZ = 70.26, maxZ = 74.26 },
            { coords = vector3(985.09, -133.96, 74.06), length = 6.0, width = 4.0, heading = 59, minZ = 70.26, maxZ = 74.26 },
            
        },
    },
}