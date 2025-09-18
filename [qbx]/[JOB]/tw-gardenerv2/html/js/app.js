let audioPlayer = null;
const store = Vuex.createStore({
    components: {},
    getters: {},
    mutations: {},
    actions: {}
});

const app = Vue.createApp({
    components: {},
    data: () => ({
        isActive: false,
        notifyShow: false,
        notifications: [],

        progressbar: 0,
        progressbarLabel: "",
        localeValue: 'English',
        state: {
            mainShow: false,
            teamShow: false,
            finishShow: false,
            jobIsActive: false,
            tutoMenuShow: false,
            currentPage: 'home',
            missionScoreData: {
                "Players": [
                    {
                        "scoreAmount": 0,
                        "playerName": "Player 1",
                        "playerLevel": 1,
                        "playerIdentifier": "ID001",
                        "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "bonusScoreAmount": 0,
                        "source": 1
                    },
                    {
                        "scoreAmount": 0,
                        "playerName": "Player 2",
                        "playerLevel": 2,
                        "playerIdentifier": "ID002",
                        "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "bonusScoreAmount": 0,
                        "source": 1
                    },
                    {
                        "scoreAmount": 0,
                        "playerName": "Player 3",
                        "playerLevel": 3,
                        "playerIdentifier": "ID003",
                        "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "bonusScoreAmount": 0,
                        "source": 1
                    },
                    {
                        "scoreAmount": 0,
                        "playerName": "Player 4",
                        "playerLevel": 4,
                        "playerIdentifier": "ID004",
                        "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "bonusScoreAmount": 0,
                        "source": 1
                    }
                ],
                "regionJobTask": [
                    {
                        "jobLabel": "Test Job 1",
                        "madeAmount": 0,
                        "finish": false,
                        "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "jobName": "lawnmowing",
                        "invisible": false,
                        "jobCount": 2
                    },
                    {
                        "jobLabel": "Test Job 2",
                        "madeAmount": 0,
                        "finish": false,
                        "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "jobName": "prunegrass",
                        "invisible": false,
                        "jobCount": 2
                    },
                    {
                        "jobLabel": "Test Job 3",
                        "madeAmount": 0,
                        "finish": false,
                        "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "jobName": "branch",
                        "invisible": false,
                        "jobCount": 2
                    },
                    {
                        "jobLabel": "Test Job 4",
                        "madeAmount": 0,
                        "finish": false,
                        "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                        "jobName": "plantflower",
                        "invisible": false,
                        "jobCount": 2
                    }
                ],
            },
            languageTitle: [],
            defaultLogo: 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png',
            serverName: 'TWORST',
            scriptName: "Gardener",
            serverMoneyType: '$',
            selectedRegion: false,
            invitePlayerModal: false,
            displayedRegions: [],
            displayedDailyMission: [],
            currentRegionIndex: 0,
            regionsPerPage: 2,
            currentDailyMissionIndex: 0,
            dailyMissionsPerPage: 2,
            slideDirection: 'right',
            settings: {
                Sounds: true,
                Language: 'en',
                moveUI: false,
                uiPositions: {
                    teamList: { top: '77.22vh', left: '85.94vw' },
                    scoreList: { top: '2.64vh', left: '1.61vw' },
                    inviteSide: { top: '2.85vh', left: '73.07vw' },
                    notificationDiv: { top: '40.48vh', left: '81.54vw' }
                },
            },
            nearbyPlayers: [],
            requestData: {
                show: false,
                hostIdentifier: '',
                hostName: '',
            },
            finishJobData: false,
            locales: {},
            miniGame: {
                direction: 1,
                cursorPosition: 0,
                gameInterval: null,
                isActive: false,
                greenPosition: 0,
                syncObject: null,
                branchCoords: null,
                closestIndex: null,
            },
            tutorialList: []
        },
        playerData: {
            playerLevel: 1,
            playerXp: 1000,
            playerNextXp: 2000,
            playerIdentifier: '1234567890',
            owner: false,
            dailymission: [],
            playerDailyMission: [],
            soundEffect: true,
            locale: 'en',
        },
        playerListData: [
            {
                playerName: 'Brenden Randall',
                playerLevel: 1,
                playerIdentifier: '1234567890',
                playerImage: './img/regionBg.png',
                playerOwner: true,
            },
            {
                playerName: 'Brenden Randall 2',
                playerLevel: 1,
                playerIdentifier: '1234567890',
                playerImage: './img/regionBg.png',
            },
        ],
        regionData: [
            {
                regionName: 'Los santos Department',
                regionID: 1,
                regionImage: 'region.png',
                regionLevel: 1,
                regionXP: 1000,
                regionMoney: 1000,
            },
        ],
        historyData: [
            {
                historyRegionID: 1,
                historyTaskCount: 16,
                historyRewardMoney: 56000,
                historyRewardXP: 2500,
                historyTime: '01-01-1999 16:50',
                historyPlayer: [
                    'Brenden Randall',
                    'Brenden Randall 2',
                    'Brenden Randall 3',
                ]
            }
        ],
        dailyMission: false,
    }),

    watch: {
    },

    beforeDestroy() {
        document.removeEventListener("click", this.handleClickOutside);
    },
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
        document.addEventListener("click", this.handleClickOutside);

        this.checkInterval = setInterval(() => {
            if (this.notifications.length > 0 && !this.state.settings.moveUI) {
                this.notifications = this.notifications.filter((notification, index, self) =>
                    index === self.findIndex(n => n.message === notification.message)
                );

                this.notifyShow = true;
                let delays = [];
                this.notifications.slice(0, 3).forEach((notification, index) => {
                    let delay = setTimeout(() => {
                        const indexToRemove = this.notifications.indexOf(notification);
                        if (indexToRemove !== -1) {
                            this.notifications.splice(indexToRemove, 1);
                            if (this.notifications.length === 0) {
                                this.notifyShow = false;
                            }
                        }
                        clearTimeout(delays[indexToRemove]);
                    }, 5000 * (index + 1));

                    delays.push(delay);
                });
            }
        }, 0);
    },

    methods: {
        toggleDropdown() {
            this.isActive = !this.isActive;
        },
        toggleBox(index) {
            this.state.tutorialList[index].isOpen = !this.state.tutorialList[index].isOpen;
        },
        selectOption(option) {
            this.isActive = false;
            this.playerData.locale = option.value;
            this.localeValue = option.label
        },
        handleClickOutside(event) {
            if (!this.$el.contains(event.target)) {
                this.isActive = false;
            }
        },
        prevRegion() {
            if (this.state.currentRegionIndex > 0) {
                this.state.slideDirection = 'left';
                this.state.currentRegionIndex -= this.state.regionsPerPage;
            }
        },
        nextRegion() {
            if (this.state.currentRegionIndex + this.state.regionsPerPage < this.regionData.length) {
                this.state.slideDirection = 'right';
                this.state.currentRegionIndex += this.state.regionsPerPage;
            }
        },
        prevDailyMission() {
            if (this.state.currentDailyMissionIndex > 0) {
                this.state.currentDailyMissionIndex -= this.state.dailyMissionsPerPage;
            }
        },
        nextDailyMission() {
            if (this.state.currentDailyMissionIndex + this.state.dailyMissionsPerPage < this.playerData.playerDailyMission.length) {
                this.state.currentDailyMissionIndex += this.state.dailyMissionsPerPage;
            }
        },
        invitePlayer(playerID) {
            if (playerID == null || playerID < 0) return;
            clicksound("click.wav", this.playerData.soundEffect);
            postNUI("invitePlayer", playerID);
        },
        requestActionButton(action) {
            if (action == "accept") {
                clicksound("click.wav", this.playerData.soundEffect);
                postNUI("acceptInvite", this.state.requestData.identifier);
                this.state.requestData.show = false;
            } else if (action == "deny") {
                this.closeNUI();
                this.state.requestData.show = false;
            }
        },
        acceptInvite() {
            clicksound("click.wav", this.playerData.soundEffect);
            postNUI("acceptInvite", this.state.requestData.identifier);
            this.state.requestData.show = false;
        },
        denyInvite() {
            clicksound("click.wav", this.playerData.soundEffect);
            this.state.requestData.show = false;
        },
        kickPlayer(playerIdentifier) {
            if (!playerIdentifier) {
                return;
            }

            const targetPlayer = this.playerListData.find(x => x.playerIdentifier === playerIdentifier);
            const ownerPlayer = this.playerListData.find(x => x.playerOwner === true);

            if (!targetPlayer || !ownerPlayer) {
                return;
            }


            if (playerIdentifier === this.playerData.playerIdentifier) {
                postNUI("leaveLobby", ownerPlayer.playerIdentifier);
                return;
            }

            if (targetPlayer.playerIdentifier === ownerPlayer.playerIdentifier) {
                clicksound("errorclick.mp3", this.playerData.soundEffect);
                return;
            }

            clicksound("click.wav", this.playerData.soundEffect);
            postNUI("kickPlayer", {
                lobbyID: ownerPlayer.playerIdentifier,
                identifier: playerIdentifier,
                targetID: targetPlayer.source
            });
        },
        selectRegion(regionValue) {
            if (regionValue == null || this.playerData.playerIdentifier == null) return;
            const identifierData = this.playerListData.findIndex(x => x.playerIdentifier == this.playerData.playerIdentifier);
            const playerOwner = this.playerListData.findIndex(x => x.playerOwner == true)
            if (this.playerListData[identifierData].playerIdentifier === this.playerListData[playerOwner].playerIdentifier) {
                if (this.state.selectedRegion != false && this.state.selectedRegion != null) {
                    if (regionValue.regionID == this.state.selectedRegion.regionID) {
                        clicksound("click.wav", this.playerData.soundEffect);
                        postNUI("selectRegion", false);
                        return;
                    }
                }
                if (regionValue && regionValue.regionID) {
                    const regionID = regionValue.regionID;

                    if (regionID == -1) return;
                    if (regionValue.regionInfo.regionMinimumLevel > this.playerData.playerLevel) {
                        clicksound("errorclick.mp3", this.playerData.soundEffect);
                        return;
                    }
                    clicksound("click.wav", this.playerData.soundEffect);
                    postNUI("selectRegion", regionValue);
                }
            }

        },
        startJob() {
            if (this.state.selectedRegion) {
                if (this.state.jobIsActive) {
                    clicksound("click.wav", this.playerData.soundEffect);
                    postNUI("resetJob");
                } else {
                    clicksound("click.wav", this.playerData.soundEffect);
                    postNUI("startJob", this.state.selectedRegion);
                }
            }
        },
        closeNUI() {
            this.state.mainShow = false;
            postNUI("closeNUI");
        },
        closeInviteNUI() {
            this.state.mainShow = false;
            this.state.requestData.show = false;
            postNUI("closeInviteNUI");
        },
        keyHandler(event) {
            if (event.keyCode == 27) {
                if (this.state.tutoMenuShow) {
                    this.state.tutoMenuShow = false;
                    postNUI("closeTutoNUI");
                } else {
                    if (!this.state.settings.moveUI) {
                        this.closeNUI();
                    } else {
                        this.state.settings.moveUI = false;
                        this.state.teamShow = false;
                        this.state.requestData.show = false;
                        this.state.mainShow = true;
                        this.state.currentPage = 'settings';
                        $(".newTeamList, .allScoreList, .newInviteSide, .notifyList").removeClass("movable");
                        $("body").find(".ui-moving-info").remove();

                        if (this.notifications.length === 1 && this.notifications[0].message === "Bildirim yerini taşıyabilirsiniz") {
                            this.notifications = [];
                            this.notifyShow = false;
                        }
                    }
                }
            }

            if (event.keyCode == 13 && this.state.settings.moveUI) {
                this.state.settings.moveUI = false;
                this.state.teamShow = false;
                this.state.requestData.show = false;
                this.state.mainShow = true;
                this.state.currentPage = 'settings';
                $(".newTeamList, .allScoreList, .newInviteSide, .notifyList").removeClass("movable");
                $("body").find(".ui-moving-info").remove();

                if (this.notifications.length === 1 && this.notifications[0].message === "Bildirim yerini taşıyabilirsiniz") {
                    this.notifications = [];
                    this.notifyShow = false;
                }
            }
        },
        formatNumber(number) {
            if (number == null) return 0;
            return number.toLocaleString("tr-TR");
        },
        calculateProgress(mission, complete) {
            return (mission / complete) * 100;
        },
        mergeData(sqlData, configData) {
            if (sqlData == null || configData == null) return;
            const mergedData = configData.map(mission => {
                const sqlMissionData = sqlData[mission.name];
                return {
                    ...mission,
                    complete: sqlMissionData ? sqlMissionData.complete : false,
                    currentCount: sqlMissionData ? sqlMissionData.count : 0,
                    progressbar: sqlMissionData ? this.calculateProgress(sqlMissionData.count, mission.count) : 0
                };
            });
            this.totalCompleted = mergedData.filter(mission => mission.complete).length;
            this.playerData.playerDailyMission = mergedData;
        },
        startMiniGame() {
            this.state.miniGame.isActive = true;
            this.state.miniGame.greenPosition = Math.random() * 20.8;
            this.state.miniGame.cursorPosition = 0;
            this.state.miniGame.direction = 1;

            if (this.state.miniGame.gameInterval) {
                clearInterval(this.state.miniGame.gameInterval);
            }

            this.state.miniGame.gameInterval = setInterval(() => {
                this.state.miniGame.cursorPosition += 0.5 * this.state.miniGame.direction;

                if (this.state.miniGame.cursorPosition >= 23.2 || this.state.miniGame.cursorPosition <= 0) {
                    this.state.miniGame.direction *= -1;
                }
            }, 16);

            window.addEventListener('keydown', this.handleMiniGameKeydown);
        },
        handleMiniGameKeydown(e) {
            if (e.code === 'KeyE' && this.state.miniGame.isActive) {
                clearInterval(this.state.miniGame.gameInterval);
                window.removeEventListener('keydown', this.handleMiniGameKeydown);

                const cursor = document.querySelector('.miniGameCursor');
                const green = document.querySelector('.miniGameGreen');

                if (!cursor || !green) return;

                const cursorRect = cursor.getBoundingClientRect();
                const greenRect = green.getBoundingClientRect();

                const collision = !(
                    cursorRect.right < greenRect.left ||
                    cursorRect.left > greenRect.right ||
                    cursorRect.bottom < greenRect.top ||
                    cursorRect.top > greenRect.bottom
                );

                if (collision) {
                    postNUI('miniGameResult', { success: true, syncObject: this.state.miniGame.syncObject, branchCoords: this.state.miniGame.branchCoords, closestIndex: this.state.miniGame.closestIndex });
                } else {
                    postNUI('miniGameResult', { success: false });
                }

                this.state.miniGame.isActive = false;
            }
        },
        moveUI() {
            if (!this.state.jobIsActive) {
                this.state.settings.moveUI = true;
                this.state.mainShow = false;
                this.state.teamShow = true;
                this.state.requestData.show = true;
                this.state.requestData.lobbyOwner = "Brenden Randall";

                this.notifyShow = true;

                if (this.notifications.length === 0) {
                    this.notifications.push({
                        message: "Bildirim yerini taşıyabilirsiniz",
                        type: "info"
                    });
                }

                this.$nextTick(() => {
                    this.applyUIPositions();
                    this.makeAllUIDraggable();
                });
            }
        },
        applyUIPositions() {
            $(".newTeamList").css(this.state.settings.uiPositions.teamList);
            $(".allScoreList").css(this.state.settings.uiPositions.scoreList);
            $(".newInviteSide").css(this.state.settings.uiPositions.inviteSide);
            $(".notifyList").css(this.state.settings.uiPositions.notificationDiv);

            if (this.state.settings.moveUI) {
                $(".newTeamList, .allScoreList, .newInviteSide, .notifyList").css({
                    'position': 'absolute',
                    'z-index': '999'
                });
            } else {
                $(".newTeamList").css({
                    'position': '',
                    'z-index': ''
                });
                $(".allScoreList").css({
                    'position': '',
                    'z-index': ''
                });
                $(".newInviteSide").css({
                    'position': '',
                    'z-index': ''
                });
                $(".notifyList").css({
                    'position': '',
                    'z-index': ''
                });
            }
        },
        makeElementDraggable(selector, positionKey) {
            try {
                $(selector).draggable("instance") && $(selector).draggable("destroy");
            } catch (e) {
                //console.log("Draggable henüz başlatılmamış");
            }

            $(selector).addClass("movable");

            $(selector).draggable({
                containment: "body",
                scroll: false,
                stop: (event, ui) => {
                    const windowWidth = window.innerWidth;
                    const windowHeight = window.innerHeight;

                    const topVh = (ui.position.top / windowHeight * 100).toFixed(2) + 'vh';
                    const leftVw = (ui.position.left / windowWidth * 100).toFixed(2) + 'vw';

                    this.state.settings.uiPositions[positionKey] = { top: topVh, left: leftVw };
                }
            });
        },
        makeAllUIDraggable() {
            this.makeElementDraggable(".newTeamList", "teamList");
            this.makeElementDraggable(".allScoreList", "scoreList");
            this.makeElementDraggable(".newInviteSide", "inviteSide");
            this.makeElementDraggable(".notifyList", "notificationDiv");
        },
        saveSettings() {
            this.state.settings.moveUI = false;
            postNUI("saveSettings", {
                uiPositions: this.state.settings.uiPositions,
                soundEffect: this.playerData.soundEffect,
                locale: this.playerData.locale,
            });

            $(".newTeamList, .allScoreList, .newInviteSide, .notifyList").removeClass("movable");
            $("body").find(".ui-moving-info").remove();

            if (this.notifications.length === 1 && this.notifications[0].message === "Bildirim yerini taşıyabilirsiniz") {
                this.notifications = [];
                this.notifyShow = false;
            }
        },
        resetSettings() {
            this.state.settings.uiPositions = {
                teamList: { top: '77.22vh', left: '85.94vw' },
                scoreList: { top: '0vh', left: '1.30vw' },
                inviteSide: { top: '0vh', left: '74.48vw' },
                notificationDiv: { top: '20vh', left: '1vw' }
            };

            this.applyUIPositions()
        },
        startProgress(label, time) {
            this.progressbarLabel = label;
            this.progressbar = 0;
            const duration = time * 1000;
            let startTime = null;

            const animate = (timestamp) => {
                if (!startTime) startTime = timestamp;
                const elapsed = timestamp - startTime;
                this.progressbar = Math.min((elapsed / duration) * 100, 100);

                if (elapsed < duration) {
                    requestAnimationFrame(animate);
                } else {
                    setTimeout(() => {
                        stopsound();
                        this.progressbar = 0;
                        this.progressbarLabel = "";
                    }, 100);
                }
            };

            requestAnimationFrame(animate);
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "CHECK_NUI":
                    postNUI("checkNUI");
                    break;
                case "CLOSENUI":
                    this.closeNUI();
                    break;
                case "OPEN_MENU":
                    this.state.mainShow = true;
                    this.playerData = event.data.payload;
                    if (event.data.payload.uiSettings) {
                        if (event.data.payload.uiSettings.uiPositions) {
                            this.state.settings.uiPositions = event.data.payload.uiSettings.uiPositions;
                        }
                        this.$nextTick(() => {
                            this.applyUIPositions();
                        });
                    }
                    this.mergeData(this.playerData.dailymission, this.dailyMission);


                    this.state.languageTitle.forEach(item => {
                        if (item.value == this.playerData.locale) {
                            this.localeValue = item.label;
                        }
                    });

                    break;
                case "LOAD_LOBBY":
                    this.playerListData = event.data.payload;
                    break;
                case "LOAD_HISTORY":
                    this.historyData = event.data.payload;
                    break;
                case "JOB_IS_ACTIVE":
                    this.state.jobIsActive = event.data.payload;
                    break;
                case "REFRESH_LOBBY":
                    if (!event.data.payload) {
                        this.state.selectedRegion = false;
                    } else {
                        this.state.selectedRegion = event.data.payload;
                    }
                    break;
                case "STATE":
                    this.state.serverName = event.data.payload.serverName;
                    this.state.serverMoneyType = event.data.payload.serverMoneyType;
                    this.state.tebexAccess = event.data.payload.tebexAccess;
                    this.dailyMission = event.data.payload.dailyMission;
                    this.regionData = event.data.payload.regionData;
                    this.state.tutorialList = event.data.payload.tutorialList
                    this.state.locales = event.data.payload.locales;
                    this.state.settings.uiPositions = event.data.payload.uiPositions;
                    if (event.data.payload.uiPositions && event.data.payload.uiPositions) {
                        this.state.settings.uiPositions = event.data.payload.uiPositions;
                        this.$nextTick(() => {
                            this.applyUIPositions();
                        });
                    }
                    this.state.languageTitle = event.data.payload.languageTitle;
                    this.state.defaultLogo = event.data.payload.defaultLogo;
                    break;
                case "UPDATE_LOCALES":
                    this.state.locales = event.data.payload
                    break;
                case "NEARBY_PLAYERS":
                    this.state.nearbyPlayers = event.data.payload;
                    break;
                case "INVITE_MENU":
                    this.state.requestData = event.data.payload
                    this.state.requestData.show = true;
                    break;
                case "START_JOB":
                    this.state.mainShow = false;
                    this.state.missionScoreData = event.data.payload;
                    this.state.teamShow = true;
                    break;
                case "REFRESH_JOBTASK":
                    this.state.missionScoreData = event.data.payload;
                    break;
                case "START_MINIGAME":
                    this.startMiniGame();
                    this.state.miniGame.syncObject = event.data.payload.syncObject;
                    this.state.miniGame.branchCoords = event.data.payload.branchCoords;
                    this.state.miniGame.closestIndex = event.data.payload.closestIndex;
                    break;
                case "FINISH_JOB":
                    this.state.finishJobData = event.data.payload;
                    this.state.finishShow = true;
                    this.state.teamShow = false;
                    this.state.mainShow = false;
                    this.state.selectedRegion = false;
                    this.state.jobIsActive = false;
                    this.state.currentPage = 'home';
                    this.state.missionScoreData = {
                        "Players": [
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 1",
                                "playerLevel": 1,
                                "playerIdentifier": "ID001",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 2",
                                "playerLevel": 2,
                                "playerIdentifier": "ID002",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 3",
                                "playerLevel": 3,
                                "playerIdentifier": "ID003",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 4",
                                "playerLevel": 4,
                                "playerIdentifier": "ID004",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            }
                        ],
                        "regionJobTask": [
                            {
                                "jobLabel": "Test Job 1",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "lawnmowing",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 2",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "prunegrass",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 3",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "branch",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 4",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "plantflower",
                                "invisible": false,
                                "jobCount": 2
                            }
                        ],
                    }
                    break;
                case "RESET_JOB":
                    this.state.finishJobData = false;
                    this.state.finishShow = true;
                    this.state.teamShow = false;
                    this.state.mainShow = false;
                    this.state.selectedRegion = false;
                    this.state.jobIsActive = false;
                    this.state.currentPage = 'home';

                    this.state.missionScoreData = {
                        "Players": [
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 1",
                                "playerLevel": 1,
                                "playerIdentifier": "ID001",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 2",
                                "playerLevel": 2,
                                "playerIdentifier": "ID002",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 3",
                                "playerLevel": 3,
                                "playerIdentifier": "ID003",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 4",
                                "playerLevel": 4,
                                "playerIdentifier": "ID004",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            }
                        ],
                        "regionJobTask": [
                            {
                                "jobLabel": "Test Job 1",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "lawnmowing",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 2",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "prunegrass",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 3",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "branch",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 4",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "plantflower",
                                "invisible": false,
                                "jobCount": 2
                            }
                        ],
                    }
                    this.closeNUI();
                    break;
                case "CLOSE_INVITE_MENU":
                    clicksound("click.wav", this.playerData.soundEffect);
                    this.closeInviteNUI();
                    this.state.requestData.show = false;
                    break;
                case "CLOSE_FINISH_JOB":
                    this.state.finishShow = false;
                    this.state.finishJobData = false;
                    break;
                case "LOAD_SETTINGS":
                    this.state.settings.uiPositions = event.data.payload.uiPositions;
                    this.$nextTick(() => {
                        this.applyUIPositions();
                    });
                    break;
                case "EDIT_SETTINGS":
                    this.state.settings.moveUI = true;
                    this.state.mainShow = false;
                    this.state.teamShow = true;

                    this.$nextTick(() => {
                        this.applyUIPositions();
                        this.makeAllUIDraggable();
                    });
                    break;
                case "NOTIFICATION":
                    this.notifications.push(event.data.payload);
                    this.notifyShow = true;
                    break;
                case "showProgressBar":
                    this.startProgress(event.data.payload.label, event.data.payload.time);
                    break;
                case "playSound":
                    clicksound(event.data.payload.sound, this.playerData.soundEffect);
                    break;
                case "CLEAR_COOP_DATA":
                    this.state.finishJobData = false;
                    this.state.finishShow = true;
                    this.state.teamShow = false;
                    this.state.mainShow = false;
                    this.state.selectedRegion = false;
                    this.state.jobIsActive = false;
                    this.state.currentPage = 'home';

                    this.state.missionScoreData = {
                        "Players": [
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 1",
                                "playerLevel": 1,
                                "playerIdentifier": "ID001",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 2",
                                "playerLevel": 2,
                                "playerIdentifier": "ID002",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 3",
                                "playerLevel": 3,
                                "playerIdentifier": "ID003",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            },
                            {
                                "scoreAmount": 0,
                                "playerName": "Player 4",
                                "playerLevel": 4,
                                "playerIdentifier": "ID004",
                                "playerImage": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "bonusScoreAmount": 0,
                                "source": 1
                            }
                        ],
                        "regionJobTask": [
                            {
                                "jobLabel": "Test Job 1",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "lawnmowing",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 2",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "prunegrass",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 3",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "branch",
                                "invisible": false,
                                "jobCount": 2
                            },
                            {
                                "jobLabel": "Test Job 4",
                                "madeAmount": 0,
                                "finish": false,
                                "img": "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png",
                                "jobName": "plantflower",
                                "invisible": false,
                                "jobCount": 2
                            }
                        ],
                    }
                    break;
                case "OPEN_TUTORIAL":
                    if (this.state.mainShow || this.state.moveUI) {
                        return;
                    }

                    if (this.state.tutoMenuShow) {
                        this.state.tutoMenuShow = false;
                    } else {
                        this.state.tutoMenuShow = true;
                        this.state.tutorialList.forEach(item => {
                            item.isOpen = false;
                        });
                    }
                    break;
                default:
                    break;
            }
        },
    },
    computed: {
        getRegionAwards(region) {
            if (region && region.regionAwards) {
                return region.regionAwards.newMoney || region.regionAwards.money;
            }
            return 0;
        },
        progressPercentage() {
            if (this.playerData.playerXp == null || this.playerData.playerNextXp == null) return 0;
            let percentage = (this.playerData.playerXp / this.playerData.playerNextXp) * 100;
            if (percentage > 100) {
                return 100;
            }
            return percentage;
        },
        displayedRegions() {
            return this.regionData.slice(
                this.state.currentRegionIndex,
                this.state.currentRegionIndex + this.state.regionsPerPage
            );
        },
        displayedDailyMission() {
            return this.playerData.playerDailyMission.slice(
                this.state.currentDailyMissionIndex,
                this.state.currentDailyMissionIndex + this.state.dailyMissionsPerPage
            );
        },
        canGoNext() {
            return this.state.currentRegionIndex + this.state.regionsPerPage < this.regionData.length;
        },
        canGoPrev() {
            return this.state.currentRegionIndex > 0;
        },
        canGoNextDailyMission() {
            return this.state.currentDailyMissionIndex + this.state.dailyMissionsPerPage < this.playerData.playerDailyMission.length;
        },
        canGoPrevDailyMission() {
            return this.state.currentDailyMissionIndex > 0;
        },
        inviteSlots() {
            const totalPlayers = this.playerListData.length + Object.values(this.state.nearbyPlayers).length;
            const missing = 4 - totalPlayers;
            return missing > 0 ? missing : 0;
        },
    }
});

app.use(store).mount("#app");
var resourceName = "tworst-gardenerv2";

if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            console.error(`HTTP Hatası: ${response.status}`);
            return null;
        }

        const text = await response.text();
        if (!text) {
            return null;
        }

        try {
            return JSON.parse(text);
        } catch (error) {
            console.error("Geçersiz JSON formatı:", text);
            return null;
        }
    } catch (error) {
        return null;
    }
};

function clicksound(val, soundEffect) {
    if (soundEffect == false || soundEffect == null) {
        return;
    }
    let audioPath = `./sounds/${val}`;
    audioPlayer = new Howl({
        src: [audioPath]
    });
    audioPlayer.volume(0.4);
    audioPlayer.play();
}

function stopsound() {
    if (audioPlayer) {
        audioPlayer.stop();
    }
}
