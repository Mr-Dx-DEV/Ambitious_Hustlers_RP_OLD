Locales['en'] = {
    PERMISSION = {
        NOT_ENOUGH_RANK = 'You need to be higher position to access this command.',
        GENERAL_MESSAGE = 'Has access: %s',
    },

    START_CLEANING_LABEL = "Start cleaning",

    ALCATRAZ_TELEPORT_TO_MAP = "You were being moved to Los Santos!",

    RESTRICT_ZONE = {
        NOT_IN_ZONE = 'This command can be used only in restricted zone! (%s)',
    },

    CHAT = {
        COMMAND_STOPALARM = 'Command used for stopping alarm',
        COMMAND_JAIL = 'Command used for jailing',
        COMMAND_UNJAIL = 'Command used for unjailing',
        COMMAND_STARTCS = 'Command used for starting player coms',
        COMMAND_JAILCP = 'Prison MDW',
        COMMAND_REMOVECS = 'Command used for removing player coms',
        COMMAND_RESETESCAPE = 'Command used for resetting prison break',
        COMMAND_SOLITARY = 'Command used for setting player to solitary',
        COMMAND_RSOLITARY = 'Command used for removing player from solitary',
    },

    COMMANDS_MESSAGES = {
        INVALID_PLAYER_ID = 'Invalid player - player id is not valid!',
        INVALID_JAIL_TIME = 'Invalid jail time - jail time value is missing!',
        INVALID_JAIL_TIME_VALUE = 'Invalid jail time - needs to be number > 0!',
        PLAYER_NEEDS_TO_BE_JAILED = 'Player needs to be jailed first!',
        PLAYER_ALREADY_HAS_SENTENCE = 'Player already has active sentence!',
        RESOURCE_LOADING = 'Resource being loaded, please wait 10sec!',
        TOO_FAR_AWAY = 'You are too far away from the player!',
    },

    CAMERA_PROLOG = {
        WELCOME_TO_PRISON = 'Welcome to ~o~prison~o~.',
        WELCOME_TO_ALCATRAZ = 'Welcome to ~o~Alcatraz~o~.',
        ALCATRAZ_PEAK_INSIDE = 'Lets take a look inside. ~o~Alcatraz~o~.',
        BASKETBALL_PLACE = 'There is some place to play ~o~basketball~o~',
        GYM_PLACE = 'You can keep in form even in prison ~o~gym~o~',
        JOB_PLACE = 'You can do some ~o~jobs~o~ and ~o~reduce~o~ your jail time.',
        ACCOUNT_PLACE = 'Create your prisoner ~o~account~o~ at this Warden.',
        CANTEEN_PLACE = 'Are you hungry? There you can get ~o~free food~o~ package.',
        BOOTH_PLACE = 'There you can find ~o~telephone booths~o~.',
    },

    HELPKEYS_LABELS = {
        CONFIRM = 'Confirm',
        EXIT_MENU = 'Exit menu',
        INTERACT = 'Interact',
    },

    BOOTHS = {
        HANGUP_LABEL = 'Press to hang up',
        DURATION_LABEL = 'Duration: %ss',
        LEAVE_CALL_ENDED = 'Current call has been ended!',

        CALL_ENDED = 'Call has been ended!',
        CALL_STARTED_FAILED_SINCE_NO_PLAYER = 'Failed to start call since this number is not active!',
        CALL_STARTED_FROM_BOOTH = 'You have started a call from the booth!',
        CALL_ENDED_FROM_BOOTH = 'Call has been ended from the booth since no response!',
    },

    RELEASE = {
        LABEL = 'Release player',
        RELEASE_READY_TEXT = 'You can be released, come to the checkpoint!',
        RELEASE_READY_SUBTITLE = 'Marked you a location, where you can ask Warden to be released!',
    },

    PLAYER_RELEASED = 'You have been released from prison!',
    CANNOT_BE_RELEASED = 'You cannot be released - remaining: %s',
    CANNOT_BE_RELEASED_SINCE_HAVING_SOLITARY = 'You cannot be released from Prison since you have active solitary!',

    NOTIFY = {
        TITLE = 'Prison'
    },

    DISPATCH = {
        BREAKOUT_MESSAGE = 'Prison break active!',
        BREAKOUT_ALERT = 'Alert here!',
        BREAKOUT_BLIP_TEXT = 'Prison break',
        BREAKOUT_ACTIVE_MESSAGE = 'Prison break active!',
    },

    UI = {
        PAGES_PRISONER_ACCOUNT = {
            HOME = "Home",
            TRANSACTIONS = "Transactions",
        },

        DIALOG = {
            CONFIRM = "Confirm",
            CANCEL = "Cancel",
        },

        REGISTER_PRISONER_ACCOUNT = {
            TITLE = "Do you want to create prison account?",
            DESC = "Select your option",
            CREATE_ACCOUNT = "Create Account",
            EXIT = "Exit",
        },

        CANTEEN = {
            QUICK_ACTION_MENU_FREE_TITLE = "Do you want to get free package?",
            QUICK_ACTION_MENU_FREE_DESC = "Please confirm to get free package.",
            QUICK_ACTION_MENU_PAID_TITLE = "Exchange credits for item: ",
            QUICK_ACTION_MENU_PAID_DESC = "Total cost of the item: ",
            FREE_PACKAGE_TITLE = "Free Package",
            FREE_PACKAGE_BUTTON_LABEL = "Claim free package",
            PAID_PACKAGE_COST_LABEL = "Credit cost:",
            PAID_PACKAGE_BUTTON_LABEL = "Purchase item",
            PAGE_TITLE = "Prison canteen",
            PAGE_DESC =
            "Canteen serves as a central hub for inmates to access both essential and supplementary goods. Here, inmates can choose from a variety of products ranging from basic necessities to special items.",
            PAGE_CREDIT_BALANCE = "Credit balance: ",
            FREE_TAB_LABEL = "Free",
            PAID_TAB_LABEL = "Paid",
            ERROR_TITLE = "Canteen",
            ERROR_NO_CANTEEN_ITEMS_LABEL = "Sorry we don't have any offers for you.",
        },

        TRADE = {
            PAGE_TITLE = "Trade",
            PAGE_DESC =
            "Welcome to the prison black market! Find everything from smokes to shivs. Need it? We've got it.",
            QUICK_ACTION_MENU_TITLE = "Exchange item for economy item: ",
            QUICK_ACTION_MENU_DESC = "Total cost of the item: ",
            ECONOMY_COST_LABEL = "Cigarette cost: ",
            ERROR_TITLE = "Trade",
            ERROR_NO_TRADE_ITEMS_LABEL = "Sorry we don't have any offers for you.",
        },

        QUEST = {
            QUICK_ACTION_EXIT_TITLE = "Exit",
        },

        BOOTH = {
            START_CALL_BUTTON_LABEL = "Start Call",
            END_CALL_BUTTON_LABEL = "End Call",
            CURRENT_STATION_NUMBER = "Booth number: ",
            DIAL_NUMBER = "Dial number",
            RESET = "Reset",
        },

        PRISONER_MDW = {
            TITLE = "Management",
            PRISONERS_TITLE = "Prisoners",
            COMS_TITLE = "Coms players",
            LOG_TITLE = "Log",
        },

        MDW_STATE_LABELS = {
            IDLE = "This citizen is currently not doing his parolle time.",
            SWEEPING = "This citizen is currently sweeping the floor.",
            RETURN = "This citizen finished sweeping, now needs to report to Officer.",
        },

        LOGS_STATE_LABELS = {
            RELEASE_PLAYER = "Released player",
            EDIT_SENTENCE = "Edited sentence",
            PRISON_BREAK = "Prison break",
            CITIZEN_JAILED = "Citizen jailed",
            CITIZEN_PAROLLED = "Citizen parolled",
        },

        MDW_PAGE_COMS = {
            PAGE_TITLE = "COMS Players",
            PAGE_DESC = "This section provides detailed insights into every citizen's background, current confinement conditions, and rehabilitation progress",
            ADD_SENTENCE_TITLE = "Add Sentence",
            SEARCH_PLACEHOLDER = "Search for a prisoner",
            QUICK_ACTION_MENU_LABEL = "COMS Actions",
            QUICK_ACTION_DESC = "Are you sure you want to do this?",
            TABLE_HEADER_COMS_PLAYER_NAME = "Name",
            TABLE_HEADER_COMS_PEROLL_AMOUNT = "Peroll tasks",
            TABLE_HEADER_COMS_PEROLL_AMOUNT_TARGET = "Target amount parolle",
            TABLE_HEADER_COMS_WORK_STATE = "Work state",
            TABLE_HEADER_COMS_SENTENCE_REASON = "Sentence state",
            TABLE_HEADER_COMS_QUICK_ACTIONS = "Quick actions",
            QUICK_ACTION_EDIT_SENTENCE = "Edit Sentence",
            QUICK_ACTION_RELEASE_PLAYER = "Release player",
            QUICK_ACTION_EDIT_NOTE = "Edit Note",
            ADD_SENTENCE_MENU_TITLE = "Add Sentence",
            ADD_SENTENCE_MENU_DESC = "Are you sure you want to proceed?",
            ADD_SENTENCE_MENU_CLOSEST_PLAYERS = "Closest players",
            ADD_SENTENCE_PREFIX = "Peroll tasks: (amount)",
            ERROR_PAGE_TITLE = "COMS",
            ERROR_NO_COMS_CITIZENS_LABEL = "Sorry we don't have any citizen on parolle for you.",
        },

        MDW_PAGE_LOGS = {
            PAGE_TITLE = "Logs",
            PAGE_DESC = "This section provides detailed logs of all the actions taken by the officers.",
            SEARCH_PLACEHOLDER = "Search for a log",
            TABLE_HEADER_ACTION = "Action",
            TABLE_HEADER_DESC = "Description",
            TABLE_OFFICER_NAME = "Officer name",
            TABLE_CITIZEN_NAME = "Citizen name",
            TABLE_TIME = "Time",
            ERROR_PAGE_TITLE = "Logs",
            ERROR_NO_LOGS = "Sorry we don't have any logs for you.",
        },

        MDW_PAGE_PRISONERS = {
            PAGE_TITLE = "Prisoners",
            PAGE_DESC = "This section provides detailed insights into every prisoner's background, current confinement conditions, and rehabilitation progress.",
            ADD_SENTENCE_DIALOG_TITLE = "Add Sentence",
            ADD_SENTENCE_BUTTON_TITLE = "Add Sentence",
            ADD_SENTENCE_DIALOG_DESC = "Are you sure you want to proceed?",
            ADD_SENTENCE_DIALOG_PREFIX = "Sentence time: ",
            ADD_SENTENCE_CLOSEST_PLAYERS = "Closest players",
            ADD_SENTENCE_SENTENCE_REASON = "Sentence reason",
            ADD_SENTENCE_SENTENCE_PLACEHOLDER = "Enter reason",
            SEARCH_PLACEHOLDER = "Search for a prisoner",
            QUICK_ACTION_TITLE_LABEL = "Prisoner options",
            QUICK_ACTION_DESC = "Are you sure you want to do this?",
            QUICK_ACTION_EDIT_SENTENCE = "Edit Sentence",
            QUICK_ACTION_RELEASE_PLAYER = "Release player",
            QUICK_ACTION_EDIT_NOTE = "Edit Note",
            DIALOG_RADIUS_LABEL_TELEPORT_PLAYER = "Teleport player",
            TABLE_HEADER_PRISONER_NAME = "Name",
            TABLE_HEADER_PRISONER_JAIL_TIME = "Jail time",
            TABLE_HEADER_PRISONER_OFFICER_NAME = "Jailed by",
            TABLE_HEADER_PRISONER_SENTENCE_REASON = "Sentence reason",
            TABLE_HEADER_PRISONER_QUICK_ACTIONS = "Quick actions",
            ERROR_PAGE_TITLE = "Prisoners",
            ERROR_NO_PRISONERS_LABEL = "Sorry we don't have any prisoners for you.",
        },

        JAIL_DIALOG = {
            SELECT_PLAYER_PLACEHOLDER = "Select Player",
            SELECT_PLAYER_LABEL = "Players",
            CONFIRM_LABEL = "Confirm",
            CANCEL_LABEL = "Cancel",
            NONE_PLAYERS = "No players found",
        },

        PRISONER_ACCOUNT = {
            TITLE = "Prisoner Account",
            OVERVIEW_TITLE = "Overview",
            OVERVIEW_ID = "Account ID:",
            OVERVIEW_TOTAL_AMOUNT = "Total Amount:",
            COLUMS_ACTION = "Action",
            COLUMS_DESCRIPTION = "Description",
            COLUMS_TIME = "Time",
            SEARCH_PLACEHOLDER = "Search for a transaction",
            TRANSACTIONS = "Transactions",
            TRANSACTIONS_TILE = "Account transactions",
            RECENT_TRANSACTIONS_TITLE = "Recent transactions",
            CREDITS = "Credits",
            NOT_ANY_TRANSACTIONS = "No transactions found",
        },

        PREVIOUS = "Previous",
        NEXT = "Next",
    },

    PROLOG = {
        SKIP_HELP_LABEL = 'To skip prolog',
    },

    PRISON_BREAK_PROLOG_SUBTITLE = {
        START_FIRST = 'I ~h~marked~h~ you a location, where you can break through wall and get outside.',
        START_SEC = 'Be ~h~careful~h~ and do not get ~h~caught~h~!',
        START_THIRD = 'Be silent, ~h~guards~h~ are everywhere!',
        START_FOURTH = 'Task: Escape from prison',
    },

    PRISON_BREAK = {
        NOT_ENOUGH_POLICE = 'Sorry but its not possible to Escape at current time!',
        NOT_IN_JOB = 'Not in job',
        INTERACT_CUTTERS = 'Use cutters',
        INTERACT_PLACE_WOODEN_BAR = 'Place wooden barricade',
        INTERACT_REPAIR_WALL = 'Repair wall',
        CAUGHT_BY_GUARD = 'You have been caught by the guard when cutting wall!',

        ITEM_REQUIRED = 'You need to have %s to do this action!',
        NO_ITEM = 'You dont have required item to do this action!',
        ACTIVE = 'Iam not going to talk with you.',
        ACTIVATED = 'Prison break has been activated! Find a way to escape!',
        IS_NOT_ACTIVE = 'Prison break is not active!',

        WALL_BLIP_TEXT = 'Escape point: %s',
        INTERACT_NOT_DONE = 'There is nothing to repair at this object!',
        INTERACT_ALREADY_DONE = 'Somebody is already interacting with this object!',
        INTERACT_DONE = 'You have successfully interacted with this object!',
        NOT_AT_INTERACTION = 'You are not at the interaction zone!',
        PRISONER_ESCAPED_RELEASE_MESSAGE = 'You have successfully escaped from prison!',

        DISCORD_PRISONER_HAS_FINISHED_TASK_LABEL = 'Prisoner has finished the task',
        DISCORD_PRISONER_HAS_ESCAPED_FROM_PRISON_LABEL = 'Prisoner has escaped from prison',

        DISCORD_OOC_LABEL = 'OOC Name',
        DISCORD_CHAR_ID_LABEL = 'Character ID',
        DISCORD_PLAYER_ID_LABEL = 'Player ID',
        DISCORD_BREAK_TYPE_LABEL = 'Break type',
        DISCORD_PATH_LAYER_LABEL = 'Path layer',
        DISCORD_ZONE_ID_LABEL = 'Zone ID',
    },

    INVENTORY = {
        FULL_INVENTORY_CAN_CARRY_ITEM = 'You have full inventory, you can carry this item!',
    },

    JAIL = {
        WELCOME_BACK_TO_PRISON = 'Welcome back to prison: remaining sentence: %s!',

        PLAYER_INPUT_LABEL = 'Jail citizen',
        PLAYER_INPUT_DESC = 'Enter jail time',

        PLAYER_JAIL_TIME_NOT_NUMBER = 'Jail time must a number',
        PLAYER_JAIL_TIME_REQUIRED = 'Jail time is required',
        PLAYER_CLOSEST_PLAYER_NOT_FOUND = 'Failed to find any closest citizen to you.',
        PLAYER_CLOSEST_PLAYER_JAIL_SUCC = 'Citizen is jailed.',
        PLAYER_CLOSEST_PLAYER_JAIL_FAIL = 'Citizen cannot be jailed, since invalid time.',
    },

    UNJAIL = {
        FAILED_TO_UNJAIL_TARGET_NOT_FOUND = 'Failed to unjail target user since not found!',
        FAILED_PLAYER_INPUT_LABEL = 'Failed to unjail player',

        PLAYER_INPUT_LABEL = 'Unjail citizen',
        PLAYER_INPUT_DESC = 'Press enter to confirm.',

        PLAYER_NOT_CONFIRM = 'You need to confirm unjail action, by pressing enter.',
        PLAYER_NOT_CONFIRM_EMPTY = 'Input form was empty, you need to confirm unjail action, by pressing enter.',
    },

    LOGS_ACTIONS = {
        LOG_CITIZEN_JAILED_BY_OFFICER = '%s jailed by officer named %s',
        LOG_CITIZEN_PAROLLED_BY_OFFICER = '%s parolled by officer named %s',
        LOG_CITIZEN_CHANGED_SENTENCE_BY_OFFICER = '%s changed sentence from %s to %s',
        LOG_CITIZEN_CITIZEN_RELEASED_BY_OFFICER = '%s was released by officer named %s',
        LOG_CITIZEN_CITIZEN_RELEASED_BY_OFFICER_FROM_PAROLLE = '%s was released by officer named %s from his parolle',
        LOG_CITIZEN_ESCAPED_PRISON = '%s escaped from prison',
        LOG_CITIZEN_PAROLLED = '%s was perolled by %s for %s amount',

    },

    LOGS_DISCORD = {
        PRISON_BREAK_TITLE_LABEL = 'Prisoner break session started',
        PRISON_BREAK_DESC_LABEL = 'Player has been trying to get out of prison..',

        PRISONER_RELEASED_TITLE_LABEL = 'Prisoner released',
        PRISONER_RELEASED_DESC_LABEL = 'Player has been released from prison',

        NEW_PRISONER_TITLE_LABEL = 'New prisoner',
        NEW_PRISONER_DESC_LABEL = 'Player has been jailed',

        CANTEEN_TITLE_LABEL = 'Prison canteen',
        CANTEEN_DESC_LABEL = 'Player take his free package',
        CANTEEN_BOUGH_ITEM_LABEL = 'Player has bought item',

        OOC_NAME = 'OOC Name',
        IC_NAME = 'IC Name',
        CHARACTER_ID = 'Character ID',
        REMAINING_JAIL_TIME = 'Remaining jail time',
        JAIL_TIME = 'Jail time',
        JAIL_REASON = 'Jail reason',
        ITEM = 'Item',
        AMOUNT = 'Amount',
        TOTAL_COST = 'Total cost',
    },

    LOGS = {
        JAIL_LOG_TITLE = 'Player jailed (%s)',
        JAIL_LOG_FIELD_PRISONER_NAME = 'Prisoner Name',
        JAIL_LOG_FIELD_PRISONER_ID = 'Prisoner ID',
        JAIL_LOG_FIELD_CHAR_ID = 'Prisoner Character ID',
        JAIL_LOG_FIELD_JAIL_TIME = 'Jail time',
        JAIL_LOG_FIELD_JAIL_REASON = 'Jail reason',
        JAIL_LOG_FIELD_JAILED_BY_OFFICER = 'Jail by',

        UNJAIL_LOG_TITLE = 'Player unjailed (%s)',
        UNJAIL_LOG_FIELD_PRISONER_NAME = 'Prisoner Name',
        UNJAIL_LOG_FIELD_PRISONER_ID = 'Prisoner ID',
        UNJAIL_LOG_FIELD_CHAR_ID = 'Prisoner Character ID',
    },

    ANNOUCEMENT = {
        PRISON = 'Prison',
        CITIZEN_JAILED_ANNOUCEMENT = 'Prisoner named %s was sentenced to: %s spent in jail!',
    },

    STASH = {
        YOU_DONT_HAVE_STASHED_ITEMS = 'You do not have any stashed items',
        ITEMS_RETURNED = 'Your stashed items have been returned',
        VIRTUAL_MONEY_RETURNED = 'Your stashed pocket money has been returned with total amount: %s',
        VIRTUAL_MONEY_SAVED = 'Your pocket money has been saved in total amount: %s',
    },

    OUTFITS = {
        WITH_TOP = 'Default outfit with top',
        WITHOUT_TOP = 'Default outfit without top',
    },

    CHAT_SUGGESTIONS = {
        JAIL_PLAYER_PARAM = 'Player ID or Player Name',
        JAIL_TIME_PARAM = 'Time in sec, min, hours, days, week, months',
        JAIL_PLAYER_HELP_PARAM = 'Jail by playerId or use player name to jail player',

        UNJAIL_PLAYER_PARAM = 'Player ID or Player Name',
        UNJAIL_PLAYER_HELP_PARAM = 'Unjail by playerId or use player name to unjail player',

        SOLITARY_PLAYER_PARAM = 'Player ID or Player Name',
        SOLITARY_PLAYER_HELP_PARAM = 'Set player to solitary by playerId or use player name to set player to solitary',

        REMOVE_SOLITARY_PLAYER_PARAM = 'Player ID or Player Name',
        REMOVE_SOLITARY_PLAYER_HELP_PARAM =
        'Remove player from solitary by playerId or use player name to remove player from solitary',

        TIME_SEC = 'Jail time in sec',
        TIME_MIN = 'Jail time in minutes',
        TIME_HOURS = 'Jail time in hours',
        TIME_DAYS = 'Jail time in days',
        TIME_WEEK = 'Jail time in week',
        TIME_MONTHS = 'Jail time in months',
    },

    CS = {
        DISPLAY_PEROLL_TIME = 'Remaining peroll: %s',

        STARTED_PEROLL = 'You have started your peroll, go to the marked location!',

        CANNOT_GENERATE_ZONE_ALREADY_ACTIVE = 'Failed to generate zone, try it again..',

        AREA_CLEANED_RETURN = 'You have cleaned the area, return to the warden!',
        PEROLL_FINISHED = 'You have finished your peroll!',

        NOT_OWNER_OF_ZONE = 'You are not the owner of this zone!',

        NOT_IN_SWEEPING_STATE = 'You are not in the sweeping state!',
        NOT_IN_RETURN_STATE = 'You are not in the return state!',

        NOT_IN_OWN_ZONE = 'You are not in your zone!',

        NOT_IN_SWEEPING_RANGE = 'You are not in the sweeping range!',

        NOT_CS_USER = 'You dont have active community service!',

        COMMUNITY_SERVICE_STARTED_PROLOG = 'Welcome back ~o~%s~o~, you have remaining peroll: (~y~%s~y~ of ~y~%s~y~)',
        COMMUNITY_SERVICE_FINISH_PROLOG = 'Marking you a ~o~location~o~, where you take your peroll!',
    },

    CIRCUIT_MINIGAME = {
        RECONNECT_TITLE = 'CONNECTION LOST',
        RECONNECT_MESSAGE = 'Reconnecting...',
        FAILED_MESSAGE = 'Connection lost, try again.',
        FAILED_TITLE = 'CIRCUIT FAILED',
        FINISH_TITLE = 'CIRCUIT COMPLETE',
        FINISH_MESSAGE = 'Connection established, move to next point.',
        GUIDE = 'Guide the signal to the exit port.',
        EXIT = 'Exit minigame',
        ARROW_UP = 'Move Up',
        ARROW_DOWN = 'Move Down',
        ARROW_LEFT = 'Move Left',
        ARROW_RIGHT = 'Move Right',
    },

    RELEASE_COMS_MESSAGE = 'You have been released from community service!',

    COMS_MENU = {
        TITLE = 'Community service',

        START_MISSION_TITLE = 'Request task',
        START_MISSION_DESC = 'Request community service from the warden.',

        REPORT_MISSION_TITLE = 'Report peroll',
        REPORT_MISSION_DESC = 'Report your peroll to the warden.',
    },

    MENU = {
        LOBBY_TITLE = 'Lobby menu',
        LOBBY_RETURN_STASHED_ITEMS_TITLE = 'Return stashed items',
        LOBBY_RETURN_STASHED_ITEMS_DESC = 'Obtain your stashed items from the prison storage.',
        LOBBY_GIFT_CREDITS_TITLE = 'Gift credits',
        LOBBY_GIFT_CREDITS_DESC = 'Sent credits to your friend in prison.',

        LOBBY_RESTORE_OUTFIT_TITLE = 'Restore outfit',
        LOBBY_RESTORE_OUTFIT_DESC = 'Restore your outfit from the prison storage.',

        JOB_TITLE = 'Prison jobs',
    },

    HELPKEYS = {
        INTERACTION_ZONE_LABEL = 'To open menu',
    },

    DISPLAY_JAIL_TIME = 'Remaining time: %s',
    DISPLAY_SOLITARY_TIME_WITH_JAIL = 'Remaining time: %s | Solitary time: %s',


    SOLITARY = {

        MDW_LOG_TITLE = 'Solitary',
        MDW_LOG_DESC = 'Player has been sent to solitary for %s!',

        MDW_LOG_TITLE_RELEASED = 'Solitary',
        MDW_LOG_DESC_RELEASED = 'Player has been released from solitary',

        DISCORD_LOG_SENT_TITLE = 'Solitary',
        DISCORD_LOG_SENT_DESC = 'Player has been sent to solitary!',

        DISCORD_LOG_OOC_NAME_LABEL = 'OOC Name',
        DISCORD_LOG_IC_NAME_LABEL = 'IC Name',
        DISCORD_LOG_REASON_LABEL = 'Reason',
        DISCORD_LOG_TIME_LABEL = 'Time',

        DISCORD_LOG_REASON_PRISONER_ATTACKED_GUARD = 'Has attacked the guard',

        DISCORD_LOG_SENT_TITLE_RELEASED = 'Solitary',
        DISCORD_LOG_SENT_DESC_RELEASED = 'Player has been released from solitary',

        PLACED_IN_SOLITARY = 'You have been placed in solitary for %s!',
        ALREADY_IN_SOLITARY = 'This prisoner is already in Solitary!',
        RELEASED = 'You have been released from solitary!',
        PRISONER_ATTACKED_GUARD = 'You have attacked the guard, you are sent to solitary for %s!',
    },

    JOB_STEPPER = {
        EXIT_TASK = 'Exit task',
    },

    KEYS = {
        JOB_LEAVE_DSC = 'Leave job',
    },

    MINIGAME_CIGAR_PRODUCTION = {
        KEY_MAPPING_PRESS_LEFT_W = 'Minigame: Press left [W] key',
        KEY_MAPPING_PRESS_LEFT_S = 'Minigame: Press left [S] key',
        KEY_MAPPING_PRESS_LEFT_A = 'Minigame: Press left [A] key',
        KEY_MAPPING_PRESS_LEFT_D = 'Minigame: Press left [D] key',

        KEY_MAPPING_PRESS_RIGHT_W = 'Minigame: Press right [ARROW_UP] key',
        KEY_MAPPING_PRESS_RIGHT_S = 'Minigame: Press right [ARROW_DOWN] key',
        KEY_MAPPING_PRESS_RIGHT_A = 'Minigame: Press right [ARROW_LEFT] key',
        KEY_MAPPING_PRESS_RIGHT_D = 'Minigame: Press right [ARROW_RIGHT] key',
    },

    MINIGAME_STATES = {
        CIRCUIT_NOT_ENOUGH_LIFES = 'Not enough lifes to continue the minigame!',
    },

    ITEM_LABELS = {
        KNIFE = 'Knife',
        WIRE_CUTTER = 'Wire cutter',
    },


    TARGET_ZONE = {
        GENERAL_LABEL = 'What i can do for you?',
        WARDEN_LABEL = 'Warden',
        CRANKS_LABEL = 'Cranks',
        DEALER_LABEL = 'Dealer',
        CANTEEN_LABEL = 'Canteen',
        HOSPITAL_BED_LABEL = 'Hospital bed',
        COMS_LABEL = 'Community service',
    },

    QUEST = {
        WARDEN_NPC_NAME = 'Warden',
        WARDEN_DESCRIPTION = 'What i can do for you?',
        PRISON_BREAK_NPC_NAME = 'John',
        PRISON_BREAK_LABEL = 'Start Prison break',
        PRISON_BREAK_DESC = 'Hmm, what about breaking out?',
        PRISON_ACCOUNT_LABEL = 'Prison account',
        JAIL_TIME_LABEL = 'Jail time',
    },

    JOB = {
        LEAVE_JOB_DIALOG = 'Leave job',
        LEAVE_JOB_DIALOG_DESC = 'Are you sure you want to leave the job?\nYou are not going to get any reward.',

        CLEAR_YARD_TITLE = 'Leaf cleaning',
        ELECTRICIAN_TITLE = 'Electrician',
        BUSHES_TRIMMING_TITLE = 'Bushes trimming',
        JANITOR_TITLE = 'Janitor',
        COOKING_TITLE = 'Cook',

        IN_ACTIVE_SESSION_LEFT = 'You have left the job.',
        IN_ACTIVE_SESSION_LEFT_REASON = 'You need to start again with job since: %s.',
        IN_ACTIVE_SESSION_FINISHED = 'You have finished the job, enjoy your reward.',
        IN_ACTIVE_SESSION_ACTIVE_JOB = 'You cannot take not new job when your current job is active.',
        IN_ACTIVE_SESSION_COOLDOWN = 'You cannot take another job, take some time for break.',
        IN_ACTIVE_SESSION_DELIVERED = 'You have delivered %s / %s, keep going!',

        RECEIVED_CREDITS = 'You have received %s credits for your job!',

        TASK_BLIP_AREA_NAME = 'Task area',
        CURRENT_JOB_NOT_FREE_SPACE = 'There is not enough space in current job, please wait.',

        ELECTRICIAN_SUBTITLES_INIT_STATE_LABEL = 'Task: Weld the wires!',

        COOKING_HELPKEYS_TASK_LABEL = 'Cooking',
        COOKING_SUBTITLES_INIT_STATE_LABEL = 'Task: Go to Kitchen and cook the food at marked cooker!',
        COOKING_SUBTITLES_ACTIVE_COOKING_LABEL = 'Now cook the food on the grill!',


        CLEAN_GROUND_SUBTITLES_ACTIVE_STATE_LABEL = 'Now clean this mess!',
        JANITOR_SUBTITLES_ACTIVE_STATE_LABEL = 'Sweep the ground until its done!',

        CLEAN_GROUND_SUBTITLES_INIT_STATE_LABEL = 'Task: Go to the marked area and clean the ground!',
        JANITOR_SUBTITLES_INIT_STATE_LABEL = 'Task: Go to the marked area and sweep the ground!',
        BUSHES_SUBTITLES_INIT_STATE_LABEL = 'Task: Go to the marked area and trim the bushes!',
        LEAF_SUBTITLES_INIT_STATE_LABEL = 'Task: Go to the marked area and clean the leaves!',
        GARDENER_SUBTITLES_INIT_STATE_LABEL = 'Task: Go to the marked area and plant the flowers!',

        STOP_CURRENT_JOB_LABEL = 'Stop current job',
        START_TASK_LABEL = 'Start task',

        STEPPER_TASK_LABEL = 'Task: %s',
        STEPPER_PROGRESS_LABEL = 'Progress: %s%%',
        STEPPER_DO_TASK_LABEL = 'Do task',
        STEPPER_EXIT_TASK_LABEL = 'Exit task',


        REWARD_LOG_TITLE = 'Job reward',
        REWARD_LOG_DESC = 'You have received %s credits for your job!',

        ELECTRICIAN_DESCRIPTION = 'Connect the wires to the right places.',
        COOK_DESCRIPTION = 'Prepare the food for the prisoners.',
        LEAF_DESCRIPTION = 'Clean the leaves from the yard.',
        BUSHES_DESCRIPTION = 'Trim the bushes.',
        JANITOR_DESCRIPTION = 'Clean the ground.',
    },

    CIGAR_PRODUCTION = {
        REQUIRED_ITEM_NOT_FOUND = 'Required item not found on the server [%s]',
        YOU_RECEIVED_REWARD = 'You have received your reward!',
        COOLDOWN = 'You need to wait before you can start again!',
    },

    JAIL_REASONS = {
        JAIL_BY_NPC = 'Jail by NPC',
    },



    GENERAL = {
        YOU_ARE_FAR_AWAY                  = 'You are not close to zone!',
        YOU_HAVE_BEEN_SENT_TO_COMS_BY     = 'You have been sent to COMS by %s',
        NOT_ACCESS_TO_INTERACT_ZONE       = 'Sorry, but not going to talk with you',
        WIRE_CUTTER_LABEL                 = 'Wire cutter',
        YOU_HAVE_BEEN_PAROLLED            = 'You have been parolled for %s amount!',
        YOU_NEED_TO_BE_ADMIN              = 'You need to be admin to perform this action!',
        TARGET_PLAYER_NOT_FOUND           = 'Target player not found!',
        ACTIVE_PAROLLE                    = 'Player already has active peroll!!',
        CANNOT_EXECUTE_ACTION_ON_YOURSELF = 'You cannot execute this action on yourself!',
        AMOUNT_CANNOT_BE_LESS_THAN_0      = 'Amount cannot be less than 0',
        REMAINING_JAIL_TIME               = 'Remaining jail time: %s',
        TARGET_PLAYER_NOT_PRISONER        = 'Target player is not prisoner!',
        TARGET_PLAYER_IS_OFFLINE          = 'Target player is offline!',
        YOU_NEED_TO_BE_IN_JOB             = 'You need to be in job to perform this action!',
        CITIZEN_ALREADY_JAILED            = 'This citizen is already jailed!',
        ITEM_NOT_FOUND                    = 'Item %s not found on server!',
        YOUT_ARE_NOT_PRISONER             = 'You are not prisoner!',
        YOU_DONT_HAVE_PRISONER_ACCOUNT    = 'You dont have prisoner account!',
        INVALID_ITEM_AMOUNT               = 'Invalid item amount!',
        TARGET_PLAYER_HAS_BEEN_RELEASED   = 'Target player has been released!',
    },

    DEALER = {
        BOUGHT_ITEM = 'You have bought item named %s with amount %s for (%s) %s',
        NOT_ENOUGH_ITEM = 'You dont have enough %s %s to buy this item!',
        NO_ECONOMY_ITEM = 'This item is not defined on the server, please contact the server owner!',
    },

    CANTEEN = {
        FREE_FOOD_PACKAGE_RECEIVED_SUCCESS = 'You have received a free food package!',
        FREE_FOOD_PACKAGE_RECEIVED = 'You have already received a free food package',
        NO_ECONOMY_ITEM = 'This item is not defined on the server, please contact the server owner!',
        BOUGHT_ITEM = 'You have bought item named %s for %s credits',
        NOT_ENOUGH_CREDITS = 'You dont have enough credits to buy this item',
        TITLE = 'Canteen',
    },

    INTERACT = {
        TELEPORT_TO_VISIT_FROM = 'Teleport to visitation',
        TELEPORT_FROM_VISIT_TO_YARD = 'Teleport from visit to yard',
        TELEPORT_FROM_CITY_TO_ALCATRAZ = 'Teleport from city to Alcatraz',
        BOOTH = 'Prison booth',
        LOBBY = 'Lobby',
        CANTEEN = 'Prisoners Canteen',
        DEALER = 'Prison dealer',
        JOBS = 'Prison jobs',
        ACCOUNT = 'Account',
        CIGAR_PRODUCTION = 'Cigar production',
        QUEST = 'Quest',
        WARDEN = 'Warden',
        GYM = 'Exercise',
        PROP_ONLY = 'PROP',
        TELEPORT = "Transport to Los Santos"
    },

    GYM = {
        HELPKEY_EXERCISE_LABEL = 'Exercise: %s',
        HELPKEY_EXERCISE_PROGRESS_LABEL = 'Progress: %s',
        HELPKEY_EXERCISE_DO_LABEL = 'Do exercise',
        HELPKEY_EXERCISE_EXIT = 'Exit exercise',
    },

    TRANSACTIONS = {
        ECONOMY_ITEM_NOT_FOUND = 'Economy item not found on your server [%s]!',
        NOT_ENOUGH_CREDITS_ON_ACCOUNT = 'You dont have enough credits on your account!',
        NOT_ENOUGH_ECONOMY_ITEM = 'You dont have enough %s on your self',
        AMOUNT_BELOW_ZERO = 'Amount cannot be below zero',
        SUCCESSFULLY_WITHDRAWN = 'You have successfully withdrawn %s credits',
        SUCCESSFULLY_DEPOSITED = 'You have successfully deposited %s credits',
    },

    CHAIRS = {
        SIT_FRONT = 'Sit front',
        SIT_BACK = 'Sit back',
        LAY = 'Lay',
        EXIT = 'To get up',

        YOU_ARE_NOW_LAYING = 'You are now laying',
        YOU_ARE_NOW_SITTING = 'You are now sitting',

        SOMEBODY_IS_SITTING = 'This place is occupied!.',
    },

    BLIPS = {
        PRISON_BREAK = 'Prison break',
        COMS = 'Community service',
        DEALER = 'Prison dealer',
        LOBBY = 'Prison lobby',
        JOBS = 'Prison jobs',
        CIGAR = 'Cigar production',
        CANTEEN = 'Prison canteen',
        ACCOUNT = 'Warden'
    }
}
