-----------------------
----   Variables   ----
-----------------------
local currentMenuItemID = 0
local currentMenuItem = ""
local currentMenuItem2 = ""
local currentMenu = "mainMenu"
local currentCategory = 0
local currentResprayCategory = 0
local currentResprayType = 0
local currentWheelCategory = 0
local currentNeonSide = 0

-----------------------
----   Functions   ----
-----------------------

local function toggleMenuContainer(state)
    SendNUIMessage({
        toggleMenuContainer = true,
        state = state
    })
end

local function createMenu(menu, heading, subheading)
    SendNUIMessage({
        createMenu = true,
        menu = menu,
        heading = heading,
        subheading = subheading
    })
end

local function destroyMenus()
    SendNUIMessage({
        destroyMenus = true
    })
end

local function populateMenu(menu, id, item, item2)
    SendNUIMessage({
        populateMenu = true,
        menu = menu,
        id = id,
        item = item,
        item2 = item2
    })
end

local function finishPopulatingMenu(menu)
    SendNUIMessage({
        finishPopulatingMenu = true,
        menu = menu
    })
end

local function updateMenuHeading(menu)
    SendNUIMessage({
        updateMenuHeading = true,
        menu = menu
    })
end

local function updateMenuSubheading(menu)
    SendNUIMessage({
        updateMenuSubheading = true,
        menu = menu
    })
end

local function updateMenuStatus(text)
    SendNUIMessage({
        updateMenuStatus = true,
        statusText = text
    })
end

local function toggleMenu(state, menu)
    SendNUIMessage({
        toggleMenu = true,
        state = state,
        menu = menu
    })
end

local function updateItem2Text(menu, id, text)
    SendNUIMessage({
        updateItem2Text = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function updateItem2TextOnly(menu, id, text)
    SendNUIMessage({
        updateItem2TextOnly = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function scrollMenuFunctionality(direction, menu)
    SendNUIMessage({
        scrollMenuFunctionality = true,
        direction = direction,
        menu = menu
    })
end

local function playSoundEffect(soundEffect, volume)
    SendNUIMessage({
        playSoundEffect = true,
        soundEffect = soundEffect,
        volume = volume
    })
end

local function isMenuActive(menu)
    local menuActive = false

    if menu == "modMenu" then
        for _, v in pairs(vehicleCustomisation) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "AraçBoyasıMenu" then
        for _, v in pairs(vehicleResprayOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "TekerleklerMenu" then
        for _, v in pairs(vehicleWheelOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "NeonsSideMenu" then
        for _, v in pairs(vehicleNeonOptions.neonTypes) do
            if (v.name:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    end

    return menuActive
end

local function updateCurrentMenuItemID(id, item, item2)
    currentMenuItemID = id
    currentMenuItem = item
    currentMenuItem2 = item2

    if isMenuActive("modMenu") then
        if currentCategory ~= 18 then
            PreviewMod(currentCategory, currentMenuItemID)
        end
    elseif isMenuActive("AraçBoyasıMenu") then
        PreviewColour(currentResprayCategory, currentResprayType, currentMenuItemID)
    elseif isMenuActive("TekerleklerMenu") then
        if currentWheelCategory ~= -1 and currentWheelCategory ~= 20 then
            PreviewWheel(currentCategory, currentMenuItemID, currentWheelCategory)
        end
    elseif isMenuActive("NeonsSideMenu") then
        PreviewNeon(currentNeonSide, currentMenuItemID)
    elseif currentMenu == "CamKaplamasıMenu" then
        PreviewWindowTint(currentMenuItemID)
    elseif currentMenu == "NeonRenkleriMenu" then
        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b

        PreviewNeonColour(r, g, b)
    elseif currentMenu == "XenonRenkleriMenu" then
        PreviewXenonColour(currentMenuItemID)
    elseif currentMenu == "OldLiveryMenu" then
        PreviewOldLivery(currentMenuItemID)
    elseif currentMenu == "PlakaKaplamasıMenu" then
        PreviewPlateIndex(currentMenuItemID)
    end
end

function InitiateMenus(isMotorcycle, vehicleHealth, categories, welcomeLabel)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    --#[Repair Menu]#--
    if vehicleHealth < 1000.0 and categories.repair then
        local repairCost = math.ceil(Config.BaseRepairPrice + ((1000 - vehicleHealth) * Config.RepairPriceMultiplier))
        if repairCost > 0 then
            TriggerServerEvent("qb-customs:server:updateRepairCost", repairCost)
            createMenu("repairMenu", welcomeLabel, "Aracı Tamir Et.")
            populateMenu("repairMenu", -1, "Tamir Et", "$" .. repairCost)
            finishPopulatingMenu("repairMenu")
        end
    end

    --#[Main Menu]#--
    createMenu("mainMenu", welcomeLabel, "Bir Kategori Seçiniz.")

    for _, v in ipairs(vehicleCustomisation) do
        local _, amountValidMods = CheckValidMods(v.category, v.id)

        if amountValidMods > 0 or v.id == 18 then
            if (v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15) then
                if categories.mods and maxVehiclePerformanceUpgrades ~= -1 then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 16 then
                if categories.armor then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 14 then
                if categories.horn then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 18 then
                if categories.turbo then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 48 then
                if categories.liveries then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            else
                if categories.cosmetics then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            end
        end
    end

    if categories.respray then populateMenu("mainMenu", -1, "Araç Boyası", "none") end

    if not isMotorcycle then
        if categories.tint then populateMenu("mainMenu", -2, "Cam Kaplaması", "none") end
        if categories.neons then populateMenu("mainMenu", -3, "Araç Altı Neon", "none") end
    end

    if categories.xenons then populateMenu("mainMenu", 22, "Xenon Far", "none") end
    if categories.wheels then populateMenu("mainMenu", 23, "Tekerlekler", "none") end

    local livCount = GetVehicleLiveryCount(plyVeh)
    if livCount > 0 and categories.liveries then
        populateMenu("mainMenu", 24, "Old Livery", "none")
    end

    if categories.plate then populateMenu("mainMenu", 25, "Plaka Kaplaması", "none") end
    if categories.extras then populateMenu("mainMenu", 26, "Araç Ekstraları", "none") end

    finishPopulatingMenu("mainMenu")

    --#[Mods Menu]#--
    for _, v in ipairs(vehicleCustomisation) do
        local validMods, amountValidMods = CheckValidMods(v.category, v.id)
        local currentMod, _ = GetCurrentMod(v.id)

        if amountValidMods > 0 or v.id == 18 then
            if v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15 or v.id == 16 then --Performance Upgrades
                local tempNum = 0

                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Bir Yükseltme Seçin.")

                for _, n in pairs(validMods) do
                    tempNum = tempNum + 1

                    if maxVehiclePerformanceUpgrades == 0 then
                        populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.performance.prices[tempNum])

                        if currentMod == n.id then
                            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Eklendi")
                        end
                    else
                        if tempNum <= (maxVehiclePerformanceUpgrades + 1) then
                            populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.performance.prices[tempNum])

                            if currentMod == n.id then
                                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Eklendi")
                            end
                        end
                    end
                end

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            elseif v.id == 18 then
                local currentTurboState = GetCurrentTurboState()
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Özelleştirme", "Turbo Ekle Veya Kaldır.")

                populateMenu(v.category:gsub("%s+", "") .. "Menu", -1, "Kaldır", "$0")
                populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Ekle", "$" .. vehicleCustomisationPrices.turbo.prices[2])

                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentTurboState, "Eklendi")

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            else
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Özelleştirme", "Bir Parça Seçiniz.")

                for _, n in pairs(validMods) do
                    populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.cosmetics.price)

                    if currentMod == n.id then
                        updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Eklendi")
                    end
                end

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            end
        end
    end

    --#[Respray Menu]#--
    createMenu("AraçBoyasıMenu", "Araç Boyası", "Bir Renk Kategorisi Seçin.")

    populateMenu("AraçBoyasıMenu", 0, "Birincl Renk", "none")
    populateMenu("AraçBoyasıMenu", 1, "İkincil Renk", "none")
    populateMenu("AraçBoyasıMenu", 2, "Sedef Rengi", "none")
    populateMenu("AraçBoyasıMenu", 3, "Tekerlek Rengi", "none")
    populateMenu("AraçBoyasıMenu", 4, "İç Rengi", "none")
    populateMenu("AraçBoyasıMenu", 5, "Panel Rengi", "none")

    finishPopulatingMenu("AraçBoyasıMenu")

    --#[Respray Types]#--
    createMenu("ResprayTypeMenu", "Respray Types", "Bir Renk Türü Seçin.")

    for _, v in ipairs(vehicleResprayOptions) do
        populateMenu("ResprayTypeMenu", v.id, v.category, "none")
    end

    finishPopulatingMenu("ResprayTypeMenu")

    --#[Respray Colours]#--
    for _, v in ipairs(vehicleResprayOptions) do
        createMenu(v.category .. "Menu", v.category .. " Colours", "Bir Renk Seçin.")

        for _, n in ipairs(v.colours) do
            populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.respray.price)
        end

        finishPopulatingMenu(v.category .. "Menu")
    end

    --#[Wheel Categories Menu]#--
    createMenu("TekerleklerMenu", "Wheel Categories", "Bir Kategori Seçiniz.")

    for _, v in ipairs(vehicleWheelOptions) do
        if isMotorcycle then
            if v.id == -1 or v.id == 20 or v.id == 6 then --Motorcycle Wheels
                populateMenu("TekerleklerMenu", v.id, v.category, "none")
            end
        else
            populateMenu("TekerleklerMenu", v.id, v.category, "none")
        end
    end

    finishPopulatingMenu("TekerleklerMenu")

    --#[Wheels Menu]#--
    for _, v in ipairs(vehicleWheelOptions) do
        if v.id == -1 then
            local currentCustomWheelState = GetCurrentCustomWheelState()
            createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Özel Tekerlek Ekle Veya Kaldır.")

            populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Kaldır", "$0")
            populateMenu(v.category:gsub("%s+", "") .. "Menu", 1, "Ekle", "$" .. vehicleCustomisationPrices.customwheels.price)

            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentCustomWheelState, "Eklendi")

            finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
        elseif v.id ~= 20 then
            if isMotorcycle then
                if v.id == 6 then --Motorcycle Wheels
                    local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)

                    createMenu(v.category .. "Menu", v.category .. " Tekerlekler", "Bir Tekerlek Seç.")

                    for _, n in pairs(validMods) do
                        populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                    end

                    finishPopulatingMenu(v.category .. "Menu")
                end
            else
                local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)

                createMenu(v.category .. "Menu", v.category .. " Tekerlekler", "Bir Tekerlek Seç.")

                for _, n in pairs(validMods) do
                    populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                end

                finishPopulatingMenu(v.category .. "Menu")
            end
        end
    end

    --#[Wheel Smoke Menu]#--
    local currentWheelSmokeR, currentWheelSmokeG, currentWheelSmokeB = GetCurrentVehicleWheelSmokeColour()
    createMenu("LastikDumanıMenu", "Lastik Dumanı Özelleştirme", "Bir Renk Seçin.")

    for k, v in ipairs(vehicleTyreSmokeOptions) do
        populateMenu("LastikDumanıMenu", k, v.name, "$" .. vehicleCustomisationPrices.wheelsmoke.price)

        if v.r == currentWheelSmokeR and v.g == currentWheelSmokeG and v.b == currentWheelSmokeB then
            updateItem2Text("LastikDumanıMenu", k, "Eklendi")
        end
    end

    finishPopulatingMenu("LastikDumanıMenu")

    --#[Window Tint Menu]#--
    local currentWindowTint = GetCurrentWindowTint()
    createMenu("CamKaplamasıMenu", "Cam Kaplaması", "Bir Kaplama Seçiniz.")

    for _, v in ipairs(vehicleWindowTintOptions) do
        populateMenu("CamKaplamasıMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.windowtint.price)

        if currentWindowTint == v.id then
            updateItem2Text("CamKaplamasıMenu", v.id, "Eklendi")
        end
    end

    finishPopulatingMenu("CamKaplamasıMenu")

    --#[Old Livery Menu]#--
    if livCount > 0 then
        local tempOldLivery = GetVehicleLivery(plyVeh)
        createMenu("OldLiveryMenu", "Old Livery Özelleştirme", "Choose a Livery")
        for i = 0, livCount - 1 do
            populateMenu("OldLiveryMenu", i, "Livery", "$100")
            if tempOldLivery == i then
                updateItem2Text("OldLiveryMenu", i, "Eklendi")
            end
        end
        finishPopulatingMenu("OldLiveryMenu")
    end

    --#[Plate Colour Index Menu]#--

    local tempPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    createMenu("PlakaKaplamasıMenu", "Plaka Rengi", "Bir Kaplama Seç.")
    local plateTypes = {
        "Beyaz Üzerine Mavi #1",
        "Siyah Üzerine Sarı",
        "Mavi Üzerine Sarı",
        "Beyaz Üzerine Mavi #2",
        "Beyaz Üzerine Mavi #3",
        "Kuzey Yankton",
    }
    for i = 0, #plateTypes - 1 do
        if i ~= 4 or (i == 4 and GetVehicleClass(plyVeh) == 18) or Config.allowGovPlateIndex then
            populateMenu("PlakaKaplamasıMenu", i, plateTypes[i + 1], "$" .. vehicleCustomisationPrices.plateindex.price)
            if tempPlateIndex == i then
                updateItem2Text("PlakaKaplamasıMenu", i, "Eklendi")
            end
        end
    end
    finishPopulatingMenu("PlakaKaplamasıMenu")

    --#[Vehicle Extras Menu]#--
    createMenu("AraçEkstralarıMenu", "Araç Ekstraları", "Bir Ekstra Parça Seç.")
    for i = 1, 12 do
        if DoesExtraExist(plyVeh, i) then
            populateMenu("AraçEkstralarıMenu", i, "Extra " .. tostring(i), "Takıldı")
        else
            populateMenu("AraçEkstralarıMenu", i, "Seçenek", "YOK")
        end
    end
    finishPopulatingMenu("AraçEkstralarıMenu")

    --#[Neons Menu]#--
    createMenu("AraçAltıNeonMenu", "Neon Özelleştirme", "Bir Kategori Seçiniz.")

    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        populateMenu("AraçAltıNeonMenu", v.id, v.name, "none")
    end

    populateMenu("AraçAltıNeonMenu", -1, "Neon Renkleri", "none")
    finishPopulatingMenu("AraçAltıNeonMenu")

    --#[Neon State Menu]#--
    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        local currentNeonState = GetCurrentNeonState(v.id)
        createMenu(v.name:gsub("%s+", "") .. "Menu", "Neon Özelleştirme", "Bir Neon Ekle.")

        populateMenu(v.name:gsub("%s+", "") .. "Menu", 0, "Kaldır", "$0")
        populateMenu(v.name:gsub("%s+", "") .. "Menu", 1, "Ekle", "$" .. vehicleCustomisationPrices.neonside.price)

        updateItem2Text(v.name:gsub("%s+", "") .. "Menu", currentNeonState, "Eklendi")

        finishPopulatingMenu(v.name:gsub("%s+", "") .. "Menu")
    end

    --#[Neon Colours Menu]#--
    local currentNeonR, currentNeonG, currentNeonB = GetCurrentNeonColour()
    createMenu("NeonRenkleriMenu", "Neon Renkleri", "Bir Renk Seçin.")

    for k, _ in ipairs(vehicleNeonOptions.neonColours) do
        populateMenu("NeonRenkleriMenu", k, vehicleNeonOptions.neonColours[k].name, "$" .. vehicleCustomisationPrices.neoncolours.price)

        if currentNeonR == vehicleNeonOptions.neonColours[k].r and currentNeonG == vehicleNeonOptions.neonColours[k].g and currentNeonB == vehicleNeonOptions.neonColours[k].b then
            updateItem2Text("NeonRenkleriMenu", k, "Eklendi")
        end
    end

    finishPopulatingMenu("NeonRenkleriMenu")

    --#[Xenons Menu]#--
    createMenu("XenonFarMenu", "Xenon Özelleştirme", "Bir Kategori Seçiniz.")

    populateMenu("XenonFarMenu", 0, "Far Ekle", "none")
    populateMenu("XenonFarMenu", 1, "Xenon Renkleri", "none")

    finishPopulatingMenu("XenonFarMenu")

    --#[Xenons Headlights Menu]#--
    local currentXenonState = GetCurrentXenonState()
    createMenu("FarEkleMenu", "Far Özelleştirme", "Xenon Far Ekleme.")

    populateMenu("FarEkleMenu", 0, "Xenon Far Kaldır", "$0")
    populateMenu("FarEkleMenu", 1, "Xenon Far Ekle", "$" .. vehicleCustomisationPrices.headlights.price)

    updateItem2Text("FarEkleMenu", currentXenonState, "Eklendi")

    finishPopulatingMenu("FarEkleMenu")

    --#[Xenons Colour Menu]#--
    local currentXenonColour = GetCurrentXenonColour()
    createMenu("XenonRenkleriMenu", "Xenon Renkleri", "Bir Renk Seçin.")

    for _, v in ipairs(vehicleXenonOptions.xenonColours) do
        populateMenu("XenonRenkleriMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.xenoncolours.price)

        if currentXenonColour == v.id then
            updateItem2Text("XenonRenkleriMenu", v.id, "Eklendi")
        end
    end

    finishPopulatingMenu("XenonRenkleriMenu")
end

function DestroyMenus()
    destroyMenus()
end

function DisplayMenuContainer(state)
    toggleMenuContainer(state)
end

function DisplayMenu(state, menu)
    if state then
        currentMenu = menu
    end

    toggleMenu(state, menu)
    updateMenuHeading(menu)
    updateMenuSubheading(menu)
end

function MenuManager(state, repairOnly)
    if state then
        if currentMenuItem2 ~= "Eklendi" then
            if isMenuActive("modMenu") then
                if currentCategory == 18 then --Turbo
                    if AttemptPurchase("turbo", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok!")
                    end
                elseif currentCategory == 11 or currentCategory == 12 or currentCategory == 13 or currentCategory == 15 or currentCategory == 16 then --Performance Upgrades
                    if AttemptPurchase("performance", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                else
                    if AttemptPurchase("cosmetics") then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                end
            elseif isMenuActive("AraçBoyasıMenu") then
                if AttemptPurchase("respray") then
                    ApplyColour(currentResprayCategory, currentResprayType, currentMenuItemID)
                    playSoundEffect("respray", 1.0)
                    updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                    updateMenuStatus("Satın Alındı")
                else
                    updateMenuStatus("Yeterli Paran Yok")
                end
            elseif isMenuActive("TekerleklerMenu") then
                if currentWheelCategory == 20 then
                    if AttemptPurchase("wheelsmoke") then
                        local r = vehicleTyreSmokeOptions[currentMenuItemID].r
                        local g = vehicleTyreSmokeOptions[currentMenuItemID].g
                        local b = vehicleTyreSmokeOptions[currentMenuItemID].b

                        ApplyTyreSmoke(r, g, b)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                else
                    if currentWheelCategory == -1 then --Custom Wheels
                        local currentWheel = GetCurrentWheel()

                        if currentWheel == -1 then
                            updateMenuStatus("Can't Apply Custom Tyres to Stock Wheels")
                        else
                            if AttemptPurchase("customwheels") then
                                ApplyCustomWheel(currentMenuItemID)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                                updateMenuStatus("Satın Alındı")
                            else
                                updateMenuStatus("Yeterli Paran Yok")
                            end
                        end
                    else
                        local currentWheel = GetCurrentWheel()
                        local currentCustomWheelState = GetOriginalCustomWheel()

                        if currentCustomWheelState and currentWheel == -1 then
                            updateMenuStatus("Can't Apply Stock Wheels With Custom Tyres")
                        else
                            if AttemptPurchase("wheels") then
                                ApplyWheel(currentCategory, currentMenuItemID, currentWheelCategory)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                                updateMenuStatus("Satın Alındı")
                            else
                                updateMenuStatus("Yeterli Paran Yok")
                            end
                        end
                    end
                end
            elseif isMenuActive("NeonsSideMenu") then
                if AttemptPurchase("neonside") then
                    ApplyNeon(currentNeonSide, currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                    updateMenuStatus("Satın Alındı")
                else
                    updateMenuStatus("Yeterli Paran Yok")
                end
            else
                if currentMenu == "repairMenu" then
                    if AttemptPurchase("repair") then
                        currentMenu = "mainMenu"

                        RepairVehicle()

                        if not repairOnly then
                            toggleMenu(false, "repairMenu")
                            toggleMenu(true, currentMenu)
                        else
                            ExitBennys()
                            QBCore.Functions.Notify('Aracınız tamir edildi!')
                        end
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                        playSoundEffect("wrench", 0.4)
                        updateMenuStatus("")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "mainMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentCategory = currentMenuItemID

                    toggleMenu(false, "mainMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "AraçBoyasıMenu" then
                    currentMenu = "ResprayTypeMenu"
                    currentResprayCategory = currentMenuItemID

                    toggleMenu(false, "AraçBoyasıMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "ResprayTypeMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentResprayType = currentMenuItemID

                    toggleMenu(false, "ResprayTypeMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "TekerleklerMenu" then
                    local currentWheel, _, currentWheelType = GetCurrentWheel()

                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentWheelCategory = currentMenuItemID

                    if currentWheelType == currentWheelCategory then
                        updateItem2Text(currentMenu, currentWheel, "Eklendi")
                    end

                    toggleMenu(false, "TekerleklerMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "AraçAltıNeonMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentNeonSide = currentMenuItemID

                    toggleMenu(false, "AraçAltıNeonMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "XenonFarMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"

                    toggleMenu(false, "XenonFarMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "CamKaplamasıMenu" then
                    if AttemptPurchase("windowtint") then
                        ApplyWindowTint(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "NeonRenkleriMenu" then
                    if AttemptPurchase("neoncolours") then
                        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
                        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
                        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b

                        ApplyNeonColour(r, g, b)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "FarEkleMenu" then
                    if AttemptPurchase("headlights") then
                        ApplyXenonLights(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "XenonRenkleriMenu" then
                    if AttemptPurchase("xenoncolours") then
                        ApplyXenonColour(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "OldLiveryMenu" then
                    if AttemptPurchase("oldlivery") then
                        ApplyOldLivery(currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "PlakaKaplamasıMenu" then
                    if AttemptPurchase("plateindex") then
                        ApplyPlateIndex(currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Eklendi")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "AraçEkstralarıMenu" then
                    ApplyExtra(currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2TextOnly(currentMenu, currentMenuItemID, "Takıldı")
                    updateMenuStatus("Satın Alındı")
                end
            end
        else
            if currentMenu == "AraçEkstralarıMenu" then
                ApplyExtra(currentMenuItemID)
                playSoundEffect("wrench", 0.4)
                updateItem2TextOnly(currentMenu, currentMenuItemID, "Takıldı")
                updateMenuStatus("Satın Alındı")
            end
        end
    else
        updateMenuStatus("")

        if isMenuActive("modMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "mainMenu"

            if currentCategory ~= 18 then
                RestoreOriginalMod()
            end

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("AraçBoyasıMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "ResprayTypeMenu"

            RestoreOriginalColours()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("TekerleklerMenu") then
            if currentWheelCategory ~= 20 and currentWheelCategory ~= -1 then
                local currentWheel = GetOriginalWheel()

                updateItem2Text(currentMenu, currentWheel, "$" .. vehicleCustomisationPrices.wheels.price)

                RestoreOriginalWheels()
            end

            toggleMenu(false, currentMenu)

            currentMenu = "TekerleklerMenu"


            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("NeonsSideMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "AraçAltıNeonMenu"

            RestoreOriginalNeonStates()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        else
            if currentMenu == "mainMenu" or currentMenu == "repairMenu" then
                ExitBennys()
            elseif currentMenu == "AraçBoyasıMenu" or currentMenu == "CamKaplamasıMenu" or currentMenu == "TekerleklerMenu" or currentMenu == "AraçAltıNeonMenu" or currentMenu == "XenonFarMenu" or currentMenu == "OldLiveryMenu" or currentMenu == "PlakaKaplamasıMenu" or currentMenu == "AraçEkstralarıMenu" then
                toggleMenu(false, currentMenu)

                if currentMenu == "CamKaplamasıMenu" then
                    RestoreOriginalWindowTint()
                end

                if currentMenu == "OldLiveryMenu" then
                    RestoreOldLivery()
                end
                if currentMenu == "PlakaKaplamasıMenu" then
                    RestorePlateIndex()
                end

                currentMenu = "mainMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "ResprayTypeMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "AraçBoyasıMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "NeonRenkleriMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "AraçAltıNeonMenu"

                RestoreOriginalNeonColours()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "FarEkleMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonFarMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "XenonRenkleriMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonFarMenu"

                RestoreOriginalXenonColour()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            end
        end
    end
end

function MenuScrollFunctionality(direction)
    scrollMenuFunctionality(direction, currentMenu)
end

-----------------------
----   Threads     ----
-----------------------

-----------------------
---- Client Events ----
-----------------------

RegisterNUICallback("selectedItem", function(data, cb)
    updateCurrentMenuItemID(tonumber(data.id), data.item, data.item2)
    cb("ok")
end)

RegisterNUICallback("updateItem2", function(data, cb)
    currentMenuItem2 = data.item
    cb("ok")
end)
