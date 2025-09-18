var index = 0;

var AppInput = new Vue({
	el: '#input',
	data:
	{
        identifier: null,
	    secondaryTitle: "subtitle",
	    float: "middle",
	    position: "middle",
	    ChooseText: "Accept",
	    CloseText: "Close",
	    message: "",
	    defaultTextInfront: "",
	    defaultText: "",
	    visible: false,
	},
    methods: {
        Choose: function(){
            $.post('https://rcore_fuel/inputmethod', JSON.stringify({
                identifier: this.identifier,
                message: this.message,
            }));
        },
        Close: function(){
            $.post('https://rcore_fuel/close', JSON.stringify({
                identifier: this.identifier,
            }));
        },
    },
});

var AppMenu = new Vue({
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
    for(var i = 0; i < AppMenu.menu.length; i++){ AppMenu.menu[i].active = false }
    if(AppMenu.menu[index] != null) {
        AppMenu.menu[index].active = active_
        if(AppMenu.menu[index].description){
            AppMenu.descriptionItem = AppMenu.menu[index].description;
        }
    }
}

function recalculateInteractableItems(){
    AppMenu.itemsCount = 0;
    for(var i = 0; i < AppMenu.menu.length; i++){
        if(AppMenu.menu[i].isItem == true) {
            AppMenu.itemsCount ++;
        }
    }
}

function ChangeChoiceInItem(forward){
    var menuData = AppMenu.menu[index];
    var data = AppMenu.menu[index].choice
    var currentIndex = AppMenu.menu[index].activeSubIndex

    currentIndex = (currentIndex + (forward ? -1 : 1) + data.length) % data.length;

    AppMenu.menu[index].activeSubIndex = currentIndex;

    $.post('https://rcore_fuel/clickItem', JSON.stringify({
        index: menuData.index,
        identifier: AppMenu.identifier,
        data: data[currentIndex],
        isArrowKey: true,
    }));
}

function SelectAnotherItemInMenu(forward) {
    var lastIndex = index;
    var scrollAmount = forward ? -33 : 33;

    index = (index + (forward ? -1 : 1) + AppMenu.menu.length) % AppMenu.menu.length;
    document.getElementById('scrolldiv').scrollTop += scrollAmount;

    if(forward && index === AppMenu.menu.length - 1){
        document.getElementById('scrolldiv').scrollTop = 90000;
        AppMenu.activeIndexNumber = AppMenu.menu.length - 1;
    }
    else if(!forward && index === 0){
        document.getElementById('scrolldiv').scrollTop = 0;
        AppMenu.activeIndexNumber = -1;
    }

    if(AppMenu.menu[index].isItem){
        AppMenu.activeIndexNumber += forward ? -1 : 1;
        }else{
        SelectAnotherItemInMenu(forward);
        return;
    }

    setActiveMenuIndex(index, true);

    AppMenu.descriptionItem = null;
    if(AppMenu.menu[index].description){
        AppMenu.descriptionItem = AppMenu.menu[index].description;
    }

    $.post('https://rcore_fuel/selectNew', JSON.stringify({
        index: AppMenu.menu[index].index,
        identifier: AppMenu.identifier,
        newIndex: AppMenu.menu[index].index,
        oldIndex: AppMenu.menu[lastIndex].index
    }));
}


// Menu
$(function(){
    function display(bool) {
        AppMenu.visible = bool;
    }
    display(false);
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type_menu === "reset"){
            AppMenu.menu = [];
            AppMenu.descriptionItem = null;
        }

        if(item.type_menu === "add"){
            delete item.menuItems.data;
            delete item.menuItems.cb;

            AppMenu.menu.push(item.menuItems);
            recalculateInteractableItems();
        }

        if(item.type_menu === "secondaryTitle"){
            AppMenu.secondaryTitle = item.title
        }

        if(item.type_menu === "primaryTitle"){
            AppMenu.primaryTitle = item.title
        }

        if (item.type_menu === "ui"){
            display(item.status);
            if(item.properties){
                AppMenu.float = item.properties.float;
                AppMenu.position = item.properties.position;
                AppMenu.backgroundColor = item.properties.backgroundColor;
                AppMenu.primaryTitleColor = item.properties.primaryTitleColor;
                AppMenu.secondaryTitleColor = item.properties.secondaryTitleColor;
                AppMenu.isRounded = item.properties.isRounded;
                AppMenu.backgroundImage = item.properties.backgroundImage;
            }
            AppMenu.identifier = item.identifier;
            index = 0;
            setActiveMenuIndex(0, true)
            recalculateInteractableItems();
            AppMenu.activeIndexNumber = 0;
        }

	    if(AppMenu.visible && !AppInput.visible){
            if (item.type_menu === "enter"){
                var menuData = AppMenu.menu[index];
                var choiceData = null;

                if(menuData.checkBox){
                    menuData.value = !menuData.value;
                }

                if(menuData.isChoice){
                    var currentIndex = AppMenu.menu[index].activeSubIndex
                    choiceData = AppMenu.menu[index].choice[currentIndex]
                }

                $.post('https://rcore_fuel/clickItem', JSON.stringify({
                    index: menuData.index,
                    identifier: AppMenu.identifier,
                    data: choiceData ?? menuData,
                }));
            }

            if (item.type_menu === "left"){
                if(AppMenu.menu[index].isChoice){
                    ChangeChoiceInItem(false);
                }
            }

            if (item.type_menu === "right"){
                if(AppMenu.menu[index].isChoice){
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
                AppInput.placeHolderText = item.properties.placeHolderText;
                AppInput.message = item.properties.defaultValue;
            }
            AppInput.identifier = item.identifier;
        }
	})
});