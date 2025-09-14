
var audioPlayer;

function play3DSound(soundfile, volume, coords, orientation) {
    if (audioPlayer != null) {
        audioPlayer.stop();
        audioPlayer.unload();
        audioPlayer = null;
    }

    audioPlayer = new Howl({
        src: [soundfile],
        volume: volume,
        html5: true,
        onplay: function () {
            $.post(`https://${resourceName}/onStart`, JSON.stringify({
                isSongPlaying: true
            }));
        },
        onstop: function () {
            $.post(`https://${resourceName}/onEnd`, JSON.stringify({
                isSongPlaying: false
            }));
        },
        onend: function () {
            $.post(`https://${resourceName}/onEnd`, JSON.stringify({
                isSongPlaying: false
            }));
        },
        onloaderror: function () {
            $.post(`https://${resourceName}/onError`, JSON.stringify({
                isSongPlaying: false
            }));
        },
        onplayerror: function () {
            $.post(`https://${resourceName}/onError`, JSON.stringify({
                isSongPlaying: false
            }));
        }
    });

    // Set 3D positional attributes
    audioPlayer.pos(coords.x, coords.y, coords.z);
    audioPlayer.orientation(orientation.x, orientation.y, orientation.z);
    audioPlayer.pannerAttr({
        panningModel: 'equalpower',
        refDistance: 0.01,
        rolloffFactor: 40,
        distanceModel: 'linear'
    });

    audioPlayer.play();
}

// Listener position update
function updateListenerPosition(coords, orientation, isMute) {
    Howler.pos(coords.x, coords.y, coords.z);
    Howler.orientation(orientation.x, orientation.y, orientation.z, 0, 1, 0);
    if (audioPlayer) audioPlayer.mute(isMute);
}