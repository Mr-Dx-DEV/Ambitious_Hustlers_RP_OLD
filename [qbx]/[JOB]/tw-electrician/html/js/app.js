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
                ],
            },
            languageTitle: [],
            defaultLogo: 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png',
            serverName: 'TWORST',
            scriptName: "ElectricianV2",
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
            tutorialList: [],
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
        wiringShow: false,
        foringShow: false,
        liftInfoShow: false,
        panos: [...Array(12).keys()].map(i => ({ id: `pano${i + 1}` })),
        activeSwitch: null,
        removedScrews: {},
        insertedScrews: {},
        voltVolumeModal: 0,
        intervalId: null,
        switchShow: false,
        voltShow: false,
        lineMeterShow: false,
        foundBrokenPano: false,
        randomPanoId: null,
        selectedkey: null,
        isMouseDown: true,
        isSwitchProcessing: false,
    }),

    watch: {
        lineMeterShow(newVal) {
            if (newVal) {
                this.initializeLineMeter();
            }
        }
    },

    beforeDestroy() {
        document.removeEventListener("click", this.handleClickOutside);
        document.removeEventListener("mousemove", this.updateLineMeterPosition);
        clearInterval(this.checkInterval);
    },
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
        document.addEventListener("click", this.handleClickOutside);

        if (this.lineMeterShow) {
            this.initializeLineMeter();
        }

        setInterval(() => {
            if (this.foundBrokenPano) {
                if (this.voltShow || this.lineMeterShow) {
                    this.voltShow = false;
                    this.lineMeterShow = false;
                }
            }
        }, 800);

        setInterval(() => {
            if (!this.isMouseDown && this.voltVolumeModal > 0) {
                this.voltVolumeModal = 0;
            }
        }, 22000);

        this.checkInterval = setInterval(() => {
            if (this.notifications.length > 0 && !this.state.settings.moveUI) {
                this.notifications = this.notifications.filter((notification, index, self) =>
                    index === self.findIndex(n => n.message === notification.message)
                );

                this.notifyShow = true;
                let delays = [];
                this.notifications.slice(0, 3).forEach((notification, index) => {
                    const duration = 10000;
                    let delay = setTimeout(() => {
                        const indexToRemove = this.notifications.indexOf(notification);
                        if (indexToRemove !== -1) {
                            this.notifications.splice(indexToRemove, 1);
                            if (this.notifications.length === 0) {
                                this.notifyShow = false;
                            }
                        }
                        clearTimeout(delays[indexToRemove]);
                    }, duration * (index + 1) / 3);

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
                clicksound("click.wav", this.playerData.soundEffect);
                this.state.slideDirection = 'left';
                this.state.currentRegionIndex -= this.state.regionsPerPage;
            }
        },
        nextRegion() {
            if (this.state.currentRegionIndex + this.state.regionsPerPage < this.regionData.length) {
                clicksound("click.wav", this.playerData.soundEffect);
                this.state.slideDirection = 'right';
                this.state.currentRegionIndex += this.state.regionsPerPage;
            }
        },
        prevDailyMission() {
            if (this.state.currentDailyMissionIndex > 0) {
                clicksound("click.wav", this.playerData.soundEffect);
                this.state.currentDailyMissionIndex -= this.state.dailyMissionsPerPage;
            }
        },
        nextDailyMission() {
            if (this.state.currentDailyMissionIndex + this.state.dailyMissionsPerPage < this.playerData.playerDailyMission.length) {
                clicksound("click.wav", this.playerData.soundEffect);
                this.state.currentDailyMissionIndex += this.state.dailyMissionsPerPage;
            }
        },
        invitePlayer(playerID) {
            if (playerID == null || playerID < 0) return;
            clicksound("click.wav", this.playerData.soundEffect);
            postNUI("invitePlayer", playerID);
        },
        changePage(page) {
            if (this.state.currentPage == page) return;
            clicksound("click.wav", this.playerData.soundEffect);
            this.state.currentPage = page;
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
                }
                else if (this.switchShow || this.voltShow || this.lineMeterShow) {
                    this.switchShow = false;
                    this.voltShow = false;
                    this.lineMeterShow = false;

                    let regiontrafficKey = this.selectedkey;

                    if (regiontrafficKey && regiontrafficKey.fixed == false) {
                        setTimeout(() => {
                            postNUI("closeNUIHouse", { regiontrafficKey });
                        }, 1000);
                    } else {
                        setTimeout(() => {
                            postNUI("closeNUIFixed", { regiontrafficKey });
                        }, 1000);
                    }

                    setTimeout(() => {
                        this.voltShow = false;
                        this.lineMeterShow = false;
                    }, 800);
                } else if (this.foringShow) {
                    this.foringShow = false;
                    postNUI("closeForingShow", { foringGameData: this.foringGameData });
                } else if (this.wiringShow) {
                    this.wiringShow = false;
                    postNUI("closeWiringShow", { coords: this.selectedwiringCoords });
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

                        if (this.notifications.length === 1 && this.notifications[0].message === "You can move the notification") {
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

                if (this.notifications.length === 1 && this.notifications[0].message === "You can move the notification") {
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
        moveUI() {
            if (!this.state.jobIsActive) {
                clicksound("click.wav", this.playerData.soundEffect);
                this.state.settings.moveUI = true;
                this.state.mainShow = false;
                this.state.teamShow = true;
                this.state.requestData.show = true;
                this.state.requestData.lobbyOwner = "Brenden Randall";

                this.notifyShow = true;

                if (this.notifications.length === 0) {
                    this.notifications.push({
                        message: "You can move the notification",
                        type: "info",
                        duration: 10000
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
            clicksound("click.wav", this.playerData.soundEffect);
            this.state.settings.moveUI = false;
            postNUI("saveSettings", {
                uiPositions: this.state.settings.uiPositions,
                soundEffect: this.playerData.soundEffect,
                locale: this.playerData.locale,
            });

            $(".newTeamList, .allScoreList, .newInviteSide, .notifyList").removeClass("movable");
            $("body").find(".ui-moving-info").remove();

            if (this.notifications.length === 1 && this.notifications[0].message === "You can move the notification") {
                this.notifications = [];
                this.notifyShow = false;
            }
        },
        resetSettings() {
            clicksound("click.wav", this.playerData.soundEffect);
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
                case "WIRING_MINIGAME":
                    this.wiringShow = true;
                    this.selectedwiringCoords = event.data.payload.coords;
                    window.drag(event.data.payload);
                    break;
                case "SWITCH_MINIGAME":
                    if (this.switchShow || this.voltShow || this.lineMeterShow) {
                        return;
                    } else {
                        this.foundBrokenPano = false;
                        this.switchShow = true;
                        this.selectedkey = event.data.payload;
                        this.randomPanoId = `pano${Math.floor(Math.random() * 12) + 1}`;
                        this.resetMinigame();
                        setTimeout(() => {
                            this.voltShow = true;
                            this.lineMeterShow = true;
                        }, 800);
                    }
                    break;
                case "SWITCH_MINIGAME_HOUSE":
                    if (this.switchShow || this.voltShow || this.lineMeterShow) {
                        return;
                    } else {
                        this.foundBrokenPano = false;
                        this.switchShow = true;
                        this.selectedkey = event.data.payload;
                        this.randomPanoId = `pano${Math.floor(Math.random() * 12) + 1}`;
                        this.resetMinigame();
                        setTimeout(() => {
                            this.voltShow = true;
                            this.lineMeterShow = true;
                        }, 800);
                    }
                    break;
                case "CLOSE_TRAFO_MISSION":
                    this.foundBrokenPano = false;
                    this.switchShow = false;
                    this.voltShow = false;
                    this.lineMeterShow = false;
                    break;
                case "CLOSE_WIRING":
                        this.wiringShow = false;
                break;
                case "START_MINIGAME_CABLETWO":
                    this.foringShow = true;
                    this.foringGameData = event.data.payload;
                    window.fourminigame(event.data.payload);
                break;
                case "LIFT_INFO":
                    this.liftInfoShow = event.data.payload;
                break;
                default:
                    break;
            }
        },
        handleMouseDown(e, panoId) {
            if (panoId === this.randomPanoId) {
                this.voltVolumeModal = Math.floor(Math.random() * 4);
                +1;

                this.isMouseDown = true;
                if (this.lineMeterShow) {
                    this.updateLineMeterPosition(e);
                }
                if (!this.foundBrokenPano) {
                    setTimeout(() => {
                        this.foundBrokenPano = true;
                    }, 2000);
                }
            } else {
                this.voltVolumeModal = Math.floor(Math.random() * 6) + 270;
                if (this.lineMeterShow) {
                    this.updateLineMeterPosition(e);
                }
            }
        },
        handleMouseUp(panoId) {
            setTimeout(() => {
                if (!this.isMouseDown && this.voltVolumeModal > 0) {
                    // this.isMouseDown = false;
                    // this.voltVolumeModal = 0;
                }
            }, 1000);
        },
        initializeLineMeter() {
            this.$nextTick(() => {
                const lineMeter = document.getElementById("lineMeter");
                if (lineMeter) {
                    this.isMouseDown = false;

                    const onMouseMove = e => {
                        if (this.isMouseDown) {
                            this.updateLineMeterPosition(e);
                        }
                    };

                    const onMouseDown = () => {
                        this.isMouseDown = true;

                        document.body.style.cursor = "none";
                    };

                    const onMouseUp = () => {
                        this.isMouseDown = false;
                        document.body.style.cursor = "default";
                    };

                    document.addEventListener("mousemove", onMouseMove);
                    document.addEventListener("mousedown", onMouseDown);
                    document.addEventListener("mouseup", onMouseUp);
                }
            });
        },
        updateLineMeterPosition(e) {
            const lineMeter = document.getElementById("lineMeter");
            if (lineMeter) {
                lineMeter.style.left = `${e.clientX}px`;
                lineMeter.style.top = `${e.clientY}px`;
            }
        },
        resetMinigame() {
            this.removedScrews = {};
            this.insertedScrews = {};
            this.isSwitchProcessing = false;
            this.activeSwitch = null;

            for (let i = 1; i <= 12; i++) {
                const panoId = `pano${i}`;
                const panoBox = document.getElementById(panoId);

                if (panoBox) {
                    const screws = panoBox.querySelectorAll(".screwBox");
                    screws.forEach(screw => {
                        screw.remove();
                    });

                    for (let j = 1; j <= 4; j++) {
                        const newScrew = document.createElement("div");
                        newScrew.classList.add("screwBox", `screw${j}`);
                        newScrew.style.transform = "scale(1)";
                        newScrew.style.opacity = "1";

                        newScrew.addEventListener("click", event => {
                            event.stopPropagation();
                            this.handleScrewClick(panoId, j);
                        });

                        panoBox.appendChild(newScrew);
                    }

                    const switchCover = panoBox.querySelector(".panoo");
                    if (switchCover) {
                        switchCover.classList.remove("show");
                    }

                    panoBox.style.opacity = 100;
                }
            }
        },
        handlePanoClick(panoId) {
            if (panoId === this.randomPanoId) {
                setTimeout(() => {
                    this.foundBrokenPano = true;
                }, 2000);
            }
        },
        handleScrewClick(panoId, screwId) {
            if (!this.foundBrokenPano) {
                if (panoId === this.randomPanoId) {
                    setTimeout(() => {
                        setTimeout(() => {
                            this.foundBrokenPano = true;
                        }, 2000);
                    }, 1000);
                }
            } else {
                if (this.removedScrews[panoId] && this.removedScrews[panoId].includes(screwId)) {
                    return;
                }
                // if (panoId === this.randomPanoId) {
                this.activeSwitch = panoId;
                this.removeScrew(panoId, screwId);
                // }
            }
        },
        handleSwitchCoverClick(panoId) {
            if (this.isSwitchProcessing) return; // Eğer işlem devam ediyorsa geri dön
            this.isSwitchProcessing = true;
            if (!this.foundBrokenPano && panoId === this.randomPanoId) {
            } else {
                if (panoId === this.randomPanoId && this.checkScrews(panoId)) {
                    this.replaceSwitch(panoId);
                } else if (this.checkScrews(panoId)) {
                    this.replaceSwitch(panoId);
                }
            }

            setTimeout(() => {
                this.isSwitchProcessing = false;
            }, 5000);
        },
        removeScrew(panoId, screwId) {
            if (!this.removedScrews[panoId]) {
                this.removedScrews[panoId] = [];
            }
            this.removedScrews[panoId].push(screwId);

            this.$nextTick(() => {
                const screw = document.getElementById(panoId).querySelector(`.screw${screwId}`);
                if (screw) {
                    screw.classList.add("removing");
                    screw.addEventListener("animationend", () => {
                        screw.remove();
                        if (this.checkScrews(panoId)) {
                            this.showSwitchCover(panoId);
                        }
                    });
                }
            });
        },
        checkScrews(panoId) {
            return this.removedScrews[panoId] && this.removedScrews[panoId].length === 4;
        },
        showSwitchCover(panoId) {
            this.$nextTick(() => {
                const switchCover = document.getElementById(panoId).querySelector(".panoo");
                if (switchCover) {
                    switchCover.classList.add("show");
                }
            });
        },
        replaceSwitch(panoId) {
            this.$nextTick(() => {
                const switchCover = document.getElementById(panoId).querySelector(".panoo");
                if (switchCover) {
                    switchCover.classList.remove("show");
                }

                document.getElementById(panoId).style.opacity = 0;
                if (panoId !== this.randomPanoId) {
                    this.removedScrews[panoId] = [];
                    document.getElementById(panoId).style.opacity = 100;
                    this.switchShow = false;
                    this.voltShow = false;
                    this.lineMeterShow = false;
                    let regiontrafficKey = this.selectedkey;
                    if (regiontrafficKey && regiontrafficKey.fixed == false) {
                        regiontrafficKey.error = true;
                        setTimeout(() => {
                            postNUI("closeNUIHouse", { regiontrafficKey });
                        }, 1000);
                    } else {
                        setTimeout(() => {
                            regiontrafficKey.error = true;
                            postNUI("closeNUIFixed", { regiontrafficKey });
                        }, 1000);
                    }
                    // postNUI("closeNUI");
                    const switchCover = document.getElementById(panoId).querySelector(".panoo");
                    if (switchCover) {
                        switchCover.classList.add("show");
                    }
                    this.$nextTick(() => {
                        for (let i = 1; i <= 4; i++) {
                            const newScrew = document.createElement("div");
                            newScrew.classList.add("screwBox", `screw${i}`);
                            newScrew.style.transform = "scale(1.5)";
                            newScrew.style.opacity = "0";

                            setTimeout(() => {
                                newScrew.style.opacity = "1";
                                newScrew.classList.add("appearing");
                                newScrew.addEventListener("click", event => {
                                    event.stopPropagation();
                                    this.insertScrew(newScrew, panoId);

                                    newScrew.classList.add("inserting");
                                    newScrew.addEventListener("animationend", () => {
                                        newScrew.classList.remove("inserting");
                                        newScrew.style.transform = "scale(1)";
                                    });
                                });

                                const panoBox = document.getElementById(panoId);
                                panoBox.appendChild(newScrew);
                            }, (i + 1) * 300);
                        }
                    });
                    return;
                }
                setTimeout(() => {
                    this.removedScrews[panoId] = [];
                    this.activeSwitch = null;
                    document.getElementById(panoId).style.opacity = 100;
                    this.$nextTick(() => {
                        for (let i = 1; i <= 4; i++) {
                            const newScrew = document.createElement("div");
                            newScrew.classList.add("screwBox", `screw${i}`);
                            newScrew.style.transform = "scale(1.5)";
                            newScrew.style.opacity = "0";

                            setTimeout(() => {
                                newScrew.style.opacity = "1";
                                newScrew.classList.add("appearing");
                                newScrew.addEventListener("click", event => {
                                    event.stopPropagation();
                                    this.insertScrew(newScrew, panoId);

                                    newScrew.classList.add("inserting");
                                    newScrew.addEventListener("animationend", () => {
                                        newScrew.classList.remove("inserting");
                                        newScrew.style.transform = "scale(1)";
                                    });
                                });

                                const panoBox = document.getElementById(panoId);
                                panoBox.appendChild(newScrew);
                            }, (i + 1) * 300);
                        }
                    });
                }, 1000);
            });
        },
        insertScrew(screw, panoId) {
            if (!this.insertedScrews[panoId]) {
                this.insertedScrews[panoId] = [];
            }

            const screwId = screw.classList.contains("screw1") ? 1 : screw.classList.contains("screw2") ? 2 : screw.classList.contains("screw3") ? 3 : 4;
            if (this.insertedScrews[panoId].includes(screwId)) return;

            screw.classList.add("inserting");
            screw.addEventListener("animationend", () => {
                screw.classList.remove("inserting");
                screw.style.transform = "scale(1)";

                this.insertedScrews[panoId].push(screwId);
                this.checkAllScrewsInserted(panoId);
            });
        },
        checkAllScrewsInserted(panoId) {
            if (this.insertedScrews[panoId].length === 4) {
                this.activeSwitch = null;
                let regiontrafficKey = this.selectedkey;

                if (regiontrafficKey && regiontrafficKey.fixed == false) {
                    setTimeout(() => {
                        postNUI("switchFixedHouse", { regiontrafficKey });
                    }, 1000);
                } else {
                    setTimeout(() => {
                        postNUI("switchFixed", { regiontrafficKey });
                    }, 1000);
                }
            }
        },
        resetScrews(panoId) {
            const screws = document.getElementById(panoId).querySelectorAll(".screwBox");

            screws.forEach((screw, index) => {
                const newScrew = screw.cloneNode(true);

                newScrew.addEventListener("click", event => {
                    event.stopPropagation();
                    this.handleScrewClick(panoId, index + 1);
                });

                screw.replaceWith(newScrew);
            });

            this.insertedScrews[panoId] = [];
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
var resourceName = "tw-electrician";

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


console.clear();
window.drag = function (value) {
    var value = value;
    let completedLights = [0, 0, 0, 0];

    function initializeGame() {
        gsap.set(".drag-1", { x: 0, y: 0 });
        gsap.set(".drag-2", { x: 0, y: 0 });
        gsap.set(".drag-3", { x: 0, y: 0 });
        gsap.set(".drag-4", { x: 0, y: 0 });

        gsap.set(".line-1", { attr: { x2: 70, y2: 185 } });
        gsap.set(".line-2", { attr: { x2: 60, y2: 375 } });
        gsap.set(".line-3", { attr: { x2: 60, y2: 560 } });
        gsap.set(".line-4", { attr: { x2: 60, y2: 745 } });

        toggleLight(1, false);
        toggleLight(2, false);
        toggleLight(3, false);
        toggleLight(4, false);

        completedLights = [0, 0, 0, 0];
    }

    initializeGame();

    new Draggable(".drag-1", {
        onDrag: function () {
            updateLine(".line-1", this.x + 120, this.y + 200);
        },
        onRelease: function () {
            if (this.x !== 670 || this.y !== 188) {
                reset(".drag-1", ".line-1", 70, 185);
                toggleLight(2, false);
            } else if (this.x === 670 && this.y === 188) toggleLight(2, true);
        },
        liveSnap: { points: [{ x: 670, y: 188 }], radius: 20 }
    });
    new Draggable(".drag-2", {
        onDrag: function () {
            updateLine(".line-2", this.x + 120, this.y + 375);
        },
        onRelease: function () {
            if (this.x !== 670 || this.y !== -188) {
                reset(".drag-2", ".line-2", 60, 375);
                toggleLight(1, false);
            } else if (this.x === 670 && this.y === -188) toggleLight(1, true);
        },
        liveSnap: { points: [{ x: 670, y: -188 }], radius: 20 }
    });
    new Draggable(".drag-3", {
        onDrag: function () {
            updateLine(".line-3", this.x + 120, this.y + 560);
        },
        onRelease: function () {
            if (this.x !== 670 || this.y !== 0) {
                reset(".drag-3", ".line-3", 60, 560);
                toggleLight(3, false);
            } else if (this.x === 670 && this.y === 0) toggleLight(3, true);
        },
        liveSnap: { points: [{ x: 670, y: 0 }], radius: 20 }
    });
    new Draggable(".drag-4", {
        onDrag: function () {
            updateLine(".line-4", this.x + 120, this.y + 745);
        },
        onRelease: function () {
            if (this.x !== 670 || this.y !== 0) {
                reset(".drag-4", ".line-4", 60, 745);
                toggleLight(4, false);
            } else if (this.x === 670 && this.y === 0) toggleLight(4, true);
        },
        liveSnap: { points: [{ x: 670, y: 0 }], radius: 20 }
    });
    function updateLine(selector, x, y) {
        gsap.set(selector, {
            attr: {
                x2: x,
                y2: y
            }
        });
    }

    function toggleLight(selector, visibility) {
        if (visibility) {
            completedLights[selector - 1] = 1;
            if (completedLights[0] === 1 && completedLights[1] === 1 && completedLights[2] === 1 && completedLights[3] === 1) {
                $.post(
                    `https://${resourceName}/fixWirings`,
                    JSON.stringify({
                        coords: value.coords,
                        missionName: value.missionName
                    })
                );

                window.setTimeout(() => {
                    reset(".drag-1", ".line-1", 70, 185);
                    reset(".drag-2", ".line-2", 60, 375);
                    reset(".drag-3", ".line-3", 60, 560);
                    reset(".drag-4", ".line-4", 60, 745);
                    toggleLight(2, false);
                    toggleLight(1, false);
                    toggleLight(3, false);
                    toggleLight(4, false);
                }, 2000);
            }
        } else {
            completedLights[selector - 1] = 0;
        }
    }

    function reset(drag, line, x, y) {
        gsap.to(drag, {
            duration: 0.3,
            ease: "power2.out",
            x: 0,
            y: 0
        });
        gsap.to(line, {
            duration: 0.3,
            ease: "power2.out",
            attr: {
                x2: x,
                y2: y
            }
        });
    }
};

window.fourminigame = function (eventdata) {
    const COLORS = [
        {
            active: "linear-gradient(to right, rgb(128, 0, 0) 0%, red 45%, red 55%, rgb(128, 0, 0))",
            inactive: "linear-gradient(to right, rgb(48, 0, 0) 0%, rgb(128, 0, 0) 45%, rgb(128, 0, 0) 55%, rgb(48, 0, 0))"
        },
        {
            active: "linear-gradient(to right, rgb(88, 88, 0) 0%, yellow 45%, yellow 55%, rgb(88, 88, 0))",
            inactive: "linear-gradient(to right, rgb(48, 48, 0) 0%, rgb(88, 88, 0) 45%, rgb(88, 88, 0) 55%, rgb(48, 48, 0))"
        },
        {
            active: "linear-gradient(to right, rgb(0, 88, 0) 0%, green 45%, green 55%, rgb(0, 88, 0))",
            inactive: "linear-gradient(to right, rgb(0, 48, 0) 0%, rgb(0, 88, 0) 45%, rgb(0, 88, 0) 55%, rgb(0, 48, 0))"
        },
        {
            active: "linear-gradient(to right, rgb(35, 65, 90) 0%, rgb(70, 130, 180) 45%, rgb(70, 130, 180) 55%, rgb(35, 65, 90))",
            inactive: "linear-gradient(to right, rgb(18, 32, 45) 0%, rgb(35, 65, 90) 45%, rgb(35, 65, 90) 55%, rgb(18, 32, 45))"
        },
        {
            active: "linear-gradient(to right, #A36A00 0%, #FFA500 45%, #FFA500 55%, #A36A00)",
            inactive: "linear-gradient(to right, #754C00 0%, #A36A00 45%, #A36A00 55%, #754C00)"
        }
    ];

    var doorStatus = false;
    var mouse = { x: 0, y: 0 };
    var wires = [];
    var currentWeld;
    var currentTimer;
    var currentTimerLoop;
    var currentGame;
    var audioInstances = {};

    function SetDoor(bool, cb) {
        doorStatus = bool;
        if (bool) {
            $("#am-overlay").addClass("active");
            setTimeout(function () {
                $("#am-overlay").css("background-image", "none");
            }, 900);
        } else {
            $("#am-overlay").removeClass("active");
            setTimeout(function () {
                $("#am-overlay").css("background-image", `url("./img/hazard.png")`);
            }, 750);
        }
        if (!cb) return;
        setTimeout(function () {
            cb();
        }, 3000);
    }

    function RepeatString(str, count) {
        var finalStr = "";
        for (var i = 0; i < count; i++) {
            finalStr += str;
        }
        return finalStr;
    }

    function randomInt(max) {
        return Math.floor(Math.random() * (max + 1));
    }

    function IsIntInRange(number /**/) {
        var args = arguments;
        for (var i = 0; i < args.length; i++) {
            if (args[i] == number) {
                return true;
            }
        }
        return false;
    }

    function SetWeldPosition(x, y) {
        let div = document.getElementById("ams-welding");
        div.style.left = x + "px";
        div.style.top = y + "px";
    }

    function StopAudio(key) {
        if (audioInstances[key]) {
            audioInstances[key].pause();
            audioInstances[key].src = ""; // Kaynağı temizle
            audioInstances[key].remove(); // Nesneyi bellekten kaldır
            delete audioInstances[key]; // Nesneyi tamamen sil
        }
    }

    function PlayAudio(key, loop) {
        if (audioInstances[key]) {
            audioInstances[key].pause();
            audioInstances[key].currentTime = 0;
            audioInstances[key].play().catch(error => {
                console.error("Error playing existing audio instance:", error);
            });
        } else {
            var audio = new Audio("./audio/" + key + ".mp3");
            audio.loop = loop;
            audio.volume = 1.0;

            audio.oncanplaythrough = function () {
                audio.play().catch(error => {
                    console.error("Error playing new audio instance:", error);
                });
            };

            audio.onerror = function (event) {
                switch (event.target.error.code) {
                    case event.target.error.MEDIA_ERR_ABORTED:
                        console.error("Media error: Aborted");
                        break;
                    case event.target.error.MEDIA_ERR_NETWORK:
                        console.error("Media error: Network issue");
                        break;
                    case event.target.error.MEDIA_ERR_DECODE:
                        console.error("Media error: Decode error");
                        break;
                    case event.target.error.MEDIA_ERR_SRC_NOT_SUPPORTED:
                        console.error("Media error: Source not supported or file not found");
                        break;
                    default:
                        console.error("Media error: Unknown error");
                        break;
                }
            };

            audioInstances[key] = audio;
        }
    }
    function StartWelding(wireIndex, direction) {
        if (currentWeld || wires[wireIndex - 1].wired) return;
        currentWeld = {
            index: wireIndex,
            direction: direction,
            color: wires[wireIndex - 1].color - 1
        };
        var element = $("#ams-nodes > div:nth-child(" + wireIndex + ")");
        var weldElement = $("#ams-nodes > div:nth-child(" + wireIndex + ") > div:nth-child(2)");
        // PlayAudio("weld", true);

        $("body").css("cursor", "none");
        $("#ams-welding").css("display", "block");
        SetWeldPosition(mouse.x - 50, mouse.y - 50);

        $.post(
            `https://${resourceName}/welding`,
            JSON.stringify({
                toggle: true
            })
        );
    }

    function StopWelding(index) {
        if (!currentWeld) return;
        var weld = currentWeld;
        currentWeld = null;
        var element = $("#ams-nodes > div:nth-child(" + weld.index + ")");
        var weldElement = $("#ams-nodes > div:nth-child(" + weld.index + ") > div:nth-child(2)");
        StopAudio("weld");
        $("body").css("cursor", "unset");
        $("#ams-welding").css("display", "none");

        $.post(
            `https://${resourceName}/welding`,
            JSON.stringify({
                toggle: false
            })
        );

        if (weld.direction == index) {
            $(weldElement).css("background", COLORS[weld.color].active);
            wires[weld.index - 1].wired = true;
            PlayAudio("connected");
            CheckGame();
        } else {
            $(weldElement).css("background", COLORS[weld.color].inactive);
            wires[weld.index - 1].wired = false;
            PlayAudio("error");
            currentGame.attemptsLeft -= 1;
            CheckFailGame();
        }
    }

    function WireEvents() {
        $("#ams-nodes > div > div:nth-child(1)").mousedown(function () {
            StartWelding($(this).parent().index() + 1, 0);
        });
        $("#ams-nodes > div > div:nth-child(3)").mousedown(function () {
            StartWelding($(this).parent().index() + 1, 1);
        });
        $("#ams-nodes > div > div:nth-child(1)").mouseup(function () {
            StopWelding(1);
        });
        $("#ams-nodes > div > div:nth-child(3)").mouseup(function () {
            StopWelding(0);
        });
    }

    function CreateWires(wireCount, wireWidth) {
        var _wires = [];
        var html = "";
        var colorIndex = 0;
        var size = wireWidth;
        for (var i = 0; i < wireCount; i++) {
            var wireHtml = `
            <div>
                <div style="width: {SIZE}; background: {COLOR_1};"></div>
                <div style="width: {SIZE}; background: {COLOR_2};"></div>
                <div style="width: {SIZE}; background: {COLOR_1};"></div>
            </div>
            `;
            if (colorIndex >= COLORS.length) {
                colorIndex = 0;
            }
            var color = COLORS[colorIndex];
            wireHtml = wireHtml.replaceAll("{COLOR_1}", color.active);
            wireHtml = wireHtml.replaceAll("{COLOR_2}", color.inactive);
            wireHtml = wireHtml.replaceAll("{SIZE}", size + "vw");
            html += wireHtml;
            colorIndex += 1;
            _wires[i] = {
                size: size,
                color: colorIndex,
                wired: false
            };
        }
        wires = _wires;

        $("#ams-nodes").html(html);
        WireEvents();
    }

    function CheckGame() {
        var missingWire;
        for (var i = 0; i < wires.length; i++) {
            if (!wires[i].wired) {
                missingWire = i;
                break;
            }
        }
        if (missingWire != null) return;
        EndGame(true);
    }

    function CheckFailGame() {
        if (currentGame.attemptsLeft > 0) return;
        EndGame(false);
    }

    function EndGame(success, cancelCallback) {
        if (!currentGame) return;
        if (currentTimerLoop) {
            clearInterval(currentTimerLoop);
        }
        var cb = currentGame.cb;
        currentTimerLoop = null;
        currentTimer = null;
        currentGame = null;
        $("#app-minigame").fadeOut(0, () => {
            SetDoor(false, function () {
                $("#ams-nodes").html("");
            });
        });
        if (!cb || cancelCallback) return;
        cb(success);
    }

    function DisplayInt(float) {
        var floor = Math.floor(float);
        if (floor < 10) {
            floor = "0" + floor;
        }
        return floor;
    }

    function GetTimerDisplay() {
        var minutes = Math.floor(currentTimer / 60);
        var seconds = currentTimer - minutes * 60;
        if (minutes < 0) {
            return `<span style="color: red">00:00</span>`;
        }
        return DisplayInt(minutes) + ":" + DisplayInt(seconds);
    }

    function StartTimer(seconds) {
        if (currentTimer) return;
        currentGame.started = true;
        currentTimer = seconds;
        $("#am-timer").html(GetTimerDisplay());
        currentTimerLoop = setInterval(() => {
            PlayAudio("tick");
            var display = GetTimerDisplay();
            currentTimer -= 1;
            if (currentTimer <= 0) {
                currentTimer = 0;
                $("#am-timer").html(`<span style="color: red">${display}</span>`);
                EndGame(false);
            } else if (currentTimer < 10) {
                $("#am-timer").html(`<span style="color: red">${display}</span>`);
            } else {
                $("#am-timer").html(display);
            }
        }, 1000);
    }

    function StartGame(settings, cb) {
        if (currentGame) return;
        currentGame = settings;
        currentGame.attemptsLeft = settings.maxWeldFails ? settings.maxWeldFails : 3;
        settings.wireCount = settings.wireCount ? settings.wireCount : 4;
        settings.wireWidth = settings.wireWidth ? settings.wireWidth : 0.74;
        currentGame.started = false;
        currentGame.cb = cb;
        $("#am-timer").html("");
        $("#app-minigame").fadeIn(1000);
        CreateWires(settings.wireCount, settings.wireWidth);
    }

    function OnGameCompleted(success) {
        $.post(
            `https://${resourceName}/gameCompleted`,
            JSON.stringify({
                success: success
            })
        );
    }

    $(document).ready(() => {
        $("#am-overlay").on("click", function (ev) {
            if (!currentGame || currentGame.started) return;
            StartTimer(currentGame.time);
            CreateWires(currentGame.wireCount, currentGame.wireWidth);
            SetDoor(!doorStatus);
        });
    });

    document.addEventListener("mousemove", function (e) {
        mouse.x = e.clientX;
        mouse.y = e.clientY;

        if (!currentWeld) return;

        var x = mouse.x;
        var y = mouse.y;

        var index = currentWeld.index;

        var weldElement = $("#ams-nodes > div:nth-child(" + index + ") > div:nth-child(2)");
        var startElement = $("#ams-nodes > div:nth-child(" + index + ") > div:nth-child(1)");
        var endElement = $("#ams-nodes > div:nth-child(" + index + ") > div:nth-child(3)");

        if (!weldElement.length || !startElement.length || !endElement.length) {
            console.error("ERROR: Missing elements for welding.");
            if (!weldElement.length) console.error("Weld Element eksik!");
            if (!startElement.length) console.error("Start Element eksik!");
            if (!endElement.length) console.error("End Element eksik!");
            return;
        }

        var elemRect = $(weldElement)[0].getBoundingClientRect();
        var startRect = $(startElement)[0].getBoundingClientRect();
        var endRect = $(endElement)[0].getBoundingClientRect();

        var min = { x: elemRect.x, y: startRect.y };
        var max = { x: elemRect.x + elemRect.width, y: endRect.y + endRect.height };

        if (x + 1 < min.x || x - 1 > max.x || y + 1 < min.y || y - 1 > max.y) {
            StopWelding();
        }

        SetWeldPosition(x - 50, y - 50);
    });

    document.addEventListener("mouseup", function (ev) {
        if (!currentWeld) return;
        setTimeout(() => {
            if (!currentWeld) return;
            StopWelding();
        }, 100);
    });
    document.addEventListener("keydown", function (ev) {
        if (ev.key === "Escape") {
            EndGame(false, true);
        }
    });

    StartGame(eventdata, OnGameCompleted);
};