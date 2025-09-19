local dateOfBirthFormat = "DD.MM.YYYY" -- ADJUST IT IF YOU HAVE DIFFERENT


local function GenerateSSN(dateOfBirth, gender)
    -- Default SSN Format:
    --[[
        YY = Year of birth
        MM = Month of birth
        DD = Day of birth
        RRRR = Random numbers
        G = Gender (0 = male / 1 = female)

        YYMMDDRRRRG
    ]]
    
    local formatSSN = "YYMMDDRRRRG"

    local function parseDate(format, date)
        local part1, part2, part3 = date:match("(%d+)%p(%d+)%p(%d+)")
        
        local d, m, y
        if format == "DD.MM.YYYY" then
            d, m, y = part1, part2, part3
        elseif format == "MM.DD.YYYY" then
            m, d, y = part1, part2, part3
        elseif format == "YYYY.MM.DD" then
            y, m, d = part1, part2, part3
        elseif format == "YYYY.DD.MM" then
            y, d, m = part1, part2, part3
        else
            error("Unknown format for date of birth: " .. format)
        end
        
        return d, m, y
    end
    
    local d, m, y = parseDate(dateOfBirthFormat, dateOfBirth)

    if string.find(formatSSN, "YY") then
        y = string.sub(y, -2)
        formatSSN = string.gsub(formatSSN, "YY", y)
    end

    if string.find(formatSSN, "MM") then
        if tonumber(m) < 10 then
            m = "0"..tonumber(m)
        end
        formatSSN = string.gsub(formatSSN, "MM", m)
    end

    if string.find(formatSSN, "DD") then
        if tonumber(d) < 10 then
            d = "0"..tonumber(d)
        end
        formatSSN = string.gsub(formatSSN, "DD", d)
    end

    if string.find(formatSSN, "DD") then
        if tonumber(d) < 10 then
            d = "0"..tonumber(d)
        end
        formatSSN = string.gsub(formatSSN, "DD", d)
    end

    if string.find(formatSSN, "DD") then
        if tonumber(d) < 10 then
            d = "0"..tonumber(d)
        end
        formatSSN = string.gsub(formatSSN, "DD", d)
    end

    
    if gender then
        local g = "?"

        if gender == "male" or gender == "m" or gender == 0 or gender == "0" then
            g = '0'
        else
            g = '1'
        end

        if string.find(formatSSN, "G") then
            formatSSN = string.gsub(formatSSN, "G", g)
        end
    end

    local function replaceRWithRandomNumber()
        return (string.gsub(formatSSN, "R", function()
            return tostring(math.random(0, 9))
        end))
    end

    local formatSSN = replaceRWithRandomNumber(formatSSN)

    local isExist = MySQL.scalar.await("SELECT 1 FROM users WHERE ssn = ?", {formatSSN})
    if isExist then
        return GenerateSSN(dateOfBirth, gender)
    end

    return formatSSN
end
exports('GenerateSSN', GenerateSSN)

RegisterCommand('_generatessn', function(src)
    if src ~= 0 then
        return
    end

    print('^3[MODULE:SSN_GENERATE]^8 Do not restart server!^7')
    Citizen.Wait(200)
    MySQL.Async.fetchAll('SELECT * FROM users', {}, function(result)
        if result and result[1] then
            local remaining = #result
            for k, v in pairs(result) do
                remaining = remaining - 1
                if not v.ssn then
                    local playerSSN = GenerateSSN(v.dateofbirth, v.sex)
                    MySQL.prepare("UPDATE `users` SET `ssn` = ? WHERE `identifier` = ?", {playerSSN, v.identifier}, function(results)
                        if results then
                            print(('^2[SUCCESS]^7 Generated SSN ^4%s^7 for ^5%s^7 (Remaining: %s)^7'):format(playerSSN, v.identifier, remaining))
                        else
                            print(('^8[ERROR]^7 Not generated SSN ^4%s^7 for ^5%s^7 (Remaining: %s)^7'):format(playerSSN, v.identifier, remaining))
                        end
                    end)
                    Citizen.Wait(300)
                end
            end
            print('^3[MODULE:SSN_GENERATE]^7 Correctly generated SSN for each user!')
        else
            print('^3[MODULE:SSN_GENERATE]^7 No users found!')
        end
    end)
end, true)