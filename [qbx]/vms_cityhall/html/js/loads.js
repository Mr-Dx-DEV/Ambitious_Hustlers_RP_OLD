const loadTranslation = () => {
    //  █▀▄ ▄▀▄ █▀▄ ██▀ █▀▄ ▄▀▀   █▄ ▄█ ██▀ █▄ █ █ █
    //  █▀  █▀█ █▀  █▄▄ █▀▄ ▄██   █ ▀ █ █▄▄ █ ▀█ ▀▄█
    $('.papers-menu .header .name').html(translation.papers_menu.menu_title);


    // ▄▀▀ █ ▀█▀ ▀▄▀ █▄█ ▄▀▄ █   █  
    // ▀▄▄ █  █   █  █ █ █▀█ █▄▄ █▄▄
    $('.cityhall-menu .header .name').html(translation.cityhall.menu_title);

    $('.cityhall-menu > div> .menu > .side-bar > div[data-href="main"] > .name > p.title').text(translation.cityhall.side_bar.main.title);
    $('.cityhall-menu > div> .menu > .side-bar > div[data-href="main"] > .name > p.description').text(translation.cityhall.side_bar.main.description);

    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="jobs"] > .name > p.title').text(translation.cityhall.side_bar.jobcenter.title);
    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="jobs"] > .name > p.description').text(translation.cityhall.side_bar.jobcenter.description);

    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="insurance"] > .name > p.title').text(translation.cityhall.side_bar.insurances.title);
    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="insurance"] > .name > p.description').text(translation.cityhall.side_bar.insurances.description);

    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="licenses"] > .name > p.title').text(translation.cityhall.side_bar.documents.title);
    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="licenses"] > .name > p.description').text(translation.cityhall.side_bar.documents.description);

    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="fines"] > .name > p.title').text(translation.cityhall.side_bar.fines.title);
    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="fines"] > .name > p.description').text(translation.cityhall.side_bar.fines.description);

    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="taxes"] > .name > p.title').text(translation.cityhall.side_bar.taxes.title);
    $('.cityhall-menu > div > .menu > .side-bar > div[data-href="taxes"] > .name > p.description').text(translation.cityhall.side_bar.taxes.description);

    $('.cityhall-menu > div >.header #streamer-mode').text(translation.cityhall.streamer_mode_btn)

    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .header').text(translation.cityhall.main.about_you.header)

    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"] .header').text(translation.cityhall.main.paychecks.header)
    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"] .buttons > .btn p').html(translation.cityhall.main.paychecks.withdraw_btn)

    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="housings"] .header').text(translation.cityhall.main.housings.header);
    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="housings"] .title').text(translation.cityhall.main.housings.title);
    $('.cityhall-menu div[data-type="main"] table > thead > tr > th > span#address').text(translation.cityhall.main.housings.table_address);

    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="taxes-list"] .header').text(translation.cityhall.main.taxes.header);
    $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="taxes-list"] .title').text(translation.cityhall.main.taxes.title);

    $('.cityhall-menu > div > .menu > .main > div[data-type="jobs"] > div .header').text(translation.cityhall.jobcenter.header);
    $('.cityhall-menu > div > .menu > .main > div[data-type="jobs"] > div .title').text(translation.cityhall.jobcenter.title);

    $('.cityhall-menu > div > .menu > .main > div[data-type="fines"] > div .header').text(translation.cityhall.fines.header);
    $('.cityhall-menu > div > .menu > .main > div[data-type="fines"] > div .title').text(translation.cityhall.fines.title);

    $('.cityhall-menu > div > .menu > .main > div[data-type="taxes"] > div .header').text(translation.cityhall.taxes.header);
    $('.cityhall-menu > div > .menu > .main > div[data-type="taxes"] > div .title').text(translation.cityhall.taxes.title);

    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="my-insurance"] .header').text(translation.cityhall.insurances.health.header)
    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="my-insurance"] .title').text(translation.cityhall.insurances.health.title)
    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="my-insurance"] .select-time > .name').text(translation.cityhall.insurances.health.select_time);
    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="my-insurance"] > .purchase').text(translation.cityhall.insurances.health.purchase_btn);

    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] .header').text(translation.cityhall.insurances.vehicles.header)
    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] .title').text(translation.cityhall.insurances.vehicles.title)
    $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] .select-time > .name').text(translation.cityhall.insurances.vehicles.select_time);

    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] .header').text(translation.cityhall.documents.documents_list.header);
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] .title').text(translation.cityhall.documents.documents_list.title);

    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .header').text(translation.cityhall.documents.photos_list.header);
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .title').text(translation.cityhall.documents.photos_list.title);

    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"] .header').text(translation.cityhall.documents.owned_documents_list.header);
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"] .title').text(translation.cityhall.documents.owned_documents_list.title);

    $('.cityhall-menu > div > .menu > .select-vehicle > div > .header > p.name').html(translation.cityhall.select_vehicle_menu.menu_title);
    $('.cityhall-menu > div > .menu > .select-vehicle > div > .menu > table > thead span#model').html(translation.cityhall.select_vehicle_menu.table_model);
    $('.cityhall-menu > div > .menu > .select-vehicle > div > .menu > table > thead span#plate').html(translation.cityhall.select_vehicle_menu.table_plate);
    $('.cityhall-menu > div > .menu > .select-vehicle > div > .menu > table > thead span#vin').html(translation.cityhall.select_vehicle_menu.table_vin);
    $('.cityhall-menu > div > .menu > .select-vehicle > div > .menu > table > thead span#action').html(translation.cityhall.select_vehicle_menu.table_action);


    // ▄▀▀ █   ██▀ █▀▄ █▄▀   █▄ ▄█ ██▀ █▄ █ █ █
    // ▀▄▄ █▄▄ █▄▄ █▀▄ █ █   █ ▀ █ █▄▄ █ ▀█ ▀▄█
    $('.clerk-menu > div > .header > p.name').text(translation.clerk_menu.menu_title);

    $('.clerk-menu > div> .menu > .side-bar > div[data-href="business-taxes"] > .name > p.title').text(translation.clerk_menu.side_bar.business_taxes.title);
    $('.clerk-menu > div> .menu > .side-bar > div[data-href="business-taxes"] > .name > p.description').text(translation.clerk_menu.side_bar.business_taxes.description);

    $('.clerk-menu > div > .menu > .side-bar > div[data-href="players-and-vehicles"] > .name > p.title').text(translation.clerk_menu.side_bar.players_and_vehicles.title);
    $('.clerk-menu > div > .menu > .side-bar > div[data-href="players-and-vehicles"] > .name > p.description').text(translation.clerk_menu.side_bar.players_and_vehicles.description);

    $('.clerk-menu > div > .menu > .side-bar > div[data-href="employees"] > .name > p.title').text(translation.clerk_menu.side_bar.employees.title);
    $('.clerk-menu > div > .menu > .side-bar > div[data-href="employees"] > .name > p.description').text(translation.clerk_menu.side_bar.employees.description);

    $('.clerk-menu > div > .menu > .side-bar > div[data-href="boss-management"] > .name > p.title').text(translation.clerk_menu.side_bar.boss_management.title);
    $('.clerk-menu > div > .menu > .side-bar > div[data-href="boss-management"] > .name > p.description').text(translation.clerk_menu.side_bar.boss_management.description);

    $('.clerk-menu div[data-type="business-taxes-period"] .header').text(translation.clerk_menu.business_taxes_period.header);

    $('.clerk-menu div[data-type="business-taxes"] .header').text(translation.clerk_menu.business_taxes.header);
    $('.clerk-menu div[data-type="business-taxes"] .title').text(translation.clerk_menu.business_taxes.title);
    
    $('.clerk-menu div[data-type="players-and-vehicles"] .header').text(translation.clerk_menu.players_and_vehicles.header);
    $('.clerk-menu div[data-type="players-and-vehicles"] .title').text(translation.clerk_menu.players_and_vehicles.title);

    $('.clerk-menu div[data-type="players-info"]>div>.side-boxes>.box[data-type="player-data"] > .header').text(translation.clerk_menu.players_info.player_data.header);

    $('.clerk-menu div[data-type="players-info"]>div>.side-boxes>.box[data-type="player-tax-history"] > .header').text(translation.clerk_menu.players_info.player_tax_history.header);
    $('.clerk-menu div[data-type="players-info"]>div>.side-boxes>.box[data-type="player-tax-history"] > .title').text(translation.clerk_menu.players_info.player_tax_history.title);
    
    $('.clerk-menu div[data-type="players-info"]>div>.side-boxes>.box[data-type="player-vehicles"] > .header').text(translation.clerk_menu.players_info.player_vehicles.header);
    $('.clerk-menu div[data-type="players-info"]>div>.side-boxes>.box[data-type="player-vehicles"] > .title').text(translation.clerk_menu.players_info.player_vehicles.title);
    
    
    $('.clerk-menu div[data-type="vehicles-info"]>div>.side-boxes>.box[data-type="vehicle-data"] > .header').text(translation.clerk_menu.vehicles_info.vehicle_data.header);
    
    $('.clerk-menu div[data-type="vehicles-info"]>div>.side-boxes>.box[data-type="vehicle-owner-history"] > .header').text(translation.clerk_menu.vehicles_info.vehicle_owner_history.header);
    $('.clerk-menu div[data-type="vehicles-info"]>div>.side-boxes>.box[data-type="vehicle-owner-history"] > .title').text(translation.clerk_menu.vehicles_info.vehicle_owner_history.title);


    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="players"] > .header').text(translation.clerk_menu.players_and_vehicles.players.header);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="players"] > .title').text(translation.clerk_menu.players_and_vehicles.players.title);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="players"] > p').text(translation.clerk_menu.players_and_vehicles.players.hint);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box input[data-input="find-by-ssn"]').attr('placeholder', translation.clerk_menu.players_and_vehicles.players.placeholder);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="players"] > .btn').text(translation.clerk_menu.players_and_vehicles.players.find_btn);
    
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="vehicles"] > .header').text(translation.clerk_menu.players_and_vehicles.vehicles.header);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="vehicles"] > .title').text(translation.clerk_menu.players_and_vehicles.vehicles.title);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="vehicles"] > p').text(translation.clerk_menu.players_and_vehicles.vehicles.hint);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box input[data-input="find-by-vin"]').attr('placeholder', translation.clerk_menu.players_and_vehicles.vehicles.placeholder);
    $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="vehicles"] > .btn').text(translation.clerk_menu.players_and_vehicles.vehicles.find_btn);
    
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="amount"] > .header').text(translation.clerk_menu.business_taxes_company.amount.header);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="paid_amount"] > .header').text(translation.clerk_menu.business_taxes_company.paid_amount.header);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="paid_date"] > .header').text(translation.clerk_menu.business_taxes_company.paid_date.header);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="delayed_amount"] > .header').text(translation.clerk_menu.business_taxes_company.delayed_amount.header);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="late_fee_applied"] > .header').text(translation.clerk_menu.business_taxes_company.late_fee_applied.header);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > .header').text(translation.clerk_menu.business_taxes_company.message.header);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > .title').text(translation.clerk_menu.business_taxes_company.message.title);
    $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > .btn').text(translation.clerk_menu.business_taxes_company.message.send_btn);

    $('.clerk-menu div[data-type="employees"] .header').text(translation.clerk_menu.employees.menu_employees_header);
    $('.clerk-menu div[data-type="employees"] .title').text(translation.clerk_menu.employees.menu_employees_title);
    $('.clerk-menu div[data-type="employees"] .btn[data-option="get_closest_players"] p').text(translation.clerk_menu.employees.menu_employees_btn);
    $('.clerk-menu div[data-type="employees"] .employees-list #employees-table thead tr th span#employee').text(translation.clerk_menu.employees.table_employee);
    $('.clerk-menu div[data-type="employees"] .employees-list #employees-table thead tr th span#grade').text(translation.clerk_menu.employees.table_grade);
    $('.clerk-menu div[data-type="employees"] .employees-list #employees-table thead tr th span#option').text(translation.clerk_menu.employees.table_option);

    $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] .header').text(translation.clerk_menu.management.menu_balance_header);
    $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] div[data-option="withdraw"] p').text(translation.clerk_menu.management.menu_balance_btn_withdraw);
    $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] div[data-option="deposit"] p').text(translation.clerk_menu.management.menu_balance_btn_deposit);
    
    $('.clerk-menu div[data-type="boss-management"] div[data-type="employees-count"] .header').text(translation.clerk_menu.management.menu_employees_header);
    $('.clerk-menu div[data-type="boss-management"] div[data-option="employees"] p').text(translation.clerk_menu.management.menu_employees_btn_manage);
    
    $('.clerk-menu div[data-type="boss-management"] div[data-type="total-earned"] .header').text(translation.clerk_menu.management.menu_total_earned_header);

    $('.clerk-menu div[data-type="boss-management"] div[data-type="total-delayed-amount"] .header').text(translation.clerk_menu.management.menu_total_delayed_amount_header);

    $('.clerk-menu div[data-type="loading"] > p').text(translation.clerk_menu.searching_for_information);

    //  ▄▀▀ ██▀ █▀▄ ▀█▀ █ █▀ █ ▄▀▀ ▄▀▄ ▀█▀ ██▀   █▄ █ ▄▀▄   ▄▀▀ █▀▄ █ █▄ ▄█ █ █▄ █ ▄▀▄ █  
    //  ▀▄▄ █▄▄ █▀▄  █  █ █▀ █ ▀▄▄ █▀█  █  █▄▄   █ ▀█ ▀▄▀   ▀▄▄ █▀▄ █ █ ▀ █ █ █ ▀█ █▀█ █▄▄
    // $('.certificate_no_criminal .card > #title').text(translation.certificate_no_criminal.title);

    // $('.certificate_no_criminal .card #date > div').text(translation.certificate_no_criminal.date_of_issue);

    // $('.certificate_no_criminal > div > .card > #ssn > div').html(translation.certificate_no_criminal.ssn);
    // $('.certificate_no_criminal > div > .card > #lastName .label').html(translation.certificate_no_criminal.lastname);
    // $('.certificate_no_criminal > div > .card > #firstName .label').html(translation.certificate_no_criminal.firstname);
    // $('.certificate_no_criminal > div > .card > #sentences .label').html(translation.certificate_no_criminal.sentences);
    // $('.certificate_no_criminal > div > .card > #dateOfBirth .label').html(translation.certificate_no_criminal.dob);
    // $('.certificate_no_criminal > div > .card > #nationality .label').html(translation.certificate_no_criminal.nationality);

    // $('.certificate_no_criminal > div > .card > .is_listed > .title').text(translation.certificate_no_criminal.listed);
    // $('.certificate_no_criminal > div > .card > .is_listed > .description').text(translation.certificate_no_criminal.stamp_description);

    // $('.certificate_no_criminal > div > .card > .is_not_listed > .title').text(translation.certificate_no_criminal.not_listed);
    // $('.certificate_no_criminal > div > .card > .is_not_listed > .description').text(translation.certificate_no_criminal.stamp_description);

    // $('.certificate_no_criminal > div > .card > .issuer > .signature-text').text(translation.certificate_no_criminal.stamp_issuer);

    
    //  █▀▄ ██▀ ▄▀▀ █ █ █▄ ▄█ ██▀
    //  █▀▄ █▄▄ ▄██ ▀▄█ █ ▀ █ █▄▄
    $('#resume>.resume>.left>#skills>.title').html(translation.resume.skills_header);
    $('#resume>.resume>.left>#interests>.title').html(translation.resume.interests_header);
    $('#resume>.resume>.right>#about-me>.title').html(translation.resume.aboutme_header);
    $('#resume>.resume>.right>#work-experience>.title').html(translation.resume.workexperience_header);


    // █ █▄ █ █ █ ▄▀▄ █ ▄▀▀ ██▀
    // █ █ ▀█ ▀▄▀ ▀▄▀ █ ▀▄▄ █▄▄
    $('.invoice .canceled_stamp > p').text(translation.invoice.canceled_stamp);
    $('.invoice > div > .card > p.title').text(translation.invoice.title);
    $('.invoice > div > .card > .informations > #issuer > .header').text(translation.invoice.issuer.header);
    $('.invoice > div > .card > .informations > #bill-to > .header').text(translation.invoice.bill_to.header);
    $('.invoice > div > .card > .informations > #infos > .data > #invoice-id > .name').text(translation.invoice.infos.invoice_id);
    $('.invoice > div > .card > .informations > #infos > .data > #invoice-date > .name').text(translation.invoice.infos.invoice_date);
    $('.invoice > div > .card > .informations > #infos > .data > #due-date > .name').text(translation.invoice.infos.due_date);
    $('.invoice > div > .card > .data > table > thead > tr > th#qty > span').text(translation.invoice.table.qty_header);
    $('.invoice > div > .card > .data > table > thead > tr > th#description > span').text(translation.invoice.table.description_header);
    $('.invoice > div > .card > .data > table > thead > tr > th#unit_price > span').text(translation.invoice.table.unit_price_header);
    $('.invoice > div > .card > .data > table > thead > tr > th#amount > span').text(translation.invoice.table.amount_header);
    $('.invoice > div > .card > .data > div > #sub-total > p').text(translation.invoice.table.subtotal);
    $('.invoice > div > .card > .data > div > #total > p').text(translation.invoice.table.total);
    $('.invoice > div > .card > .invoice-data > .header').text(translation.invoice.terms.header);
    $('.invoice > div > .card > .select-payment > div[data-payment-method="cash"]').text(translation.invoice.pay_with_cash);
    $('.invoice > div > .card > .select-payment > div[data-payment-method="bank"]').text(translation.invoice.pay_with_bank);

    $('.invoice > div > .card > .cancel').text(translation.invoice.cancel);
    $('.invoice > div > .card > .confirm > div[data-type="1"]').text(translation.invoice.accept);
    $('.invoice > div > .card > .confirm > div[data-type="0"]').text(translation.invoice.reject);
    
    
    // ▀█▀ █ ▄▀▀ █▄▀ ██▀ ▀█▀ ▄▀▀
    //  █  █ ▀▄▄ █ █ █▄▄  █  ▄██
    $('.ticket .canceled_stamp > p').text(translation.ticket.canceled_stamp);
    $('.ticket div[data-type="traffic"] > .row-1 > #date > p').text(translation.ticket.label_date);
    $('.ticket div[data-type="traffic"] > .row-1 > #time-issued > p').text(translation.ticket.label_time_issued);
    $('.ticket div[data-type="traffic"] > .row-1 > #receiver > p').text(translation.ticket.label_receiver);

    $('.ticket div[data-type="traffic"] > .row-2 > #license-number > p').text(translation.ticket.label_license_number);
    $('.ticket div[data-type="traffic"] > .row-2 > #vehicle-make > p').text(translation.ticket.label_vehicle_make);
    $('.ticket div[data-type="traffic"] > .row-2 > #vehicle-model > p').text(translation.ticket.label_vehicle_model);

    $('.ticket div[data-type="traffic"] > .row-3 > #vin > p').text(translation.ticket.label_vin);

    $('.ticket div[data-type="traffic"] > .row-4 > #location-of-violation > p').text(translation.ticket.label_location);

    $('.ticket div[data-type="traffic"] > .row-5 > #violation > p').text(translation.ticket.label_violation);

    $('.ticket div[data-type="traffic"] > .row-6 > #fine-amount > p').text(translation.ticket.label_fine_amount);
    $('.ticket div[data-type="traffic"] > .row-6 > #due-date > p').text(translation.ticket.label_due_date);

    $('.ticket div[data-type="traffic"] > .row-7 > #license-revocation > p').text(translation.ticket.label_license_revocation);
    $('.ticket div[data-type="traffic"] > .row-7 > #license-type > p').text(translation.ticket.label_license_type);
    $('.ticket div[data-type="traffic"] > .row-7 > #license-suspension-time > p').text(translation.ticket.label_suspension_time);

    $('.ticket div[data-type="traffic"] > .row-8 > #license-points > p').text(translation.ticket.label_license_points);
    $('.ticket div[data-type="traffic"] > .row-8 > #license-points-count > p').text(translation.ticket.label_license_points_count);

    $('.ticket div[data-type="traffic"] > .row-9 > #comments > p').text(translation.ticket.label_comments);
    $('.ticket div[data-type="traffic"] > span').html(translation.ticket.oath);
    
    $('.ticket div[data-type="traffic"] > .row-10 > #officer > p').text(translation.ticket.label_officer);
    $('.ticket div[data-type="traffic"] > .row-10 > #submit > div').text(translation.ticket.label_submit);
    
    $('.ticket .select-ticket-type > div[data-tickettype="traffic-ticket"]').text(translation.ticket.type_ticket_traffic);
    $('.ticket .select-ticket-type > div[data-tickettype="ticket"]').text(translation.ticket.type_ticket);

    $('.ticket .select-payment > div[data-payment-method="cash"]').text(translation.ticket.pay_with_cash);
    $('.ticket .select-payment > div[data-payment-method="bank"]').text(translation.ticket.pay_with_bank);

    $('.ticket .cancel > div').text(translation.ticket.cancel);

    $('.ticket .confirm > div[data-type="1"]').text(translation.ticket.accept);
    $('.ticket .confirm > div[data-type="0"]').text(translation.ticket.reject);


    //  █▀▄ ██▀ ▄▀▀ ██▀ █ █▀▄ ▀█▀
    //  █▀▄ █▄▄ ▀▄▄ █▄▄ █ █▀   █ 
    $('#receipt .legend > .quantity').text(translation.receipt.quantity);
    $('#receipt .legend > .item').text(translation.receipt.item);
    $('#receipt .legend > .amount').text(translation.receipt.amount);

    $('#receipt .sub_total span#currency, #receipt .sales_tax span#currency, #receipt .total span#currency').text(translation.currency);
    $('#receipt .sub_total > div.label').text(translation.receipt.sub_total);
    $('#receipt .sales_tax > div.label').text(translation.receipt.sales_tax);
    $('#receipt .total > div.label').text(translation.receipt.total);

    $('#receipt .buttons > .pay_cash').text(translation.receipt.pay_with_cash);
    $('#receipt .buttons > .pay_bank').text(translation.receipt.pay_with_bank);
    $('#receipt .buttons > .reject').text(translation.receipt.reject);
    
    $('#receipt .paid_by > div.label').text(translation.receipt.paid_by);
    $('#receipt .transaction_id > div.label').text(translation.receipt.transaction_id);
    
    $('#receipt .give > p').text(translation.receipt.select_citizen);
    $('#receipt .give > div > div').text(translation.receipt.give_btn);

    $('#receipt div.thank-you-message > div').text(translation.receipt.thank_you_message);


    // ▄▀▄ ▄▀  █▀▄ ██▀ ██▀ █▄ ▄█ ██▀ █▄ █ ▀█▀
    // █▀█ ▀▄█ █▀▄ █▄▄ █▄▄ █ ▀ █ █▄▄ █ ▀█  █ 
    $(".agreement .card #title").text(translation.agreement.title);
    $(".agreement .card #date > p").text(translation.agreement.date);
    $(".agreement .card .signatures .seller .signature-text").text(translation.agreement.seller_signature);
    $(".agreement .card .signatures .buyer .signature-text").text(translation.agreement.buyer_signature);


    // █ █ █ █▄ █   █▄ ▄█ ██▀ █▄ █ █ █
    // ▀▄▀ █ █ ▀█   █ ▀ █ █▄▄ █ ▀█ ▀▄█
    $('.vin_menu .header > .name').text(translation.vin_info.header);
    $('.vin_menu #find > span').text(translation.vin_info.enter_vin);
    $('.vin_menu #find > .search > p').text(translation.vin_info.search_btn);
    $('.vin_menu #loading > p').text(translation.vin_info.searching_for_information);
    $('.vin_menu #result > .issue-ticket > p').text(translation.vin_info.issue_ticket_btn);

    
    // █▄█ ██▀ ▄▀▄ █   ▀█▀ █▄█   █ █▄ █ ▄▀▀ █ █ █▀▄ ▄▀▄ █▄ █ ▄▀▀ ██▀   █▄ ▄█ ██▀ █▄ █ █ █
    // █ █ █▄▄ █▀█ █▄▄  █  █ █   █ █ ▀█ ▄██ ▀▄█ █▀▄ █▀█ █ ▀█ ▀▄▄ █▄▄   █ ▀ █ █▄▄ █ ▀█ ▀▄█
    $('.health_insurances_menu .header > .name').text(translation.health_insurances.header);
    $('.health_insurances_menu #find > span').text(translation.health_insurances.enter_vin);
    $('.health_insurances_menu #find > .search > p').text(translation.health_insurances.search_btn);
    $('.health_insurances_menu #loading > p').text(translation.health_insurances.searching_for_information);
    

    // ██▄ █ █   █   █ █▄ █ ▄▀    █▄ ▄█ ██▀ █▄ █ █ █
    // █▄█ █ █▄▄ █▄▄ █ █ ▀█ ▀▄█   █ ▀ █ █▄▄ █ ▀█ ▀▄█
    $('.billings_menu .header .search').attr('placeholder', translation.billings_menu.search);
    $('.billings_menu .menu > table > thead > tr > th#receiver').text(translation.billings_menu.table.column_receiver);
    $('.billings_menu .menu > table > thead > tr > th#issuer').text(translation.billings_menu.table.column_issuer);
    $('.billings_menu .menu > table > thead > tr > th#amount').text(translation.billings_menu.table.column_amount);
    $('.billings_menu .menu > table > thead > tr > th#date').text(translation.billings_menu.table.column_date);
    $('.billings_menu .menu > table > thead > tr > th#status').text(translation.billings_menu.table.column_status);
    $('.billings_menu .menu > table > thead > tr > th#actions').text(translation.billings_menu.table.column_actions);

}

const formatDate = (timestamp) => {
    const date = new Date((Number(timestamp) * 1000));
    let hour = date.getHours();
    let minute = date.getMinutes();
    let day = date.getDate();
    let month = date.getMonth() + 1;
    let year = date.getFullYear();
    if (hour < 10) hour = '0' + hour
    if (minute < 10) minute = '0' + minute
    if (day < 10) day = '0' + day
    if (month < 10) month = '0' + month

    return { date: day + '.' + month + '.' + year, time: hour + ':' + minute }
};

const formatDeliveryTime = (time) => {
    const days = Math.floor(time / 86400);
    const hours = Math.floor((time % 86400) / 3600);
    const minutes = Math.floor((time % 3600) / 60);

    return {
        days: days,
        hours: hours,
        minutes: minutes
    };
};

function addDaysToTimestamp(timestamp, days) {
    let date = new Date(timestamp);
    date.setDate(date.getDate() + days);
    return date.getTime();
}

function differenceInDays(timestampX, timestampY) {
    const differenceInMs = Math.abs(timestampX - timestampY);
    const msInOneDay = 24 * 60 * 60 * 1000;
    return Math.floor(differenceInMs / msInOneDay);
}

const BillingsMenu = {
    itemsPerPage: 10,
    currentPage: 1,
    currentFilter: "all",
    searchTerm: "",
    list: [], 
    listArray: [], 
    listArrayFiltered: [], 

    view: function(id) {
        let billData = this.list[String(id)];
        if (!billData) return;
        
        $('.billings_menu > div').fadeOut(120);
        currentFine = String(id)
        if (billData.type == "invoice") {
            Documents.Invoice(String(id), billData, null, true)
        } else if (billData.type == "receipt") {
            Documents.Receipt(String(id), billData)
        } else {
            Documents.Ticket(String(id), null, billData.type, billData, null, true)
        }
    },

    getStatus: function(is_paid, canceled) {
        if (is_paid) {
            return `
                <div class="status paid">
                    <p>${translation.billings_menu.status_paid}</p>
                </div>
            `
        } else if (canceled) {
            return `
                <div class="status canceled">
                    <p>${translation.billings_menu.status_canceled}</p>
                </div>
            `
        } else {
            return `
                <div class="status not_paid">
                    <p>${translation.billings_menu.status_not_paid}</p>
                </div>
            `
        }
    },

    renderPage: function(page) {
        $('.billings_menu #invoice-list').empty();

        const start = (page - 1) * this.itemsPerPage;
        const end = start + this.itemsPerPage;
        let pageItems = this.listArray.slice(start, end);
        if (this.searchTerm != "") {
            pageItems = this.listArrayFiltered.slice(start, end);
        }

        pageItems.forEach(item => {
            let {date, time} = formatDate(item.issue_date);
            $('.billings_menu #invoice-list').append(`
                <tr>
                    <td>${item.data.receiver}</td>
                    <td>${item.data.issuer}</td>
                    <td>${translation.currency}${item.amount}</td>
                    <td>${date} ${time}</td>
                    <td>${this.getStatus(item.is_paid, item.canceled)}</td>
                    <td>
                        <div class="view"  onclick="BillingsMenu.view('${item.id}')">${translation.billings_menu.view_btn}</div>
                    </td>
                </tr>
            `);
        });

        $('.billings_menu #page-info').text((translation.billings_menu.page).format(page, Math.ceil(this.listArray.length / this.itemsPerPage)));
    },
    
    updatePagination: function() {
        $('.billings_menu #prev-page').prop('disabled', this.currentPage === 1);
        $('.billings_menu #next-page').prop('disabled', this.currentPage === Math.ceil(this.listArray.length / this.itemsPerPage));
    },

    Open: function(jobLabel, finesList) {
        currentMenu = 'billings';
        
        this.currentPage = 1;
        this.currentFilter = "all"
        this.searchTerm = ""
        this.list = finesList;
        this.listArray = Object.values(this.list);
        this.listArrayFiltered = [];
        this.renderPage(this.currentPage);
        this.updatePagination();

        $('.billings_menu > div > .header > p.name').text((translation.billings_menu.title).format(jobLabel));
        $('.billings_menu .header .search').val('');

        $('.billings_menu').css('display', 'flex');
        $('.billings_menu > div').fadeIn(120);
    },

    Close: function() {
        $(`.billings_menu, .billings_menu > div`).fadeOut(120)
        currentMenu = null;
        this.listArrayFiltered = [];
    }
};


const PapersMenu = {
    LoadAvailable: (papers) => {
        let papersData = '';

        for (const [k, v] of Object.entries(papers)) {
            papersData += `
                <div>
                    <div class="image">
                        <img src="./images/${v.icon}">
                    </div>
                    <div class="informations">
                        <div class="label">${v.label}</div>
                        <div class="description">${v.description}</div>
                    </div>
                    ${v.price && v.price >= 1 && `
                        <div class="purchase-btn" onclick="buyPaper('${v.name}')">${translation.papers_menu.buy_for} ${translation.currency}${v.price}</div>
                    ` || `
                        <div class="purchase-btn" onclick="buyPaper('${v.name}')">${translation.papers_menu.take}</div>
                    `}
                </div>
            `
        }

        $('.papers-menu .menu').html(papersData);
    }
}

const ClerkMenu = {
    businessTaxes: null,

    employees: [],
    employeesCount: 0,

    societyBalance: 0,

    cityhallJobData: [],
    myGrade: [],
    clerksGrades: [],

    totalDelayedAmount: 0,

    FoundSSN: function(data) {
        $('.clerk-menu div[data-type="loading"]').fadeOut(150);
        if (!data) return;

        $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="players"] input').val('');
        
        $('.clerk-menu div[data-type="players-info"]>div>.side-boxes>.box[data-type="player-data"] > .title').text((translation.clerk_menu.players_info.player_data.title).format(data.info.ssn));
        let playerDataRow1 = ''
        let playerDataRow2 = ''
        let playerDataRow3 = ''
        let taxesData = ''
        let vehiclesData = ''
        
        if (data.info.firstName) playerDataRow1 += `<div id="firstName"><span class="label">${translation.clerk_menu.players_info.player_data.firstname}</span> <span id="val" data-value="${data.info.firstName}">${data.info.firstName}</span></div>`
        if (data.info.lastName) playerDataRow1 += `<div id="lastName"><span class="label">${translation.clerk_menu.players_info.player_data.lastname}</span> <span id="val" data-value="${data.info.lastName}">${data.info.lastName}</span></div>`
        if (data.info.dateOfBirth) playerDataRow1 += `<div id="dateOfBirth"><span class="label">${translation.clerk_menu.players_info.player_data.dateofbirth}</span> <span id="val" data-value="${data.info.dateOfBirth}">${data.info.dateOfBirth}</span></div>`
        if (data.info.nationality) playerDataRow1 += `<div id="nationality"><span class="label">${translation.clerk_menu.players_info.player_data.nationality}</span> <span id="val" data-value="${data.info.nationality}">${data.info.nationality}</span></div>`
        if (data.info.sex != undefined) {
            if (data.info.sex == 'm' || data.info.sex == '0' || data.info.sex == 0) {
                playerDataRow1 += `<div id="sex"><span class="label">${translation.clerk_menu.players_info.player_data.sex}</span> <span id="val" data-value="${translation.clerk_menu.players_info.player_data.sex_male}">${translation.clerk_menu.players_info.player_data.sex_male}</span></div>`
            } else {
                playerDataRow1 += `<div id="sex"><span class="label">${translation.clerk_menu.players_info.player_data.sex}</span> <span id="val" data-value="${translation.clerk_menu.players_info.player_data.sex_female}">${translation.clerk_menu.players_info.player_data.sex_female}</span></div>`
            }
        }
        
        if (data.info.job != undefined) {
            playerDataRow2 += `
                <div id="job"><span class="label">${translation.clerk_menu.players_info.player_data.job}</span> <span id="val" data-value="${data.info.job}">${data.info.job}</span></div>
                <div id="jobGrade"><span class="label">${translation.clerk_menu.players_info.player_data.job_grade}</span> <span id="val" data-value="${data.info.jobGrade}">${data.info.jobGrade}</span></div>
            `
        }

        if (data.info.cityhallData) {
            if (data.info.cityhallData.healthInsurance != undefined) {
                if (Number(data.info.cityhallData.healthInsurance)) {
                    let {date, time} = formatDate(data.info.cityhallData.healthInsurance);
                    playerDataRow3 += `<div id="healthInsurance"><span class="label">${translation.clerk_menu.players_info.player_data.health_insurance}</span> <span id="val" data-value="${date} ${time}">${date} ${time}</span></div>`
                } else {
                    playerDataRow3 += `<div id="healthInsurance"><span class="label">${translation.clerk_menu.players_info.player_data.health_insurance}</span> <span id="val">${translation.clerk_menu.players_info.player_data.not_insured}</span></div>`
                }
            } else {
                playerDataRow3 += `<div id="healthInsurance"><span class="label">${translation.clerk_menu.players_info.player_data.health_insurance}</span> <span id="val">${translation.clerk_menu.players_info.player_data.not_insured}</span></div>`
            }

            if (data.info.cityhallData.suspendedLicenses) {
                playerDataRow3 += `
                    <div id="suspendedLicenses">
                        <span class="label">${translation.clerk_menu.players_info.player_data.suspended_licenses}</span>
                `

                for (const [licenseName, licenseTime] of Object.entries(data.info.cityhallData.suspendedLicenses)) {
                    let {date, time} = formatDate(licenseTime);
                    playerDataRow3 += `<span id="val">${data.licensesLabels && data.licensesLabels[licenseName] || 'UNKNOWN'} ${translation.clerk_menu.players_info.player_data.suspended_licenses_until} ${date} ${time}</span>`
                }
                    
                playerDataRow3 += `</div>`
            }

            if (data.info.cityhallData.penaltyPoints) {
                playerDataRow3 += `<div id="job"><span class="label">${translation.clerk_menu.players_info.player_data.penalty_points}</span> <span id="val" data-value="${data.info.cityhallData.penaltyPoints}">${data.info.cityhallData.penaltyPoints}</span></div>`
            }
            
            if (data.info.cityhallData.penaltyPointsList) {
                playerDataRow3 += `
                    <div id="penaltyPointsList">
                        <span class="label">${translation.clerk_menu.players_info.player_data.penalty_points_list}</span>
                `

                for (const [_, value] of Object.entries(data.info.cityhallData.penaltyPointsList)) {
                    let {date, time} = formatDate(value.date);
                    playerDataRow3 += `<span id="val">${value.count} ${translation.clerk_menu.players_info.player_data.penalty_points_issue_date} ${date} ${time}</span>`
                }
                    
                playerDataRow3 += `</div>`
            }
        }

        if (data.info.taxes != undefined) {
            for (const [k, v] of Object.entries(data.info.taxes)) {
                let maxPaymentTime = addDaysToTimestamp(v.received_date * 1000, taxPaymentMaxDays);
                let daysDifference = differenceInDays(v.received_date * 1000, Date.now());
                let {date, time} = formatDate(maxPaymentTime / 1000);
                
                taxesData += `
                    <div>
                        ${v.canceled ? `<div class="status canceled">${translation.cityhall.taxes.statuses.canceled}</div>` : (v.is_paid ? `<div class="status paid">${translation.cityhall.taxes.statuses.paid}</div>` : `<div class="status to-paid">${translation.cityhall.taxes.statuses.to_paid}</div>`)}
                        <div class="name">
                            <div class="id">#${v.id}</div>
                        </div>
                        <div class="info">
                            <hr>
                            ${v.title ? `<div class="for">${translation.cityhall.taxes.for}: <span>${v.title}</span></div>` : ``}
                            ${v.amount ? `<div class="amount">${translation.cityhall.taxes.amount}: <span>${translation.currency}${v.amount}</span></div>` : ``}
                            ${daysDifference > taxPaymentMaxDays ? `<div class="amount">${translation.cityhall.taxes.overdue_interest}: <span>${translation.currency}${Math.floor(v.amount * (taxOverduePaymentPercent * (daysDifference - taxPaymentMaxDays)) / 100)}</span></div>` : ``}
                            ${v.received_date ? `<div class="amount">${translation.cityhall.taxes.maximum_payment_date}: <span>${date} ${time}</span></div>` : ``}
                        </div>
                    </div>
                `
            }

            $('.clerk-menu .menu div[data-type="players-info"] .box[data-type="player-tax-history"] > .data').html(taxesData);
        }

        if (data.info.vehiclesList != undefined) {
            for (const [k, v] of Object.entries(data.info.vehiclesList)) {
                vehiclesData += `
                    <div>
                        <div class="model">${v.model}</div>
                        <div class="vin">
                            <span class="label">${translation.clerk_menu.players_info.player_vehicles.vin}</span> <span id="val" data-value="${v.vin}">${v.vin}</span> <i class="fa-solid fa-clipboard"></i>
                        </div>
                        <div class="plate">
                            <span class="label">${translation.clerk_menu.players_info.player_vehicles.plate}</span> <span id="val" data-value="${v.plate}">${v.plate}</span> <i class="fa-solid fa-clipboard"></i>
                        </div>
                    </div>
                `
            }
            $('.clerk-menu .menu div[data-type="players-info"] .box[data-type="player-vehicles"] > .data').html(vehiclesData);
        }

        $('.clerk-menu .menu div[data-type="players-info"] .box[data-type="player-data"] > .rows').html(`
            <div class="row-1">${playerDataRow1}</div>
            <div class="row-2">${playerDataRow2}</div>
            <div class="row-3">${playerDataRow3}</div>
        `)

        updateCityHall(`players-info`);
    },

    FindBySSN: function() {
        $('.clerk-menu div[data-type="loading"]').fadeIn(150);

        setTimeout(() => {
            if (currentMenu && currentMenu == 'clerk_menu') {
                let ssn = $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="players"] input').val();
                
                $.post(`https://${GetParentResourceName()}/clerkFindSSN`, JSON.stringify({
                    ssn: ssn
                }), function(data) {
                    ClerkMenu.FoundSSN(data);
                });
            }
        }, 4000);
    },

    FoundVIN: function(data) {
        $('.clerk-menu div[data-type="loading"]').fadeOut(150);
        if (!data) return;

        $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="vehicles"] input').val('');
        
        $('.clerk-menu div[data-type="vehicles-info"]>div>.side-boxes>.box[data-type="vehicle-data"] > .title').text((translation.clerk_menu.vehicles_info.vehicle_data.title).format(data.vin));

        let vehicleDataRow1 = ''
        let vehicleDataRow2 = ''
        let vehicleDataRow3 = ''
        let ownerHistoryData = ''
        
        if (data.vin) vehicleDataRow1 += `<div id="vin"><span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.vin}</span> <span id="val" data-value="${data.vin}">${data.vin}</span></div>`
        if (data.plate) vehicleDataRow1 += `<div id="plate"><span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.plate}</span> <span id="val" data-value="${data.plate}">${data.plate}</span></div>`
        
        if (data.model) vehicleDataRow1 += `<div id="model"><span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.model}</span> <span id="val" data-value="${data.model}">${data.model}</span></div>`

        if (data.ownerName) {
            vehicleDataRow1 += `<div id="ownerName"><span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.ownername}</span> <span id="val" data-value="${data.ownerName}">${data.ownerName}</span></div>`
        } else {
            vehicleDataRow1 += `<div id="ownerName"><span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.ownername}</span> <span id="val">${translation.clerk_menu.vehicles_info.vehicle_data.no_owner}</span></div>`
        }
        
        if (data.insurance) {
            let startTime = formatDate(data.insurance.startTime).date
            let endTime = formatDate(data.insurance.endTime).date
            
            vehicleDataRow2 += `
                <div id="insurance">
                    <span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.insurance}</span>
                    <span id="val" data-value="${startTime}">${translation.clerk_menu.vehicles_info.vehicle_data.insurance_start_time} ${startTime}</span>
                    <span id="val" data-value="${endTime}">${translation.clerk_menu.vehicles_info.vehicle_data.insurance_end_time} ${endTime}</span>
                </div>
            `
        } else {
            vehicleDataRow2 += `<div id="insurance"><span class="label">${translation.clerk_menu.vehicles_info.vehicle_data.insurance}</span> <span id="val">${translation.clerk_menu.vehicles_info.vehicle_data.not_insured}</span></div>`
        }

        if (data.ownerHistory) {
            (data.ownerHistory).sort((a, b) => {
                return parseInt(b.from) - parseInt(a.from);
            });
        
            (data.ownerHistory).forEach(owner => {
                let {date: fromDate, time: fromTime} = formatDate(Number(owner.from));
                let toDate, toTime;
        
                if (owner.to != "current") {
                    let result = formatDate(Number(owner.to));
                    toDate = result.date;
                    toTime = result.time;
                }
        
                ownerHistoryData += `
                    <div>
                        <div class="name">${owner.name}</div>
                        <div class="info">
                            <hr>
                            ${toDate ? `<div class="to">${translation.clerk_menu.vehicles_info.vehicle_owner_history.to} <span>${toDate} ${toTime}</span></div>` : ''}
                            <div class="from">${translation.clerk_menu.vehicles_info.vehicle_owner_history.from} <span>${fromDate} ${fromTime}</span></div>
                            <div class="price">${translation.clerk_menu.vehicles_info.vehicle_owner_history.price} <span>${translation.currency}${owner.price && number.format(owner.price) || 0}</span></div>
                        </div>
                    </div>
                `;
            });
        
            $('.clerk-menu .menu div[data-type="vehicles-info"] .box[data-type="vehicle-owner-history"] > .data').html(ownerHistoryData);
        }
        

        // if (data.ownerHistory) {
        //     data.ownerHistory.sort((a, b) => {
        //         return parseInt(a.from) - parseInt(b.from);
        //     });
        
        //     data.ownerHistory.forEach(owner => {
        //         let {date: fromDate, time: fromTime} = formatDate(Number(owner.from));
        //         let {date: toDate, time: toTime} = formatDate(Number(owner.to));
        
        //         ownerHistoryData += `
        //             <p>Właściciel: ${owner.name} od ${fromDate} ${fromTime} do ${toDate} ${toTime}</p>
        //         `;
        //     });
        
        //     let lastOwner = data.ownerHistory[data.ownerHistory.length - 1];
        //     let {date: fromDate, time: fromTime} = formatDate(Number(lastOwner.to));
        
        //     ownerHistoryData += `
        //         <p>Właściciel: ${data.ownerName} od ${fromDate} ${fromTime} do OBECNY</p>
        //     `;
        
        //     $('.clerk-menu .menu div[data-type="vehicles-info"] .box[data-type="vehicle-owner-history"] > .data').html(ownerHistoryData);
        // }
        
        $('.clerk-menu .menu div[data-type="vehicles-info"] .box[data-type="vehicle-data"] > .rows').html(`
            <div class="row-1">${vehicleDataRow1}</div>
            <div class="row-2">${vehicleDataRow2}</div>
            <div class="row-3">${vehicleDataRow3}</div>
        `)

        updateCityHall(`vehicles-info`);
    },

    FindByVIN: function() {
        $('.clerk-menu div[data-type="loading"]').fadeIn(150);

        setTimeout(() => {
            if (currentMenu && currentMenu == 'clerk_menu') {
                let vin = $('.clerk-menu div[data-type="players-and-vehicles"]>div>.side-boxes>.box[data-type="vehicles"] input').val();
                                
                $.post(`https://${GetParentResourceName()}/clerkFindVIN`, JSON.stringify({
                    vin: vin
                }), function(data) {
                    ClerkMenu.FoundVIN(data)
                });
            }
        }, 4000);
    },

    CheckCompany: function(period, company) {
        let selectedPeriodCompany = this.businessTaxes[period][company];
        if (!selectedPeriodCompany) return;

        const [month, year] = period.split(":");
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="company"] > .header').text((translation.clerk_menu.business_taxes_company.company.header).format(translation.clerk_menu.months[month], year));
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="company"] > .title').text((translation.clerk_menu.business_taxes_company.company.title).format(selectedPeriodCompany.job_label));
        
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="amount"] > .title').text(`${translation.currency}${number.format(selectedPeriodCompany.amount)}`);
        
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="paid_amount"] > .title').text(`${translation.currency}${number.format(selectedPeriodCompany.paid_amount)}`);
        
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="paid_date"] > .title').text();
        if (selectedPeriodCompany.is_paid) {
            let {date, time} = formatDate(selectedPeriodCompany.paid_date);
            $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="paid_date"] > .title').text(date);
        }

        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="delayed_amount"] > .title').text(`${translation.currency}${number.format(selectedPeriodCompany.delayed_amount)}`);

        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="late_fee_applied"] > .title').text(selectedPeriodCompany.late_fee_applied);
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > textarea').val('');
        $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > .btn').attr('data-company', company);
            

        updateCityHall(`business-taxes-company`);
    },

    CheckPeriod: function(period) {
        let selectedPeriod = this.businessTaxes[period];
        if (!selectedPeriod) return;

        const [month, year] = period.split(":");

        let businessData = ''
        for (const [company, data] of Object.entries(selectedPeriod)) {
            businessData += `
                <div>
                    <div class="title">${data.job_label}</div>
                    <div class="check_out" onclick="ClerkMenu.CheckCompany('${period}', '${company}')">${translation.clerk_menu.business_taxes_period.check_out_btn}</div>
                </div>
            `
        }

        $('.clerk-menu div[data-type="business-taxes-period"] > div > .list').html(businessData);
        $('.clerk-menu div[data-type="business-taxes-period"] .text .title').html(`${(translation.clerk_menu.months[month]).toUpperCase()} ${year}`);
        updateCityHall(`business-taxes-period`);
    },

    AdjustRestrictions: function() {
        let firstMenu = null;

        $('.clerk-menu > div > .menu > .side-bar > div').hide();
        // this.myGrade.menuAccess
        // this.myGrade.allowEmployeesManage
        // this.myGrade.allowBalanceManage
        
        if (this.myGrade.menuAccess['boss-management']) {
            firstMenu = 'boss-management'
            this.LoadSection('boss-management');
            $('.clerk-menu > div > .menu > .side-bar > div[data-href="boss-management"]').show();
        }
        if (this.myGrade.menuAccess['employees']) {
            firstMenu = 'employees'
            this.LoadSection('employees');
            $('.clerk-menu > div > .menu > .side-bar > div[data-href="employees"]').show();
        } 
        if (this.myGrade.menuAccess['players-and-vehicles']) {
            firstMenu = 'players-and-vehicles'
            this.LoadSection('players-and-vehicles');
            $('.clerk-menu > div > .menu > .side-bar > div[data-href="players-and-vehicles"]').show();
        }
        if (this.myGrade.menuAccess['business-taxes']) {
            firstMenu = 'business-taxes'
            this.LoadSection('business-taxes');
            $('.clerk-menu > div > .menu > .side-bar > div[data-href="business-taxes"]').show();
        }

        updateCityHall(firstMenu, `.clerk-menu .side-bar div[data-href="${firstMenu}"]`);
    },

    LoadSection: function(name) {
        if (name == 'boss-management') {
            $('.clerk-menu div[data-type="boss-management"] div[data-type="employees-count"] .title').text(this.employeesCount);
            $('.clerk-menu div[data-type="boss-management"] div[data-type="total-earned"] .title').html(`${translation.currency} ${number.format(this.cityhallJobData.data.totalEarned)}`);
            $('.clerk-menu div[data-type="boss-management"] div[data-type="total-delayed-amount"] .title').html(`${translation.currency} ${number.format(this.totalDelayedAmount)}`);
            
            $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] .buttons').hide();
            if (this.myGrade.allowBalanceManage) {
                $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] .buttons').show();
            }

            if (useClerkBuildInBalance) {
                $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] .title').html(`${translation.currency} ${number.format(this.cityhallJobData.data.balance)}`);
            } else {
                if (!balanceAlreadyRemoved && removeClerkBalanceFromMenu) {
                    var element = document.querySelector('.clerk-menu div[data-type="boss-management"] div[data-type="balance"]');
                    if (element) element.remove();
        
                    $('.clerk-menu div[data-type="boss-management"] .header-buttons').css({'grid-template-columns': 'auto'})
                    $('.clerk-menu div[data-type="boss-management"] div[data-type="employees-count"]').css({'width': '100%'})
        
                    balanceAlreadyRemoved = true;
                }
                if (!removeClerkBalanceFromMenu) {
                    $('.clerk-menu div[data-type="boss-management"] div[data-type="balance"] .title').html(`${translation.currency} ${number.format(this.societyBalance)}`);
                }
            }

        } else if (name == 'employees') {
            let employeesData = ''

            $('.clerk-menu div[data-type="employees"]').removeClass('notAllowEmployeesManage');
            if (!this.myGrade.allowEmployeesManage) {
                $('.clerk-menu div[data-type="employees"]').addClass('notAllowEmployeesManage');
            }

            for (const [k, v] of Object.entries(this.employees)) {
                employeesData = employeesData + `
                    <tr>
                        <td class="table-first">${v.name}</td>
                        <td>${v.job ? v.job.grade_label : v.grade.name}</td>
                        ${this.myGrade.allowEmployeesManage ? `
                            <td class="table-last">
                                <div onclick="manageEmployee('${v.name}', '${v.identifier || v.empSource}')">${translation.clerk_menu.management.menu_employees_btn_manage}</div>
                            </td>
                        ` : ``}
                    </tr>
                `
            }
            $('.clerk-menu div[data-type="employees"] tbody').html(employeesData)
        } else if (name == 'business-taxes'){
            if (this.businessTaxes) {
                let businessTaxesData = '';
    
                let sortedTaxes = Object.entries(this.businessTaxes).sort((a, b) => {
                    const [monthA, yearB] = a[0].split(":").map(Number);
                    const [monthB, yearA] = b[0].split(":").map(Number);
                    if (yearA !== yearB) {
                        return yearA - yearB;
                    }
                    return monthB - monthA;
                });
                
                for (const [period, data] of sortedTaxes) {
                    const [month, year] = period.split(":");
        
                    businessTaxesData += `
                        <div>
                            <div class="title"><span>${year}</span>${translation.clerk_menu.months[month]}</div>
                            <hr>
                            
                            <div class="check_out" onclick="ClerkMenu.CheckPeriod('${period}')">${translation.clerk_menu.business_taxes.check_out_btn}</div>
                        </div>
                    `
                }
    
                $('.clerk-menu div[data-type="business-taxes"] > div > .list').html(businessTaxesData);
            }
            
        }
    },

    Open: function(clerkData) {
        this.businessTaxes = null;
        this.employees = null;
        this.employeesCount = 0;
        this.societyBalance = 0;
        this.cityhallJobData = [];
        this.myGrade = [];
        this.clerksGrades = [];
        this.totalDelayedAmount = 0;

        
        this.businessTaxes = clerkData.businessTaxes;
        
        this.employees = clerkData.employees;
        this.employeesCount = clerkData.employeesCount;
        
        this.cityhallJobData = clerkData.cityhallJobData;
        this.myGrade = clerkData.myGrade;
        this.clerksGrades = clerkData.clerksGrades;

        this.totalDelayedAmount = clerkData.totalDelayedAmount;
        
        currentMenu = 'clerk_menu';

        this.AdjustRestrictions();

        $('.clerk-menu').css('display', 'flex');
        $('.clerk-menu > div').fadeIn(120);
    },

    Close: function() {
        $(`.clerk-menu, .clerk-menu > div`).fadeOut(120)
        currentMenu = null;
    },

    Update: function(item) {
        if (item.employeesCount) {
            this.employeesCount = item.employeesCount;
        }

        if (item.employees) {
            this.employees = item.employees;
            this.LoadSection('employees');
        }

        if (item.clerkData) {
            this.cityhallJobData = item.clerkData;
            this.LoadSection('boss-management');
        }

        if (item.societyBalance) {
            this.societyBalance = item.societyBalance;
            this.LoadSection('boss-management');
        }

        if (item.players) {
            let players = item.players
            let hireData = ''
            $('.clerk-menu .main div[data-type="employees"] .box-right .data').html(`<div class="hire-list">${translation.clerk_menu.employees.menu_employees_no_players}</div>`);
            for (const [k, v] of Object.entries(players)) {
                hireData += `
                    <div class="hire-player" data-playerid="${v}">
                        <div>${(translation.clerk_menu.employees.citizen).format(v)}</div>
                        <div class="hire_btn" onclick="hireEmployee(${v})">${translation.clerk_menu.employees.menu_option_hire_btn}</div>
                    </div>
                `;
            };
            $('.clerk-menu .main div[data-type="employees"] .box-right .data .hire-list').html(hireData);
        }
    }
}

const CityHallMenu = {
    AdjustRestrictions: () => {
        let firstMenu = null;
        let countOfSections = 6

        $('.cityhall-menu > div > .menu > .side-bar > div[data-href="main"]').show();
        $('.cityhall-menu > div > .menu > .side-bar > div[data-href="jobs"]').show();
        $('.cityhall-menu > div > .menu > .side-bar > div[data-href="insurance"]').show();
        $('.cityhall-menu > div > .menu > .side-bar > div[data-href="licenses"]').show();
        $('.cityhall-menu > div > .menu > .side-bar > div[data-href="fines"]').show();
        $('.cityhall-menu > div > .menu > .side-bar > div[data-href="taxes"]').show();

        if (menuRestrictions['main']) {
            firstMenu = 'main'
        } else if (menuRestrictions['jobs']) {
            firstMenu = 'jobs'
        } else if (menuRestrictions['insurance']) {
            firstMenu = 'insurance'
        } else if (menuRestrictions['licenses']) {
            firstMenu = 'licenses'
        } else if (menuRestrictions['fines']) {
            firstMenu = 'fines'
        } else if (menuRestrictions['taxes']) {
            firstMenu = 'taxes'
        }

        if (!menuRestrictions['main']) {
            $('.cityhall-menu > div > .menu > .side-bar > div[data-href="main"]').hide();
            countOfSections -= 1
        }
        if (!menuRestrictions['jobs']) {
            $('.cityhall-menu > div > .menu > .side-bar > div[data-href="jobs"]').hide();
            countOfSections -= 1
        }
        if (!menuRestrictions['insurance']) {
            $('.cityhall-menu > div > .menu > .side-bar > div[data-href="insurance"]').hide();
            countOfSections -= 1
        }
        if (!menuRestrictions['licenses']) {
            $('.cityhall-menu > div > .menu > .side-bar > div[data-href="licenses"]').hide();
            countOfSections -= 1
        }
        if (!menuRestrictions['fines']) {
            $('.cityhall-menu > div > .menu > .side-bar > div[data-href="fines"]').hide();
            countOfSections -= 1
        }
        if (!menuRestrictions['taxes']) {
            $('.cityhall-menu > div > .menu > .side-bar > div[data-href="taxes"]').hide();
            countOfSections -= 1
        }

        $('.cityhall-menu').removeClass('oneSection');
        if (countOfSections == 1) {
            $('.cityhall-menu').addClass('oneSection');
        }

        updateCityHall(`${firstMenu}`, `.cityhall-menu .side-bar div[data-href="${firstMenu}"]`);
    },

    LoadSelectVehicleMenu: (type, vehiclesList) => {
        let vehiclesData = '';

        if (type == 'reregistration_vehicle') {
            for (const [k, v] of Object.entries(vehiclesList)) {
                if (!v.isRegistered) {
                    vehiclesData += `
                        <tr>
                            <td class="table-first">${v.model}</td>
                            <td>${v.plate}</td>
                            <td>${v.vin}</td>
                            <td class="table-last">
                                <div onclick="selectVehicle('${type}', '${v.vin}')">${translation.cityhall.documents.documents_list.select_btn}</div>
                            </td>
                        </tr>
                    `
                }
            }
        } else if (type == 'change_plate') {
            for (const [k, v] of Object.entries(vehiclesList)) {
                if (v.isRegistered) {
                    vehiclesData += `
                        <tr>
                            <td class="table-first">${v.model}</td>
                            <td>${v.plate}</td>
                            <td>${v.vin}</td>
                            <td class="table-last">
                                <div onclick="selectVehicle('${type}', '${v.vin}')">${translation.cityhall.documents.documents_list.select_btn}</div>
                            </td>
                        </tr>
                    `
                }
            }
        }

        return vehiclesData;
    },

    LoadChangePlateMenu: (vin, name, allowCurrentPlate, allowRandomPlate, allowCustomPlate) => {
        let plateData = '';

        if (allowCurrentPlate?.allow) {
            plateData += `
                <div>
                    <div class="header">${translation.cityhall.change_plate_menu.current.header}</div>
                    <div class="description">${allowCurrentPlate?.price >= 1 ? (translation.cityhall.change_plate_menu.current.description).format(translation.currency, allowCurrentPlate.price) : translation.cityhall.change_plate_menu.current.description_free}</div>
                    <div id="select-btn" onclick="selectedPlate('${name}', 'current', '${vin}')">
                        <p>
                            ${translation.cityhall.change_plate_menu.current.button}
                        </p>
                    </div>
                </div>
            `
        }
        if (allowRandomPlate?.allow) {
            if (allowCurrentPlate?.allow) plateData += `<hr>`;
            plateData += `
                <div>
                    <div class="header">${translation.cityhall.change_plate_menu.random.header}</div>
                    <div class="description">${allowCurrentPlate?.price >= 1 ? (translation.cityhall.change_plate_menu.random.description).format(translation.currency, allowCurrentPlate.price) : translation.cityhall.change_plate_menu.random.description_free}</div>
                    <div id="select-btn" onclick="selectedPlate('${name}', 'random', '${vin}')">
                        <p>
                            ${translation.cityhall.change_plate_menu.random.button}
                        </p>
                    </div>
                </div>
            `
        }
        if (allowCustomPlate?.allow) {
            if (allowCustomPlate?.allow) plateData += `<hr>`;
            plateData += `
                <div>
                    <div class="header">${translation.cityhall.change_plate_menu.custom.header}</div>
                    <div class="description">${allowCurrentPlate?.price >= 1 ? (translation.cityhall.change_plate_menu.custom.description).format(translation.currency, allowCurrentPlate.price) : translation.cityhall.change_plate_menu.custom.description_free}</div>
                    <div class="custom-data">
                        <input>
                        <div id="select-btn" onclick="selectedPlate('${name}', 'custom', '${vin}')">
                            <p>
                                ${translation.cityhall.change_plate_menu.custom.button}
                            </p>
                        </div>
                    </div>
                </div>
            `
        }

        return plateData;
    },

    LoadMainPage: (characterData, paychecks) => {
        if (characterData) {
            $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .title').html(`<span id="firstName" data-value="${characterData.firstName}"></span> <span id="lastName" data-value="${characterData.lastName}"></span>`)
            $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data').html(`
                <div id="dateOfBirth"><span class="label">${translation.cityhall.main.about_you.dateofbirth}</span> <span id="val" data-value="${characterData.dateOfBirth}"></span></div>
                <div id="ssn"><span class="label">${translation.cityhall.main.about_you.ssn}</span> <span id="val" data-value="${characterData.ssn}"></span></div>
                ${characterData.nationality ? `<div id="nationality"><span class="label">${translation.cityhall.main.about_you.nationality}</span> <span id="val" data-value="${characterData.nationality}"></span></div>` : ''}
                ${cityHallData.penaltyPoints != undefined ? `<div id="penaltyPoints"><span class="label">${translation.cityhall.main.about_you.penalty_points}</span> <span id="val">${cityHallData.penaltyPoints}</span></div>` : ''}
            `)

            let firstNameElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .title > span#firstName`;
            $(firstNameElement).text($(firstNameElement).data('value'));

            let lastNameElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .title > span#lastName`;
            $(lastNameElement).text($(lastNameElement).data('value'));

            let dateOfBirthElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data > div#dateOfBirth > span#val`;
            $(dateOfBirthElement).text($(dateOfBirthElement).data('value'));

            let ssnElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data > div#ssn > span#val`;
            $(ssnElement).text($(ssnElement).data('value'));

            if (characterData.nationality) {
                let nationalityElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data > div#nationality > span#val`;
                $(nationalityElement).text($(nationalityElement).data('value'));
            }
        }

        $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"] .title').html(`${translation.currency} <span data-value="${paychecks}"></span>`)

        let paychecksElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"] .title > span`;
        $(paychecksElement).text(number.format($(paychecksElement).data('value')));

        toggleStreamerMode()
    },

    LoadTaxesList: (taxes) => {
        let taxesData = ``

        for (const [k, v] of Object.entries(taxes)) {
            if (translation.cityhall.main.taxes.list[k]) {
                taxesData += `
                    <div class="label">${translation.cityhall.main.taxes.list[k]}</div>
                    <div class="taxes">
                `
                if (typeof (v) === 'object') {
                    for (const [taxType, taxRate] of Object.entries(v)) {
                        if (translation.cityhall.main.taxes.list[k + '_' + taxType]) {
                            taxesData += `
                                <element><i class="fa-solid fa-caret-right"></i> ${(translation.cityhall.main.taxes.list[k + '_' + taxType]).format(taxRate)}</element>
                            `
                        }
                    }
                } else {
                    taxesData += `
                        <element><i class="fa-solid fa-caret-right"></i> ${(translation.cityhall.main.taxes.list[k + '_all']).format(v)}</element>
                    `
                }

                taxesData += `
                    </div>
                `
            }
        }

        $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="taxes-list"] .list').html(taxesData)
    },

    LoadHousingsList: (properties) => {
        let propertiesData = '';

        for (const [k, v] of Object.entries(properties)) {
            propertiesData += `
                <tr>
                    <td class="table-first">${v}</td>
                </tr>
            `
        }

        return propertiesData;
    },

    LoadJobCenter: (jobs, allowedResumes) => {
        let jobCenterData = '';

        for (const [k, v] of Object.entries(jobs)) {
            if (!v.tempDisabled) {
                jobCenterData += `
                    <div ${v.image ? 'class="withImage"' : ''}>
                        <div class="type">${v.type}</div>
                        <div class="label">
                            ${v.icon ? `<i class="${v.icon}"></i>` : ''}
                            <span>${v.label}</span>
                        </div>
                        ${v.address ? `<div class="address">${v.address}</div>` : ``}
                        ${v.image ? `<div class="image" style="background-image: url(${(v.image).includes('http') ? `${v.image}` : `./images/${v.image}`})"></div>` : ``}
                        ${myJobName != v.name ? `
                            ${v.requiredResume ? `
                                ${allowedResumes[v.name] && allowedResumes[v.name] == 1 && `
                                    <div class="join-job" onclick="writeResume('${v.name}')">${translation.cityhall.jobcenter.submit_your_resume_btn}</div>
                                ` || `
                                    <div class="no-recruitment-job">${translation.cityhall.jobcenter.no_recruitment}</div>
                                `}
                            ` : `
                                <div class="join-job" onclick="joinJob('${v.name}')">${translation.cityhall.jobcenter.join_to_the_job_btn}</div>
                            `}
                        ` : ``}
                    </div>
                `
            }
        }

        return jobCenterData;
    },

    LoadInsurance: (timestamp) => {
        if (timestamp) {
            let { date, time } = formatDate(timestamp)
            return `${translation.cityhall.insurances.health.insured} ${date} ${time}`
        } else {
            return `${translation.cityhall.insurances.health.not_insured}`
        }
    },

    LoadInsuranceDays: (days) => {
        let daysData = '';

        for (const [k, v] of Object.entries(days)) {
            daysData += `<div data-days="${v}" onclick="selectInsuranceDays('healthInsurance', ${v})">${v} ${translation.cityhall.insurances.days}</div>`
        }

        $('.cityhall-menu div[data-type="insurance"] .box[data-type="my-insurance"] .days').html(daysData);
    },

    LoadInsuranceVehicles: (vehiclesList) => {
        let vehiclesData = '';

        for (const [k, v] of Object.entries(vehiclesList)) {
            vehiclesData += `
                <tr data-plate="${v.plate}">
                    <td class="table-first">${v.model}</td>
                    <td>${v.plate}</td>
                    ${useVIN ? `<td>${v.vin}</td>` : ``}
                    ${v.insurance ? `
                        <td id="start_time">${formatDate(v.insurance.startTime).date} ${formatDate(v.insurance.startTime).time}</td>
                        <td id="end_time">${formatDate(v.insurance.endTime).date} ${formatDate(v.insurance.endTime).time}</td>
                    ` : `
                        <td id="start_time">-</td>
                        <td id="end_time">-</td>
                    `}
                    <td class="price" data-price="${v.price}">$${Math.floor((v.price * vehiclesInsurancesPercentageFromPrice) / 100) * selectedDaysVehicles}</td>
                    <td class="table-last"><div onclick="purchaseVehicleInsurance('${v.plate}')">${translation.cityhall.insurances.vehicles.insure_btn}</div></td>
                </tr>
            `
        }
        
        return vehiclesData;
    },

    LoadInsuranceVehiclesDays: (days) => {
        let daysData = '';

        for (const [k, v] of Object.entries(days)) {
            daysData += `<div data-days="${v}" onclick="selectInsuranceDays('vehicleInsurance', ${v})">${v} ${translation.cityhall.insurances.days}</div>`
        }

        $('.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days').html(daysData);
    },

    LoadLicenses: (licenses, myLicenses) => {
        let licensesData = '';

        for (const [k, v] of Object.entries(licenses)) {
            if (v.visible === undefined || v.visible === true) {
                licensesNames[v.name] = v.label;
                let { days, hours, minutes } = v.needToOrder == true && Number(v.needToOrder) >= 1 && formatDeliveryTime(v.deliveryTime);
                licensesData += `
                    <div>
                        <div class="delivery-time"><i class="fa-solid fa-clock"></i> ${translation.cityhall.documents.documents_list.delivery_time} ${v.needToOrder && (`
                                ${days == 1 ? `${days} ${translation.cityhall.documents.documents_list.delivery_time_day}` : ``}
                                ${days > 1 ? `${days} ${translation.cityhall.documents.documents_list.delivery_time_days}` : ``}
                                ${hours == 1 ? `${hours} ${translation.cityhall.documents.documents_list.delivery_time_hour}` : ``}
                                ${hours > 1 ? `${hours} ${translation.cityhall.documents.documents_list.delivery_time_hours}` : ``}
                                ${minutes == 1 ? `${minutes} ${translation.cityhall.documents.documents_list.delivery_time_minute}` : ``}
                                ${minutes > 1 ? `${minutes} ${translation.cityhall.documents.documents_list.delivery_time_minutes}` : ``}
                            `) || `${translation.cityhall.documents.documents_list.delivery_time_instant}`
                    }
                        </div>
                        <div class="label">${v.label}</div>
    
                        ${myLicenses && myLicenses[v.name] && myLicenses[v.name].deliveryTime && `
                            <div class="status">
                                <span>${myLicenses[v.name].deliveryTime > Date.now() / 1000 | 0 ? `${translation.cityhall.documents.documents_list.for_pickup_from} ${formatDate(myLicenses[v.name].deliveryTime).date + ` ` + formatDate(myLicenses[v.name].deliveryTime).time}` : `${translation.cityhall.documents.documents_list.ready_for_pickup}`}.</span>
                            </div>
                        ` || ``}
    
                        ${myLicenses && myLicenses[v.name] && myLicenses[v.name].deliveryTime && (myLicenses[v.name].deliveryTime < Date.now() / 1000 | 0 && `<div class="order" onclick="pickupDocument('${v.name}')">${translation.cityhall.documents.documents_list.pickup_btn}</div>` || ' ') || `${v.price && v.price >= 1 && `<div class="order" onclick="orderDocument('${v.name}')">${translation.cityhall.documents.documents_list.order_for_btn} ${translation.currency}${v.price}</div>` || `<div class="order" onclick="orderDocument('${v.name}')">${translation.cityhall.documents.documents_list.order_btn}</div>`}`}
                    </div>
                `
            }
        }

        return licensesData;
    },

    LoadOwnedDocumentPhotos: (photosList) => {
        let photosData = '';
        if (photosList) {
            for (const [k, v] of Object.entries(photosList)) {
                if (!v.used) {
                    let photoId = Number(k) + 1
                    photosData += `
                        <div>
                            <img src="${v.img}">
                            <div>
                                <div>${translation.cityhall.documents.photos_list.id}: ${photoId}</div>
                                <div id="remove-photo" onclick="removePhoto(${photoId})">${translation.cityhall.documents.photos_list.remove_photo_btn}</div>
                                <div id="select-photo" onclick="selectDocumentPhoto(${photoId})">${translation.cityhall.documents.photos_list.select_photo_btn}</div>
                            </div>
                        </div>
                    `
                }
            }
            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] > .photos-list > div').html(photosData);
        }
    },
    
    LoadOwnedDocuments: (ownedDocumentsList) => {
        let documentsData = '';
        let useStreamer = localStorage.getItem("streamer-mode") == 1;
        
        if (ownedDocumentsList) {
            for (const [k, v] of Object.entries(ownedDocumentsList)) {
                if (v.valid) {
                    documentsData += `
                        <div>
                            <div>
                                <i class="fa-solid fa-id-card"></i>
                            </div>
                            <div class="info">
                                <span>${translation.cityhall.documents.owned_documents_list.document_type}: <span>${licensesNames[v.type]}</span></span>
                                <span id="serial-number">${translation.cityhall.documents.owned_documents_list.serial_number}: <span data-value="${v.serial_number}">${useStreamer ? '****' : v.serial_number}</span></span>
                                <div class="invalidate" onclick="invalidateDocument('${v.serial_number}')">${translation.cityhall.documents.owned_documents_list.report_btn}</div>
                            </div>
                        </div>
                    `
                }
            }
        }
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"] > .documents-list > div').html(documentsData);
    },

    LoadFines: (fines) => {
        let finesData = '';

        const sortedFines = Object.entries(fines).sort(([, a], [, b]) => b.id - a.id);
        for (const [k, v] of sortedFines) {
            finesData += `
                <div>
                    ${v.canceled ? `<div class="status canceled">${translation.cityhall.fines.statuses.canceled}</div>` : (v.is_paid ? `<div class="status paid">${translation.cityhall.fines.statuses.paid}</div>` : `<div class="status to-paid">${translation.cityhall.fines.statuses.to_paid}</div>`)}
                    
                    <div class="name">
                        <div class="id">#${v.id}</div>
                        <div class="label">
                            ${v.type == "traffic-ticket" && translation.cityhall.fines.types.traffic_ticket || ""}
                            ${v.type == "ticket" && translation.cityhall.fines.types.ticket || ""}
                            ${v.type == "invoice" && translation.cityhall.fines.types.invoice || ""}
                            ${v.type == "receipt" && translation.cityhall.fines.types.receipt || ""}
                        </div>
                    </div>
                    
                    <div class="info">
                        <hr>
                        ${v.data.job_label ? `<div class="company">${translation.cityhall.fines.company}: <span>${v.data.job_label}</span></div>` : ``}
                        ${v.data.issuer ? `<div class="issuer">${translation.cityhall.fines.issuer}: <span>${v.data.issuer}</span></div>` : ``}
                        ${v.amount ? `<div class="amount">${translation.cityhall.fines.amount}: <span>$${(v.amount).toLocaleString(undefined)}</span></div>` : ``}
                    </div>

                    <div class="view" data-id="${k}" data-ticket-type="${v.type}">${translation.cityhall.fines.view_btn}</div>
                </div>
            `
        }

        return finesData;
    },

    LoadTaxes: (taxes) => {
        let taxesData = '';

        const sortedTaxes = Object.entries(taxes).sort(([, a], [, b]) => b.id - a.id);
        for (const [k, v] of sortedTaxes) {
            let maxPaymentTime = addDaysToTimestamp(v.received_date * 1000, taxPaymentMaxDays);
            let daysDifference = differenceInDays(v.received_date * 1000, Date.now());
            let {date, time} = formatDate(maxPaymentTime / 1000);
            
            taxesData += `
                <div>
                    ${v.canceled ? `<div class="status canceled">${translation.cityhall.taxes.statuses.canceled}</div>` : (v.is_paid ? `<div class="status paid">${translation.cityhall.taxes.statuses.paid}</div>` : `<div class="status to-paid">${translation.cityhall.taxes.statuses.to_paid}</div>`)}
                    <div class="name">
                        <div class="id">#${v.id}</div>
                        <div class="label">${translation.cityhall.taxes.label}</div>
                    </div>
                    <div class="info">
                        <hr>
                        ${v.title ? `<div class="for">${translation.cityhall.taxes.for}: <span>${v.title}</span></div>` : ``}
                        ${v.amount ? `<div class="amount">${translation.cityhall.taxes.amount}: <span>${translation.currency}${v.amount}</span></div>` : ``}
                        ${daysDifference > taxPaymentMaxDays ? `<div class="amount">${translation.cityhall.taxes.overdue_interest}: <span>${translation.currency}${Math.floor(v.amount * (taxOverduePaymentPercent * (daysDifference - taxPaymentMaxDays)) / 100)}</span></div>` : ``}
                        ${v.received_date ? `<div class="amount">${translation.cityhall.taxes.maximum_payment_date}: <span>${date} ${time}</span></div>` : ``}
                    </div>
                    <div class="pay left" data-payment-method="cash" data-id="${k}">${translation.cityhall.taxes.pay_cash_btn}</div>
                    <div class="pay right" data-payment-method="bank" data-id="${k}">${translation.cityhall.taxes.pay_bank_btn}</div>
                </div>
            `
        }
       
        
        return taxesData;
    }
}

const Documents = {
    Receipt: (fineId, data, data2) => {
        if (data2) ticketSettings = data2;
        
        let date = null, time = null;

        if (data && data.issue_date) {
            ({ date, time } = formatDate(data.issue_date));
        }

        $('.receipt .give select, .receipt table tbody').empty();
        $('.receipt').removeClass('preview');
        $(`
            .receipt > div > .buttons,
            .receipt > div > .thank-you-message,
            .receipt .give,
            .receipt .list .add-new-product,
            .receipt .date,
            .receipt .transaction_id,
            #receipt .paid_by
        `).hide();
        
        if (data) {
            $('.receipt').addClass('preview');
            $("#receipt .header-label").text(data.data.job_label);

            $(`
                .receipt > div > .buttons,
                .receipt .transaction_id,
                .receipt .date
            `).show();
            
            
            $('.receipt .date span').text(`${date} ${time}`);
            if (data.fineId && Number(data.fineId)) {
                $('.receipt .transaction_id span').html(data.fineId);
            } else {
                $('.receipt .transaction_id').hide();
            }
            
            if (data.data.paymentMethod) {
                $('#receipt .paid_by').show()
                $('#receipt .paid_by span').text(data.data.paymentMethod == 'cash' && translation.receipt.pay_with_cash || translation.receipt.pay_with_bank)
            }

            if (data.is_paid) {
                $('.receipt > div > .buttons').hide();
                $('.receipt > div > .thank-you-message').show();
            }

            (data.data.values).forEach(row => {
                addReceiptElement(row)
            });
            calculateReceiptSubTotalAndTotal(data.data.tax)
        } else if (data2) {
            $("#receipt .header-label").text(data2.label);
            $('#receipt .sub_total span#value, #receipt .sales_tax span#value, #receipt .total span#value').text('0.0');

            $('#receipt .paid_by, #receipt .buttons, #receipt .thank-you-message').hide();

            $(".receipt input, .receipt select").prop('disabled', false);

            const closestPlayersData = [{
                id: 0,
                text: translation.receipt.select_option,
                disabled: true,
                selected: true
            }];
            for (const [k, v] of Object.entries(data2.players)) {
                closestPlayersData.push({
                    id: v,
                    text: (translation.receipt.citizen).format(v)
                })
            };
            $('.receipt .give select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: closestPlayersData
            });
            $('.receipt .give, .receipt .list .add-new-product').show();
            addReceiptElement();
            calculateReceiptSubTotalAndTotal();
        }

        $('#receipt').fadeIn(120);
    },
    
    Ticket: (fineId, typesAvailable, type, data, data2, issuerView, inputsData) => {
        if (data2) ticketSettings = data2;

        ticketType = null;

        if (!type && !data) {
            if (typesAvailable['traffic-ticket']) ticketType = 'traffic-ticket';
            if (typesAvailable['ticket']) ticketType = 'ticket';
        } else {
            ticketType = type;
        }

        isTrafficTicket = ticketType == 'traffic-ticket'

        const dateNow = new Date();
        let timestamp = (dateNow.getTime() / 1000);
        let { date, time } = formatDate(data ? data.issue_date : timestamp)

        $('.ticket .canceled_stamp').hide();
        $('.ticket > div').removeClass('preview');
        if (data) {
            $('.ticket > div').addClass('preview');
            if (data.canceled) $('.ticket .canceled_stamp').show();
        } else if (data2) {
            $('.ticket #receiver > select').html('');
            $('.ticket #due-date > select').html('');
            $('.ticket #license-type > select').html('');
            $('.ticket #license-suspension-time > select').html('');

            const closestPlayersData = [{
                id: 0,
                text: translation.ticket.select_option,
                disabled: true,
                selected: true
            }];

            for (const [k, v] of Object.entries(data2.players)) {
                closestPlayersData.push({
                    id: v,
                    text: (translation.ticket.citizen).format(v)
                })
            };

            $('.ticket #receiver > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: closestPlayersData
            });

            const dueDatesData = [{
                id: 0,
                text: translation.ticket.select_option,
                disabled: true,
                selected: true
            }];

            for (const [k, v] of Object.entries(data2.dueDates)) {
                dueDatesData.push(
                    {
                        id: v,
                        text: v == -1 && translation.ticket.due_date_instant || (translation.ticket.due_date).format(v)
                    },
                )
            };

            $('.ticket #due-date > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: dueDatesData
            });


            if (data2.licenseRevocation) {
                const licenseRevocationData = [{
                    id: 0,
                    text: translation.ticket.select_option,
                    disabled: true,
                    selected: true
                }];

                for (const [k, v] of Object.entries(data2.licenseRevocation)) {
                    licenseRevocationData.push({
                        id: k,
                        text: v
                    })
                };

                $('.ticket #license-type > select').select2({
                    minimumResultsForSearch: Infinity,
                    allowClear: false,
                    data: licenseRevocationData
                });

                if (data2.licenseSuspension) {
                    const licenseSuspensionData = [{
                        id: 0,
                        text: translation.ticket.select_option,
                        disabled: true,
                        selected: true
                    }, {
                        id: 0,
                        text: translation.ticket.none_option,
                    }];

                    for (const [k, v] of Object.entries(data2.licenseSuspension)) {
                        licenseSuspensionData.push(
                            {
                                id: v,
                                text: v == -1 && translation.ticket.due_date_instant || (translation.ticket.due_date).format(v)
                            },
                        )
                    };

                    $('.ticket #license-suspension-time > select').select2({
                        minimumResultsForSearch: Infinity,
                        allowClear: false,
                        data: licenseSuspensionData
                    });

                    $('.ticket > div > div[data-type="traffic"] > div #license-type').addClass('border-right');
                    $('.ticket > div > div[data-type="traffic"] > div #license-type').addClass('border-right');
                    $('.ticket > div > div[data-type="traffic"] > div #license-suspension-time').show();
                } else {

                    $('.ticket > div > div[data-type="traffic"] > .row-7').css({ 'grid-template-columns': '15.5em 14.5em' });
                    $('.ticket > div > div[data-type="traffic"] > div #license-type').removeClass('border-right');
                    $('.ticket > div > div[data-type="traffic"] > div #license-suspension-time').hide();

                }
            } else {
                $('.ticket > div > div[data-type="traffic"] > .row-7').hide();
            }
            if (data2.penaltyPoints) {
                $('.ticket > div > div[data-type="traffic"] > .row-7').show();
            } else {
                $('.ticket > div > div[data-type="traffic"] > .row-8').hide();
            }

            $('.ticket > div > div[data-type="traffic"] > div #location-of-violation > input').val(data2.locationAddress);
        }

        $('.ticket > div > .header > p').text(isTrafficTicket ? translation.ticket.type_ticket_traffic : translation.ticket.type_ticket);
        $('.ticket > div > div[data-type="traffic"] > div #date > div').text(date);
        $('.ticket > div > div[data-type="traffic"] > div #time-issued > div').text(time);
        
        if (data) $('.ticket > div > div[data-type="traffic"] > div #location-of-violation > input').val(data.data.location_of_violation);

        $('.ticket > div > div[data-type="traffic"] > div #violation > input').val(data ? data.data.violation : "");
        $('.ticket > div > div[data-type="traffic"] > div #fine-amount > input').val(data ? (data.amount).toLocaleString(undefined) : "");
        $('.ticket > div > div[data-type="traffic"] > div #comments > textarea').val(data ? data.data.comments : "");
        $('.ticket > div > div[data-type="traffic"] > div #officer > div').text(data ? data.data.issuer : "");

        if (isTrafficTicket) {
            if (ticketSettings) {
                if (ticketSettings.licenseRevocation) {
                    $('.ticket > div > div[data-type="traffic"] > .row-7').show();
                }
                if (ticketSettings.penaltyPoints) {
                    $('.ticket > div > div[data-type="traffic"] > .row-8').show();
                }
            }

            $('.ticket > div > div[data-type="traffic"] > .row-2').show();
            $('.ticket > div > div[data-type="traffic"] > div #license-number > input').val(data ? data.data.license_plate : "");
            $('.ticket > div > div[data-type="traffic"] > div #vehicle-make > input').val(data ? data.data.vehicle_make : "");
            $('.ticket > div > div[data-type="traffic"] > div #vehicle-model > input').val(data ? data.data.vehicle_model : "");
            
            if (data2 && data2.plate) $('.ticket > div > div[data-type="traffic"] > div #license-number > input').val(data2.plate);
            if (data2 && data2.model) $('.ticket > div > div[data-type="traffic"] > div #vehicle-model > input').val(data2.model);

            if (!useVIN) {
                $('.ticket > div > div[data-type="traffic"] > .row-3').hide();
            } else {
                $('.ticket > div > div[data-type="traffic"] > .row-3').show();
                $('.ticket > div > div[data-type="traffic"] > div #vin > input').val(data ? data.data.vehicle_vin : "");
                if (data2 && data2.vin) $('.ticket > div > div[data-type="traffic"] > div #vin > input').val(data2.vin);                
            }

        } else {
            $(`
                .ticket > div > div[data-type="traffic"] > .row-2,
                .ticket > div > div[data-type="traffic"] > .row-3,
                .ticket > div > div[data-type="traffic"] > .row-7,
                .ticket > div > div[data-type="traffic"] > .row-8
            `).hide();

        }

        $('.ticket .confirm').hide();
        $('.ticket .select-payment').hide();
        $('.ticket .cancel').hide();
        $('.ticket > div > div[data-type="traffic"] > div #license-revocation > div').removeClass('selected');
        $('.ticket > div > div[data-type="traffic"] > div #license-points > div').removeClass('selected');
        $('.ticket > div > div[data-type="traffic"] > .row-8 > #license-points-count > input').val('');

        if (data) {
            $('#receiver > select').html(`<option>${data.data.receiver}</option>`)
            $(".ticket input").prop('disabled', true);
            $(".ticket textarea").prop('disabled', true);
            $(".ticket select").prop('disabled', true);
            $(".ticket > div > .select-ticket-type").hide();

            if (data.data.license_label) {
                $('.ticket > div > div[data-type="traffic"] > .row-7 > #license-type > select').html(`<option>${data.data.license_label}</option>`);
                if (data.data.license_revocation) {
                    $('.ticket > div > div[data-type="traffic"] > div #license-revocation > div').addClass('selected');
                    if (data.data.license_suspension_time) {
                        $('.ticket > div > div[data-type="traffic"] > .row-7 > #license-suspension-time > select').html(`<option>${data.data.license_suspension_time == -1 && translation.ticket.due_date_instant || data.data.license_suspension_time == 0 && translation.ticket.none_option || (translation.ticket.due_date).format(data.data.license_suspension_time)}</option>`);
                    }
                }
                if (data.data.penalty_points) {
                    $('.ticket > div > div[data-type="traffic"] > div #license-points > div').addClass('selected');
                    if (data.data.penalty_points_count) {
                        $('.ticket > div > div[data-type="traffic"] > .row-8 > #license-points-count > input').val(data.data.penalty_points_count);
                    }
                }
            }

            $('.ticket>div>div>.row-10').css({ 'grid-template-columns': 'auto' });
            $('.ticket>div>div>.row-10>#officer').removeClass('border-right');
            $('.ticket>div>div>.row-10>#submit').hide();
            $('.ticket #due-date > select').html(`
                <option>${data.date_to_pay == -1 && translation.ticket.due_date_instant || (translation.ticket.due_date).format(data.date_to_pay)}</option>
            `)
            
            if (fineId && fineId == 'instant' && data.date_to_pay != -1) {
                $('.ticket .confirm').show();
            } else {
                if (!data.is_paid && !data.canceled) {
                    if (issuerView) {
                        $('.ticket .cancel').show();
                    } else {
                        $('.ticket .select-payment').show();
                    }
                }
            }

        } else {
            $(".ticket input").prop('disabled', false);
            $(".ticket textarea").prop('disabled', false);
            $(".ticket select").prop('disabled', false);
            if (typesAvailable['traffic-ticket'] && typesAvailable['ticket']) {
                $(".ticket > div > .select-ticket-type").show();
            }
            $('.ticket > div > div[data-type="traffic"] > .row-7 > #license-suspension-time > span').css({ 'opacity': 0.4 });
            $('.ticket > div > div[data-type="traffic"] > .row-7 > #license-suspension-time > select, .ticket > div > div[data-type="traffic"] > .row-8 > #license-points-count > input').prop("disabled", true);

            $('.ticket>div>div>.row-10').removeAttr('style');
            $('.ticket>div>div>.row-10>#officer').addClass('border-right');
            $('.ticket>div>div>.row-10>#submit').show();
            $('.ticket .select-payment').hide();
        }

        $('#ticket').fadeIn(120);
    },

    Invoice: (fineId, data, data2, issuerView) => {
        if (data2) ticketSettings = data2;

        const dateNow = new Date();
        let timestamp = (dateNow.getTime() / 1000);
        let { date, time } = formatDate(data ? data.issue_date : timestamp)

        $('.invoice .informations > #bill-to > select').html('');
        $('.invoice > div > .card > .invoice-data > #payment-due > select').html('');

        $('.invoice .informations > #issuer > .data > .job').html('');
        $('.invoice .informations > #issuer > .data > .name').html('');

        $('.invoice .informations > #bill-to > select').html('');
        $('.invoice .informations #invoice-id .val').html('');
        $('.invoice .informations #invoice-id').hide();
        $('.invoice .informations #invoice-date .val').html('');
        $('.invoice .informations #due-date .val').html('');
        $('.invoice .signature > p').html('');

        $('.invoice > div > .card > .invoice-data > #payment-due > span.select2').hide();
        $('.invoice > div > .card > .invoice-data > #payment-due > select').hide();

        $('.invoice table tbody').html('');
        
        $('.invoice .confirm').hide();
        $('.invoice .select-payment').hide();
        $('.invoice .cancel').hide();

        $('.invoice .canceled_stamp').hide();

        $('.invoice .signature > div').hide();
        $('.invoice').removeClass('preview');
        if (data) {
            $('.invoice').addClass('preview');
            if (data.canceled) $('.invoice .canceled_stamp').show();

            $('.invoice .informations > #issuer > .data > .job').html(data.data.job_label);
            $('.invoice .informations > #issuer > .data > .name').html(data.data.issuer);

            $('.invoice .informations > #bill-to > select').html(`
                <option>${data.data.receiver}</option>
            `).prop('disabled', true);

            if (data.fineId && Number(data.fineId)) {
                $('.invoice .informations #invoice-id').show().html(data.fineId);
            }
            
            $('.invoice .informations #invoice-date .val').html(date);

            $('.invoice > div > .card > .data > div > #sales-tax > p').html((translation.invoice.table.sales_tax).format(data.data.tax));

            if (data.date_to_pay && data.date_to_pay == -1) {
                $('.invoice .informations #due-date .val').html(translation.ticket.due_date_instant);
                $('.invoice > div > .card > .invoice-data > #payment-due > span.text').text(translation.invoice.terms.payment_instant);
                
            } else {
                const daysToAdd = parseInt(data.date_to_pay, 10);
                
                const dueDate = new Date();
                dueDate.setTime(dueDate.getTime() + (daysToAdd * 24 * 60 * 60 * 1000));
                
                const timestamp = dueDate.getTime();
                let { date, time } = formatDate(timestamp/1000)
                $('.invoice .informations #due-date .val').html(date);

                $('.invoice > div > .card > .invoice-data > #payment-due > span.text').text(translation.invoice.terms.payment_within);
                $('.invoice > div > .card > .invoice-data > #payment-due > select').show().html(`
                    <option>${(translation.ticket.due_date).format(data.date_to_pay)}</option>
                `).prop('disabled', true);
            }

            $('.invoice .signature > p').html(data.data.issuer);

            if (fineId && fineId == 'instant' && data.date_to_pay != -1) {
                $('.invoice .confirm').show();
            } else {
                if (!data.is_paid && !data.canceled) {
                    if (issuerView) {
                        $('.invoice .cancel').show();
                    } else {
                        $('.invoice .select-payment').show();
                    }
                }
            }

            (data.data.values).forEach(row => {
                addInvoiceElement(row)
            });

            calculateSubTotalAndTotal(data.data.tax)
            

        } else if (data2) {
            $('.invoice .informations > #issuer > .data > .job').html(ticketSettings.label);
            $('.invoice .informations > #issuer > .data > .name').html(playerName);

            $('.invoice .informations #invoice-date .val').html(date);
            $('.invoice .informations #due-date .val').html('');

            const closestPlayersData = [{
                id: 0,
                text: translation.ticket.select_option,
                disabled: true,
                selected: true
            }];

            for (const [k, v] of Object.entries(ticketSettings.players)) {
                closestPlayersData.push({
                    id: v,
                    text: (translation.ticket.citizen).format(v)
                })
            };

            $('.invoice .informations > #bill-to > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: closestPlayersData
            }).prop('disabled', false);
            

            const dueDatesData = [{
                id: 0,
                text: translation.ticket.select_option,
                disabled: true,
                selected: true
            }];

            for (const [k, v] of Object.entries(ticketSettings.dueDates)) {
                dueDatesData.push(
                    {
                        id: v,
                        text: v == -1 && translation.ticket.due_date_instant || (translation.ticket.due_date).format(v)
                    },
                )
            };
            
            $('.invoice > div > .card > .invoice-data > #payment-due > span').text(translation.invoice.terms.payment_within);
            $('.invoice > div > .card > .invoice-data > #payment-due > select').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: dueDatesData
            }).prop('disabled', false);

            $('.invoice > div > .card > .data > div > #sales-tax > p').html((translation.invoice.table.sales_tax).format(ticketSettings.taxFromInvoice || 0));

            $('.invoice .signature > div').show();
            $('.invoice .signature > p').html('');

            $('.invoice > div > .card > .invoice-data > #payment-due > select').on('select2:select', function (e) {
                let days = $('.invoice > div > .card > .invoice-data > #payment-due > select').select2('data')[0];
                if (days.id == -1) {
                    $('.invoice .informations #due-date .val').html(translation.ticket.due_date_instant);
                } else {
                    const daysToAdd = parseInt(days.id, 10);
                    
                    const dueDate = new Date();
                    dueDate.setTime(dueDate.getTime() + (daysToAdd * 24 * 60 * 60 * 1000));
                    
                    const timestamp = dueDate.getTime();
                    let { date, time } = formatDate(data ? data.date_to_pay : timestamp/1000)
                    $('.invoice .informations #due-date .val').html(date);
                }
            });

            addInvoiceElement();
            calculateSubTotalAndTotal()

        }

        $('.invoice').fadeIn(120);
    },

    EmptyResume: (toJob, playerName, playerNumber, photo) => {
        myResumeSkills = [];
        myResumeInterests = [];

        $('#resume').removeClass('isPreview');
        $('#resume>.resume>.resume-title').show().html((translation.resume.title).format(toJob))
        $("#resume>.resume>.left>img").attr("src", photo);

        let interestsData = '';
        for (const [_, interest] of Object.entries(config.resumeInterestsList)) {
            interestsData += `<div>${interest}</div>`
        };
        $('#resume #interests > #data').html(interestsData);

        let skillsData = '';
        for (const [_, skill] of Object.entries(config.resumeSkillsList)) {
            skillsData += `<div>${skill}</div>`
        };
        $('#resume #skills > #data').html(skillsData);

        $('#resume>.resume>.right>#player-name').html(playerName);
        $('#resume>.resume>.right>.informations>#email>span').html(playerName.toLowerCase().replace(/\s+/g, '.') + config.resumeEmail);
        $('#resume>.resume>.right>.informations>#phone-number>input').val('').prop('disabled', false);
        $('#resume>.resume>.right>.informations>#phone-number>input').attr("placeholder", translation.resume.phonenumber_placeholder);
        $('#resume>.resume>.right>.informations>#city>span').html(config.resumeCity);

        $('#resume>.resume>.right>#about-me>textarea').val('').attr("placeholder", translation.resume.aboutme_placeholder).prop('disabled', false);
        $('#resume>.resume>.right>#work-experience>textarea').val('').attr("placeholder", translation.resume.workexperience_placeholder).prop('disabled', false);

        $('#resume>.resume>.right>.action-buttons').html(`
            <div id="submit">
                <p>${translation.resume.submit_btn}</p>
            </div>
        `)
        $(`.cityhall-menu, .cityhall-menu > div, .cityhall-menu > div > .menu > .main > div`).hide();
        $('#resume').css('display', 'flex');
    },

    Resume: (data) => {
        $('#resume').addClass('isPreview');
        $('#resume>.resume>.resume-title').hide().html('');
        $("#resume>.resume>.left>img").attr("src", data.informations.photo);

        let interestsData = '';
        for (const [_, interest] of Object.entries(data.informations.interests)) {
            interestsData += `<div>${interest}</div>`
        };
        $('#resume #interests > #data').html(interestsData);

        let skillsData = '';
        for (const [_, skill] of Object.entries(data.informations.skills)) {
            skillsData += `<div>${skill}</div>`
        };
        $('#resume #skills > #data').html(skillsData);

        $('#resume>.resume>.right>#player-name').html(data.sender_name);
        $('#resume>.resume>.right>.informations>#email>span').html((data.sender_name).toLowerCase().replace(/\s+/g, '.') + config.resumeEmail);
        $('#resume>.resume>.right>.informations>#phone-number>input').val(data.informations.phone_number).prop('disabled', true);
        $('#resume>.resume>.right>.informations>#city>span').html(config.resumeCity);

        $('#resume>.resume>.right>#about-me>textarea').val(data.informations.about_me).prop('disabled', true);
        $('#resume>.resume>.right>#work-experience>textarea').val(data.informations.work_experience).prop('disabled', true);

        $('#resume>.resume>.right>.action-buttons').html(`
            <div id="agree">
                <p>${translation.resume.agree_btn}</p>
            </div>
                                
            <div id="decline">
                <p>${translation.resume.decline_btn}</p>
            </div>
        `)

        $('#resume').css('display', 'flex');
    },

    SaleAgreement: (data) => {
        currentMenu = 'agreement';
        playerName = data.characterName;

        let isSeller = data.type == "seller"

        const dateNow = new Date();
        let timestamp = (dateNow.getTime() / 1000);
        let {date, time} = formatDate(timestamp);
        currentDate = date + ' ' + time

        $(".agreement #give_invoice").css({
            "z-index": -500,
            "opacity": 0.0
        });

        if (isSeller) {
            const closestPlayersData = [];
            const licensePlatesData = [];
            const paymentMethodsData = [];

            $(".agreement .card .signatures .seller #give_invoice").text(translation.agreement.give_contract_btn);

            $(".agreement #signature_seller").text("");
            $(".agreement #signature_buyer").text("");
            
            $(".agreement #make_signature_seller").show();
            $(".agreement #make_signature_buyer").hide();

            let playersList = `<select id="select-buyer" name="select-buyer" style="width: 8em;">`
            closestPlayersData.push({
                id: 0,
                text: translation.agreement.select_option,
                disabled: true,
                selected: true
            })
            
            if (data.companies) {
                closestPlayersData.push(
                    {
                        "id": 1,
                        "text": translation.agreement.companies_group,
                        "children": [
                            {
                                "id": data.companies.name,
                                "text": data.companies.label,
                                "name": data.companies.name
                            }
                        ]
                    }
                )
            }

            closestPlayersData.push(
                {
                    "id": 2,
                    "text": translation.agreement.citizens_group,
                    "children": []
                }
            )

            let closestPlayersID = closestPlayersData[2] && 2 || 1
                
            for (const [k, v] of Object.entries(data.players)) {
                closestPlayersData[closestPlayersID].children.push(
                    {
                        "id": v,
                        "text": (translation.agreement.citizen).format(v)
                    }
                )
            };

            playersList += `</select>`

            let licensePlate = `
                <select id="select-vehicle" name="select-vehicle" onchange="agreementChangedVehicle(this)" style="width: 8em;">
            `
            licensePlatesData.push({
                id: 0,
                text: translation.agreement.select_option,
                disabled: true,
                selected: true
            })
            for (const [k, v] of Object.entries(data.myVehiclesList)) {
                licensePlatesData.push({
                    id: k,
                    text: v.plate,
                    type: v.type
                })
            };
            licensePlate += `</select>`
            

            $(".agreement .card .paragraph_text_1").html(`
                ${(translation.agreement.paragraph_1_text).format(playersList, `<span id="dots">...........</span>`, licensePlate)}
            `);
            
            $(".agreement .card .paragraph_text_2").html(`
                ${(translation.agreement.paragraph_2_text).format(`<span id="dots">...........</span>`, `<span id="dots">...........</span>`)}
            `);

            let paymentMethod = `
                <select id="select-payment-method" name="select-payment-method" style="width: 9em;">
            `
            paymentMethodsData.push({
                id: 0,
                text: translation.agreement.select_option,
                disabled: true,
                selected: true
            })
            if (agreementPaymentMethods) {
                (agreementPaymentMethods).forEach(element => {
                    paymentMethodsData.push({
                        id: element,
                        text: translation.agreement[element],
                        paymentmethod: element
                    })
                });
            }
            paymentMethod += `</select>`
            $(".agreement .card .paragraph_text_3").html(`
                ${(translation.agreement.paragraph_3_text).format(`<input id="sell-price-input" type="number" style="width: 10em">`, translation.currency, paymentMethod)}
                ${translation.agreement.paragraph_3_text_2}
            `);
            
            $('#select-buyer').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: closestPlayersData
                // data: 
            });

            $('#select-vehicle').select2({
                allowClear: false,
                data: licensePlatesData
            });

            $('#select-payment-method').select2({
                minimumResultsForSearch: Infinity,
                allowClear: false,
                data: paymentMethodsData
            });
        } else {

            $(".agreement #make_signature_seller").hide();
            $(".agreement #make_signature_buyer").show();

            $(".agreement #signature_seller").text(data.data.resellData.sellerName)
            $(".agreement #signature_buyer").text("");

            $(".agreement .card .paragraph_text_1").html(`
                ${(translation.agreement.paragraph_1_text).format(data.characterName, data.data.resellData.vehicleType, data.data.resellData.vehiclePlate)}
            `);
            
            $(".agreement .card .paragraph_text_2").html(`
                ${(translation.agreement.paragraph_2_text).format(data.data.resellData.vehicleType, data.data.resellData.vehicleType)}
            `);
            
            $(".agreement .card .paragraph_text_3").html(`
                ${(translation.agreement.paragraph_3_text).format(data.data.resellData.price, translation.currency, data.data.resellData.paymentMethod)}
                ${translation.agreement.paragraph_3_text_2}
            `);
        }

        $(".agreement .card #date > div").text(`${isSeller ? currentDate : data.data.resellData.date} - ${translation.agreement.town}`);

        $(".agreement").fadeIn(120);
    },

    SignedSaleAgreement: (data) => {
        currentMenu = 'agreement';

        $(".agreement #give_invoice").css({
            "z-index": -500,
            "opacity": 0.0
        });

        $(".agreement #make_signature_seller").hide();
        $(".agreement #make_signature_buyer").hide();

        $(".agreement #signature_seller").text(data.sellerName)
        $(".agreement #signature_buyer").text(data.buyerName);

        $(".agreement .card .paragraph_text_1").html(`
            ${(translation.agreement.paragraph_1_text).format(data.buyerName, translation.agreement.vehicle_types.vehicle, data.plate)}
        `);
        
        $(".agreement .card .paragraph_text_2").html(`
            ${(translation.agreement.paragraph_2_text).format(translation.agreement.vehicle_types.vehicle, translation.agreement.vehicle_types.vehicle)}
        `);
        
        $(".agreement .card .paragraph_text_3").html(`
            ${(translation.agreement.paragraph_3_text).format(data.price, translation.currency, data.paymentMethod)}
            ${translation.agreement.paragraph_3_text_2}
        `);
        
        $(".agreement .card #date > div").text(`${data.date} - ${translation.agreement.town}`);
        $(".agreement").fadeIn(120);
    },

    CertificateNoCriminal: (data) => {
        $('.certificate_no_criminal .card #date > p').text(data.dateOfIssue);

        $('.certificate_no_criminal > div > .card > #ssn').hide();

        if (data.ssn) {
            $('.certificate_no_criminal > div > .card > #ssn > p').text(data.ssn);
            $('.certificate_no_criminal > div > .card > #ssn').show();
        }

        $('.certificate_no_criminal > div > .card > #lastName #val').text(data.lastName);
        $('.certificate_no_criminal > div > .card > #firstName #val').text(data.firstName);
        $('.certificate_no_criminal > div > .card > #dateOfBirth #val').text(data.dateOfBirth);
        $('.certificate_no_criminal > div > .card > #nationality #val').text(data.nationality);
        $('.certificate_no_criminal > div > .card > #sentences #val').text(data.sentences ? data.sentences : '');

        if (data.isListed) {
            $('.certificate_no_criminal > div > .card > .is_listed').show();
            $('.certificate_no_criminal > div > .card > .is_not_listed').hide();
        } else {
            $('.certificate_no_criminal > div > .card > .is_listed').hide();
            $('.certificate_no_criminal > div > .card > .is_not_listed').show();
        }

        $('.certificate_no_criminal').fadeIn(120);
    },
}

const MenuVIN = {
    Open: () => {
        currentMenu = 'vin_menu';

        $('.vin_menu #find input').val('');

        $('.vin_menu #find').show();
        $('.vin_menu #loading').hide();
        $('.vin_menu #result').hide();

        $('.vin_menu').css('display', 'flex');
        $('.vin_menu > div').fadeIn(120);
    },
    Update: (data) => {
        if (!data) {
            MenuVIN.Open()
            return
        };
        $('.vin_menu #result .model').hide();
        $('.vin_menu #result .owner-name').hide();
        $('.vin_menu #result .plate').hide();
        $('.vin_menu #result .insurance-start-time').hide();
        $('.vin_menu #result .insurance-end-time').hide();
        
        $('.vin_menu #result .title').html((translation.vin_info.results.title).format(`<span>${data.vin}</span>`));
        
        if (data.model) $('.vin_menu #result .model').html((translation.vin_info.results.model).format(`<span>${data.model}</span>`)).show();

        if (data.ownerName) $('.vin_menu #result .owner-name').html((translation.vin_info.results.owner_name).format(`<span>${data.ownerName}</span>`)).show();
        
        if (data.plate) $('.vin_menu #result .plate').html((translation.vin_info.results.plate).format(`<span>${data.plate}</span>`)).show();
        
        if (data.insurance) {
            if (data.insurance.startTime) {
                let { date, time } = formatDate(data.insurance.startTime)
                $('.vin_menu #result .insurance-start-time').html((translation.vin_info.results.insurance_start_time).format(`<span>${date}</span>`, `<span>${time}</span>`)).show();
                
            } else {
                $('.vin_menu #result .insurance-start-time').html().show();
                
            }

            if (data.insurance.endTime) {
                let { date, time } = formatDate(data.insurance.endTime)
                $('.vin_menu #result .insurance-end-time').html((translation.vin_info.results.insurance_end_time).format(`<span>${date}</span>`, `<span>${time}</span>`)).show();
                
            } else {
                $('.vin_menu #result .insurance-end-time').html().show();
                
            }
        }

        $('.vin_menu #find').hide();
        $('.vin_menu #loading').hide();
        $('.vin_menu #result').show();
    },
}

const HealthInsurance = {
    Open: () => {
        currentMenu = 'health_insurances_menu';

        $('.health_insurances_menu #find input').val('');

        $('.health_insurances_menu #find').show();
        $('.health_insurances_menu #loading').hide();
        $('.health_insurances_menu #result').hide();

        $('.health_insurances_menu').css('display', 'flex');
        $('.health_insurances_menu > div').fadeIn(120);
    },
    Update: (data) => {
        if (!data) {
            HealthInsurance.Open()
            return
        };
        $('.health_insurances_menu #result .owner-name').hide();
        
        $('.health_insurances_menu #result .title').html((translation.health_insurances.results.title).format(`<span>${data.ssn}</span>`));
        
        if (data.firstName && data.lastName) $('.health_insurances_menu #result .owner-name').html((translation.health_insurances.results.owner_name).format(`<span>${data.firstName} ${data.lastName}</span>`)).show();

        if (data.insurance) {
            let { date, time } = formatDate(data.insurance)
            $('.health_insurances_menu #result .insurance').html((translation.health_insurances.results.insuranced_to).format(`<span>${date}</span>`, `<span>${time}</span>`)).show();
        } else {
            $('.health_insurances_menu #result .insurance').html(translation.health_insurances.results.not_insured).show();
        }

        $('.health_insurances_menu #find').hide();
        $('.health_insurances_menu #loading').hide();
        $('.health_insurances_menu #result').show();
    }
}