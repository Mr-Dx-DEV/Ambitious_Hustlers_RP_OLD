var setmaxSpeed = 0;

let previousSpeed = 0;
let previousRPM = 0;
let previousFuel = 0;
let previousNos = 0;

let speedometerNeedleAngle = { current: 135, target: 135 };
let rpmNeedleAngle = { current: 135, target: 135 };
let fuelNeedleAngle = { current: 135, target: 135 };
let nosNeedleAngle = { current: 135, target: 135 };

let speedArcAngle = { current: 10.0, target: -Math.PI / 4 };
let fuelArcAngle = { current: 10.0, target: -Math.PI / 4 };
let rpmArcAngle = { current: 10.0, target: -Math.PI / 4 };
let nosArcAngle = { current: 10.0, target: -Math.PI / 4 };
var markersMade = false
let prevIsRunning = null;

function updateSpeedometer(data) {
    if(!speedInitialized) {
        speedInitialized = true;
        fadeIn('speedometer');
    }

    var SpeedLocation = data.SpeedLocation || { top: '73%', left: '88%' };

    var speedometer = document.getElementById('speedometer');

    speedometer.classList.add('common-meter');

    Object.assign(speedometer.style, {
        top: SpeedLocation.top,
        left: SpeedLocation.left,
        height: data.SpeedSize,
        width: data.SpeedSize,
        border: `${data.BorderWidth || '0.2vh'} ${data.BorderStyle || 'solid'} ${data.BorderCol || 'rgba(255, 255, 255, 1.0)'}`,
        backgroundColor: data.BackgroundCol || 'rgba(0, 0, 0, 1.0)',
        boxShadow: `${data.BackgroundShadow || '0 0 10px'} ${data.BackgroundShadowColor || 'rgba(255, 255, 255, 0.6)'}`,
        transition: 'transform 0.03s ease-out',
    });

    let speed = data.speed;
    if (speed > data.maxSpeed) { speed = data.maxSpeed; }
    let newSpeedometerAngle = calculateNeedleAngle(speed, data.maxSpeed);
    speedometerNeedleAngle.target = newSpeedometerAngle;
    animateNeedle('speedometer-needle', speedometerNeedleAngle);

    if (needleType != 4) {
        var speeddisp = document.getElementById('speed-display');
        speeddisp.textContent = data.ShowDigitalSpeed == true ? Math.floor(data.speed) : '',
        Object.assign(speeddisp.style, {
            position: 'absolute',
            fontFamily: data.font,
            color: data.isRunning == 1 ? data.digitalSpeedCol : 'rgba(50, 50, 50, 1.0)',
            textShadow: data.isRunning == 1 ? data.digitalSpeedGlow : 'rgba(0,0,0, 0.0)',
            fontSize: data.digitalSpeedSize,
            top: `${data.digitalSpeedLoc.top}%`,
            left: `${data.digitalSpeedLoc.left}%`,
        });
    }

    var rpmmeter = document.getElementById('rpm-meter');
    if (data.showRpmMeter === true) {
        Object.assign(rpmmeter.style, {
            position: 'absolute',
            height: data.rpmMeterSize,
            width: data.rpmMeterSize,
            transform: data.rpmMeterLocation || 'translate(80%, 20%)',
            border: `${data.BorderWidth || '0.2vh'} ${ data.BorderStyle || 'solid' } ${data.BorderCol || 'rgba(255, 255, 255, 1.0)'}`,
            borderRadius: '50%',
            borderBottom: 'none',
            boxSizing: 'border-box',
            backgroundColor: data.BackgroundCol || 'rgba(0, 0, 0, 1.0)',
            boxShadow: `${data.BackgroundShadow || '0 0 10px'} ${data.BackgroundShadowColor || 'rgba(255, 255, 255, 0.6)'}`,
            transition: 'transform 0.03s ease-out',
        });
        document.querySelectorAll('.rpm-number-container').forEach(container => {
            const marker = container.querySelector('.rpm-marker');
            const markerhigh = container.querySelector('.marker-high');
            if (marker) {
              marker.style.backgroundColor = data.isRunning != 1
                ? 'rgba(50, 50, 50, 1.0)'
                : (markerhigh
                    ? (data.MarkerColourHigh || 'rgba(255, 0, 0, ' + data.BorderTrans + ')')
                    : (data.MarkerColour || 'rgba(255, 255, 255, ' + data.BorderTrans + ')'));
            }
          });

        let rpm = data.rpm;
        if (rpm > data.isPlane ? 750 : 1.0) { rpm = data.isPlane ? 750 : 1.0; }

        if (data.isPlane) {
            let newrpmNeedleAngle = calculateNeedleAngle(data.rpm, 750);
            rpmNeedleAngle.target = newrpmNeedleAngle;
            animateNeedle('rpm-needle', rpmNeedleAngle);
        } else  {
            //console.log(data.rpm);
            let newrpmNeedleAngle = calculateNeedleAngle(data.rpm, 1);
            rpmNeedleAngle.target = newrpmNeedleAngle;
            animateNeedle('rpm-needle', rpmNeedleAngle);
        }
    } else {
        rpmmeter.style.display = 'none';
        document.getElementById('rpm-needle').style.display = 'none';
        document.getElementById('gear-display').style.display = 'none';
    }

    var fuelmeter = document.getElementById('fuel-meter');
    if (data.showFuelMeter === true) {
        Object.assign(fuelmeter.style, {
            position: 'absolute',
            height: data.fuelMeterSize,
            width: data.fuelMeterSize,
            transform: data.fuelMeterLocation || 'translate(-80%, 20%)',
            border: `${data.BorderWidth || '0.2vh'} ${data.BorderStyle || 'solid'} ${data.BorderCol || 'rgba(255, 255, 255, 1.0)'}`,
            borderRadius: '50%',
            borderBottom: 'none',
            boxSizing: 'border-box',
            backgroundColor: data.BackgroundCol || 'rgba(0, 0, 0, 1.0)',
            boxShadow: `${data.BackgroundShadow || '0 0 10px'} ${data.BackgroundShadowColor || 'rgba(255, 255, 255, 0.6)'}`,
            transition: 'transform 0.03s ease-out',
        });
        let newfuelNeedleAngle = calculateNeedleAngle(data.fuel, 100);
        fuelNeedleAngle.target = newfuelNeedleAngle;
        animateNeedle('fuel-needle', fuelNeedleAngle);
        var fuelmeterCanvas = document.getElementById("fuelmeterCanvas");
        if (fuelmeterCanvas) {
            fuelmeterCanvas.height = window.innerHeight * (0.20 / 10);
            fuelmeterCanvas.width = fuelmeterCanvas.height;
            fuelmeterCanvas.style.position = 'absolute';
            fuelmeterCanvas.style.left = `calc(50% - ${fuelmeterCanvas.width / 2}px)`;
            fuelmeterCanvas.style.bottom = '0.3vh';
        }
        var ctx = fuelmeterCanvas.getContext('2d');
        var img = "";
        if (data.isElectric === true) { img = preloadedImages["electric"]; } else { img = preloadedImages["lowfuel"]; }
        ctx.drawImage(img, 0, 0, fuelmeterCanvas.width, fuelmeterCanvas.height);
        ctx.globalCompositeOperation = 'source-atop';
        ctx.fillStyle = data.fuel <= 10 ? 'rgba(255, 102, 0)' : (data.isRunning == 1 ? 'rgba(255, 255, 255, 1.0)' : 'rgba(50, 50, 50, 1.0)');
        ctx.fillRect(0, 0, fuelmeterCanvas.width, fuelmeterCanvas.height);
        ctx.globalCompositeOperation = 'source-over';
    } else {
        document.getElementById('fuel-needle').style.display = 'none';
    }

    var nosmeter = document.getElementById('nos-meter');
    var nosNeedle = document.getElementById('nos-needle');
    var nosmeterCanvas = document.getElementById("nosmeterCanvas");
    var nosArc = document.getElementById("nosArc");
    var needleType = data.NeedleType;

    const showNos = data.showNosMeter === true && data.hasNos === true && data.nos > 0;

    if (showNos && data.nosActiveLevel > 0) {
        // Show NOS meter container
        nosmeter.style.display = 'block';
        // First, create rectangles if they don't exist
        if (!document.getElementById('nos-glow-container')) {
            const glowContainer = document.createElement('div');
            glowContainer.id = 'nos-glow-container';
            Object.assign(glowContainer.style, {
                position: 'absolute',
                bottom: needleType == 3 ? '0.5vh' : '3.0vh',
                left: '50%',
                transform: 'translateX(-50%)',
                display: 'flex',
                gap: '0.1vh',
                justifyContent: 'center',
            });

            for (let i = 1; i <= 3; i++) {
                const rect = document.createElement('div');
                rect.className = 'nos-glow-rect';
                rect.dataset.index = i;
                Object.assign(rect.style, {
                    width: '0.3vh',
                    height: '0.4vh',
                    backgroundColor: data.nosMarker,
                    borderRadius: '0.3vh',
                    transition: 'box-shadow 0.3s ease, background-color 0.3s ease',
                });
                glowContainer.appendChild(rect);
            }

            nosmeter.appendChild(glowContainer);
        }

        const glowContainer = document.getElementById('nos-glow-container');
        glowContainer.style.display = (data.purgeMode == true || data.nosActiveLevel == 0) ? 'none' : 'flex';

        // Update rectangles glow based on `data.nosActiveLevel`
        // Assume data.nosActiveLevel is 0 (off) to 3 (fully active)
        const activeLevel = data.nosActiveLevel || 0;
        document.querySelectorAll('.nos-glow-rect').forEach(rect => {
            const index = parseInt(rect.dataset.index, 10);
            if (index <= activeLevel) {
                rect.style.boxShadow = data.isRunning == 1 ? `0 0 1vh 0.1vh ${data.nosMarkerLight}` : null;
                rect.style.backgroundColor = data.isRunning == 1 ? data.nosMarkerLight : 'rgba(50, 50, 50)';
            } else {
                rect.style.boxShadow = 'none';
                rect.style.backgroundColor = data.isRunning == 1 ? data.nosMarker : 'rgba(50, 50, 50)' ;
            }
        });


        // Reset essential positioning styles explicitly here:
        Object.assign(nosmeter.style, {
            position: 'absolute',
            height: data.nosMeterSize,
            width: data.nosMeterSize,
            transform: data.nosMeterLocation || 'translate(-80%, 20%)',
            border: `${data.BorderWidth || '0.2vh'} ${data.BorderStyle || 'solid'} ${data.BorderCol || 'rgba(255, 255, 255, 1.0)'}`,
            borderRadius: '50%',
            borderBottom: 'none',
            boxSizing: 'border-box',
            backgroundColor: data.BackgroundCol || 'rgba(0, 0, 0, 1.0)',
            boxShadow: `${data.BackgroundShadow || '0 0 10px'} ${data.BackgroundShadowColor || 'rgba(255, 255, 255, 0.6)'}`,
        });

        if (needleType === 1 || needleType === 2) {
            // Display elements for needle types 1 & 2
            nosNeedle.style.display = 'block';
            nosmeterCanvas.style.display = 'block';
            nosArc.style.display = 'none'; // Hide arc explicitly

            // Markers: create if missing, show if hidden
            if (!document.querySelector('.nos-number-container')) {
                createNosMarkers(data);
            } else {
                document.querySelectorAll('.nos-number-container').forEach(el => {
                    el.style.display = 'block';
                });
            }

            // Animate needle
            let newnosNeedleAngle = calculateNeedleAngle(data.nos);
            nosNeedleAngle.target = newnosNeedleAngle;
            animateNeedle('nos-needle', nosNeedleAngle);

            // NOS icon canvas
            if (nosmeterCanvas) {
                nosmeterCanvas.height = window.innerHeight * (0.20 / 10);
                nosmeterCanvas.width = nosmeterCanvas.height;
                Object.assign(nosmeterCanvas.style, {
                    position: 'absolute',
                    left: `calc(50% - ${nosmeterCanvas.width / 2}px)`,
                    bottom: '0.3vh',
                    display: 'block',
                });

                const ctx = nosmeterCanvas.getContext('2d');
                ctx.clearRect(0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                const img = data.purgeMode ? preloadedImages["purge"] : preloadedImages["nos"];
                ctx.drawImage(img, 0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                ctx.globalCompositeOperation = 'source-atop';
                ctx.fillStyle = data.isRunning == 1 ? 'rgba(255, 255, 255, 1.0)' : 'rgba(50, 50, 50, 1.0)';
                ctx.fillRect(0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                ctx.globalCompositeOperation = 'source-over';
            }

        } else if (needleType === 3) {
            // Display elements for needle type 3
            nosArc.style.display = 'block';
            nosmeterCanvas.style.display = 'block';
            nosNeedle.style.display = 'none';

            // Remove/hide markers for this type
            document.querySelectorAll('.nos-number-container').forEach(el => {
                el.remove();
            });

            // Adjust canvas explicitly again (fixes positioning)
            adjustCanvas('nosArc', 'nos-meter');
            updateArcAngle('nosArc', data.nos, 100.0, data);

            // NOS icon canvas positioning explicitly again
            if (nosmeterCanvas) {
                nosmeterCanvas.height = window.innerHeight * (0.20 / 10);
                nosmeterCanvas.width = nosmeterCanvas.height;
                Object.assign(nosmeterCanvas.style, {
                    position: 'absolute',
                    left: `calc(50% - ${nosmeterCanvas.width / 2}px)`,
                    bottom: '1.2vh',
                    display: 'block',
                });

                const ctx = nosmeterCanvas.getContext('2d');
                ctx.clearRect(0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                const img = data.purgeMode ? preloadedImages["purge"] : preloadedImages["nos"];
                if (data.nosActive) {
                    ctx.filter = 'blur(3px)';
                    ctx.drawImage(img, 0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                    ctx.filter = 'none';
                }
                ctx.drawImage(img, 0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                ctx.globalCompositeOperation = 'source-atop';
                ctx.fillStyle = data.isRunning == 1 ? 'rgba(255, 255, 255, 1.0)' : 'rgba(50, 50, 50, 1.0)';
                ctx.fillRect(0, 0, nosmeterCanvas.width, nosmeterCanvas.height);
                ctx.globalCompositeOperation = 'source-over';
            }
        }

    } else {
        // Hide all NOS elements explicitly
        nosmeter.style.display = 'none';
        nosNeedle.style.display = 'none';
        nosArc.style.display = 'none';

        if (nosmeterCanvas) {
            nosmeterCanvas.style.display = 'none';
        }

        // Hide markers explicitly
        document.querySelectorAll('.nos-number-container').forEach(el => {
            el.style.display = 'none';
        });
    }

    var geardisp = document.getElementById('gear-display');
    geardisp.textContent = data.isPlane ? data.rpm : data.gear;
    geardisp.style.fontFamily = data.font;
    geardisp.style.color = data.isRunning == 1 ? (data.isPlane ? data.TextColour : (data.gear === data.maxGear) ? data.ColourHigh : data.TextColour) : 'rgba(50, 50, 50)';
    geardisp.style.fontSize = rpmmeter.style.height.replace("vh", "") * 0.2 + "vh";

    let styleElement = document.getElementById('needle-dynamic-styles');
    if (!styleElement) {
        styleElement = document.createElement('style');
        styleElement.id = 'needle-dynamic-styles';
        document.head.appendChild(styleElement);
    }

    if (needleType === 1) {
        styleElement.textContent = `
            #speedometer-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                border-left: 0.2vh solid transparent;
                border-right: ${data.SpeedNeedleWidth} solid transparent;
                border-top: ${data.SpeedNeedleLength} solid ${data.SpeedNeedleCol};
                transform: translateX(-50%) rotate(180deg);
                filter: drop-shadow( ${data.SpeedNeedleShadow} ${data.SpeedNeedleShadowCol} );
            }
            #speedometer-needle::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                background-color: ${data.SpeedNeedleCol};
                border-radius: 50%;
                transform: translate(-50%, 10px);
                filter: drop-shadow( ${data.SpeedNeedleShadow} ${data.SpeedNeedleShadowCol} );
            }`
        styleElement.textContent += `
            #rpm-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                border-left: 0.2vh solid transparent;
                border-right: ${data.rpmNeedleWidth} solid transparent;
                border-top: ${data.rpmNeedleLength} solid ${data.rpmNeedleCol};
                transform: translateX(-50%) rotate(180deg);
                filter: drop-shadow( ${data.rpmNeedleShadow} ${data.rpmNeedleShadowCol} );
            }
            #rpm-needle::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0%;
                background-color: ${data.rpmNeedleCol};
                border-radius: 50%;
                transform: translate(-50%, 2px);
                filter: drop-shadow( ${data.rpmNeedleShadow} ${data.rpmNeedleShadowCol} );
            }`
        styleElement.textContent += `
            #fuel-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                border-left: 0.2vh solid transparent;
                border-right: ${data.fuelNeedleWidth} solid transparent;
                border-top: ${data.fuelNeedleLength} solid ${data.fuelNeedleCol};
                transform: translateX(-50%) rotate(180deg);
                filter: drop-shadow( ${data.fuelNeedleShadow} ${data.fuelNeedleShadowCol} );
            }
            #fuel-needle::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0%;
                background-color: ${data.fuelNeedleCol};
                border-radius: 50%;
                transform: translate(-50%, 2px);
                filter: drop-shadow( ${data.fuelNeedleShadow} ${data.fuelNeedleShadowCol} );
            }`
        styleElement.textContent += `
            #nos-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                border-left: 0.2vh solid transparent;
                border-right: ${data.nosNeedleWidth} solid transparent;
                border-top: ${data.nosNeedleLength} solid ${data.nosNeedleCol};
                transform: translateX(-50%) rotate(180deg);
                filter: drop-shadow( ${data.nosNeedleShadow} ${data.nosNeedleShadowCol} );
            }
            #nos-needle::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0%;
                background-color: ${data.nosNeedleCol};
                border-radius: 50%;
                transform: translate(-50%, 2px);
                filter: drop-shadow( ${data.nosNeedleShadow} ${data.nosNeedleShadowCol} );
            }
        `;

        let speedCircleSize = parseFloat(data.SpeedNeedleWidth.replace('vh', '')) * 1.5;
        let rpmCircleSize = parseFloat(data.rpmNeedleWidth.replace('vh', '')) * 1.5;
        let fuelCircleSize = parseFloat(data.fuelNeedleWidth.replace('vh', '')) * 1.5;
        let nosCircleSize = parseFloat(data.nosNeedleWidth.replace('vh', '')) * 1.5;

        styleElement.textContent += `
            #speedometer-needle::after {
                width: ${speedCircleSize}vh;
                height: ${speedCircleSize * 2}vh;
            }
            #rpm-needle::after {
                width: ${rpmCircleSize}vh;
                height: ${rpmCircleSize * 2}vh;
            }
            #fuel-needle::after {
                width: ${fuelCircleSize}vh;
                height: ${fuelCircleSize * 2}vh;
            }
            #nos-needle::after {
                width: ${nosCircleSize}vh;
                height: ${nosCircleSize * 2}vh;
            }
        `;

        if (prevIsRunning !== data.isRunning) {
            // Remove all marker elements
            document.querySelectorAll(
              '.number-container, .rpm-number-container, .fuel-number-container, .nos-number-container'
            ).forEach(el => el.remove());

            // Reset guard variables so marker creation functions will run again
            oldMax = 0;
            markersMade = false;

            // Recreate markers based on the current configuration
            createSpeedMarkers(data);
            if (data.showRpmMeter === true) { createRpmMarkers(data); }
            if (data.showFuelMeter === true) { createFuelMarkers(data); }
            if (data.showNosMeter === true && data.hasNos === true && data.nos > 0) { createNosMarkers(data); }

            // Update previous state
            prevIsRunning = data.isRunning;
          }

        //createSpeedMarkers(data);
        //if (data.showRpmMeter === true) { createRpmMarkers(data); }
        //if (data.showFuelMeter === true) { createFuelMarkers(data); }
        //if (data.showNosMeter === true && data.hasNos === true && data.nos > 0) { createNosMarkers(data); }

    } else if (needleType === 2) {
        styleElement.textContent = `
            #speedometer-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                width: ${data.SpeedNeedleWidth.replace("vh", "") * 2 + "vh"};
                height: ${data.SpeedNeedleLength};
                background: linear-gradient(to top, transparent 15%, ${data.SpeedNeedleCol} 60%);
                transform: translateX(-50%);
                clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
                filter: drop-shadow(${data.SpeedNeedleShadow} ${data.SpeedNeedleShadowCol});
            }

            #rpm-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                width: ${data.rpmNeedleWidth.replace("vh", "") * 2 + "vh"};
                height: ${data.rpmNeedleLength};
                background: linear-gradient(to top, transparent 15%, ${data.rpmNeedleCol} 60%);
                transform: translateX(-50%);
                clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
                filter: drop-shadow(${data.rpmNeedleShadow} ${data.rpmNeedleShadowCol});
            }

            #fuel-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                width: ${data.fuelNeedleWidth.replace("vh", "") * 2 + "vh"};
                height: ${data.fuelNeedleLength};
                background: linear-gradient(to top, transparent 15%, ${data.fuelNeedleCol} 60%);
                transform: translateX(-50%);
                clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
                filter: drop-shadow(${data.fuelNeedleShadow} ${data.fuelNeedleShadowCol});
            }

            #nos-needle::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                width: ${data.nosNeedleWidth.replace("vh", "") * 2 + "vh"};
                height: ${data.nosNeedleLength};
                background: linear-gradient(to top, transparent 15%, ${data.nosNeedleCol} 60%);
                transform: translateX(-50%);
                clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
                filter: drop-shadow(${data.nosNeedleShadow} ${data.nosNeedleShadowCol});
            }
        `;
        if (prevIsRunning !== data.isRunning) {
            // Remove all marker elements
            document.querySelectorAll(
              '.number-container, .rpm-number-container, .fuel-number-container, .nos-number-container'
            ).forEach(el => el.remove());

            // Reset guard variables so marker creation functions will run again
            oldMax = 0;
            markersMade = false;

            // Recreate markers based on the current configuration
            createSpeedMarkers(data);
            if (data.showRpmMeter === true) { createRpmMarkers(data); }
            if (data.showFuelMeter === true) { createFuelMarkers(data); }
            if (data.showNosMeter === true && data.hasNos === true && data.nos > 0) { createNosMarkers(data); }

            // Update previous state
            prevIsRunning = data.isRunning;
          }
    } else if (needleType === 3) {
        let speed = data.speed;
        if (speed > data.maxSpeed) { speed = data.maxSpeed; }
        updateArcAngle('speedArc', speed, data.maxSpeed, data);
        document.querySelectorAll('.marker').forEach(marker => marker.remove());
        document.querySelectorAll('.number-container').forEach(marker => marker.remove());
        adjustCanvas('speedArc', 'speedometer');

        if (data.showFuelMeter === true) {
            let fuel = data.fuel;
            if (fuel > 100.0) { fuel = 100.0; }
            document.querySelectorAll('.fuel-marker').forEach(marker => marker.remove());
            updateArcAngle('fuelArc', fuel, 100.0, data);
            adjustCanvas('fuelArc', 'fuel-meter');
            document.getElementById("fuelmeterCanvas").style.bottom = '1.2vh';
        }

        if (data.showRpmMeter === true) {
            let rpm = data.rpm;
            if (rpm > data.isPlane ? 750 : 1.0) { rpm = data.isPlane ? 750 : 1.0; }
            document.querySelectorAll('.rpm-marker').forEach(marker => marker.remove());
            geardisp.style.bottom = '40%';
            geardisp.style.left = '20%';
            //geardisp.style.fontSize = '1.5vh';
            adjustCanvas('rpmArc', 'rpm-meter');
            updateArcAngle('rpmArc', data.rpm, data.isPlane ? 750 : 1.0, data);
        }

        if (data.showNosMeter === true && data.hasNos === true && data.nos > 0) {
            let nos = data.nos;
            if (nos > 100.0) { nos = 100.0; }
            document.querySelectorAll('.nos-marker').forEach(marker => marker.remove());
            updateArcAngle('nosArc', data.nos, 100.0, data);
            adjustCanvas('nosArc', 'nos-meter');
            document.getElementById("nosmeterCanvas").style.bottom = '1.2vh';
        }
    } else if (needleType === 4) {
        // Hide old elements explicitly
        ['speedometer`, speedometer-needle', 'rpm-meter', 'fuel-meter', 'nos-meter', 'nosArc', 'fuelArc', 'rpmArc', 'speedArc', 'nos-needle', 'fuel-needle', 'rpm-needle'].forEach(id => {
            const el = document.getElementById(id);
            if (el) el.style.display = 'none';
        });

        // Position bars relative to speed bar
        const baseTop = parseFloat(data.SpeedLocation.top) - 80;
        const baseLeft = data.SpeedLocation.left;

        const positions = {
            speed: { top: `${baseTop}%`, left: baseLeft },
            fuel:  { top: `${baseTop + 30}%`, left: baseLeft },
            rpm:   { top: `${baseTop + 50}%`, left: baseLeft },
            nos:   { top: `${baseTop + 70}%`, left: baseLeft },
        };
        const barColors = {
            speed: data.SpeedDigitalBack || 'rgba(55, 255, 255, 0.3)',
            rpm: data.rpmDigitalBack || 'rgba(55, 255, 255, 0.3)',
            fuel: data.fuelDigitalBack || 'rgba(55, 255, 255, 0.3)',
            nos: data.nosDigitalBack || 'rgba(55, 255, 255, 0.3)',
        };
        const barActiveColors = {
            speed: data.SpeedNeedleCol || 'rgba(255,255,255,1)',
            rpm: data.rpmNeedleCol || 'rgba(0,255,0,1)',
            fuel: data.fuelNeedleCol || 'rgba(255,165,0,1)',
            nos: data.nosNeedleCol || 'rgba(0,150,255,1)',
        };
        const nosActiveColors = {
            speed: data.SpeedNosActive || 'rgba(255,255,255,1)',
            rpm: data.rpmNosActive || 'rgba(0,255,0,1)',
            fuel: data.fuelNosActive || 'rgba(255,165,0,1)',
            nos: data.nosNosActive || 'rgba(0,150,255,1)',
        };

        // Setup bar container
        const bars = ['speed', 'rpm', 'fuel', 'nos'];
        bars.forEach(barType => {
            let barContainer = document.getElementById(`${barType}-bar-container`);
            if (!barContainer) {
                barContainer = document.createElement('div');
                barContainer.id = `${barType}-bar-container`;
                barContainer.className = 'bar-container';

                for (let i = 0; i < 20; i++) {
                    const bar = document.createElement('div');
                    bar.className = (barType === "speed" ? 'bar' : 'bar-thin');
                    bar.style.backgroundColor = barColors[barType]; // default background
                    barContainer.appendChild(bar);
                }
                speedometer.appendChild(barContainer);
            }
            Object.assign(barContainer.style, positions[barType]);
            // Calculate active bars
            const maxValues = {
                speed: data.maxSpeed,
                rpm: data.isPlane ? 750 : 1.0,
                fuel: 100,
                nos: 100,
            };

            let currentValue = Math.min(data[barType], maxValues[barType]);
            const activeBars = Math.round((currentValue / maxValues[barType]) * 20);

            barContainer.querySelectorAll('.bar').forEach((bar, index) => {
                bar.style.backgroundColor = index < activeBars ? (data.nosActive ? nosActiveColors[barType] : barActiveColors[barType]) : barColors[barType];
            });
            barContainer.querySelectorAll('.bar-thin').forEach((bar, index) => {
                bar.style.backgroundColor = index < activeBars ? (data.nosActive ? nosActiveColors[barType] : barActiveColors[barType]) : barColors[barType];
            });
        });

        //const imagePositionRight = data.imagePositionRight || false; // toggle true for right, false for left
        const imagePositionRight = false; // toggle true for right, false for left

        var speeddisp = document.getElementById('speed-display');
        speeddisp.textContent = data.ShowDigitalSpeed == true ? Math.floor(data.speed) : '',
        Object.assign(speeddisp.style, {
            position: 'absolute',
            fontFamily: data.font,
            color: data.isRunning == 1 ? data.digitalSpeedCol : 'rgba(50, 50, 50, 1.0)',
            textShadow: data.isRunning == 1 ? data.digitalSpeedGlow : 'rgba(0,0,0, 0.0)',
            fontSize: "3vh",
            top: positions.speed.top,
            left: `${parseFloat(positions.speed.left) - 70}%`,
            textAlign: 'right',         // ensures text aligns to the right
            transformOrigin: 'right',    // scales/grows from the right side
        });


        // Utility function to manage images
        function updateBarImage(id, barType, imageSrc, topPosition) {
            let img = document.getElementById(id);
            if (!img) {
                img = document.createElement('img');
                img.id = id;
                Object.assign(img.style, {
                    position: 'absolute',
                    height: '2vh',
                    width: '2vh',
                    objectFit: 'contain',
                    transition: 'filter 0.2s ease',
                    display: 'block' // ensure it's visible when created
                });
                speedometer.appendChild(img);
            } else {
                img.style.display = 'block'; // explicitly show the image if it was hidden before
            }

            // Update the source if needed.
            if (img.src !== imageSrc) {
                img.src = imageSrc;
            }

            // Calculate left position based on your toggle
            const leftValue = parseFloat(positions[barType].left);
            const leftOffset = data.imagePositionRight ? leftValue + 10 : leftValue - 20;

            Object.assign(img.style, {
                top: positions[barType].top,
                left: `${leftOffset}%`,
                filter: (barType == 'fuel' && data.fuel <= 10)
                ? 'brightness(0) saturate(100%) invert(50%) sepia(100%) saturate(500%) hue-rotate(15deg)'
                : (data.isRunning === 1 ? 'none' : 'grayscale(100%) brightness(20%)'),
               });
        }

        // Update Fuel Image
        const fuelImgSrc = data.isElectric ? preloadedImages["electric"].src : preloadedImages["lowfuel"].src;
        updateBarImage('fuel-image', 'fuel', fuelImgSrc, positions.fuel.top);

        if (data.hasNos) {
            // Show and update nos bar
            const nosBarContainer = document.getElementById('nos-bar-container');
            if (nosBarContainer) {
                nosBarContainer.style.display = 'flex';
                // (Update the nos bar segments here as usual)
                // For example:
                let currentValue = Math.min(data.nos, 100);
                const activeBars = Math.round((currentValue / 100) * 20);
                nosBarContainer.querySelectorAll('.bar, .bar-thin').forEach((bar, index) => {
                    bar.style.backgroundColor = index < activeBars ? (data.nosActive ? nosActiveColors["nos"] : barActiveColors["nos"]) : barColors["nos"];
                });
            }

            // Update the nos image using your update function:
            const nosImgSrc = data.purgeMode ? preloadedImages["purge"].src : preloadedImages["nos"].src;
            updateBarImage('nos-image', 'nos', nosImgSrc, positions.nos.top);
            let glowContainer4 = document.getElementById('nos-glow-container-type4');

            if (!glowContainer4) {
                glowContainer4 = document.createElement('div');
                glowContainer4.id = 'nos-glow-container-type4';
                Object.assign(glowContainer4.style, {
                    position: 'absolute',
                    display: 'flex',
                    flexDirection: 'column-reverse', // bottom-to-top ordering
                    gap: '0.2vh',
                    alignItems: 'center',
                });

                // Create 3 rectangles vertically
                for (let i = 1; i <= 3; i++) {
                    const rect = document.createElement('div');
                    rect.className = 'nos-glow-rect-type4';
                    rect.dataset.index = i;
                    Object.assign(rect.style, {
                        width: '0.4vh',
                        height: '0.5vh',
                        backgroundColor: data.nosMarker || 'rgba(50, 50, 50, 0.5)',
                        borderRadius: '0.2vh',
                        transition: 'box-shadow 0.3s ease, background-color 0.3s ease',
                    });
                    glowContainer4.appendChild(rect);
                }

                speedometer.appendChild(glowContainer4);
            }

            // Position the glow container to the left or right side based on toggle
            const barLeftPos = parseFloat(positions.nos.left);
            const leftOffset = data.imagePositionRight ? barLeftPos + 7 : barLeftPos - 5;

            Object.assign(glowContainer4.style, {
                top: positions.nos.top,
                left: `${leftOffset}%`,
                display: (data.purgeMode || data.nosActiveLevel === 0) ? 'none' : 'flex',
            });

            // Update rectangles based on nosActiveLevel
            const activeLevel = data.nosActiveLevel || 0;
            glowContainer4.querySelectorAll('.nos-glow-rect-type4').forEach(rect => {
                const index = parseInt(rect.dataset.index, 10);
                if (index <= activeLevel) {
                    rect.style.boxShadow = data.isRunning == 1 ? `0 0 1vh 0.2vh ${data.nosMarkerLight}` : 'none';
                    rect.style.backgroundColor = data.isRunning == 1 ? data.nosMarkerLight : 'rgba(50, 50, 50)';
                } else {
                    rect.style.boxShadow = 'none';
                    rect.style.backgroundColor = data.isRunning == 1 ? data.nosMarker : 'rgba(50, 50, 50)';
                }
            });
        } else {
            // Hide nos elements if not available
            const nosBarContainer = document.getElementById('nos-bar-container');
            if (nosBarContainer) {
                nosBarContainer.style.display = 'none';
            }
            const nosImg = document.getElementById('nos-image');
            if (nosImg) {
                nosImg.style.display = 'none';
            }
            const glowContainer4 = document.getElementById('nos-glow-container-type4');
            if (glowContainer4) {
                glowContainer4.style.display = 'none';
            }
        }


       // Add gear display to left of fuel bar
        let gearDisplayNew = document.getElementById('gear-display-bar');
        if (!gearDisplayNew) {
            gearDisplayNew = document.createElement('div');
            gearDisplayNew.id = 'gear-display-bar';
            gearDisplayNew.style.position = 'absolute';
            gearDisplayNew.style.fontFamily = data.font;
            gearDisplayNew.style.fontSize = '1.8vh';
            gearDisplayNew.style.width = '5vh'; // set a width so textAlign can work
            // Position it relative to the rpm bar
            gearDisplayNew.style.left = `${parseFloat(positions.rpm.left) -43}%`;
            gearDisplayNew.style.top = positions.rpm.top;

            gearDisplayNew.style.textAlign = 'right';         // ensures text aligns to the right
            gearDisplayNew.style.transformOrigin = 'right';    // scales/grows from the right side
            speedometer.appendChild(gearDisplayNew);
        }
        gearDisplayNew.textContent = data.isPlane ? data.rpm : data.gear;
        gearDisplayNew.style.color = data.isRunning === 1 ? data.TextColour : 'rgba(50,50,50,1)';
        gearDisplayNew.style.transform = 'scale(1)'; // adjust scale value dynamically as needed

    } else if (needleType === 5) {

        const position = data.SpeedLocation || { top: '80%', left: '21%' };

        // Clear existing styles
        ['speedometer', 'speedometer-needle', 'rpm-meter', 'fuel-meter', 'nos-meter'].forEach(id => {
            const el = document.getElementById(id);
            if (el) el.style.display = 'none';
        });

        // Container for minimal speedo
        let minimalContainer = document.getElementById('minimal-speedo');
        if (!minimalContainer) {
            minimalContainer = document.createElement('div');
            minimalContainer.id = 'minimal-speedo';
            minimalContainer.style.opacity = '1';
            minimalContainer.style.display = 'block';
            minimalContainer.style.position = 'absolute';
            minimalContainer.style.flexDirection = 'column';
            minimalContainer.style.alignItems = 'flex-end';
            document.body.appendChild(minimalContainer);
        }
        minimalContainer.style.top = position.top;
        minimalContainer.style.left = position.left;
        minimalContainer.style.transform = 'translate(-50%, -50%)';
        minimalContainer.style.fontFamily = data.font;

        // Speed and Gear Display
        let speedGearContainer = document.getElementById('speed-gear-container');
        if (!speedGearContainer) {
            speedGearContainer = document.createElement('div');
            speedGearContainer.id = 'speed-gear-container';
            speedGearContainer.style.display = 'flex';
            speedGearContainer.style.alignItems = 'baseline';
            speedGearContainer.style.gap = '0.8vh';

            const speedElem = document.createElement('div');
            speedElem.id = 'minimal-speed';
            Object.assign(speedElem.style, {
                fontSize: data.digitalSpeedSize || '3vh',
                color: data.isRunning === 1 ? data.digitalSpeedCol : 'rgba(50,50,50,1)',
                textAlign: 'left',
                whiteSpace: 'nowrap',
                width: '5.5vh',
            });
            speedGearContainer.appendChild(speedElem);

            const mphElem = document.createElement('div');
            mphElem.textContent = '';
            mphElem.style.fontSize = '1.5vh';
            mphElem.style.opacity = '0.7';
            speedGearContainer.appendChild(mphElem);

            const gearElem = document.createElement('div');
            gearElem.id = 'minimal-gear';
            gearElem.style.fontSize = '2vh';
            gearElem.style.minWidth = '3vh';
            gearElem.style.textAlign = 'left';
            gearElem.style.marginTop = '1vh';
            gearElem.style.flexShrink = '0';
            speedGearContainer.appendChild(gearElem);

            minimalContainer.appendChild(speedGearContainer);
        }
        document.getElementById('minimal-speed').textContent = Math.floor(data.speed);
        document.getElementById('minimal-speed').style.color = data.isRunning === 1 ? data.digitalSpeedCol : 'rgba(50,50,50,1)';
        document.getElementById('minimal-gear').textContent = data.isPlane === 1 ? data.rpm : data.gear;
        document.getElementById('minimal-gear').style.color = data.isRunning === 1 ? data.TextColour : 'rgba(50,50,50,1)';

        // Horizontal bars container
        const bars = ['fuel', 'nos'];
        bars.forEach(barType => {
            const barContainerId = `minimal-${barType}-bar-container`;
            let barContainer = document.getElementById(barContainerId);

            // HIDE/REMOVE NOS if not available
            if (barType === 'nos' && !data.hasNos) {
                if (barContainer) barContainer.style.display = 'none';
                return;
            }

            if (!barContainer) {
                barContainer = document.createElement('div');
                barContainer.id = barContainerId;
                Object.assign(barContainer.style, {
                    width: '10vh',
                    height: '0.8vh',
                    marginTop: '0.6vh',
                    backgroundColor: data[`${barType}DigitalBack`] || 'rgba(255,255,255,0.3)',
                    borderRadius: '0.3vh',
                    position: 'relative',
                    display: 'block',
                });

                const activeBar = document.createElement('div');
                activeBar.id = `${barContainerId}-active`;
                Object.assign(activeBar.style, {
                    height: '100%',
                    borderRadius: '0.3vh',
                    backgroundColor: data[`${barType}NeedleCol`] || 'rgba(255,255,255,0.9)',
                    width: '0%',
                });

                barContainer.appendChild(activeBar);
                minimalContainer.appendChild(barContainer);
            } else {
                barContainer.style.display = 'block'; // ensure it’s visible again if was hidden before
            }

            const activeBar = document.getElementById(`${barContainerId}-active`);
            const currentValue = Math.min(data[barType], 100);
            activeBar.style.width = `${currentValue}%`;

            if (barType === 'nos' && data.nosActive) {
                activeBar.style.backgroundColor = data.nosNosActive || 'rgba(255,0,0,1)';
            } else {
                activeBar.style.backgroundColor = data[`${barType}NeedleCol`] || 'rgba(255,255,255,0.9)';
            }
        });
    }
}

function updateArcAngle(canvasId, current, max, data) {
    var currentAngle = "";
    if (canvasId === 'speedArc') {
        if (current <= 6.5 ) { current = 6.5 }
        currentAngle = speedArcAngle;
    }
    if (canvasId === 'fuelArc') {
        if (current <= 6.5 ) { current = 6.5 }
        currentAngle = fuelArcAngle;
    }
    if (canvasId === 'rpmArc') {
        if (current <= 0.1 ) { current = 0.1 }
        currentAngle = rpmArcAngle;
    }
    if (canvasId === 'nosArc') {
        if (current <= 6.5 ) { current = 6.5 }
        currentAngle = nosArcAngle;
    }

    currentAngle.target = ((current / max) * 1.5 * Math.PI) + (Math.PI * 0.75);
    requestAnimationFrame(() => animateArc(canvasId, currentAngle, data));
}

const transitionSpeed = 0.05;
function animateArc(canvasId, angleState, data) {
    const angleDifference = angleState.target - angleState.current;
    if (Math.abs(angleDifference) < 0.01) {
        angleState.current = angleState.target;
    } else {
        angleState.current += angleDifference * transitionSpeed;
        requestAnimationFrame(() => animateArc(canvasId, angleState, data));
    }
    drawArcWithAngle(canvasId, angleState, data);
}

function adjustCanvas(canvasId, containerId) {
    var leftOffset = 4.25;
    var topOffset = 2.5;
    const container = document.getElementById(containerId);
    const canvas = document.getElementById(canvasId);
    if (!container || !canvas) return;
    const sizeRatio = 0.9;
    const width = container.offsetWidth * sizeRatio;
    const height = container.offsetHeight * sizeRatio;

    canvas.width = width;
    canvas.height = height;

    canvas.style.position = 'absolute';
    const offsetX = (container.offsetWidth - width) / 2 + leftOffset;
    const offsetY = (container.offsetHeight - height) / 2 + topOffset;
    canvas.style.left = `${offsetX}px`;
    canvas.style.top = `${offsetY}px`;
}

let centerXOffset = 0;
let centerYOffset = 0;
function drawArcWithAngle(canvasId, angleState, data) {
    //console.log(JSON.stringify(data, null, 2));
    const canvas = document.getElementById(canvasId);
    if (!canvas || !canvas.getContext) return;
    const ctx = canvas.getContext('2d');
    const size = Math.min(canvas.width, canvas.height);
    ctx.clearRect(0, 0, size, size);
    const centerX = size / 2;
    const centerY = size / 2;
    const radius = size * 0.44;

    // Adjust the start and end angles
    const startAngle = Math.PI * 0.8; // slightly larger than 0.75 to lower the left side
    const endAngle = Math.PI * 2.2; // slightly smaller than 2.25 to raise the right side

    let arcFrontCol = null;
    let arcBackCol = null;
    if (canvasId === 'speedArc') {
        arcFrontCol = data.nosActive ? data.SpeedNosActive : data.SpeedNeedleCol;
        arcBackCol = data.SpeedDigitalBack;
        arcShadow = data.SpeedNeedleShadowCol;
    }
    if (canvasId === 'fuelArc') {
        arcFrontCol = data.nosActive ? data.fuelNosActive : data.fuelNeedleCol;
        arcBackCol = data.fuelDigitalBack;
        arcShadow = data.rpmNeedleShadowCol;
    }
    if (canvasId === 'rpmArc') {
        arcFrontCol = data.nosActive ? data.rpmNosActive : data.rpmNeedleCol;
        arcBackCol = data.rpmDigitalBack;
        arcShadow = data.fuelNeedleShadowCol;
    }
    if (canvasId === 'nosArc') {
        arcFrontCol = data.nosActive ? data.nosNosActive : data.nosNeedleCol;
        arcBackCol = data.nosDigitalBack;
        arcShadow = data.nosNeedleShadowCol;
    }

    // Draw the background arc
    ctx.beginPath();
    ctx.arc(centerX, centerY, radius, startAngle, endAngle, false);
    ctx.strokeStyle = data.isRunning == 1 ? arcBackCol : 'rgba(50, 50, 50)';
    ctx.lineWidth = size * 0.1;
    ctx.setLineDash([3, 3]);

    ctx.shadowColor = data.isRunning == 1 ? arcShadow : 'rgba(0,0,0,0.0)';            // shadow color and transparency
    ctx.shadowBlur = 1;                   // how blurry the shadow is
    ctx.stroke();

    // Draw the "needle" arc
    ctx.beginPath();
    ctx.arc(centerX, centerY, radius, startAngle, angleState.current, false);
    ctx.strokeStyle = data.isRunning == 1 ? arcFrontCol : 'rgba(50, 50, 50)';
    ctx.filter = 'blur(0.5px)';
    ctx.stroke();
    ctx.filter = 'none';
}

function animateNeedle(needleId, needleState) {
    const needle = document.getElementById(needleId);
    if (!needle) return;
    needleState.current += (needleState.target - needleState.current) * 0.01;
    needle.style.transform = `rotate(${needleState.current}deg)`;
    if (Math.abs(needleState.current - needleState.target) > 0.01) {
        requestAnimationFrame(() => animateNeedle(needleId, needleState));
    }
}

function calculateNeedleAngle(currentValue, maxValue) { return ((currentValue / maxValue) * 268) - 135; }

let oldMax = 0;
function createSpeedMarkers(data) {
    if (oldMax === data.maxSpeed) return;
    oldMax = data.maxSpeed;
    const remainder = data.maxSpeed % 100;
    if ([10, 30, 50, 70, 90].includes(remainder)) {
        //data.maxSpeed += 10;
    }
    const mainInterval = 10;
    const smallInterval = 2
    const totalMainMarkers = Math.floor(data.maxSpeed / mainInterval);
    const totalSmallMarkers = Math.floor(data.maxSpeed / smallInterval);
    const startAngle = 225.5;
    const endAngle = startAngle - 268;
    document.querySelectorAll('.number-container').forEach(marker => marker.remove());
    const angleIncrementSmall = (endAngle - startAngle) / totalSmallMarkers;

    for (let i = 0; i <= totalSmallMarkers; i++) {
        const speed = i * smallInterval;
        const angle = startAngle - (angleIncrementSmall * i);
        if (speed % mainInterval === 0) {
            createMarker(speed, angle, data, i, false);
        } else {
            createMarker(speed, angle, data, i, true);
        }
    }
}

function createMarker(speed, angle, data, index, isSmallMarker) {
    const meter = document.getElementById('speedometer');
    const containerSize = meter.offsetWidth;
    const container = document.createElement('div');
    container.className = 'number-container';
    container.style.transform = `rotate(${angle}deg)`;
    container.style.transformOrigin = "center";
    container.style.position = 'absolute';
    container.style.left = '50%';
    container.style.top = '49%';

    const baseDistanceFromCenter = (containerSize / 2) * 0.9;
    const marker = document.createElement('span');
    marker.style.position = 'absolute';
    marker.style.left = '50%';

    const shouldBeHigh = (data.highlights.speed && data.speed >= speed) || (data.highlights.high && speed >= (data.maxSpeed * 0.8));
    marker.style.backgroundColor = data.isRunning != 1 ? 'rgba(50, 50, 50, 1.0)' : (shouldBeHigh ? (data.MarkerColourHigh || 'rgba(255, 0, 0, ' + data.BorderTrans + ')') : (data.MarkerColour || 'rgba(255, 255, 255, ' + data.BorderTrans + ')'));
    if (isSmallMarker) {
        marker.className = shouldBeHigh ? 'marker smaller-marker marker-high' : 'marker smaller-marker';
        marker.style.bottom = `${baseDistanceFromCenter}px`;
        marker.style.transform = `translateX(-50%)`;
    } else {
        marker.className = shouldBeHigh ? 'marker marker-high' : 'marker';
        const extendedDistance = baseDistanceFromCenter * 0.05;
        marker.style.bottom = `${baseDistanceFromCenter - extendedDistance}px`;
        marker.style.transform = `translateX(-50%)`;
        const numberDistance = baseDistanceFromCenter * 0.25;

        const number = document.createElement('div');
        number.textContent = speed % 20 === 0 ? `${speed}` : '';
        number.style.fontSize = data.maxSpeed >= 300 ? data.TextSize.replace("vh", "") *0.75+"vh" : data.TextSize;
        number.style.position = 'absolute';
        number.style.fontFamily = data.font;
        number.style.left = '50%';
        number.style.transform = `translateX(-50%) translateY(-${baseDistanceFromCenter - numberDistance}px) rotate(-${angle}deg)`;
        number.style.transformOrigin = '60% 30%';
        number.className = shouldBeHigh ? 'speed-number high-speed' : 'speed-number';
        number.style.color = data.isRunning != 1 ? 'rgba(50, 50, 50, 1.0)' : (shouldBeHigh ? (data.ColourHigh || 'rgba(255, 0, 0)') : (data.TextColour || 'rgba(255, 255, 255)'));
        number.style.textShadow = '0 0 3px #000000, 0 0 5px #000000';
        container.appendChild(number);
    }
    container.appendChild(marker);
    meter.appendChild(container);
}

function createRpmMarkers(data) {
    if (markersMade != true) {
        const rpmMeter = document.getElementById('rpm-meter');
        rpmMeter.querySelectorAll('.rpm-number-container').forEach(el => el.remove());
        const maxRpmValue = data.rpmMeterSize.replace("vh", "") > 10 ? 12 : 6;
        const interval = 1;
        const totalMarkers = maxRpmValue / interval;
        const startAngle = 226.5;
        const endAngle = startAngle + 268;
        for (let i = 0; i <= totalMarkers; i++) {
            const rpm = i * interval;
            const angle = ((rpm / maxRpmValue) * (endAngle - startAngle)) + startAngle;
            createRpmMarker(rpm, angle, maxRpmValue, data);
        }
    }
}
function createRpmMarker(rpm, angle, max, data) {
    const rpmMeter = document.getElementById('rpm-meter');
    const containerSize = rpmMeter.offsetWidth;
    const container = document.createElement('div');
    container.className = 'rpm-number-container';
    container.style.transform = `rotate(${angle}deg)`;
    container.style.transformOrigin = "center";
    container.style.position = 'absolute';
    container.style.left = '50%';
    container.style.top = '49%';

    const baseDistanceFromCenter = (containerSize / 2) * 0.85;
    const marker = document.createElement('span');
    marker.style.left = '50%';

    const isLastTwo = rpm === max - 1 || rpm === max;
    marker.className = isLastTwo ? 'rpm-marker marker-high' : 'rpm-marker';
    marker.style.backgroundColor = data.isRunning != 1 ? 'rgba(50, 50, 50, 1.0)' : (isLastTwo ? (data.MarkerColourHigh || 'rgba(255, 0, 0, ' + data.BorderTrans + ')') : (data.MarkerColour || 'rgba(255, 255, 255, ' + data.BorderTrans + ')'));
    marker.style.bottom = `${baseDistanceFromCenter}px`;
    marker.style.transform = `translateX(-50%)`;
    marker.style.position = 'absolute';
    marker.style.width = rpmMeter.style.height.replace("vh", "") * 0.02 + "vh";
    marker.style.height = rpmMeter.style.height.replace("vh", "") * 0.05 + "vh";
    container.appendChild(marker);
    rpmMeter.appendChild(container);
}

function createFuelMarkers(data) {
    if (markersMade != true) {
        const fuelMeter = document.getElementById('fuel-meter');
        fuelMeter.querySelectorAll('.fuel-number-container').forEach(el => el.remove());
        const maxFuelValue = 10;
        const interval = 1;
        const totalMarkers = maxFuelValue / interval;
        const startAngle = 226.5;
        const endAngle = startAngle + 268;
        for (let i = 0; i <= totalMarkers; i++) {
            const fuel = i * interval;
            const angle = ((fuel / maxFuelValue) * (endAngle - startAngle)) + startAngle;
            createFuelMarker(fuel, angle, data);
        }
    }
}
function createFuelMarker(fuel, angle, data) {
    const fuelMeter = document.getElementById('fuel-meter');
    const containerSize = fuelMeter.offsetWidth;
    const container = document.createElement('div');
    container.className = 'fuel-number-container';
    container.style.transform = `rotate(${angle}deg)`;
    container.style.transformOrigin = "center";
    container.style.position = 'absolute';
    container.style.left = '50%';
    container.style.top = '49%';

    const baseDistanceFromCenter = (containerSize / 2) * 0.85;
    const marker = document.createElement('span');
    marker.style.left = '50%';
    marker.style.zIndex = 0;
    const isLastTwo = fuel === 0 || fuel === 1 || fuel === 2;
    marker.style.backgroundColor = data.isRunning != 1 ? 'rgba(50, 50, 50, 1.0)' : (isLastTwo ? (data.MarkerColourHigh || 'rgba(255, 0, 0, ' + data.BorderTrans + ')') : (data.MarkerColour || 'rgba(255, 255, 255, ' + data.BorderTrans + ')'));
    marker.style.bottom = `${baseDistanceFromCenter}px`;
    marker.style.transform = `translateX(-50%)`;
    marker.style.position = 'absolute';
    marker.style.width = fuelMeter.style.height.replace("vh", "") * 0.02 + "vh";
    marker.style.height = fuelMeter.style.height.replace("vh", "") * 0.05 + "vh";
    container.appendChild(marker);
    fuelMeter.appendChild(container);
}

function createNosMarkers(data) {
    if (markersMade != true) {
        const nosMeter = document.getElementById('nos-meter');
        nosMeter.querySelectorAll('.nos-number-container').forEach(el => el.remove());
        const maxNosValue = 10;
        const interval = 1;
        const totalMarkers = maxNosValue / interval;
        const startAngle = 226.5;
        const endAngle = startAngle + 268;
        for (let i = 0; i <= totalMarkers; i++) {
            const nos = i * interval;
            const angle = ((nos / maxNosValue) * (endAngle - startAngle)) + startAngle;
            createNosMarker(nos, angle, data);
        }
    }
}
function createNosMarker(nos, angle, data) {
    const nosMeter = document.getElementById('nos-meter');
    const containerSize = nosMeter.offsetWidth;
    const container = document.createElement('div');
    container.className = 'nos-number-container';
    container.style.transform = `rotate(${angle}deg)`;
    container.style.transformOrigin = "center";
    container.style.position = 'absolute';
    container.style.left = '50%';
    container.style.top = '49%';

    const baseDistanceFromCenter = (containerSize / 2) * 0.85;
    const marker = document.createElement('span');
    marker.style.left = '50%';
    marker.style.zIndex = 0;
    const isLastTwo = nos === 0 || nos === 1;
    marker.style.backgroundColor = data.isRunning != 1 ? 'rgba(50, 50, 50, 1.0)' : (isLastTwo ? (data.MarkerColourHigh || 'rgba(255, 0, 0, ' + data.BorderTrans + ')') : (data.MarkerColour || 'rgba(255, 255, 255, ' + data.BorderTrans + ')'));
    marker.style.bottom = `${baseDistanceFromCenter}px`;
    marker.style.transform = `translateX(-50%)`;
    marker.style.position = 'absolute';
    marker.style.width = nosMeter.style.height.replace("vh", "") * 0.02 + "vh";
    marker.style.height = nosMeter.style.height.replace("vh", "") * 0.05 + "vh";
    container.appendChild(marker);
    nosMeter.appendChild(container);
    markersMade = true;
}