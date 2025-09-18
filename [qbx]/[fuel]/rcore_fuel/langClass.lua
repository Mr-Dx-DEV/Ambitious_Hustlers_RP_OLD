Locales = {}

-- this is for translation
function _U(str, ...)
    if type(Locales) ~= "table" then
        print(string.format("^9[%s]^0 the locales is wrong type, it is not a table..", GetCurrentResourceName()))
        return string.format(DefaultLocales[str], ...)
    end
    if not Locales[Config.Locale] then
        print(string.format("^9[%s]^0 The language ^9[%s]^0 does not exists! Please use locales that does exists! Using default locales backup for now!", GetCurrentResourceName(), Config.Locale))
        return string.format(DefaultLocales[str], ...)
    end
    if not Locales[Config.Locale][str] then
        print(("^0You're missing this translation in: ^9[%s] ^0the key is called: ^9[%s] Please correct this issue by either updating the locales or manually creating the key! Using default locales backup for now!"):format(Config.Locale, str))
        return string.format(DefaultLocales[str], ...)
    end
    if Config.ForceNormalKeyLabels then
        return string.format(ReplaceKeyString(Locales[Config.Locale][str]), ...)
    end
    return string.format(Locales[Config.Locale][str], ...)
end