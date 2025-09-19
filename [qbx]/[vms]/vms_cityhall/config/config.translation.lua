-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄
Config.Language = 'EN' -- 'EN' / 'DE' / 'FR' / 'ES' / 'PT' / 'PL' / 'IT' / 'CZ' / 'SV'

Config.Translate = {
    ['EN'] = {
        ['notify.wait'] = "Try again in a while...",
        ['notify.no_money'] = "You don't have enough money...",
        ['notify.copied_value'] = "Copied %s.",
        ['notify.no_players_around'] = "No citizen nearby...",
        ['notify.player_is_too_far_away'] = "The player is too far away...",
        ['notify.you_dont_have_tablet'] = "Do not have a clerk table.",

        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "You are not allowed to use it.",

        ['notify.vin:does_not_have_a_vin'] = "The vehicle does not have a VIN number",

        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "You are not allowed to use it.",

        ['notify.check_vin:vin_is_hidden'] = "VIN number in vehicle %s, is hidden",
        ['notify.check_vin:vin_info'] = "Vehicle VIN number %s - %s",

        ['notify.hide_vin:must_be_in_vehicle'] = "You must be in a vehicle...",
        ['notify.hide_vin:must_be_driver'] = "You must be the driver of the vehicle...",
        ['notify.hide_vin:vin_has_been_discovered'] = "VIN number has been discovered",
        ['notify.hide_vin:vin_has_been_hidden'] = "VIN number has been hidden",

        ['notify.fines:already_has_in_hand'] = "Citizen already has the document in hand..",
        ['notify.fines:player_is_offline'] = "Player is offline",
        ['notify.fines:amount_is_too_small'] = "The amount is too small.",
        ['notify.fines:amount_is_too_much'] = "The amount is too large.",
        ['notify.fines:you_are_too_far_away'] = "You are too far from the person",

        ['notify.fines:you_dont_have_fine'] = "You do not have an empty ticket in your inventory...",
        ['notify.fines:issuer_dont_have_fine'] = "The issuer of the ticket does not have an empty ticket in his inventory....",
        ['notify.fines:player_signs_fine'] = "A citizen signs an fine, you can't take it away from him....",
        ['notify.fines:not_allowed_ticket'] = "You are not allowed to write a ticket",
        ['notify.fines:rejected_fine'] = "You have rejected this fine.",
        ['notify.fines:player_rejected_fine'] = "Citizen %s, rejected your fine.",
        ['notify.fines:confirmed_fine'] = "Citizen %s accepted the fine.",

        ['notify.fines:you_dont_have_invoice'] = "You do not have an empty invoice in your inventory...",
        ['notify.fines:issuer_dont_have_invoice'] = "The issuer of the invoice does not have an empty invoice in his inventory....",
        ['notify.fines:player_signs_invoice'] = "A citizen signs an invoice, you can't take it away from him....",
        ['notify.fines:not_allowed_invoice'] = "You are not allowed to write an invoice",
        ['notify.fines:rejected_invoice'] = "You have rejected this invoice.",
        ['notify.fines:player_rejected_invoice'] = "Citizen %s, rejected your invoice.",
        ['notify.fines:confirmed_invoice'] = "Citizen %s accepted the invoice.",

        ['notify.fines:you_dont_have_terminal'] = "You do not have payment terminal in your inventory",
        ['notify.fines:issuer_dont_have_terminal'] = "The issuer of the receipt does not have payment terminal in his inventory...",
        ['notify.fines:you_dont_have_receipt'] = "You do not have an empty thermal paper in your inventory...",
        ['notify.fines:issuer_dont_have_receipt'] = "The issuer of the receipt does not have an empty receipt in his inventory...",
        ['notify.fines:player_signs_receipt'] = "A citizen signs an receipt, you can't take it away from him....",
        ['notify.fines:not_allowed_receipt'] = "You are not allowed to write an invoice",
        -- ['notify.fines:rejected_receipt'] = "You have rejected this invoice.",
        -- ['notify.fines:player_rejected_receipt'] = "Citizen %s, rejected your invoice.",
        ['notify.fines:confirmed_receipt'] = "Citizen %s accepted the invoice.",

        ['notify.agreement:you_purchased_vehicle'] = "You purchased a vehicle %s for $%s",
        ['notify.agreement:you_sold_vehicle'] = "You sold the vehicle %s for $%s",
        ['notify.agreement:transferred_vehicle_to_company'] = "You have assigned ownership of vehicle %s to your company.",
        ['notify.agreement:you_dont_have_item'] = "You do not have a vehicle sales agreement in inventory.",
        ['notify.agreement:seller_dont_have_item'] = "The person from whom you plan to purchase the vehicle does not have a vehicle sales agreement in inventory.",
        ['notify.agreement:dont_have_any_vehicle'] = "You don't own any vehicle...",
        ['notify.agreement:model_is_not_allowed'] = "This vehicle model cannot be sold.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "This vehicle model cannot be transferred to your company.",

        ['notify.business_taxes:period_is_already_settled'] = "This accounting period is already settled.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "During this accounting period, the company had no revenue, you have nothing to settle.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Your company doesn't have enough money to settle this tax month..",
        ['notify.business_taxes:tax_settled'] = "You have paid tax to the tax office.",

        ['notify.papers_menu:purchased'] = "You purchased the %s paper for %s.",
        ['notify.papers_menu:taken'] = "You received %s paper.",

        ['notify.clerk_employees:you_are_not_allowed'] = "You can't do it.",
        ['notify.clerk_employees:player_is_offline'] = "You can't do it, the player is not available.",
        ['notify.clerk_employees:player_is_already_employed'] = "This player is already an employee at the City Hall.",
        ['notify.clerk_employees:player_is_not_employed'] = "This player is not an employee at this .",
        ['notify.clerk_employees:must_be_unemployed'] = "This player is already employed somewhere.",
        ['notify.clerk_employees:you_employee_hired'] = "A new employee has been hired!",
        ['notify.clerk_employees:you_fired_employee'] = "You fired employee.",
        ['notify.clerk_employees:awarded_bonus'] = "You awarded a $%s bonus to an employee.",
        ['notify.clerk_employees:received_bonus'] = "Received a bonus of $%s from the City Hall you work at.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "You don't have the authority to give bonuses to employees.",

        ['notify.clerk_balance:withdraw'] = "You withdrew $%s from the company's funds",
        ['notify.clerk_balance:deposit'] = "You have deposited $%s into the company safe.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "You don't have that much money...",
        ['notify.clerk_balance:dont_have_that_money'] = "City Hall doesn't have that much money...",

        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "You cannot withdraw such an amount.",
        ['notify.cityhall_paychecks:paid_out'] = "You paid out $%s",

        ['notify.cityhall_jobs:joined'] = "You've joined to the %s.",

        ['notify.cityhall_fines:already_paid_fine'] = "This fine is already paid.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "You paid the fine $%s.",

        ['notify.cityhall_fines:already_paid_invoice'] = "This invoice is already paid.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "You paid the invoice $%s.",

        ['notify.cityhall_fines:already_paid_receipt'] = "This receipt is already paid.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "You paid the receipt $%s.",

        ['notify.cityhall_taxes:already_paid_tax'] = "This tax is already paid.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "You paid the tax $%s.",

        ['notify.cityhall_resume:already_sent'] = "You've already sent your resume here...",
        ['notify.cityhall_resume:successful_sent'] = "You have successfully submitted a resume for a job.",
        ['notify.cityhall_resume:accepted_resume'] = "Accepted resume of citizen %s.",
        ['notify.cityhall_resume:declined_resume'] = "Declined resume of citizen %s.",

        ['notify.cityhall_documents:ordered'] = "You have ordered a %s.",
        ['notify.cityhall_documents:ordered_for'] = "You have ordered a %s for $%s.",
        ['notify.cityhall_documents:already_ordered'] = "You already have this document ordered...",
        ['notify.cityhall_documents:received'] = "You have received the %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "You are not eligible to apply for this document.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "You already have a valid document.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "This license plate is already taken.",

        ['notify.cityhall_healthinsurance:purchased'] = "You have purchased health insurance for %s days for %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "You have extended your health insurance by %s of days for %s$.",

        ['notify.cityhall_vehicleinsurance:purchased'] = "You have purchased insurance for vehicle %s for %s days for %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "You have extended insurance for your vehicle %s by %s of days for %s$.",

        ['tax.title:gains.vehicleexcise'] = "Vehicle purchase %s (%s)",

        ['phone.email:resume_title'] = "Hire Application",
        ['phone.email:resume_accepted'] = "Hello %s, congratulations, your resume has been accepted to %s, go to the office for more information about further recruitment.",
        ['phone.email:resume_rejected'] = "Hello %s, unfortunately, your resume to %s was rejected...",

        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",

        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Copy VIN"
    },
    ['DE'] = {
        ['notify.wait'] = "Versuche es später erneut...",
        ['notify.no_money'] = "Du hast nicht genug Geld...",
        ['notify.copied_value'] = "%s kopiert.",
        ['notify.no_players_around'] = "Kein Bürger in der Nähe...",
        ['notify.player_is_too_far_away'] = "Der Spieler ist zu weit entfernt...",
        ['notify.you_dont_have_tablet'] = "Besitze keinen Schreibtisch.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Du hast keine Erlaubnis, es zu benutzen.",
    
        ['notify.vin:does_not_have_a_vin'] = "Das Fahrzeug hat keine VIN-Nummer",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Du hast keine Erlaubnis, es zu benutzen.",
    
        ['notify.check_vin:vin_is_hidden'] = "VIN-Nummer im Fahrzeug %s ist versteckt",
        ['notify.check_vin:vin_info'] = "Fahrzeug-VIN-Nummer %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Du musst in einem Fahrzeug sein...",
        ['notify.hide_vin:must_be_driver'] = "Du musst der Fahrer des Fahrzeugs sein...",
        ['notify.hide_vin:vin_has_been_discovered'] = "VIN-Nummer wurde entdeckt",
        ['notify.hide_vin:vin_has_been_hidden'] = "VIN-Nummer wurde versteckt",
    
        ['notify.fines:already_has_in_hand'] = "Bürger hat bereits das Dokument in der Hand...",
        ['notify.fines:player_is_offline'] = "Spieler ist offline",
        ['notify.fines:amount_is_too_small'] = "Der Betrag ist zu klein.",
        ['notify.fines:amount_is_too_much'] = "Der Betrag ist zu groß.",
        ['notify.fines:you_are_too_far_away'] = "Du bist zu weit von der Person entfernt",
    
        ['notify.fines:you_dont_have_fine'] = "Du hast keine leere Strafzettel in deinem Inventar...",
        ['notify.fines:issuer_dont_have_fine'] = "Der Aussteller des Strafzettels hat keine leere Strafzettel in seinem Inventar...",
        ['notify.fines:player_signs_fine'] = "Ein Bürger unterschreibt einen Strafzettel, du kannst ihn nicht wegnehmen....",
        ['notify.fines:not_allowed_ticket'] = "Du hast keine Erlaubnis, einen Strafzettel zu schreiben",
        ['notify.fines:rejected_fine'] = "Du hast diesen Strafzettel abgelehnt.",
        ['notify.fines:player_rejected_fine'] = "Bürger %s hat deinen Strafzettel abgelehnt.",
        ['notify.fines:confirmed_fine'] = "Bürger %s hat den Strafzettel akzeptiert.",
    
        ['notify.fines:you_dont_have_invoice'] = "Du hast keine leere Rechnung in deinem Inventar...",
        ['notify.fines:issuer_dont_have_invoice'] = "Der Aussteller der Rechnung hat keine leere Rechnung in seinem Inventar...",
        ['notify.fines:player_signs_invoice'] = "Ein Bürger unterschreibt eine Rechnung, du kannst sie nicht wegnehmen....",
        ['notify.fines:not_allowed_invoice'] = "Du hast keine Erlaubnis, eine Rechnung zu schreiben",
        ['notify.fines:rejected_invoice'] = "Du hast diese Rechnung abgelehnt.",
        ['notify.fines:player_rejected_invoice'] = "Bürger %s hat deine Rechnung abgelehnt.",
        ['notify.fines:confirmed_invoice'] = "Bürger %s hat die Rechnung akzeptiert.",
    
        ['notify.fines:you_dont_have_terminal'] = "Du hast kein Zahlungsterminal",
        ['notify.fines:issuer_dont_have_terminal'] = "Der Verkäufer hat kein Zahlungsterminal...",
        ['notify.fines:you_dont_have_receipt'] = "Du hast kein Thermopapier...",
        ['notify.fines:issuer_dont_have_receipt'] = "Der Verkäufer hat kein Thermopapier...",
        ['notify.fines:player_signs_receipt'] = "Der Bürger nimmt die Rechnung an, sie kann ihm nicht weggenommen werden....",
        ['notify.fines:not_allowed_receipt'] = "Du kannst keine Rechnung stellen",
        ['notify.fines:confirmed_receipt'] = "Bürger %s hat die Rechnung akzeptiert.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Du hast ein Fahrzeug %s für $%s gekauft",
        ['notify.agreement:you_sold_vehicle'] = "Du hast das Fahrzeug %s für $%s verkauft",
        ['notify.agreement:transferred_vehicle_to_company'] = "Du hast den Besitz des Fahrzeugs %s auf deine Firma übertragen.",
        ['notify.agreement:you_dont_have_item'] = "Du hast keinen Fahrzeugkaufvertrag im Inventar.",
        ['notify.agreement:seller_dont_have_item'] = "Die Person, von der du das Fahrzeug kaufen möchtest, hat keinen Fahrzeugkaufvertrag im Inventar.",
        ['notify.agreement:dont_have_any_vehicle'] = "Du besitzt kein Fahrzeug...",
        ['notify.agreement:model_is_not_allowed'] = "Dieses Fahrzeugmodell kann nicht verkauft werden.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Dieses Fahrzeugmodell kann nicht auf deine Firma übertragen werden.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Dieser Abrechnungszeitraum ist bereits abgeschlossen.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Während dieses Abrechnungszeitraums hatte die Firma keine Einnahmen, du hast nichts abzurechnen.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Deine Firma hat nicht genug Geld, um diese Steuerperiode abzurechnen..",
        ['notify.business_taxes:tax_settled'] = "Du hast Steuern an das Finanzamt gezahlt.",
    
        ['notify.papers_menu:purchased'] = "Du hast das %s Papier für %s gekauft.",
        ['notify.papers_menu:taken'] = "Du hast das %s Papier erhalten.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Du kannst es nicht tun.",
        ['notify.clerk_employees:player_is_offline'] = "Du kannst es nicht tun, der Spieler ist nicht verfügbar.",
        ['notify.clerk_employees:player_is_already_employed'] = "Dieser Spieler ist bereits Mitarbeiter im Rathaus.",
        ['notify.clerk_employees:player_is_not_employed'] = "Dieser Spieler ist kein Mitarbeiter hier.",
        ['notify.clerk_employees:must_be_unemployed'] = "Dieser Spieler ist bereits an anderer Stelle beschäftigt.",
        ['notify.clerk_employees:you_employee_hired'] = "Ein neuer Mitarbeiter wurde eingestellt!",
        ['notify.clerk_employees:you_fired_employee'] = "Du hast den Mitarbeiter entlassen.",
        ['notify.clerk_employees:awarded_bonus'] = "Du hast dem Mitarbeiter einen Bonus von $%s verliehen.",
        ['notify.clerk_employees:received_bonus'] = "Du hast einen Bonus von $%s vom Rathaus, bei dem du arbeitest, erhalten.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Du hast nicht die Berechtigung, Boni an Mitarbeiter zu vergeben.",
    
        ['notify.clerk_balance:withdraw'] = "Du hast $%s aus den Unternehmensfonds abgehoben",
        ['notify.clerk_balance:deposit'] = "Du hast $%s in den Firmensafe eingezahlt.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Du hast nicht so viel Geld...",
        ['notify.clerk_balance:dont_have_that_money'] = "Das Rathaus hat nicht so viel Geld...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Du kannst diesen Betrag nicht abheben.",
        ['notify.cityhall_paychecks:paid_out'] = "Du hast $%s ausgezahlt",
    
        ['notify.cityhall_jobs:joined'] = "Du bist dem %s beigetreten.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Diese Strafe ist bereits bezahlt.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Du hast die Strafe $%s bezahlt.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Diese Rechnung ist bereits bezahlt.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Du hast die Rechnung $%s bezahlt.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Diese Rechnung wurde bereits bezahlt.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Du hast $%s für die Rechnung bezahlt.",
        
        ['notify.cityhall_taxes:already_paid_tax'] = "Diese Steuer ist bereits bezahlt.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Du hast die Steuer $%s bezahlt.",
    
        ['notify.cityhall_resume:already_sent'] = "Du hast bereits deinen Lebenslauf hier gesendet...",
        ['notify.cityhall_resume:successful_sent'] = "Du hast erfolgreich einen Lebenslauf für einen Job eingereicht.",
        ['notify.cityhall_resume:accepted_resume'] = "Lebenslauf von Bürger %s akzeptiert.",
        ['notify.cityhall_resume:declined_resume'] = "Lebenslauf von Bürger %s abgelehnt.",
    
        ['notify.cityhall_documents:ordered'] = "Du hast ein %s bestellt.",
        ['notify.cityhall_documents:ordered_for'] = "Du hast ein %s für $%s bestellt.",
        ['notify.cityhall_documents:already_ordered'] = "Du hast dieses Dokument bereits bestellt...",
        ['notify.cityhall_documents:received'] = "Du hast das %s erhalten.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Du bist nicht berechtigt, dich um dieses Dokument zu bewerben.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Du hast bereits ein gültiges Dokument.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Dieses Kennzeichen ist bereits vergeben.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Du hast für %s Tage eine Krankenversicherung für %s$ erworben.",
        ['notify.cityhall_healthinsurance:renewed'] = "Du hast deine Krankenversicherung um %s Tage für %s$ verlängert.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Du hast eine Versicherung für dein Fahrzeug %s für %s Tage für %s$ gekauft.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Du hast die Versicherung für dein Fahrzeug %s um %s Tage für %s$ verlängert.",
    
        ['tax.title:gains.vehicleexcise'] = "Fahrzeugkauf %s (%s)",
    
        ['phone.email:resume_title'] = "Bewerbung angenommen",
        ['phone.email:resume_accepted'] = "Hallo %s, herzlichen Glückwunsch, deine Bewerbung wurde bei %s angenommen. Gehe ins Büro für weitere Informationen zur weiteren Rekrutierung.",
        ['phone.email:resume_rejected'] = "Hallo %s, leider wurde deine Bewerbung bei %s abgelehnt...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ VIN kopieren"
    },
    ['FR'] = {
        ['notify.wait'] = "Réessayez plus tard...",
        ['notify.no_money'] = "Vous n'avez pas assez d'argent...",
        ['notify.copied_value'] = "Copié %s.",
        ['notify.no_players_around'] = "Pas de citoyen à proximité...",
        ['notify.player_is_too_far_away'] = "Le joueur est trop loin...",
        ['notify.you_dont_have_tablet'] = "Ne possède pas de table de commis.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Vous n'êtes pas autorisé à l'utiliser.",
    
        ['notify.vin:does_not_have_a_vin'] = "Le véhicule n'a pas de numéro VIN",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Vous n'êtes pas autorisé à l'utiliser.",
    
        ['notify.check_vin:vin_is_hidden'] = "Le numéro VIN du véhicule %s est caché",
        ['notify.check_vin:vin_info'] = "Numéro VIN du véhicule %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Vous devez être dans un véhicule...",
        ['notify.hide_vin:must_be_driver'] = "Vous devez être le conducteur du véhicule...",
        ['notify.hide_vin:vin_has_been_discovered'] = "Le numéro VIN a été découvert",
        ['notify.hide_vin:vin_has_been_hidden'] = "Le numéro VIN a été caché",
    
        ['notify.fines:already_has_in_hand'] = "Le citoyen a déjà le document en main..",
        ['notify.fines:player_is_offline'] = "Le joueur est hors ligne",
        ['notify.fines:amount_is_too_small'] = "Le montant est trop petit.",
        ['notify.fines:amount_is_too_much'] = "Le montant est trop élevé.",
        ['notify.fines:you_are_too_far_away'] = "Vous êtes trop loin de la personne",
    
        ['notify.fines:you_dont_have_fine'] = "Vous n'avez pas de billet vide dans votre inventaire...",
        ['notify.fines:issuer_dont_have_fine'] = "L'émetteur du billet n'a pas de billet vide dans son inventaire....",
        ['notify.fines:player_signs_fine'] = "Un citoyen signe une amende, vous ne pouvez pas lui enlever....",
        ['notify.fines:not_allowed_ticket'] = "Vous n'êtes pas autorisé à écrire un billet",
        ['notify.fines:rejected_fine'] = "Vous avez rejeté cette amende.",
        ['notify.fines:player_rejected_fine'] = "Le citoyen %s a rejeté votre amende.",
        ['notify.fines:confirmed_fine'] = "Le citoyen %s a accepté l'amende.",
    
        ['notify.fines:you_dont_have_invoice'] = "Vous n'avez pas de facture vide dans votre inventaire...",
        ['notify.fines:issuer_dont_have_invoice'] = "L'émetteur de la facture n'a pas de facture vide dans son inventaire....",
        ['notify.fines:player_signs_invoice'] = "Un citoyen signe une facture, vous ne pouvez pas lui enlever....",
        ['notify.fines:not_allowed_invoice'] = "Vous n'êtes pas autorisé à écrire une facture",
        ['notify.fines:rejected_invoice'] = "Vous avez rejeté cette facture.",
        ['notify.fines:player_rejected_invoice'] = "Le citoyen %s a rejeté votre facture.",
        ['notify.fines:confirmed_invoice'] = "Le citoyen %s a accepté la facture.",
    
        ['notify.fines:you_dont_have_terminal'] = "Vous n'avez pas de terminal de paiement",
        ['notify.fines:issuer_dont_have_terminal'] = "Le vendeur n'a pas de terminal de paiement...",
        ['notify.fines:you_dont_have_receipt'] = "Vous n'avez pas de papier thermique...",
        ['notify.fines:issuer_dont_have_receipt'] = "Le vendeur n'a pas de papier thermique...",
        ['notify.fines:player_signs_receipt'] = "Le citoyen récupère la facture, elle ne peut pas lui être retirée...",
        ['notify.fines:not_allowed_receipt'] = "Vous ne pouvez pas facturer",
        ['notify.fines:confirmed_receipt'] = "Le citoyen %s a accepté la facture.",

        ['notify.agreement:you_purchased_vehicle'] = "Vous avez acheté un véhicule %s pour %s$",
        ['notify.agreement:you_sold_vehicle'] = "Vous avez vendu le véhicule %s pour %s$",
        ['notify.agreement:transferred_vehicle_to_company'] = "Vous avez transféré la propriété du véhicule %s à votre entreprise.",
        ['notify.agreement:you_dont_have_item'] = "Vous n'avez pas d'accord de vente de véhicule dans l'inventaire.",
        ['notify.agreement:seller_dont_have_item'] = "La personne à qui vous prévoyez d'acheter le véhicule n'a pas d'accord de vente de véhicule dans l'inventaire.",
        ['notify.agreement:dont_have_any_vehicle'] = "Vous ne possédez aucun véhicule...",
        ['notify.agreement:model_is_not_allowed'] = "Ce modèle de véhicule ne peut pas être vendu.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Ce modèle de véhicule ne peut pas être transféré à votre entreprise.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Cette période comptable est déjà réglée.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Au cours de cette période comptable, l'entreprise n'a pas généré de revenus, vous n'avez rien à régler.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Votre entreprise n'a pas assez d'argent pour régler ce mois d'impôts..",
        ['notify.business_taxes:tax_settled'] = "Vous avez payé l'impôt au bureau des impôts.",
    
        ['notify.papers_menu:purchased'] = "Vous avez acheté le papier %s pour %s$.",
        ['notify.papers_menu:taken'] = "Vous avez reçu du papier %s.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Vous ne pouvez pas le faire.",
        ['notify.clerk_employees:player_is_offline'] = "Vous ne pouvez pas le faire, le joueur n'est pas disponible.",
        ['notify.clerk_employees:player_is_already_employed'] = "Ce joueur est déjà employé à la Mairie.",
        ['notify.clerk_employees:player_is_not_employed'] = "Ce joueur n'est pas employé ici.",
        ['notify.clerk_employees:must_be_unemployed'] = "Ce joueur est déjà employé ailleurs.",
        ['notify.clerk_employees:you_employee_hired'] = "Un nouvel employé a été embauché!",
        ['notify.clerk_employees:you_fired_employee'] = "Vous avez viré l'employé.",
        ['notify.clerk_employees:awarded_bonus'] = "Vous avez accordé une prime de %s$ à un employé.",
        ['notify.clerk_employees:received_bonus'] = "Vous avez reçu une prime de %s$ de la Mairie où vous travaillez.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Vous n'avez pas l'autorité pour accorder des primes aux employés.",
    
        ['notify.clerk_balance:withdraw'] = "Vous avez retiré %s$ des fonds de l'entreprise",
        ['notify.clerk_balance:deposit'] = "Vous avez déposé %s$ dans le coffre de l'entreprise.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Vous n'avez pas autant d'argent...",
        ['notify.clerk_balance:dont_have_that_money'] = "La Mairie n'a pas autant d'argent...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Vous ne pouvez pas retirer un tel montant.",
        ['notify.cityhall_paychecks:paid_out'] = "Vous avez payé %s$",
    
        ['notify.cityhall_jobs:joined'] = "Vous avez rejoint %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Cette amende est déjà payée.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Vous avez payé l'amende de %s$.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Cette facture est déjà payée.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Vous avez payé la facture de %s$.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Cette facture est déjà payée.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Vous avez payé $%s pour la facture.",
        
        ['notify.cityhall_taxes:already_paid_tax'] = "Cet impôt est déjà payé.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Vous avez payé l'impôt de %s$.",
    
        ['notify.cityhall_resume:already_sent'] = "Vous avez déjà envoyé votre CV ici...",
        ['notify.cityhall_resume:successful_sent'] = "Vous avez soumis avec succès un CV pour un emploi.",
        ['notify.cityhall_resume:accepted_resume'] = "CV accepté du citoyen %s.",
        ['notify.cityhall_resume:declined_resume'] = "CV refusé du citoyen %s.",
    
        ['notify.cityhall_documents:ordered'] = "Vous avez commandé un %s.",
        ['notify.cityhall_documents:ordered_for'] = "Vous avez commandé un %s pour %s$.",
        ['notify.cityhall_documents:already_ordered'] = "Vous avez déjà commandé ce document...",
        ['notify.cityhall_documents:received'] = "Vous avez reçu le %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Vous n'êtes pas éligible pour demander ce document.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Vous avez déjà un document valide.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Cette plaque d'immatriculation est déjà prise.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Vous avez acheté une assurance santé pour %s jours pour %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Vous avez prolongé votre assurance santé de %s jours pour %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Vous avez acheté une assurance pour le véhicule %s pour %s jours pour %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Vous avez prolongé l'assurance pour votre véhicule %s de %s jours pour %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Achat de véhicule %s (%s)",
    
        ['phone.email:resume_title'] = "Candidature pour Poste",
        ['phone.email:resume_accepted'] = "Bonjour %s, félicitations, votre candidature a été acceptée pour %s, rendez-vous au bureau pour plus d'informations sur le processus de recrutement.",
        ['phone.email:resume_rejected'] = "Bonjour %s, malheureusement, votre candidature pour %s a été rejetée...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Copier le VIN"
    },
    ['ES'] = {
        ['notify.wait'] = "Intenta de nuevo más tarde...",
        ['notify.no_money'] = "No tienes suficiente dinero...",
        ['notify.copied_value'] = "Copiado %s.",
        ['notify.no_players_around'] = "No hay ciudadanos cerca...",
        ['notify.player_is_too_far_away'] = "El jugador está demasiado lejos...",
        ['notify.you_dont_have_tablet'] = "No tienes una mesa de empleado.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "No tienes permiso para usarlo.",
    
        ['notify.vin:does_not_have_a_vin'] = "El vehículo no tiene un número VIN",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "No tienes permiso para usarlo.",
    
        ['notify.check_vin:vin_is_hidden'] = "El número VIN del vehículo %s está oculto",
        ['notify.check_vin:vin_info'] = "Número VIN del vehículo %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Debes estar en un vehículo...",
        ['notify.hide_vin:must_be_driver'] = "Debes ser el conductor del vehículo...",
        ['notify.hide_vin:vin_has_been_discovered'] = "Se ha descubierto el número VIN",
        ['notify.hide_vin:vin_has_been_hidden'] = "Se ha ocultado el número VIN",
    
        ['notify.fines:already_has_in_hand'] = "El ciudadano ya tiene el documento en mano..",
        ['notify.fines:player_is_offline'] = "El jugador está desconectado",
        ['notify.fines:amount_is_too_small'] = "La cantidad es demasiado pequeña.",
        ['notify.fines:amount_is_too_much'] = "La cantidad es demasiado grande.",
        ['notify.fines:you_are_too_far_away'] = "Estás demasiado lejos de la persona",
    
        ['notify.fines:you_dont_have_fine'] = "No tienes un boleto vacío en tu inventario...",
        ['notify.fines:issuer_dont_have_fine'] = "El emisor del boleto no tiene un boleto vacío en su inventario....",
        ['notify.fines:player_signs_fine'] = "Un ciudadano firma una multa, no puedes quitárselo....",
        ['notify.fines:not_allowed_ticket'] = "No tienes permitido escribir una multa",
        ['notify.fines:rejected_fine'] = "Has rechazado esta multa.",
        ['notify.fines:player_rejected_fine'] = "El ciudadano %s rechazó tu multa.",
        ['notify.fines:confirmed_fine'] = "El ciudadano %s aceptó la multa.",
    
        ['notify.fines:you_dont_have_invoice'] = "No tienes una factura vacía en tu inventario...",
        ['notify.fines:issuer_dont_have_invoice'] = "El emisor de la factura no tiene una factura vacía en su inventario....",
        ['notify.fines:player_signs_invoice'] = "Un ciudadano firma una factura, no puedes quitárselo....",
        ['notify.fines:not_allowed_invoice'] = "No tienes permitido escribir una factura",
        ['notify.fines:rejected_invoice'] = "Has rechazado esta factura.",
        ['notify.fines:player_rejected_invoice'] = "El ciudadano %s rechazó tu factura.",
        ['notify.fines:confirmed_invoice'] = "El ciudadano %s aceptó la factura.",
    
        ['notify.fines:you_dont_have_terminal'] = "No tienes un terminal de pago",
        ['notify.fines:issuer_dont_have_terminal'] = "El vendedor no tiene un terminal de pago...",
        ['notify.fines:you_dont_have_receipt'] = "No tienes papel térmico...",
        ['notify.fines:issuer_dont_have_receipt'] = "El vendedor no tiene papel térmico...",
        ['notify.fines:player_signs_receipt'] = "El ciudadano recoge el recibo, no se puede quitar de él....",
        ['notify.fines:not_allowed_receipt'] = "No puedes emitir recibo",
        ['notify.fines:confirmed_receipt'] = "El ciudadano %s aceptó el recibo.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Has comprado un vehículo %s por $%s",
        ['notify.agreement:you_sold_vehicle'] = "Has vendido el vehículo %s por $%s",
        ['notify.agreement:transferred_vehicle_to_company'] = "Has transferido la propiedad del vehículo %s a tu empresa.",
        ['notify.agreement:you_dont_have_item'] = "No tienes un acuerdo de venta de vehículos en el inventario.",
        ['notify.agreement:seller_dont_have_item'] = "La persona a quien planeas comprar el vehículo no tiene un acuerdo de venta de vehículos en el inventario.",
        ['notify.agreement:dont_have_any_vehicle'] = "No tienes ningún vehículo...",
        ['notify.agreement:model_is_not_allowed'] = "Este modelo de vehículo no puede ser vendido.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Este modelo de vehículo no puede ser transferido a tu empresa.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Este período contable ya está liquidado.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Durante este período contable, la empresa no tuvo ingresos, no tienes nada que liquidar.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Tu empresa no tiene suficiente dinero para liquidar este mes de impuestos..",
        ['notify.business_taxes:tax_settled'] = "Has pagado impuestos a la oficina de impuestos.",
    
        ['notify.papers_menu:purchased'] = "Has comprado el papel %s por %s.",
        ['notify.papers_menu:taken'] = "Recibiste el papel %s.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "No puedes hacerlo.",
        ['notify.clerk_employees:player_is_offline'] = "No puedes hacerlo, el jugador no está disponible.",
        ['notify.clerk_employees:player_is_already_employed'] = "Este jugador ya es empleado en el Ayuntamiento.",
        ['notify.clerk_employees:player_is_not_employed'] = "Este jugador no es empleado en este lugar.",
        ['notify.clerk_employees:must_be_unemployed'] = "Este jugador ya está empleado en otro lugar.",
        ['notify.clerk_employees:you_employee_hired'] = "¡Se ha contratado un nuevo empleado!",
        ['notify.clerk_employees:you_fired_employee'] = "Has despedido al empleado.",
        ['notify.clerk_employees:awarded_bonus'] = "Has otorgado un bono de $%s a un empleado.",
        ['notify.clerk_employees:received_bonus'] = "Recibiste un bono de $%s del Ayuntamiento en el que trabajas.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "No tienes autoridad para otorgar bonificaciones a los empleados.",
    
        ['notify.clerk_balance:withdraw'] = "Has retirado $%s de los fondos de la empresa",
        ['notify.clerk_balance:deposit'] = "Has depositado $%s en la caja fuerte de la empresa.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "No tienes tanto dinero...",
        ['notify.clerk_balance:dont_have_that_money'] = "El Ayuntamiento no tiene tanto dinero...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "No puedes retirar esa cantidad.",
        ['notify.cityhall_paychecks:paid_out'] = "Has pagado $%s",
    
        ['notify.cityhall_jobs:joined'] = "Te has unido a %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Esta multa ya está pagada.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Has pagado la multa $%s.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Esta factura ya está pagada.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Has pagado la factura $%s.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Este recibo ya está pagado.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Pagaste $%s por el recibo.",
    
        ['notify.cityhall_taxes:already_paid_tax'] = "Estos impuestos ya están pagados.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Has pagado los impuestos $%s.",
    
        ['notify.cityhall_resume:already_sent'] = "Ya has enviado tu currículum aquí...",
        ['notify.cityhall_resume:successful_sent'] = "Has enviado con éxito un currículum para un trabajo.",
        ['notify.cityhall_resume:accepted_resume'] = "Currículum aceptado del ciudadano %s.",
        ['notify.cityhall_resume:declined_resume'] = "Currículum rechazado del ciudadano %s.",
    
        ['notify.cityhall_documents:ordered'] = "Has solicitado un %s.",
        ['notify.cityhall_documents:ordered_for'] = "Has solicitado un %s por $%s.",
        ['notify.cityhall_documents:already_ordered'] = "Ya tienes este documento solicitado...",
        ['notify.cityhall_documents:received'] = "Has recibido el %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "No cumples los requisitos para solicitar este documento.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Ya tienes un documento válido.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Esta placa de matrícula ya está tomada.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Has comprado un seguro de salud por %s días por %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Has renovado tu seguro de salud por %s días por %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Has comprado un seguro para el vehículo %s por %s días por %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Has renovado el seguro de tu vehículo %s por %s días por %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Compra de vehículo %s (%s)",
    
        ['phone.email:resume_title'] = "Solicitud de Trabajo",
        ['phone.email:resume_accepted'] = "Hola %s, felicidades, tu solicitud de trabajo ha sido aceptada en %s, ve a la oficina para más información sobre el proceso de reclutamiento.",
        ['phone.email:resume_rejected'] = "Hola %s, lamentablemente, tu solicitud de trabajo en %s ha sido rechazada...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Copiar VIN"
    },
    ['PT'] = {
        ['notify.wait'] = "Tente novamente mais tarde...",
        ['notify.no_money'] = "Você não tem dinheiro suficiente...",
        ['notify.copied_value'] = "Valor %s copiado.",
        ['notify.no_players_around'] = "Nenhum cidadão por perto...",
        ['notify.player_is_too_far_away'] = "O jogador está muito longe...",
        ['notify.you_dont_have_tablet'] = "Você não possui uma mesa de escriturário.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Você não tem permissão para usá-lo.",
    
        ['notify.vin:does_not_have_a_vin'] = "O veículo não possui um número de VIN",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Você não tem permissão para usá-lo.",
    
        ['notify.check_vin:vin_is_hidden'] = "Número VIN no veículo %s, está oculto",
        ['notify.check_vin:vin_info'] = "Número VIN do veículo %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Você deve estar em um veículo...",
        ['notify.hide_vin:must_be_driver'] = "Você deve ser o motorista do veículo...",
        ['notify.hide_vin:vin_has_been_discovered'] = "Número VIN foi descoberto",
        ['notify.hide_vin:vin_has_been_hidden'] = "Número VIN foi oculto",
    
        ['notify.fines:already_has_in_hand'] = "Cidadão já tem o documento em mãos..",
        ['notify.fines:player_is_offline'] = "Jogador está offline",
        ['notify.fines:amount_is_too_small'] = "O valor é muito pequeno.",
        ['notify.fines:amount_is_too_much'] = "O valor é muito alto.",
        ['notify.fines:you_are_too_far_away'] = "Você está muito longe da pessoa",
    
        ['notify.fines:you_dont_have_fine'] = "Você não possui um bilhete em branco em seu inventário...",
        ['notify.fines:issuer_dont_have_fine'] = "O emissor do bilhete não possui um bilhete em branco em seu inventário....",
        ['notify.fines:player_signs_fine'] = "Um cidadão assina uma multa, você não pode tirá-lo dele....",
        ['notify.fines:not_allowed_ticket'] = "Você não tem permissão para escrever uma multa",
        ['notify.fines:rejected_fine'] = "Você rejeitou esta multa.",
        ['notify.fines:player_rejected_fine'] = "Cidadão %s, rejeitou sua multa.",
        ['notify.fines:confirmed_fine'] = "Cidadão %s aceitou a multa.",
    
        ['notify.fines:you_dont_have_invoice'] = "Você não possui uma nota fiscal em branco em seu inventário...",
        ['notify.fines:issuer_dont_have_invoice'] = "O emissor da nota fiscal não possui uma nota fiscal em branco em seu inventário....",
        ['notify.fines:player_signs_invoice'] = "Um cidadão assina uma nota fiscal, você não pode tirá-la dele....",
        ['notify.fines:not_allowed_invoice'] = "Você não tem permissão para escrever uma nota fiscal",
        ['notify.fines:rejected_invoice'] = "Você rejeitou esta nota fiscal.",
        ['notify.fines:player_rejected_invoice'] = "Cidadão %s, rejeitou sua nota fiscal.",
        ['notify.fines:confirmed_invoice'] = "Cidadão %s aceitou a nota fiscal.",
    
        ['notify.fines:you_dont_have_terminal'] = "Você não tem um terminal de pagamento",
        ['notify.fines:issuer_dont_have_terminal'] = "O vendedor não tem um terminal de pagamento...",
        ['notify.fines:you_dont_have_receipt'] = "Você não tem papel térmico...",
        ['notify.fines:issuer_dont_have_receipt'] = "O vendedor não tem papel térmico...",
        ['notify.fines:player_signs_receipt'] = "Cidadão pega o recibo, não pode ser tirado dele...",
        ['notify.fines:not_allowed_receipt'] = "Você não pode emitir recibo",
        ['notify.fines:confirmed_receipt'] = "Cidadão %s aceitou o recibo.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Você comprou um veículo %s por $%s",
        ['notify.agreement:you_sold_vehicle'] = "Você vendeu o veículo %s por $%s",
        ['notify.agreement:transferred_vehicle_to_company'] = "Você transferiu a propriedade do veículo %s para sua empresa.",
        ['notify.agreement:you_dont_have_item'] = "Você não possui um contrato de venda de veículo no inventário.",
        ['notify.agreement:seller_dont_have_item'] = "A pessoa de quem você pretende comprar o veículo não tem um contrato de venda de veículo no inventário.",
        ['notify.agreement:dont_have_any_vehicle'] = "Você não possui nenhum veículo...",
        ['notify.agreement:model_is_not_allowed'] = "Esse modelo de veículo não pode ser vendido.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Esse modelo de veículo não pode ser transferido para sua empresa.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Este período contábil já está encerrado.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Durante este período contábil, a empresa não teve receita, você não tem nada para acertar.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Sua empresa não tem dinheiro suficiente para acertar este mês de impostos..",
        ['notify.business_taxes:tax_settled'] = "Você pagou imposto ao escritório de impostos.",
    
        ['notify.papers_menu:purchased'] = "Você comprou o papel %s por %s.",
        ['notify.papers_menu:taken'] = "Você recebeu o papel %s.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Você não pode fazer isso.",
        ['notify.clerk_employees:player_is_offline'] = "Você não pode fazer isso, o jogador não está disponível.",
        ['notify.clerk_employees:player_is_already_employed'] = "Este jogador já é funcionário na Prefeitura.",
        ['notify.clerk_employees:player_is_not_employed'] = "Este jogador não é um funcionário neste .",
        ['notify.clerk_employees:must_be_unemployed'] = "Este jogador já está empregado em outro lugar.",
        ['notify.clerk_employees:you_employee_hired'] = "Um novo funcionário foi contratado!",
        ['notify.clerk_employees:you_fired_employee'] = "Você demitiu o funcionário.",
        ['notify.clerk_employees:awarded_bonus'] = "Você premiou um bônus de $%s a um funcionário.",
        ['notify.clerk_employees:received_bonus'] = "Recebeu um bônus de $%s da Prefeitura onde trabalha.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Você não tem autoridade para dar bônus aos funcionários.",
    
        ['notify.clerk_balance:withdraw'] = "Você retirou $%s dos fundos da empresa",
        ['notify.clerk_balance:deposit'] = "Você depositou $%s na caixa forte da empresa.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Você não tem tanto dinheiro...",
        ['notify.clerk_balance:dont_have_that_money'] = "A Prefeitura não tem tanto dinheiro...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Você não pode sacar essa quantia.",
        ['notify.cityhall_paychecks:paid_out'] = "Você pagou $%s",
    
        ['notify.cityhall_jobs:joined'] = "Você entrou para o %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Essa multa já foi paga.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Você pagou a multa de $%s.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Essa fatura já foi paga.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Você pagou a fatura de $%s.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Este recibo já está pago.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Você pagou $%s pelo recibo.",
    
        ['notify.cityhall_taxes:already_paid_tax'] = "Esse imposto já foi pago.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Você pagou o imposto de $%s.",
    
        ['notify.cityhall_resume:already_sent'] = "Você já enviou seu currículo aqui...",
        ['notify.cityhall_resume:successful_sent'] = "Você enviou com sucesso um currículo para um emprego.",
        ['notify.cityhall_resume:accepted_resume'] = "Currículo de cidadão %s aceito.",
        ['notify.cityhall_resume:declined_resume'] = "Currículo de cidadão %s recusado.",
    
        ['notify.cityhall_documents:ordered'] = "Você encomendou um %s.",
        ['notify.cityhall_documents:ordered_for'] = "Você encomendou um %s por $%s.",
        ['notify.cityhall_documents:already_ordered'] = "Você já encomendou este documento...",
        ['notify.cityhall_documents:received'] = "Você recebeu o %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Você não está qualificado para solicitar este documento.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Você já possui um documento válido.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Esta placa já está sendo utilizada.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Você comprou um seguro de saúde por %s dias por %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Você estendeu seu seguro de saúde por %s dias por %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Você comprou um seguro para o veículo %s por %s dias por %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Você estendeu o seguro do seu veículo %s por %s dias por %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Compra de veículo %s (%s)",
    
        ['phone.email:resume_title'] = "Aplicação de Contratação",
        ['phone.email:resume_accepted'] = "Olá %s, parabéns, sua candidatura foi aceita para %s, vá ao escritório para mais informações sobre o recrutamento.",
        ['phone.email:resume_rejected'] = "Olá %s, infelizmente, sua candidatura para %s foi rejeitada...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Copiar VIN"
    },
    ['PL'] = {
        ['notify.wait'] = "Spróbuj ponownie za chwilę...",
        ['notify.no_money'] = "Nie masz wystarczającej ilości pieniędzy...",
        ['notify.copied_value'] = "Skopiowano %s.",
        ['notify.no_players_around'] = "Brak obywateli w pobliżu...",
        ['notify.player_is_too_far_away'] = "Gracz jest zbyt daleko...",
        ['notify.you_dont_have_tablet'] = "Nie masz tabletu urzędnika.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Nie masz uprawnień do korzystania z tego.",
    
        ['notify.vin:does_not_have_a_vin'] = "Pojazd nie posiada numeru VIN",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Nie masz uprawnień do korzystania z tego.",
    
        ['notify.check_vin:vin_is_hidden'] = "Numer VIN w pojeździe %s jest ukryty",
        ['notify.check_vin:vin_info'] = "Numer VIN pojazdu %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Musisz być w pojeździe...",
        ['notify.hide_vin:must_be_driver'] = "Musisz być kierowcą pojazdu...",
        ['notify.hide_vin:vin_has_been_discovered'] = "Numer VIN został odkryty",
        ['notify.hide_vin:vin_has_been_hidden'] = "Numer VIN został ukryty",
    
        ['notify.fines:already_has_in_hand'] = "Obywatel już ma dokument w ręce...",
        ['notify.fines:player_is_offline'] = "Gracz jest offline",
        ['notify.fines:amount_is_too_small'] = "Kwota jest zbyt mała.",
        ['notify.fines:amount_is_too_much'] = "Kwota jest zbyt duża.",
        ['notify.fines:you_are_too_far_away'] = "Jesteś zbyt daleko od osoby",
    
        ['notify.fines:you_dont_have_fine'] = "Nie masz pustego mandatu w swoim ekwipunku...",
        ['notify.fines:issuer_dont_have_fine'] = "Wystawca nie ma pustego mandatu w swoim ekwipunku....",
        ['notify.fines:player_signs_fine'] = "Obywatel podpisuje mandat, nie możesz go mu zabrać...",
        ['notify.fines:not_allowed_ticket'] = "Nie masz uprawnień do wystawiania mandatów",
        ['notify.fines:rejected_fine'] = "Odrzuciłeś ten mandat.",
        ['notify.fines:player_rejected_fine'] = "Obywatel %s, odrzucił twój mandat.",
        ['notify.fines:confirmed_fine'] = "Obywatel %s zaakceptował mandat.",
    
        ['notify.fines:you_dont_have_invoice'] = "Nie masz pustej faktury w swoim ekwipunku...",
        ['notify.fines:issuer_dont_have_invoice'] = "Wystawca nie ma pustej faktury w swoim ekwipunku....",
        ['notify.fines:player_signs_invoice'] = "Obywatel podpisuje fakturę, nie możesz jej mu zabrać...",
        ['notify.fines:not_allowed_invoice'] = "Nie masz uprawnień do wystawiania faktur",
        ['notify.fines:rejected_invoice'] = "Odrzuciłeś tę fakturę.",
        ['notify.fines:player_rejected_invoice'] = "Obywatel %s, odrzucił twoją fakturę.",
        ['notify.fines:confirmed_invoice'] = "Obywatel %s zaakceptował fakturę.",
    
        ['notify.fines:you_dont_have_terminal'] = "Nie posiadasz terminala płatniczego w swoim ekwipunku",
        ['notify.fines:issuer_dont_have_terminal'] = "Sprzedawca nie posiada terminala płatniczego...",
        ['notify.fines:you_dont_have_receipt'] = "Nie masz papieru termicznego...",
        ['notify.fines:issuer_dont_have_receipt'] = "Sprzedawca nie posiada papieru termicznego...",
        ['notify.fines:player_signs_receipt'] = "Obywatel odbiera rachunek, nie można mu go odebrać....",
        ['notify.fines:not_allowed_receipt'] = "Nie możesz wystawić rachunku",
        ['notify.fines:confirmed_receipt'] = "Obywatel %s zaakceptował rachunek.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Kupiłeś pojazd %s za %s$",
        ['notify.agreement:you_sold_vehicle'] = "Sprzedałeś pojazd %s za %s$",
        ['notify.agreement:transferred_vehicle_to_company'] = "Przypisałeś prawo własności pojazdu %s do swojej firmy.",
        ['notify.agreement:you_dont_have_item'] = "Nie masz umowy sprzedaży pojazdu w ekwipunku.",
        ['notify.agreement:seller_dont_have_item'] = "Osoba, od której planujesz kupić pojazd, nie ma umowy sprzedaży pojazdu w ekwipunku.",
        ['notify.agreement:dont_have_any_vehicle'] = "Nie posiadasz żadnych pojazdów...",
        ['notify.agreement:model_is_not_allowed'] = "Ten model pojazdu nie może być sprzedany.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Ten model pojazdu nie może być przekazany do twojej firmy.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Ten okres rozliczeniowy jest już uregulowany.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "W tym okresie rozliczeniowym firma nie osiągnęła żadnych przychodów, nie masz nic do uregulowania.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Twoja firma nie ma wystarczająco pieniędzy, aby rozliczyć ten miesiąc podatkowy..",
        ['notify.business_taxes:tax_settled'] = "Zapłaciłeś podatek do urzędu skarbowego.",
    
        ['notify.papers_menu:purchased'] = "Zakupiłeś dokument %s za %s.",
        ['notify.papers_menu:taken'] = "Otrzymałeś dokument %s.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Nie możesz tego zrobić.",
        ['notify.clerk_employees:player_is_offline'] = "Nie możesz tego zrobić, gracz jest niedostępny.",
        ['notify.clerk_employees:player_is_already_employed'] = "Ten gracz jest już pracownikiem w ratuszu.",
        ['notify.clerk_employees:player_is_not_employed'] = "Ten gracz nie jest pracownikiem w tej .",
        ['notify.clerk_employees:must_be_unemployed'] = "Ten gracz jest już zatrudniony gdzie indziej.",
        ['notify.clerk_employees:you_employee_hired'] = "Zatrudniono nowego pracownika!",
        ['notify.clerk_employees:you_fired_employee'] = "Zwolniłeś pracownika.",
        ['notify.clerk_employees:awarded_bonus'] = "Przyznano dodatek w wysokości %s$ pracownikowi.",
        ['notify.clerk_employees:received_bonus'] = "Otrzymano premię w wysokości %s$ od ratusza, w którym pracujesz.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Nie masz uprawnień do przyznawania premii pracownikom.",
    
        ['notify.clerk_balance:withdraw'] = "Wypłaciłeś %s$ z funduszy skarbca urzędu.",
        ['notify.clerk_balance:deposit'] = "Wpłaciłeś %s$ do skarbca urzędu..",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Nie masz tyle pieniędzy...",
        ['notify.clerk_balance:dont_have_that_money'] = "Ratusz nie ma tylu pieniędzy...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Nie możesz wypłacić takiej kwoty.",
        ['notify.cityhall_paychecks:paid_out'] = "Wypłacono %s$",
    
        ['notify.cityhall_jobs:joined'] = "Dołączyłeś do %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Ten mandat jest już opłacony.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Zapłaciłeś mandat %s$.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Ta faktura jest już opłacona.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Zapłaciłeś fakturę %s$.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Ten rachunek jest już opłacony.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Zapłaciłeś $%s za rachunek.",
    
        ['notify.cityhall_taxes:already_paid_tax'] = "Ten podatek jest już opłacony.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Zapłaciłeś podatek %s$.",
    
        ['notify.cityhall_resume:already_sent'] = "Już wysłałeś swoje CV tutaj...",
        ['notify.cityhall_resume:successful_sent'] = "Pomyślnie wysłałeś CV na stanowisko pracy.",
        ['notify.cityhall_resume:accepted_resume'] = "Zaakceptowano CV obywatela %s.",
        ['notify.cityhall_resume:declined_resume'] = "Odrzucono CV obywatela %s.",
    
        ['notify.cityhall_documents:ordered'] = "Zamówiono %s.",
        ['notify.cityhall_documents:ordered_for'] = "Zamówiono %s za %s$.",
        ['notify.cityhall_documents:already_ordered'] = "Masz już ten dokument zamówiony...",
        ['notify.cityhall_documents:received'] = "Otrzymałeś %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Nie masz uprawnień do ubiegania się o ten dokument.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Masz już ważny dokument.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Ta rejestracja jest już zajęta.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Kupiłeś ubezpieczenie zdrowotne na %s dni za %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Przedłużyłeś ubezpieczenie zdrowotne o %s dni za %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Kupiłeś ubezpieczenie dla pojazdu %s na %s dni za %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Przedłużyłeś ubezpieczenie dla swojego pojazdu %s o %s dni za %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Zakup pojazdu %s (%s)",
    
        ['phone.email:resume_title'] = "Wniosek o zatrudnienie",
        ['phone.email:resume_accepted'] = "Witaj %s, gratulacje, Twoje CV do %s zostało rozpatrzone pozytywnie, udaj się do biura, aby uzyskać więcej informacji na temat dalszej rekrutacji.",
        ['phone.email:resume_rejected'] = "Witaj %s, niestety Twoje CV do %s zostało odrzucone...",
    
        ['target.info_vin'] = "Zweryfikuj VIN",
        ['target.check_vin'] = "Sprawdź numer VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Skopiuj VIN"
    },
    ['IT'] = {
        ['notify.wait'] = "Riprova tra un po'...",
        ['notify.no_money'] = "Non hai abbastanza soldi...",
        ['notify.copied_value'] = "%s copiato.",
        ['notify.no_players_around'] = "Nessun cittadino nelle vicinanze...",
        ['notify.player_is_too_far_away'] = "Il giocatore è troppo lontano...",
        ['notify.you_dont_have_tablet'] = "Non hai un tablet da impiegato.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Non sei autorizzato a usarlo.",
    
        ['notify.vin:does_not_have_a_vin'] = "Il veicolo non ha un numero VIN",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Non sei autorizzato a usarlo.",
    
        ['notify.check_vin:vin_is_hidden'] = "Il numero VIN nel veicolo %s, è nascosto",
        ['notify.check_vin:vin_info'] = "Numero VIN del veicolo %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Devi essere in un veicolo...",
        ['notify.hide_vin:must_be_driver'] = "Devi essere il conducente del veicolo...",
        ['notify.hide_vin:vin_has_been_discovered'] = "Il numero VIN è stato scoperto",
        ['notify.hide_vin:vin_has_been_hidden'] = "Il numero VIN è stato nascosto",
    
        ['notify.fines:already_has_in_hand'] = "Il cittadino ha già il documento in mano..",
        ['notify.fines:player_is_offline'] = "Il giocatore è offline",
        ['notify.fines:amount_is_too_small'] = "L'importo è troppo piccolo.",
        ['notify.fines:amount_is_too_much'] = "L'importo è troppo grande.",
        ['notify.fines:you_are_too_far_away'] = "Sei troppo lontano dalla persona",
    
        ['notify.fines:you_dont_have_fine'] = "Non hai un biglietto vuoto nel tuo inventario...",
        ['notify.fines:issuer_dont_have_fine'] = "L'emittente della multa non ha un biglietto vuoto nel suo inventario....",
        ['notify.fines:player_signs_fine'] = "Un cittadino firma una multa, non puoi più riprenderla da lui....",
        ['notify.fines:not_allowed_ticket'] = "Non sei autorizzato a scrivere una multa",
        ['notify.fines:rejected_fine'] = "Hai rifiutato questa multa.",
        ['notify.fines:player_rejected_fine'] = "Il cittadino %s, ha rifiutato la tua multa.",
        ['notify.fines:confirmed_fine'] = "Il cittadino %s ha accettato la multa.",
    
        ['notify.fines:you_dont_have_invoice'] = "Non hai una fattura vuota nel tuo inventario...",
        ['notify.fines:issuer_dont_have_invoice'] = "L'emittente della fattura non ha una fattura vuota nel suo inventario....",
        ['notify.fines:player_signs_invoice'] = "Un cittadino firma una fattura, non puoi più riprenderla da lui....",
        ['notify.fines:not_allowed_invoice'] = "Non sei autorizzato a scrivere una fattura",
        ['notify.fines:rejected_invoice'] = "Hai rifiutato questa fattura.",
        ['notify.fines:player_rejected_invoice'] = "Il cittadino %s, ha rifiutato la tua fattura.",
        ['notify.fines:confirmed_invoice'] = "Il cittadino %s ha accettato la fattura.",
    
        ['notify.fines:you_dont_have_terminal'] = "Non hai un terminale di pagamento",
        ['notify.fines:issuer_dont_have_terminal'] = "Il venditore non ha un terminale di pagamento...",
        ['notify.fines:you_dont_have_receipt'] = "Non hai carta termica...",
        ['notify.fines:issuer_dont_have_receipt'] = "Il venditore non ha carta termica...",
        ['notify.fines:player_signs_receipt'] = "Il cittadino prende la ricevuta, non può essere portata via da lui....",
        ['notify.fines:not_allowed_receipt'] = "Non puoi emettere la fattura",
        ['notify.fines:confirmed_receipt'] = "Il cittadino %s ha accettato la fattura.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Hai acquistato un veicolo %s per $%s",
        ['notify.agreement:you_sold_vehicle'] = "Hai venduto il veicolo %s per $%s",
        ['notify.agreement:transferred_vehicle_to_company'] = "Hai assegnato la proprietà del veicolo %s alla tua azienda.",
        ['notify.agreement:you_dont_have_item'] = "Non hai un contratto di vendita veicolo in inventario.",
        ['notify.agreement:seller_dont_have_item'] = "La persona dalla quale intendi acquistare il veicolo non ha un contratto di vendita veicolo in inventario.",
        ['notify.agreement:dont_have_any_vehicle'] = "Non possiedi alcun veicolo...",
        ['notify.agreement:model_is_not_allowed'] = "Questo modello di veicolo non può essere venduto.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Questo modello di veicolo non può essere trasferito alla tua azienda.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Questo periodo contabile è già stato risolto.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Durante questo periodo contabile, l'azienda non ha avuto alcun guadagno, non devi risolvere nulla.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "La tua azienda non ha abbastanza soldi per risolvere questo mese di tasse..",
        ['notify.business_taxes:tax_settled'] = "Hai pagato le tasse all'ufficio delle tasse.",
    
        ['notify.papers_menu:purchased'] = "Hai acquistato il documento %s per %s.",
        ['notify.papers_menu:taken'] = "Hai ricevuto il documento %s.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Non puoi farlo.",
        ['notify.clerk_employees:player_is_offline'] = "Non puoi farlo, il giocatore non è disponibile.",
        ['notify.clerk_employees:player_is_already_employed'] = "Questo giocatore è già un dipendente del Municipio.",
        ['notify.clerk_employees:player_is_not_employed'] = "Questo giocatore non è un dipendente in questa azienda.",
        ['notify.clerk_employees:must_be_unemployed'] = "Questo giocatore è già impiegato altrove.",
        ['notify.clerk_employees:you_employee_hired'] = "Un nuovo dipendente è stato assunto!",
        ['notify.clerk_employees:you_fired_employee'] = "Hai licenziato il dipendente.",
        ['notify.clerk_employees:awarded_bonus'] = "Hai assegnato un bonus di $%s a un dipendente.",
        ['notify.clerk_employees:received_bonus'] = "Hai ricevuto un bonus di $%s dal Municipio presso cui lavori.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Non hai l'autorità per dare bonus ai dipendenti.",
    
        ['notify.clerk_balance:withdraw'] = "Hai prelevato $%s dai fondi dell'azienda",
        ['notify.clerk_balance:deposit'] = "Hai depositato $%s nel caveau dell'azienda.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Non hai tutti quei soldi...",
        ['notify.clerk_balance:dont_have_that_money'] = "Il Municipio non ha tutti quei soldi...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Non puoi prelevare tale importo.",
        ['notify.cityhall_paychecks:paid_out'] = "Hai pagato $%s",
    
        ['notify.cityhall_jobs:joined'] = "Ti sei unito alla %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Questa multa è già stata pagata.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Hai pagato la multa $%s.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Questa fattura è già stata pagata.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Hai pagato la fattura $%s.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Questa ricevuta è già stata pagata.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Hai pagato $%s per la fattura.",
    
        ['notify.cityhall_taxes:already_paid_tax'] = "Questa tassa è già stata pagata.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Hai pagato la tassa $%s.",
    
        ['notify.cityhall_resume:already_sent'] = "Hai già inviato il tuo curriculum qui...",
        ['notify.cityhall_resume:successful_sent'] = "Hai inviato con successo un curriculum per un lavoro.",
        ['notify.cityhall_resume:accepted_resume'] = "Curriculum accettato del cittadino %s.",
        ['notify.cityhall_resume:declined_resume'] = "Curriculum rifiutato del cittadino %s.",
    
        ['notify.cityhall_documents:ordered'] = "Hai ordinato un %s.",
        ['notify.cityhall_documents:ordered_for'] = "Hai ordinato un %s per $%s.",
        ['notify.cityhall_documents:already_ordered'] = "Hai già ordinato questo documento...",
        ['notify.cityhall_documents:received'] = "Hai ricevuto il %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Non sei idoneo a richiedere questo documento.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Hai già un documento valido.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Questo numero di targa è già assegnato.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Hai acquistato l'assicurazione sanitaria per %s giorni per %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Hai esteso la tua assicurazione sanitaria di %s giorni per %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Hai acquistato l'assicurazione per il veicolo %s per %s giorni per %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Hai esteso l'assicurazione per il tuo veicolo %s di %s giorni per %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Acquisto del veicolo %s (%s)",
    
        ['phone.email:resume_title'] = "Domanda di Assunzione",
        ['phone.email:resume_accepted'] = "Ciao %s, congratulazioni, il tuo curriculum è stato accettato da %s, vai in ufficio per ulteriori informazioni sulla successiva assunzione.",
        ['phone.email:resume_rejected'] = "Ciao %s, purtroppo il tuo curriculum per %s è stato respinto...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Copia VIN"
    },
    ['CZ'] = {
        ['notify.wait'] = "Zkuste to znovu za chvíli...",
        ['notify.no_money'] = "Nemáte dost peněz...",
        ['notify.copied_value'] = "Zkopírováno %s.",
        ['notify.no_players_around'] = "Žádný občan v okolí...",
        ['notify.player_is_too_far_away'] = "Hráč je příliš daleko...",
        ['notify.you_dont_have_tablet'] = "Nemáte kancelářský stůl.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Nemáte povolení k použití.",
    
        ['notify.vin:does_not_have_a_vin'] = "Vozidlo nemá VIN číslo",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Nemáte povolení k použití.",
    
        ['notify.check_vin:vin_is_hidden'] = "VIN číslo vozidla %s, je skryté",
        ['notify.check_vin:vin_info'] = "VIN číslo vozidla %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Musíte být ve vozidle...",
        ['notify.hide_vin:must_be_driver'] = "Musíte být řidičem vozidla...",
        ['notify.hide_vin:vin_has_been_discovered'] = "VIN číslo bylo odhaleno",
        ['notify.hide_vin:vin_has_been_hidden'] = "VIN číslo bylo skryto",
    
        ['notify.fines:already_has_in_hand'] = "Občan již má dokument v ruce..",
        ['notify.fines:player_is_offline'] = "Hráč je offline",
        ['notify.fines:amount_is_too_small'] = "Částka je příliš malá.",
        ['notify.fines:amount_is_too_much'] = "Částka je příliš velká.",
        ['notify.fines:you_are_too_far_away'] = "Jste příliš daleko od osoby",
    
        ['notify.fines:you_dont_have_fine'] = "Nemáte prázdný pokutový lístek v inventáři...",
        ['notify.fines:issuer_dont_have_fine'] = "Vystavovatel pokutového lístku nemá prázdný pokutový lístek v inventáři....",
        ['notify.fines:player_signs_fine'] = "Občan podepsal pokutu, nemůžete mu ji odebrat....",
        ['notify.fines:not_allowed_ticket'] = "Nemáte povolení vystavit pokutu",
        ['notify.fines:rejected_fine'] = "Odmítl jste tuto pokutu.",
        ['notify.fines:player_rejected_fine'] = "Občan %s, odmítl vaši pokutu.",
        ['notify.fines:confirmed_fine'] = "Občan %s přijal pokutu.",
    
        ['notify.fines:you_dont_have_invoice'] = "Nemáte prázdnou fakturu v inventáři...",
        ['notify.fines:issuer_dont_have_invoice'] = "Vystavovatel faktury nemá prázdnou fakturu v inventáři....",
        ['notify.fines:player_signs_invoice'] = "Občan podepsal fakturu, nemůžete mu ji odebrat....",
        ['notify.fines:not_allowed_invoice'] = "Nemáte povolení vystavit fakturu",
        ['notify.fines:rejected_invoice'] = "Odmítl jste tuto fakturu.",
        ['notify.fines:player_rejected_invoice'] = "Občan %s, odmítl vaši fakturu.",
        ['notify.fines:confirmed_invoice'] = "Občan %s přijal fakturu.",
    
        ['notify.fines:you_dont_have_terminal'] = "Nemáte platební terminál",
        ['notify.fines:issuer_dont_have_terminal'] = "Prodejce nemá platební terminál...",
        ['notify.fines:you_dont_have_receipt'] = "Nemáte termální papír...",
        ['notify.fines:issuer_dont_have_receipt'] = "Prodejce nemá termální papír...",
        ['notify.fines:player_signs_receipt'] = "Občan přijímá účet, nemůže být jím zrušen....",
        ['notify.fines:not_allowed_receipt'] = "Nemůžete vystavovat účet",
        ['notify.fines:confirmed_receipt'] = "Občan %s přijal účet.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Zakoupili jste vozidlo %s za %s$",
        ['notify.agreement:you_sold_vehicle'] = "Prodali jste vozidlo %s za %s$",
        ['notify.agreement:transferred_vehicle_to_company'] = "Převedli jste vlastnictví vozidla %s na vaši firmu.",
        ['notify.agreement:you_dont_have_item'] = "Nemáte smlouvu o prodeji vozidla v inventáři.",
        ['notify.agreement:seller_dont_have_item'] = "Osoba, od které plánujete zakoupit vozidlo, nemá smlouvu o prodeji vozidla v inventáři.",
        ['notify.agreement:dont_have_any_vehicle'] = "Nemáte žádné vozidlo...",
        ['notify.agreement:model_is_not_allowed'] = "Tento model vozidla nelze prodat.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Tento model vozidla nelze převést do vaší firmy.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Tento účetní období je již uzavřené.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Během tohoto účetního období firma neměla žádné příjmy, nemáte co uzavřít.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Vaše firma nemá dost peněz k vyplacení daně za tento měsíc..",
        ['notify.business_taxes:tax_settled'] = "Zaplatili jste daň do finančního úřadu.",
    
        ['notify.papers_menu:purchased'] = "Koupili jste papír %s za %s.",
        ['notify.papers_menu:taken'] = "Obdrželi jste papír %s.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Nemůžete to udělat.",
        ['notify.clerk_employees:player_is_offline'] = "Nemůžete to udělat, hráč není dostupný.",
        ['notify.clerk_employees:player_is_already_employed'] = "Tento hráč je již zaměstnán na radnici.",
        ['notify.clerk_employees:player_is_not_employed'] = "Tento hráč není zaměstnán v tomto .",
        ['notify.clerk_employees:must_be_unemployed'] = "Tento hráč je již zaměstnán někde jinde.",
        ['notify.clerk_employees:you_employee_hired'] = "Byl najat nový zaměstnanec!",
        ['notify.clerk_employees:you_fired_employee'] = "Propustili jste zaměstnance.",
        ['notify.clerk_employees:awarded_bonus'] = "Udělili jste bonus ve výši $%s zaměstnanci.",
        ['notify.clerk_employees:received_bonus'] = "Obdrželi jste bonus ve výši $%s od radnice, kde pracujete.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Nemáte oprávnění udělovat zaměstnancům bonusy.",
    
        ['notify.clerk_balance:withdraw'] = "Vybrali jste $%s z prostředků společnosti",
        ['notify.clerk_balance:deposit'] = "Vložili jste $%s do trezoru společnosti.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Nemáte tolik peněz...",
        ['notify.clerk_balance:dont_have_that_money'] = "Radnice nemá tolik peněz...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Nemůžete vybrat takovou částku.",
        ['notify.cityhall_paychecks:paid_out'] = "Vyplatili jste $%s",
    
        ['notify.cityhall_jobs:joined'] = "Připojili jste se k %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Tato pokuta je již uhrazena.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Zaplatili jste pokutu ve výši $%s.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Tato faktura je již uhrazena.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Zaplatili jste fakturu ve výši $%s.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Tento účet je již zaplacen.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Zaplatili jste $%s za účet.",
    
        ['notify.cityhall_taxes:already_paid_tax'] = "Tato daň je již uhrazena.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Zaplatili jste daň ve výši $%s.",
    
        ['notify.cityhall_resume:already_sent'] = "Již jste odeslali svůj životopis sem...",
        ['notify.cityhall_resume:successful_sent'] = "Úspěšně jste odeslali životopis pro práci.",
        ['notify.cityhall_resume:accepted_resume'] = "Přijatý životopis občana %s.",
        ['notify.cityhall_resume:declined_resume'] = "Odmítnutý životopis občana %s.",
    
        ['notify.cityhall_documents:ordered'] = "Objednali jste %s.",
        ['notify.cityhall_documents:ordered_for'] = "Objednali jste %s za $%s.",
        ['notify.cityhall_documents:already_ordered'] = "Tento dokument již máte objednaný...",
        ['notify.cityhall_documents:received'] = "Obdrželi jste %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Nemáte oprávnění žádat o tento dokument.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Již máte platný dokument.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Tato registrační značka je již použita.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Zakoupili jste zdravotní pojištění na %s dní za %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Prodloužili jste si zdravotní pojištění o %s dní za %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Zakoupili jste pojištění pro vozidlo %s na %s dní za %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Prodloužili jste si pojištění pro vaše vozidlo %s o %s dní za %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Koupě vozidla %s (%s)",
    
        ['phone.email:resume_title'] = "Přihláška na zaměstnání",
        ['phone.email:resume_accepted'] = "Ahoj %s, gratulujeme, tvoje žádost o zaměstnání byla přijata v %s, zajdi do kanceláře pro více informací o dalším náboru.",
        ['phone.email:resume_rejected'] = "Ahoj %s, bohužel, tvoje žádost o zaměstnání v %s byla zamítnuta...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Kopírovat VIN"
    },
    ['SV'] = {
        ['notify.wait'] = "Försök igen om en stund...",
        ['notify.no_money'] = "Du har inte tillräckligt med pengar...",
        ['notify.copied_value'] = "Kopierade %s.",
        ['notify.no_players_around'] = "Ingen medborgare i närheten...",
        ['notify.player_is_too_far_away'] = "Spelaren är för långt bort...",
        ['notify.you_dont_have_tablet'] = "Har inte en kontorsplatta.",
    
        ['notify.check_health_insurance:you_are_not_allowed_to_use_it'] = "Du har inte tillåtelse att använda den.",
    
        ['notify.vin:does_not_have_a_vin'] = "Fordonet har inte ett VIN-nummer",
    
        ['notify.info_vin:you_are_not_allowed_to_use_it'] = "Du har inte tillåtelse att använda den.",
    
        ['notify.check_vin:vin_is_hidden'] = "VIN-numret i fordon %s är dolt",
        ['notify.check_vin:vin_info'] = "Fordons VIN-nummer %s - %s",
    
        ['notify.hide_vin:must_be_in_vehicle'] = "Du måste vara i ett fordon...",
        ['notify.hide_vin:must_be_driver'] = "Du måste vara föraren av fordonet...",
        ['notify.hide_vin:vin_has_been_discovered'] = "VIN-numret har upptäckts",
        ['notify.hide_vin:vin_has_been_hidden'] = "VIN-numret har dolt",
    
        ['notify.fines:already_has_in_hand'] = "Medborgaren har redan dokumentet i handen..",
        ['notify.fines:player_is_offline'] = "Spelaren är offline",
        ['notify.fines:amount_is_too_small'] = "Beloppet är för litet.",
        ['notify.fines:amount_is_too_much'] = "Beloppet är för stort.",
        ['notify.fines:you_are_too_far_away'] = "Du är för långt bort från personen",
    
        ['notify.fines:you_dont_have_fine'] = "Du har inte en tom biljett i ditt inventarium...",
        ['notify.fines:issuer_dont_have_fine'] = "Utsändaren av biljetten har inte en tom biljett i sitt inventarium....",
        ['notify.fines:player_signs_fine'] = "En medborgare signerar en böter, du kan inte ta bort den från honom....",
        ['notify.fines:not_allowed_ticket'] = "Du har inte tillåtelse att skriva en biljett",
        ['notify.fines:rejected_fine'] = "Du har avvisat denna böter.",
        ['notify.fines:player_rejected_fine'] = "Medborgaren %s, avvisade din böter.",
        ['notify.fines:confirmed_fine'] = "Medborgaren %s godkände böterna.",
    
        ['notify.fines:you_dont_have_invoice'] = "Du har inte en tom faktura i ditt inventarium...",
        ['notify.fines:issuer_dont_have_invoice'] = "Utsändaren av fakturan har inte en tom faktura i sitt inventarium....",
        ['notify.fines:player_signs_invoice'] = "En medborgare signerar en faktura, du kan inte ta bort den från honom....",
        ['notify.fines:not_allowed_invoice'] = "Du har inte tillåtelse att skriva en faktura",
        ['notify.fines:rejected_invoice'] = "Du har avvisat denna faktura.",
        ['notify.fines:player_rejected_invoice'] = "Medborgaren %s, avvisade din faktura.",
        ['notify.fines:confirmed_invoice'] = "Medborgaren %s godkände fakturan.",
    
        ['notify.fines:you_dont_have_terminal'] = "Du har ingen betalningsterminal",
        ['notify.fines:issuer_dont_have_terminal'] = "Säljaren har ingen betalningsterminal...",
        ['notify.fines:you_dont_have_receipt'] = "Du har inget termiskt papper...",
        ['notify.fines:issuer_dont_have_receipt'] = "Säljaren har inget termiskt papper...",
        ['notify.fines:player_signs_receipt'] = "Medborgaren tar emot fakturan, den kan inte tas tillbaka från hen...",
        ['notify.fines:not_allowed_receipt'] = "Du kan inte fakturera",
        ['notify.fines:confirmed_receipt'] = "Medborgare %s accepterade fakturan.",
    
        ['notify.agreement:you_purchased_vehicle'] = "Du köpte ett fordon %s för $%s",
        ['notify.agreement:you_sold_vehicle'] = "Du sålde fordonet %s för $%s",
        ['notify.agreement:transferred_vehicle_to_company'] = "Du har tilldelat äganderätten av fordon %s till ditt företag.",
        ['notify.agreement:you_dont_have_item'] = "Du har inte ett fordonssäljningsavtal i inventariet.",
        ['notify.agreement:seller_dont_have_item'] = "Personen från vilken du planerar att köpa fordonet har inte ett fordonssäljningsavtal i inventariet.",
        ['notify.agreement:dont_have_any_vehicle'] = "Du äger inga fordon...",
        ['notify.agreement:model_is_not_allowed'] = "Denna fordonstyp kan inte säljas.",
        ['notify.agreement:model_is_not_allowed_for_company'] = "Denna fordonstyp kan inte överföras till ditt företag.",
    
        ['notify.business_taxes:period_is_already_settled'] = "Denna redovisningsperiod är redan avklarad.",
        ['notify.business_taxes:company_did_not_earn_any_revenue'] = "Under denna redovisningsperiod hade företaget ingen inkomst, du har inget att avklara.",
        ['notify.business_taxes:doesnt_have_enough_money'] = "Ditt företag har inte tillräckligt med pengar för att avsluta denna skattemånad..",
        ['notify.business_taxes:tax_settled'] = "Du har betalat skatt till skatteverket.",
    
        ['notify.papers_menu:purchased'] = "Du köpte pappret %s för %s.",
        ['notify.papers_menu:taken'] = "Du fick %s papper.",
    
        ['notify.clerk_employees:you_are_not_allowed'] = "Du kan inte göra det.",
        ['notify.clerk_employees:player_is_offline'] = "Du kan inte göra det, spelaren är inte tillgänglig.",
        ['notify.clerk_employees:player_is_already_employed'] = "Denna spelare är redan anställd på Stadshuset.",
        ['notify.clerk_employees:player_is_not_employed'] = "Denna spelare är inte anställd här.",
        ['notify.clerk_employees:must_be_unemployed'] = "Denna spelare är redan anställd någon annanstans.",
        ['notify.clerk_employees:you_employee_hired'] = "En ny anställd har anställts!",
        ['notify.clerk_employees:you_fired_employee'] = "Du avskedade en anställd.",
        ['notify.clerk_employees:awarded_bonus'] = "Du tilldelade en $%s bonus till en anställd.",
        ['notify.clerk_employees:received_bonus'] = "Mottog en bonus på $%s från Stadshuset där du arbetar.",
        ['notify.clerk_employees:you_are_not_allowed_to_bonus'] = "Du har inte behörighet att ge bonus till anställda.",
    
        ['notify.clerk_balance:withdraw'] = "Du tog ut $%s från företagets fonder",
        ['notify.clerk_balance:deposit'] = "Du har satt in $%s i företagets kassaskåp.",
        ['notify.clerk_balance:you_dont_have_that_money'] = "Du har inte så mycket pengar...",
        ['notify.clerk_balance:dont_have_that_money'] = "Stadshuset har inte så mycket pengar...",
    
        ['notify.cityhall_paychecks:you_cannot_withdraw_that_much'] = "Du kan inte ta ut så mycket.",
        ['notify.cityhall_paychecks:paid_out'] = "Du betalade ut $%s",
    
        ['notify.cityhall_jobs:joined'] = "Du har anslutit dig till %s.",
    
        ['notify.cityhall_fines:already_paid_fine'] = "Denna böter är redan betald.",
        ['notify.cityhall_fines:you_paid_the_fine'] = "Du betalade böterna $%s.",
    
        ['notify.cityhall_fines:already_paid_invoice'] = "Denna faktura är redan betald.",
        ['notify.cityhall_fines:you_paid_the_invoice'] = "Du betalade fakturan $%s.",
    
        ['notify.cityhall_fines:already_paid_receipt'] = "Denna faktura är redan betald.",
        ['notify.cityhall_fines:you_paid_the_receipt'] = "Du betalade $%s för fakturan.",
    
        ['notify.cityhall_taxes:already_paid_tax'] = "Denna skatt är redan betald.",
        ['notify.cityhall_taxes:you_paid_the_tax'] = "Du betalade skatten $%s.",
    
        ['notify.cityhall_resume:already_sent'] = "Du har redan skickat ditt CV hit...",
        ['notify.cityhall_resume:successful_sent'] = "Du har framgångsrikt skickat in ett CV för en tjänst.",
        ['notify.cityhall_resume:accepted_resume'] = "Godkänt CV för medborgare %s.",
        ['notify.cityhall_resume:declined_resume'] = "Avvisat CV för medborgare %s.",
    
        ['notify.cityhall_documents:ordered'] = "Du har beställt en %s.",
        ['notify.cityhall_documents:ordered_for'] = "Du har beställt en %s för $%s.",
        ['notify.cityhall_documents:already_ordered'] = "Du har redan beställt detta dokument...",
        ['notify.cityhall_documents:received'] = "Du har mottagit %s.",
        ['notify.cityhall_documents:you_dont_have_required_job'] = "Du är inte behörig att ansöka om detta dokument.",
        ['notify.cityhall_documents:you_already_have_valid_document'] = "Du har redan ett giltigt dokument.",
        ['notify.cityhall_documents:this_plate_is_already_taken'] = "Denna registreringsskylt är redan tagen.",
    
        ['notify.cityhall_healthinsurance:purchased'] = "Du har köpt sjukförsäkring i %s dagar för %s$.",
        ['notify.cityhall_healthinsurance:renewed'] = "Du har förlängt din sjukförsäkring med %s dagar för %s$.",
    
        ['notify.cityhall_vehicleinsurance:purchased'] = "Du har köpt försäkring för fordon %s i %s dagar för %s$.",
        ['notify.cityhall_vehicleinsurance:renewed'] = "Du har förlängt försäkringen för ditt fordon %s med %s dagar för %s$.",
    
        ['tax.title:gains.vehicleexcise'] = "Fordonsköp %s (%s)",
    
        ['phone.email:resume_title'] = "Anställningsansökan",
        ['phone.email:resume_accepted'] = "Hej %s, gratulerar, din ansökan har blivit godkänd för %s, gå till kontoret för mer information om vidare rekrytering.",
        ['phone.email:resume_rejected'] = "Hej %s, tyvärr blev din ansökan till %s avvisad...",
    
        ['target.info_vin'] = "VIN Menu",
        ['target.check_vin'] = "Check VIN",
    
        ['3dtext.copy_vin'] = "~y~[ E ]~s~ Kopiera VIN"
    }
}

TRANSLATE = function(name, ...)
    if Config.Translate[Config.Language] then
        if ... then
            return Config.Translate[Config.Language][name]:format(...)
        else
            return Config.Translate[Config.Language][name]
        end
    else
        if ... then
            return Config.Translate['EN'][name]:format(...)
        else
            return Config.Translate['EN'][name]
        end
    end
end
