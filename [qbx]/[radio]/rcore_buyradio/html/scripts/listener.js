var index = 0;

var AppInput = new Vue({
	el: '#input',
	data:
	{
        identifier: null,
	    secondaryTitle: "subtitle",
	    float: "center",
	    position: "center",
	    ChooseText: "Accept",
	    CloseText: "Close",
	    message: "",
	    visible: false,
	},
    methods: {
        Choose: function(){
            $.post('http://rcore_buyradio/inputmethod', JSON.stringify({
                identifier: this.identifier,
                message: this.message,
            }));
        },
        Close: function(){
            $.post('http://rcore_buyradio/close', JSON.stringify({
                identifier: this.identifier,
            }));
        },
    },
});

var App = new Vue({
	el: '#menu',
	data:
	{
        identifier: null,

	    secondaryTitle: "rcore",
        primaryTitle: "",

	    float: "left",
	    position: "middle",

	    descriptionItem: null,

	    backgroundColor: "orange",
	    primaryTitleColor: "black",
	    secondaryTitleColor: "black",

	    backgroundImage: null,

	    itemsCount: 0,

	    isRounded: false,

	    visible: false,
		menu: [],
	},
});
function setActiveMenuIndex(index, active_){
    for(var i = 0; i < App.menu.length; i++){ App.menu[i].active = false }
    if(App.menu[index] != null) {
        App.menu[index].active = active_
        if(App.menu[index].description){
            App.descriptionItem = App.menu[index].description;
        }
    }
}

function recalculateInteractableItems(){
    App.itemsCount = 0;
    for(var i = 0; i < App.menu.length; i++){
        if(App.menu[i].isItem == true) {
            App.itemsCount ++;
        }
    }
}

function ChangeChoiceInItem(forward){
    var menuData = App.menu[index];
    var data = App.menu[index].choice
    var currentIndex = App.menu[index].activeSubIndex

    currentIndex = (currentIndex + (forward ? -1 : 1) + data.length) % data.length;

    App.menu[index].activeSubIndex = currentIndex;

    $.post('http://rcore_buyradio/clickItem', JSON.stringify({
        index: menuData.index,
        identifier: App.identifier,
        data: data[currentIndex],
        isArrowKey: true,
    }));
}

function closePreview(){
    $(".image-container").fadeOut(1000);
    $.post('http://rcore_buyradio/closePreview');
}

function SelectAnotherItemInMenu(forward) {
    var lastIndex = index;
    var scrollAmount = forward ? -33 : 33;

    index = (index + (forward ? -1 : 1) + App.menu.length) % App.menu.length;
    document.getElementById('scrolldiv').scrollTop += scrollAmount;

    if(forward && index === App.menu.length - 1){
        document.getElementById('scrolldiv').scrollTop = 90000;
        App.activeIndexNumber = App.menu.length - 1;
    }
    else if(!forward && index === 0){
        document.getElementById('scrolldiv').scrollTop = 0;
        App.activeIndexNumber = -1;
    }

    if(App.menu[index].isItem){
        App.activeIndexNumber += forward ? -1 : 1;
        }else{
        SelectAnotherItemInMenu(forward);
        return;
    }

    setActiveMenuIndex(index, true);

    App.descriptionItem = null;
    if(App.menu[index].description){
        App.descriptionItem = App.menu[index].description;
    }

    $.post('http://rcore_buyradio/selectNew', JSON.stringify({
        index: App.menu[index].index,
        identifier: App.identifier,
        newIndex: App.menu[index].index,
        oldIndex: App.menu[lastIndex].index
    }));
}


// Menu
$(function(){
    function display(bool) {
        App.visible = bool;
    }
    display(false);
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type_menu === "reset"){
            App.menu = [];
        }

        if(item.type_menu === "add"){
            delete item.menuItems.data;
            delete item.menuItems.cb;

            App.menu.push(item.menuItems);
            recalculateInteractableItems();
        }

        if(item.type_menu === "secondaryTitle"){
            App.secondaryTitle = item.title
        }

        if(item.type_menu === "primaryTitle"){
            App.primaryTitle = item.title
        }

        if (item.type_menu === "ui"){
            display(item.status);
            if(item.properties){
                App.float = item.properties.float;
                App.position = item.properties.position;
                App.backgroundColor = item.properties.backgroundColor;
                App.primaryTitleColor = item.properties.primaryTitleColor;
                App.secondaryTitleColor = item.properties.secondaryTitleColor;
                App.isRounded = item.properties.isRounded;
                App.backgroundImage = item.properties.backgroundImage;
            }
            App.identifier = item.identifier;
            index = 0;
            setActiveMenuIndex(0, true)
            recalculateInteractableItems();
            App.activeIndexNumber = 0;
        }

	    if(App.visible && !AppInput.visible){
            if (item.type_menu === "enter"){
                var menuData = App.menu[index];
                var choiceData = null;

                if(menuData.checkBox){
                    menuData.value = !menuData.value;
                }

                if(menuData.isChoice){
                    var currentIndex = App.menu[index].activeSubIndex
                    choiceData = App.menu[index].choice[currentIndex]
                }

                $.post('http://rcore_buyradio/clickItem', JSON.stringify({
                    index: menuData.index,
                    identifier: App.identifier,
                    data: choiceData ?? menuData,
                }));
            }

            if (item.type_menu === "left"){
                if(App.menu[index].isChoice){
                    ChangeChoiceInItem(false);
                }
            }

            if (item.type_menu === "right"){
                if(App.menu[index].isChoice){
                    ChangeChoiceInItem(true);
                }
            }

            if (item.type_menu === "up"){
                SelectAnotherItemInMenu(true);
            }

            if (item.type_menu === "down"){
                SelectAnotherItemInMenu(false);
            }
		}
	})
});

// Input
$(function(){
    function display(bool) {
        AppInput.visible = bool;
    }
    display(false);
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type_menu === "title_input"){
            AppInput.secondaryTitle = item.title
        }

        if (item.type_menu === "ui_input"){
            display(item.status);
            if(item.properties){
                AppInput.float = item.properties.float;
                AppInput.position = item.properties.position;
                AppInput.ChooseText = item.properties.ChooseText;
                AppInput.CloseText = item.properties.CloseText;
            }
            AppInput.identifier = item.identifier;
        }
	})
});

// Script
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;
        if(item.type === "preview"){
            if(item.style == 1){ $(".image-preview").attr("src","./img/gray.png") }
            if(item.style == 2){ $(".image-preview").attr("src","./img/blue.png") }
            $(".image-container").fadeIn(1000);
        }
	})
});