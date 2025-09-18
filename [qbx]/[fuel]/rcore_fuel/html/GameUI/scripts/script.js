var playerPos = [-90000,-90000,-90000];
var timerForUpdateVolume = null;
var intervalTimer = 100;
let CachedSoundPlayers = new Map();

let dispatchTable = {
    "play": function(item, soundPlayer){
        soundPlayer.Play();
    },

    "pause": function(item, soundPlayer){
        soundPlayer.Pause();
    },

    "volume": function(item, soundPlayer){
        soundPlayer.SetVolume(item.volume);
        if(item.update){
            if(soundPlayer.IsAudioLoaded()){
                if(soundPlayer.IsPlaying()){
                    soundPlayer.ChangeAudioHearableVolume(soundPlayer.GetPlayerDistanceFromSoundInPercentage());
                }
            }
        }
    },

    "timestamp": function(item, soundPlayer){
        soundPlayer.SetTimestamp(item.timestamp);
    },

    "distance": function(item, soundPlayer){
        soundPlayer.SetPlayingDistance(item.distance);
    },

    "positionSound": function(item, soundPlayer){
        soundPlayer.SetPlayingPosition(item.pos);
    },

    "resume": function(item, soundPlayer){
        soundPlayer.Resume();
    },

    "delete": function(item, soundPlayer){
        soundPlayer.Destroy();
        CachedSoundPlayers.delete(item.identifier);
    },

    "loop": function(item, soundPlayer){
        soundPlayer.SetLoop(item.loop);
    },

    "autoplay": function(item, soundPlayer){
        soundPlayer.SetAutoPlay(item.autoplay);
    },
}

function UpdateAllSoundVolume(){
    CachedSoundPlayers.forEach((soundPlayer, key) => {
        if(soundPlayer.IsAudioLoaded()){
            if(soundPlayer.IsPlaying()){
                soundPlayer.ChangeAudioHearableVolume(soundPlayer.GetPlayerDistanceFromSoundInPercentage());
            }
        }
    });
}

$(function(){
    $.post("https://rcore_fuel/init");
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "timer"){
            intervalTimer = item.time;
        }

        if(item.type === "muteAll"){
            clearInterval(timerForUpdateVolume);
            timerForUpdateVolume = null;

            CachedSoundPlayers.forEach((soundPlayer, key) => {
                if(soundPlayer.IsAudioLoaded()){
                    soundPlayer.ChangeAudioHearableVolume(0.0);
                    soundPlayer.Mute();
                }
            });
        }

        if(item.type === "unmuteAll"){
            CachedSoundPlayers.forEach((soundPlayer, key) => {
                if(soundPlayer.IsAudioLoaded()){
                    soundPlayer.ChangeAudioHearableVolume(0.0);
                    soundPlayer.UnMute();
                }
            });
            timerForUpdateVolume = setInterval(UpdateAllSoundVolume, intervalTimer);
        }

        if(item.type === "playerPosition"){
            playerPos = item.pos;
            return;
        }

        if(item.type === "create"){
            if(CachedSoundPlayers.has(item.identifier)){
                CachedSoundPlayers.get(item.identifier).Destroy();
                CachedSoundPlayers.delete(item.identifier);
            }

            let soundPlayer = new SoundPlayer();

            soundPlayer.SetLoop(item.loop);
            soundPlayer.SetSoundURL(item.URL);
            soundPlayer.SetIdentifier(item.identifier);
            soundPlayer.SetPlayingPosition(item.pos);
            soundPlayer.SetPlayingDistance(item.distance);
            soundPlayer.SetVolume(item.volume);
            soundPlayer.SetAutoPlay(item.autoplay);

            soundPlayer.CreateAudioHandler(item.silentEvent);

            CachedSoundPlayers.set(item.identifier, soundPlayer);
        }

        if(dispatchTable[item.type]){
            if(CachedSoundPlayers.has(item.identifier)){
                dispatchTable[item.type](item, CachedSoundPlayers.get(item.identifier));
            }
        }
	})
});