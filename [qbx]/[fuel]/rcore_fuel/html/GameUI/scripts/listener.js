var App = new Vue({
	el: '#app',
	data:
	{
	   translation: [],
 	},
});

function Close(){
    $("#textboard").modal("hide");
    $("#tutorial_gas_tube").modal("hide");
    $("#dispenserSettings").modal("hide");
    $("#shopSettings").modal("hide");
    $.post('https://rcore_fuel/exit');
}

function InsertShopData(){
    $.post('https://rcore_fuel/insertShop', JSON.stringify({
        identifier: $(".shopIdentifier").val(),
        blipSprite: $(".blipSprite").val(),
        blipName: $(".blipLabel").val(),
        enableSociety: $(".societyEnabled").prop("checked"),
        societyName: $(".societyName").val(),
        jobName: $(".jobName").val(),
        employeesOnly: $(".employeesOnly").prop("checked"),
        maxTanker: $(".maxTanker").val(),
        shopCost: $(".shopCost").val(),
        enableBlip: $(".enableBlip").prop("checked"),
    }));
    Close();
}

function InsertDispenserData(){
    $.post('https://rcore_fuel/insertDispenser', JSON.stringify({
        price: $(".priceFuel").val(),
        fuel: $("#fuelType").val(),
        align: $("#scaleformPos").val(),
    }));
    Close();
}

function selectPayment(type){
    $("#paymentType").modal("hide");
    $.post('https://rcore_fuel/payment', JSON.stringify({
        type: type,
    }));
}

$(function(){
    $.post('https://rcore_fuel/init_main');

	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "locales_main"){
			 App.translation = item.locales
        }

        if(item.type === "shopSettings"){
			 $("#shopSettings").modal("show");
        }

        if(item.type === "show_guide_tube"){
			 $("#tutorial_gas_tube").modal("show");
        }

        if(item.type === "show_dispenser_settings"){
			 $("#dispenserSettings").modal("show");
        }

        if(item.type === "insertFuelTypes"){
            $("#fuelType").append("<option value='" + item.key +"'>"+ item.label +"</option>");
        }

        if(item.type === "showpaytype"){
			$('#paymentType').modal({
                backdrop: 'static',
                keyboard: false
            });
			if(item.cash){
                $("#cash").show();
			}else{
                $("#cash").hide();
			}
			if(item.bank){
                $("#bank").show();
			}else{
                $("#bank").hide();
			}
        }
	})
});

// Debug
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "display_for_copy"){
			$('#textboard').modal("show");
			$(".textarea").val(item.text);
        }
	})
});