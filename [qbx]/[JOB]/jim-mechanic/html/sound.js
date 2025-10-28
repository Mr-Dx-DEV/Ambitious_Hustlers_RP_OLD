// sound.js — minimal hard distance gate, no looping, keep html5:true
var audioPlayer;
var sourcePos = { x: 0, y: 0, z: 0 };
var audioMaxDist = 30;
var baseVol = 0.35;

function num(v, d){ v = Number(v); return Number.isFinite(v) ? v : d; }
function clamp(v,a,b){ return Math.max(a, Math.min(b, v)); }

function play3DSound(soundfile, volume, coords, orientation, maxDistance) {
    if (audioPlayer) {
        audioPlayer.stop();
        audioPlayer.unload();
        audioPlayer = null;
    }

    baseVol      = clamp(num(volume, 0.35), 0, 1);
    sourcePos    = { x: num(coords?.x, 0), y: num(coords?.y, 0), z: num(coords?.z, 0) };
    audioMaxDist = num(maxDistance, 30);

    audioPlayer = new Howl({
        src: [String(soundfile || '')],
        volume: baseVol,
        html5: true,      // keep your current behaviour
        loop: false,      // <-- ensure no looping
        onplay: () => $.post(`https://${resourceName}/onStart`, JSON.stringify({ isSongPlaying: true })),
        onstop: () => $.post(`https://${resourceName}/onEnd`, JSON.stringify({ isSongPlaying: false })),
        onend:  () => $.post(`https://${resourceName}/onEnd`, JSON.stringify({ isSongPlaying: false })),
        onloaderror: () => $.post(`https://${resourceName}/onError`, JSON.stringify({ isSongPlaying: false })),
        onplayerror: () => $.post(`https://${resourceName}/onError`, JSON.stringify({ isSongPlaying: false })),
    });

    audioPlayer.pos(sourcePos.x, sourcePos.y, sourcePos.z);
    audioPlayer.orientation(num(orientation?.x,0), num(orientation?.y,0), num(orientation?.z,0));
    audioPlayer.pannerAttr({
        panningModel: 'equalpower',
        refDistance: 0.01,
        rolloffFactor: 40,
        distanceModel: 'linear'
    });

    audioPlayer.play();
}

// Listener position update with hard mute + fade
function updateListenerPosition(coords, orientation, isMute, maybeSourceCoord) {
    if (!audioPlayer) return;

    // Update moving source (entity-follow) if provided
    if (maybeSourceCoord) {
        sourcePos = {
            x: num(maybeSourceCoord.x, sourcePos.x),
            y: num(maybeSourceCoord.y, sourcePos.y),
            z: num(maybeSourceCoord.z, sourcePos.z),
        };
        // No-op in html5 mode but harmless:
        audioPlayer.pos(sourcePos.x, sourcePos.y, sourcePos.z);
    }

    const lx = num(coords?.x, 0), ly = num(coords?.y, 0), lz = num(coords?.z, 0);
    const dx = sourcePos.x - lx,   dy = sourcePos.y - ly,   dz = sourcePos.z - lz;
    const d  = Math.sqrt(dx*dx + dy*dy + dz*dz);

    const hardMute = !!isMute || !Number.isFinite(d) || d >= audioMaxDist;
    audioPlayer.mute(hardMute);

    if (!hardMute) {
        // gentle linear fade inside the range
        const k = clamp((audioMaxDist - d) / audioMaxDist, 0, 1);
        audioPlayer.volume(baseVol * k);
    }
}
