-- this will deep copy whole table
--- @param object table
function deepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if _G["type"](object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end

    return _copy(object)
end
-- deepCopy is DeepCopy!
DeepCopy = deepCopy

function dump(node, printing, keyIdentifier)
    local cache, stack, output = {}, {}, {}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k, v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k, v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str, "}", output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str, "\n", output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output, output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    local skip = false
                    if keyIdentifier == "gasPrices" then
                        skip = true
                        for _key, val in pairs(FuelType) do
                            if val == k then
                                key = "[FuelType." .. _key .. "]"
                            end
                        end
                    end

                    if not skip then
                        key = "[" .. tostring(k) .. "]"
                    end
                else
                    local k_str = tostring(k)
                    local has_spaces = string.find(k_str, "%s") ~= nil
                    if has_spaces then
                        key = "['" .. tostring(k) .. "']"
                    else
                        key = tostring(k)
                    end
                end

                local isWhitelisted = false

                if type(v) == "string" then
                    isWhitelisted = string.match(string.lower(v), "nil")
                end

                if (type(v) == "number" or type(v) == "boolean" or type(v) == "vector3" or isWhitelisted or key == "fuelTypeList" or key == "gasPrices") then
                    local skip = false


                    if key == "gasPrices" then
                        skip = true

                        local fuelTypeString = ""
                        for _k, _v in pairs(v) do
                            for key, val in pairs(FuelType) do
                                if val == _k then
                                    fuelTypeString = fuelTypeString .. "\n      [FuelType." .. key .. "] = " .. _v .. ", "
                                end
                            end
                        end

                        output_str = output_str .. string.rep('\t', depth) .. key .. " = { " .. fuelTypeString .. " \n    }"
                    end

                    if key == "fuelTypeList" then
                        skip = true
                        local fuelTypeString = ""
                        for _k, _v in pairs(v) do
                            for key, val in pairs(FuelType) do
                                if val == _v then
                                    fuelTypeString = fuelTypeString .. "FuelType." .. key .. ", "
                                end
                            end
                        end

                        output_str = output_str .. string.rep('\t', depth) .. key .. " = { " .. fuelTypeString .. " }"
                    end
                    if not skip then
                        output_str = output_str .. string.rep('\t', depth) .. key .. " = " .. tostring(v)
                    end
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = {\n"
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    local skip = false

                    if key == "align" then
                        skip = true
                        local editedString = ""
                        for key, val in pairs(AlignTypes) do
                            if v == val then
                                editedString = editedString .. "AlignTypes." .. key
                            end
                        end

                        output_str = output_str .. string.rep('\t', depth) .. key .. " = " .. editedString
                    end

                    if not skip then
                        output_str = output_str .. string.rep('\t', depth) .. key .. " = '" .. tostring(v) .. "'"
                    end
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output, output_str)
    output_str = table.concat(output)
    if not printing then
        print(output_str)
    end
    return output_str
end
-- dump is Dump!
Dump = dump