const selectedLanguage = "EN" // EN / DE / FR / ES / PT / NL / PL / IT / CZ / SV

const sharedTranslation = {
    'EN': {
        "taxes_header": "News",
        "taxes_title": "Announcements",

        "statuses": {
            "paid": "PAID",
            "to_paid": "TO PAID",
            "lack_of_income": "Lack of income"
        },

        "months": {
            "01": "January",
            "02": "February",
            "03": "March",
            "04": "April",
            "05": "May",
            "06": "June",
            "07": "July",
            "08": "August",
            "09": "September",
            "10": "October",
            "11": "November",
            "12": "December"
        },

        "view_resume": "VIEW",

        "tax_amount_to_pay": "Amount to pay:",
        "late_payment_interest": "Late payment interest:",
        "tax_paid_amount": "Paid Amount:",

        "make_declaration": "Pay TAX"
    },
    'DE': {
        "taxes_header": "Nachrichten",
        "taxes_title": "Ankündigungen",
        "statuses": {
            "paid": "BEZAHLT",
            "to_paid": "ZU ZAHLEN",
            "lack_of_income": "Mangel an Einkommen"
        },
        "months": {
            "01": "Januar",
            "02": "Februar",
            "03": "März",
            "04": "April",
            "05": "Mai",
            "06": "Juni",
            "07": "Juli",
            "08": "August",
            "09": "September",
            "10": "Oktober",
            "11": "November",
            "12": "Dezember"
        },
        "view_resume": "ANSICHT",
        "tax_amount_to_pay": "Zu zahlender Betrag:",
        "late_payment_interest": "Verzugszinsen:",
        "tax_paid_amount": "Bezahlter Betrag:",
        "make_declaration": "Steuern zahlen"
    },
    'FR': {
        "taxes_header": "Actualités",
        "taxes_title": "Annonces",
        "statuses": {
            "paid": "PAYÉ",
            "to_paid": "À PAYER",
            "lack_of_income": "Manque de revenus"
        },
        "months": {
            "01": "Janvier",
            "02": "Février",
            "03": "Mars",
            "04": "Avril",
            "05": "Mai",
            "06": "Juin",
            "07": "Juillet",
            "08": "Août",
            "09": "Septembre",
            "10": "Octobre",
            "11": "Novembre",
            "12": "Décembre"
        },
        "view_resume": "VOIR",
        "tax_amount_to_pay": "Montant à payer:",
        "late_payment_interest": "Intérêt de retard:",
        "tax_paid_amount": "Montant payé:",
        "make_declaration": "Payer les impôts"
    },
    'ES': {
        "taxes_header": "Noticias",
        "taxes_title": "Anuncios",
        "statuses": {
            "paid": "PAGADO",
            "to_paid": "POR PAGAR",
            "lack_of_income": "Falta de ingresos"
        },
        "months": {
            "01": "Enero",
            "02": "Febrero",
            "03": "Marzo",
            "04": "Abril",
            "05": "Mayo",
            "06": "Junio",
            "07": "Julio",
            "08": "Agosto",
            "09": "Septiembre",
            "10": "Octubre",
            "11": "Noviembre",
            "12": "Diciembre"
        },
        "view_resume": "VER",
        "tax_amount_to_pay": "Cantidad a pagar:",
        "late_payment_interest": "Interés por pago tardío:",
        "tax_paid_amount": "Cantidad pagada:",
        "make_declaration": "Pagar impuesto"
    },
    'PT': {
        "taxes_header": "Notícias",
        "taxes_title": "Anúncios",
        "statuses": {
            "paid": "PAGO",
            "to_paid": "A PAGAR",
            "lack_of_income": "Falta de renda"
        },
        "months": {
            "01": "Janeiro",
            "02": "Fevereiro",
            "03": "Março",
            "04": "Abril",
            "05": "Maio",
            "06": "Junho",
            "07": "Julho",
            "08": "Agosto",
            "09": "Setembro",
            "10": "Outubro",
            "11": "Novembro",
            "12": "Dezembro"
        },
        "view_resume": "VER",
        "tax_amount_to_pay": "Valor a pagar:",
        "late_payment_interest": "Juros por pagamento em atraso:",
        "tax_paid_amount": "Valor pago:",
        "make_declaration": "Pagar IMPOSTO"
    },
    'PL': {
        "taxes_header": "Aktualności",
        "taxes_title": "Ogłoszenia",
        "statuses": {
            "paid": "ZAPŁACONE",
            "to_paid": "DO ZAPŁATY",
            "lack_of_income": "Brak dochodów"
        },
        "months": {
            "01": "Styczeń",
            "02": "Luty",
            "03": "Marzec",
            "04": "Kwiecień",
            "05": "Maj",
            "06": "Czerwiec",
            "07": "Lipiec",
            "08": "Sierpień",
            "09": "Wrzesień",
            "10": "Październik",
            "11": "Listopad",
            "12": "Grudzień"
        },
        "view_resume": "POKAŻ",
        "tax_amount_to_pay": "Kwota do zapłaty:",
        "late_payment_interest": "Odsetki za zwłokę:",
        "tax_paid_amount": "Zapłacona kwota:",
        "make_declaration": "Zapłać PODATEK"
    },
    'IT': {
        "taxes_header": "Notizie",
        "taxes_title": "Comunicazioni",
        "statuses": {
            "paid": "PAGATO",
            "to_paid": "DA PAGARE",
            "lack_of_income": "Mancanza di reddito"
        },
        "months": {
            "01": "Gennaio",
            "02": "Febbraio",
            "03": "Marzo",
            "04": "Aprile",
            "05": "Maggio",
            "06": "Giugno",
            "07": "Luglio",
            "08": "Agosto",
            "09": "Settembre",
            "10": "Ottobre",
            "11": "Novembre",
            "12": "Dicembre"
        },
        "view_resume": "VISUALIZZA",
        "tax_amount_to_pay": "Importo da pagare:",
        "late_payment_interest": "Interessi di mora:",
        "tax_paid_amount": "Importo pagato:",
        "make_declaration": "Paga TASSA"
    },
    'CZ': {
        "taxes_header": "Novinky",
        "taxes_title": "Oznámení",
        "statuses": {
            "paid": "ZAPLACENO",
            "to_paid": "KE SPLACENÍ",
            "lack_of_income": "Nedostatek příjmů"
        },
        "months": {
            "01": "Leden",
            "02": "Únor",
            "03": "Březen",
            "04": "Duben",
            "05": "Květen",
            "06": "Červen",
            "07": "Červenec",
            "08": "Srpen",
            "09": "Září",
            "10": "Říjen",
            "11": "Listopad",
            "12": "Prosinec"
        },
        "view_resume": "ZOBRAZIT",
        "tax_amount_to_pay": "Částka k zaplacení:",
        "late_payment_interest": "Penále za opožděnou platbu:",
        "tax_paid_amount": "Zaplacená částka:",
        "make_declaration": "Zaplatit DANĚ"
    },
    'SV': {
        "taxes_header": "Nyheter",
        "taxes_title": "Meddelanden",
        "statuses": {
            "paid": "BETALD",
            "to_paid": "ATT BETALA",
            "lack_of_income": "Brist på inkomst"
        },
        "months": {
            "01": "Januari",
            "02": "Februari",
            "03": "Mars",
            "04": "April",
            "05": "Maj",
            "06": "Juni",
            "07": "Juli",
            "08": "Augusti",
            "09": "September",
            "10": "Oktober",
            "11": "November",
            "12": "December"
        },
        "view_resume": "VISNING",
        "tax_amount_to_pay": "Belopp att betala:",
        "late_payment_interest": "Dröjsmålsränta:",
        "tax_paid_amount": "Betalt belopp:",
        "make_declaration": "Betala SKATT"
    },
}


window.mySharedFunction = function () {
    
    let isMonthToPayment = (paymentMonth, paymentYear) => {
        paymentMonth = Number(paymentMonth);
        paymentYear = Number(paymentYear);

        const now = new Date();
        const currentMonth = now.getMonth() + 1;
        const currentYear = now.getFullYear();
    
        let expectedMonth = currentMonth - 1;
        let expectedYear = currentYear;
    
        if (currentMonth === 1) {
            expectedMonth = 12;
            expectedYear = currentYear - 1;
        }
        
        if (paymentMonth === expectedMonth && paymentYear === expectedYear) {
            return true;
        }
    
        return false;
    }

    let getCurrentMonth = () => {
        const now = new Date();
        const currentMonth = now.getMonth() + 1;

        return currentMonth;
    }
    

    let sideBars = {
        resumes: `
            <div data-href="resumes" class="button">
                <div class="icon-box">
                    <i class="fa-solid fa-scroll"></i>
                </div>
                <div class="name">
                    <p class="title">{0}</p>
                    <p class="description">{1}</p>
                </div>
            </div>
        `,

        taxes: `
            <div data-href="taxes" class="button">
                <div class="icon-box">
                    <i class="fa-solid fa-building"></i>
                </div>
                <div class="name">
                    <p class="title">{0}</p>
                    <p class="description">{1}</p>
                </div>
            </div>
        `
    }

    let menus = {
        resumes: `
            <div data-type="resumes">
                <div>
                    <div class="side-boxes">
                        <div data-type="list">
                            <div class="header">{0}</div>
                            <div class="title">{1}</div>

                            <div class="resumes-list">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="table-first" style="padding-block: 0.3em;">
                                                <span id="citizen">{2}</span>
                                            </th>
                                            <th>
                                                <span id="date">{3}</span>
                                            </th>
                                            <th class="table-last center">
                                                <span id="option">{4}</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                            </div>

                            <i class="fa-solid fa-scroll"></i>
                        </div>
                        <div data-type="manage">
                            <div class="header">{5}</div>
                            <div class="title">{6}</div>
                            <div class="description">{7} <span></span></div>
                            <div class="toggle">{8}</div>
                            <i class="fa-solid fa-file-circle-xmark"></i>
                        </div>
                    </div>
                </div>
            </div>
        `,

        taxes: `
            <div data-type="taxes">
                <div>
                    <div class="side-boxes">
                        <div data-type="list">
                            <div class="header">{0}</div>
                            <div class="title">{1}</div>

                            <div class="taxes-list">
                            
                            </div>

                            <i class="fa-solid fa-building"></i>
                        </div>
                    </div>
                </div>
            </div>
        `,
    }

    let resumesElement = `
        <tr>
            <td class="table-first">{0}</td>
            <td>{1}</td>
            <td class="table-last">
                <div data-identifier="{2}">${sharedTranslation[selectedLanguage].view_resume}</div>
            </td>
        </tr>
    `

    let taxesElement = `
        <div>
            {0}
            <div class="title"><span>{1}</span>{2}</div>

            <hr>
            
            <div class="info">
                {3}
                {4}
                {5}
            </div>
            
            {6}
        </div>
    `
    
    let loadTaxesMenu = (taxes, resourceName) => {
        let taxesList = ``
        let sortedTaxes = Object.entries(taxes).sort((a, b) => {
            const [monthA, yearB] = a[0].split(":").map(Number);
            const [monthB, yearA] = b[0].split(":").map(Number);
            if (yearA !== yearB) {
                return yearA - yearB;
            }
            return monthB - monthA;
        });
        
        for (const [period, data] of sortedTaxes) {
            const [month, year] = period.split(":");

            let currentMonth = getCurrentMonth()
            let paymentMonth = isMonthToPayment(month, year)
            let element = taxesElement;
            
            if (currentMonth == month) {
                taxesList += element.format(
                    '',
                    year,
                    sharedTranslation[selectedLanguage].months[month],
                    `<div><span>${sharedTranslation[selectedLanguage].tax_amount_to_pay}</span> ${translation.currency}${number.format(data.amount)}</div>`,
                    '',
                    `<div><span>${sharedTranslation[selectedLanguage].tax_paid_amount}</span> ${translation.currency}${number.format(data.paid_amount)}</div>`,
                    ''
                )
            } else if (data.amount == 0 && paymentMonth) {
                taxesList += element.format(
                    `<div class="status lack_of_income">${sharedTranslation[selectedLanguage].statuses.lack_of_income}</div>`,
                    year,
                    sharedTranslation[selectedLanguage].months[month],
                    `<div><span>${sharedTranslation[selectedLanguage].tax_amount_to_pay}</span> ${translation.currency}${number.format(data.amount)}</div>`,
                    '',
                    `<div><span>${sharedTranslation[selectedLanguage].tax_paid_amount}</span> ${translation.currency}${number.format(data.paid_amount)}</div>`,
                    ''
                )
            } else if ((data.amount >= 1 && paymentMonth)) {
                taxesList += element.format(
                    data.is_paid ? `<div class="status paid">${sharedTranslation[selectedLanguage].statuses.paid}</div>` : `<div class="status to-paid">${sharedTranslation[selectedLanguage].statuses.to_paid}</div>`,
                    year,
                    sharedTranslation[selectedLanguage].months[month],
                    `<div><span>${sharedTranslation[selectedLanguage].tax_amount_to_pay}</span> ${translation.currency}${number.format(data.amount)}</div>`,
                    data.delayed_amount >= 1 ? `<div><span>${sharedTranslation[selectedLanguage].late_payment_interest}</span> ${translation.currency}${number.format(data.delayed_amount)}</div>` : '',
                    `<div><span>${sharedTranslation[selectedLanguage].tax_paid_amount}</span> ${translation.currency}${number.format(data.paid_amount)}</div>`,
                    !data.is_paid ? `<div class="payment" data-resource="${resourceName}" data-period="${period}" data-job="${data.job}"><p>${sharedTranslation[selectedLanguage].make_declaration}</p></div>` : ''
                )
            } else if (!paymentMonth && currentMonth != month) {
                taxesList += element.format(
                    data.is_paid ? `<div class="status paid">${sharedTranslation[selectedLanguage].statuses.paid}</div>` : `<div class="status to-paid">${sharedTranslation[selectedLanguage].statuses.to_paid}</div>`,
                    year,
                    sharedTranslation[selectedLanguage].months[month],
                    `<div><span>${sharedTranslation[selectedLanguage].tax_amount_to_pay}</span> ${translation.currency}${number.format(data.amount)}</div>`,
                    data.delayed_amount >= 1 ? `<div><span>${sharedTranslation[selectedLanguage].late_payment_interest}</span> ${translation.currency}${number.format(data.delayed_amount)}</div>` : '',
                    `<div><span>${sharedTranslation[selectedLanguage].tax_paid_amount}</span> ${translation.currency}${number.format(data.paid_amount)}</div>`,
                    taxBusinessAllowMakeDelayedDeclarations && !data.is_paid && `<div class="payment" data-resource="${resourceName}" data-period="${period}" data-job="${data.job}"><p>${sharedTranslation[selectedLanguage].make_declaration}</p></div>` || ''
                )
            // } else {
            //     console.log('test')
            }
        }

        return taxesList;
    }
    
    return {
        CityHall_SideBars: sideBars,
        CityHall_Menus: menus,
        CityHall_ResumesElement: resumesElement,

        IsMonthToPayment: isMonthToPayment,
        CurrentMonth: getCurrentMonth,
        
        LoadTaxesMenu: loadTaxesMenu,
    }
};

$(document).on('click', 'div[data-type="resumes"] div[data-type="manage"] > .toggle', function (e) {
    $.post(`https://vms_cityhall/toggledResumesAllowed`);
})


$(document).on('click', 'div[data-type="resumes"] .side-boxes > div[data-type="list"] > .resumes-list > table > tbody > tr > td.table-last > div', function (e) {
    let identifier = $(this).data('identifier');
    $.post(`https://vms_cityhall/viewResume`, JSON.stringify({
        identifier: identifier,
    }));
    
    $.post(`https://${GetParentResourceName()}/closeMenu`);
})

$(document).on('click', 'div[data-type="taxes"] .side-boxes > div[data-type="list"] .payment', function (e) {
    let period = $(this).data('period');
    let job = $(this).data('job');
    let resource = $(this).data('resource');
    $.post(`https://vms_cityhall/payBusinessTax`, JSON.stringify({
        period: period,
        job: job,
        resource: resource,
    }));
})