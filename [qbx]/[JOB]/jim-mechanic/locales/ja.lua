Loc = Loc or {}

Loc["ja"] = {
    common = {
        vehicleNotOwned         = "この車両はあなたの所有ではありません",
        close                   = "閉じる",
        ret                     = "戻る",
        stockLabel              = "純正",
        currentInstalled        = "現在取り付け中",
        noOptionsAvailable      = "このアイテムには選択肢がありません",
        notInstalled            = "未装着",
        actionInstalling        = "取り付け中",
        installedMsg            = "取り付け完了！",
        installationFailed      = "取り付けに失敗しました！",
        removedMsg              = "削除しました！",
        actionRemoving          = "削除中",
        removalFailed           = "削除に失敗しました！",
        cannotInstall           = "この車両には取り付けできません",
        optionsCount            = "選択肢の数：",
        alreadyInstalled        = "すでに取り付け済み",
        menuInstalledText       = "装着済み",
        nearWheelWarning        = "ホイールにもっと近づいてください",
        nearEngineWarning       = "エンジンにもっと近づいてください",
        closerToHeadlights      = "ヘッドライトに近づいてください",
        attachingHarness        = "レーシングハーネスを装着中...",
        liveryPrefix            = "リバリー",
        extraPrefix             = "エクストラ",
        oldLiverySuffix         = " 古いリバリー",
        zeroPrefix              = "0 - ",
        submit                  = "送信",
        settingBaseCoat         = "下塗り中...",
        sprayCancelled          = "塗装をキャンセルしました",

        toggleOn                = "オン",
        toggleOff               = "オフ",
        backButton              = "戻る",
        unknownStatus           = "不明",
        notApplicable           = "該当なし",

        needVehicle             = "この操作を行うには車両に乗っている必要があります",
        needDriver              = "この操作を行うには運転席にいる必要があります",

        dutyMessage             = "メカニックに連絡してください！"
    },


	stancer = {
		wheel_lf        = "左前輪",
    	wheel_rf        = "右前輪",
    	wheel_lr        = "左後輪",
       	wheel_rr        = "右後輪",
       	wheel_lm1       = "左中間（1）輪",
        wheel_rm1       = "右中間（1）輪",
        wheel_lm2       = "左中間（2）輪",
        wheel_rm2       = "右中間（2）輪",
        wheel_lm3       = "左中間（3）輪",
        wheel_rm3       = "右中間（3）輪",
        spacer          = "スペーサー",
        camber          = "キャンバー角",
        width           = "幅（全ホイール）",
        size            = "サイズ（全ホイール）",
        stance          = "スタンス",
        reset           = "リセット",
        resetAll        = "全てリセット",
        resetBar        = "全ホイールをリセット中",
        adjusting       = "調整中"
	},

    -- Progress Bar Texts
    progressbar = {
        progress_washing = "手を洗っています",
        progress_mix     = "ミックス中：",
        progress_pour    = "注いでいます：",
        progress_drink   = "飲んでいます：",
        progress_eat     = "食べています：",
        progress_make    = "作成中：",
    },

    -- Error Messages
    error = {
        not_clockedin          	= "勤務中ではありません",
        cancelled     			= "キャンセルされました",
    },

    -- Tire Actions
    tireActions = {
        removeBulletProofTires = "防弾タイヤを取り外しました！",
        removeDriftTires       = "ドリフトタイヤを取り外しました！",
    },

    -- Xenon / Neon Settings
    xenonSettings = {
       notInstalled           = "キセノンヘッドライトが装着されていません",
       headerLighting         = "ライト制御",
       neonHeaderUnderglow    = "アンダーグローライト制御",
       neonHeaderColor        = "アンダーグロー色設定",
       xenonHeaderHeadlight   = "キセノンヘッドライト設定",
       customRGBHeader        = "カスタムRGB",
       customConfirm          = "適用",
       neonTextDescription    = "ネオンライトの細かい調整",
       toggleAll              = "すべて切り替え",
       frontLabel             = "前方",
       rightLabel             = "右側",
       backLabel              = "後方",
       leftLabel              = "左側",
       neonTextChangeColor    = "アンダーグローの色を変更",
       xenonHeader            = "キセノン設定",
       xenonTextDescription   = "ヘッドライトの色を調整",
    },


    -- Cosmetic Items: Bumpers
    bumpers = {
        grilleMenu             	= "グリル",
        frontBumperMenu        	= "フロントバンパー",
        backBumperMenu         	= "リアバンパー",
    },

    -- Cosmetic Items: Exhaust
    exhaustMod = {
        menuHeader             	= "マフラー改造",
    },

    -- Cosmetic Items: Exterior	 Modifications
    exteriorMod = {
		stockMod 				= "純正外装モッド..",
    },

    -- Cosmetic Items: Hood
    hoodMod = {
        menuHeader             	= "ボンネット改造",
    },

    -- Cosmetic Items: Horns
    hornsMod = {
        testCurrentHorn        	= "現在のホーンをテスト",
        testHorn               	= "ホーンをテスト",
        applyHorn               = "ホーンを適用",
        menuHeader              = "ホーン改造",
    },

    -- Cosmetic Items: Livery /	 Wrap
    liveryMod = {
        oldMod        = "旧型",
        menuHeader    = "ラッピング改造",
        menuOldHeader = "ルーフラップ改造",
    },


    -- NOS / Turbo Settings
    paintOptions = {
        primaryColor    = "メインカラー",
        secondaryColor  = "サブカラー",
        pearlescent     = "パール",
        wheelColor      = "ホイール",
        dashboardColor  = "ダッシュボード",
        interiorColor   = "内装",

        classicFinish   = "クラシック",
        metallicFinish  = "メタリック",
        matteFinish     = "マット",
        metalsFinish    = "金属",
        chameleonFinish = "カメレオン",

        menuHeader      = "再塗装",
    },



    -- Paint Options
    paintOptions = {
        primaryColor    = "メインカラー",
        secondaryColor  = "サブカラー",
        pearlescent     = "パール",
        wheelColor      = "ホイール",
        dashboardColor  = "ダッシュボード",
        interiorColor   = "内装",

        classicFinish   = "クラシック",
        metallicFinish  = "メタリック",
        matteFinish     = "マット",
        metalsFinish    = "金属",
        chameleonFinish = "カメレオン",

        menuHeader      = "再塗装",
    },


    -- Paint RGB / HEX Picker
    paintRGB = {
        --selectLabel            	= "Selection:",
        finishSelectLabel   = "仕上げ選択：",
        --hexError               	= "Hex code must be 6 characters",
        customHeader        = "カスタムHEXおよびRGB",
        chromeLabel         = "クローム",
        hexPickerLabel      = "HEXピッカー",
        rgbPickerLabel      = "RGBピッカー",
        sprayingBase        = "下地塗装中...",
        sprayingVehicle     = "車両塗装中...",
        stopInstruction     = "中止 - [Backspace]",
        hexLabel            = "HEX：",
        rgbLabel            = "RGB：",
        redLabel            = "R - ",
        greenLabel          = "G - ",
        blueLabel           = "B - ",
    },

    -- Plates Options
    plates = {
        plateHolder   = "プレートホルダー",
        vanityPlates  = "バニティプレート",
        customPlates  = "カスタムプレート",
    },


    -- Rims / Wheels Modificati	ons
    rimsMod = {
        menuHeader        = "ホイール改造",
        sportRims         = "スポーツ",
        muscleRims        = "マッスル",
        lowriderRims      = "ローライダー",
        suvRims           = "SUV",
        offroadRims       = "オフロード",
        tunerRims         = "チューナー",
        highendRims       = "ハイエンド",
        bennysOriginals   = "ベニーズ・オリジナル",
        bennysBespoke     = "ベニーズ・特注",
        openWheel         = "オープンホイール",
        streetRims        = "ストリート",
        trackRims         = "トラック",
        frontWheel        = "フロントホイール",
        backWheel         = "リアホイール",
        motorcycleRims    = "バイク用",
        customRims        = "カスタムホイール",
        customTires       = "カスタムタイヤ",
    },


    -- Roll Cage Modification
    rollCageMod = {
        menuHeader             	= " ロールケージ改造",
    },

    -- Roof Modification
    roofMod = {
        menuHeader             	= " ルーフ改造",
    },

    -- Seat Modification
    seatMod = {
        menuHeader             	= " スポイラー改造",
    },

    -- Spoiler Modification
    spoilersMod = {
        menuHeader             	= "Spoiler Modification",
    },

    -- Smoke / Tire Smoke Options
    smokeSettings = {
        alreadyApplied = "このカラーはすでに適用されています！",
        menuHeader     = "タイヤスモーク改造",
        removeSmoke    = "スモークカラーを削除",
        customRGB      = "カスタムRGB",
    },

    -- Window Tint Options
    windowTints = {
        menuHeader             	= "ウィンドウの色合い",
    },

    -- Store / Shop Menu
    sstoreMenu = {
        browseStore      = "ストアを見る",
        mechanicTools    = "整備用ツール",
        performanceItems = "性能アイテム",
        cosmeticItems    = "外装アイテム",
        repairItems      = "修理アイテム",
        nosItems         = "NOSアイテム",
    },


    -- Crafting / Mechanic Craf	ting Menu
    craftingMenu = {
        menuHeader        = "整備クラフト",
        toolsHeader       = "整備ツール",
        repairHeader      = "修理アイテム",
        performanceHeader = "性能アイテム",
        cosmeticHeader    = "外装アイテム",
        nosHeader         = "NOSアイテム",
        itemsCountSuffix  = " 個のアイテム",
        extras            = "追加アイテム",
    },


    -- Payments
    payments = {
        charge         	        = "顧客に請求",
    },

-- Damage Warnings / Messages
    damageMessages = {
        engineOverheating = "エンジンが過熱しています",
        steeringIssue = "ハンドルに違和感があります...",
        engineStalled = "エンジンが停止しました",
        lightsAffected = "ライトに何か影響があります...",
        drippingSound = "液体が滴る音が聞こえます...",
    },


    -- Check / Vehicle Details
-- Check / Vehicle Details
    checkDetails = {
        plateLabel = "ナンバープレート",
        valueLabel = "価値：$",
        unavailable = "❌ 利用不可",

        engineLabel = "エンジン",
        brakesLabel = "ブレーキ",
        suspensionLabel = "サスペンション",
        transmissionLabel = "トランスミッション",
        armorLabel = "アーマー",
        turboLabel = "ターボ",
        xenonLabel = "キセノン",
        driftTyresLabel = "ドリフトタイヤ",
        bulletproofTyresLabel = "防弾タイヤ",
        cosmeticsListHeader = "外装カスタム一覧",
        vehicleLabel = "車両",
    
        optionsLabel = "オプション",
        externalCosmetics = "外装カスタム",
        internalCosmetics = "内装カスタム",
        spoilersLabel = "スポイラー",
        frontBumpersLabel = "フロントバンパー",
        rearBumpersLabel = "リアバンパー",
        skirtsLabel = "スカート",
        exhaustsLabel = "マフラー",
        grillesLabel = "グリル",
        hoodsLabel = "ボンネット",
        leftFenderLabel = "左フェンダー",
        rightFenderLabel = "右フェンダー",
        roofLabel = "ルーフ",
        plateHoldersLabel = "ナンバープレートホルダー",
        vanityPlatesLabel = "バニティプレート",
        trimALabel = "トリムA",
        trimBLabel = "トリムB",
        trunksLabel = "トランク",
        engineBlocksLabel = "エンジンブロック",
        airFiltersLabel = "エアフィルター",
        engineStrutLabel = "エンジンストラット",
        archCoversLabel = "アーチカバー",
    
        rollCagesLabel = "ロールケージ",
        ornamentsLabel = "オーナメント",
        dashboardsLabel = "ダッシュボード",
        dialsLabel = "メーター",
        doorSpeakersLabel = "ドアスピーカー",
        seatsLabel = "シート",
        steeringWheelsLabel = "ステアリングホイール",
        shifterLeversLabel = "シフトレバー",
        plaquesLabel = "プレート",
        speakersLabel = "スピーカー",
        hydraulicsLabel = "油圧装置",
        aerialsLabel = "アンテナ",
        fuelTanksLabel = "燃料タンク",
        wrapLabel = "ラッピング",
        yesLabel = "はい",
        noLabel = "いいえ",
        removePrompt = "削除しますか：",
        antilagLabel = "アンチラグ",
        harnessLabel = "ハーネス",
        nitrousLabel = "ナイトロス",
    },


    -- Repair / Vehicle Repair 	Actions
    repairActions = {
        --browseStash            	= "Browse Stash",
        --materialsWarning       	= "You don't have enough materials",
        checkingEngineDamage   	= "エンジンの損傷を確認中...",
        checkingBodyDamage     	= "車体の損傷を確認中...",

        bodyLabel = "車体",
        oilLevelLabel = "オイル量",
        driveshaftLabel = "ドライブシャフト",
        sparkPlugs = "スパークプラグ",
        carBattery = "バッテリー",
        fuelTank = "燃料タンク",
        replaceTires = "タイヤを交換",

        actionRepairing = "修理中",
        actionChanging = "交換中：",
        repairedMsg = "修理完了", -- 例: エンジン 修理完了
        repairCancelled = "修理がキャンセルされました！",
        noMaterialsInSafe = "セーフに十分な材料がありません",

        costLabel = "費用",
        --statusLabel            	= "Status: ",
        repairPrompt = "修理しますか：",

        applyingDuctTape = "ダクトテープを貼っています...",
        ductTapeLimit = "これ以上ダクトテープを使えません",
        noVehicleNearby = "近くに車両がありません",
    },

    -- Police / Emergency Vehicle Menu
    policeMenu = {
        header = "改造ステーション",
        useRepairStation = "改造ステーションを使用",
        repairOption = "修理",
        extrasOption = "エクストラ",
        extraOption = "追加装備",
        cleaningVehicle = "車両を洗浄中...",
        repairingEngine = "エンジンを修理中...",
        repairingBody = "車体を修理中...",
        repairComplete = "修理完了",
        emergencyOnly = "緊急車両専用",
    },

    -- Manual Repair Actions
    manualRepairs = {
        replaceTyres           	= "損傷したタイヤを交換中",
        removeWindows          	= "損傷した窓を取り外し中",
        repairDoors            	= "ドアを修理中",
    },

    -- Car Wax Options
    carWaxOptions = {
        cleanVehicle           	= "車両を洗浄",
        cleanAndWax            	= "洗車＋ワックス",
        cleanAndPremiumWax     	= "洗車＋プレミアムワックス",
        cleanAndUltimateWax    	= "洗車＋アルティメットワックス",
    },

    -- Extra / Miscellaneous Ac	tions
    extraOptions = {
        vehicleClean = "車両をきれいにする",
        doorError = "ドアエラー",
        doorsLocked = "車両のドアはロックされています",
        flippingVehicle = "車両をひっくり返し中",
        vehicleFlipped = "成功！車両を元に戻しました",
        flipFailed = "車両の反転に失敗しました！",
        --noSeatEntered          	= "No seat number entered",
         moveSeat = "シートを移動：",
        seatFastWarning = "この車両は速すぎて移動できません...",
        seatUnavailable = "このシートは使用できません...",
        raceHarnessActive = "レーシングハーネス着用中：シート移動不可",
        exitRestriction = "シートベルト/ハーネスが有効なため降車できません",
        seatbeltOnMsg = "シートベルト装着",
        seatbeltOffMsg = "シートベルト解除",
        toggleSeatbelt = "シートベルト切り替え",
    },

    -- General / Utility Functi	ons
    generalFunctions = {
        distanceLabel = "距離：",
        actionInsideVehicle = "車両内ではこの操作はできません",
        actionOutsideVehicle = "車両外ではこの操作はできません",
        vehicleLocked = "車両はロックされています",
        shopRestriction = "ショップ外では作業できません",
        mechanicOnly = "この操作は整備士のみ実行できます",
        notThisShop = "このショップでは作業できません",
        --checkingStash          	= "Checking stash...",
    },

    -- Server-Side Functions
    serverFunctions = {
        checkVehicleDamage = "車両の損傷を確認",
        checkVehicleMods = "車両に利用可能な改造を確認",
        flipNearestVehicle = "最寄りの車両を反転",
        cleanVehicle = "車両を洗浄",
        toggleHood = "ボンネットの開閉",
        toggleTrunk = "トランクの開閉",
        toggleDoor = "ドアの開閉 [0〜3]",
        changeSeat = "他の座席に移動 [-1〜10]",
    },


    -- Preview Settings
    previewSettings = {
        changesLabel = "変更内容",
        previewNotAllowed = "プレビュー中はこの操作はできません",
        cameraEnabledMsg = "カメラ有効化",
        classLabel = "車両クラス",
        rgbPreviewToolHeader = "RGBカラー プレビュー",
        finishOption = "仕上げ",
        redOption = "赤",
        greenOption = "緑",
        blueOption = "青",
    },

    plateChange = {
        alreadyExists = "このナンバープレートはすでに存在します！",
        illegalChar = "不正な文字が含まれています！",
        tooShort = "名前が短すぎます",
        tooLong = "名前が長すぎます",
        plateUpdated = "ナンバープレートを更新しました：",
        specificJob = "特定のジョブでのみ使用可能です",
        specificItem = "このコマンドは特定のジョブでのみ使用できます",
        cannotChange = "このプレートは変更できません",
        blacklisted = "禁止された語句が含まれています",
        notOnline = "オーナーがオンラインではありません",
    },

    -- Vehicle Window Options (Array of options)
    vehicleWindowOptions = {
        { name = "リムジン", id = 4 },
        { name = "グリーン", id = 5 },
        { name = "ライトスモーク", id = 3 },
        { name = "ダークスモーク", id = 2 },
        { name = "ピュアブラック", id = 1 }
    },

    -- Vehicle Plate Options
    vehiclePlateOptions = {
        { name = "青地に白文字 #1", id = 0 },
        { name = "青地に白文字 #2", id = 3 },
        { name = "青地に白文字 #3", id = 4 },
        { name = "黄地に青文字", id = 2 },
        { name = "黄地に黒文字", id = 1 },
        { name = "ノースヤンクトン", id = 5 },

        (GetGameBuildNumber() >= 3095) and { name = "ラス・ベンチュラス", id = 7 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "リバティーシティ", id = 8 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "LSカーミート", id = 9 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "パニック", id = 10 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "パウンダーズ", id = 11 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "スプランク", id = 12 } or nil,
    },

    -- Vehicle Neon Options (Also used for smoke)
    vehicleNeonOptions = {
        { name = "ホワイト", R = 255, G = 255, B = 255 },
        { name = "ブルー", R = 2, G = 21, B = 255 },
        { name = "エレクトリックブルー", R = 3, G = 83, B = 255 },
        { name = "ミントグリーン", R = 0, G = 255, B = 140 },
        { name = "ライムグリーン", R = 94, G = 255, B = 1 },
        { name = "イエロー", R = 255, G = 255, B = 0 },
        { name = "ゴールデンシャワー", R = 255, G = 150, B = 0 },
        { name = "オレンジ", R = 255, G = 62, B = 0 },
        { name = "レッド", R = 255, G = 1, B = 1 },
        { name = "ポニーピンク", R = 255, G = 50, B = 100 },
        { name = "ホットピンク", R = 255, G = 5, B = 190 },
        { name = "パープル", R = 35, G = 1, B = 255 },
        { name = "ブラックライト", R = 15, G = 3, B = 255 }
    },

    -- Vehicle Horns (Array of options)
    vehicleHorns = {
        { name = "トラックホーン", id = 0 },
        { name = "警察ホーン", id = 1 },
        { name = "クラウンホーン", id = 2 },
        { name = "ミュージックホーン 1", id = 3 },
        { name = "ミュージックホーン 2", id = 4 },
        { name = "ミュージックホーン 3", id = 5 },
        { name = "ミュージックホーン 4", id = 6 },
        { name = "ミュージックホーン 5", id = 7 },
        { name = "悲しいトロンボーン", id = 8 },
        { name = "クラシックホーン 1", id = 9 },
        { name = "クラシックホーン 2", id = 10 },
        { name = "クラシックホーン 3", id = 11 },
        { name = "クラシックホーン 4", id = 12 },
        { name = "クラシックホーン 5", id = 13 },
        { name = "クラシックホーン 6", id = 14 },
        { name = "クラシックホーン 7", id = 15 },
        { name = "ド", id = 16 },
        { name = "レ", id = 17 },
        { name = "ミ", id = 18 },
        { name = "ファ", id = 19 },
        { name = "ソ", id = 20 },
        { name = "ラ", id = 21 },
        { name = "シ", id = 22 },
        { name = "高いド", id = 23 },
        { name = "ジャズホーン 1", id = 24 },
        { name = "ジャズホーン 2", id = 25 },
        { name = "ジャズホーン 3", id = 26 },
        { name = "ジャズホーンループ", id = 27 },
        { name = "星条旗 1", id = 28 },
        { name = "星条旗 2", id = 29 },
        { name = "星条旗 3", id = 30 },
        { name = "星条旗 4", id = 31 },
        { name = "クラシックホーン 8 ループ", id = 32 },
        { name = "クラシックホーン 9 ループ", id = 33 },
        { name = "クラシックホーン 10 ループ", id = 34 },
        { name = "クラシックホーン 8", id = 35 },
        { name = "クラシックホーン 9", id = 36 },
        { name = "クラシックホーン 10", id = 37 },
        { name = "葬式ループ", id = 38 },
        { name = "葬式", id = 39 },
        { name = "スプーキーループ", id = 40 },
        { name = "スプーキー", id = 41 },
        { name = "サンアンドレアスループ", id = 42 },
        { name = "サンアンドレアス", id = 43 },
        { name = "リバティシティループ", id = 44 },
        { name = "リバティシティ", id = 45 },
        { name = "フェスティブ 1 ループ", id = 46 },
        { name = "フェスティブ 1", id = 47 },
        { name = "フェスティブ 2 ループ", id = 48 },
        { name = "フェスティブ 2", id = 49 },
        { name = "フェスティブ 3 ループ", id = 50 },
        { name = "フェスティブ 3", id = 51 },
        { name = "エアホーン 1 ループ", id = 52 },
        { name = "エアホーン 1", id = 53 },
        { name = "エアホーン 2 ループ", id = 54 },
        { name = "エアホーン 2", id = 55 },
        { name = "エアホーン 3 ループ", id = 56 },
        { name = "エアホーン 3", id = 57 },
    },

    -- Vehicle Respray Options: Classic Finishes
    vehicleResprayOptionsClassic = {
        { name = "ブラック", id = 0 },
        { name = "カーボンブラック", id = 147 },
        { name = "グラファイト", id = 1 },
        { name = "アンスラサイトブラック", id = 11 },
        { name = "ブラックスチール", id = 2 },
        { name = "ダークスチール", id = 3 },
        { name = "シルバー", id = 4 },
        { name = "青みがかったシルバー", id = 5 },
        { name = "ロールドスチール", id = 6 },
        { name = "シャドウシルバー", id = 7 },
        { name = "ストーンシルバー", id = 8 },
        { name = "ミッドナイトシルバー", id = 9 },
        { name = "鋳鉄シルバー", id = 10 },
        { name = "レッド", id = 27 },
        { name = "トリノレッド", id = 28 },
        { name = "フォーミュラレッド", id = 29 },
        { name = "ラバレッド", id = 150 },
        { name = "ブレイズレッド", id = 30 },
        { name = "グレースレッド", id = 31 },
        { name = "ガーネットレッド", id = 32 },
        { name = "サンセットレッド", id = 33 },
        { name = "カベルネレッド", id = 34 },
        { name = "ワインレッド", id = 143 },
        { name = "キャンディレッド", id = 35 },
        { name = "ホットピンク", id = 135 },
        { name = "フィスター・ピンク", id = 137 },
        { name = "サーモンピンク", id = 136 },
        { name = "サンライズオレンジ", id = 36 },
        { name = "オレンジ", id = 38 },
        { name = "ブライトオレンジ", id = 138 },
        { name = "ゴールド", id = 99 },
        { name = "ブロンズ", id = 90 },
        { name = "イエロー", id = 88 },
        { name = "レースイエロー", id = 89 },
        { name = "デューイエロー", id = 91 },
        { name = "ダークグリーン", id = 49 },
        { name = "レーシンググリーン", id = 50 },
        { name = "シーグリーン", id = 51 },
        { name = "オリーブグリーン", id = 52 },
        { name = "ブライトグリーン", id = 53 },
        { name = "ガソリン・グリーン", id = 54 },
        { name = "ライムグリーン", id = 92 },
        { name = "ミッドナイトブルー", id = 141 },
        { name = "ギャラクシーブルー", id = 61 },
        { name = "ダークブルー", id = 62 },
        { name = "サクソンブルー", id = 63 },
        { name = "ブルー", id = 64 },
        { name = "マリナーブルー", id = 65 },
        { name = "ハーバーブルー", id = 66 },
        { name = "ダイヤモンドブルー", id = 67 },
        { name = "サーフブルー", id = 68 },
        { name = "ノーティカルブルー", id = 69 },
        { name = "レーシングブルー", id = 73 },
        { name = "ウルトラブルー", id = 70 },
        { name = "ライトブルー", id = 74 },
        { name = "チョコレートブラウン", id = 96 },
        { name = "バイソンブラウン", id = 101 },
        { name = "クリーンブラウン", id = 95 },
        { name = "フェルツァーブラウン", id = 94 },
        { name = "メイプルブラウン", id = 97 },
        { name = "ビーチウッドブラウン", id = 103 },
        { name = "シエンナブラウン", id = 104 },
        { name = "サドルブラウン", id = 98 },
        { name = "モスブラウン", id = 100 },
        { name = "ウッドビーチブラウン", id = 102 },
        { name = "ストローブラウン", id = 99 },
        { name = "サンディブラウン", id = 105 },
        { name = "ブリーチドブラウン", id = 106 },
        { name = "シャフターパープル", id = 71 },
        { name = "スピネーカーパープル", id = 72 },
        { name = "ミッドナイトパープル", id = 142 },
        { name = "ブライトパープル", id = 145 },
        { name = "クリーム", id = 107 },
        { name = "アイスホワイト", id = 111 },
        { name = "フロストホワイト", id = 112 },
    },

    -- Vehicle Respray Options: Matte Finishes
    vehicleResprayOptionsMatte = {
        { name = "マットブラック", id = 12 },
        { name = "マットグレー", id = 13 },
        { name = "マットライトグレー", id = 14 },
        { name = "マットアイスホワイト", id = 131 },
        { name = "マットブルー", id = 83 },
        { name = "マットダークブルー", id = 82 },
        { name = "マットミッドナイトブルー", id = 84 },
        { name = "マットミッドナイトパープル", id = 149 },
        { name = "マットシャフターパープル", id = 148 },
        { name = "マットレッド", id = 39 },
        { name = "マットダークレッド", id = 40 },
        { name = "マットオレンジ", id = 41 },
        { name = "マットイエロー", id = 42 },
        { name = "マットライムグリーン", id = 55 },
        { name = "マットグリーン", id = 128 },
        { name = "マットフォレストグリーン", id = 151 },
        { name = "マットフォリッジグリーン", id = 155 },
        { name = "マットオリーブドラブ", id = 152 },
        { name = "マットダークアース", id = 153 },
        { name = "マットデザートタン", id = 154 },
    },

    -- Vehicle Respray Options: Metallic Finishes
    vehicleResprayOptionsMetals = {
        { name = "ブラッシュドスチール", id = 117 },
        { name = "ブラッシュドブラックスチール", id = 118 },
        { name = "ブラッシュドアルミニウム", id = 119 },
        { name = "ピュアゴールド", id = 158 },
        { name = "ブラッシュドゴールド", id = 159 },
        { name = "クローム", id = 120 },
    },

    -- Vehicle Respray Options: Chameleon Finishes
    vehicleResprayOptionsChameleon = {
        { name = "アノダイズドレッド", id = 161 },
        { name = "アノダイズドワイン", id = 162 },
        { name = "アノダイズドパープル", id = 163 },
        { name = "アノダイズドブルー", id = 164 },
        { name = "アノダイズドグリーン", id = 165 },
        { name = "アノダイズドライム", id = 166 },
        { name = "アノダイズドカッパー", id = 167 },
        { name = "アノダイズドブロンズ", id = 168 },
        { name = "アノダイズドシャンパン", id = 169 },
        { name = "アノダイズドゴールド", id = 170 },
        { name = "グリーン/ブルー フリップ", id = 171 },
        { name = "グリーン/レッド フリップ", id = 172 },
        { name = "グリーン/ブラウン フリップ", id = 173 },
        { name = "グリーン/ターコイズ フリップ", id = 174 },
        { name = "グリーン/パープル フリップ", id = 175 },
        { name = "ティール/パープル フリップ", id = 176 },
        { name = "ターコイズ/レッド フリップ", id = 177 },
        { name = "ターコイズ/パープル フリップ", id = 178 },
        { name = "シアン/パープル フリップ", id = 179 },
        { name = "ブルー/ピンク フリップ", id = 180 },
        { name = "ブルー/グリーン フリップ", id = 181 },
        { name = "パープル/レッド フリップ", id = 182 },
        { name = "パープル/グリーン フリップ", id = 183 },
        { name = "マゼンタ/グリーン フリップ", id = 184 },
        { name = "マゼンタ/イエロー フリップ", id = 185 },
        { name = "バーガンディ/グリーン フリップ", id = 186 },
        { name = "マゼンタ/シアン フリップ", id = 187 },
        { name = "カッパー/パープル フリップ", id = 188 },
        { name = "マゼンタ/オレンジ フリップ", id = 189 },
        { name = "レッド/オレンジ フリップ", id = 190 },
        { name = "オレンジ/パープル フリップ", id = 191 },
        { name = "オレンジ/ブルー フリップ", id = 192 },
        { name = "ホワイト/パープル フリップ", id = 193 },
        { name = "レッド/レインボー フリップ", id = 194 },
        { name = "ブルー/レインボー フリップ", id = 195 },
        { name = "ダークグリーンパール", id = 196 },
        { name = "ダークティールパール", id = 197 },
        { name = "ダークブルーパール", id = 198 },
        { name = "ダークパープルパール", id = 199 },
        { name = "オイルスリックパール", id = 200 },
        { name = "ライトグリーンパール", id = 201 },
        { name = "ライトブルーパール", id = 202 },
        { name = "ライトパープルパール", id = 203 },
        { name = "ライトピンクパール", id = 204 },
        { name = "オフホワイトパール", id = 205 },
        { name = "ピンクパール", id = 206 },
        { name = "イエローパール", id = 207 },
        { name = "グリーンパール", id = 208 },
        { name = "ブルーパール", id = 209 },
        { name = "クリームパール", id = 210 },
        { name = "ホワイトプリズマティック", id = 211 },
        { name = "グラファイトプリズマティック", id = 212 },
        { name = "ダークブループリズマティック", id = 213 },
        { name = "ダークパープルプリズマティック", id = 214 },
        { name = "ホットピンクプリズマティック", id = 215 },
        { name = "ダークレッドプリズマティック", id = 216 },
        { name = "ダークグリーンプリズマティック", id = 217 },
        { name = "ブラックプリズマティック", id = 218 },
        { name = "ブラック・オイルスピル", id = 219 },
        { name = "ブラック・レインボー", id = 220 },
        { name = "ブラック・ホログラフィック", id = 221 },
        { name = "ホワイト・ホログラフィック", id = 222 },
        { name = "モノクローム", id = 223 },
        { name = "ナイト／デイ", id = 224 },
        { name = "フェーリエル 2", id = 225 },
        { name = "スプランク・エクストリーム", id = 226 },
        { name = "バイスシティ", id = 227 },
        { name = "シンセウェーブ", id = 228 },
        { name = "フォーシーズンズ", id = 229 },
        { name = "メゾネット9 スローバック", id = 230 },
        { name = "バブルガム", id = 231 },
        { name = "フルレインボー", id = 232 },
        { name = "サンセット", id = 233 },
        { name = "ザ・セブン", id = 234 },
        { name = "仮面ライダー", id = 235 },
        { name = "クローム・アバレーション", id = 236 },
        { name = "クリスマスだよ", id = 237 },
        { name = "気温", id = 238 },
        { name = "ハオ・スペシャルワークス", id = 239 },
        { name = "エレクトロ", id = 240 },
        { name = "モニカ", id = 241 },
        { name = "フブキ", id = 242 },
    }
}