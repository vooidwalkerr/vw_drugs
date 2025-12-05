Config = {}

-- select your language {en, it}
Config.Locale = 'en'

Locales = {}

Config.ToPack = {
    Marijuana = { -- fixed time amount 20sec (to change: )
        label = 'Pack weed',
        amt = 100,
        icon = 'fas fa-seedling',
        item = 'weed',
        result = 'weed_brick'
    },
}

Config.HarvestLocations = {
    WeedField = {
        type = 'r', -- field type (r == harvest, p == process)
        label = "Harvest weed", -- label for ox_target
        coords = vector3(2220.0, 5577.0, 53.8), -- coords
        giveItem = "cannabis", -- item to give
        giveAmount = 1, -- amount to give
        time = 3 * 1000 -- required time (in milliseconds)
    },

    WeedProcessing = {
        type = 'p', -- field type (r == harvest, p == process)
        label = "Process weed", -- label for ox_target
        coords = vector3(1343.37, 4390.71, 44.34), -- coords
        removeItems = {"cannabis"}, -- items to remove (can be more than one, separated by ',')
        removeAmount = {5}, -- amount of item to remove (same as for the item before)
        giveItem = "weed", -- item to give (1 type)
        giveAmount = 3, -- amount to give
        time = 3 * 1000 -- required time (in milliseconds)
    },
}


-- Funcion for translations (DO NOT TOUCH)
function _U(str, ...)
    if Locales[Config.Locale] then
        if Locales[Config.Locale][str] then
            return string.format(Locales[Config.Locale][str], ...)
        else
            return 'Translations [' .. Config.Locale .. '][' .. str .. '] not found'
        end
    else
        return 'Language [' .. Config.Locale .. '] not found'
    end
end
