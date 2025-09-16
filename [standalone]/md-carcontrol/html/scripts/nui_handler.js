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

const keyMap = {
    1000: "ShiftLeft",
    1001: "ShiftRight",
    1002: "Tab",
    1003: "Enter",
    1004: "Backspace",
    1008: "Home",
    1009: "PageUp",
    1010: "PageDown",
    1012: "CapsLock",
    1013: "ControlLeft",
    1014: "ControlRight",
    1015: "AltLeft",
    1016: "AltRight",
    2000: "Space",
    2001: "End",
    170: "F1",
    171: "F2",
    172: "F3",
    173: "F4",
    174: "F5",
    175: "F6",
    176: "F7",
    177: "F8",
    178: "F9",
    179: "F10",
    180: "F11",
    181: "F12",
    194: "ArrowUp",
    195: "ArrowDown",
    196: "ArrowLeft",
    197: "ArrowRight",
    198: "Delete",
    199: "Escape",
    200: "Insert",
    numlock: "NumLock", //my keyboard dont got this button

};

let lastDoorUpdate = 0;

window.addEventListener('message', (e) => {


    if (e.data.action === 'toggle_menu') {
        toggleCarControl(e.data.mode, e.data.data);
    } else if (e.data.action === 'data_update') {
        if (Date.now() - lastDoorUpdate < 500) {
            e.data.data.doors = vehData.doors;
            e.data.data.hood = vehData.hood;
            e.data.data.trunk = vehData.trunk;
        }
        updateData(e.data.data);
        lastDoorUpdate = Date.now();
    } else if (e.data.action === 'packet_update') {
        let keys = Object.keys(e.data.data);
        for (let i = 0; i < keys.length; i++) {
            vehData[keys[i]] = e.data.data[keys[i]];
            if (keys[i] === 'doors' || keys[i] === 'hood' || keys[i] === 'trunk') lastDoorUpdate = Date.now();
        }
        updateData(vehData);
    }
});

// window.addEventListener('keydown', async (e) => {
//     if (e.key == 'Escape') {
//         toggleCarControl(false, null);

//         await delay(100)

//         makeCall("close", {})
     
//     }
// })

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}