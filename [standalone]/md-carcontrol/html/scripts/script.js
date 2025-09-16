
// ---------------------------------------------------------------------------------- \\
// -- Midnight Car-Control             |
// ------------------------------------|
// 
//    Simple car-control script focused on ease of use made for the QB-Core framework.
//    ESX support is available in our Discord community: https://discord.gg/F33n6Vmua4
//
// ------------------------------------|
// -- Authors: Hydra, Danify, Dash     |
// ---------------------------------------------------------------------------------- \\

const icons = {
    windowUp: 'icons/lwindow-up.png',
    windowDown: 'icons/lwindow-down.png',
    windowBroken: 'icons/lwindow-broken.png',
    leftDoor: 'icons/ldoor.png',
    leftDoorBroken: 'icons/ldoor-broken.png',
    seat: 'icons/passenger-seat.png',
    turrent: 'icons/turret.svg',
    driver: 'icons/driver-seat.png',
    hood: 'icons/hood.png',
    hoodBroken: 'icons/hood-broken.png',
    trunk: 'icons/trunk.png',
    trunkBroken: 'icons/trunk-broken.png',
}

document.addEventListener('keydown', function(event) {
    if (event.key === "Escape") {
        makeCall('closeVehicleMenu')
    }
});

const powerButton = document.querySelector(".panel__button--power");
const leftButton = document.querySelector(".panel__button--indicate-left");
const hazardButton = document.querySelector(".panel__button--indicate-hazard");
const rightButton = document.querySelector(".panel__button--indicate-right");
const lockButton = document.querySelector(".panel__button--lock")

const fuelSlider = document.querySelector(".vehicle-stats__stat--fuel .gauge__fill");
const bodySlider = document.querySelector(".vehicle-stats__stat--body .gauge__fill");
const engineSlider = document.querySelector(".vehicle-stats__stat--engine .gauge__fill");

const windows = document.querySelector(".panel--windows .panel__buttons");
const seats = document.querySelector(".panel--seats .panel__buttons");
const bikeSeats = document.querySelector(".panel--bike-seats .panel__buttons");
const doors = document.querySelector(".panel--doors .panel__buttons");

let toggleAllDoorsContainer = document.querySelector('.panel--doors .panel__open-close-all')
let toggleAllWindowsContainer = document.querySelector('.panel--windows .panel__open-close-all')

const lightingSection = document.querySelector(".panel--lighting")

const interiorLightSection = document.querySelector('.panel_section--interior')
const interiorLightButton = document.querySelector(".panel__button--dome");

const headlightSection = document.querySelector('panel_section--headlights')
const headlightButton = document.querySelector(".panel__button--headlights");
const headlightColourButton = document.querySelector(".panel__button--headlights-colour");

const neonSection = document.querySelector('panel_section--neons')
const neonFrontButton = document.querySelector(".panel__button--neon-front");
const neonBackButton = document.querySelector(".panel__button--neon-back");
const neonRightButton = document.querySelector(".panel__button--neon-right");
const neonLeftButton = document.querySelector(".panel__button--neon-left");
const neonColourButton = document.querySelector(".panel__button--neon-colour")
const neonColourInput = document.querySelector(".panel__button--neon-colour")

const ui = document.querySelector(".ui__main");

let IsCustomPosition = false;


const neonPickr = Pickr.create({
    el: '.panel__button--neon-colour',
    container: '.ui__main',
    appClass: 'neon',
    useAsButton: true,

    theme: 'nano',
    lockOpacity: true,
    default: "#FFFFFF",
    swatches: null,

    components: {
        hex: false,
        rgba: false,
        opacity: true,
        hue: true,

        interaction: {
            input: true,
            save: false,
            clear: false,
            cancel: false,
        }
    }
});

const headlightPickr = Pickr.create({
    el: '.panel__button--headlights-colour',
    container: '.ui__main',
    appClass: 'headlight',
    useAsButton: true,

    theme: 'nano',
    lockOpacity: true,
    default: "#FFFFFF",
    swatches: null,

    components: {
        hex: false,
        rgba: false,
        opacity: true,
        hue: true,

        interaction: {
            input: true,
            save: false,
            clear: false,
            cancel: false,
        }
    }
});



const carControl = document.querySelector('.ui__main');

var vehData = null

let windowsHeight;
let seatsHeight;
let doorsHeight;

let neonsHidden = false;
let headlightsHidden = false;


function makeButton(icon, toggle = true, flipped = false, unavailable = false) {
    let button = document.createElement('button');

    if (toggle) button.classList.add('panel__button--toggle');
    if (flipped) button.classList.add('panel__button--flipped')
    if (unavailable) button.classList.add('panel__button--broken')

    let img = document.createElement('img');
    img.src = icon

    button.appendChild(img);
    return button;
}

function windowHandler(button, idx, data, handler = true) {
    button.classList.remove('panel__button--broken')
    button.classList.remove('panel__button--disabled')

    button.classList.toggle('panel__button--active', data.windows[idx] == 0)
    button.firstElementChild.src = (data.windows[idx] == 0 ? 'icons/lwindow-down.png' : 'icons/lwindow-up.png')

    if (data.noPassengerWindowControl && data.playerSeatIndex != -1) {
        button.classList.toggle('panel__button--disabled', true)
    } else {
        if (data.doorStates[idx] != 0) {
            button.classList.toggle('panel__button--broken', true)
            button.classList.remove('panel__button--active')
            button.firstElementChild.src = ('icons/lwindow-broken.png')
        }

        if (data.playerSeatIndex != -1 && data.playerSeatIndex != 0) {
            if (idx - 1 != data.playerSeatIndex) {
                button.classList.toggle('panel__button--disabled', true)
            }
        }
    }

    if (!handler) return;

    button.addEventListener('click', async (e) => {
        if (vehData.windows[idx] > 0) vehData.windows[idx] = 0;
        else vehData.windows[idx] = 1;

        let response = await makeCall('toggleWindow', {
            index: idx,
            to: vehData.windows[idx] > 0
        });

        if (response.success) {
            button.classList.toggle('panel__button--active', vehData.windows[idx] == 0);
            button.firstElementChild.src = (vehData.windows[idx] == 0 ? 'icons/lwindow-down.png' : 'icons/lwindow-up.png')
        }



    });
}

function seatHandler(button, idx, data, handler = true) {
    if (idx == data.playerSeatIndex) {
        button.classList.remove('panel__button--broken')
        button.classList.add('panel__button--active')
    } else {
        button.classList.remove('panel__button--active')
        if (data.occupied_seats.includes(idx)) {
            button.classList.add('panel__button--disabled')
        } else {
            button.classList.remove('panel__button--disabled')
        }
    }


    if (!handler) return;

    button.addEventListener('click', async (e) => {
        button.classList.add('panel__button--active')

        let result = await makeCall('switchSeat', {
            to: idx
        });

        if (result.success) {
            vehData.occupied_seats.splice(idx - 1, 1)
            vehData.playerSeatIndex = idx 
            updateData(vehData)
        }
     });
}

function doorHandler(button, idx, data, handler = true) {
    button.setAttribute("data-idx", idx)
    let door = data.doors[idx];
    if (idx === 4) {
        door = data.hood
        button.classList.add('panel__button--hood')
    };
    if (idx === 5) {
        door = data.trunk
        button.classList.add('panel__button--trunk')
    };
    button.classList.toggle('panel__button--active', door != 0)

    button.classList.remove('panel__button--broken')
    button.classList.remove('panel__button--disabled')

    if (data.noPassengerDoorControl && data.playerSeatIndex != -1) {
        button.classList.toggle('panel__button--disabled', true)
    } else {
        if (data.doorStates[idx] == 1) {
            button.classList.toggle('panel__button--broken', true)
            button.classList.remove('panel__button--active')
            if (idx == 4) {
                button.firstElementChild.src = icons.hoodBroken
            } else if (idx == 5) {
                button.firstElementChild.src = icons.trunkBroken
            } else {
                button.firstElementChild.src = icons.leftDoorBroken
            }

        } else {
            if (!(data.playerSeatIndex == -1)) {
                if (data.amount_doors == 2) {
                    if (data.playerSeatIndex == 0 && idx == 0) {
                        button.classList.toggle('panel__button--broken', true)
                        button.firstElementChild.src = icons.leftDoorBroken
                    }

                } else if (idx != (data.playerSeatIndex + 1)) {
                    button.classList.toggle('panel__button--disabled', true)
                }
            }
        }
    }


    if (!handler) return;

    button.addEventListener('click', async  (e) => {
        let door = vehData.doors[idx];
        if (idx > 3) {
             if (idx === 4) {
                // hood
                vehData.hood = vehData.hood > 0 ? 0 : 1;
                door = vehData.hood;
            } else {
                // trunk
                vehData.trunk = vehData.trunk > 0 ? 0 : 1;
                door = vehData.trunk;
            }
        } else {
            vehData.doors[idx] = door > 0 ? 0 : 1
            door = vehData.doors[idx];
        }

        let result = await makeCall('openDoor', {
            idx: idx,
            open: !!door
        });

        if (result.success) {
            button.classList.toggle("panel__button--active", door == 1)
        }


    });
}



function updateData(newData) {
    if (newData == null) return;

    let playerInDriverSeat = newData.playerSeatIndex == -1
    let playerInFrontPassenger = newData.playerSeatIndex == 0

    // Auxillary Permissions
    powerButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    hazardButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    leftButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    rightButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    lockButton.classList.toggle('panel__button--disabled', !(playerInDriverSeat || playerInFrontPassenger))

    // Neon Permissions 
    neonBackButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    neonFrontButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    neonLeftButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    neonRightButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    neonColourButton.classList.toggle('panel__button--disabled', !playerInDriverSeat)

    // Locked
    lockButton.classList.toggle('panel__button--active', !newData.isLocked)
    lockButton.lastElementChild.innerHTML = newData.isLocked ? "LOCKED" : "UNLOCKED"
    // Engine
    if (newData.engine_running) powerButton.classList.toggle('panel__button--active', true)
    else powerButton.classList.remove('panel__button--active');

    // Sliders
    fuelSlider.style.width = newData.fuel + '%';
    engineSlider.style.width = newData.engine_health / 10 + '%';
    bodySlider.style.width = newData.body_health / 10 + '%';

    // Windows
    if (!vehData || !vehData.windows || Object.keys(newData.windows).length !== Object.keys(vehData.windows).length) {
        windows.innerHTML = ''

        for (let i = 0; i < Object.keys(newData.windows).length; i++) {
            let button = makeButton(icons.windowUp, true, i % 2 == 1);
            windows.appendChild(button);
            windowHandler(button, i, newData);
        }

        toggleAllWindowsContainer = document.createElement("div")
        toggleAllWindowsContainer.id = 'all-windows'
        toggleAllWindowsContainer.classList.add("panel__open-close-all")
        toggleAllWindowsContainer.innerHTML = `
						<button class="panel__close-all label">
								<p>CLOSE ALL</p>
							</button>
							<button class="panel__open-all label">
								<p>OPEN ALL</p>
							</button>
        `;


        toggleAllWindowsContainer.firstElementChild.addEventListener('click', () =>  toggleAllWindows(false))
        toggleAllWindowsContainer.lastElementChild.addEventListener('click', () => toggleAllWindows(true))

        windows.appendChild(toggleAllWindowsContainer);
    } else {
        for (let i = 0; i < windows.children.length - 1; i++) {
            windowHandler(windows.children[i], i, newData, false)
        }
    }


    // Seats
    if (!vehData || !vehData.doors || newData.max_passengers !== vehData.max_passengers) {
        seats.innerHTML = '';
        bikeSeats.innerHTML = '';
        for (let i = 0; i < newData.max_passengers; i++) {
            let button = makeButton(i === 0 ? icons.driver : newData.turretSeats[i] == 1 ? icons.turret : icons.seat, true);
            if (newData.isBikeMenu) {
                bikeSeats.appendChild(button);
            } else {
                seats.appendChild(button)
            }

            seatHandler(button, i - 1, newData);
        }
    } else {
        if (newData.isBikeMenu) {
            for (let i = -1; i < bikeSeats.children.length - 1; i++) {
                seatHandler(bikeSeats.children[i + 1], i, vehData, false)
            }
        } else {
            for (let i = -1; i < seats.children.length - 1; i++) {
                seatHandler(seats.children[i + 1], i, vehData, false)
            }
        }

    }

    // Doors
    if (!vehData || !vehData.doors || Object.keys(newData.doors).length !== Object.keys(vehData.doors).length || newData.has_trunk != vehData.has_trunk || newData.has_hood != vehData.has_hood) {
        doors.innerHTML = ''
        const hood = makeButton(icons.hood);
        const trunk = makeButton(icons.trunk);
        let amoutNonHoodTrunkDoors = newData.amount_doors

        if (newData.has_hood) {
            doors.append(hood)
            doorHandler(hood, 4, newData);
            if (newData.hood > 0) {
                hood.classList.toggle('panel__button--active');
            }
            amoutNonHoodTrunkDoors--;
        }


        if (newData.has_trunk) {
            amoutNonHoodTrunkDoors--;
        }

        for (let i = 0; i < amoutNonHoodTrunkDoors; i++) {
            let button = makeButton(icons.leftDoor, true, i % 2 === 1);
            doors.appendChild(button);
            if (newData.doors[i] > 0) {
                button.classList.toggle('panel__button--active');
            }
            doorHandler(button, i, newData);
        }

        if (newData.has_trunk) {
            doors.append(trunk)
            doorHandler(trunk, 5, newData);
            if (newData.trunk > 0) {
                trunk.classList.toggle('panel__button--active');
            }
        }

        toggleAllDoorsContainer = document.createElement("div")
        toggleAllDoorsContainer.classList.add("panel__open-close-all")
        toggleAllDoorsContainer.innerHTML = `
						<button class="panel__close-all label">
								<p>CLOSE ALL</p>
							</button>
							<button class="panel__open-all label">
								<p>OPEN ALL</p>
							</button>
        `;




        doors.appendChild(toggleAllDoorsContainer);

        toggleAllDoorsContainer.firstElementChild.addEventListener('click', () => toggleAllDoors(false))
        toggleAllDoorsContainer.lastElementChild.addEventListener('click', () => toggleAllDoors(true))

    } else {
        const buttons = Array.from(doors.querySelectorAll('button:not(.panel__close-all):not(.panel__open-all)'));
        let amoutNonHoodTrunkDoors = newData.amount_doors
        let i = 0;

        if (newData.has_hood) {
            i = 1;
            doorHandler(buttons[0], 4, newData, false);
        }

        if (newData.has_trunk) {
            amoutNonHoodTrunkDoors--;
        }

        for (i; i < amoutNonHoodTrunkDoors; i++) {
            doorHandler(buttons[i], newData.has_hood ? i - 1 : i, newData, false)
        }

        if (newData.has_trunk) {
            doorHandler(buttons[buttons.length - 1], 5, newData, false);
        }
    }

    // Blinker buttons
    leftButton.classList.remove('panel__button--active');
    hazardButton.classList.remove('panel__button--active');
    rightButton.classList.remove('panel__button--active');

    if (newData.engine_running) {
        if (newData.blinker_state === 1) leftButton.classList.toggle('panel__button--active', true);
        else if (newData.blinker_state === 2) rightButton.classList.toggle('panel__button--active', true);
        else if (newData.blinker_state === 3) hazardButton.classList.toggle('panel__button--active', true);
    }

    // Interior Light
    if (newData.interiorLightOn) {
        interiorLightButton.classList.toggle('panel__button--active', true)
    }
    // Headlight Permissions

    // Headlights
    if (newData.headlightsDamaged) {
        headlightColourButton.classList.toggle("panel__button--broken", true)
        headlightButton.classList.toggle("panel__button--broken", true)
        headlightButton.classList.remove('panel__button--active');
    } else if (!playerInDriverSeat) {
        headlightButton.classList.toggle('panel__button--disabled', true)
        headlightColourButton.classList.toggle('panel__button--disabled', true)
    } else {
        headlightButton.classList.toggle('panel__button--disabled', false)
        headlightColourButton.classList.toggle('panel__button--disabled', false) 
        headlightButton.classList.toggle('panel__button--broken', false)
        headlightColourButton.classList.toggle('panel__button--broken', false) 
        if (newData.lightsOn == 1) {
            headlightButton.classList.toggle('panel__button--active', true);
        } else if (newData.lightsOn == 0) {
            headlightButton.classList.remove('panel__button--active');
        }
    }

    neonColourButton.style.setProperty("--after-bg", rgbToHex(newData.headlightRed, newData.headlightGreen, newData.headlightBlue));
    neonPickr.setColor(rgbToHex(newData.neonRed, newData.neonGreen, newData.neonBlue))

    if (newData.hasCustomHeadlights) {
        headlightColourButton.style.setProperty("--after-bg", rgbToHex(newData.neonRed, newData.neonGreen, newData.neonBlue));
        headlightPickr.setColor(rgbToHex(newData.headlightRed, newData.headlightGreen, newData.headlightBlue))
    } else {
        headlightColourButton.style.setProperty("--after-bg", '#FFFFFF');
        headlightPickr.setColor('#ffffff');
    }

    // Neon

    if (newData.neonFront == 1) {
        newData.neonFront = true
    }
    neonFrontButton.classList.toggle('panel__button--active', newData.neonFront);

    if (newData.neonBack == 1) {
        newData.neonBack = true
    }
    neonBackButton.classList.toggle('panel__button--active', newData.neonBack);

    if (newData.neonRight == 1) {
        newData.neonRight = true
    }
    neonRightButton.classList.toggle('panel__button--active', newData.neonRight);


    if (newData.neonLeft == 1) {
        newData.neonLeft = true
    }
    neonLeftButton.classList.toggle('panel__button--active', newData.neonLeft);



    // Open all permissions
    toggleAllDoorsContainer.classList.remove('panel__button--disabled')
    toggleAllWindowsContainer.classList.remove('panel__button--disabled')

    if (newData.allDoorsDamaged) {
        toggleAllDoorsContainer.classList.add('panel__button--disabled')
    } else {
        toggleAllDoorsContainer.classList.remove('panel__button--disabled')
    }
    toggleAllWindowsContainer.classList.add('panel__button--disabled')

    windows.querySelectorAll("button:not(.panel__close-all):not(.open-all)").forEach((windowButton) => {
        if (!windowButton.classList.contains("panel__button--broken")) {
            toggleAllWindowsContainer.classList.remove('panel__button--disabled')
        } 
    })

    if (!playerInDriverSeat) {
    }
    toggleAllDoorsContainer.classList.toggle('panel__button--disabled', !playerInDriverSeat)
    toggleAllWindowsContainer.classList.toggle('panel__button--disabled', !playerInDriverSeat && !playerInFrontPassenger)



    ui.classList.toggle('ui__main--bike', newData.isBikeMenu)

    vehData = newData;



}


const windowsHeader = document.querySelector('.panel--windows .panel__header')
const doorsHeader = document.querySelector('.panel--doors .panel__header')
const seatsHeader = document.querySelector('.panel--seats .panel__header')
const lightingHeader = document.querySelector('.panel--lighting .panel__header')

windowsHeader.addEventListener('click', toggleWindowsMenu)
doorsHeader.addEventListener('click', toggleDoorsMenu)
seatsHeader.addEventListener('click', toggleSeatsMenu)
lightingHeader.addEventListener('click', toggleLightingMenu)

function toggleWindowsMenu() {
    windows.classList.toggle('panel__button--active')
}

function toggleDoorsMenu() {
    doors.classList.toggle('panel__button--active')
}

function toggleSeatsMenu() {
    seats.classList.toggle('panel__button--active')
}

function toggleLightingMenu() {
    lightingSection.querySelector('.buttons').classList.toggle('panel__button--active')
}

let eventListenersAdded = false

let sigmaBoy = false;
let skibidi = false;


function toggleCarControl(mode, data) {
    if (data) {
        updateData(data);
    }

    carControl.classList.toggle('ui__main--active', mode);
    if (!mode) {
        toggleEditMode(false)
    }
}


window.toggleCarControl = toggleCarControl;
window.carControl = carControl;

async function toggleAllDoors(toggle) {
    doors.querySelectorAll("button:not(.panel__button--broken)").forEach((button) => {
        button.classList.toggle("panel__button--active", toggle)

    })

    let result = await makeCall("allDoors", { to: toggle })

    if (!result.success) {
        doors.querySelectorAll("button:not(.panel__button--broken)").forEach((button) => {
            button.classList.toggle("panel__button--active", !toggle)
        })
    }   
}

async function toggleAllWindows(toggle) {
    windows.querySelectorAll("button:not(.panel__button--broken)").forEach((button) => {
        button.classList.toggle("panel__button--active", toggle)
        button.firstElementChild.src = toggle ? icons.windowDown : icons.windowUp 
    })

    let result = await makeCall("allWindows", { to: toggle })

    if (!result.success) {
        windows.querySelectorAll("button:not(.panel__button--broken)").forEach((button) => {
            button.classList.toggle("panel__button--active", !toggle)
            button.firstElementChild.src = toggle ? icons.windowUp : icons.windowDown 
        })
    }   


}

toggleAllDoorsContainer.firstElementChild.addEventListener('click', toggleAllDoors(false))
toggleAllDoorsContainer.lastElementChild.addEventListener('click', toggleAllDoors(false))

toggleAllWindowsContainer.firstElementChild.addEventListener('click', toggleAllWindows(false))
toggleAllWindowsContainer.lastElementChild.addEventListener('click', toggleAllWindows(false))

powerButton.addEventListener("click", async (e) => {
        if (vehData == null) return;

        vehData.engine_running = !vehData.engine_running;

        powerButton.classList.toggle('panel__button--active', vehData.engine_running);


        let result = makeCall('engine', { value: vehData.engine_running });

        if (result.success) {
            powerButton.classList.toggle('panel__button--active', vehData.engine_running);

            if (!vehData.engine_running) {
                leftButton.classList.remove('panel__button--active');
                hazardButton.classList.remove('panel__button--active');
                rightButton.classList.remove('panel__button--active');
            } else {
                updateData(vehData);
            }
        }

});

lockButton.addEventListener('click', async () => {
    vehData.isLocked = !vehData.isLocked

    let result = await makeCall('lockVehicle', {to: vehData.isLocked})

    if (result.success) {
        lockButton.classList.toggle('panel__button--active', !vehData.isLocked)
        lockButton.lastElementChild.innerHTML = vehData.isLocked ? "LOCKED" : "UNLOCKED"
    }
})

interiorLightButton.addEventListener("click", async (e) => {
        if (vehData == null) return;

        vehData.interiorLightOn = !vehData.interiorLightOn;

        let result = await makeCall('interior-light', { to: vehData.interiorLightOn });

        if (result.success) {
            interiorLightButton.classList.toggle('panel__button--active', vehData.interiorLightOn);
        }
});       

        let nextHeadlightState = 'off';

        
headlightButton.addEventListener("click", async () => {
        if (vehData == null) return;
        
        if (vehData.lightsOn == 1) {
            if (vehData.isNightTime && vehData.highbeamsOn == 0) {
                nextHeadlightState = 'highbeams'
                vehData.lightsOn = 1
                vehData.highbeamsOn = 1
            } else {
                headlightButton.classList.remove('panel__button--active');
                nextHeadlightState = 'off'
                vehData.lightsOn = 0
                vehData.highbeamsOn = 0
            }
        } else {
            headlightButton.classList.toggle('panel__button--active', true);
            nextHeadlightState = 'on'
            vehData.lightsOn = 1
            vehData.highbeamsOn = 0
        }
        makeCall("toggle-headlight", {
            to: nextHeadlightState
        })
})


headlightPickr.on('changestop', async () => {
    
    const color = headlightPickr.getColor().toRGBA()

    let response = await makeCall("headlightColour", {
            red: color[0],
            green: color[1],
            blue: color[2],
    })

    if (response.success) {
        headlightColourButton.style.setProperty("--after-bg", color.toString(3));
    }

})

neonPickr.on('changestop', async () => {
    const color = neonPickr.getColor().toRGBA()

    let response = await makeCall("neonColour", {
            red: color[0],
            green: color[1],
            blue: color[2],
    })

    if (response.success) {
        neonColourButton.style.setProperty("--after-bg", color.toString(3));
    }

})

neonFrontButton.addEventListener("click", async () => {
        if (vehData == null || !vehData.engine_running) return;

        let response = await  makeCall("toggle-neon", {
            index: 2,
            to: !vehData.neonFront,
        })

        if (response.success) {
            vehData.neonFront = !vehData.neonFront
            neonFrontButton.classList.toggle('panel__button--active', vehData.neonFront);
        }
})

neonBackButton.addEventListener("click", async () => {
        if (vehData == null || !vehData.engine_running) return;

        let response = await  makeCall("toggle-neon", {
            index: 3,
            to: !vehData.neonBack,
        })

        if (response.success) {
            vehData.neonBack = !vehData.neonBack
            neonBackButton.classList.toggle('panel__button--active', vehData.neonBack);
        }

})

neonRightButton.addEventListener("click", async () => {
        if (vehData == null || !vehData.engine_running) return;

        let response = await makeCall("toggle-neon", {
            index: 1,
            to: !vehData.neonRight,
        })

        if (response.success) {
            vehData.neonRight = !vehData.neonRight
            neonRightButton.classList.toggle('panel__button--active', vehData.neonRight)
        }



})

neonLeftButton.addEventListener("click", async () => {
        if (vehData == null || !vehData.engine_running) return;

        let response = await makeCall("toggle-neon", {
            index: 0,
            to: !vehData.neonLeft,
        })

        if (response.success) {
            vehData.neonLeft = !vehData.neonLeft
            neonLeftButton.classList.toggle('panel__button--active', vehData.neonLeft);
        }

})

neonColourInput.addEventListener("input", () => {
        const color = neonColourInput.value

        document.documentElement.style.setProperty('--neonColour', color);

        const red = parseInt(color.substr(1, 2), 16)
        const green = parseInt(color.substr(3, 2), 16)
        const blue = parseInt(color.substr(5, 2), 16)

        makeCall("neon-colour", {
            red: red,
            green: green,
            blue: blue,
        })
    })

leftButton.addEventListener("click", (e) => indicate(leftButton, 1));
rightButton.addEventListener("click", (e) => indicate(rightButton, 2));
hazardButton.addEventListener("click", (e) => indicate(hazardButton, 3));


function indicate(button, state) {
    if (vehData == null || !vehData.engine_running) return;
    let disable = button.hasAttribute('panel__button--active');

    leftButton.classList.remove('panel__button--active');
    hazardButton.classList.remove('panel__button--active');
    rightButton.classList.remove('panel__button--active');

    if (disable) {
        vehData.blinker_state = 0;
        return makeCall("indicate", { state: 0 });
    }

    if (state == 1) vehData.blinker_state = 1;
    if (state == 2) vehData.blinker_state = 2;
    if (state == 3) vehData.blinker_state = 3;

    button.classList.toggle('panel__button--active', true)
    makeCall("indicate", { state: vehData.blinker_state });
}



window.addEventListener('click', (e) => {
    if (e.target === document.body) {
        makeCall("close", {});
    }
})

let lastDoorUpdate = 0;

const originalUILeft =  window.innerWidth * 0.5 + 'px'
const originalUITop = (window.innerHeight - 590 + 60) + 'px'
const originalUIScale = 1

window.addEventListener('message', (e) => {
    if (e.data.action === 'toggle_menu') {
        toggleCarControl(e.data.mode, e.data.data);
    } else if (e.data.action === 'data_update') {
        if (e.data.noDoorUpdate) {
            e.data.data.doors = vehData.doors;
            e.data.data.hood = vehData.hood;
            e.data.data.trunk = vehData.trunk;
        }
        updateData(e.data.data);
        lastDoorUpdate = Date.now();
    } else if (e.data.action === 'packet_update') {
        // let keys = Object.keys(e.data.data);
        // for (let i = 0; i < keys.length; i++) {
        //     vehData[keys[i]] = e.data.data[keys[i]];
        //     if (keys[i] === 'doors' || keys[i] === 'hood' || keys[i] === 'trunk') lastDoorUpdate = Date.now();
        // }
        // updateData(vehData);
    } else if (e.data.action == 'adjust-ui') {
        if (!e.data.allowHeadlightColourChange) {
            lightingSection.classList.add('panel--lighting--no-headlight-colour');
            headlightColourButton.remove();
        }

        if (!e.data.allowNeonColourChange) {
            lightingSection.classList.add('panel--lighting--no-neon-colour');
            neonColourButton.remove();
        }

        if (!e.data.allowNeonSection) {
            lightingSection.classList.add('panel--lighting--no-neon');
            neonSection.remove();
        }
    } else if (e.data.action == 'applyPlayerSettings') {
        let left, top, scale;

        if (e.data.data.uileft == null) {  
            left = originalUILeft
        } else {
            left = e.data.data.uileft + 'px';
        }

        if (e.data.data.uitop == null) {
            top = originalUITop
        } else {
            top = e.data.data.uitop + 'px';
        }

        if (e.data.data.uiscale == null) {
            scale = originalUIScale;
        } else {
            scale = e.data.data.uiscale;
        }

        ui.style.left = left;
        ui.style.top = top;
        ui.style.transform = `scale(${scale}) translateX(-50%)`;

        let rect = ui.getBoundingClientRect();

        ui.classList.toggle('ui__main--reverse', rect.top + rect.height / 2 < window.innerHeight / 2)
    }
});

