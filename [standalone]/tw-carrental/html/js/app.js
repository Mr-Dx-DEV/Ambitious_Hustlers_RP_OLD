let audioPlayer = null;
const store = Vuex.createStore({
    components: {},

    state: {
        notifications: []
    },
    getters: {},
    mutations: {},
    actions: {},
    searchInput: ""
});

const app = Vue.createApp({
    components: {},
    data: () => ({
        mainShow : false,
        testDriveShow : false,
        thema : "green", // white, red, blue, green
        moneyType : "$",
        vehicleRentTime : 5,
        vehicleListInput : '',
        totalRentPrice : 1250,
        remainingTimeCommandTime : 20,
        testDriveRemainingTime : 0,
        remainingTimeCommand : false,
        selectedText : "Day",
        selectedDay : true,
        testDriveAccess : false,
        selectedMinutes : false,
        ServerName : "TW Rental",
        profileData : {
            playerName  : "Brenden Randall",
            playerMoney : 56000,
            playerImage : "https://cdn.discordapp.com/attachments/1096751382435987477/1225404151580594176/LogoNEW.png?ex=6621018c&is=660e8c8c&hm=05357cf6aaadc96b54eca9aee939dd95cf4a13a78b1ddc4fdbf7b904812afeb5&",
        },
        vehicleData : [
            {
                vehicleName : "sultan",
                vehicleLabel : "Mitsubishi Evo Lancer",
                vehiclePrice : 100,
                vehicleImage : "vehicle.png",
                vehicleCategory : "Vehicle",
            },
            {
                vehicleName : "sultan2",
                vehicleLabel : "Mitsubishi Evo Lancer2",
                vehiclePrice : 100,
                vehicleImage : "vehicle.png",
                vehicleCategory : "Vehicle",
            },
            {
                vehicleName : "baller",
                vehicleLabel : "Mitsubishi Evo Lancacer",
                vehiclePrice : 100,
                vehicleImage : "vehicle.png",
                vehicleCategory : "Vehicle",
            },
            {
                vehicleName : "baller2",
                vehicleLabel : "Mitsubishi Evo Lancer4",
                vehiclePrice : 100,
                vehicleImage : "vehicle.png",
                vehicleCategory : "Vehicle",
            },
        ],
        selectedVehicleInformation : {
            topSpeed : 200,
            transmission : "Automatic",
            braking : 100,
            acceleration : 100,
        },
        selectVehicleData : [],
    }),

    watch: {},

    beforeDestroy() {},
    mounted() {
        this.vehicleData.forEach(vehicle => {
            vehicle.selectedVehicle = false;
        });
        if (this.vehicleData.length > 0) {
            this.vehicleData[0].selectedVehicle = true; 
            this.selectVehicleData = this.vehicleData[0];
        }

        setInterval(() => {
            if (this.testDriveShow == true && this.remainingTimeCommand == false) {
                if (this.testDriveRemainingTime > 0) {
                    this.testDriveRemainingTime--;
                } else {
                    this.stopTestDrive();
                }
            }
        }, 1000);

        setInterval(() => {
            if (this.remainingTimeCommand == true) {
            if (this.remainingTimeCommandTime > 0) {
                this.remainingTimeCommandTime--;
            } else {
                this.remainingTimeCommand = false;
                this.testDriveShow = false;
                this.remainingTimeCommandTime = 10;
            }
            }
        }, 1000);
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
    },

    methods: {
        formatNumber(number) {
            if (number == null) return 0;
            return number.toLocaleString('tr-TR');
        },
        changeTimeSwitch(type) {
            if (type == "day") {
                this.selectedDay = true;
                this.selectedMinutes = false;
                this.selectedText = "Day";
            } else {
                this.selectedDay = false;
                this.selectedMinutes = true;
                this.selectedText = "Min";
            }
        },
        filterByVehicleList() {
            if (this.vehicleData.length > 0) {
                return this.vehicleData.filter(vehicle => vehicle.vehicleLabel.toLowerCase().includes(this.vehicleListInput.toLowerCase()));
            }  else {
                return this.vehicleData;
            } 
        },
        selectVehicle(data, vehicleName) {
            this.selectVehicleData = data;
            this.vehicleData.forEach(vehicle => {
                vehicle.selectedVehicle = false;
            });
            this.vehicleData.find(vehicle => vehicle.vehicleName == vehicleName).selectedVehicle = true;
        },
        keyHandler(event) {
            if (event.keyCode == 27) {
                if (this.mainShow == true) {
                    this.closeNUI();
                }
            }
        },
        closeNUI() {
            this.mainShow = false;
            postNUI("closeNUI");
        },
        SetRentTime(where) {
            if (where == "forward") {
                this.vehicleRentTime += 1;
            } else {
                if (this.vehicleRentTime > 1) {
                    this.vehicleRentTime -= 1;
                }
            }
        },
        startTestDrive() {
            if (this.selectVehicleData.length == 0) {
                return;
            }

            if (this.testDriveRemainingTime == 0) {
                postNUI("startTestDrive", {vehicleData : this.selectVehicleData});
                // this.testDriveRemainingTime = this.testDriveDefaultTime;
                // this.testDriveShow = true;
            }

            this.mainShow = false;
        },
        stopTestDrive() {
            this.testDriveShow = false;
            this.mainShow = true;
            this.testDriveRemainingTime = 0;
            postNUI("stopTestDrive");

        },
        rentVehicle() {
            if (this.selectVehicleData.length == 0) {
                return;
            }

            this.mainShow = false;
            if (this.selectedText == "Day") {
                this.totalRentPrice = this.selectVehicleData.vehiclePrice * this.vehicleRentTime * 24;
            } else {
                this.totalRentPrice = this.selectVehicleData.vehiclePrice * this.vehicleRentTime / 60;
            }

            postNUI("rentVehicle", {vehicleData : this.selectVehicleData, rentTime : this.vehicleRentTime, totalRentPrice : this.totalRentPrice, rentType : this.selectedText});
            this.totalRentPrice = 0;
            this.changeTimeSwitch("day");
            this.vehicleRentTime = 5;
            this.vehicleListInput = '';
            if (this.vehicleData.length > 0) {
                this.vehicleData[0].selectedVehicle = true; 
                this.selectVehicleData = this.vehicleData[0];
            }
            
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "CHECK_NUI":
                    postNUI("LoadedNUI");
                break;
                case "LOAD_PLAYER_DATA":
                    this.profileData = event.data.payload;
                break;
                case "OPEN_NUI":
                    this.mainShow = true;
                    this.vehicleData = event.data.payload;
                    if (this.vehicleData.length > 0) {
                        this.vehicleData[0].selectedVehicle = true; 
                        this.selectVehicleData = this.vehicleData[0];
                    }
                    
                break;
                case "LOAD_CONFIG":
                    this.ServerName = event.data.payload.ServerName;
                    this.thema = event.data.payload.Thema;
                    this.moneyType = event.data.payload.MoneyType;
                    this.testDriveDefaultTime = event.data.payload.TestDriveDefaultTime;
                break;
                case "START_TESTDRIVE":
                    this.testDriveRemainingTime = event.data.payload.time;
                    this.testDriveShow = true; 
                    this.selectedVehicleInformation.topSpeed = Math.round(event.data.payload.topspeed * 1.60934);
                    this.selectedVehicleInformation.transmission = Math.round(event.data.payload.stats.transmission.value);
                    this.selectedVehicleInformation.acceleration = Math.round(event.data.payload.stats.acceleration.value);
                    this.selectedVehicleInformation.braking = Math.round(event.data.payload.stats.braking.value);
                break;
                case "USE_REMAINING_TIME_COMMAND":
                    this.testDriveRemainingTime = event.data.payload.time;
                    this.testDriveShow = true; 
                    this.remainingTimeCommand = true;
                    this.selectedVehicleInformation.topSpeed = Math.round(event.data.payload.topspeed * 1.60934);
                    this.selectedVehicleInformation.transmission = Math.round(event.data.payload.stats.transmission.value);
                    this.selectedVehicleInformation.acceleration = Math.round(event.data.payload.stats.acceleration.value);
                    this.selectedVehicleInformation.braking = Math.round(event.data.payload.stats.braking.value);
                    this.selectVehicleData.vehicleLabel = event.data.payload.vehicleLabel;
                break;
                case "STOP_REMAINING_TIME_COMMAND":
                    this.remainingTimeCommand = false;
                    this.testDriveShow = false;
                    this.testDriveRemainingTime = 0;
                    this.selectedVehicleInformation = [];
                break;
                case "STOP_TESTDRIVE":
                    this.testDriveShow = false;
                    this.testDriveRemainingTime = 0;
                    this.selectedVehicleInformation = [];
                break;
                case "TestDriveAccess":
                    this.testDriveAccess = event.data.payload;
                break;
                default:
                break;
            }
        }
    },
    computed: {},
    
});

app.use(store).mount("#app");
var resourceName = "tworst-carrental";

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
        return !response.ok ? null : response.json();
    } catch (error) {
        // console.log(error)
    }
};

function clicksound(val) {
    let audioPath = `./sound/${val}`;
    audioPlayer = new Howl({
        src: [audioPath]
    });
    audioPlayer.volume(0.4);
    audioPlayer.play();
}
