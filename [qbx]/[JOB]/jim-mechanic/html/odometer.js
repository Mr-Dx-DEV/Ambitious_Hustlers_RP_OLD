let componentVisibility = {
    engine: true,
    body: true,
    axle: true,
    battery: true,
    oil: true,
    spark: true,
    fuel: true,
    nos: true,
    purge: true,
    headlight: true,
    seatbelt: true,
    harness: true,
    underglow: true,
    manual: true,
    doors: true,
    wheel: true,
    antilag: true,
    lowfuel: true,
};

function drawCanvasIcon(canvasId, imageName, color, glow, running, data, r, g, b) {
    const canvas = document.getElementById(canvasId);
    const ctx = canvas.getContext('2d');
    const img = preloadedImages[imageName];

    ctx.clearRect(0, 0, canvas.width, canvas.height);
    if (glow) {
        ctx.filter = 'blur(5px)';
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        ctx.filter = 'none';
    }
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    ctx.globalCompositeOperation = 'source-atop';
    if (data.damageColor) {
        ctx.fillStyle = running ? data.damageColor : 'rgba(50, 50, 50)';
    } else {
        ctx.fillStyle = running ? color : 'rgba(50, 50, 50)';
    }
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.globalCompositeOperation = 'source-over';
}

function updateHUD(data) {
    if (!hudInitialized){
        fadeIn("hud");
        hudInitialized = true
    }
    var positionPercent = data.positionPercent || { top: 10, left: 10 };
    var size = data.isVisible ? data.size : { width: 0, depth: 0 };
    var underLights = data.underLights;
    var underCol = data.underCol || 'rgba(255, 255, 255, 1.0)';

    componentVisibility[data.canvasId.replace('Canvas', '').toLowerCase()] = data.isVisible;
    var hud = document.getElementById('hud');
    hud.style.top = `${(positionPercent.top / 100) * window.innerHeight}px`;
    hud.style.left = `${(positionPercent.left / 100) * window.innerWidth}px`;
    hud.style.backgroundColor = data.bgColor;
    hud.style.boxShadow = data.boxShadow;
    hud.style.border = `${data.borderWidth} solid ${data.borderColor}`
    hud.style.borderRadius = data.cornerRadius;

    updateCanvasContainer(data)
    var canvas = document.getElementById(data.canvasId);
    var ctx = canvas.getContext('2d');

    if (canvas) {
        canvas.width = window.innerHeight * (size / 10);
        canvas.height = window.innerHeight * (size / 10);
    }
    if (data.isVisible) {
        var minRGB = data.iconColorMin.match(/\d+/g).map(Number);
        var maxRGB = data.iconColorMax.match(/\d+/g).map(Number);

        var red = Math.round(minRGB[0] + (maxRGB[0] - minRGB[0]) * data.health / 1000);
        var green = Math.round(minRGB[1] + (maxRGB[1] - minRGB[1]) * data.health / 1000);
        var blue = Math.round(minRGB[2] + (maxRGB[2] - minRGB[2]) * data.health / 1000);

        if (data.canvasId === 'manualCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                'rgba(255, 255, 255)',
                data.iconGlow, true, data
            );

        } else if (data.canvasId === 'doorsCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                data.iconColorMin,
                data.iconGlow, true, data
            );

        } else if (data.canvasId === 'purgeCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                data.purgeColor,
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'antilagCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                data.iconColorMax,
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'wheelCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                data.iconColorMin,
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'headlightCanvas') {
            drawCanvasIcon(data.canvasId, data.headlightToggle ? 'headlight2' : 'headlight1',
                data.headlightColor ? data.headlightColor : 'rgba(255,255,255)',
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'seatbeltCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                data.seatbeltToggle ? data.iconColorMax : data.iconColorMin,
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'harnessCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
            data.harnessToggle ? data.iconColorMax : data.iconColorMin,
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'lowfuelCanvas') {
            drawCanvasIcon(data.canvasId, data.canvasId.replace('Canvas', '').toLowerCase(),
                'rgba(255, 102, 0, 1.0)',
                data.iconGlow, data.isRunning == 1, data
            );

        } else if (data.canvasId === 'underglowCanvas') {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            const drawAndApplyColor = (image, condition, color, ctx) => {
                let offscreenCanvas = document.createElement('canvas');
                offscreenCanvas.width = canvas.width;
                offscreenCanvas.height = canvas.height;
                let offCtx = offscreenCanvas.getContext('2d');

                offCtx.drawImage(image, 0, 0, offscreenCanvas.width, offscreenCanvas.height);
                offCtx.fillStyle = data.isRunning == 1 ? color : 'rgba(50, 50, 50)';

                if (condition == "1") {
                    offCtx.filter = 'blur(5px)';
                    offCtx.drawImage(image, 0, 0, offscreenCanvas.width, offscreenCanvas.height);
                    offCtx.filter = 'none';
                    offCtx.globalCompositeOperation = 'source-atop';
                    offCtx.fillStyle = data.isRunning == 1 ? color : 'rgba(50, 50, 50)';
                    offCtx.fillRect(0, 0, offscreenCanvas.width, offscreenCanvas.height);
                    offCtx.globalCompositeOperation = 'source-over';
                } else {
                    offCtx.drawImage(image, 0, 0, offscreenCanvas.width, offscreenCanvas.height);
                    offCtx.filter = 'none';
                    offCtx.globalCompositeOperation = 'source-atop';
                    offCtx.fillStyle = data.isRunning == 1 ? 'rgba(150, 150, 150)' : 'rgba(50, 50, 50)';
                    offCtx.fillRect(0, 0, offscreenCanvas.width, offscreenCanvas.height);
                    offCtx.globalCompositeOperation = 'source-over';
                }
                ctx.drawImage(offscreenCanvas, 0, 0);
            };

            let underglowParts = [
                { image: preloadedImages["underglow1"], condition: underLights.left },
                { image: preloadedImages["underglow2"], condition: underLights.right },
                { image: preloadedImages["underglow3"], condition: underLights.back },
                { image: preloadedImages["underglow4"], condition: underLights.front }
            ];

            underglowParts.forEach(part => {
                drawAndApplyColor(part.image, part.condition, underCol, ctx);
            });

        } else {
            drawCanvasIcon(
                data.canvasId,
                data.canvasId.replace('Canvas', '').toLowerCase(),
                'rgba('+red+','+green+','+blue+')',
                data.iconGlow,
                data.isRunning == 1,
                data
            );
        }
    }

    var mileageTextElement = document.getElementById('mileageText');
    if (mileageTextElement && data.showMilage) {
        mileageTextElement.innerText = data.isRunning == 1 ? data.mileageText: '000000';
        mileageTextElement.style.fontFamily = data.font;
        mileageTextElement.style.fontSize = data.mileageText !== "" ? data.mileagetextSize : '0px';
        mileageTextElement.style.color = data.isRunning == 1 ? data.mileagetextColor : 'rgba(50, 50, 50)';
        mileageTextElement.style.textShadow = data.isRunning == 1 ? data.mileagetextGlow : null;
        mileageTextElement.style.padding = data.mileageText !== "" ? '1.1% 2px' : '0px 0px';
        mileageTextElement.style.paddingTop = '9px';
        mileageTextElement.style.marginRight = "1px";
        mileageTextElement.style.marginBottom = "5px";
        if (data.iconBoxShadow) {
            mileageTextElement.style.borderRadius = data.iconBoxShadowCorners;
            mileageTextElement.style.boxShadow = data.iconBoxShadowStyle;
        }
    }
    if (data.iconBoxShadow) {
        canvas.style.borderRadius = data.iconBoxShadowCorners;
        canvas.style.boxShadow = data.iconBoxShadowStyle;
    }
    checkAndToggleHUDVisibility(data);
}

function checkAndToggleHUDVisibility(data) {
    const allInvisible = Object.values(componentVisibility).every(isVisible => !isVisible);
    const mileageTextElement = document.getElementById('mileageText');
    const hud = document.getElementById('hud');
    if (allInvisible && !mileageTextElement.innerText) {
        hud.style.display = 'none';
    } else {
        hud.style.display = 'flex';
    }
}

function updateCanvasContainer(data) {
    var containerName = data.canvasId.replace('Canvas', 'Container');
    var container = document.getElementById(containerName);
    var textElement = container.querySelector('.canvas-text');
    if (textElement) {
        if (data.isVisible === true) {
            textElement.innerText = data.inlayText || '';
            textElement.style.fontFamily = data.font;
            textElement.style.fontSize = data.inlayTextSize;
            textElement.style.color = data.isRunning == 1 ? data.inlayTextColor : 'rgba(0,0,0,0)';
            textElement.style.textShadow = data.isRunning == 1 ? data.inlayTextGlow : null;

            textElement.style.top = data.inlayTextPosition.top;
            textElement.style.left = data.inlayTextPosition.left;
        } else {
            textElement.innerText = '';
            textElement.style.fontSize = '0vh';
        }
    }
}