LightingControl = {}
--==========================================================
-- Main Headlights & Underglow Menu
--==========================================================
LightingControl.Menu = function()
    local NeonMenu = {}
    local Ped      = PlayerPedId()
    local bike     = false

    if Config.BreakTool.UnderglowController then
        breakTool({ item = "underglow_controller", damage = math.random(0, 2) })
    end

    if not Helper.isOutCar() then return end
    if PrevFunc.getInPreview() then
        triggerNotify(nil, locale("previewSettings", "previewNotAllowed"), "error")
        return
    end

    local vehicle = GetVehiclePedIsIn(Ped)
    pushVehicle(vehicle)
    local plate = Helper.getTrimmedPlate(vehicle)

    if Helper.isVehicleLocked(vehicle) then return end
	if not Helper.enforceVehicleOwned(plate) then return end


    ExtraDamageComponents.getVehicleStatus(vehicle)

    if IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle)) then
        bike = true
    end

    local under = VehicleStatus[plate].underglow or 0

    if (bike or under == 0) and not IsToggleModOn(vehicle, 22) then
        triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
        return
    end

    if not bike and under == 1 then
        NeonMenu[#NeonMenu + 1] = {
            arrow    = true,
            header   = locale("xenonSettings", "neonHeaderUnderglow"),
            onSelect = function()
                LightingControl.NeonMenu({
                    bike = bike,
                    vehicle = vehicle
                })
            end,
        }
    end

    if IsToggleModOn(vehicle, 22) then
        NeonMenu[#NeonMenu + 1] = {
            arrow    = true,
            header   = locale("xenonSettings", "xenonHeaderHeadlight"),
            onSelect = function()
                LightingControl.XenonMenu({
                    bike = bike,
                    vehicle = vehicle
                })
            end,
        }
    end

    openMenu(NeonMenu, {
        header   = locale("xenonSettings", "headerLighting"),
        canClose = true,
        onExit   = function() end,
    })
end

RegisterNetEvent(getScript()..":client:neonMenu", function()
    LightingControl.Menu()
end)

--==========================================================
-- Neon Lights Menu
--==========================================================
LightingControl.NeonMenu = function(data)
    local NeonMenu = {}
    if not Helper.isOutCar() then return end
    if PrevFunc.getInPreview() then
        triggerNotify(nil, locale("previewSettings", "previewNotAllowed"), "error")
        return
    end

    if not data.bike then
        NeonMenu[#NeonMenu + 1] = {
            arrow    = true,
            header   = locale("xenonSettings", "neonHeaderUnderglow"),
            onSelect = function()
                LightingControl.NeonToggleMenu({ bike = data.bike, vehicle = data.vehicle })
            end,
        }
        NeonMenu[#NeonMenu + 1] = {
            arrow    = true,
            header   = locale("xenonSettings", "neonHeaderColor"),
            onSelect = function()
                LightingControl.NeonColourMenu({ bike = data.bike, vehicle = data.vehicle })
            end,
        }
    end

    openMenu(NeonMenu, {
        header   = locale("xenonSettings", "neonHeaderUnderglow"),
        onBack   = function()
            LightingControl.Menu()
        end,
    })
end

--==========================================================
-- Neon Toggle Menu
--==========================================================
LightingControl.NeonToggleMenu = function(data)
    local NeonMenu = {}
    local buttons  = {
        { id = -1, head = locale("xenonSettings", "toggleAll") },
        { id =  2, head = locale("xenonSettings", "frontLabel") },
        { id =  1, head = locale("xenonSettings", "rightLabel") },
        { id =  3, head = locale("xenonSettings", "backLabel") },
        { id =  0, head = locale("xenonSettings", "leftLabel") }
    }

    for i = 1, #buttons do
        local isEnabled = (buttons[i].id ~= -1)
                         and (IsVehicleNeonLightEnabled(data.vehicle, buttons[i].id) ~= false)
                         and "fas fa-check"
                         or "fas fa-x"

        NeonMenu[#NeonMenu + 1] = {
            icon    = (buttons[i].id ~= -1) and isEnabled or nil,
            header  = buttons[i].head,
            onSelect= function()
                Modify.applyNeonPostion({
                    vehicle = data.vehicle,
                    bike    = data.bike,
                    id      = buttons[i].id,
                })
            end,
        }
    end

    openMenu(NeonMenu, {
        header    = locale("xenonSettings", "neonHeaderColor"),
        headertxt = locale("xenonSettings", "neonTextDescription"),
        onBack    = function()
            LightingControl.NeonMenu(data)
        end,
    })
end

--==========================================================
-- Custom Underglow RGB Menu
--==========================================================
LightingControl.RGBMenu = function(data)
    local dialog  = {}
    local r, g, b = GetVehicleNeonLightsColour(data.vehicle)
    local custom  = nil

    if data.xenon then
        custom, r, g, b = GetVehicleXenonLightsCustomColor(data.vehicle)
    end

    local dialog = createInput(locale("xenonSettings", "customRGBHeader"), {
        ((Config.System.Menu == "ox") and {
            type = "color",
            label = "RGB:",
            format = "rgb",
            default = "rgb("..r..", "..g..", "..b..")"
        } or nil),
        ((Config.System.Menu == "qb") and { type = "number", isRequired = true, name = "r", text = "R", description = "R", min = 0, max = 255 }) or nil,
        ((Config.System.Menu == "qb") and { type = "number", isRequired = true, name = "g", text = "G", description = "G", min = 0, max = 255 }) or nil,
        ((Config.System.Menu == "qb") and { type = "number", isRequired = true, name = "b", text = "B", description = "B", min = 0, max = 255 }) or nil,
    })
    if dialog then
        if Config.System.Menu == "ox" then
            dialog[1] = Helper.convertOxRGB(dialog[1])
            r, g, b   = tonumber(dialog[1][1]) or r, tonumber(dialog[1][2]) or g, tonumber(dialog[1][3]) or b
        else
            r, g, b = tonumber(dialog.r or r), tonumber(dialog.g or g), tonumber(dialog.b or b)
        end
    end

    if r > 255 then r = 255 end
    if g > 255 then g = 255 end
    if b > 255 then b = 255 end

    if data.xenon then
        LightingControl.applyXenonColour({
            vehicle = data.vehicle,
            R = r,
            G = g,
            B = b
        })

    else
        Modify.applyNeonColour({
            vehicle = data.vehicle,
            bike    = data.bike,
            r       = r,
            g       = g,
            b       = b
        })
    end
end

--==========================================================
-- Underglow Color Menu
--==========================================================
LightingControl.NeonColourMenu = function(data)
    if not Helper.isOutCar() then return end
    if PrevFunc.getInPreview() then
        triggerNotify(nil, locale("previewSettings", "previewNotAllowed"), "error")
        return
    end

    local r, g, b = GetVehicleNeonLightsColour(data.vehicle)
    local NeonMenu= {}
    local desc    = locale("xenonSettings", "neonTextChangeColor")
                    ..br.."R:"..r.." G:"..g.." B:"..b..br..br
                    .."<span style='color:#"..Helper.rgbToHex(r, g, b):upper()
                    .."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black,"
                    .." 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span>"

    if Config.System.Menu == "ox" then
        desc = locale("xenonSettings", "neonTextChangeColor")
               ..br.."R:"..r.." G:"..g.." B:"..b
    end

    NeonMenu[#NeonMenu + 1] = {
        arrow    = true,
        header   = locale("xenonSettings", "customRGBHeader"),
        onSelect = function()
            LightingControl.RGBMenu(data)
        end,
    }

    for k, v in pairs(Loc[Config.Lan].vehicleNeonOptions) do
        local icon     = ""
        local disabled = false
        local installed

        if r == v.R and g == v.G and b == v.B then
            installed = locale("common", "stockLabel")
            icon      = "fas fa-check"
            disabled  = true
        else
            installed = ""
        end

        NeonMenu[#NeonMenu + 1] = {
            icon         = icon,
            isMenuHeader = disabled,
            header       = v.name,
            txt          = installed,
            onSelect     = function()
                Modify.applyNeonColour({
                    vehicle = data.vehicle,
                    bike    = data.bike,
                    r       = v.R,
                    g       = v.G,
                    b       = v.B
                })
            end,
        }
    end

    openMenu(NeonMenu, {
        header    = locale("xenonSettings", "neonHeaderColor"),
        headertxt = desc,
        onBack    = function()
            LightingControl.NeonMenu(data)
        end,
    })
end

--==========================================================
-- Xenon Menu
--==========================================================
LightingControl.XenonMenu = function(data)
    local XenonMenu               = {}
    local custom, r, g, b         = GetVehicleXenonLightsCustomColor(data.vehicle)
    local desc                    = ""

    data.xenon = true

    if custom then
        desc =
            locale("xenonSettings", "xenonTextDescription")
            ..(isOx() and br or "")..br
            .. "R:"..r.." G:"..g.." B:"..b
            ..(
                not Config.System.Menu == "ox" and "<span style='color:#"..Helper.rgbToHex(r, g, b):upper()
                .."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black,"
                .." 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span>" or ""
            )

    else
        stockinstall = locale("common", "stockLabel")
        stockicon    = "fas fa-check"
    end

    if not IsToggleModOn(data.vehicle, 22) then
        triggerNotify(nil, locale("xenonSettings", "notInstalled"), "error")
    else
        XenonMenu[#XenonMenu + 1] = {
            arrow    = true,
            header   = locale("xenonSettings", "customRGBHeader"),
            onSelect = function()
                LightingControl.RGBMenu(data)
            end,
        }

        for k, v in pairs(Loc[Config.Lan].vehicleNeonOptions) do
            local icon     = ""
            local disabled = false
            local installed

            if r == v.R and g == v.G and b == v.B then
                installed = locale("common", "currentInstalled")
                icon      = "fas fa-check"
                disabled  = true
            else
                installed = ""
            end

            XenonMenu[#XenonMenu + 1] = {
                icon         = icon,
                isMenuHeader = disabled,
                header       = v.name,
                txt          = installed,
                onSelect     = function()
                    LightingControl.applyXenonColour({
                        vehicle = data.vehicle,
                        bike    = data.bike,
                        R       = v.R,
                        G       = v.G,
                        B       = v.B
                    })
                end,
            }
        end

        openMenu(XenonMenu, {
            header    = locale("xenonSettings", "xenonHeaderHeadlight"),
            headertxt = desc,
            onBack    = function()
                LightingControl.Menu()
            end,
        })
    end
end