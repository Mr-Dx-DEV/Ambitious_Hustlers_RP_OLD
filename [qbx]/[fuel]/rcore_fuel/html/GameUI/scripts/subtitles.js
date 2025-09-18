$(".top").slideUp(0);
$(".bottom").slideUp(0);

var previousTimer = null;

$(function(){
	window.addEventListener('message', function(event) {
		var item = event.data;
        if (item.type === "blackbars"){//default number 15% -- Default speed 0
            if(item.size == -1){
                $(".top").slideUp(item.timeShow);
                $(".bottom").slideUp(item.timeShow);
                return true;
            }
			$(".top").css("height",item.size + "%");
			$(".bottom").css("height",item.size + "%");

			$(".top").slideDown(item.timeShow);
			$(".bottom").slideDown(item.timeShow);
        }

		if(item.type === "subtitles"){
			$(".text-container").text("");
            item.text = parseText(item.text)

			$(".text-container").append("<h1>"+ item.text +"</h1>");
			$(".text-container").fadeOut(0);
			$(".text-container").fadeIn("slow");
            if(item.timer != -1){
                if(previousTimer) {
                    clearInterval(previousTimer);
                    prevNowPlaying = null;
                }

                previousTimer = setTimeout(hideSubtitles, item.timer);
			}
		}
    })
});

function hideSubtitles(){
	$(".text-container").fadeOut("slow");
}

var colorArray = {
    "r": "red",
    "b": "blue",
    "g": "green",
    "y": "yellow",
    "p": "purple",
    "c": "grey",
    "m": "dark grey",
    "u": "black",
    "o": "orange",
    "n": "<br>",
    "s": "<font>",
    "w": "white",
};

function getChatColors(string){
    var splitted = string.split("~");
    var array = [];
    var index = 0;

    for(let i = 1;i< splitted.length;i += 2){
        array[index] = splitted[i];
        index ++;
    }

    return array;
}

function parseText(text){
    var result = getChatColors(text);
    for(var i = 0; i < result.length; i ++){
        var color = result[i];
        if(result[i].length == 1){
            text = text.replace("~"+ color +"~", "<font color = '"+colorArray[color]+"'>");
        }else{
            text = text.replace("~"+ color +"~", "<font class = '"+color+"' color='"+color+"'>");
        }
    }
    return text;
}