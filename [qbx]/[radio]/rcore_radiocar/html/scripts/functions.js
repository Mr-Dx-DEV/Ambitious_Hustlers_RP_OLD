function isReady(soundName) {
    const sound = soundList[soundName];
    if (sound == null) {
        return;
    }
    if (sound.loaded() == false) {
        sound.setLoaded(true);

        const time = sound.audioElement.duration;
        if (sound.isDynamic()) sound.setVolume(0);
        if (!sound.isDynamic()) sound.setVolume(sound.getVolume());

        $.post('https://rcore_radiocar/data_status', JSON.stringify({
            time: time,
            type: "maxDuration",
            id: sound.getName(),
        }));

        $.post('https://rcore_radiocar/events', JSON.stringify({
            type: "onPlay",
            id: sound.getName(),
        }));

        if (sound.isYoutube) {
            sound.isYoutubeReady(true);
        }

        updateVolumeWithNewCache();
    }
}

function ended(soundName) {
    const sound = soundList[soundName];
    if (sound == null) {
        return;
    }
    if (!sound.isPlaying()) {
        if (sound.isLoop()) {
            const time = sound.audioElement.duration;

            sound.setTimeStamp(0);
            sound.play();

            $.post('https://rcore_radiocar/events', JSON.stringify({
                type: "resetTimeStamp",
                id: sound.getName(),
                time: time,
            }));
        }

        $.post('https://rcore_radiocar/data_status', JSON.stringify({
            type: "finished",
            id: soundName
        }));
        $.post('https://rcore_radiocar/events', JSON.stringify({
            type: "onEnd",
            id: sound.getName(),
        }));
    }
}

function SanitizeURL(UserURL) {
    // This DOMPurify + replace should be useless with the code thats below
    // but honestly this is just for my sanity to make double sure.
    UserURL = DOMPurify.sanitize(UserURL);
    UserURL = UserURL.replace(/<[^>]*>?/gm, '');

    const allowedProtocols = new Set([ "http:", "https:" ]);

    try {
        const url = new URL(UserURL);
        if (allowedProtocols.has(url.protocol)) {
            return url.href;
        }
    } catch (error) {
        console.log("UserURL:", UserURL)
        console.log(error);
    }
    return "";
}