Config = Config or {}

Config.Debug = false -- Set to True to enable Debug Prints
Config.MoneyType = 'bank'
Config.RepairMoneyType = 'bank'
Config.DefaultRepairPrice = 100 -- Repair price that is used if a vehicle-specific price is not available
Config.BaseRepairPrice = 0 -- Starting repair price. Every player's vehicle damage (0-1000) is added to it later. If the final price is 0 or less, the repair menu does not appear
Config.RepairPriceMultiplier = 1.0 -- Every player's vehicle damage (0-1000) is multiplier by this number, and then added to the base repair price
Config.UseRadial = false -- Will use qb-radial menu for entering instead of press E
Config.allowGovPlateIndex = false -- Setting this to true will allow all vehicles to purchase gov plate index "Blue on White #3" (only for emergency vehicles otherwise)

Config.DisableWhenMechanicsOnline = false -- Disables customs completely if enough mechanics are online and on-duty
Config.MinOnlineMechanics = 1 -- The amount of mechanics that have to be online and on-duty to disable customs (mechanics can still use them)
Config.DisabledCategoriesMechanics = {
    repair = false,
    mods = false,
    armor = false,
    respray = false,
    liveries = false,
    wheels = false,
    tint = false,
    plate = false,
    extras = false,
    neons = false,
    xenons = false,
    horn = false,
    turbo = false,
    cosmetics = false,
} -- `true` to disable category if enough mechanics are online and on-duty, `false` to ignore

Config.PayWithSocietyWhenJobRestricted = true -- Whether to have job societies pay for employees if the location is restricted to the job
Config.PaidBySociety = {
    -- 'mechanic',
} -- List of job societies that pay for employees, regardless of the customs location

maxVehiclePerformanceUpgrades = 0 -- | All Upgrades: 0 | No Upgrades: -1 | Can be -1 to 4

-- ADJUST PRICING
vehicleCustomisationPrices = {
    cosmetics = {price = 10},
    respray = {price = 10},
    performance = {prices = {0, 10, 15, 20, 25, 30, 35}},
    turbo = {prices = {0, 10}},
    wheels = {price = 10},
    customwheels = {price = 10},
    wheelsmoke = {price = 10},
    windowtint = {price = 10},
    neonside = {price = 10},
    neoncolours = {price = 10},
    headlights = {price = 10},
    xenoncolours = {price = 10},
    oldlivery = {price = 10},
    plateindex = {price = 10}
}

-- WINDOW TINTS

vehicleWindowTintOptions = {
    {name = "Yok", id = 0},
    {name = "Full Siyah", id = 1},
    {name = "Orta Siyah", id = 2},
    {name = "Hafif Siyah", id = 3}
}

-- HEADLIGHTS

vehicleXenonOptions = {
    xenonColours = {
        {name = "Stok", id = 255},
        {name = "Beyaz", id = 0}, 
        {name = "Mavi", id = 1},
        {name = "Açık Mavi", id = 2},
        {name = "Yeşil", id = 3},
        {name = "Açık Yeşil", id = 4},
        {name = "Sarı", id = 5},
        {name = "Altın Sarısı", id = 6},
        {name = "Turuncu", id = 7},
        {name = "Kırmızı", id = 8},
        {name = "Açık Pembe", id = 9},
        {name = "Pembe", id = 10},
        {name = "Mor", id = 11},
        {name = "Koyu Mavi", id = 12}
    }
}

-- WHEELS

vehicleWheelOptions = {
    {category = "Özel Lastik", id = -1, wheelID = 23},
    {category = "Lastik Dumanı", id = 20, wheelID = 23},
    {category = "Sport", id = 0, wheelID = 23},
    {category = "Muscle", id = 1, wheelID = 23},
    {category = "Lowrider", id = 2, wheelID = 23},
    {category = "SUV", id = 3, wheelID = 23},
    {category = "Offroad", id = 4, wheelID = 23},
    {category = "Tuner", id = 5, wheelID = 23},
    {category = "Motorcycle", id = 6, wheelID = 23},
    {category = "Highend", id = 7, wheelID = 23},
    {category = "BennysWheel", id = 8, wheelID = 23},
    {category = "BespokeWheel", id = 9, wheelID = 23},
    {category = "Dragster", id = 10, wheelID = 23},
    {category = "Street", id = 11, wheelID = 23},
    {category = "Rally", id = 12, wheelID = 23},
}

-- TIRE SMOKE

vehicleTyreSmokeOptions = {
    { name = "Beyaz duman", r = 254, g = 254, b = 254},
    { name = "Siyah duman", r = 1, g = 1, b = 1},
    { name = "Mavi Duman", r = 0, g = 150, b = 255},
    { name = "Sarı Duman", r = 255, g = 255, b = 50},
    { name = "Turuncu Duman", r = 255, g = 153, b = 51},
    { name = "Kırmızı Duman", r= 255, g = 10, b = 10},
    { name = "Yeşil Duman", r = 10, g = 255, b = 10},
    { name = "Mor Duman", r = 153, g = 10, b = 153},
    { name = "Pembe Duman", r = 255, g = 102, b = 178},
    { name = "Gri Duman", r = 128, g = 128, b = 128}
}

-- NEONS

vehicleNeonOptions = {
    category = "Neons",
    neonTypes = {
        {name = "Ön Alt Neon", id = 2},
        {name = "Arka Alt Neon", id = 3},
        {name = "Sol Alt Neon",id = 0},
        {name = "Sağ Alt Neon", id = 1}
    },
    neonColours = {
        { name = "Beyaz", r = 222, g = 222, b = 255},
        { name = "Mavi", r = 2, g = 21, b = 255},
        { name = "Açık Mavi", r = 3, g = 83, b = 255},
        { name = "Yeşil", r = 0, g = 255, b = 140},
        { name = "Açık Yeşil", r = 94, g = 255, b = 1},
        { name = "Sarı", r = 255, g = 255, b = 0},
        { name = "Altın Sarısı", r = 255, g = 150, b = 0},
        { name = "Turuncu", r = 255, g = 62, b = 0},
        { name = "Kırmızı", r = 255, g = 1, b = 1},
        { name = "Açık Pembe", r = 255, g = 50, b = 100},
        { name = "Pembe", r = 255, g = 5, b = 190},
        { name = "Mor", r = 35, g = 1, b = 255},
        { name = "Koyu Mavi", r = 15, g = 3, b = 255}
    }
}

-- MAIN COMPONENTS

vehicleCustomisation = {
    {category = "Spoiler", id = 0},
    {category = "Ön Tampon", id = 1},
    {category = "Arka Tampon", id = 2},
    {category = "Yan Etek", id = 3},
    {category = "Egzoz", id = 4},
    {category = "Silindir Kafes", id = 5},
    {category = "Izgara", id = 6},
    {category = "Kaput", id = 7},
    {category = "Bagaj", id = 8},
    {category = "Arka Rüzgarlık", id = 9},
    {category = "Çatı", id = 10},
    {category = "Motor Yükseltmesi", id = 11},
    {category = "Fren Yükseltmesi", id = 12},
    {category = "Silindir Yükseltmesi", id = 13},
    {category = "Süspansiyon Yükseltmesi", id = 15},
    {category = "Zırh Yükseltmesi", id = 16},
    {category = "Turbo Yükseltmesi", id = 18},
    {category = "Özel Plaka", id = 25},
    {category = "Trim A", id = 27},
    {category = "Süsler", id = 28},
    {category = "Gösterge Tablosu", id = 29},
    {category = "Kadran", id = 30},
    {category = "Kapı Hoparlörü", id = 31},
    {category = "Koltuklar", id = 32},
    {category = "Direksiyon Simidi", id = 33},
    {category = "Vites Kolu", id = 34},
    {category = "Plak", id = 35},
    {category = "Hoparlör", id = 36},
    {category = "Gövde", id = 37},
    {category = "Hidrolik", id = 38},
    {category = "Motor Bloğu", id = 39},
    {category = "Hava Filtresi", id = 40},
    {category = "Dikme", id = 41},
    {category = "Kemer Kapağı", id = 42},
    {category = "Anten", id = 43},
    {category = "Döşeme B", id = 44},
    {category = "Yakıt Deposu", id = 45},
    {category = "Pencere", id = 46},
    {category = "Kaplamalar", id = 48},
    {category = "Kornalar", id = 14,
        hornNames = {
            {name = "Kamyon Kornası", id = 0},
            {name = "Polis Kornası", id = 1},
            {name = "Palyaço Kornası", id = 2},
            {name = "Müzikal Korna 1", id = 3},
            {name = "Müzikal Korna 2", id = 4},
            {name = "Müzikal Korna 3", id = 5},
            {name = "Müzikal Korna 4", id = 6},
            {name = "Müzikal Korna 5", id = 7},
            {name = "Üzgün Trombon", id = 8},
            {name = "Klasik Korna 1", id = 9},
            {name = "Klasik Korna 2", id = 10},
            {name = "Klasik Korna 3", id = 11},
            {name = "Klasik Korna 4", id = 12},
            {name = "Klasik Korna 5", id = 13},
            {name = "Klasik Korna 6", id = 14},
            {name = "Klasik Korna 7", id = 15},
            {name = "Nota - Do", id = 16},
            {name = "Nota - Re", id = 17},
            {name = "Nota - Mi", id = 18},
            {name = "Nota - Fa", id = 19},
            {name = "Nota - Sol", id = 20},
            {name = "Nota - La", id = 21},
            {name = "Nota - Ti", id = 22},
            {name = "Nota - Do", id = 23},
            {name = "Caz Korna 1", id = 24},
            {name = "Caz Korna 2", id = 25},
            {name = "Caz Korna 3", id = 26},
            {name = "Caz Korna Döngü", id = 27},
            {name = "Melodili 1", id = 28},
            {name = "Melodili 2", id = 29},
            {name = "Melodili 3", id = 30},
            {name = "Melodili 4", id = 31},
            {name = "Klasik Korna 8 Döngü", id = 32},
            {name = "Klasik Korna 9 Döngü", id = 33},
            {name = "Klasik Korna 10 Döngü", id = 34},
            {name = "Klasik Korna 8", id = 35},
            {name = "Klasik Korna 9", id = 36},
            {name = "Klasik Korna 10", id = 37},
            {name = "Cenaze Döngü", id = 38},
            {name = "Cenaze", id = 39},
            {name = "Ürkütücü Döngü", id = 40},
            {name = "Ürkütücü", id = 41},
            {name = "San Andreas Döngü", id = 42},
            {name = "San Andreas", id = 43},
            {name = "Liberty City Döngü", id = 44},
            {name = "Liberty City", id = 45},
            {name = "Festival 1 Döngü", id = 46},
            {name = "Festival 1", id = 47},
            {name = "Festival 2 Döngü", id = 48},
            {name = "Festival 2", id = 49},
            {name = "Festival 3 Döngü", id = 50},
            {name = "Festival 3", id = 51}
        }
    }
}

-- COLORS

vehicleResprayOptions = {
    {category = "Standart", id = 0,
        colours = {
            {name = "Siyah", id = 0},
            {name = "Karbon Siyah", id = 147},
            {name = "Grafit", id = 1},
            {name = "Antrasit Siyah", id = 11},
            {name = "Siyah Çelik", id = 2},
            {name = "Koyu Çelik", id = 3},
            {name = "Gümüş", id = 4},
            {name = "Mavimsi Gümüş", id = 5},
            {name = "Haddelenmiş Çelik", id = 6},
            {name = "Gölge Gümüş", id = 7},
            {name = "Taş Gümüş", id = 8},
            {name = "Gece Yarısı Gümüşü", id = 9},
            {name = "Dökme Demir Gümüş", id = 10},
            {name = "Kırmızı", id = 27},
            {name = "Torino Kırmızısı", id = 28},
            {name = "Formül Kırmızısı", id = 29},
            {name = "Lav Kırmızısı", id = 150},
            {name = "Alev Kırmızısı", id = 30},
            {name = "Zarafet Kırmızısı", id = 31},
            {name = "Garnet Kırmızısı", id = 32},
            {name = "Gün Batımı Kırmızısı", id = 33},
            {name = "Cabernet Kırmızısı", id = 34},
            {name = "Şarap Kırmızısı", id = 143},
            {name = "Şeker Kırmızısı", id = 35},
            {name = "Sıcak Pembe", id = 135},
            {name = "Pfsiter Pembesi", id = 137},
            {name = "Somon Pembesi", id = 136},
            {name = "Gün Doğumu Portakalı", id = 36},
            {name = "Turuncu", id = 38},
            {name = "Parlak Turuncu", id = 138},
            {name = "Altın", id = 99},
            {name = "Bronz", id = 90},
            {name = "Sarı", id = 88},
            {name = "Yarış Sarısı", id = 89},
            {name = "Çiğ Sarısı", id = 91},
            {name = "Koyu Yeşil", id = 49},
            {name = "Yarış Yeşili", id = 50},
            {name = "Deniz Yeşili", id = 51},
            {name = "Zeytin Yeşili", id = 52},
            {name = "Parlak Yeşil", id = 53},
            {name = "Benzin Yeşili", id = 54},
            {name = "Kireç Yeşili", id = 92},
            {name = "Gece Mavisi", id = 141},
            {name = "Galaksi Mavisi", id = 61},
            {name = "Koyu Mavi", id = 62},
            {name = "Sakson Mavisi", id = 63},
            {name = "Mavi", id = 64},
            {name = "Denizci Mavisi", id = 65},
            {name = "Liman Mavisi", id = 66},
            {name = "Elmas Mavisi", id = 67},
            {name = "Sörf Mavisi", id = 68},
            {name = "Deniz Mavisi", id = 69},
            {name = "Yarış Mavisi", id = 73},
            {name = "Ultra Mavi", id = 70},
            {name = "Açık Mavi", id = 74},
            {name = "Kahverengi Çikolata", id = 96},
            {name = "Bizon Kahverengi", id = 101},
            {name = "Creeen Kahverengi", id = 95},
            {name = "Feltzer Kahverengi", id = 94},
            {name = "Akçaağaç Kahverengi", id = 97},
            {name = "Kayın Ağacı Kahverengi", id = 103},
            {name = "Sienna Kahverengi", id = 104},
            {name = "Eyer Kahverengi", id = 98},
            {name = "Kestane Rengi", id = 100},
            {name = "Ahşap Kahverengisi", id = 102},
            {name = "Saman Kahverengisi", id = 99},
            {name = "Kumlu Kahverengi", id = 105},
            {name = "Ağartılmış Kahverengi", id = 106},
            {name = "Eflatun", id = 71},
            {name = "Balon Moru", id = 72},
            {name = "Gece Moru", id = 142},
            {name = "Parlak Mor", id = 145},
            {name = "Krem", id = 107},
            {name = "Buz Beyazı", id = 111},
            {name = "Kar Beyazı", id = 112}
        }
    },
    {category = "Mat", id = 1,
        colours = {
            {name = "Siyah", id = 12},
            {name = "Gri", id = 13},
            {name = "Açık Gri", id = 14},
            {name = "Buz Beyazı", id = 131},
            {name = "Mavi", id = 83},
            {name = "Koyu Mavi", id = 82},
            {name = "Gece Mavisi", id = 84},
            {name = "Gece Yarısı Moru", id = 149},
            {name = "Schafter Mor", id = 148},
            {name = "Kırmızı", id = 39},
            {name = "Koyu Kırmızı", id = 40},
            {name = "Turuncu", id = 41},
            {name = "Sarı", id = 42},
            {name = "Kireç Yeşili", id = 55},
            {name = "Yeşil", id = 128},
            {name = "Orman Yeşili", id = 151},
            {name = "Yeşillik Yeşili", id = 155},
            {name = "Zeytin Darbesi", id = 152},
            {name = "Karanlık Dünya", id = 153},
            {name = "Çöl Bronzluğu", id = 154}
        }
    },
    {category = "Metalik", id = 2,
            colours = {
            {name = "Fırçalanmış Çelik", id = 117},
            {name = "Fırçalanmış Siyah Çelik", id = 118},
            {name = "Fırçalanmış Alüminyum", id = 119},
            {name = "Saf Altın", id = 158},
            {name = "Fırçalanmış Altın", id = 159},
            {name = "Krom", id = 120}
        }
    }
}
