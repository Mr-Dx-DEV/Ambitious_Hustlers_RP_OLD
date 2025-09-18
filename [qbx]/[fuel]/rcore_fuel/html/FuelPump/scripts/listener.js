var App = new Vue({
	el: '#body',
	data:
	{
	   visible: true,
	   fuelAmount: 0,
	   newFuelAmount: 0,

	   fuelList: [],

	   tankingFuel: false,

	   labelForUnit: "liters",

       pricePerLiter: 0,
	   newFuelCost: 0,
	   CurrentMoneyCounted: 0,
	   newDuration: 0.1,

	   litersTanked: 0,
	   newLitersTanked: 0,

	   open: true,
	   inStock: true,

	   notOpenMessage: "",
	   outOfStockMessage: "",
 	},

    methods: {
        CountPercentageBoxes: (amount)=>{
            return Math.floor(amount / 10)
        },
    },

    computed: {
        animatedMoney: function() {
            return this.newFuelCost.toFixed(1);
        },

        animatedLiters: function(){
            return this.newLitersTanked.toFixed(1);
        },

        animatedFuel: function() {
            return this.newFuelAmount.toFixed(0);
        },
    },
    watch: {
		litersTanked: function(newValue) {
			gsap.to(this.$data, { duration: this.newDuration, newLitersTanked: newValue });
		},

		CurrentMoneyCounted: function(newValue) {
			gsap.to(this.$data, { duration: this.newDuration, newFuelCost: newValue });
		},
		fuelAmount: function(newValue) {
			gsap.to(this.$data, { duration: 1.0, newFuelAmount: newValue });
		},
    },
});

$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "lerpAmount"){
            App.newDuration = item.amount
        }

        if(item.type === "hideAll"){
            $("#body").hide();
        }

        if(item.type === "translation"){
            if(item.fuel){
                App.notOpenMessage = item.notOpenMessage;
                App.outOfStockMessage = item.outOfStockMessage;
            }
        }

        if(item.type === "showFueling"){
            $(".info").fadeOut(1000);
            $(".tanking").fadeIn(1000);
        }

        if(item.type === "hideFueling"){
            $(".info").fadeIn(1000);
            $(".tanking").fadeOut(1000);

            App.fuelAmount = 0;
            App.newFuelCost = 0;
            App.CurrentMoneyCounted = 0;
        }

        if(item.type === "openstatus"){
            App.open = item.open;
            App.inStock = item.inStock;
        }

        if(item.type === "flipScreen"){
            if(item.status){
                $("body").css({ transform: "scaleX(-1)" });
            }
            else
            {
                $("body").css({ transform: "scaleX(1)" });
            }
        }

        if(item.type === "stock"){
            App.fuelList[item.index].inStock = item.inStock;
        }

        if(item.type === "activeFuel"){
            for(var i = 0; i < App.fuelList.length; i ++){
                App.fuelList[i].active = false;
            }
            App.fuelList[item.index].active = true;
            App.pricePerLiter = App.fuelList[item.index].price;
            App.labelForUnit = App.fuelList[item.index].labelUnitFuel;
        }

        if(item.type === "fuelData"){
            App.visible = false;
            App.fuelList = item.fuelData;

            App.pricePerLiter = item.fuelData[0].price;
            App.labelForUnit = item.fuelData[0].labelUnitFuel;

            App.visible = true;
        }

        if(item.type === "show"){
            $("#body").fadeIn(300);
        }

        if(item.type === "hide"){
            $("#body").fadeOut(300);
        }

		if(item.type === "update_cost"){
			if(item.fuel){
                App.fuelAmount = item.fuel.toFixed(0);
			}
			if(App.fuelAmount >= 99.5){
				App.fuelAmount = 100;
			}

            App.CurrentMoneyCounted = item.cost;
            App.litersTanked = item.litersTanked ?? 0;
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

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}