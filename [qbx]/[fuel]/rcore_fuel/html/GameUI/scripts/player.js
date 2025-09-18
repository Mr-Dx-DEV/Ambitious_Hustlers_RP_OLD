class SoundPlayer
{
    SoundURL = "none";
    Position = [0,0,0];
    Distance = 10;
    Identifier = "none";
    AudioHandler = null;
    MuteStatus = false;
    AudioLoaded = false;
    WasCreated = false;
    FirstPlayEvent = false;
    Looped = false;
    AutoPlay = false;
    MaxVolume = 1.0;

    SetAutoPlay = (result) => {
        this.AutoPlay = result;
    }

    Mute = () =>{
        this.MuteStatus = true;
    }

    UnMute = () =>{
        this.MuteStatus = false;
    }

    IsMuted = () => {
        return this.MuteStatus;
    }

    IsAudioLoaded = () => {
        return this.AudioLoaded;
    }

    SetSoundURL = (url) => {
        this.SoundURL = url;
    }

    GetSoundURL = () => {
        return this.SoundURL;
    }

    SetIdentifier = (id) => {
        this.Identifier = id;
    }

    GetIdentifier = () => {
        return this.Identifier;
    }

    SetPlayingPosition = (pos) => {
        this.Position = pos;
    }

    GetPlayingPosition = () => {
        return this.Position;
    }

    SetPlayingDistance = (distance) => {
        this.Distance = distance;
    }

    GetPlayingDistance = () => {
        return this.Distance;
    }

    GetCurrentVolume = () => {
        return this.AudioHandler.volume
    }

    GetMaxVolume = () => {
        return this.MaxVolume;
    }

    SetVolume = (volume) => {
        this.MaxVolume = volume;
    }

    GetCurrentVolume = () => {
        return this.AudioHandler.volume
    }

    GetPlayerDistanceFromSoundInPercentage = () => {
        let deltaX = this.Position[0] - playerPos[0];
        let deltaY = this.Position[1] - playerPos[1];
        let deltaZ = this.Position[2] - playerPos[2];

        return Math.max(0, Math.min(1, 1 - (deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ) / (this.Distance * this.Distance)));
    }

    ChangeAudioHearableVolume = (volume) => {
        if(!this.AudioLoaded){return;}
        if(this.IsMuted()){
            this.AudioHandler.volume = 0.0;
            return;
        }
        if (volume > this.MaxVolume) {
            volume = this.MaxVolume;
            //console.log(volume)
        }
        this.AudioHandler.volume = volume;
    }

    IsPlaying = () => {
        return this.AudioHandler && this.AudioHandler.currentTime > 0 && !this.AudioHandler.paused && !this.AudioHandler.ended && this.AudioHandler.readyState > 2;
    }

    CreateAudioHandler = (silentEvent) => {
        this.AudioHandler = new Audio(this.GetSoundURL());
        this.AudioHandler.loop = this.Looped;
        this.AudioHandler.preload = 'auto';
        this.AudioHandler.autoplay = this.AutoPlay;
        this.AudioHandler.volume = 0.00;
        this.AudioHandler.onended = () => {
            if(silentEvent) { return; }
            SendSoundDataStatus("onend", this.Identifier);
        };

        this.AudioHandler.onplay = () => {
            if(silentEvent) { return; }
            if(!this.FirstPlayEvent){
                SendSoundDataStatus("onplay", this.Identifier);
            }
            this.FirstPlayEvent = true;
        };

        this.AudioHandler.onerror = (event) => {
            if(silentEvent) { return; }
            SendSoundDataStatus("onerror", this.Identifier, event);
        };

        this.AudioHandler.onloadedmetadata = () => {
            this.AudioLoaded = true;
            if(silentEvent) {
                this.Play();
                SendSoundDataStatus("onloadSilent", this.Identifier);
                return;
            }
            let data = {
                maxTime: this.AudioHandler.duration,
            }
            SendSoundDataStatus("onload", this.Identifier, data);
        };

        SendSoundDataStatus("oncreate", this.Identifier);
        this.WasCreated = true;
    }

    SetLoop = (looping) => {
        if(this.WasCreated){
            this.AudioHandler.loop = looping;
        }
        this.Looped = looping;
    }

    IsLooping = () => {
        return this.Looped;
    }

    Play = () => {
        if(this.AudioLoaded){
            this.AudioHandler.play();
            if(this.FirstPlayEvent){
                SendSoundDataStatus("onplay", this.Identifier);
            }
        }
    }

    Resume = () => {
        if(this.AudioLoaded){
            this.AudioHandler.play();
            SendSoundDataStatus("onresume", this.Identifier);
        }
    }

    Pause = () => {
        if(this.AudioLoaded){
            this.AudioHandler.pause();
            SendSoundDataStatus("onpause", this.Identifier);
        }
    }

    Destroy = () => {
        if(this.WasCreated){
            this.AudioHandler.pause();
            this.AudioHandler.src = "";
            this.AudioHandler.load();
            this.AudioHandler = null;
        }
        this.WasCreated = false;
    }

    SetTimestamp = (time) => {
        if(this.AudioLoaded){
            this.AudioHandler.currentTime = time;
            SendSoundDataStatus("ontimechange", this.Identifier, { time: time });
        }
    }
}

function SendSoundDataStatus(type, id, data){
    $.post("https://rcore_fuel/sound_status", JSON.stringify({
        type: type,
        id: id,
        info: data,
    }));
}