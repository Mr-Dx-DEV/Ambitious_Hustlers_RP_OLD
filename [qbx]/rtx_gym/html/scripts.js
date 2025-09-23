var gymresourcename = "rtx_gym";

var gymdatedata = ["10.03","11.03","12.03","13.03","14.03","15.03","16.03","17.03","18.03","19.03","20.03"];

var gymvisitorsdata = [0,0,0,0,0,10,0,0,0,0,0];

Chart.defaults.global.defaultFontColor = "#fff";

var visitorschart;

function closeMain() {
	$("body").css("display", "none");
}

function openMain() {
	$("body").css("display", "block");
}

$(".closegymentry").click(function(){
	$.post('http://'+gymresourcename+'/quit', JSON.stringify({}));
});

$(".closegymbuy").click(function(){
	$.post('http://'+gymresourcename+'/quit', JSON.stringify({}));
});

$(".closegymmanagment").click(function(){
	$.post('http://'+gymresourcename+'/quit', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
	
	if (item.message == "gymentryshow") {
		openMain();
		document.getElementsByClassName("headergymentrytext")[0].innerHTML = item.gymentrylabel;
		document.getElementById("gymentrypassdurationdata").innerHTML = item.gymentrypasstimeduration;
		document.getElementById("gymentryonedurationdata").innerHTML = item.gymentryonetimeduration;
		document.getElementById("gymentrypasspricedata").innerHTML = item.gymentrypasstimeprice;
		document.getElementById("gymentryonepricedata").innerHTML = item.gymentryonetimeprice;
		$("#gymmanagmentshow").hide();	
		$("#gymbuyshow").hide();	
		$("#gymshow").hide();	
		$("#gymstats").hide();	
		$("#gymentryshow").show();	
	}		
		
	if (item.message == "hide") {
		closeMain();
	}
	
	if (item.message == "gymbuyshow") {
		openMain();
		document.getElementsByClassName("headergymbuytext")[0].innerHTML = item.gymbuylabel;
		document.getElementById("gymbuypricedata").innerHTML = item.gymbuyprice;
		$("#gymmanagmentshow").hide();	
		$("#gymentryshow").hide();	
		$("#gymshow").hide();	
		$("#gymstats").hide();	
		$("#gymbuyshow").show();	
	}	

	if (item.message == "gymmanagmentshow") {
		openMain();
		gymdatedata = [];
		gymvisitorsdata = [];
		if (visitorschart) {
			visitorschart.destroy();
		}
		$("#gymentryshow").hide();	
		$("#gymbuyshow").hide();	
		$("#gymshow").hide();	
		$("#gymstats").hide();	
		$("#gymmanagmentshow").show();	
		var inputhandler = document.getElementById("gymentrypricesliderdata");
		inputhandler.setAttribute("max", item.gympricemaxdata);	
		document.getElementById("gymentrypricedata").innerHTML = item.gympriceoowneddata;
		document.getElementById("gymwithdrawmoneytextdata").innerHTML = item.gymownedbalancedata;
		if(item.gymowneddataclosed == 1) {		
			document.getElementById("gymclosedinputdata").checked = false;
		} else {	
			document.getElementById("gymclosedinputdata").checked = true;
		}			
		$("#gymentrypricesliderdata").val(item.gympriceoowneddata); 
	}	

	if (item.message == "updatevisitors") {
		gymdatedata.push(item.visitordata);
		gymvisitorsdata.push(item.visitordata2);
	}	
	
	if (item.message == "updatevisitors2") {
		visitorschart = new Chart("gymstatsdata2", {
		  type: "line",
		  color: "#ffffff",
		  data: {
			labels: gymdatedata,
			datasets: [{
			},{
			  data: gymvisitorsdata,
			  borderColor: "#ff66ff",
			  backgroundColor: "rgba(255,255,255,1.0)",
			  tickColor: "rgba(255,255,255,1.0)",
			  fill: false
			}]
		  },
		  options: {
			scales: {    
				yAxes: [{
					ticks: {
						fontSize: 16,
						fontFamily: "BebasNeueBold",
						stepSize: 1,
						beginAtZero: true
					}
				}],
				xAxes: [{
					ticks: {
						fontSize: 16,
						fontFamily: "BebasNeueBold",
						stepSize: 1,
						beginAtZero: true
					}
				}]		
			},
            tooltips: {
                enabled: true,
				displayColors: false,
                mode: 'single',
                callbacks: {
                    label: function(tooltipItems, data) { 
                        return  '$' + tooltipItems.yLabel;
                    }
                }
            },			
			responsive:true,
			legend: {display: false}
		  }  
		});
	}		
	
	if (item.message == "gymmanagmentupdate") {
		document.getElementById("gymentrypricedata").innerHTML = item.gympriceoowneddata;
		document.getElementById("gymwithdrawmoneytextdata").innerHTML = item.gymownedbalancedata;
		if(item.gymowneddataclosed == 1) {		
			document.getElementById("gymclosedinputdata").checked = false;
		} else {	
			document.getElementById("gymclosedinputdata").checked = true;
		}			
		$("#gymentrypricesliderdata").val(item.gympriceoowneddata); 
	}	

	if (item.message == "gymshow") {
		document.getElementsByClassName("gymlabeltext")[0].innerHTML = item.gymlabeltext;
		openMain();
		$("#gymshow").show();	
	}
	
	if (item.message == "gymstatsshow") {
		$('.statsstatsstrengthmaincontainerdata').css("width", item.strengthdata+"%")
		$('.statsstatsconditionmaincontainerdata').css("width", item.conditiondata+"%")
		$('.statsstatsswimmingmaincontainerdata').css("width", item.swimmingdata+"%")
		$('.statsstatshygienemaincontainerdata').css("width", item.hygienedata+"%")
		$('.statsstatsenergymaincontainerdata').css("width", item.energydata+"%")		
		openMain();
		$("#gymstatsshow").show();	
	}
	
	if (item.message == "progressshow") {
		openMain();
		document.getElementsByClassName("progressbartext")[0].innerHTML = item.progresstext;	
		$("#progressshow").show();	
	}	
	
	if (item.message == "progresshide") {
		$("#progressshow").hide();	
	}	

	if (item.message == "progressupdate") {
		$('.progressbarmaincontainerdata').css("width", item.progressbardata+"%")
	}	

	if (item.message == "gymprogressshow") {
		openMain();
		document.getElementsByClassName("progressbartext")[0].innerHTML = item.progresstext;
		document.getElementById("gymreactkey").innerHTML = item.gymreactkey;
		$("#gymprogressshow").show();	
	}	
	
	if (item.message == "gymprogresshide") {
		$("#gymprogressshow").hide();	
	}	

	if (item.message == "gymprogressupdate") {
		$('.gymprogressbarmaincontainerdata').css("height", item.progressbardata2+"%")
	}		
		
	if (item.message == "hidegymentry") {
		$("#gymentryshow").hide();	
	}	
	
	if (item.message == "hidegymbuy") {
		$("#gymbuyshow").hide();	
	}	

	if (item.message == "hidegymmanagment") {
		$("#gymmanagmentshow").hide();	
	}		
	
	if (item.message == "hidegym") {
		$("#gymshow").hide();	
	}	

	if (item.message == "hidestats") {
		$("#gymstatsshow").hide();	
	}			
	
	if (item.message == "infonotifyshow") {
		document.getElementsByClassName("infonotifytext")[0].innerHTML = item.infonotifytext;
		openMain();
		$("#infonotifyshow").show();	
	}
	
	if (item.message == "hidenotify") {
		$("#infonotifyshow").hide();	
	}		
	
	if (item.message == "updateinterfacedata") {
		gymresourcename = item.gymresourcenamedata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}			
	
	document.onkeyup = function (data) {
		if (open) {
			if (data.which == 27) {
				$.post('http://'+gymresourcename+'/quit', JSON.stringify({}));
			}
		}	
	};	
});

function managmententryprice(e) {
	document.getElementById("gymentrypricedata").innerHTML = e.value;
	$.post('http://'+gymresourcename+'/changeentryprice', JSON.stringify({
		entryprice: e.value
	}));	
}

$(".gymentrypassbutton").click(function () {
	$.post('http://'+gymresourcename+'/payentry', JSON.stringify({
		entrytype: "pass"
	}));
});

$(".gymentryonebutton").click(function () {
	$.post('http://'+gymresourcename+'/payentry', JSON.stringify({
		entrytype: "normal"
	}));
});

$(".buttongymbuy").click(function () {
	$.post('http://'+gymresourcename+'/buygym', JSON.stringify({}));
});

$(".gymwithdrawbutton").click(function () {
	$.post('http://'+gymresourcename+'/managmentwithdraw', JSON.stringify({}));
});

$("#gymclosedinputdata").click(function(){
	if (document.getElementById("gymclosedinputdata").checked == false){
		document.getElementById("gymclosedinputdata").checked = false;
		$.post('http://'+gymresourcename+'/gymstatus', JSON.stringify({
			statushandler: true
		}));
	}
	else {
		document.getElementById("gymclosedinputdata").checked = true;
		$.post('http://'+gymresourcename+'/gymstatus', JSON.stringify({
			statushandler: false
		}));
	}
})	

$(".gymsellbutton").click(function () {
	$.post('http://'+gymresourcename+'/sellgym', JSON.stringify({}));
});

$(".gymtransferbutton").click(function () {
	$.post('http://'+gymresourcename+'/transfergym', JSON.stringify({}));
});