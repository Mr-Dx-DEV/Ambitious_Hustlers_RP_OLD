var switchme = false;
var App = new Vue({
	el: '#body',
	data:
	{
	   fuelAmount: 0,
	   newFuelAmount: 0,
	   stockList:  [
//	        { name: "natural", value: 100 },
//	        { name: "diesel", value: 100 },
//	        { name: "milk", value: 100 },
//	        { name: "kWh", value: 100 },
	   ],
	},

    methods: {
        CountPercentageBoxes: (amount)=>{
            return Math.floor(amount / 10)
        },
    },

    computed: {
        animatedFuel: function() {
            return this.newFuelAmount.toFixed(0);
        },
    },
    watch: {
		fuelAmount: function(newValue) {
			gsap.to(this.$data, { duration: 2.5, newFuelAmount: newValue });
		},
    },
});


$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "flipScreen"){
            if(item.status){
                $("body").css({ transform: "scaleX(-1)" });
            }
            else
            {
                $("body").css({ transform: "scaleX(1)" });
            }
        }

        if(item.type === "show"){
            $("#body").show(300);
        }

        if(item.type === "hide"){
            $("#body").hide(300);
        }

		if(item.type === "update_value"){
		    App.stockList = item.stockList;

            var maxCapacity = 0;
            var currentCapacity = 0;

            for(var i = 0; i < App.stockList.length; i ++){
                var data = App.stockList[i];
                maxCapacity += data.maxCapacity;
                currentCapacity += data.currentCapacity;
            }

            UpdateTotalTankerValue((currentCapacity / maxCapacity) * 100);
		}
	})
});

$(function(){
    function getQueryParams() {
        var qs = window.location.search;
        qs = qs.split('+').join(' ');

        var params = {},
            tokens,
            re = /[?&]?([^=]+)=([^&]*)/g;

        while (tokens = re.exec(qs)) {
            params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
        }
        return params;
    }

    var result = getQueryParams();

    $.post('http://rcore_fuel/realDuiLoaded', JSON.stringify({
        identifier: result.identifier,
    }));
});

function UpdateTotalTankerValue(fuel){
    if(!switchme){
        switchme = true;
        App.newFuelAmount = fuel;
        if(App.newFuelAmount >= 100.0){
            App.newFuelAmount = 100.0;
        }
        return;
    }

    App.fuelAmount = fuel;
    if(App.fuelAmount >= 100.0){
        App.fuelAmount = 100.0;
    }
}