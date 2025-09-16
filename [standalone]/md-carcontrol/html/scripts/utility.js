function rgbToHex(r, g, b) {
    return "#" + ((1 << 24) | (r << 16) | (g << 8) | b).toString(16).slice(1).toUpperCase();
}

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function makeCall(event, data) {
    const response = await fetch(`https://${GetParentResourceName()}/${event}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify(data)
    });

    return await response.json(); 
}

function getCurrentScale(ui) {
  let match = ui.style.transform.match(/scale\(([^)]+)\)/);
  return match ? parseFloat(match[1]) : 1;
}