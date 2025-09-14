let config;
let role_level_id = 0;

window.addEventListener("message", async function (event) {
	let item = event.data;
	if (item.utils) {
		if (typeof Lang === "undefined") {
			await Utils.loadLanguageModules(item.utils);
		}
	}
	if (item.resourceName) {
		Utils.setResourceName(item.resourceName);
	}
	if (item.price >= 0){
		let market_categories = item.market_categories;
		$("#buy-store-container").html(`
			<p id="modal-p">${Utils.translate("confirm_buy_store").format(Utils.currencyFormat(item.price))} + ${Utils.translate("category_price")}</p>
			<p id="modal-p">${Utils.translate("please_select_category")}</p>
			<select id="input-select-category" class="form-control" name="select" style="width:100%;" required="required"></select>
		`);
		$("#input-select-category").empty();
		$("#input-select-category").append(`<option value="" selected disabled>${Utils.translate("please_select_category_input")}</option>`);

		for (const idx of Object.keys(market_categories)) {
			$("#input-select-category").append(`<option category_id="${idx}">${market_categories[idx].page_name} ${Utils.currencyFormat(market_categories[idx].category_buy_price,2)}</option>`);
		}

		$("#modal-cancel-buy").text(Utils.translate("cancel_button_modal"));
		$("#modal-confirm").text(Utils.translate("confirm_buy_button_modal"));
		$("#modal-confirm-title").text(Utils.translate("modal_title"));

		$("body").css("display", "");
		$(".main").css("display", "none");
		$(document).ready(function(){
			$("#buyModal").modal({show: true});
		});
	} else if (item.showmenu){
		config = item.dados.config;
		role_level_id = item.dados.role;
		let store_jobs = item.dados.store_jobs;
		let store_business = item.dados.store_business;
		let store_balance = item.dados.store_balance;
		let store_employees = item.dados.store_employees;
		let store_categories = item.dados.store_categories;
		let store_users_theme = item.dados.store_users_theme;
		let market_items = item.dados.market_items;
		let players = item.dados.players;

		let arr_stock = JSON.parse(store_business.stock);
		let arr_stock_prices = JSON.parse(store_business.stock_prices);

		if (arr_stock_prices == false) {
			arr_stock_prices = {};
		}
		if (item.isMarket) {
			/*
			* SIDEBAR
			*/
			let firstPage = null;
			if(item.update != true){
				$("#nav-bar").empty();
				$(".market-pages").remove();
				for (const key of config.market_types.categories) {
					if (store_categories.find(category => category.category == key)) {
						if(firstPage == null){
							firstPage = key.toString();
						}
						$(".container-pages").append(`
							<div class="pages market-pages ${key}-page" style="height: 100%;">
								<div class="row" style="height: 100%;">
									<div class="col-md-12" style="height: 100%;">
										<div id="${key}-title-div" class="col-9 mt-3 mb-3">
											<h4 class="text-uppercase">${config.market_categories[key].page_name}</h4>
											<p>${config.market_categories[key].page_desc}</p>
										</div>
										<div class="market-list-container" style="height: 100%;">
											<div id="market-products${key}" class="row" style="max-height: calc(100% - var(--${key}-title-height)); overflow: auto;">
												
											</div>
											<div class="filter-card filter-card-theme">
												<div id="filter-items${key}" class="filters-container">
													
												</div>
												<div id="button-filter-items${key}" class="filters-container" style="align-self: end;">
													<button onclick="filterItems('${key.toString()}')" class="btn btn-primary btn-block">${Utils.translate("filters_filter_btn")}</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						`);

						$("#nav-bar").append(`
							<li id="sidebar-${key}" onclick="openPage('${key}')">
								${config.market_categories[key].page_icon}
								<span class="tooltip">${config.market_categories[key].page_name}</span>
							</li>
						`);
					}
				}
				$("#nav-bar").append(`
					<li onclick="closeUI()">
						<i class="fas fa-times"></i>
						<span class="tooltip">${Utils.translate("navbar_close_btn")}</span>
					</li>
				`);

				$("#imgcard").attr("src",config.market_locations.account.item[0].icon);
				$("#imgcash").attr("src",config.market_locations.account.item[1].icon);
				$("#payment-method-title").text(Utils.translate("payment_method_title"));

				$(".pages").css("display", "none");
				$("#payments").css("display", "");
				$(".market-page").css("display", "block");
				$(".sidebar-navigation ul li").removeClass("active");
				$("#sidebar-"+firstPage.toString()).addClass("active");

				$("#css-toggle").prop("checked", store_users_theme.dark_theme).change();

				$(".main").fadeIn(200);
				openPage(firstPage.toString());
			}

			for (const key in  config.market_categories) {
				$("#market-products"+key).empty();
			}

			/*
			* MARKET PAGE
			*/
			let min_price = {};
			let max_price = {};
			for (const key in config.market_categories) {
				min_price[key] = -1;
				max_price[key] = 0;

				let itemsArray = [];

				for (const keyP in config.market_categories[key].items) {
					let fkey = keyP.replace("|", "-x-");
					let market_item = market_items[keyP];

					if (!market_item) continue;

					market_item.fkey = fkey;
					itemsArray.push(market_item);
				}

				// Sort the itemsArray by name
				itemsArray.sort((a, b) => a.name.localeCompare(b.name));

				itemsArray.forEach(market_item => {
					let stock_value;
					let keyP = market_item.fkey.replace("-x-", "|");

					if (store_business.stock === false) {
						stock_value = Utils.translate("market_items_stock_full");
					} else if (store_business.stock === true) {
						stock_value = Utils.numberFormat(0);
					} else if (arr_stock[keyP] == undefined) {
						stock_value = Utils.numberFormat(0);
					} else {
						stock_value = Utils.numberFormat(arr_stock[keyP]);
					}
					if (arr_stock_prices[keyP] == undefined) {
						arr_stock_prices[keyP] = market_item.price_to_customer;
					}

					// Market items
					$("#market-products" + key).append(`
						<div class="item-card col-6 mb-2" data-price="${arr_stock_prices[keyP]}" data-stock="${stock_value}" data-name="${market_item.name}">
							<div class="card overflow-hidden w-auto">
								<div class="card-content">
									<div class="card-body cleartfix">
										<div class="media align-items-stretch">
											<div class="align-self-center">
												<img class="font-large-2 mr-2 " src="img/items/${market_item.img}" width="60">
											</div>
											<div class="media-body">
												<div>
													<h4 style="margin: 0;">${market_item.name}</h4>
													<h4 style="margin: 0;"><small>${Utils.translate("market_items_stock")} (${stock_value})</small></h4>
												</div>
												<div class="market-item-content">
													<input class="form-control h-50" id="input-${market_item.fkey}" type="number" min="1" max="${stock_value}" placeholder="${Utils.translate("jobs_page_amount")}" name="amount" required="required">
													<h1 style="font-size: 2rem;">${Utils.currencyFormat(arr_stock_prices[keyP],0)}</h1>
												</div>
												<div>
													<button onclick="buyItem('${market_item.fkey}')" class="btn btn-primary btn-block deposit-money-btn">${Utils.translate("market_items_buy_item")}</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					`);

					if (min_price[key] == -1 || min_price[key] > parseInt(arr_stock_prices[keyP])) {
						min_price[key] = parseInt(arr_stock_prices[keyP]);
					}
					if (max_price[key] < parseInt(arr_stock_prices[keyP])) {
						max_price[key] = parseInt(arr_stock_prices[keyP]);
					}
				});
			}

			for (const key in config.market_categories) {
				if (min_price[key] == max_price[key]) {
					max_price[key]++;
				}
				$("#filter-items"+key).html(
					`<h2 style="border-bottom: 2px solid #00000033;font-weight: 600;">${Utils.translate("filters_title")}</h2>
					<div style="margin: 20px 0px;">
						<h4 style="margin-bottom: 5px;font-weight: 600;">${Utils.translate("filters_name")}</h4> 
						<input id="filter-name${key}" class="form-control" type="text" placeholder="${Utils.translate("filters_name_placeholder")}">
					</div>
					<label style="margin: 0px 0px 10px;" for="filter-stock${key}">
						<div>
							<h4 for="filter-stock${key}" style="margin-bottom: 5px;font-weight: 600;">${Utils.translate("filters_has_stock")}</h4> 
							<input id="filter-stock${key}" class="filter-name-input" type="checkbox">
						</div>
					</label>
					<div>
						<h4 style="border-top: 2px solid #00000033;margin-top: 10px;padding-top: 20px;font-weight: 600;">${Utils.translate("filters_price")}</h4> 
						<h4 style="margin: 20px 0px;">${Utils.translate("filters_min")}</h4> 
						<div class="range-slider" style='--min:${min_price[key]}; --max:${max_price[key]}; --step:1; --value:${min_price[key]}; --text-value:"${min_price[key]}"; --prefix:"${Utils.getCurrencySymbol()} ";'>
							<input id="filter-min${key}" type="range" min="${min_price[key]}" max="${max_price[key]}" step="1" value="${min_price[key]}" oninput="this.parentNode.style.setProperty('--value',this.value); this.parentNode.style.setProperty('--text-value', JSON.stringify(this.value))">
							<output></output>
							<div class='range-slider__progress'></div>
						</div>
						<h4 style="margin: 20px 0px;margin-top: 0;">${Utils.translate("filters_max")}</h4> 
						<div class="range-slider" style='--min:${min_price[key]}; --max:${max_price[key]}; --step:1; --value:${max_price[key]}; --text-value:"${max_price[key]}"; --prefix:"${Utils.getCurrencySymbol()} ";'>
							<input id="filter-max${key}" type="range" min="${min_price[key]}" max="${max_price[key]}" step="1" value="${max_price[key]}" oninput="this.parentNode.style.setProperty('--value',this.value); this.parentNode.style.setProperty('--text-value', JSON.stringify(this.value))">
							<output></output>
							<div class='range-slider__progress'></div>
						</div>
					</div>
				`);
			}

			$("#player-info-money-container").css("display", "none");
			$("#player-info-container").removeClass("player-info-container-is-owner");
			$("#player-info-container").addClass("player-info-container-is-market");
		} else {
			/*
			* INFO HEADER
			*/
			$("#player-info-money").text(Utils.currencyFormat(store_business.money,0));

			/*
			* STATISTICS PAGE
			*/
			$("#store-name").empty();
			if (store_business.market_name) {
				$("#store-name").append(Utils.translate("str_rename_store") + " <small>(" + store_business.market_name + ")</small>");
			} else {
				$("#store-name").append(Utils.translate("str_rename_store"));
			}

			$("#profile-money-earned").text(Utils.currencyFormat(store_business.total_money_earned));
			$("#profile-money-spent").text(Utils.currencyFormat(store_business.total_money_spent));
			$("#profile-goods").text(Utils.numberFormat(store_business.goods_bought));
			$("#profile-distance-traveled").text(Utils.numberFormat(store_business.distance_traveled) + "km");
			$("#profile-total-visits").text(Utils.numberFormat(store_business.total_visits));
			$("#profile-customers").text(Utils.numberFormat(store_business.customers));
			let stock_capacity = config.market_types.stock_capacity + config.market_types.upgrades.stock.level_reward[store_business.stock_upgrade];
			let stock_capacity_percent = ((store_business.stock_amount * 100)/stock_capacity).toFixed(1);
			let str_low_stock = "";
			if(config.warning == 1){
				str_low_stock = "<small style=\"color:red;\"><b>" + Utils.translate("statistics_page_low_stock") + "</b></small>";
			}else if(config.warning == 2){
				str_low_stock = "<small style=\"color:red;\"><b>" + Utils.translate("statistics_page_low_stock_2") + "</b></small>";
			}
			$("#profile-stock-1").html(stock_capacity_percent + "% " + str_low_stock);
			$("#profile-stock-2").text(Utils.translate("statistics_page_stock").format(store_business.stock_amount,stock_capacity));
			$("#profile-stock-variety").text(Utils.translate("statistics_page_stock_variety").format(store_business.stock_variety.toFixed(1)));
			$("#profile-stock-3").html("<div class=\"progress-bar bg-amber accent-4\" role=\"progressbar\" style=\"width: " + stock_capacity_percent + "%\" aria-valuenow=\"" + stock_capacity_percent + "\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>");
			$("#stock-amount").html(`
				<h4 class="text-uppercase">${Utils.translate("statistics_page_stock_title")}</h4>
				<p>${Utils.translate("statistics_page_stock_desc")}</p>
			`);
			$("#stock-filter-statistics").html(`
				<label class="label-input-filter-production-lines text-nowrap my-0 mx-2" for="input-filter-farms">${Utils.translate("filter_title")}</label>
				<input type="text" name="name" class="form-control" placeholder="${Utils.translate("filter_placeholder")}" oninput="filterOwnerProductsList(this,'stock-products');"> 
			`);
			$("#stock-products").empty();

			/*
			* JOBS PAGE
			*/
			$("#job-page-list").empty();
			$("#hire-page-form").empty();
			$("#hire-page-form").append(`
				<div class="col-4">
					<input id="form_name" type="text" name="name" class="form-control h-100" placeholder="${Utils.translate("hire_page_form_job_name")}" required="required" oninput="Utils.invalidMsg(this);"> 
				</div>
				<div class="col-2">
					<input id="form_reward" type="number" min="1" name="reward" class="form-control h-100" placeholder="${Utils.translate("hire_page_form_reward")}" required="required" oninput="Utils.invalidMsg(this,1);"> 
				</div>
				<div class="col-2">
					<select id="form_product" name="product" class="form-control pl-1 h-100" required="required" onchange="setMaxAmount(this.options[this.selectedIndex].getAttribute('item_id'),this.options[this.selectedIndex].getAttribute('amount'));" oninput="Utils.invalidMsg(this);">
						<option></option>
					</select> 
				</div>
				<div class="col-2" id="form_amount">
					<input type="number" min="1" name="amount" class="form-control h-100" placeholder="${Utils.translate("hire_page_form_amount")}" required="required"> 
				</div>
				<div class="col-2"> 
					<button class="btn btn-primary btn-block h-100">${Utils.translate("hire_page_form")}</button>
				</div>
			`);

			/*
			* CONTRACTS PAGE
			*/
			$("#contracts-page-list").empty();
			for (const store_job of store_jobs) {
				let product = getItemByExactMatchName(store_job.product,market_items);
				if (product) {
					let price = (product.price_to_owner * store_job.amount);
					let discount = Math.floor((price * config.market_types.upgrades.relationship.level_reward[store_business.relationship_upgrade])/100);
					let total_cost = store_job.reward + price-discount;
					$("#contracts-page-list").append(`
						<li class="item-card d-flex justify-content-between card-theme">
							<div class="d-flex flex-row align-items-center"><img class="font-large-2 mr-2 " src="img/items/${product.img}" width="30">
								<div class="ml-2">
									<h6 class="mb-0">${store_job.name}</h6>
									<div class="d-flex flex-row mt-1 text-black-50 small">
										<div><i class="fas fa-coins"></i><span class="ml-2">${Utils.translate("contracts_page_reward")}: ${Utils.currencyFormat(store_job.reward)}</span></div>
										<div class="ml-3"><i class="fas fa-coins"></i><span class="ml-2">${Utils.translate("contracts_page_cost")}: ${Utils.currencyFormat(total_cost)}</span></div>
										<div class="ml-3"><i class="fas fa-dolly-flatbed"></i><span class="ml-2">${Utils.translate("contracts_page_item")}: ${product.name}</span></div>
										<div class="ml-3"><i class="fas fa-boxes"></i><span class="ml-2">${Utils.translate("contracts_page_amount")}: ${store_job.amount}</span></div>
									</div>
								</div>
							</div>
							<div class="d-flex flex-row align-items-center">
								<button onclick="deleteJob(${store_job.id})" class="btn btn-danger">${Utils.translate("contracts_page_delete")}</button>
							</div>
						</li>
					`);
				}
			}

			/*
			* EMPLOYEES PAGE
			*/
			if (item.update != true) {
				$("#input-hire-player").empty();
				$("#input-hire-player").append(`<option></option>`);
				for (const player of players) {
					$("#input-hire-player").append(`<option value="${player.identifier}">${player.name}</option>`);
				}
			}

			$("#hired-players-list").empty();
			for (const user of store_employees) {
				let roles = {};
				roles[user.role] = "selected";
				$("#hired-players-list").append(`
					<li class="d-flex justify-content-between card-theme">
						<div class="d-flex flex-row align-items-center"><img class="font-large-2 mr-2 " src="img/man.png" width="30">
							<div class="ml-2">
								<h6 class="mb-0">${user.name}</h6>
								<div class="d-flex flex-row mt-1 text-black-50 small">
									<div><i class="fas fa-truck-loading"></i><span class="ml-2">${Utils.translate("jobs_done")} ${user.jobs_done}</span></div>
									<div class="ml-3"><i class="fas fa-calendar-alt"></i><span class="ml-2">${Utils.translate("hired_date")} ${Utils.timeConverter(user.timer)}</span></div>
								</div>
							</div>
						</div>
						<div class="d-flex align-self-center">
							<div>
								<select id="change_role" name="role" class="form-control" required="required" style="font-size: 14px;height: 100%;">
									<option user="${user.user_id}" role="1" ${roles[1]??""}>${Utils.translate("basic_access")}</option>
									<option user="${user.user_id}" role="2" ${roles[2]??""}>${Utils.translate("advanced_access")}</option>
									<option user="${user.user_id}" role="3" ${roles[3]??""}>${Utils.translate("full_access")}</option>
								</select>
							</div>
							<div class="d-flex flex-row align-items-center">
								<input style="font-size: 14px;width: 160px;height: 100%;padding: 0px 0px 0px 5px" id="input-give-comission-${user.user_id}" class="input-give-comission form-control ml-3" type="number" min="1" max="9999999" placeholder="${Utils.translate("input_give_comission")}">
								<button onclick="giveComission('${user.user_id}')" class="btn btn-primary ml-3">${Utils.translate("button_give_comission")}</button>
							</div>
							<div class="d-flex flex-row align-items-center">
								<button onclick="firePlayer('${user.user_id}')" class="btn btn-danger ml-3">${Utils.translate("button_fire_employee")}</button>
							</div>
						<div>
					</li>
				`);
			}

			/*
			* UPGRADES PAGE
			*/
			$("#upgrades-page").empty();
			$("#upgrades-page").append(`
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="card shadow-sm border-0">
						<div class="card-body rounded card-theme p-4"><img src="img/upgrades/shop.png" alt="" class="img-fluid d-block mx-auto mb-3">
							<h5>${Utils.translate("upgrade_page_stock")}</h5>
							<p style="height: 65px;" class="small text-muted font-italic">${Utils.translate("upgrade_page_stock_desc")}</p>
							<ul class="small text-muted font-italic">
								<li> ${Utils.translate("upgrade_page_level")} 1: +${config.market_types.upgrades.stock.level_reward[1]} ${Utils.translate("upgrade_page_units")}.</li>
								<li> ${Utils.translate("upgrade_page_level")} 2: +${config.market_types.upgrades.stock.level_reward[2]} ${Utils.translate("upgrade_page_units")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 3: +${config.market_types.upgrades.stock.level_reward[3]} ${Utils.translate("upgrade_page_units")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 4: +${config.market_types.upgrades.stock.level_reward[4]} ${Utils.translate("upgrade_page_units")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 5: +${config.market_types.upgrades.stock.level_reward[5]} ${Utils.translate("upgrade_page_units")}. </li>
							</ul>
							<ul class="justify-content-center d-flex list-inline small">
								${getStarsHTML(store_business.stock_upgrade)}
							</ul>
							<button onclick="buyUpgrade('stock')" class="btn btn-primary btn-block">${Utils.translate("upgrade_page_buy_upgrade")} ${Utils.currencyFormat(config.market_types.upgrades.stock.price,0)}</button>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="card shadow-sm border-0">
						<div class="card-body rounded card-theme p-4"><img src="img/upgrades/delivery-truck.png" alt="" class="img-fluid d-block mx-auto mb-3">
							<h5>${Utils.translate("upgrade_page_truck")}</h5>
							<p style="height: 65px;" class="small text-muted font-italic">${Utils.translate("upgrade_page_truck_desc")}</p>
							<ul class="small text-muted font-italic">
								<li> ${Utils.translate("upgrade_page_level")} 1: +${config.market_types.upgrades.truck.level_reward[1]}% ${Utils.translate("upgrade_page_capacity")}.</li>
								<li> ${Utils.translate("upgrade_page_level")} 2: +${config.market_types.upgrades.truck.level_reward[2]}% ${Utils.translate("upgrade_page_capacity")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 3: +${config.market_types.upgrades.truck.level_reward[3]}% ${Utils.translate("upgrade_page_capacity")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 4: +${config.market_types.upgrades.truck.level_reward[4]}% ${Utils.translate("upgrade_page_capacity")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 5: +${config.market_types.upgrades.truck.level_reward[5]}% ${Utils.translate("upgrade_page_capacity")}. </li>
							</ul>
							<ul class="justify-content-center d-flex list-inline small">
								${getStarsHTML(store_business.truck_upgrade)}
							</ul>
							<button onclick="buyUpgrade('truck')" class="btn btn-primary btn-block">${Utils.translate("upgrade_page_buy_upgrade")} ${Utils.currencyFormat(config.market_types.upgrades.truck.price,0)}</button>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="card shadow-sm border-0">
						<div class="card-body rounded card-theme p-4"><img src="img/upgrades/manager.png" alt="" class="img-fluid d-block mx-auto mb-3">
							<h5>${Utils.translate("upgrade_page_relationship")}</h5>
							<p style="height: 65px;" class="small text-muted font-italic">${Utils.translate("upgrade_page_relationship_desc")}</p>
							<ul class="small text-muted font-italic">
								<li> ${Utils.translate("upgrade_page_level")} 1: ${config.market_types.upgrades.relationship.level_reward[1]}% ${Utils.translate("upgrade_page_discount")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 2: ${config.market_types.upgrades.relationship.level_reward[2]}% ${Utils.translate("upgrade_page_discount")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 3: ${config.market_types.upgrades.relationship.level_reward[3]}% ${Utils.translate("upgrade_page_discount")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 4: ${config.market_types.upgrades.relationship.level_reward[4]}% ${Utils.translate("upgrade_page_discount")}. </li>
								<li> ${Utils.translate("upgrade_page_level")} 5: ${config.market_types.upgrades.relationship.level_reward[5]}% ${Utils.translate("upgrade_page_discount")}. </li>
							</ul>
							<ul class="justify-content-center d-flex list-inline small">
								${getStarsHTML(store_business.relationship_upgrade)}
							</ul>
							<button onclick="buyUpgrade('relationship')" class="btn btn-primary btn-block">${Utils.translate("upgrade_page_buy_upgrade")} ${Utils.currencyFormat(config.market_types.upgrades.relationship.price,0)}</button>
						</div>
					</div>
				</div>
			`);

			/*
			* CATEGORIES PAGE
			*/
			$("#categories-page").empty();
			for (const categoryIdx of config.market_types.categories) {
				const category = config.market_categories[categoryIdx];
				let arrayItems = [];
				for (let k in category.items){
					arrayItems.push(category.items[k].name);
				}
				let examplesItems = arrayItems.join(", ");
				if(examplesItems.length >= 100){
					examplesItems = examplesItems.substring(0,97) + "...";
				}
				if (category) {
					let buy_button_text = `<button onclick="buyCategory('${categoryIdx}')" type="button" class="btn btn-primary white btn-block">${Utils.translate("category_page_buy_button")} ${Utils.currencyFormat(config.market_categories[categoryIdx].category_buy_price,0)}</button>`;
					if (store_categories.find(c => c.category == categoryIdx)) {
						buy_button_text = `<button onclick="sellCategory('${categoryIdx}')" type="button" class="btn btn-outline-danger btn-block">${Utils.translate("category_page_sell_button")} ${Utils.currencyFormat(config.market_categories[categoryIdx].category_sell_price,0)}</button>`;
					}
					$("#categories-page").append(`
						<div class="col-4 mb-3">
							<div class="card card-theme rounded shadow-sm" style="max-height: 367px;">
								<div class="card-body p-4"> 
									<img src="${category.page_img}" style="height:100 !important" class="img-fluid d-block mx-auto mb-3">
									<h5 href="#" class="text-center">${config.market_categories[categoryIdx].page_name}</h5>
									<h6 class="align-items-center">${Utils.translate("category_page_count_items").format(arrayItems.length)}</h6>
									<h6 class="text-muted align-items-center">${Utils.translate("category_page_example_items")}:</h6>
									<h6 class="ml-1 text-muted" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis !important; display: inherit;"><small>${examplesItems}
									</small></h6>
									<div class="d-flex mx-3 mt-3 mb-2">
										${buy_button_text}
									</div>
								</div>
							</div>
						</div>
					`);
				}
			}

			/*
			* BANK PAGE
			*/
			$("#bank-money").text(Utils.currencyFormat(store_business.money,2));

			$("#withdraw-modal-money-available").text(`${Utils.translate("bank_page_modal_money_available").format(Utils.currencyFormat(store_business.money))}`);
			$("#deposit-modal-money-available").text(`${Utils.translate("bank_page_modal_money_available").format(Utils.currencyFormat(item.dados.available_money))}`);

			$("#balance-table-body").empty();
			$("#balance-table-container").css("display", "none");
			appendBalanceTable(store_balance);

			/*
			* ITEMS LISTS
			*/
			let sortedMarketItems = Object.keys(market_items).map(key => {
				let fkey = key.replace("|", "-x-");
				let market_item = market_items[key];
				market_item.fkey = fkey;
				return market_item;
			}).sort((a, b) => a.name.localeCompare(b.name));

			// Iterate over sorted items array
			sortedMarketItems.forEach(market_item => {
				let fkey = market_item.fkey;
				let key = fkey.replace("-x-", "|");
				let amount = (market_item.amount_to_owner + Math.floor(market_item.amount_to_owner * (config.market_types.upgrades.truck.level_reward[store_business.truck_upgrade] / 100)));
				let discount = ((market_item.price_to_owner * config.market_types.upgrades.relationship.level_reward[store_business.relationship_upgrade]) / 100);
				let final_price = market_item.price_to_owner - discount;

				// Append to job-page-list
				$("#job-page-list").append(`
					<div data-name="${market_item.name}" class="item-card">
						<label class="d-block m-0">
						<li class="d-flex justify-content-between card-theme">
							<div class="d-flex flex-row align-items-center">
								<input type="checkbox" class="job-page-item-checkbox item-list-checkbox mr-2" data-id="${market_item.fkey}" data-name="${market_item.name}" data-image="${market_item.img}" data-amount="${amount}" data-label-amount="${amount}" data-price="${final_price}">
								<img class="font-large-2 mr-2 " src="img/items/${market_item.img}" width="30">
								<div class="ml-2">
									<h6 class="mb-0">${market_item.name}</h6>
									<div class="d-flex flex-row mt-1 text-black-50 small">
										<div><i class="fas fa-coins"></i><span class="ml-2">${Utils.translate("jobs_page_cost")}: ${Utils.currencyFormat(final_price)}</span></div>
										<div class="ml-3"><i class="fas fa-dolly"></i><span class="ml-2">${Utils.translate("jobs_page_max_amount")}: ${amount}</span></div>
									</div>
								</div>
							</div>
							<form class="mb-0 mt-0" id="jobs-form" role="form">
								<div class="d-flex flex-row h-100">
									<button onclick="showModalStoreProductsFromInventory('${market_item.fkey}', '${market_item.name}', '${market_item.img}')" class="btn btn-primary">${Utils.translate("jobs_page_store_item")}</button>
								</div>
							</form>
						</li>
						</label>
					</div>
				`);

				// Select box (contracts page)
				$("#form_product").append(`
					<option item_id="${key}" amount="${market_item.amount_to_delivery}" >${market_item.name}</option>
				`);

				if(arr_stock_prices[key] == undefined) {
					arr_stock_prices[key] = market_item.price_to_customer;
				}

				let stock_value = arr_stock[key] == undefined ? Utils.numberFormat(0) : Utils.numberFormat(arr_stock[key]);
				let stock_style = stock_value == 0 ? " text-danger" : "";

				// Stock amount (statistics page)
				$("#stock-products").append(`
					<div data-name="${market_item.name}" class="item-card">
						<label class="d-block m-0">
						<li class="d-flex justify-content-between card-theme">
							<div class="d-flex flex-row align-items-center">
								<input type="checkbox" class="stock-page-item-checkbox item-list-checkbox mr-2" data-id="${market_item.fkey}" data-name="${market_item.name}" data-image="${market_item.img}" data-amount="${amount}" data-label-amount="${Math.min(amount, stock_value)}" data-price="${market_item.price_to_export}">
								<img class="font-large-2 mr-2 " src="img/items/${market_item.img}" width="30">
								<div class="ml-2">
									<h6 class="mb-0">${market_item.name}</h6>
									<div class="d-flex flex-row mt-1 text-black-50 small">
										<div><i class="fas fa-coins"></i><span class="ml-2">${Utils.translate("statistics_page_price")}: ${Utils.currencyFormat(arr_stock_prices[key]) }</span></div>
										<div class="ml-3"><i class="fas fa-money-bill-transfer"></i><span class="ml-2">${Utils.translate("statistics_page_export_price")}: ${Utils.currencyFormat(market_item.price_to_export) }</span></div>
										<div class="ml-3${stock_style}" ><i class="fas fa-boxes-stacked"></i><span class="ml-2">${Utils.translate("statistics_page_stock_amount")}: ${Utils.numberFormat(stock_value) }</span></div>
									</div>
								</div>
							</div>
							<div class="d-flex flex-row">
								<span class="form-control textbox ml-3 text-muted"> 
									${Utils.getCurrencySymbol()}
									<input id="input-price-${fkey}" min="1" type="number" name="amount" required="required" placeholder="${Utils.translate("statistics_page_price_input")}"/>
								</span>
								<button onclick="setPrice('${fkey}')" class="btn btn-primary ml-3 mt-0">${Utils.translate("statistics_page_set_price")}</button>
							</div>
						</li>
						</label>
					</div>
				`);
			});
			$("#stock-filter-contracts").empty();
			$("#stock-filter-contracts").append(`
				<label class="label-input-filter-production-lines text-nowrap my-0 mx-2" for="input-filter-farms">${Utils.translate("filter_title")}</label>
				<input type="text" name="name" class="form-control" placeholder="${Utils.translate("filter_placeholder")}" oninput="filterOwnerProductsList(this,'job-page-list');"> 
			`);

			if(item.update != true){
				// Sidebar
				$("#nav-bar").empty();
				$("#nav-bar").append(`
					<li id="sidebar-main" onclick="openPage('main')">
						<i class="fas fa-store-alt"></i>
						<span class="tooltip">${Utils.translate("navbar_main_page")}</span>
					</li>
					<li id="sidebar-stock" onclick="openPage('stock')">
						<i class="fas fa-boxes-stacked"></i>
						<span class="tooltip">${Utils.translate("navbar_stock_page")}</span>
					</li>
					<li id="sidebar-goods" onclick="openPage('goods')">
						<i class="fas fa-box-open"></i>
						<span class="tooltip">${Utils.translate("navbar_goods_page")}</span>
					</li>
					<li id="sidebar-category" onclick="openPage('categories')">
						<i class="fas fa-box"></i>
						<span class="tooltip">${Utils.translate("navbar_category_page")}</span>
					</li>
					<li id="sidebar-hire" onclick="openPage('hire')">
						<i class="fas fa-users"></i>
						<span class="tooltip">${Utils.translate("navbar_hire_page")}</span>
					</li>
					<li id="sidebar-employee" onclick="openPage('employee')">
						<i class="fas fa-user-tie"></i>
						<span class="tooltip">${Utils.translate("navbar_employee_page")}</span>
					</li>
					<li id="sidebar-upgrades" onclick="openPage('upgrades')">
						<i class="fas fa-chart-line"></i>
						<span class="tooltip">${Utils.translate("navbar_upgrades_page")}</span>
					</li>
					<li id="sidebar-bank" onclick="openPage('bank')">
						<i class="fas fa-cash-register"></i>
						<span class="tooltip">${Utils.translate("navbar_bank_page")}</span>
					</li>
					<li href="#myModal" data-toggle="modal" >
						<i class="fas fa-times text-danger"></i>
						<span class="tooltip">${Utils.translate("navbar_sell_btn")}</span>
					</li>
				`);

				// Statistics page
				$("#store-name-desc").text(Utils.translate("str_rename_store_desc"));
				$("#form_blip_color").html(Utils.translate("html_select_colors"));
				$("#form_blip_id").html(Utils.translate("html_select_type"));
				$("#apply-rename").text(Utils.translate("btn_apply_rename"));
				$("#text-rename").html(`<input id="form_name" type="text" name="name" class="form-control" placeholder="${Utils.translate("str_rename_store_name")}" required="required" oninput="Utils.invalidMsg(this);"> `);
				$("#main-page-title").text(Utils.translate("statistics_page_title"));
				$("#main-page-desc").text(Utils.translate("statistics_page_desc"));
				$("#profile-money-earned-2").text(Utils.translate("statistics_page_money_earned"));
				$("#profile-money-spent-2").text(Utils.translate("statistics_page_money_spent"));
				$("#profile-goods-2").text(Utils.translate("statistics_page_goods"));
				$("#profile-distance-traveled-2").text(Utils.translate("statistics_page_distance_traveled"));
				$("#profile-total-visits-2").text(Utils.translate("statistics_page_total_visits"));
				$("#profile-customers-2").text(Utils.translate("statistics_page_customers"));

				if (config.disable_rename_business) {
					$("#rename-business-container").css("display", "none");
				}

				// Stock page
				$("#stock-footer-button-import").text(Utils.translate("statistics_page_stock_export_products"));

				// Goods page
				$("#goods-page-title").text(Utils.translate("goods_page_title"));
				$("#goods-page-desc").text(Utils.translate("goods_page_desc"));
				$("#goods-footer-button-import").text(Utils.translate("jobs_page_import_products"));

				// Hire page
				$("#hire-page-title").text(Utils.translate("hire_page_title"));
				$("#hire-page-desc").text(Utils.translate("hire_page_desc"));

				// Upgrades page
				$("#upgrades-page-title").text(Utils.translate("upgrades_page_title"));
				$("#upgrades-page-desc").text(Utils.translate("upgrades_page_desc"));

				// Employees page
				$("#employees-title").text(Utils.translate("employees_title"));
				$("#employees-page-desc").text(Utils.translate("employees_desc"));
				$("#button-hire-player").text(Utils.translate("button_employee"));

				// Bank page
				$("#bank-page-title").text(Utils.translate("bank_page_title"));
				$("#bank-page-desc").text(Utils.translate("bank_page_desc"));
				$("#withdraw-money-btn").text(Utils.translate("bank_page_withdraw"));
				$("#deposit-money-btn").text(Utils.translate("bank_page_deposit"));
				$("#bank-balance-text").text(`${Utils.translate("bank_page_balance_text")}`);

				$("#balance-table-title").text(`${Utils.translate("bank_page_balance_table_title")}`);
				$("#balance-title").text(`${Utils.translate("bank_page_balance_title")}`);
				$("#balance-value").text(`${Utils.translate("bank_page_balance_value")}`);
				$("#balance-date").text(`${Utils.translate("bank_page_balance_date")}`);
				$("#bank-page-show-hidden").text(Utils.translate("bank_page_hidden_balance"));

				$("#deposit-modal-title").text(`${Utils.translate("bank_page_deposit_modal_title")}`);
				$("#deposit-modal-desc").text(`${Utils.translate("bank_page_deposit_modal_desc")}`);
				$("#deposit-modal-money-amount").attr("placeholder",Utils.translate("bank_page_modal_placeholder"));
				$("#deposit-modal-cancel").text(`${Utils.translate("bank_page_modal_cancel")}`);
				$("#deposit-modal-submit").text(`${Utils.translate("bank_page_deposit_modal_submit")}`);

				$("#withdraw-modal-title").text(`${Utils.translate("bank_page_withdraw_modal_title")}`);
				$("#withdraw-modal-desc").text(`${Utils.translate("bank_page_withdraw_modal_desc")}`);
				$("#withdraw-modal-money-amount").attr("placeholder",Utils.translate("bank_page_modal_placeholder"));
				$("#withdraw-modal-cancel").text(`${Utils.translate("bank_page_modal_cancel")}`);
				$("#withdraw-modal-submit").text(`${Utils.translate("bank_page_withdraw_modal_submit")}`);

				// Categories page
				$("#categories-page-title").text(Utils.translate("categories_page_title"));
				$("#categories-page-desc").text(Utils.translate("categories_page_desc"));

				// Sell modal
				$("#modal-confirm-title-sell").text(Utils.translate("modal_title"));
				$("#modal-cancel-sell").text(Utils.translate("cancel_button_modal"));
				$("#modal-confirm-sell").text(Utils.translate("confirm_sell_button_modal"));
				$("#modal-p-sell").text(Utils.translate("confirm_sell_store"));

				// Show UI
				$("#payments").css("display", "none");

				$("#player-info-money-container").css("display", "flex");
				$("#player-info-container").removeClass("player-info-container-is-market");
				$("#player-info-container").addClass("player-info-container-is-owner");

				$("#css-toggle").prop("checked", store_users_theme.dark_theme).change();

				openPage("main");
				$(".sidebar-navigation ul li").removeClass("active");
				$("#sidebar-main").addClass("active");

				for (const page in config.roles_permissions) {
					if (role_level_id < config.roles_permissions[page]){
						$("#sidebar-"+page).css("display", "none");
					} else {
						$("#sidebar-"+page).css("display", "");
					}
				}
				$(".main").fadeIn(200);
			}
			$(document).ready(function() {
				$("#form_product").select2({
					placeholder: Utils.translate("jobs_page_select_product"),
				});
				$("#input-hire-player").select2({
					placeholder: Utils.translate("select_employee"),
				});
			});
		}

		$("form").submit(function(e){
			e.preventDefault();
		});

		$(".sidebar-navigation ul li").on("click", function() {
			$("li").removeClass("active");
			$(this).addClass("active");
		});

		$("#change_role").change(function() {
			changeRole($("option:selected", this).attr("user"),$("option:selected", this).attr("role"));
		});
	}
	if (item.hidemenu){
		$(".main").fadeOut(200);
	}
});

/*=================
	FUNCTIONS
=================*/

$("#show-hidden-balance").change(function() {
	if($(this).is(":checked")) {
		$(".hidden-balance").css("display", "");
	} else {
		$(".hidden-balance").css("display", "none");
	}
});

function filterItems(category) {
	let name = document.getElementById("filter-name"+category).value;
	let stock = document.getElementById("filter-stock"+category).checked;
	let min = document.getElementById("filter-min"+category).value;
	let max = document.getElementById("filter-max"+category).value;
	let list = document.getElementById("market-products"+category).getElementsByClassName("item-card");
	if (list && list.length > 0) {
		for (const cards of list) {
			cards.style.display = "";
			if (name != "" && !cards.dataset.name.toLowerCase().includes(name.toLowerCase())) {
				cards.style.display = "none";
			}
			if (stock && cards.dataset.stock == 0) {
				cards.style.display = "none";
			}
			if (parseInt(cards.dataset.price) < parseInt(min) || parseInt(cards.dataset.price) > parseInt(max)) {
				cards.style.display = "none";
			}
		}
	}
}

function filterOwnerProductsList(element,id) {
	let list = document.getElementById(id).getElementsByClassName("item-card");
	if (list && list.length > 0) {
		for (const cards of list) {
			cards.style.display = "";
			if (element.value != "" && !cards.dataset.name.toLowerCase().includes(element.value.toLowerCase())) {
				cards.style.display = "none";
			}
		}
	}
}

function openPage(pageN){
	if (config.roles_permissions[pageN] == undefined || role_level_id >= config.roles_permissions[pageN]){
		$(".pages").css("display", "none");
		$("."+pageN+"-page").css("display", "block");

		let titleHeight = $(`#${pageN}-title-div`).outerHeight(true) ?? 0;
		let footerHeight = $(`#${pageN}-footer-div`).outerHeight(true) ?? 0;
		$(":root").css(`--${pageN}-title-height`, (titleHeight+footerHeight) + "px");
	}
}


function setMaxAmount(item_id,amount){
	$("#form_amount").empty();
	$("#form_amount").append(`
		<input type="number" min="1" max="${amount}" name="amount" class="form-control h-100" placeholder="${Utils.translate("hire_page_form_amount")}" required="required" oninput="Utils.invalidMsg(this,1,${amount});""> 
	`);
}

function appendBalanceTable(store_balance) {
	for (const balance of store_balance) {
		let tstyle = "";
		let tclass = "";
		let tbutton = `<button class="btn btn-outline-primary" style="min-width: 200px;" onclick="hideBalance(${balance.id})" >${Utils.translate("bank_page_hide_balance")}</button>`;
		if (balance.hidden == 1) {
			if (!$("#show-hidden-balance").is(":checked")) {
				tstyle = "style=\"display: none !important;\"";
			}
			tclass = "hidden-balance";
			tbutton = `<button class="btn btn-outline-success" style="min-width: 200px;" onclick="showBalance(${balance.id})" >${Utils.translate("bank_page_show_balance")}</button>`;
		}

		let tcolor = "text-success";
		if (balance.income == 1) {
			tcolor = "text-danger";
		}

		$("#balance-table-body").append(`
			<tr class="${tclass}" ${tstyle}>
				<td>${balance.title}</td>
				<td class="${tcolor}">${Utils.currencyFormat(balance.amount)}</td>
				<td>${Utils.timeConverter(balance.date)}</td>
				<td>${tbutton}</td>
			</tr>
		`);
		$("#balance-table-container").css("display", "");
	}
	if (store_balance.length >= 50) {
		$("#balance-table-body").append(`
			<tr id="load-more-row">
				<td colspan="4">
					<div class="d-flex align-items-center justify-content-center">
						<button class="btn btn-primary" style="min-width: 200px;" onclick="loadBalanceHistory(${store_balance.slice(-1)[0].id})" >${Utils.translate("bank_page_load_balance")}</button>
					</div>
				</td>
			</tr>
		`);
	}
}

function getStarsHTML(value){
	let html = "";
	for (let i = 1; i <= 5; i++) {
		if(i <= value){
			html += "<li class=\"list-inline-item m-1\"><i class=\"fa-solid fa-star amber accent-4 font-large-1\"></i></li>";
		}else{
			html += "<li class=\"list-inline-item m-1\"><i class=\"fa-regular fa-star amber accent-4 font-large-1\"></i></li>";
		}
	}
	return html;
}

function getPagination(pagination){
	let html = "";
	for (let i = 0; i <= 5; i++) {
		if(pagination[i] == undefined){
			return html;
		}
		html +=`
		<li id="sidebar-${i}" onclick="openPage(${i})">
			<i class="fas fa-store"></i>
			<span class="tooltip">${pagination[i]}</span>
		</li>`;
	}
	return html;
}

function getItemByExactMatchName(product, market_items){
	for (let key in market_items) {
		if (key.toLowerCase() === product.toLowerCase()) {
			return market_items[key];
		}
	}
}

function showModalImportProducts(isImport) {
	// Get all checkboxes
	const checkboxes = $(isImport ? ".job-page-item-checkbox" : ".stock-page-item-checkbox");

	// Initialize an array to hold selected items
	let selectedItems = [];

	// Loop through each checkbox
	checkboxes.each(function () {
		// Check if the checkbox is selected
		if ($(this).is(":checked")) {
			const itemId = $(this).data("id");
			const itemName = $(this).data("name");
			const itemImage = $(this).data("image");
			const itemPrice = $(this).data("price");
			const itemMaxAmount = $(this).data("amount");
			const itemLabelMaxAmount = $(this).data("label-amount");
			selectedItems.push({ id: itemId, name: itemName, image: itemImage, price: itemPrice, maxAmount: itemMaxAmount, labelMaxAmount: itemLabelMaxAmount });
		}
	});

	// If no items are selected, return early
	if (selectedItems.length === 0) {
		Utils.post("notify", { type: "error", msg: Utils.translate("jobs_page_must_select_checkbox") });
		return; // Exit the function if no items are selected
	}

	// Generate the table rows dynamically based on selected items
	let tableRows = "";
	selectedItems.forEach((item) => {
		tableRows += `
			<tr class="border-right border-left border-bottom">
				<td class="d-flex align-items-center text-left"><img src="img/items/${item.image}" class="mr-2" style="width: 40px;">${item.name}</td>
				<td class="align-middle">${Utils.currencyFormat(item.price)}</td>
				<td class="align-middle">${item.labelMaxAmount}</td>
				<td><input type="number" class="form-control item-amount-input" id="item-amount-${item.id}" min="0" value="0" max="${item.labelMaxAmount}" data-max="${item.maxAmount}"></td>
			</tr>
		`;
	});
	tableRows += `
		<tr class="border-right border-left border-bottom">
			<td class="font-weight-semi-bold text-right" colspan="3">${Utils.translate("jobs_page_modal_final_price")}</td>
			<td id="goods-import-final-value" class="font-weight-semi-bold text-right pr-4">${Utils.currencyFormat(0)}</td>
		</tr>
	`;

	let progressBarPercent = 0;

	// Function to update progress bar and restrict amounts dynamically
	function updateProgressBar() {
		let totalChosenPercentage = 0;
		let totalPrice = 0;

		// Calculate total chosen percentage
		selectedItems.forEach(item => {
			const amount = parseInt($(`#item-amount-${item.id}`).val(), 10) || 0;
			const maxAmount = parseInt(item.maxAmount, 10);
			const itemPercentage = (amount / maxAmount) * 100;
			totalChosenPercentage += itemPercentage;
			totalPrice += amount * item.price;
		});

		// Update the progress bar
		const progressBar = $("#goods-import-progress-bar");
		progressBar.css("width", `${Math.min(100, totalChosenPercentage)}%`);
		progressBar.attr("aria-valuenow", totalChosenPercentage);
		progressBar.text(`${totalChosenPercentage.toFixed(2)}%`);

		// Change background based on the percentage
		if (totalChosenPercentage > 100) {
			progressBar.removeClass("bg-primary").addClass("bg-danger");
		} else {
			progressBar.removeClass("bg-danger").addClass("bg-primary");
		}

		// Change final import value
		$("#goods-import-final-value").text(Utils.currencyFormat(totalPrice));
	}

	const modalStoreProductsFromInventory = {
		title: `${Utils.translate(isImport ? "jobs_page_import_products" : "statistics_page_stock_export_products")}`,
		bodyHtml: `
				<h6 class="mb-3">${Utils.translate(isImport ? "jobs_page_modal_body_text" : "statistics_page_stock_export_body_text")}</h6>
				<div class="goods-table-container">
					<table class="table text-center">
						<thead>
							<tr>
								<th class="border-top-0 pt-0 text-left align-middle" style="width: 40%;">${Utils.translate("jobs_page_modal_name")}</th>
								<th class="border-top-0 pt-0 align-middle" style="width: 20%;">${Utils.translate("jobs_page_modal_price")}</th>
								<th class="border-top-0 pt-0 align-middle" style="width: 20%;">${Utils.translate("jobs_page_modal_max_amount")}</th>
								<th class="border-top-0 pt-0 align-middle" style="width: 20%;">${Utils.translate("jobs_page_modal_amount")}</th>
							</tr>
						</thead>
						<tbody>
							${tableRows}
						</tbody>
					</table>
					<span>${Utils.translate("jobs_page_modal_truck_capacity")}</span>
					<div class="progress mb-3" style="height: 20px;">
						<div id="goods-import-progress-bar" class="progress-bar bg-primary" role="progressbar" style="width: ${progressBarPercent}%; font-weight: 600; font-size: 13px;" aria-valuenow="${progressBarPercent}" aria-valuemin="0" aria-valuemax="100">${progressBarPercent}%</div>
					</div>
				</div>
				`,
		buttons: [
			{ text: Utils.translate("confirmation_modal_cancel_button"), class: "btn btn-outline-primary", dismiss: true },
			{ text: Utils.translate("confirmation_modal_confirm_button"), class: "btn btn-primary", dismiss: false, type: "submit" },
		],
		onSubmit: function () {
			// Collect the item IDs and amounts selected by the user
			let selectedData = [];
			selectedItems.forEach(item => {
				const amount = $(`#item-amount-${item.id}`).val();
				if (amount > 0) {
					selectedData.push({ item_id: item.id, amount: amount });
				}
			});

			Utils.post(isImport ? "startImportJob" : "startExportJob", selectedData);
		},
	};

	Utils.showCustomModal(modalStoreProductsFromInventory);

	// Add event listeners to all input fields to update the progress bar dynamically
	$(".item-amount-input").on("input", updateProgressBar);
}

function showModalStoreProductsFromInventory(fkey, name, img) {
	const modalStoreProductsFromInventory = {
		title: `${Utils.translate("jobs_page_store_item")}: ${name}`,
		bodyHtml: `<div class="d-flex justify-content-center m-2"><img src="img/items/${img}" class="w-25"></div>`,
		buttons: [
			{ text: Utils.translate("confirmation_modal_cancel_button"), class: "btn btn-outline-primary", dismiss: true },
			{ text: Utils.translate("confirmation_modal_confirm_button"), class: "btn btn-primary", dismiss: false, type: "submit" },
		],
		inputs: [
			{
				type: "number",
				label: Utils.translate("jobs_page_modal_store_item_body"),
				id: "number-input-id",
				name: "store-from-inventory-input-name",
				value: 1,
				min: 1,
				required: true,
				placeholder: Utils.translate("jobs_page_amount"),
			},
		],
		onSubmit: function(formData) {
			let amount = formData.get("store-from-inventory-input-name");
			storeProductFromInventory(fkey,amount);
		},
	};
	Utils.showCustomModal(modalStoreProductsFromInventory);
}

$("#buyModal").on("hidden.bs.modal", function () {
	closeUI();
});

/*=================
	CALLBACKS
=================*/

function closeUI(){
	Utils.post("close","");
}
function startExportJob(item_id){
	item_id = item_id.replace("-x-", "|");
	Utils.showDefaultModal(() => Utils.post("startExportJob",{item_id:item_id}), Utils.translate("confirmation_modal_export_all"));
}
function storeProductFromInventory(item_id,amount){
	Utils.post("storeProductFromInventory",{item_id:item_id,amount:amount});
}
function setPrice(item_id){
	let price = $("#input-price-"+item_id).val();
	item_id = item_id.replace("-x-", "|");
	Utils.post("setPrice",{item_id:item_id,price:price});
}
function loadBalanceHistory(last_balance_id){
	$("#spinner").fadeIn("fast");
	Utils.post("loadBalanceHistory", { last_balance_id }, "loadBalanceHistory", function (store_balance) {
		$("#load-more-row").remove();
		if (store_balance.length > 0) {
			appendBalanceTable(store_balance);
		}
		$("#spinner").fadeOut("fast");
	});
}
$(document).ready( function() {
	$("#css-toggle").on("change", function(){
		if($(this).prop("checked") == false){
			// Light theme
			$("#css-bs-light").prop("disabled", false);
			$("#css-light").prop("disabled", false);
			$("#css-bs-dark").prop("disabled", true);
			$("#css-dark").prop("disabled", true);
			$("#dark-theme-icon").css("display", "");
			$("#light-theme-icon").css("display", "none");
			changeTheme(0);
		} else if($(this).prop("checked") == true){
			// Dark theme
			$("#css-bs-dark").prop("disabled", false);
			$("#css-dark").prop("disabled", false);
			$("#css-bs-light").prop("disabled", true);
			$("#css-light").prop("disabled", true);
			$("#dark-theme-icon").css("display", "none");
			$("#light-theme-icon").css("display", "");
			changeTheme(1);
		}
	});

	$("#buy-store-form").on("submit", function(e){
		e.preventDefault();
		let input = document.getElementById("input-select-category");
		let category = input.options[input.selectedIndex].getAttribute("category_id");
		$("#buyModal").modal("hide");
		Utils.post("buyMarket",{category});
	});
	$("#contact-form").on("submit", function(e){
		e.preventDefault();
		let form = $("#contact-form").serializeArray();
		let input = document.getElementById("form_product");
		let item_id = input.options[input.selectedIndex].getAttribute("item_id");
		Utils.post("createJob",{name:form[0].value,reward:form[1].value,product:item_id,amount:form[3].value});
	});

	$("#rename-form").on("submit", function(e){
		e.preventDefault();
		let form = $("#rename-form").serializeArray();
		let form_blip_color = document.getElementById("form_blip_color");
		let color_id = form_blip_color.options[form_blip_color.selectedIndex].getAttribute("color_id");
		let form_blip_id = document.getElementById("form_blip_id");
		let blip_id = form_blip_id.options[form_blip_id.selectedIndex].getAttribute("blip_id");
		Utils.post("renameMarket",{name:form[0].value,color:color_id,blip:blip_id});
	});

	$("#form-deposit-money").on("submit", function(e){
		e.preventDefault();
		let form = $("#form-deposit-money").serializeArray();
		$("#deposit-modal-money-amount").val(null);
		$("#deposit-modal").modal("hide");
		Utils.post("depositMoney",{amount:form[0].value});
	});

	$("#form-withdraw-money").on("submit", function(e){
		e.preventDefault();
		let form = $("#form-withdraw-money").serializeArray();
		$("#withdraw-modal-money-amount").val(null);
		$("#withdraw-modal").modal("hide");
		Utils.post("withdrawMoney",{amount:form[0].value});
	});
});
function buyItem(item_id){
	let paymentMethod = $("input[name=payment-method]:checked").val();
	let amount = $("#input-"+item_id).val();
	item_id = item_id.replace("-x-", "|");
	Utils.post("buyItem",{item_id:item_id,amount:amount,paymentMethod:paymentMethod});
}
function deleteJob(job_id){
	Utils.post("deleteJob",{job_id:job_id});
}
function buyUpgrade(id){
	Utils.post("buyUpgrade",{id:id});
}
function sellMarket(){
	Utils.post("sellMarket",{});
}
function buyCategory(category){
	Utils.post("buyCategory",{category});
}
function sellCategory(category){
	Utils.showDefaultDangerModal(() => Utils.post("sellCategory",{category}), Utils.translate("confirmation_modal_sell_category"));
}
function hirePlayer() {
	let user = document.getElementById("input-hire-player").value;
	$("#input-hire-player").val($("#input-hire-player option:first").val());
	Utils.post("hirePlayer",{user});
}

function firePlayer(user) {
	Utils.showDefaultDangerModal(() => Utils.post("firePlayer",{user}), Utils.translate("confirmation_modal_fire_player"));
}
function giveComission(user) {
	let amount = document.getElementById("input-give-comission-"+user).value;
	document.getElementById("input-give-comission-"+user).value = null;
	Utils.post("giveComission",{user,amount});
}
function changeRole(user_id,role){
	Utils.post("changeRole",{user_id:user_id,role:role});
}
function hideBalance(balance_id){
	Utils.post("hideBalance",{balance_id:balance_id});
}
function showBalance(balance_id){
	Utils.post("showBalance",{balance_id:balance_id});
}
function changeTheme(dark_theme){
	Utils.post("changeTheme",{dark_theme});
}