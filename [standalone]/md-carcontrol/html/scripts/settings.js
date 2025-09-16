let isEditing = false



let previousUILeft = originalUILeft
let previousUITop = originalUITop
let previousUIScale = originalUIScale

const editUI = document.querySelector('.edit-grid')
const settingsButton = document.querySelector('.panel__open-settings')
const settings = document.querySelector('.settings-panel')

const saveChangesButton = document.querySelector('.settings-panel__button--save')
const cancelChangesButton = document.querySelector('.settings-panel__button--cancel')
const resetUIButton = document.querySelector('.settings-panel__button--reset')

let verticalGuideLine = document.querySelector('.edit-grid__line--v')
let horizontalGuideLine = document.querySelector('.edit-grid__line--h')

settingsButton.addEventListener('click', () => {
    toggleEditMode(!isEditing)
})

function toggleEditMode(toggle) {
    isEditing = toggle
    editUI.classList.toggle('edit-grid--active', toggle)
    ui.classList.toggle('ui__main--editing', toggle)
    settings.classList.toggle('settings-panel--active', toggle)
    horizontalGuideLine.classList.remove('edit-grid__line--dimmed')
    horizontalGuideLine.classList.remove('edit-grid__line--highlighted')
    if (isEditing) {
        previousUILeft = ui.style.left
        previousUITop = ui.style.top
        previousUIScale = getCurrentScale(ui)
    }
}

resetUIButton.addEventListener('click', () => {
    ui.style.top = originalUITop

    ui.style.transform = `scale(${originalUIScale}) translateX(-50%)`;
    ui.style.left = originalUILeft

    ui.classList.toggle('ui__main--reverse', false)
})

cancelChangesButton.addEventListener('click', () => {
    toggleEditMode(false)

    ui.style.left = previousUILeft
    ui.style.top = previousUITop
    ui.style.transform = `scale(${previousUIScale}) translateX(-50%)`;
})

saveChangesButton.addEventListener('click', () => {
    toggleEditMode(false)

    makeCall('saveData', {
        left:  parseInt(ui.style.left, 10),
        top:  parseInt(ui.style.top, 10),
        scale: getCurrentScale(ui)
    })
 
    //makeCall
})

const topLeftHandle = document.querySelector(".resizer__handle--tl");
const topRightHandle = document.querySelector(".resizer__handle--tr");
const bottomLeftHandle = document.querySelector(".resizer__handle--bl");
const bottomRightHandle = document.querySelector(".resizer__handle--br");

topLeftHandle.addEventListener("mousedown", (e) => {
    let startWidth = ui.clientWidth
    let rect = ui.getBoundingClientRect();

    let topRight = { x: rect.right, y: rect.top };

    function onMouseMove(e) {
        rect = ui.getBoundingClientRect();
        verticalGuideLine.classList.remove('edit-grid__line--highlighted')

        let dx =  topRight.x - e.clientX;
        
        let roundedFinalWidth = Math.round(dx / 10) * 10

        let roundedScale = (roundedFinalWidth / startWidth)

        ui.style.transform = `scale(${roundedScale}) translateX(-50%)`;
    }

    function onMouseUp() {
        document.removeEventListener("mousemove", onMouseMove);
        document.removeEventListener("mouseup", onMouseUp);
    }

    document.addEventListener("mousemove", onMouseMove);
    document.addEventListener("mouseup", onMouseUp);
})

topRightHandle.addEventListener("mousedown", (e) => {
    startWidth = ui.clientWidth

    let rect = ui.getBoundingClientRect();

    let topLeft = { x: rect.left, y: rect.top };

    function onMouseMove(e) {
        let dx =  e.clientX - topLeft.x;
        
        let roundedFinalWidth = Math.round(dx / 10) * 10

        let roundedScale = (roundedFinalWidth / startWidth)

        ui.style.transform = `scale(${roundedScale}) translateX(-50%)`;
    }

    function onMouseUp() {
        document.removeEventListener("mousemove", onMouseMove);
        document.removeEventListener("mouseup", onMouseUp);
    }

    document.addEventListener("mousemove", onMouseMove);
    document.addEventListener("mouseup", onMouseUp);
});

bottomLeftHandle.addEventListener("mousedown", (e) => {
        // ui.style.transformOrigin = 'center top'

    let startWidth = ui.clientWidth

    let rect = ui.getBoundingClientRect();

    let topRight = { x: rect.right, y: rect.top };

    function onMouseMove(e) {
        verticalGuideLine.classList.remove('edit-grid__line--highlighted')

        let dx =  topRight.x - e.clientX;
        
        let roundedFinalWidth = Math.round(dx / 10) * 10

        let roundedScale = (roundedFinalWidth / startWidth)

        ui.style.transform = `scale(${roundedScale}) translateX(-50%)`;
    }

    function onMouseUp() {
        document.removeEventListener("mousemove", onMouseMove);
        document.removeEventListener("mouseup", onMouseUp);
    }

    document.addEventListener("mousemove", onMouseMove);
    document.addEventListener("mouseup", onMouseUp);
});

bottomRightHandle.addEventListener("mousedown", (e) => {
    startX = e.clientX;
    startY = e.clientY;
    startWidth = ui.clientWidth

    let rect = ui.getBoundingClientRect();

    let topLeft = { x: rect.left, y: rect.top };

    function onMouseMove(e) {
        let dx =   e.clientX - topLeft.x ;
        
        let roundedFinalWidth = Math.round(dx / 10) * 10

        let roundedScale = (roundedFinalWidth / startWidth)

        ui.style.transform = `scale(${roundedScale}) translateX(-50%)`;
    }

    function onMouseUp() {
        document.removeEventListener("mousemove", onMouseMove);
        document.removeEventListener("mouseup", onMouseUp);
    }

    document.addEventListener("mousemove", onMouseMove);
    document.addEventListener("mouseup", onMouseUp);
});




  let offsetX = 0;
  let offsetY = 0;
  let isDragging = false;
  

ui.addEventListener('mousedown', (e) => {
    if (!e.target.classList.contains("resizer__handle") && !e.target.closest(".panel__button--colour") && !e.target.closest("button") && !e.target.closest(".pcr-app")  && isEditing) {
        isDragging = true;
        offsetX = e.clientX - ui.offsetLeft;
        offsetY = e.clientY - ui.offsetTop;
    }
});

document.addEventListener('mousemove', (e) => {
    if (!isDragging) return;
    if (!isEditing) return;
    ui.style.left = Math.round((e.clientX - offsetX) / 10) * 10 + 'px';
    ui.style.top = Math.round((e.clientY - offsetY) / 10) * 10 + 'px';

    let rect = ui.getBoundingClientRect();

    const snappedRectTop = Math.round(rect.top / 10) * 10;
    const actualRectTop = rect.top

    const differenceBetweenTopSnap = snappedRectTop - actualRectTop;

    ui.style.top = (parseFloat(ui.style.top) + differenceBetweenTopSnap) + 'px';

    const snappedRectLeft = Math.round(rect.left / 10) * 10;
    const actualRectLeft = rect.left

    const differenceBetweenLeftSnap = snappedRectLeft - actualRectLeft;

    ui.style.left = (parseFloat(ui.style.left) + differenceBetweenLeftSnap) + 'px';

    const screenCenterX = window.innerWidth / 2;
    const screenCenterY = window.innerHeight / 2;
    const uiCenterX = rect.left + rect.width / 2;
    const uiCenterY = rect.top + rect.height / 2;
    const snapRadius = 15; 
    const uiScale = getCurrentScale(ui)


    let isWithinHorizontalSnapRadius =  Math.abs(uiCenterX - screenCenterX) <= snapRadius
    let isWithinVerticalSnapRadius =  Math.abs(uiCenterY - screenCenterY) <= snapRadius

        verticalGuideLine.classList.remove('edit-grid__line--dimmed')
        horizontalGuideLine.classList.remove('edit-grid__line--dimmed')
        verticalGuideLine.classList.remove('edit-grid__line--highlighted')
        horizontalGuideLine.classList.remove('edit-grid__line--highlighted')

    if (isWithinHorizontalSnapRadius && isWithinVerticalSnapRadius) {
        horizontalGuideLine.classList.add('edit-grid__line--highlighted')
        verticalGuideLine.classList.add('edit-grid__line--highlighted')
        ui.style.left = (screenCenterX - rect.width / (2 * uiScale)) + (rect.width / 2) + 'px';
        ui.style.top = (screenCenterY - rect.height / (2 * uiScale)) + 'px';
    } else if (isWithinVerticalSnapRadius) {
        horizontalGuideLine.classList.add('edit-grid__line--highlighted')
        verticalGuideLine.classList.add('edit-grid__line--dimmed')
        ui.style.top = (screenCenterY - rect.height / (2 * uiScale)) + 'px';
    } else if (isWithinHorizontalSnapRadius) {
        verticalGuideLine.classList.add('edit-grid__line--highlighted')
        horizontalGuideLine.classList.add('edit-grid__line--dimmed')
        ui.style.left = (screenCenterX - rect.width / (2 * uiScale)) + (rect.width / 2) + 'px';
    } else {
        verticalGuideLine.classList.remove('edit-grid__line--highlighted')
        horizontalGuideLine.classList.remove('edit-grid__line--highlighted')
    }

    toggleReverseUI(uiCenterY > screenCenterY)

});

document.addEventListener('mouseup', () => {
      if (!isEditing) return;
    isDragging = false;
});

function toggleReverseUI(toggle) {
    ui.classList.toggle('ui__main--reverse', !toggle)
}