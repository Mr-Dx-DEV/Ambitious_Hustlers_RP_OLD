--==========================================================
-- RGB Paint
--==========================================================
local spraying = false
Paints.RGB = {}

Paints.RGB.Apply = function(data)
    jsonPrint(data)
    data.finish = tonumber(data.finish)
    local Ped = PlayerPedId()
    spraying = true
    local coords   = GetEntityCoords(Ped)
    local vehicle  = Helper.getClosestVehicle(coords)
    local r, g, b  = table.unpack({255, 255, 255})

    local above = isVehicleLift(vehicle)
    local cam = not above and createTempCam(GetOffsetFromEntityInWorldCoords(Ped, 2.0, -0.3, 0.8), vehicle)

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local origProps = getVehicleProperties(vehicle)

    -- Thread to detect cancellation with Backspace
    CreateThread(function()
        while spraying do
            if IsControlJustPressed(0, 177) then -- 177 is Backspace
                spraying = false
            end
            Wait(0)
        end
    end)

    -- Determine final R, G, B
    if data.hex then
        r, g, b = Helper.HexTorgb(data.hex)
    else
        if data.r >= 255 then r = 255 elseif data.r <= 0 then r = 0 else r = data.r end
        if data.g >= 255 then g = 255 elseif data.g <= 0 then g = 0 else g = data.g end
        if data.b >= 255 then b = 255 elseif data.b <= 0 then b = 0 else b = data.b end
    end

    startTempCam(cam)

    -- Create spray can prop
    spraycan = makeProp({ prop = "ng_proc_spraycan01b", coords = vec4(0.0, 0.0, 0.0, 0.0) }, 0, 1)
    AttachEntityToEntity(
        spraycan, Ped, GetPedBoneIndex(Ped, 57005),
        0.11, 0.05, -0.06, 28.0, 30.0, 0.0,
        true, true, false, true, 1, true
    )

    playAnim("weapons@holster_1h", "unholster", -1, 2)
    Wait(GetAnimDuration("weapons@holster_1h", "unholster") * 1000)

    playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", nil, 1)
    local previousCoords = GetWorldPositionOfEntityBone(Ped, GetPedBoneIndex(Ped, 57005))

    if Config.SkillChecks.paints then
        if not skillCheck() then
            local newCoords = GetWorldPositionOfEntityBone(Ped, GetPedBoneIndex(Ped, 57005))
            local movementVec = (previousCoords - newCoords) * 2
            DetachEntity(spraycan, true, true)
            Wait(10)
            SetEntityVelocity(spraycan, movementVec * -10.0) -- scale for effect
            SetEntityAngularVelocity(spraycan, math.random(-5,5)+0.0, math.random(-5,5)+20.0, math.random(-5,5)+0.0)
            triggerNotify(nil, locale("paintOptions", "menuHeader").." "..locale("common", "installationFailed"), "error")
            Helper.removePropHoldCoolDown()

            CreateThread(function()
                Wait(4000)
                destroyProp(spraycan)
                spraycan = nil
            end)
            stopTempCam()
            return
        end
    else
        Wait(6000)
    end

    stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")

    local color = { 255, 255, 255 }
    playAnim(
        isVehicleLift(vehicle) and "amb@prop_human_movie_bulb@idle_a" or "switch@franklin@lamar_tagging_wall",
        isVehicleLift(vehicle) and "idle_b" or "lamar_tagging_exit_loop_lamar",
        -1, 1, nil, 2.0
    )
    Wait(500)
    Paints.Effects.Spray(color)

    local rd, gd, bd = nil

    local otherR, otherG, otherB = nil
    if data.select == locale("paintOptions", "primaryColor") then
        rd, gd, bd = GetVehicleCustomPrimaryColour(vehicle)
        otherR, otherG, otherB = GetVehicleCustomSecondaryColour(vehicle)
    elseif data.select == locale("paintOptions", "secondaryColor") then
        rd, gd, bd = GetVehicleCustomSecondaryColour(vehicle)
        otherR, otherG, otherB = GetVehicleCustomPrimaryColour(vehicle)
    end

    triggerNotify(nil, locale("common", "settingBaseCoat"), "success")

    local r1, g1, b1 = rd, gd, bd

    if data.select == locale("paintOptions", "primaryColor") then
        SetVehicleColours(vehicle, data.finish, colorSecondary)
        --print(data.finish, colorSecondary)
        if GetIsVehicleSecondaryColourCustom(vehicle) then
            SetVehicleCustomPrimaryColour(vehicle, otherR, otherG, otherB)
        end
    elseif data.select == locale("paintOptions", "secondaryColor") then
        --print(colorPrimary, data.finish)
        SetVehicleColours(vehicle, colorPrimary, data.finish)
        if GetIsVehiclePrimaryColourCustom(vehicle) then
            SetVehicleCustomPrimaryColour(vehicle, otherR, otherG, otherB)
        end
    end

    -- Base coat loop
    while (rd ~= 255 or gd ~= 255 or bd ~= 255) and spraying do
        local averageProgress = Paints.colorChangeProgress(r1, g1, b1, 255, 255, 255, rd, gd, bd)
        drawText(nil, {
            locale("paintRGB", "sprayingBase"),
            locale("paintRGB", "stopInstruction"),
            basicBar(averageProgress).." "..math.ceil(averageProgress).."%"
        })

        if rd ~= 255 then rd += 1 end
        if gd ~= 255 then gd += 1 end
        if bd ~= 255 then bd += 1 end

        Wait(40)

        if data.select == locale("paintOptions", "primaryColor") then
            SetVehicleCustomPrimaryColour(vehicle, rd, gd, bd)
        elseif data.select == locale("paintOptions", "secondaryColor") then
            SetVehicleCustomSecondaryColour(vehicle, rd, gd, bd)
        end

        Wait(20)
    end

    if not spraying then
        -- If base coat was cancelled
        Paints.RGB.Cancel(vehicle, origProps, Ped)
        return
    end

    hideText()
    Paints.Effects.StopSpray()

    -- Switch can anim
    Wait(500)
    stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")

    playAnim("weapons@holster_1h", "holster", -1, 2)
    Wait(250)
    DetachEntity(spraycan)
    SetEntityCoords(spraycan, 0, 0, 0)
    Wait(750)
    playAnim("weapons@holster_1h", "unholster", -1, 2)
    Wait(150)
    AttachEntityToEntity(
        spraycan, Ped, GetPedBoneIndex(Ped, 57005),
        0.11, 0.05, -0.06, 28.0, 30.0, 0.0,
        true, true, false, true, 1, true
    )
    Wait(350)
    playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", -1, 1)
    Wait(6000)
    stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")

    playAnim(
        isVehicleLift(vehicle) and "amb@prop_human_movie_bulb@idle_a" or "switch@franklin@lamar_tagging_wall",
        isVehicleLift(vehicle) and "idle_b" or "lamar_tagging_exit_loop_lamar",
        -1, 1, nil, 2.0
    )
    Wait(500)

    Paints.Effects.Spray({ r, g, b })

    -- Final coat loop
    r1, g1, b1 = rd, gd, bd
    while (rd ~= r or gd ~= g or bd ~= b) and spraying do
        local averageProgress = Paints.colorChangeProgress(r1, g1, b1, r, g, b, rd, gd, bd)
        drawText(nil, {
            locale("paintRGB", "sprayingVehicle"),
            locale("paintRGB", "stopInstruction"),
            basicBar(averageProgress).." "..math.ceil(averageProgress).."%"
        })

        if rd ~= r then rd -= 1 end
        if gd ~= g then gd -= 1 end
        if bd ~= b then bd -= 1 end

        Wait(40)

        if data.select == locale("paintOptions", "primaryColor") then
            SetVehicleCustomPrimaryColour(vehicle, rd, gd, bd)
        elseif data.select == locale("paintOptions", "secondaryColor") then
            SetVehicleCustomSecondaryColour(vehicle, rd, gd, bd)
        end

        Wait(40)
    end

    if not spraying then
        -- If spray was cancelled mid-process
        Paints.RGB.Cancel(vehicle, origProps, Ped)
        return
    end

    destroyProp(spraycan)
    spraycan = nil
    spraying = false

    hideText()
    Paints.Effects.StopSpray()
    stopTempCam()
    Helper.addCarToUpdateLoop(vehicle)

    SetVehicleModKit(vehicle, 0)
    sendLog(Items["paintcan"].label.."(paintcan) - {"..r..", "..g..", "..b.."}` installed ["..Helper.getTrimmedPlate(vehicle).."]")

    if Config.Overrides.CosmeticItemRemoval then
        removeItem("paintcan", 1)
    else
        Paints.subMenu(data.select)
    end

    Helper.removePropHoldCoolDown()
end

Paints.RGB.Cancel = function(vehicle, origProps, Ped)
    destroyProp(spraycan)
    spraycan = nil
    hideText()
    Paints.Effects.StopSpray()
    stopTempCam()
    setVehicleProperties(vehicle, origProps)
    triggerNotify(nil, locale("common", "sprayCancelled"), "warning")
    Helper.removePropHoldCoolDown()
    SetVehicleModKit(vehicle, 0)
end

--==========================================================
-- RGB/HEX Menu
--==========================================================
Paints.RGB.Menu = function(data)
    local vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)

    local tableData = {
        [locale("paintOptions", "primaryColor")]   = { { GetVehicleCustomPrimaryColour(vehicle) }, colorPrimary },
        [locale("paintOptions", "secondaryColor")] = { { GetVehicleCustomSecondaryColour(vehicle) }, colorSecondary }
    }

    local r, g, b = tableData[data.paint][1][1], tableData[data.paint][1][2], tableData[data.paint][1][3]

    local dialog = createInput(
        data.hex and locale("paintRGB", "hexPickerLabel") or locale("paintRGB", "rgbPickerLabel"), {
            {
                type   = "radio",
                name   = "finish",
                text   = locale("paintRGB", "finishSelectLabel"),
                options= {
                    { value = "147", text = locale("paintOptions", "classicFinish") },
                    { value = "12",  text = locale("paintOptions", "matteFinish")   },
                    { value = "120", text = locale("paintRGB", "chromeLabel") },
                    { value = "117", text = locale("paintOptions", "metalsFinish") },
                }
            },
            ((Config.System.Menu == "qb" and data.hex) and {
                type = "text",
                name = "hex",
                text = "#"..Helper.rgbToHex(r, g, b):upper()
            }) or nil,
            ((Config.System.Menu == "qb" and not data.hex) and { type = "number", name = "r", text = locale("paintRGB", "redLabel")..r }) or nil,
            ((Config.System.Menu == "qb" and not data.hex) and { type = "number", name = "g", text = locale("paintRGB", "greenLabel")..g }) or nil,
            ((Config.System.Menu == "qb" and not data.hex) and { type = "number", name = "b", text = locale("paintRGB", "blueLabel")..b }) or nil,

            (Config.System.Menu == "ox" and {
                type    = "color",
                label   = data.hex and locale("paintRGB", "hexLabel") or locale("paintRGB", "rgbLabel"),
                format  = data.hex and "hex" or "rgb",
                default = data.hex and "#"..Helper.rgbToHex(r, g, b):upper() or "rgb("..r..", "..g..", "..b..")"
            }) or nil,
        }
    )

    if dialog then
        jsonPrint(dialog)
        if Config.System.Menu == "ox" then
            if data.hex then
                dialog[2] = dialog[2]:gsub("#", "")
                r, g, b   = Helper.HexTorgb(dialog[2])
            else
                dialog[2] = Helper.convertOxRGB(dialog[2])
                r, g, b   = tonumber(dialog[2][1]) or r, tonumber(dialog[2][2]) or g, tonumber(dialog[2][3]) or b
            end
        elseif Config.System.Menu == "qb" then
            if dialog then
                if data.hex then
                    local hex = dialog["hex"]:gsub("#", "")
                    while string.len(hex) < 6 do
                        hex = hex.."0"
                        Wait(10)
                    end
                    r, g, b = Helper.HexTorgb(hex)
                else
                    r = tonumber(dialog["r"] or r or 0)
                    g = tonumber(dialog["g"] or g or 0)
                    b = tonumber(dialog["b"] or b or 0)
                end
            end
        end

        if r > 255 then r = 255 end
        if g > 255 then g = 255 end
        if b > 255 then b = 255 end

        Paints.RGB.Apply( { finish = dialog["finish"] or dialog[1], select = data.paint, r = r, g = g, b = b } )
    else
        Paints.subMenu(data.paint)
    end
end

Paints.colorChangeProgress = function(r1, g1, b1, r2, g2, b2, cr, cg, cb)
    -- Calculate the Euclidean distance from the original to the current color
    local currentDistance = math.sqrt((cr - r1)^2 + (cg - g1)^2 + (cb - b1)^2)

    -- Calculate the Euclidean distance from the original to the target color
    local totalDistance = math.sqrt((r2 - r1)^2 + (g2 - g1)^2 + (b2 - b1)^2)

    -- Calculate the progress percentage
    local progress = (currentDistance / totalDistance) * 100

    return progress
end