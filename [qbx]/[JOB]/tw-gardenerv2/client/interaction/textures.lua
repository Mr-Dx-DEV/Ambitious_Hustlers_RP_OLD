local txd = CreateRuntimeTxd('tw_gardenerv2_txd')

local Textures = { -- Do not change
    pin = 'pin',
    interact = 'interact',
    selected = 'selected',
    unselected = 'unselected',
    select_opt = 'select_opt',
    unselect_opt = 'unselect_opt',
}

for _, v in pairs(Textures) do
    CreateRuntimeTextureFromImage(txd, tostring(v), 'html/assets/'..v..'.png')
end