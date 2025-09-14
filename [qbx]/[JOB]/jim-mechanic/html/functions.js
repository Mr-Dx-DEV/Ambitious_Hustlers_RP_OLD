function fadeIn(element) {
    var hud = document.getElementById(element);
    if (!hud) return; // Exit if element not found

    hud.style.display = 'flex';

    var opacity = 0;
    if (parseFloat(hud.style.opacity || 0) < 1) {
        var fadeInInterval = setInterval(function() {
            if (opacity < 1) {
                opacity += 0.05;
                hud.style.opacity = opacity;
            } else {
                clearInterval(fadeInInterval);
            }
        }, 0);
    }
}

function fadeOut(element) {
    var hud = document.getElementById(element);
    if (!hud) return;

    var opacity = 1;
    if (parseFloat(hud.style.opacity || 1) > 0) {
        var fadeOutInterval = setInterval(function() {
            if (opacity > 0) {
                opacity -= 0.05;
                hud.style.opacity = opacity;
            } else {
                hud.style.display = 'none';
                clearInterval(fadeOutInterval);
            }
        }, 0);
    }
}

function slowFadeOut(element) {
    var hud = document.getElementById(element);
    if (!hud) return;

    var opacity = 1;
    if (parseFloat(hud.style.opacity || 1) > 0) {
        var fadeOutInterval = setInterval(function() {
            if (opacity > 0) {
                opacity -= 0.01;
                hud.style.opacity = opacity;
            } else {
                hud.style.display = 'none';
                clearInterval(fadeOutInterval);
            }
        }, 0);
    }
}
