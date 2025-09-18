-- NONE_RESOURCE = 'none'

NONE_RESOURCE = 'standalone'
STANDALONE = 'standalone'
AUTO_DETECT = 'auto_detect'
INVENTORY = 'Inventory'
SOCIETY = "Society"
CLOTHING = "Clothing"
MAP = "Map"

Cloth = {
    ESX = 'skinchanger',
    QB = 'qb-clothing',
    ONEX = 'onex-creation',
    HEX = 'hex_clothing',
    SKINCHANGER = 'skinchanger',
    FAPPEARANCE = 'fivem-appearance',
    WASABI = 'wasabi',
    IAPPEARANCE = 'illenium-appearance',
    AK47_CLOTHING = 'ak47_qb_clothing',
    BL_APPEARANCE = 'bl_appearance',
    RCORE = 'rcore_clothing',
    CODEM = 'codem-appearance',
    CRM = 'crm-appearance',
    TGIANN = 'tgiann-clothing',
    MOV = '17mov_CharacterSystem',
    NONE = NONE_RESOURCE
}


Map = {
    PROMPT = "MAPLIST_PROMPT",
    RCORE = "MAPLIST_RCORE",
    GABZ = "MAPLIST_GABZ",
    ALCATRAZ = "MAPLIST_ALCATRAZ",
    YBN = "MAPLIST_YBN",
    UNCLE = "MAPLIST_UNCLE",
    DESERTOS = "MAPLIST_DESERTOS",
    NONE = NONE_RESOURCE
}

MapsList = {
    PROMPT = {
        'cfx_prompt_Bolingbroke_Prison_Interiors'
    },

    RCORE = {
        'rcore_prison_map'
    },

    GABZ = {
        'cfx-gabz-prison'
    },

    ALCATRAZ = {
        'molo_alcatraz',
    },

    YBN = {
        'YBNPrison',
    },

    DESERTOS = {
        'prison_canteen',
        'prison_meeting',
        'prison_main',
    },
    UNCLE = {
        'int_prison',
        'unj_prison',
        'int_prisonfull',
        'uj_prison'
    }
}

Framework = {
    ESX = 'es_extended',
    QBCore = 'qb-core',
    QBOX = 'qbx_core',
    NDCore = 'ND_Core',
    NONE = NONE_RESOURCE
}

Inventories = {
    UNK = 'ak47_inventory',
    OX = 'ox_inventory',
    ESX = 'es_extended',
    QB = 'qb-inventory',
    QS = 'qs-inventory',
    MF = 'mf-inventory',
    PS = 'ps-inventory',
    LJ = 'lj-inventory',
    CORE = 'core_inventory',
    CODEM = 'codem-inventory',
    CHEEZA = 'inventory',
    TGIANN = 'tgiann-inventory',
    ORIGEN = 'origen_inventory',
    NONE = NONE_RESOURCE
}

Interactions = {
    OX = 'ox_target',
    QB = 'qb-target',
    Q = 'qtarget',
    IS = 'is_interaction',
    MV = 'mv-target',
    SLEEPLESS = 'sleepless_interact',
    NONE = NONE_RESOURCE
}

Notifies = {
    BRUTAL = 'brutal_notify',
    PNOTIFY = 'pNotify',
    SPICY_NOTIFY = "stNotify",
    OX = 'ox_lib',
    ESX = 'esx_notify',
    QBCORE = 'qb-core',
    MYTHIC = 'mythic_notify',
    OKOK = 'okokNotify',
    NONE = NONE_RESOURCE,
}

Phones = {
    LB = 'lb-phone',
    NONE = NONE_RESOURCE
}

TextUI = {
    OX = 'ox_lib',
    QBCORE = 'qb-core',
    ESX = 'esx_textui',
    OKOK = 'okokTextUI',
    NONE = NONE_RESOURCE,
}



--------------



dbg = rdebug()

Levels = {
    INFO = '^2[asset-deployer:info]^7',
    WARN = '^3[asset-deployer:warn]^7',
    ERROR = '^1[asset-deployer:error]^7',
    LOAD = '^3[asset-deployer:load]^7',
    DEBUG = '^3[debug]^7',
}



DOORS = {
    QB = 'qb-doorlock',
    OX = 'ox_doorlock',
}

GYM_RESOURCES = {
    RTX = 'rtx_gym'
}

CONSUMABLES = {
    QB = 'qb-smallresources',
    ESX = 'esx_basicneeds',
}

WALL_STATES = {
    FULL_HEALTH = 'FULL_HEALTH',
    DESTROYED = 'DESTROYED',
    REPAIRING = 'REPAIRING',
}

PRISON_MAPS_LIST = {
    ['prison_canteen'] = 'desertos',
    ['prison_meeting'] = 'desertos',
    ['prison_main'] = 'desertos',
    ['rcore_prison_map'] = 'rcore',
    ['cfx-gabz-prison'] = 'gabz',
    ['int_prison'] = 'unclejust',
    ['unj_prison'] = 'unclejust',
    ['int_prisonfull'] = 'unclejust',
    ['molo_alcatraz'] = 'alcatraz',
    ['YBNPrison'] = 'ybn',
    ['cfx_prompt_Bolingbroke_Prison_Interiors'] = 'prompt-prison'
}



JAIL_TIME_VALIDATION_STATES = {
    IS_VALID = 'IS_VALID',
    IS_INVALID = 'IS_INVALID',
}



Menus = {
    OX = 'ox_lib',
    ESX_CONTEXT = 'esx_context',
    ESX_MENU = 'es_extended',
    QB = 'qb-menu',
    RCORE = GetCurrentResourceName(),
    NONE = NONE_RESOURCE
}

Dispatches = {
    PQ = 'piotreq_gpt',
    RCORE = 'rcore_dispatch',
    LS = 'l2s-dispatch',
    QS = 'qs-dispatch',
    LB = 'lb-tablet',
    PS = 'ps-dispatch',
    CD = 'cd_dispatch',
    CORE = 'core_dispatch',
    DUSA = 'dusa_dispatch',
    LOVE_SCRIPTS = 'emergencydispatch',
    KARTIK = 'kartik-mdt',
    CODEM = 'codem-dispatch',
    TK = 'tk_dispatch',
    ORIGEN = 'origen_police',
    REDUTZU = 'redutzu-mdt',
    NONE = NONE_RESOURCE
}

Database = {
    OX = 'oxmysql',
    MYSQL_ASYNC = 'mysql-async',
    GHMATTI = 'ghmattimysql',
    AUTO_DETECT = 'auto_detect'
}

THIRD_PARTY_RESOURCE = {
    MOV_HUD = '17mov_Hud',
    NO_PAPER = 'no-newspaper',
    FUTTE = 'futte-newspaper',
    QF_MDT = 'qf-mdt',
    REDUTZU = 'redutzu-mdt',
    CD = 'cd_multicharacter',
    WASABI_POLICE = 'wasabi_police'
}






CLOTHING_COMPONENTS = {
    HEAD = 0,
    MASKS = 1,
    HAIR_STYLES = 2,
    ARMS = 3,
    PANTS = 4,
    BAGS_AND_PARACHUTE = 5,
    SHOES = 6,
    ACCESSORIES = 7,
    SHIRT = 8,
    BODY_ARMOR = 9,
    DECALS = 10,
    BODY = 11,  -- BODY // TORSO
}

PROP_COMPONENTS = {
    HATS = 0,
    GLASSES = 1,
    EARS = 2,
    WATCHES = 6,
    BRACELETS = 7,
    ACCESSORY = 7,
}

DRAWABLE = {
    NONE = -1,
}

PRISON_ITEMS = {
    ['water'] = true,
    ['burger'] = true,
    ['pizza_ham_slice'] = true,
    ['fries'] = true,
    ['sprunk'] = true,
    ['chips'] = true,
}

TIMES = {
    SEC = 'SEC',
    MIN = 'MIN',
    HOURS = 'HOURS',
    DAYS = 'DAYS',
    WEEK = 'WEEK',
    MONTHS = 'MONTHS'
}

PoliceResources = {
    WASABI = 'wasabi_police',
    ESX = 'esx_policejob',
    QB = 'qb-policejob',
    ND = 'ND_Police'
}

AmbulanceResources = {
    WASABI = 'wasabi_ambulance',
    ESX = 'esx_ambulancejob',
    QB = 'qb-ambulancejob',
    ND = 'ND_Ambulance'
}

MinigameStates  = {
    CIRCUIT_NOT_ENOUGH_LIFES = 'CIRCUIT_NOT_ENOUGH_LIFES',
}


SentenceTypes = {
    ONLINE = 'online',
    OFFLINE = 'offline',
}

Errors = {
    INVALID_PRISON = 'invalid_prison',
}

JOBS = {
    ELECTRICIAN = 'electrician',
    CLEAN_GROUND = 'clean_ground',
    GARDENER = 'gardener',
    COOK = 'Cook',
    JANITOR = 'janitor',
    LAUNDRY = 'laundry',
    BUSH_TRIMMING = 'bush_trimming',
}

Screens = {
    MENU = 'MENU',
    HELPKEYS = 'HELPKEYS',
    TRADING = 'TRADING',
    BOOTH = 'BOOTH',
    QUEST = 'QUEST',
    TEXT = 'TEXT',
}

MENU_ID_LIST = {
    COMS_MENU = 'JAIL_COMS_MENU',
    LOBBY_MENU = 'JAIL_LOBBY_MENU',
    JOB_MENU = 'JAIL_JOB_MENU',
}

FE_EVENTS = {
    LOAD_APP = 'loadApp',
    TEXT_UI = 'textUI',
    SUBTITLES = 'subtitles',
    QUEST = 'quest'
}

ENUMS = {
    LOS_ENTITY_NATIVE = {
        ACCEPT_ANY = 0, -- ACCEPT ANY RAYCAST ENTITY / GROUND
        IGNORE_GROUND = 1 -- WITHOUT GROUND CHECK
    },

    ANIMS = {
        EXIT = {
            animDict = 'anim_casino_b@amb@casino@games@shared@player@',
            animName = 'sit_exit_left'
        }
    }
}

PRISON_OUTFITS = {
    PRISONER = 'PRISONER_OUTFIT',
    CITIZEN = 'CITIZEN_OUTFIT',
}

INTERACT_TYPES = {
    TELEPORT_TO_VISIT_FROM = 'TELEPORT_TO_VISIT_FROM',
    TELEPORT_FROM_VISIT_TO_YARD = 'TELEPORT_FROM_VISIT_TO_YARD',
    TELEPORT_FROM_CITY_TO_ALCATRAZ = 'TELEPORT_FROM_CITY_TO_ALCATRAZ',
    TELEPORT = 'TELEPORT',
    PROP_ONLY = 'PROP_ONLY',
    GYM = 'GYM',
    COMS = 'COMS',
    LOBBY = 'LOBBY',
    JOBS = 'JOBS',
    DEALER = 'DEALER',
    BOOTH = 'BOOTH',
    CANTEEN = 'CANTEEN',
    QUEST = 'QUEST',
    CIGAR_PRODUCTION = 'CIGAR_PRODUCTION',
    WARDEN = 'WARDEN',
    NONE = 'NONE'
}

INTERACT_ACCESS_TYPES = {
    PRISONER_ONLY = 'PRISONER_ONLY',
    GUARD_ONLY = 'GUARD_ONLY',
    ALL = 'ALL'
}

TELEPORT_TYPES = {
    TO_YARD_NEW_PRISONER = 'TELEPORT_TO_YARD_NEW_PRISONER',
    TO_OUTSIDE_PRISON_RELEASED = 'TO_OUTSIDE_PRISON_RELEASED',
}

HEARTBEAT_EVENTS = {
    PRISONER_NEW = 'PRISONER_NEW',
    PRISONER_LOADED = 'PRISONER_LOADED',
    PRISONER_RELEASED = 'PRISONER_RELEASED',
    COMS_PLAYER_LOADED = 'COMS_PLAYER_LOADED',
    PLAYER_ESCAPE_FROM_PRISON = 'PLAYER_ESCAPE_FROM_PRISON',
    PLAYER_DESTROYED_WALL = 'PLAYER_DESTROYED_WALL',
}

INVENTORY_STATUS_CODES = {
    EMPTY_INVENTORY = 'EMPTY_INVENTORY',
    HAS_ITEMS = 'HAS_ITEMS'
}

NUI_CALLBACKS = {
    REGISTER_PRISONER_ACCOUNT = 'REGISTER_PRISONER_ACCOUNT',
    EXECUTE_PRISONER_ACCOUNT = 'EXECUTE_PRISONER_ACCOUNT',
    GET_PRISON_LOGS = 'getTransactions',
    GET_PRISONER_ACCOUNT_LOGS = 'getPrisonerAccountLogs',
}

RESOURCE_FILES = {
    ZONES = 'zones.json'
}

COMS_STATES = {
    IDLE = 'IDLE',
    SWEEPING = 'SWEEPING',
    RETURN = 'RETURN',
}

STEPPER = {
    BBQ = 'BBQ',
}

EXERCISE_MAP = {
    CRANKS = 'CRANKS',
    SITUPS = 'SITUPS',
    MUSLECHIN = 'MUSLECHIN',
}

CALL_ENUMS = {
    IDLE = 'IDLE',
    AWAITING_CALL = 'AWAITING_CALL',
    IN_CALL = 'IN_CALL',
}


TRANSACTIONS_TASKS = {
    DEPOSIT = 'DEPOSIT',
    WITHDRAW = 'WITHDRAW',
}


-- Storage
STORAGE_JOBS = 'STORAGE_JOBS'
STORAGE_PRISONER = 'STORAGE_PRISONER'
STORAGE_PRISONER_ACCOUNTS = 'STORAGE_PRISONER_ACCOUNTS'
STORAGE_PRISONER_ACCOUNTS_TRANSACTIONS = 'STORAGE_PRISONER_ACCOUNTS_TRANSACTIONS'
STORAGE_PRISON_BREAK = 'STORAGE_PRISON_BREAK'
STORAGE_CIGAR_PRODUCTION = 'STORAGE_CIGAR_PRODUCTION'
STORAGE_CHAT = 'STORAGE_CHAT'
STORAGE_CANTEEN = 'STORAGE_CANTEEN'
STORAGE_LOGS = 'STORAGE_LOGS'
STORAGE_ACCOUNT_LOGS = 'STORAGE_ACCOUNT_LOGS'
STORAGE_BOOTH = 'STORAGE_BOOTH'
STORAGE_COMS = 'STORAGE_COMS'
STORAGE_COMS_SESSIONS = 'STORAGE_COMS_SESSIONS'

-- Services
SERVICE_JOBS = 'SERVICE_JOBS'
SERVICE_PRISONER = 'SERVICE_PRISONER'
SERVICE_CHAT = 'SERVICE_CHAT'

Actions = {
    PRISON_BREAK = 'PRISON_BREAK',
    SHOW_ACCOUNT = 'SHOW_ACCOUNT',
    SHOW_JAIL_TIME = 'SHOW_JAIL_TIME',
    SHOW_STASHED_ITEMS = 'SHOW_STASHED_ITEMS',
    SHOW_CANTEEN = 'SHOW_CANTEEN',
    RELEASE_PLAYER = 'RELEASE_PLAYER',
    GET_FREE_FOOD_PACKAGE = 'GET_FREE_FOOD_PACKAGE',
}

MINIGAME_PLACE_TYPE = {
    CIGAR = 'CIGAR'
}

Shake = {
    DEATH_FAIL = "DEATH_FAIL_IN_EFFECT_SHAKE",
    DRUNK = "DRUNK_SHAKE",
    DRUG_TRIP = "FAMILY5_DRUG_TRIP_SHAKE",
    HAND_SHAKE = "HAND_SHAKE",
    JOLT = "JOLT_SHAKE",
    LARGE_EXPLOSION = "LARGE_EXPLOSION_SHAKE",
    MEDIUM_EXPLOSION = "MEDIUM_EXPLOSION_SHAKE",
    SMALL_EXPLOSION = "SMALL_EXPLOSION_SHAKE",
    ROAD_VIBRATION = "ROAD_VIBRATION_SHAKE",
    SKY_DIVING = "SKY_DIVING_SHAKE",
    VIBRATE = "VIBRATE_SHAKE",
}

CameraAnimFX = {
    BEAST_INTRO_SCENE = 'BeastIntroScene',
    BEAST_LAUNCH = 'BeastLaunch',
    BEAST_TRANSITION = 'BeastTransition',
    BIKER_FILTER = 'BikerFilter',
    BIKER_FILTER_OUT = 'BikerFilterOut',
    BIKER_FORMATION = 'BikerFormation',
    BIKER_FORMATION_OUT = 'BikerFormationOut',
    CAM_PUSH_IN_FRANKLIN = 'CamPushInFranklin',
    CAM_PUSH_IN_MICHAEL = 'CamPushInMichael',
    CAM_PUSH_IN_NEUTRAL = 'CamPushInNeutral',
    CAM_PUSH_IN_TREVOR = 'CamPushInTrevor',
    CHOP_VISION = 'ChopVision',
    CROSS_LINE = 'CrossLine',
    CROSS_LINE_OUT = 'CrossLineOut',
    DEADLINE_NEON = 'DeadlineNeon',
    DEATH_FAIL_FRANKLIN_IN = 'DeathFailFranklinIn',
    DEATH_FAIL_MICHAEL_IN = 'DeathFailMichaelIn',
    DEATH_FAIL_DARK = 'DeathFailMPDark',
    DEATH_FAIL_IN = 'DeathFailMPIn',
    DEATH_FAIL_NEUTRAL_IN = 'DeathFailNeutralIn',
    DEATH_FAIL_OUT = 'DeathFailOut',
    DEATH_FAIL_TREVOR_IN = 'DeathFailTrevorIn',
    DEFAULT_FLASH = 'DefaultFlash',
    DMT_FLIGHT = 'DMT_flight',
    FLIGHT_INTRO = 'DMT_flight_intro',
    DONT_TAZEME_BRO = 'Dont_tazeme_bro',
    DRUGS_DRIVING_IN = 'DrugsDrivingIn',
    DRUGS_DRIVING_OUT = 'DrugsDrivingOut',
    DRUGS_MICHAEL_ALIENS_FIGHT = 'DrugsMichaelAliensFight',
    DRUGS_MICHAEL_ALIENS_FIGHT_IN = 'DrugsMichaelAliensFightIn',
    DRUGS_MICHAEL_ALIENS_FIGHT_OUT = 'DrugsMichaelAliensFightOut',
    DRUGS_TREVOR_CLOWNS_FIGHT = 'DrugsTrevorClownsFight',
    DRUGS_TREVOR_CLOWNS_FIGHT_IN = 'DrugsTrevorClownsFightIn',
    DRUGS_TREVOR_CLOWNS_FIGHT_OUT = 'DrugsTrevorClownsFightOut',
    EXPLOSION_JOSH = 'ExplosionJosh3',
    FOCUS_IN = 'FocusIn',
    FOCUS_OUT = 'FocusOut',
    HEIST_CELEB_END = 'HeistCelebEnd',
    HEIST_CELEB_PASS = 'HeistCelebPass',
    HEIST_CELEB_PASS = 'HeistCelebPassBW',
    HEIST_CELEB_TOAST = 'HeistCelebToast',
    HEIST_LOCATE = 'HeistLocate',
    HEIST_TRIP_SKIP_FADE = 'HeistTripSkipFade',
    INCH_ORANGE = 'InchOrange',
    INCH_ORANGE_OUT = 'InchOrangeOut',
    INCH_PICKUP = 'InchPickup',
    INCH_PICKUP_OUT = 'InchPickupOut',
    INCH_PURPLE = 'InchPurple',
    INCH_PURPLE_OUT = 'InchPurpleOut',
    LOST_TIME_DAY = 'LostTimeDay',
    LOST_TIME_NIGHT = 'LostTimeNight',
    MENU_HEIST_IN = 'MenuMGHeistIn',
    MENU_HEIST_INTRO = 'MenuMGHeistIntro',
    MENU_HEIST_OUT = 'MenuMGHeistOut',
    MENU_HEIST_TINT = 'MenuMGHeistTint',
    MENU_IN = 'MenuMGIn',
    MENU_SELECTION_IN = 'MenuMGSelectionIn',
    MENU_SELECTION_TINT = 'MenuMGSelectionTint',
    MENU_TOURNAMENT_IN = 'MenuMGTournamentIn',
    MENU_TOURNAMENT_TINT = 'MenuMGTournamentTint',
    MINIGAME_END_FRANKLIN = 'MinigameEndFranklin',
    MINIGAME_END_MICHAEL = 'MinigameEndMichael',
    MINIGAME_END_NEUTRAL = 'MinigameEndNeutral',
    MINIGAME_END_TREVOR = 'MinigameEndTrevor',
    MINIGAME_TRANSITION_IN = 'MinigameTransitionIn',
    MINIGAME_TRANSITION_OUT = 'MinigameTransitionOut',
    BULL_TOST = 'MP_Bull_tost',
    BULL_TOST_OUT = 'MP_Bull_tost_Out',
    CELEB_LOSE = 'MP_Celeb_Lose',
    CELEB_LOSE_OUT = 'MP_Celeb_Lose_Out',
    CELEB_PRELOAD = 'MP_Celeb_Preload',
    CELEB_PRELOAD_FADE = 'MP_Celeb_Preload_Fade',
    CELEB_WIN = 'MP_Celeb_Win',
    CELEB_WIN_OUT = 'MP_Celeb_Win_Out',
    CORONA_SWITCH = 'MP_corona_switch',
    INTRO_LOGO = 'MP_intro_logo',
    JOB_LOAD = 'MP_job_load',
    KILLSTREAK = 'MP_Killstreak',
    KILLSTREAK_OUT = 'MP_Killstreak_Out',
    LOSER_STREAK_OUT = 'MP_Loser_Streak_Out',
    ORBITAL_CANNON = 'MP_OrbitalCannon',
    POWERPLAY = 'MP_Powerplay',
    POWERPLAY_OUT = 'MP_Powerplay_Out',
    RACE_CRASH = 'MP_race_crash',
    SMUGGLER_CHECKPOINT = 'MP_SmugglerCheckpoint',
    TRANSFORM_RACE_FLASH = 'MP_TransformRaceFlash',
    WARP_CHECKPOINT = 'MP_WarpCheckpoint',
    PAUSE_MENU_OUT = 'PauseMenuOut',
    PENNED_IN = 'pennedIn',
    PENNED_IN_OUT = 'PennedInOut',
    PEYOTE_END_IN = 'PeyoteEndIn',
    PEYOTE_END_OUT = 'PeyoteEndOut',
    PEYOTE_IN = 'PeyoteIn',
    PEYOTE_OUT = 'PeyoteOut',
    FILTER = 'PPFilter',
    FILTER_OUT = 'PPFilterOut',
    GREEN = 'PPGreen',
    GREEN_OUT = 'PPGreenOut',
    ORANGE = 'PPOrange',
    ORANGE_OUT = 'PPOrangeOut',
    PINK = 'PPPink',
    PINK_OUT = 'PPPinkOut',
    PURPLE = 'PPPurple',
    PURPLE_OUT = 'PPPurpleOut',
    RACE_TURBO = 'RaceTurbo',
    RAMPAGE = 'Rampage',
    RAMPAGE_OUT = 'RampageOut',
    SNIPER_OVERLAY = 'SniperOverlay',
    SUCCESS_FRANKLIN = 'SuccessFranklin',
    SUCCESS_MICHAEL = 'SuccessMichael',
    SUCCESS_NEUTRAL = 'SuccessNeutral',
    SUCCESS_TREVOR = 'SuccessTrevor',
    SWITCH_CAM = 'switch_cam_1',
    SWITCH_CAM = 'switch_cam_2',
    SWITCH_FRANKLIN_IN = 'SwitchHUDFranklinIn',
    SWITCH_FRANKLIN_OUT = 'SwitchHUDFranklinOut',
    SWITCH_IN = 'SwitchHUDIn',
    SWITCH_MICHAEL_IN = 'SwitchHUDMichaelIn',
    SWITCH_MICHAEL_OUT = 'SwitchHUDMichaelOut',
    SWITCH_OUT = 'SwitchHUDOut',
    SWITCH_TREVOR_IN = 'SwitchHUDTrevorIn',
    SWITCH_TREVOR_OUT = 'SwitchHUDTrevorOut',
    SWITCH_OPEN_FRANKLIN = 'SwitchOpenFranklin',
    SWITCH_OPEN_FRANKLIN_IN = 'SwitchOpenFranklinIn',
    SWITCH_OPEN_FRANKLIN_OUT = 'SwitchOpenFranklinOut',
    SWITCH_OPEN_MICHAEL_IN = 'SwitchOpenMichaelIn',
    SWITCH_OPEN_MICHAEL_MID = 'SwitchOpenMichaelMid',
    SWITCH_OPEN_MICHAEL_OUT = 'SwitchOpenMichaelOut',
    SWITCH_OPEN_NEUTRAL = 'SwitchOpenNeutralFIB5',
    SWITCH_OPEN_NEUTRAL_OUT_HEIST = 'SwitchOpenNeutralOutHeist',
    SWITCH_OPEN_TREVOR_IN = 'SwitchOpenTrevorIn',
    SWITCH_OPEN_TREVOR_OUT = 'SwitchOpenTrevorOut',
    SWITCH_SCENE_FRANKLIN = 'SwitchSceneFranklin',
    SWITCH_SCENE_MICHAEL = 'SwitchSceneMichael',
    SWITCH_SCENE_NEUTRAL = 'SwitchSceneNeutral',
    SWITCH_SCENE_TREVOR = 'SwitchSceneTrevor',
    SWITCH_SHORT_FRANKLIN_IN = 'SwitchShortFranklinIn',
    SWITCH_SHORT_FRANKLIN_MID = 'SwitchShortFranklinMid',
    SWITCH_SHORT_MICHAEL_IN = 'SwitchShortMichaelIn',
    SWITCH_SHORT_MICHAEL_MID = 'SwitchShortMichaelMid',
    SWITCH_SHORT_NEUTRAL_IN = 'SwitchShortNeutralIn',
    SWITCH_SHORT_NEUTRAL_MID = 'SwitchShortNeutralMid',
    SWITCH_SHORT_TREVOR_IN = 'SwitchShortTrevorIn',
    SWITCH_SHORT_TREVOR_MID = 'SwitchShortTrevorMid',
    TINY_RACER_GREEN = 'TinyRacerGreen',
    TINY_RACER_GREEN_OUT = 'TinyRacerGreenOut',
    TINY_RACER_INTRO_CAM = 'TinyRacerIntroCam',
    TINY_RACER_PINK = 'TinyRacerPink',
    TINY_RACER_PINK_OUT = 'TinyRacerPinkOut',
    WEAPON_UPGRADE = 'WeaponUpgrade',
}

CameraEffect = {
    SHAKE_CAMERA = 0,
    BLUR = 1,
}


COMPANION_FLAG_TEAMWORK = 0
COPAMNION_FLAG_NEUTRAL = 3

COMPANION_COP_KEY = 'COP'
COMPANION_PLAYER_KEY = 'PLAYER'

STRUCT_GUARDS = 'guards'
STRUCT_NIGHT_GUARDS = 'night_guards'
STRUCT_WEAPON = 'weapon'
STRUCT_RECORDING = 'recording'
STRUCT_ROUTE = 'route'
STRUCT_PRECISION = 'precision'
STRUCT_WALK = 'WALK'

STRUCT_POS = 'pos'
STRUCT_MODEL = 'model'
STRUCT_VEHICLE_MODEL = 'vehicle_model'
STRUCT_HEADING = 'heading'


IS_QB = {
    [Framework.QBCore] = true,
    [Framework.QBOX] = true,
}


ORDERED_KEYS = {
    TextUI = { "OX", "OKOK", "ESX", "QBCORE", "NONE" },
    Framework = { "QBCore", "ESX", "QBOX", "NDCore", "NONE" },
    Notifies = { "QBOX", "ESX", "QBCORE", "ESX_NOTIFY", "MYTHIC", "OKOK", "BRUTAL", "OX", "NONE" },
    Menus = { "RCORE", "ESX_CONTEXT", "OX", "QB", "NONE" },
    Map = { "PROMPT", "ALCATRAZ", "RCORE", "GABZ", "UNCLE", "YBN", "DESERTOS", "NONE" },
    Database = { "OX", "MYSQL_ASYNC", "GHMATTI", "NONE" },
    Interactions = { "OX", "QB", "Q", "MV", "NONE" },
    Phones = { "LB", "NONE" },
    Cloth = { "RCORE", "FAPPEARANCE", "IAPPEARANCE", "CODEM", "CRM", "TGIANN", "MOV", "WASABI", "ESX", "QB", "NONE" },
    Inventories = {
        "MF", "CHEEZA", "QS", "PS", "LJ", "CORE", "CODEM", "TGIANN", "ORIGEN", "AK_47", "OX", "ESX", "QB", "NONE"
    },
    Dispatches = {
        "PQ", "RCORE", "LB", "QS", "CD", "CORE", "DUSA", "PS", "LOVE_SCRIPTS", "CODEM", "TK", "ORIGEN", "REDUTZU", "NONE"
    },
}
