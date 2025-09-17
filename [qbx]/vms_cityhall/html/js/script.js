let translation = {};

var number = Intl.NumberFormat('en-US', {minimumFractionDigits: 0});
String.prototype.format = function() {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        var regexp = new RegExp('\\{'+i+'\\}', 'gi');
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
};

function isNumberKey(evt) {
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (
        charCode == 8 ||
        charCode == 46 ||
        charCode == 37 ||
        charCode == 39
    ) return true;
    
    if (
        charCode < 48 ||
        charCode > 57
    ) {
        evt.preventDefault();
        return false;
    }
    return true;
}

let playerName = null;

// UI Variables:
let canSelectNewVehicle = true;
let canPressAgain = true;
let currentMenu = null;
let currentSubMenu = null;
let cityHallMenu = null;
let selectedOption = null;

let usePaychecks = true;

// Clerk Menu:
let useClerkBuildInBalance = true;
let removeClerkBalanceFromMenu = false;
let balanceAlreadyRemoved = false

let jobsList = null;
let billsList = null;
let documentsList = null;
let licensesNames = [];

// Documents:
let photosList = [];
let useVMSDocumentsV2 = false;
let isSelectingPhoto = false;

let cityHallData = {};
let myJobName = null;

let allowedResumes = [];

let healthInsurancesPricePerDay = null;
let vehiclesInsurancesPercentageFromPrice = null;
let useVIN = true;

let changePlateAfterRerergistration = null;
let reregistrationPlateModes = null;
let changePlatesModes = null;

let allowedTicketTypes = {};
let ticketType = null;
let ticketSettings = [];

let selectedDaysHealth = 0;
let selectedDaysVehicles = 0;

let canDoSignature = true;

let canSwitchRent = true;

let menuRestrictions = [];

let taxes = [];

let myVehicles = [];
let myFines = [];
let myTaxes = [];

let myResumeSkills = [];
let myResumeInterests = [];

let billingPayments = [];

let taxPaymentMaxDays = null;
let taxOverduePaymentPercent = null;

let currentFine = null;

let unfocusedBill = null;

// Agreement Variables:
let agreementPaymentMethods = [];
let selectedVehicleType = null;
let currentDate = null;

$(document).on('keydown', 'body', function(e) {
    if (e.which == 27) {
        if (unfocusedBill) {
            $.post(`https://${GetParentResourceName()}/forceCloseFine`, JSON.stringify({menu: currentMenu}));
            return;
        }
        
        if (currentFine) {
            currentFine = null;
            if (currentMenu == "billings") {
                $('.billings_menu').css('display', 'flex');
                $('.billings_menu > div').fadeIn(120);
            } else {
                $('.cityhall-menu div[data-type="fines"] > div > div.fines-list > div').html(CityHallMenu.LoadFines(myFines));
                $(`div[data-type="${cityHallMenu}"]`).show();
                $('.cityhall-menu').css('display', 'flex');
                $('.cityhall-menu > div').fadeIn(120);
            }
            $('#ticket, #receipt, .invoice').fadeOut(120);
            return;
        }

        if (isSelectingPhoto) {
            isSelectingPhoto = false;
            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').removeAttr('style');
            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').removeAttr('style');
            
            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
                'opacity': '1.0',
                'filter': 'blur(0px)'
            });

            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
                'opacity': '1.0',
                'filter': 'blur(0px)'
            });

            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').hide();
            $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').fadeIn(120);
            return;
        }

        if (currentMenu == "cityhall_document_plate") {
            $('.cityhall-menu > div > .menu > .change-plate-vehicle').hide()
            $('.cityhall-menu > div > .menu > .change-plate-vehicle > div').hide()
        
            $('.cityhall-menu > div > .menu > .select-vehicle').hide()
            $('.cityhall-menu > div > .menu > .select-vehicle > div').hide()
            currentMenu = 'cityhall';
            return;
        }
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({menu: currentMenu}));
    }
})

window.addEventListener("load", function() {
    $.post(`https://${GetParentResourceName()}/loaded`)
})

window.addEventListener('message', function(event) {
    var item = event.data;
    switch (item.action) {
		case 'loaded':
            let lang = item.lang;

            usePaychecks = item.usePaychecks;

            documentsList = item.documents;
            
            useVMSDocumentsV2 = item.useVMSDocumentsV2;
            billingPayments = item.billingPayments;
            useTaxes = item.useTaxes;
            // useVIN = item.useVIN;

            taxPaymentMaxDays = item.taxPaymentMaxDays;
            taxOverduePaymentPercent = item.taxOverduePaymentPercent;
            healthInsurancesPricePerDay = item.healthInsurancesPricePerDay;
            vehiclesInsurancesPercentageFromPrice = item.vehiclesInsurancesPercentageFromPrice;

            changePlateAfterRerergistration = item.changePlateAfterRerergistration;
            reregistrationPlateModes = item.reregistrationPlateModes;
            changePlatesModes = item.changePlatesModes;

            agreementPaymentMethods = item.agreementPaymentMethods;

            useClerkBuildInBalance = item.useBuildInBalance;
            removeClerkBalanceFromMenu = item.removeBalanceFromMenu;

            $.ajax({
                url: '../config/translation.json',
                type: 'GET',
                dataType: 'json',
                success: function (code, statut) {
                    if (!code[lang]) {
                        translation = code["EN"];
                        console.warn(`^7Selected language ^1"${lang}"^7 not found, changed to ^2"EN"^7, configure your language in translation.json.`);
                    } else {
                        translation = code[lang];
                    }
                    
                    loadTranslation();

                    if (item.healthInsurancesDays) CityHallMenu.LoadInsuranceDays(item.healthInsurancesDays);
                    if (item.vehiclesInsurancesDays) CityHallMenu.LoadInsuranceVehiclesDays(item.vehiclesInsurancesDays);

                    $(`.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] > .parking-spaces > table > thead > tr`).html(`
                        <th class="table-first" onclick="sortTable(1)" style="padding-block: 0.3em;">
                            <span id="model"></span>${translation.cityhall.insurances.vehicles.table_model} <span id="icon1" class="sort-icon"></span>
                        </th>
                        <th onclick="sortTable(2)">
                            <span id="plate"></span>${translation.cityhall.insurances.vehicles.table_plate} <span id="icon2" class="sort-icon"></span>
                        </th>
                        ${useVIN ? `
                            <th onclick="sortTable(3)">
                                <span id="start_vin"></span>${translation.cityhall.insurances.vehicles.table_vin} <span id="icon3" class="sort-icon"></span>
                            </th>
                            <th onclick="sortTable(4)">
                                <span id="start_insurance"></span>${translation.cityhall.insurances.vehicles.table_start_insurance} <span id="icon4" class="sort-icon"></span>
                            </th>
                            <th onclick="sortTable(5)">
                                <span id="end_insurance"></span>${translation.cityhall.insurances.vehicles.table_end_insurance} <span id="icon5" class="sort-icon"></span>
                            </th>
                            <th onclick="sortTable(6)">
                                <span id="insurance_price"></span>${translation.cityhall.insurances.vehicles.table_insurance_price} <span id="icon6" class="sort-icon"></span>
                            </th>
                        ` : `
                            <th onclick="sortTable(3)">
                                <span id="start_insurance"></span>${translation.cityhall.insurances.vehicles.table_start_insurance} <span id="icon3" class="sort-icon"></span>
                            </th>
                            <th onclick="sortTable(4)">
                                <span id="end_insurance"></span>${translation.cityhall.insurances.vehicles.table_end_insurance} <span id="icon4" class="sort-icon"></span>
                            </th>
                            <th onclick="sortTable(5)">
                                <span id="insurance_price"></span>${translation.cityhall.insurances.vehicles.table_insurance_price} <span id="icon5" class="sort-icon"></span>
                            </th>
                        `}
                        <th class="table-last" style="text-align: center;">
                            <span id="pay">${translation.cityhall.insurances.vehicles.table_pay}</span>
                        </th>
                    `);
                }
            });

            if (useVMSDocumentsV2) $('.cityhall-menu div[data-type="licenses"]').addClass('vms_documentsv2');

            if (!useTaxes) {
                $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="taxes-list"]').hide();

                $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"]').css({
                    "height": "100%"
                });
            }

            if (!usePaychecks) {
                $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"]').hide();
                
                $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="taxes-list"]').css({
                    "height": "100%",
                    "margin-top": "0"
                });
                
                $('.cityhall-menu div[data-type="main"] > div > .side-boxes > .box[data-type="taxes-list"] .list').css({
                    "height": "36em",
                });
            }

            if (!useTaxes && !usePaychecks) {
                $('.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"]').css({
                    "width": "100%"
                });

            }

            break

        case 'openPapersMenu':
            PapersMenu.LoadAvailable(item.papers)
            currentMenu = 'papers';
            $('.papers-menu').css('display', 'flex');
            $('.papers-menu > div').fadeIn(120);
            break
        case 'closePapersMenu':
            $(`.papers-menu, .papers-menu > div`).fadeOut(120);
            cityHallMenu = null;
            currentMenu = null;
            break

        case 'openCityHallMenu':
            currentFine = null;
            
            cityHallData = item.cityHallData;
            myJobName = item.jobName;
            jobsList = item.jobs;
    
            menuRestrictions = item.restrictions;
            
            if (item.vehicles) {
                myVehicles = item.vehicles;
            }
    
            // Main Menu - loader:
            if (menuRestrictions['main']) {
                CityHallMenu.LoadMainPage(item.characterData, cityHallData.paychecks)
    
                if (useTaxes && item.taxes) {
                    CityHallMenu.LoadTaxesList(item.taxes)
                }
    
            }
    
            // Jobs - loader:
            if (menuRestrictions['jobs']) {
                allowedResumes = item.allowedResumes
                $('.cityhall-menu div[data-type="jobs"] > div > div[class="jobs-list"] > div').html(CityHallMenu.LoadJobCenter(jobsList, allowedResumes))
            }
    
            // Licenses - loader:
            if (menuRestrictions['licenses']) {
                $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] div[class="licenses-list"] > div').html(CityHallMenu.LoadLicenses(documentsList, cityHallData.documents));
                if (useVMSDocumentsV2 && item.ownedDocuments) {
                    if (item.ownedDocuments.photos) {
                        photosList = item.ownedDocuments.photos;
                        CityHallMenu.LoadOwnedDocumentPhotos(photosList);
                    }
                    if (item.ownedDocuments.documents) {
                        ownedDocumentsList = item.ownedDocuments.documents;
                        CityHallMenu.LoadOwnedDocuments(ownedDocumentsList);
                    }
                }
            }
            
            // Insurances:
            if (menuRestrictions['insurance']) {
                // Health Insurance - loader:
                $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="my-insurance"] > .your-insurance').html(CityHallMenu.LoadInsurance(cityHallData.healthInsurance));
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="my-insurance"] .days > div`).removeClass('active');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="my-insurance"] .purchase`).html(translation.cityhall.insurances.health.select_time_btn);
                selectedDaysHealth = 0;
        
                // Vehicles Insurance - loader:
                selectedDaysVehicles = $('.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div').first().data('days');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div`).removeClass('active');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div[data-days="${selectedDaysVehicles}"]`).addClass('active');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .select-time > .name`).html(translation.cityhall.insurances.vehicles.select_time);
                $(`.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] > .parking-spaces > table > tbody`).html(CityHallMenu.LoadInsuranceVehicles(myVehicles));
            }
    
            if (menuRestrictions['fines']) {
                if (item.myFines) {
                    myFines = item.myFines;
                }
                $('.cityhall-menu div[data-type="fines"] > div > div.fines-list > div').html(CityHallMenu.LoadFines(myFines))
            }

            if (menuRestrictions['taxes']) {
                if (item.myTaxes) {
                    myTaxes = item.myTaxes;
                }
                $('.cityhall-menu div[data-type="taxes"] > div > div.taxes-list > div').html(CityHallMenu.LoadTaxes(myTaxes))
            }

            currentMenu = 'cityhall';
            CityHallMenu.AdjustRestrictions();
            $('.cityhall-menu').css('display', 'flex');
            $('.cityhall-menu > div').fadeIn(120);
            break
        case 'closeCityHallMenu':
            $(`
                .cityhall-menu,
                .cityhall-menu > div,
                .cityhall-menu > div > .menu > .main > div,
                .cityhall-menu > div > .menu > .select-vehicle,
                .cityhall-menu > div > .menu > .select-vehicle > div,
                .cityhall-menu > div > .menu > .change-plate-vehicle,
                .cityhall-menu > div > .menu > .change-plate-vehicle > div
            `).fadeOut(120)
            
            cityHallMenu = null;
            currentMenu = null;
            break
        case 'updateCityHallMenu':
            if (currentMenu && cityHallMenu) {
                if (item.type == "paidFine") {
                    myFines = item.myFines;
                    $('.cityhall-menu div[data-type="fines"] > div > div.fines-list > div').html(CityHallMenu.LoadFines(myFines))
                    currentFine = null;
                    $('.cityhall-menu div[data-type="fines"] > div > div.fines-list > div').html(CityHallMenu.LoadFines(myFines));
                    $(`div[data-type="${cityHallMenu}"]`).show();
                    $('.cityhall-menu').css('display', 'flex');
                    $('.cityhall-menu > div').fadeIn(120);
                    $('#receipt').fadeOut(120);
                    $('#ticket').fadeOut(120);
                    $('.invoice').fadeOut(120);
                    return;
                }
                if (item.type == "paidTax") {
                    myTaxes = item.myTaxes;
                    $('.cityhall-menu div[data-type="taxes"] > div > div.taxes-list > div').html(CityHallMenu.LoadTaxes(myTaxes))
                    return
                }


                if (item.cityHallData) cityHallData = item.cityHallData;
    
                // Main Menu - loader:
                if (menuRestrictions['main']) {
                    if (!item.type || item.type == 'paychecks') CityHallMenu.LoadMainPage(null, cityHallData.paychecks);
                }
    
                // Jobs - loader:
                if (menuRestrictions['jobs']) {
                    if (!item.type || item.type == 'jobs') {
                        if (item.allowedResumes) {
                            allowedResumes = item.allowedResumes
                        }
                        myJobName = item.jobName;
                        $('.cityhall-menu div[data-type="jobs"] > div > div[class="jobs-list"] > div').html(CityHallMenu.LoadJobCenter(jobsList, allowedResumes));
                    }
                }
                
                // Licenses - loader:
                if (menuRestrictions['licenses']) {
                    if (!item.type || item.type == 'documents') {
                        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] div[class="licenses-list"] > div').html(CityHallMenu.LoadLicenses(documentsList, cityHallData.documents));
                        if (useVMSDocumentsV2 && item.ownedDocuments) {
                            if (item.ownedDocuments.photos) {
                                photosList = item.ownedDocuments.photos;
                                CityHallMenu.LoadOwnedDocumentPhotos(photosList);
                            }
                            if (item.ownedDocuments.documents) {
                                ownedDocumentsList = item.ownedDocuments.documents;
                                CityHallMenu.LoadOwnedDocuments(ownedDocumentsList);
                            }
                        }
                    }
                }
                
                if (menuRestrictions['insurance']) {
                    // Health Insurance - loader:
                    if (!item.type || item.type == 'healthInsurance') $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="my-insurance"] > .your-insurance').html(CityHallMenu.LoadInsurance(cityHallData.healthInsurance));

                    // Vehicle Insurance - updater:
                    if (item.vehicleInsured && item.type && item.type == 'insuranceVehicle') {
                        $(`.cityhall-menu div[data-type="insurance"] > div > .side-boxes > .box[data-type="vehicles-list"] > .parking-spaces > table > tbody > tr[data-plate="${item.vehicleInsured.plate}"] > td#start_time`).html(`${formatDate(item.vehicleInsured.insuranceData.startTime).date} ${formatDate(item.vehicleInsured.insuranceData.startTime).time}`)
                        $(`.cityhall-menu div[data-type="insurance"] > div > .side-boxes > .box[data-type="vehicles-list"] > .parking-spaces > table > tbody > tr[data-plate="${item.vehicleInsured.plate}"] > td#end_time`).html(`${formatDate(item.vehicleInsured.insuranceData.endTime).date} ${formatDate(item.vehicleInsured.insuranceData.endTime).time}`)
                    }
                }
            }
            break

        case 'openClerkMenu':
            ClerkMenu.Open(item);
            break
        case 'closeClerkMenu':
            ClerkMenu.Close();
            break
        case 'updateClerkMenu':
            ClerkMenu.Update(item);
            break

        // case 'openCertificateNoCriminal':
        //     currentMenu = 'certificate_no_criminal';
        //     Documents.CertificateNoCriminal(item.data);
        //     break
        // case 'closeCertificateNoCriminal':
        //     currentMenu = null;
        //     $('.certificate_no_criminal').fadeOut(120);
        //     break

        case 'openAgreement':
            if (item.type == 'signed') {
                Documents.SignedSaleAgreement(item.data);
            } else {
                Documents.SaleAgreement(item);
            }
            break
        case 'closeAgreement':
            $('.agreement').fadeOut(120);
            currentMenu = null;
            break

        case 'openEmptyInvoice':
            ticketSettings = [];
            playerName = item.playerName;
            canDoSignature = true;
            Documents.Invoice(null, null, item.data2);
            break
        case 'openInvoice':
            Documents.Invoice(item.fineId, item.data);
            break
        case 'closeInvoice':
            $('.invoice').fadeOut(120);
            $('.invoice .required').removeClass('required');
            currentMenu = null;
            // $(".invoice #receiver > select").select2("close");
            // $(".invoice #due-date > select").select2("close");
            break

        case 'openEmptyTicket':
            ticketSettings = [];
            playerName = item.playerName;
            allowedTicketTypes = item.types;
            canDoSignature = true;
            Documents.Ticket(null, allowedTicketTypes, item.forceType, null, item.data2, null, item.inputsData);
            $('.vin_menu').fadeOut(120);
            break
        case 'openTicket':
            Documents.Ticket(item.fineId, null, item.data.type, item.data);
            break
        case 'closeTicket':
            $('#ticket').fadeOut(120);
            if ($(".ticket #receiver > select").data('select2-id') != undefined) $(".ticket #receiver > select").select2("close");
            if ($(".ticket #due-date > select").data('select2-id') != undefined) $(".ticket #due-date > select").select2("close");
            $('.ticket .required').removeClass('required');
            currentMenu = null;
            break

        case 'openEmptyReceipt':
            ticketSettings = [];
            playerName = item.playerName;
            allowedTicketTypes = item.types;
            canDoSignature = true;
            Documents.Receipt(null, null, item.data2);
            break;
        case 'openReceipt':
            Documents.Receipt(item.fineId, item.data);
            break;
        case 'closeReceipt':
            $('#receipt').fadeOut(120);
            if ($(".receipt .give select").data('select2-id') != undefined) $(".receipt .give select").select2("close");
            $('.receipt .required').removeClass('required');
            currentMenu = null;
            break;

        case 'openResume':
            currentMenu = 'resume';
            if (item.data) {
                Documents.Resume(item.data)
            } else {
                Documents.EmptyResume(item.toJob, item.playerName, item.phoneNumber, item.photo)
            }
            break
        case 'closeResume':
            if (item.wasEmpty) {
                currentMenu = 'cityhall';
                $('.cityhall-menu div[data-type="jobs"] > div > div[class="jobs-list"] > div').html(CityHallMenu.LoadJobCenter(jobsList, allowedResumes));
                $(`div[data-type="${cityHallMenu}"]`).show();
                $('.cityhall-menu').css('display', 'flex');
                $('.cityhall-menu > div').fadeIn(120);
            } else {
                currentMenu = null;
            }
            $('#resume').fadeOut(120);
            break

        case 'reregisteredVehicle':
            currentMenu = 'cityhall';

            $('.cityhall-menu > div > .menu > .change-plate-vehicle').hide()
            $('.cityhall-menu > div > .menu > .change-plate-vehicle > div').hide()

            $('.cityhall-menu > div > .menu > .select-vehicle').hide()
            $('.cityhall-menu > div > .menu > .select-vehicle > div').hide()
            
            myVehicles = item.vehicles;

            // Insurances:
            if (menuRestrictions['insurance']) {
                // Vehicles Insurance - loader:
                selectedDaysVehicles = $('.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div').first().data('days');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div`).removeClass('active');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div[data-days="${selectedDaysVehicles}"]`).addClass('active');
                $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .select-time > .name`).html(translation.cityhall.insurances.vehicles.select_time);
                $(`.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] > .parking-spaces > table > tbody`).html(CityHallMenu.LoadInsuranceVehicles(myVehicles));
            }
            break

        case 'openInfoVIN':
            MenuVIN.Open();
            break
        case 'closeInfoVIN':
            $('.vin_menu').fadeOut(120);
            currentMenu = null;
            break
        case 'updateInfoVIN':
            MenuVIN.Update(item);
            break
            
        case 'openHealthInsurance':
            HealthInsurance.Open();
            break
        case 'closeHealthInsurance':
            $('.health_insurances_menu').fadeOut(120);
            currentMenu = null;
            break
        case 'updateHealthInsurance':
            HealthInsurance.Update(item);
            break

        case 'openBillingsMenu':
            BillingsMenu.Open(item.jobLabel, item.billsList)
            break
        case 'closeBillingsMenu':
            BillingsMenu.Close()
            break
        case 'updateBillingsMenu':
            if (currentMenu == "billings" && item.id) {
                BillingsMenu.list[String(item.id)].canceled = 1;
                BillingsMenu.listArray = Object.values(BillingsMenu.list);
                BillingsMenu.renderPage(BillingsMenu.currentPage);
                BillingsMenu.updatePagination();
                currentFine = null;
                $('.billings_menu').css('display', 'flex');
                $('.billings_menu > div').fadeIn(120);
                $('#ticket').fadeOut(120);
                $('.invoice').fadeOut(120);
            }
            break

        case 'billingCallback':
            if (item.type == "unfocus") {
                unfocusedBill = true;
                $('.ticket, .invoice, .agreement, .receipt').css({'pointer-events': 'none', 'opacity': '.7'});

            } else if (item.type == "focus") {
                unfocusedBill = false;
                $('.ticket, .invoice, .agreement, .receipt').css({'pointer-events': 'all', 'opacity': '1.0'});
                
            } else if (item.type == "close") {
                unfocusedBill = false;
                $('.ticket, .invoice, .agreement, .receipt').css({'pointer-events': 'all', 'opacity': '1.0'});
                $('#ticket, .agreement, .invoice, #receipt').fadeOut(120);
                if ($('.receipt .give select').data('select2-id') != undefined) {
                    $(".receipt .give select").select2("close");
                }
                if ($('.ticket #receiver > select').data('select2-id') != undefined) {
                    $(".ticket #receiver > select").select2("close");
                }
                if ($('.ticket #due-date > select').data('select2-id') != undefined) {
                    $(".ticket #due-date > select").select2("close");
                }
                $('.ticket .required, .invoice .required').removeClass('required');
                currentMenu = null;

            }
            break

        case 'copyValue':
            const el = document.createElement('textarea');
            el.value = item.value;
            el.setAttribute('readonly', '');
            el.style.position = 'absolute';
            el.style.left = '-9999px';
            document.body.appendChild(el);
            el.select();
            document.execCommand('copy');
            document.body.removeChild(el);
            if (!item.disableNotify) {
                $.post(`https://${GetParentResourceName()}/copiedNotify`, JSON.stringify({value: item.value}));
            }
            break
    }
});

$(".close").click(() => {
    if (currentFine && (currentMenu == "billings" || currentMenu == "cityhall")) {
        currentFine = null;
        if (currentMenu == "billings") {
            $('.billings_menu').css('display', 'flex');
            $('.billings_menu > div').fadeIn(120);
        } else {
            $('.cityhall-menu div[data-type="fines"] > div > div.fines-list > div').html(CityHallMenu.LoadFines(myFines));
            $(`div[data-type="${cityHallMenu}"]`).show();
            $('.cityhall-menu').css('display', 'flex');
            $('.cityhall-menu > div').fadeIn(120);
        }
        $('#ticket').fadeOut(120);
        $('.invoice').fadeOut(120);
        return;
    }
    
    $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({menu: currentMenu}));
    currentMenu = null;
    currentSubMenu = null;
})

$(".cityhall-menu .back-to-cityhall").click(() => {
    $('.cityhall-menu > div > .menu > .change-plate-vehicle').hide()
    $('.cityhall-menu > div > .menu > .change-plate-vehicle > div').hide()

    $('.cityhall-menu > div > .menu > .select-vehicle').hide()
    $('.cityhall-menu > div > .menu > .select-vehicle > div').hide()
    
    currentMenu = 'cityhall';
})

$(".cityhall-menu .side-bar .button").click(function() {
    let newMenu = $(this).data('href');
    updateCityHall(newMenu, this);
})

function updateCityHall(newMenu, _this) {
    if (newMenu == cityHallMenu) return;

    if (newMenu != "employees") {
        $('.clerk-menu .main div[data-type="employees"] .box-right .data').empty();
    }

    if (_this != selectedOption) {
        if (selectedOption) {
            $(selectedOption).removeClass("selected");
        }
        selectedOption = _this
        $(selectedOption).addClass("selected");
    }
    
    $(`div[data-type="${cityHallMenu}"]`).hide();
    cityHallMenu = newMenu
    $(`div[data-type="${cityHallMenu}"]`).show();

    if (isSelectingPhoto) {
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
            'opacity': '1.0',
            'filter': 'blur(0px)'
        });
    
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
            'opacity': '1.0',
            'filter': 'blur(0px)'
        });
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').hide();
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').fadeIn(120);
        isSelectingPhoto = false;
    }
}

// Streamer Mode:
function toggleStreamerMode() {
    let firstNameElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .title > span#firstName`;
    let lastNameElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .title > span#lastName`;
    let dateOfBirthElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data > div#dateOfBirth > span#val`;
    let ssnElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data > div#ssn > span#val`;
    let nationalityElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="about-you"] .data > div#nationality > span#val`;
    let paychecksElement = `.cityhall-menu div[data-type="main"]>div>.side-boxes>.box[data-type="paychecks"] .title > span`;

    let documentsSerialsElements = `.cityhall-menu div[data-type="owned-documents"] > .documents-list #serial-number > span`;

    if (localStorage.getItem("streamer-mode") == 1) {
        $(firstNameElement).html(function(_, html) {
            return html.replace(/\w+/g, function(word) {
                return '*'.repeat(word.length);
            });
        });
        $(lastNameElement).html(function(_, html) {
            return html.replace(/\w+/g, function(word) {
                return '*'.repeat(word.length);
            });
        });
        $(dateOfBirthElement).html(function(_, html) {
            return html.replace(/\w+/g, function(word) {
                return '*'.repeat(word.length);
            });
        });
        $(ssnElement).html(function(_, html) {
            return html.replace(/\w+/g, function(word) {
                return '*'.repeat(word.length);
            });
        });
        if (nationalityElement) {
            $(nationalityElement).html('*************');
        }
        $(paychecksElement).html(function(_, html) {
            return html.replace(/\w+/g, function(word) {
                return '*'.repeat(word.length);
            });
        });

        $(documentsSerialsElements).html('****');
    } else {
        $(firstNameElement).text($(firstNameElement).data('value'));
        $(lastNameElement).text($(lastNameElement).data('value'));
        $(dateOfBirthElement).text($(dateOfBirthElement).data('value'));
        $(ssnElement).text($(ssnElement).data('value'));
        if (nationalityElement) {
            $(nationalityElement).text($(nationalityElement).data('value'));
        }
        $(paychecksElement).text(number.format($(paychecksElement).data('value')));
        $(documentsSerialsElements).text($(documentsSerialsElements).data('value'));
    }
}

$('.cityhall-menu #streamer-mode').click(function(){
    if (localStorage.getItem("streamer-mode") != undefined) {
        if (localStorage.getItem("streamer-mode") == 0) {
            localStorage.setItem(`streamer-mode`, 1);
        } else {
            localStorage.setItem(`streamer-mode`, 0);
        }
    } else {
        localStorage.setItem(`streamer-mode`, 1);
    }
    toggleStreamerMode()
});


// Jobs:
function writeResume(jobName) {
    if (!canPressAgain) return;
    canPressAgain = false;
    
    $.post(`https://${GetParentResourceName()}/writeResume`, JSON.stringify({jobName: jobName}));
    
    setTimeout(() => {
        canPressAgain = true;
    }, 2000);
}

function joinJob(name) {
    if (!canPressAgain) return;
    canPressAgain = false;

    $.post(`https://${GetParentResourceName()}/joinJob`, JSON.stringify({name: name}));

    setTimeout(() => {
        canPressAgain = true;
    }, 2000);
}


// Documents:
function pickupDocument(name) {
    if (isSelectingPhoto) return;
    if (!canPressAgain) return;
    canPressAgain = false;

    $.post(`https://${GetParentResourceName()}/pickupDocument`, JSON.stringify({name: name}));

    setTimeout(() => {
        canPressAgain = true;
    }, 2000);
}

function orderDocument(name) {
    if (isSelectingPhoto) return;
    if (!canPressAgain) return;
    canPressAgain = false;
    
    if (useVMSDocumentsV2 && (name != 'certificate_no_criminal' && name != 'reregistration_vehicle' && name != 'change_plate')) {
        isSelectingPhoto = name;
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
            'opacity': '0.1',
            'filter': 'blur(2px)'
        });

        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
            'opacity': '0.1',
            'filter': 'blur(2px)'
        });

        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').fadeIn(120);
        $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').hide();

    } else if (name == 'reregistration_vehicle' || name == 'change_plate') {
        currentMenu = 'cityhall_document_plate'
        $(`.cityhall-menu > div > .menu > .select-vehicle > div > .menu > table > tbody`).html(CityHallMenu.LoadSelectVehicleMenu(name, myVehicles));

        $('.cityhall-menu > div > .menu > .select-vehicle').css('display', 'flex');
        $('.cityhall-menu > div > .menu > .select-vehicle > div').fadeIn(120);
    } else {
        $.post(`https://${GetParentResourceName()}/orderDocument`, JSON.stringify({name: name}));
    }

    setTimeout(() => {
        canPressAgain = true;
    }, 2000);
}

function removePhoto(id) {
    if (isSelectingPhoto) return;
    $.post(`https://${GetParentResourceName()}/removePhoto`, JSON.stringify({id: id}));
}

function selectDocumentPhoto(id) {
    if (!isSelectingPhoto) return;
    $.post(`https://${GetParentResourceName()}/orderDocument`, JSON.stringify({name: isSelectingPhoto, photoId: id}));
    isSelectingPhoto = false;
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').removeAttr('style');
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').removeAttr('style');
    
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
        'opacity': '1.0',
        'filter': 'blur(0px)'
    });

    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
        'opacity': '1.0',
        'filter': 'blur(0px)'
    });
    
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').hide();
    $('.cityhall-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').fadeIn(120);
}

function invalidateDocument(serialNumber) {
    if (isSelectingPhoto) return;
    $.post(`https://${GetParentResourceName()}/invalidateDocument`, JSON.stringify({serialNumber: serialNumber}));
}

function selectVehicle(name, vin) {
    $('.cityhall-menu > div > .menu > .select-vehicle').hide()
    $('.cityhall-menu > div > .menu > .select-vehicle > div').hide()

    if (name == 'reregistration_vehicle') {
        if (changePlateAfterRerergistration && (reregistrationPlateModes['current']?.allow || reregistrationPlateModes['random']?.allow || reregistrationPlateModes['custom']?.allow)) {
            $('.cityhall-menu > div > .menu > .change-plate-vehicle > div > .menu').html(CityHallMenu.LoadChangePlateMenu(vin, name, reregistrationPlateModes['current'], reregistrationPlateModes['random'], reregistrationPlateModes['custom']))

            $('.cityhall-menu > div > .menu > .change-plate-vehicle').css('display', 'flex');
            $('.cityhall-menu > div > .menu > .change-plate-vehicle > div').show()
        } else {
            $.post(`https://${GetParentResourceName()}/reregistrationVehicle`, JSON.stringify({name: name, vin: vin}));
        }
    } else if (name == 'change_plate') {
        if (changePlatesModes && (changePlatesModes['current']?.allow || changePlatesModes['random']?.allow || changePlatesModes['custom']?.allow)) {
            $('.cityhall-menu > div > .menu > .change-plate-vehicle > div > .menu').html(CityHallMenu.LoadChangePlateMenu(vin, name, changePlatesModes['current'], changePlatesModes['random'], changePlatesModes['custom']))

            $('.cityhall-menu > div > .menu > .change-plate-vehicle').css('display', 'flex');
            $('.cityhall-menu > div > .menu > .change-plate-vehicle > div').show()
        }
    }
}


// Paycheck:
function withdrawPaycheck() {
    let amount = $('.cityhall-menu div[data-type="main"] div[data-type="paychecks"] input[data-input="withdraw-paycheck"]').val();
    $.post(`https://${GetParentResourceName()}/withdrawPaycheck`, JSON.stringify({amount: amount}));
    $('.cityhall-menu div[data-type="main"] div[data-type="paychecks"] input[data-input="withdraw-paycheck"]').val('')
}


// Insurances:
function selectInsuranceDays(type, days) {
    if (type == 'healthInsurance') {
        $(`.cityhall-menu div[data-type="insurance"] .box[data-type="my-insurance"] .days > div`).removeClass('active');
        $(`.cityhall-menu div[data-type="insurance"] .box[data-type="my-insurance"] .days > div[data-days="${days}"]`).addClass('active');
        $(`.cityhall-menu div[data-type="insurance"] .box[data-type="my-insurance"] .purchase`).html(`${(translation.cityhall.insurances.health.purchase_btn).format(translation.currency, Number(healthInsurancesPricePerDay) * Number(days))}`);
        
        selectedDaysHealth = days

    } else {
        $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div`).removeClass('active');
        $(`.cityhall-menu div[data-type="insurance"] .box[data-type="vehicles-list"] .days > div[data-days="${days}"]`).addClass('active');
        selectedDaysVehicles = days;

        $('.cityhall-menu div[data-type="insurance"]>div>.side-boxes>.box[data-type="vehicles-list"] > .parking-spaces > table > tbody td.price').each(function() {
            var price = $(this).data('price');
            $(this).text(`$${Math.floor((price * vehiclesInsurancesPercentageFromPrice) / 100) * selectedDaysVehicles}`);
        });
    }
}


// Health Insurance:
function purchaseHealthInsurance() {
    if (selectedDaysHealth == 0 || selectedDaysHealth == null) return;
    $.post(`https://${GetParentResourceName()}/purchaseHealthInsurance`, JSON.stringify({days: selectedDaysHealth}));
}


// Vehicle Insurance:
function purchaseVehicleInsurance(plate) {
    if (selectedDaysVehicles == 0 || selectedDaysVehicles == null) return;
    $.post(`https://${GetParentResourceName()}/purchaseVehicleInsurance`, JSON.stringify({days: selectedDaysVehicles, plate: plate}));
}


// Change plate:
function selectedPlate(name, type, vin) {
    let plate = null;
    if (type) plate = $('.cityhall-menu > div > .menu > .change-plate-vehicle input').val();
    
    $.post(`https://${GetParentResourceName()}/reregistrationVehicle`, JSON.stringify({name: name, type: type, vin: vin, plate: plate}));
}


// Papers Menu
function buyPaper(name) {
    $.post(`https://${GetParentResourceName()}/purchasePaper`, JSON.stringify({name: name}));
}


// Tickets:
$(document).on('click', '.cityhall-menu div[data-type="fines"] .fines-list .view', function(e) {
    let type = $(this).data('ticket-type');
    let id = $(this).data('id');
    if (myFines[id]) {
        currentFine = id
        
        $('.cityhall-menu > div').fadeOut(120);
        if (type == "invoice") {
            Documents.Invoice(id, myFines[id]);
        } else if (type == "receipt") {
            Documents.Receipt(id, myFines[id]);
        } else {
            Documents.Ticket(id, null, type, myFines[id]);
        }
    }
})

$('.ticket > div > .select-ticket-type > div').click(function(){
    let ticketType = $(this).data('tickettype')
    Documents.Ticket(null, allowedTicketTypes, ticketType);
})

$('.ticket > div > .select-payment > div').click(function(){
    let paymentMethod = $(this).data('payment-method');
    $.post(`https://${GetParentResourceName()}/payTheFine`, JSON.stringify({paymentMethod: paymentMethod, fineId: currentFine}));
})

$('.ticket > div > .confirm > div').click(function(){
    let type = $(this).data('type');
    $.post(`https://${GetParentResourceName()}/confirmFine`, JSON.stringify({confirmed: type}));
})

$('.ticket > div > .cancel > div').click(function(){
    if (!currentFine) return;
    $.post(`https://${GetParentResourceName()}/cancelFine`, JSON.stringify({id: currentFine}));
})

$('.ticket > div:not(.preview) > div[data-type="traffic"] > div #license-revocation > div').click(function(){
    if ($('.ticket > div').hasClass('preview')) return;
    
    let licenseSelected = $('.ticket>div>div[data-type="traffic"]>.row-7 > #license-type select').val();
    if (!licenseSelected) return;

    $(this).toggleClass('selected')
    if ($(this).hasClass('selected')) {
        $('.ticket>div>div[data-type="traffic"]>.row-7 > #license-suspension-time > span').css({'opacity': 1.0});
        $('.ticket>div>div[data-type="traffic"]>.row-7 > #license-suspension-time > select').prop("disabled", false);
    } else {
        $('.ticket>div>div[data-type="traffic"]>.row-7 > #license-suspension-time > span').css({'opacity': 0.4});
        $('.ticket>div>div[data-type="traffic"]>.row-7 > #license-suspension-time > select').prop("disabled", true);
    }
})

$('.ticket > div:not(.preview) > div[data-type="traffic"] > div #license-points > div').click(function(){
    if ($('.ticket > div').hasClass('preview')) return;

    let licenseSelected = $('.ticket>div>div[data-type="traffic"]>.row-7 > #license-type select').val();
    if (!licenseSelected) return;
    
    $(this).toggleClass('selected')
    if ($(this).hasClass('selected')) {
        $('.ticket>div>div[data-type="traffic"]>.row-8 > #license-points-count > input').prop("disabled", false).css({'opacity': 1.0});
    } else {
        $('.ticket>div>div[data-type="traffic"]>.row-8 > #license-points-count > input').prop("disabled", true).css({'opacity': 0.4}).val(null);
    }
})

$('.ticket #license-type').on('select2:select', function (e) {
    if ($('.ticket > div').hasClass('preview')) return;
    // var data = e.params.data;
});

$(document).on('click', '#ticket .ticket #submit', function(e) {
    if (!canDoSignature) return;
    
    canDoSignature = false;
    let signature = playerName
    const signatureElement = document.getElementById('ticket-officer-signature');
    signatureElement.textContent = ''
    $('.ticket .required').removeClass('required');

    let currentLetterIndex = 0;
    
    let receiver = $('.ticket #receiver > select').select2('data')[0];;
    if (!receiver.id || receiver.id == 0) setTimeout(() => $('.ticket #receiver > span').addClass('required'), 10);

    let amount = $('.ticket #fine-amount > input').val();
    if (!amount) setTimeout(() => $('.ticket #fine-amount > input').addClass('required'), 10);
    
    let date_to_pay = $('.ticket #due-date > select').select2('data')[0];
    if (!date_to_pay || !date_to_pay.id || date_to_pay.id == 0) setTimeout(() => $('.ticket #due-date > span').addClass('required'), 10);

    let location_of_violation = $('.ticket #location-of-violation > input').val();
    if (!location_of_violation) setTimeout(() => $('.ticket #location-of-violation > input').addClass('required'), 10);
    
    let violation = $('.ticket #violation > input').val();
    if (!violation) setTimeout(() => $('.ticket #violation > input').addClass('required'), 10);
    
    let comments = $('.ticket #comments > textarea').val();

    let license_plate = ticketType == 'traffic-ticket' ? $('.ticket #license-number > input').val() : null;
    if (ticketType == 'traffic-ticket' && !license_plate) setTimeout(() => $('.ticket #license-number > input').addClass('required'), 10);
    
    let vehicle_make = ticketType == 'traffic-ticket' ? $('.ticket #vehicle-make > input').val() : null;
    if (ticketType == 'traffic-ticket' && !vehicle_make) setTimeout(() => $('.ticket #vehicle-make > input').addClass('required'), 10);
    
    let vehicle_model = ticketType == 'traffic-ticket' ? $('.ticket #vehicle-model > input').val() : null;
    if (ticketType == 'traffic-ticket' && !vehicle_model) setTimeout(() => $('.ticket #vehicle-model > input').addClass('required'), 10);
    
    let vehicle_vin = ticketType == 'traffic-ticket' ? $('.ticket #vin > input').val() : null;
    if (useVIN && ticketType == 'traffic-ticket' && !vehicle_vin) setTimeout(() => $('.ticket #vin > input').addClass('required'), 10);    

    let license_type = ticketType == 'traffic-ticket' ? $('.ticket #license-type > select').select2('data')[0] : null;
    
    let license_revocation = license_type ? $('.ticket #license-revocation > div').hasClass('selected') : null;
    let license_suspension_time = license_type ? $('.ticket #license-suspension-time > select').select2('data')[0] : null;
    if (license_type && license_revocation && (!license_suspension_time || !license_suspension_time.id || license_suspension_time.id == 0)) setTimeout(() => $('.ticket #license-suspension-time > span').addClass('required'), 10);

    let penalty_points = license_type ? $('.ticket #license-points > div').hasClass('selected') : null;
    let penalty_points_count = license_type ? $('.ticket #license-points-count > input').val() : null;
    if (license_type && penalty_points && (!penalty_points_count || penalty_points_count == '' || !Number(penalty_points_count) || penalty_points_count <= 0)) setTimeout(() => $('.ticket #license-points-count > input').addClass('required'), 10);
    
    if (
        receiver?.id == 0 ||
        !amount ||
        date_to_pay?.id == 0 ||
        !location_of_violation ||
        !violation ||
        ticketType == 'traffic-ticket' && !license_plate ||
        ticketType == 'traffic-ticket' && !vehicle_make ||
        ticketType == 'traffic-ticket' && !vehicle_model ||
        useVIN && ticketType == 'traffic-ticket' && !vehicle_vin ||

        license_revocation && license_suspension_time && (!license_suspension_time.id || license_suspension_time.id == 0) || 
        penalty_points && !penalty_points_count
    ) {
        canDoSignature = true;
        return;
    }

    function stopLetter() {
        $.post(`https://${GetParentResourceName()}/issueTicket`, JSON.stringify({
            type: ticketType,

            receiver: receiver.id,
            amount: amount,
            date_to_pay: date_to_pay.id,
            location_of_violation: location_of_violation,
            violation: violation,
            comments: comments,
            
            license_plate: license_plate,
            vehicle_make: vehicle_make,
            vehicle_model: vehicle_model,
            vehicle_vin: vehicle_vin,

            license_type: license_type ? license_type.id : null,
            license_revocation: license_revocation,
            license_suspension_time: license_suspension_time ? license_suspension_time.id : null,

            penalty_points: penalty_points,
            penalty_points_count: penalty_points_count,
        }));

        setTimeout(() => {
            canDoSignature = true;
        }, 1000);
    }
    
    function addNextLetter() {
        signatureElement.textContent += signature[currentLetterIndex];
        currentLetterIndex++;
        if (currentLetterIndex < signature.length) {
            setTimeout(addNextLetter, 100);
        } else {
            stopLetter()
        }
    }

    addNextLetter();
})


// Taxes
$(document).on('click', '.cityhall-menu div[data-type="taxes"] .taxes-list .pay', function(e) {
    let id = $(this).data('id');
    let paymentMethod = $(this).data('payment-method');
    if (myTaxes[id]) {
        $.post(`https://${GetParentResourceName()}/payTax`, JSON.stringify({id: id, paymentMethod: paymentMethod}));
    }
})


// Resume
$(document).on('click', '#resume:not(.isPreview)>.resume>.left #skills>#data>div', function(e) {
    if (myResumeSkills.includes(this.textContent) && $(this).hasClass('active')) {
        myResumeSkills = myResumeSkills.filter(element => element !== this.textContent);
        $(this).removeClass('active');
    } else {
        myResumeSkills.push(this.textContent)
        $(this).addClass('active');
    }
})

$(document).on('click', '#resume:not(.isPreview)>.resume>.left #interests>#data>div', function(e) {
    if (myResumeInterests.includes(this.textContent) && $(this).hasClass('active')) {
        myResumeInterests = myResumeInterests.filter(element => element !== this.textContent);
        $(this).removeClass('active');
    } else {
        myResumeInterests.push(this.textContent)
        $(this).addClass('active');
    }
});

$(document).on('click', '#resume:not(.isPreview)>.resume>.right>.action-buttons>div#submit', function(e) {
    let phoneNumber = $('#resume>.resume>.right>.informations>#phone-number>input').val();
    let aboutMe = $('#resume>.resume>.right>#about-me>textarea').val();
    let workExperience = $('#resume>.resume>.right>#work-experience>textarea').val();
    $.post(`https://${GetParentResourceName()}/submitResume`, JSON.stringify({
        phoneNumber:phoneNumber,
        aboutMe:aboutMe,
        workExperience:workExperience,
        skills:myResumeSkills,
        interests:myResumeInterests,
    }));
})

$(document).on('click', '#resume.isPreview>.resume>.right>.action-buttons>div#agree', function(e) {
    $.post(`https://${GetParentResourceName()}/agreeResume`);
})

$(document).on('click', '#resume.isPreview>.resume>.right>.action-buttons>div#decline', function(e) {
    $.post(`https://${GetParentResourceName()}/declineResume`);
})


// Invoice
function addInvoiceElement(data) {
    if (!data && $('.invoice').hasClass('preview')) return;
    
    const tbody = document.getElementById('invoices-body');
    const maxRows = 12;
    const currentRows = tbody.getElementsByTagName('tr').length;

    if (currentRows < maxRows) {
        $('.invoice table tbody').append(`
            <tr>
                <td id="remove-option" ${data ? '' : `onclick="removeInvoiceElement(this)"`}>
                    <i class="fa-solid fa-minus"></i>
                </td>
                <td id="_qty">
                    <input type="number" class="center" oninput="updatedInvoiceData(this)" ${data ? `value="${data.qty}" disabled` : 'value="1"'}>
                </td>
                <td id="_description">
                    <input plateholder="${translation.invoice.table.new_element_placeholder}" ${data ? `value="${data.description}" disabled` : ''}>
                </td>
                <td id="_unit_price">
                    <input type="number" class="right" oninput="updatedInvoiceData(this)" ${data ? `value="${(data.unitPrice).toFixed(2)}" disabled` : 'value="0.00"'}>
                </td>
                <td id="amount">
                    <span>${data ? (data.qty * data.unitPrice).toFixed(2) : '0.00'}</span>
                </td>
            </tr>
        `)
    }
}

function removeInvoiceElement(element) {
    if ($('.invoice').hasClass('preview')) return;
    
    const tbody = document.getElementById('invoices-body');
    const currentRows = tbody.getElementsByTagName('tr').length;
    if (currentRows > 1) {
        const row = element.parentElement;
        row.remove();
        calculateSubTotalAndTotal();
    }
}

function calculateSubTotalAndTotal(tax) {
    const rows = document.querySelectorAll('#invoices-body tr');
    let subTotal = 0;

    rows.forEach(row => {
        const amountText = row.querySelector('#amount span').textContent;
        const amountValue = parseFloat(amountText);

        if (!isNaN(amountValue)) {
            subTotal += amountValue;
        }
    });

    const subTotalDiv = document.querySelector('#sub-total > div');
    subTotalDiv.textContent = subTotal.toFixed(2);

    const taxRate = (tax || ticketSettings.taxFromInvoice || 0) / 100;
    const salesTax = subTotal * taxRate;

    const salesTaxDiv = document.querySelector('#sales-tax > div');
    salesTaxDiv.textContent = salesTax.toFixed(2);

    const totalDiv = document.querySelector('#total > div');
    const total = subTotal + salesTax;
    totalDiv.textContent = translation.currency + total.toFixed(2);
}

function updatedInvoiceData(element) {
    if ($('.invoice').hasClass('preview')) return;
    
    const row = element.closest('tr');

    const quantity = parseFloat(row.querySelector('input.center').value);
    const unitPrice = parseFloat(row.querySelector('input.right').value);

    const totalAmount = (quantity * unitPrice).toFixed(2);
    
    const amountSpan = row.querySelector('#amount span');
    amountSpan.textContent = totalAmount;

    calculateSubTotalAndTotal();
}

$(document).on('click', '.invoice .signature div', function(e) {
    if (!canDoSignature) return;
    
    canDoSignature = false;
    let signature = playerName
    const signatureElement = document.getElementById('invoice-issuer-signature');
    signatureElement.textContent = ''
    $('.invoice .required').removeClass('required');

    let currentLetterIndex = 0;
    
    let receiver = $('.invoice #bill-to > select').select2('data')[0];
    if (!receiver.id || receiver.id == 0) setTimeout(() => $('.invoice #bill-to > span').addClass('required'), 10);

    let date_to_pay = $('.invoice > div > .card > .invoice-data > #payment-due > select').select2('data')[0];;
    if (!date_to_pay || !date_to_pay.id || date_to_pay.id == 0) setTimeout(() => $('.invoice > div > .card > .invoice-data > #payment-due > span.select2').addClass('required'), 10);

    let amount = document.querySelector('.invoice #sub-total > div').textContent;
    if (!amount || Math.floor(Number(amount)) == 0) setTimeout(() => $('.invoice #sub-total > div').addClass('required'), 10);

    let invoiceData = []
    const rows = document.querySelectorAll('#invoices-body tr');
    let needReturn = false;
    rows.forEach(row => {
        const qty = row.querySelector('#_qty input').value;
        const description = row.querySelector('#_description input').value;
        const unitPrice = row.querySelector('#_unit_price input').value;

        if (!qty || qty < 1) {
            setTimeout(() => row.querySelector('#_qty input').classList.add('required'), 10);
            needReturn = true;
        };
        if (!description) {
            setTimeout(() => row.querySelector('#_description input').classList.add('required'), 10);
            needReturn = true;
        };
        if (!unitPrice || unitPrice < 0.0) {
            setTimeout(() => row.querySelector('#_unit_price input').classList.add('required'), 10);
            needReturn = true;
        };

        invoiceData.push({
            qty: Number(qty),
            description: description,
            unitPrice: Number(unitPrice)
        })
    });

    if (
        receiver?.id == 0 ||
        date_to_pay?.id == 0 ||
        !amount || Math.floor(amount) == 0 ||
        needReturn
    ) {
        canDoSignature = true;
        return;
    }

    function stopLetter() {
        $.post(`https://${GetParentResourceName()}/issueInvoice`, JSON.stringify({
            type: ticketType,
            receiver: receiver.id,
            amount: amount,
            date_to_pay: date_to_pay.id,
            invoiceData: invoiceData,
        }));

        setTimeout(() => {
            $('.invoice .signature div').show();
            canDoSignature = true;
        }, 1000);
    }

    function addNextLetter() {
        signatureElement.textContent += signature[currentLetterIndex];
        currentLetterIndex++;
        if (currentLetterIndex < signature.length) {
            setTimeout(addNextLetter, 100);
        } else {
            stopLetter()
        }
    }

    $('.invoice .signature div').hide();
    addNextLetter();
})

$('.invoice .select-payment > div').click(function(){
    let paymentMethod = $(this).data('payment-method');
    $.post(`https://${GetParentResourceName()}/payTheInvoice`, JSON.stringify({paymentMethod: paymentMethod, fineId: currentFine}));
})

$('.invoice .confirm > div').click(function(){
    let type = $(this).data('type');
    $.post(`https://${GetParentResourceName()}/confirmInvoice`, JSON.stringify({confirmed: type}));
})

$('.invoice .cancel > div').click(function(){
    if (!currentFine) return;
    $.post(`https://${GetParentResourceName()}/cancelFine`, JSON.stringify({id: currentFine}));
})


// Receipt:
function addReceiptElement(data) {
    if (!data && $('.receipt').hasClass('preview')) return;
    
    const tbody = document.getElementById('receipt-body');
    const maxRows = 9;
    const currentRows = tbody.getElementsByTagName('tr').length;
    const newRowId = currentRows + 1;

    if (currentRows < maxRows) {
        $('.receipt table tbody').append(`
            <tr data-id="${newRowId}">
                ${!$('.receipt').hasClass('preview') && `<td class="remove-element"><div onclick='removeReceiptElement("${newRowId}")'>x</div></td>` || ''}
                <td id="quantity">
                    <input oninput="updatedReceiptData(this)" type="number" ${data ? `value="${data.qty}" disabled` : 'value="1"'}>
                </td>
                <td id="item">
                    <input plateholder="${translation.invoice.table.new_element_placeholder}" ${data ? `value="${data.item}" disabled` : ''}>
                </td>
                ${!$('.receipt').hasClass('preview') ? `
                    <td id="unit_price">
                        <input type="number" class="right" oninput="updatedReceiptData(this)" ${data ? `value="${(data.unitPrice).toFixed(2)}" disabled` : 'value="0.00"'}>
                    </td>
                ` : ''}
                <td id="amount">
                    <span>${data ? (data.qty * data.unitPrice).toFixed(2) : '0.00'}</span>
                </td>
            </tr>
        `)
    }
}

function calculateReceiptSubTotalAndTotal(tax) {
    const rows = document.querySelectorAll('#receipt-body tr');
    let subTotal = 0;

    rows.forEach(row => {
        const amountText = row.querySelector('#amount span').textContent;
        const amountValue = parseFloat(amountText);

        if (!isNaN(amountValue)) {
            subTotal += amountValue;
        }
    });

    const subTotalDiv = document.querySelector('.receipt .sub_total #value');
    subTotalDiv.textContent = subTotal.toFixed(2);

    const taxRate = (tax || ticketSettings.taxFromReceipt || 0) / 100;
    const salesTax = subTotal * taxRate;

    const salesTaxDiv = document.querySelector('.receipt .sales_tax #value');
    salesTaxDiv.textContent = salesTax.toFixed(2);

    const totalDiv = document.querySelector('.receipt .total #value');
    const total = subTotal + salesTax;
    totalDiv.textContent = total.toFixed(2);
}

function updatedReceiptData(element) {
    if ($('.receipt').hasClass('preview')) return;
    
    const row = element.closest('tr');

    const quantity = parseFloat(row.querySelector('#quantity > input').value);
    const unitPrice = parseFloat(row.querySelector('#unit_price > input').value);

    const totalAmount = (quantity * unitPrice).toFixed(2);
    
    const amountSpan = row.querySelector('#amount span');
    amountSpan.textContent = totalAmount;

    calculateReceiptSubTotalAndTotal();
}

function removeReceiptElement(element) {
    if ($('.receipt').hasClass('preview')) return;

    const tbody = document.getElementById('receipt-body');
    const currentRows = tbody.getElementsByTagName('tr').length;
    
    const $row = $(`.receipt table tbody > tr[data-id="${element}"]`);
    if (currentRows > 1) {
        $row.remove()
        $('#receipt-body tr').each(function(index) {
            $(this).attr('data-id', index + 1);
            $(`.receipt table tbody > tr[data-id="${index + 1}"] > .remove-element > div`).attr('onclick', `removeReceiptElement("${index + 1}")`);
        });
        calculateSubTotalAndTotal();
    }
}

$('.receipt .give > div > div').click(function(){
    $('.receipt .required').removeClass('required');
    
    let receiver = $('.receipt .give select').select2('data')[0];
    if (!receiver.id || receiver.id == 0) setTimeout(() => $('.receipt .give > div span.select2-selection').addClass('required'), 10);

    let amount = document.querySelector('.receipt .sub_total span#value').textContent;
    if (!amount || Math.floor(Number(amount)) == 0) setTimeout(() => $('.receipt .sub_total span#value').addClass('required'), 10);

    let receiptData = []
    const rows = document.querySelectorAll('#receipt-body tr');
    let needReturn = false;
    rows.forEach(row => {
        const quantity = row.querySelector('#quantity input').value;
        const item = row.querySelector('#item input').value;
        const unitPrice = row.querySelector('#unit_price input').value;

        if (!quantity || quantity < 1) {
            setTimeout(() => row.querySelector('#quantity input').classList.add('required'), 10);
            needReturn = true;
        };
        if (!item) {
            setTimeout(() => row.querySelector('#item input').classList.add('required'), 10);
            needReturn = true;
        };
        if (!unitPrice || unitPrice < 0.0) {
            setTimeout(() => row.querySelector('#unit_price input').classList.add('required'), 10);
            needReturn = true;
        };

        receiptData.push({
            qty: Number(quantity),
            item: item,
            unitPrice: Number(unitPrice)
        })
    });

    if (receiver?.id == 0 || !amount || Math.floor(amount) == 0 || needReturn) return;
    
    $.post(`https://${GetParentResourceName()}/issueReceipt`, JSON.stringify({
        receiver: receiver.id,
        amount: amount,
        receiptData: receiptData,
    }));

})

$('.receipt .buttons > div').click(function(){
    let paymentMethod = $(this).data('payment-method');
    $.post(`https://${GetParentResourceName()}/payTheReceipt`, JSON.stringify({paymentMethod: paymentMethod, fineId: currentFine}));
})


// Agreement:
function agreementChangedVehicle() {
    let vehicleData = $('#select-vehicle').select2('data')[0];

    var type = vehicleData.type;

    selectedVehicleType = null;
    if (type) {
        selectedVehicleType = translation.agreement.vehicle_types[type]
    } else {
        selectedVehicleType = '<span>...........</span>';
    }

    $(".agreement .card .paragraph_text_1 > span#dots").html(selectedVehicleType);
    $(".agreement .card .paragraph_text_2 > span#dots").html(selectedVehicleType);
}

$(document).on('click', '.agreement #make_signature_buyer', function(e) {
    $(".agreement #make_signature_buyer").hide();
    let signature = playerName
    const signatureElement = document.getElementById('signature_buyer');
    let currentLetterIndex = 0;
    
    function stopLetter() {
        $.post(`https://${GetParentResourceName()}/agreementDone`);
        setTimeout(() => {
            $(".agreement").fadeOut(120);
            currentMenu = null;
        }, 1000);
    }

    function addNextLetter() {
        signatureElement.textContent += signature[currentLetterIndex];
        currentLetterIndex++;
        if (currentLetterIndex < signature.length) {
            setTimeout(addNextLetter, 100);
        } else {
            stopLetter()
        }
    }
    
    addNextLetter();
})

$(document).on('click', '.agreement #make_signature_seller', function(e) {
    $(".agreement #make_signature_seller").hide();
    let signature = playerName
    const signatureElement = document.getElementById('signature_seller');
    let currentLetterIndex = 0;
    function stopLetter() {
        $(".agreement #give_invoice").css({
            "z-index": 500,
            "opacity": 0.8
        });
    }
    function addNextLetter() {
        signatureElement.textContent += signature[currentLetterIndex];
        currentLetterIndex++;
        if (currentLetterIndex < signature.length) {
            setTimeout(addNextLetter, 100);
        } else {
            stopLetter()
        }
    }
    addNextLetter();
})

$(document).on('click', '.agreement #give_invoice', function(e) {
    let selectedBuyer = $('#select-buyer').select2('data')[0];
    let selectedVehicle = $('#select-vehicle').select2('data')[0];
    let paymentMethod = $('#select-payment-method').select2('data')[0];

    let price = $(".agreement #sell-price-input").val();

    if (!selectedBuyer || selectedBuyer.id == 0) {
        $(".agreement #select-buyer").addClass("required");
    } else {
        $(".agreement #select-buyer").removeClass("required");
    }
    if (!selectedVehicle || selectedVehicle.type == undefined) {
        $(".agreement #select-vehicle").addClass("required");
    } else {
        $(".agreement #select-vehicle").removeClass("required");
    }
    if (!price) {
        $(".agreement #sell-price-input").addClass("required");
    } else {
        $(".agreement #sell-price-input").removeClass("required");
    }
    if (!paymentMethod || paymentMethod.paymentmethod == undefined) {
        $(".agreement #select-payment-method").addClass("required");
    } else {
        $(".agreement #select-payment-method").removeClass("required");
    }

    if (selectedBuyer && selectedBuyer.id != 0 && selectedVehicle && selectedVehicle.type != undefined && selectedVehicleType && paymentMethod && paymentMethod.paymentmethod != undefined && price) {
        $(".agreement").fadeOut(150);
        $.post(`https://${GetParentResourceName()}/sendAgreement`, JSON.stringify({
            selectedBuyer: selectedBuyer.id,
            resellData: {
                sellerName: playerName,
                price: price,
                date: currentDate,
                vehiclePlate: selectedVehicle.text,
                vehicleType: selectedVehicleType,
                paymentMethod: paymentMethod.paymentmethod,
            }
        }));
    }
})


// Billings Menu:
$('.billings_menu #prev-page').click(function() {
    if (BillingsMenu.currentPage > 1) {
        BillingsMenu.currentPage--;
        BillingsMenu.renderPage(BillingsMenu.currentPage);
        BillingsMenu.updatePagination();
    }
});

$('.billings_menu #next-page').click(function() {
    if (BillingsMenu.currentPage < Math.ceil(BillingsMenu.listArray.length / BillingsMenu.itemsPerPage)) {
        BillingsMenu.currentPage++;
        BillingsMenu.renderPage(BillingsMenu.currentPage);
        BillingsMenu.updatePagination();
    }
});

$(document).on('keypress', '.billings_menu .header .search', function (e) {
    if (e.key === "Enter") {
        e.preventDefault();
        
        const searchTerm = $(this).val().trim().toLowerCase();
        BillingsMenu.currentPage = 1;
        BillingsMenu.searchTerm = searchTerm;

        if (searchTerm === "") {
            BillingsMenu.listArrayFiltered = [];
            BillingsMenu.renderPage(BillingsMenu.currentPage);
            return;
        }

        BillingsMenu.listArrayFiltered = BillingsMenu.listArray.filter(item => {
            return (item.data.issuer && item.data.issuer.toLowerCase().includes(searchTerm)) || (item.data.receiver && item.data.receiver.toLowerCase().includes(searchTerm));
        });

        BillingsMenu.renderPage(BillingsMenu.currentPage);
    }
});

// VIN Info
$(".vin_menu #find .search").click(() => {
    $('.vin_menu #find').hide();
    $('.vin_menu #loading').fadeIn(120);

    setTimeout(() => {
        if (currentMenu && currentMenu == 'vin_menu') {
            let vin = $('.vin_menu .menu > #find > input').val();
            $.post(`https://${GetParentResourceName()}/getInfoByVIN`, JSON.stringify({vin: vin}), function(info) {
                MenuVIN.Update(info);
            });
        }
    }, 4000);
})

$(".vin_menu #result > .issue-ticket").click(() => {
    let vin = $('.vin_menu #result > .title > span').text();
    let model = $('.vin_menu #result > .model > span').text();
    let plate = $('.vin_menu #result > .plate > span').text();
    
    $.post(`https://${GetParentResourceName()}/issueTicketByMenu`, JSON.stringify({
        vin: vin,
        model: model,
        plate: plate,
    }));
})

// Health Insurances Menu
$(".health_insurances_menu #find .search").click(() => {
    $('.health_insurances_menu #find').hide();
    $('.health_insurances_menu #loading').fadeIn(120);

    setTimeout(() => {
        if (currentMenu && currentMenu == 'health_insurances_menu') {
            let ssn = $('.health_insurances_menu .menu > #find > input').val();
            $.post(`https://${GetParentResourceName()}/getInfoBySSN`, JSON.stringify({ssn: ssn}), function(info) {
                HealthInsurance.Update(info);
            });
        }
    }, 4000);
})


// Clerk Menu:
$(document).on('click', '.clerk-menu .menu div[data-type="players-info"] .box[data-type="player-vehicles"] > .data i', function(e) {
    const row = $(this).closest('div');
    const valueToCopy = row.find('#val').data('value');
    const el = document.createElement('textarea');
    el.value = valueToCopy;
    el.setAttribute('readonly', '');
    el.style.position = 'absolute';
    el.style.left = '-9999px';
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
    $.post(`https://${GetParentResourceName()}/copiedNotify`, JSON.stringify({value: valueToCopy}));
});

$(".clerk-menu .side-bar .button").click(function() {
    let newMenu = $(this).data('href');
    updateCityHall(newMenu, this);
})

function hireEmployee(playerId) {
    if (!playerId) return;
    $.post(`https://${GetParentResourceName()}/hireEmployee`, JSON.stringify({playerId: playerId}));
}

function bonusEmployee(identifier) {
    let bonusMoney = $(".clerk-menu #bonus-money").val();
    if (identifier && bonusMoney && bonusMoney >= 1) {
        $.post(`https://${GetParentResourceName()}/bonusEmployee`, JSON.stringify({identifier: identifier, bonusMoney: bonusMoney}));
        $(".clerk-menu #bonus-money").val('');
    }
}

function changeGradeEmployee(identifier, grade) {
    if (identifier && grade != undefined) {
        $.post(`https://${GetParentResourceName()}/changeGradeEmployee`, JSON.stringify({identifier: identifier, grade: grade}));
    }
}

function fireEmployee(identifier) {
    if (!identifier) return;
    $.post(`https://${GetParentResourceName()}/fireEmployee`, JSON.stringify({identifier: identifier}));
    $('.clerk-menu .main div[data-type="employees"] .box-right .data').empty();
}

function manageEmployee(name, identifier) {
    let jobsToSet = ``
    
    for (const [key, grade] of Object.entries(ClerkMenu.clerksGrades)) {
        if (grade) {
            jobsToSet += `
                <div>
                    <div class="changegrade" onclick='changeGradeEmployee("${identifier}", "${key}")'>${translation.clerk_menu.employees.menu_option_setjob_btn + grade.label}</div>
                </div>
            `
        }
    }
    
    $('.clerk-menu .main div[data-type="employees"] .box-right .data').html(`
        <div class="employee-manage">
            <div class="player">
                <div class="player-name">${name}</div>
                <div class="bonus-bar">
                    <input type="number" id="bonus-money">
                    <div class="bonus" onclick="bonusEmployee('${identifier}')">${translation.clerk_menu.employees.menu_option_bonus_btn}</div>
                </div>
                ${jobsToSet}
                <div>
                    <div class="fire" onclick="fireEmployee('${identifier}')">${translation.clerk_menu.employees.menu_option_fire_btn}</div>
                </div>
                
            </div>
        </div>
    `);
}

$(".clerk-menu .btn").click(function() {
    let option = $(this).data('option')
    if (option == "withdraw") {
        $('.box[data-type="balance"] .close-balance').addClass('isVisible');
        $('input[data-input="withdraw"]').show();
        $('.btn[data-option="deposit"]').hide();
        $('.btn[data-option="withdraw"]').hide();

    } else if (option == "deposit") {
        $('.box[data-type="balance"] .close-balance').addClass('isVisible');
        $('input[data-input="deposit"]').show();
        $('.btn[data-option="deposit"]').hide();
        $('.btn[data-option="withdraw"]').hide();

    } else if (option == "get_closest_players") {
        $.post(`https://${GetParentResourceName()}/getClosestPlayers`);
        
    } else if (option == "employees") {
        updateCityHall(option, '.clerk-menu div[data-href="employees"]')

    } else if (option == "send-message") {
        let text = $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > textarea').val();
        let company = $(this).data('company');
        message = text.trim();
        if (message !== "" && company) {
            $.post(`https://${GetParentResourceName()}/sendMessage`, JSON.stringify({
                text: text,
                company: company
            }));
            $('.clerk-menu div[data-type="business-taxes-company"]>div>.side-boxes>.box[data-type="message"] > textarea').val('');
        }
    }
})

function balanceButton() {
    if ($('.clerk-menu input[data-input="withdraw"]').val() >= 1) {
        let money = $('.clerk-menu input[data-input="withdraw"]').val()
        $.post(`https://${GetParentResourceName()}/withdraw`, JSON.stringify({money: money}));
        $('.clerk-menu input[data-input="withdraw"]').val('').hide();
        $('.clerk-menu .btn[data-option="deposit"]').show();
        $('.clerk-menu .btn[data-option="withdraw"]').show();
        $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isAnyVal');
        $('.clerk-menu .box[data-type="balance"] .close-balance > i').removeClass('fa-check').addClass('fa-close');
        $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isVisible');
        
    } else if ($('.clerk-menu input[data-input="deposit"]').val() >= 1) {
        let money = $('.clerk-menu input[data-input="deposit"]').val()
        $.post(`https://${GetParentResourceName()}/deposit`, JSON.stringify({money: money}));
        $('.clerk-menu input[data-input="deposit"]').val('').hide();
        $('.clerk-menu .btn[data-option="deposit"]').show();
        $('.clerk-menu .btn[data-option="withdraw"]').show();
        $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isAnyVal');
        $('.clerk-menu .box[data-type="balance"] .close-balance > i').removeClass('fa-check').addClass('fa-close');
        $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isVisible');

    } else {
        $('.clerk-menu .btn[data-option="deposit"]').show();
        $('.clerk-menu .btn[data-option="withdraw"]').show();
        $('.clerk-menu input[data-input="withdraw"]').val('').hide();
        $('.clerk-menu input[data-input="deposit"]').val('').hide();
        $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isVisible');
    }
}

function onInputBalance(type) {
    let value = $(`.clerk-menu input[data-input="${type}"]`).val();
    if (type == 'withdraw') {
        if (value >= 1) {
            $('.clerk-menu .box[data-type="balance"] .close-balance').addClass('isAnyVal');
            $('.clerk-menu .box[data-type="balance"] .close-balance > i').removeClass('fa-close').addClass('fa-check');
            
        } else {
            $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isAnyVal');
            $('.clerk-menu .box[data-type="balance"] .close-balance > i').removeClass('fa-check').addClass('fa-close');

        }
    } else if (type == 'deposit') {
        if (value >= 1) {
            $('.clerk-menu .box[data-type="balance"] .close-balance').addClass('isAnyVal');
            $('.clerk-menu .box[data-type="balance"] .close-balance > i').removeClass('fa-close').addClass('fa-check');
            
        } else {
            $('.clerk-menu .box[data-type="balance"] .close-balance').removeClass('isAnyVal');
            $('.clerk-menu .box[data-type="balance"] .close-balance > i').removeClass('fa-check').addClass('fa-close');

        }
    }
}


function sortTable(n) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = cityHallMenu == 'main' && document.getElementById("properties-table") || cityHallMenu == 'insurance' && document.getElementById("parking-spaces-table");
    switching = true;
    dir = "asc"; 

    var icons = document.getElementsByClassName("sort-icon");
    for (var i = 0; i < icons.length; i++) {
        icons[i].innerHTML = "";
    }

    var icon = document.getElementById("icon" + n);
    if (dir == "asc") {
        icon.innerHTML = "▲";
    } else {
        icon.innerHTML = "▼";
    }

    while (switching) {
        switching = false;
        rows = table.rows;
        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[n];
            y = rows[i + 1].getElementsByTagName("TD")[n];
            if (dir == "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch= true;
                    break;
                }
            } else if (dir == "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount ++;      
        } else {
            if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
                icon.innerHTML = "▼";
            }
        }
    }
}