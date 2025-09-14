window.onload = preloadImages;

let preloadedImages = {};

function preloadImages() {
    const imagesToLoad =['engine', 'body', 'axle', 'battery', 'oil', 'spark',
        'nos', 'fuel', 'manual', 'doors', 'purge', 'antilag', 'wheel',
        'underglow1', 'underglow2', 'underglow3', 'underglow4',
        'headlight1', 'headlight2', 'seatbelt', 'harness', 'lowfuel', 'electric',];

    imagesToLoad.forEach((name) => {
        const img = new Image();
        img.onload = () => {
            preloadedImages[name] = img;
        };
        img.src = `img/${name}.png`;
    });
}

window.onload = preloadImages;