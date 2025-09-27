fx_version 'cerulean'
games {'gta5'}

author 'XXXX'
description 'XXXX'
version 'XXXX'


files {
    "stream/[PROP]/props.ytyp",
	'carcols.meta',
	'carvariations.meta',
	'handling.meta',
	'vehicles.meta',
    "stream/[PROP]/ladder/yusuf_test_1.ytyp",
	"stream/[PROP]/ladderv2/veonixladder.ytyp",
	
}

data_file "DLC_ITYP_REQUEST" "stream/[PROP]/props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/[PROP]/ladder/yusuf_test_1.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/[PROP]/ladderv2/veonixladder.ytyp"
data_file 'HANDLING_FILE'			'handling.meta'
data_file 'VEHICLE_METADATA_FILE'	'vehicles.meta'
data_file 'CARCOLS_FILE'			'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'	'carvariations.meta'
client_script 'vehicle_names.lua'

escrow_ignore {
    'vehicle_names.lua',
}

lua54 'yes'
dependency '/assetpacks'