-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄
Config.Language = 'EN' -- EN / DE / FR / ES / PT / NL / PL / IT / CZ / SV

Config.Translate = {
    ['EN'] = {
        ['open_menu'] = "Press ~INPUT_CONTEXT~ to open the menu",
        ['menu.title'] = "Select Exam Type",
        ['menu.theory_helicopter'] = "Theory Helicopter (%s$)",
        ['menu.practical_helicopter'] = "Practical Helicopter (%s$)",
        ['menu.theory_plane'] = "Theory Plane (%s$)",
        ['menu.practical_plane'] = "Practical Plane (%s$)",
    
        ['vehicle_was_damaged'] = "The vehicle was damaged (%s/%s)",
        ['exceeded_error_limit'] = "You've exceeded the error limit, you need to go back to flight school.",
        ['started_practical'] = "You have started the practical exam, follow the examiners instructions.",
        ['complete_practical'] = "Press ~INPUT_CONTEXT~ to complete the practical exam.",
    
        ['success_practical'] = "Congratulations, you have obtained license.",
        ['failed_practical'] = "Unfortunately, you failed to obtain a license.",
    
        ['the_start_area_is_occupied'] = "The start area is occupied.", -- Config.CheckIsStartAreaIsOccupied
    
        ['not_enough_cash'] = "You don't have enough cash for this exam",
        ['not_enough_cash_and_bank'] = "You do not have enough cash and money in your bank account for this exam",
    
    
        ['3dtext.checking_left_wheel'] = "You're checking condition of left wheel...",
        ['3dtext.checking_right_wheel'] = "You're checking condition of right wheel...",
        ['3dtext.checking_left_engine'] = "You're checking condition of left engine...",
        ['3dtext.checking_right_engine'] = "You're checking condition of right engine...",
        ['3dtext.refuelling_the_plane'] = "You're refuelling the plane...",
    
        ['help.check_left_wheel'] = "Press ~INPUT_CONTEXT~ to check left wheel",
        ['notify.checked_left_wheel'] = "You've checked the left wheel.",
        ['help.check_right_wheel'] = "Press ~INPUT_CONTEXT~ to check right wheel",
        ['notify.checked_right_wheel'] = "You've checked the right wheel.",
        ['help.check_left_engine'] = "Press ~INPUT_CONTEXT~ to check left engine",
        ['notify.checked_left_engine'] = "You've checked the left engine",
        ['help.check_right_engine'] = "Press ~INPUT_CONTEXT~ to check right engine",
        ['notify.checked_right_engine'] = "You've checked the right engine",
        ['notify.vehicle_is_damaged'] = "The vehicle is damaged, you need to repair it.",
        ['help.refuel_the_plane'] = "Press ~INPUT_CONTEXT~ to refuel the plane",
        ['notify.refuelled_the_plane'] = "You have refueled the plane.",
    },
    ['DE'] = {
        ['open_menu'] = "Drücke ~INPUT_CONTEXT~, um das Menü zu öffnen",
        ['menu.title'] = "Wähle Prüfungsart",
        ['menu.theory_helicopter'] = "Theorie Hubschrauber (%s$)",
        ['menu.practical_helicopter'] = "Praxis Hubschrauber (%s$)",
        ['menu.theory_plane'] = "Theorie Flugzeug (%s$)",
        ['menu.practical_plane'] = "Praxis Flugzeug (%s$)",

        ['vehicle_was_damaged'] = "Das Fahrzeug wurde beschädigt (%s/%s)",
        ['exceeded_error_limit'] = "Du hast das Fehlerlimit überschritten, du musst zurück zur Flugschule.",
        ['started_practical'] = "Du hast mit der praktischen Prüfung begonnen, folge den Anweisungen des Prüfers.",
        ['complete_practical'] = "Drücke ~INPUT_CONTEXT~, um die praktische Prüfung abzuschließen.",

        ['success_practical'] = "Herzlichen Glückwunsch, du hast den Führerschein erhalten.",
        ['failed_practical'] = "Leider hast du es nicht geschafft, den Führerschein zu erhalten.",

        ['the_start_area_is_occupied'] = "Der Startbereich ist besetzt.",

        ['not_enough_cash'] = "Du hast nicht genug Bargeld für diese Prüfung",
        ['not_enough_cash_and_bank'] = "Du hast nicht genug Bargeld und Geld auf deinem Bankkonto für diese Prüfung.",

        ['3dtext.checking_left_wheel'] = "Du überprüfst den Zustand des linken Rades...",
        ['3dtext.checking_right_wheel'] = "Du überprüfst den Zustand des rechten Rades...",
        ['3dtext.checking_left_engine'] = "Du überprüfst den Zustand des linken Motors...",
        ['3dtext.checking_right_engine'] = "Du überprüfst den Zustand des rechten Motors...",
        ['3dtext.refuelling_the_plane'] = "Du betankst das Flugzeug...",

        ['help.check_left_wheel'] = "Drücke ~INPUT_CONTEXT~, um das linke Rad zu überprüfen",
        ['notify.checked_left_wheel'] = "Du hast das linke Rad überprüft.",
        ['help.check_right_wheel'] = "Drücke ~INPUT_CONTEXT~, um das rechte Rad zu überprüfen",
        ['notify.checked_right_wheel'] = "Du hast das rechte Rad überprüft.",
        ['help.check_left_engine'] = "Drücke ~INPUT_CONTEXT~, um den linken Motor zu überprüfen",
        ['notify.checked_left_engine'] = "Du hast den linken Motor überprüft",
        ['help.check_right_engine'] = "Drücke ~INPUT_CONTEXT~, um den rechten Motor zu überprüfen",
        ['notify.checked_right_engine'] = "Du hast den rechten Motor überprüft",
        ['notify.vehicle_is_damaged'] = "Das Fahrzeug ist beschädigt, du musst es reparieren.",
        ['help.refuel_the_plane'] = "Drücke ~INPUT_CONTEXT~, um das Flugzeug zu betanken",
        ['notify.refuelled_the_plane'] = "Du hast das Flugzeug betankt.",
    },
    ['FR'] = {
        ['open_menu'] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu",
        ['menu.title'] = "Sélectionnez le type d'examen",
        ['menu.theory_helicopter'] = "Théorie Hélicoptère (%s$)",
        ['menu.practical_helicopter'] = "Pratique Hélicoptère (%s$)",
        ['menu.theory_plane'] = "Théorie Avion (%s$)",
        ['menu.practical_plane'] = "Pratique Avion (%s$)",

        ['vehicle_was_damaged'] = "Le véhicule a été endommagé (%s/%s)",
        ['exceeded_error_limit'] = "Vous avez dépassé la limite d'erreurs, vous devez retourner à l'école de pilotage.",
        ['started_practical'] = "Vous avez commencé l'examen pratique, suivez les instructions de l'examinateur.",
        ['complete_practical'] = "Appuyez sur ~INPUT_CONTEXT~ pour terminer l'examen pratique.",

        ['success_practical'] = "Félicitations, vous avez obtenu votre licence.",
        ['failed_practical'] = "Malheureusement, vous n'avez pas réussi à obtenir votre licence.",

        ['the_start_area_is_occupied'] = "La zone de départ est occupée.",

        ['not_enough_cash'] = "Vous n'avez pas assez d'argent pour cet examen",
        ['not_enough_cash_and_bank'] = "Vous n'avez pas assez d'argent en espèces et sur votre compte en banque pour cet examen",


        ['3dtext.checking_left_wheel'] = "Vous vérifiez l'état de la roue gauche...",
        ['3dtext.checking_right_wheel'] = "Vous vérifiez l'état de la roue droite...",
        ['3dtext.checking_left_engine'] = "Vous vérifiez l'état du moteur gauche...",
        ['3dtext.checking_right_engine'] = "Vous vérifiez l'état du moteur droit...",
        ['3dtext.refuelling_the_plane'] = "Vous êtes en train de ravitailler l'avion...",

        ['help.check_left_wheel'] = "Appuyez sur ~INPUT_CONTEXT~ pour vérifier la roue gauche",
        ['notify.checked_left_wheel'] = "Vous avez vérifié la roue gauche.",
        ['help.check_right_wheel'] = "Appuyez sur ~INPUT_CONTEXT~ pour vérifier la roue droite",
        ['notify.checked_right_wheel'] = "Vous avez vérifié la roue droite.",
        ['help.check_left_engine'] = "Appuyez sur ~INPUT_CONTEXT~ pour vérifier le moteur gauche",
        ['notify.checked_left_engine'] = "Vous avez vérifié le moteur gauche",
        ['help.check_right_engine'] = "Appuyez sur ~INPUT_CONTEXT~ pour vérifier le moteur droit",
        ['notify.checked_right_engine'] = "Vous avez vérifié le moteur droit",
        ['notify.vehicle_is_damaged'] = "Le véhicule est endommagé, vous devez le réparer.",
        ['help.refuel_the_plane'] = "Appuyez sur ~INPUT_CONTEXT~ pour ravitailler l'avion",
        ['notify.refuelled_the_plane'] = "Vous avez ravitaillé l'avion.",
    },
    ['ES'] = {
        ['open_menu'] = "Presiona ~INPUT_CONTEXT~ para abrir el menú",
        ['menu.title'] = "Selecciona Tipo de Examen",
        ['menu.theory_helicopter'] = "Teórico Helicóptero (%s$)",
        ['menu.practical_helicopter'] = "Práctico Helicóptero (%s$)",
        ['menu.theory_plane'] = "Teórico Avión (%s$)",
        ['menu.practical_plane'] = "Práctico Avión (%s$)",

        ['vehicle_was_damaged'] = "El vehículo fue dañado (%s/%s)",
        ['exceeded_error_limit'] = "Has excedido el límite de errores, necesitas volver a la escuela de vuelo.",
        ['started_practical'] = "Has iniciado el examen práctico, sigue las instrucciones del examinador.",
        ['complete_practical'] = "Presiona ~INPUT_CONTEXT~ para completar el examen práctico.",

        ['success_practical'] = "Felicidades, has obtenido la licencia.",
        ['failed_practical'] = "Desafortunadamente, fallaste en obtener la licencia.",

        ['the_start_area_is_occupied'] = "El área de inicio está ocupada.",

        ['not_enough_cash'] = "No tienes suficiente dinero en efectivo para este examen",
        ['not_enough_cash_and_bank'] = "No tienes suficiente dinero en efectivo y en tu cuenta bancaria para este examen",


        ['3dtext.checking_left_wheel'] = "Estás revisando la condición de la rueda izquierda...",
        ['3dtext.checking_right_wheel'] = "Estás revisando la condición de la rueda derecha...",
        ['3dtext.checking_left_engine'] = "Estás revisando la condición del motor izquierdo...",
        ['3dtext.checking_right_engine'] = "Estás revisando la condición del motor derecho...",
        ['3dtext.refuelling_the_plane'] = "Estás repostando el avión...",

        ['help.check_left_wheel'] = "Presiona ~INPUT_CONTEXT~ para revisar la rueda izquierda",
        ['notify.checked_left_wheel'] = "Has revisado la rueda izquierda.",
        ['help.check_right_wheel'] = "Presiona ~INPUT_CONTEXT~ para revisar la rueda derecha",
        ['notify.checked_right_wheel'] = "Has revisado la rueda derecha.",
        ['help.check_left_engine'] = "Presiona ~INPUT_CONTEXT~ para revisar el motor izquierdo",
        ['notify.checked_left_engine'] = "Has revisado el motor izquierdo",
        ['help.check_right_engine'] = "Presiona ~INPUT_CONTEXT~ para revisar el motor derecho",
        ['notify.checked_right_engine'] = "Has revisado el motor derecho",
        ['notify.vehicle_is_damaged'] = "El vehículo está dañado, necesitas repararlo.",
        ['help.refuel_the_plane'] = "Presiona ~INPUT_CONTEXT~ para repostar el avión",
        ['notify.refuelled_the_plane'] = "Has repostado el avión.",
    },
    ['PT'] = {
        ['open_menu'] = "Pressione ~INPUT_CONTEXT~ para abrir o menu",
        ['menu.title'] = "Selecione o Tipo de Exame",
        ['menu.theory_helicopter'] = "Teoria Helicóptero (%s$)",
        ['menu.practical_helicopter'] = "Prático Helicóptero (%s$)",
        ['menu.theory_plane'] = "Teoria Avião (%s$)",
        ['menu.practical_plane'] = "Prático Avião (%s$)",

        ['vehicle_was_damaged'] = "O veículo foi danificado (%s/%s)",
        ['exceeded_error_limit'] = "Você excedeu o limite de erros, você precisa voltar para a escola de voo.",
        ['started_practical'] = "Você começou o exame prático, siga as instruções dos examinadores.",
        ['complete_practical'] = "Pressione ~INPUT_CONTEXT~ para completar o exame prático.",

        ['success_practical'] = "Parabéns, você obteve a licença.",
        ['failed_practical'] = "Infelizmente, você falhou em obter a licença.",

        ['the_start_area_is_occupied'] = "A área de partida está ocupada.",

        ['not_enough_cash'] = "Você não tem dinheiro suficiente para este exame",
        ['not_enough_cash_and_bank'] = "Você não tem dinheiro suficiente e dinheiro na conta bancária para este exame",


        ['3dtext.checking_left_wheel'] = "Você está verificando a condição da roda esquerda...",
        ['3dtext.checking_right_wheel'] = "Você está verificando a condição da roda direita...",
        ['3dtext.checking_left_engine'] = "Você está verificando a condição do motor esquerdo...",
        ['3dtext.checking_right_engine'] = "Você está verificando a condição do motor direito...",
        ['3dtext.refuelling_the_plane'] = "Você está abastecendo o avião...",

        ['help.check_left_wheel'] = "Pressione ~INPUT_CONTEXT~ para verificar a roda esquerda",
        ['notify.checked_left_wheel'] = "Você verificou a roda esquerda.",
        ['help.check_right_wheel'] = "Pressione ~INPUT_CONTEXT~ para verificar a roda direita",
        ['notify.checked_right_wheel'] = "Você verificou a roda direita.",
        ['help.check_left_engine'] = "Pressione ~INPUT_CONTEXT~ para verificar o motor esquerdo",
        ['notify.checked_left_engine'] = "Você verificou o motor esquerdo",
        ['help.check_right_engine'] = "Pressione ~INPUT_CONTEXT~ para verificar o motor direito",
        ['notify.checked_right_engine'] = "Você verificou o motor direito",
        ['notify.vehicle_is_damaged'] = "O veículo está danificado, você precisa consertá-lo.",
        ['help.refuel_the_plane'] = "Pressione ~INPUT_CONTEXT~ para abastecer o avião",
        ['notify.refuelled_the_plane'] = "Você abasteceu o avião.",
    },
    ['NL'] = {
        ['open_menu'] = "Druk op ~INPUT_CONTEXT~ om het menu te openen",
        ['menu.title'] = "Kies Examen Type",
        ['menu.theory_helicopter'] = "Theorie Helikopter (%s$)",
        ['menu.practical_helicopter'] = "Praktijk Helikopter (%s$)",
        ['menu.theory_plane'] = "Theorie Vliegtuig (%s$)",
        ['menu.practical_plane'] = "Praktijk Vliegtuig (%s$)",

        ['vehicle_was_damaged'] = "Het voertuig is beschadigd (%s/%s)",
        ['exceeded_error_limit'] = "Je hebt de foutlimiet overschreden, je moet terug naar vliegschool.",
        ['started_practical'] = "Je bent begonnen aan het praktijkexamen, volg de instructies van de examinator.",
        ['complete_practical'] = "Druk op ~INPUT_CONTEXT~ om het praktijkexamen te voltooien.",

        ['success_practical'] = "Gefeliciteerd, je hebt je licentie behaald.",
        ['failed_practical'] = "Helaas, je bent niet geslaagd voor je licentie.",

        ['the_start_area_is_occupied'] = "Het startgebied is bezet.",

        ['not_enough_cash'] = "Je hebt niet genoeg geld voor dit examen",
        ['not_enough_cash_and_bank'] = "Je hebt niet genoeg geld en geld op je bankrekening voor dit examen.",

        ['3dtext.checking_left_wheel'] = "Je controleert de linker wielconditie...",
        ['3dtext.checking_right_wheel'] = "Je controleert de rechter wielconditie...",
        ['3dtext.checking_left_engine'] = "Je controleert de linker motorconditie...",
        ['3dtext.checking_right_engine'] = "Je controleert de rechter motorconditie...",
        ['3dtext.refuelling_the_plane'] = "Je bent het vliegtuig aan het bijtanken...",

        ['help.check_left_wheel'] = "Druk op ~INPUT_CONTEXT~ om de linker wiel te controleren",
        ['notify.checked_left_wheel'] = "Je hebt de linker wiel gecontroleerd.",
        ['help.check_right_wheel'] = "Druk op ~INPUT_CONTEXT~ om de rechter wiel te controleren",
        ['notify.checked_right_wheel'] = "Je hebt de rechter wiel gecontroleerd.",
        ['help.check_left_engine'] = "Druk op ~INPUT_CONTEXT~ om de linker motor te controleren",
        ['notify.checked_left_engine'] = "Je hebt de linker motor gecontroleerd",
        ['help.check_right_engine'] = "Druk op ~INPUT_CONTEXT~ om de rechter motor te controleren",
        ['notify.checked_right_engine'] = "Je hebt de rechter motor gecontroleerd",
        ['notify.vehicle_is_damaged'] = "Het voertuig is beschadigd, je moet het repareren.",
        ['help.refuel_the_plane'] = "Druk op ~INPUT_CONTEXT~ om het vliegtuig bij te tanken",
        ['notify.refuelled_the_plane'] = "Je hebt het vliegtuig bijgetankt.",
    },
    ['PL'] = {
        ['open_menu'] = "Naciśnij ~INPUT_CONTEXT~, aby otworzyć menu",
        ['menu.title'] = "Wybierz typ egzaminu",
        ['menu.theory_helicopter'] = "Teoria na śmigłowciec (%s$)",
        ['menu.practical_helicopter'] = "Praktyka na śmigłowciec (%s$)",
        ['menu.theory_plane'] = "Teoria na samolot (%s$)",
        ['menu.practical_plane'] = "Praktyka na samolot (%s$)",

        ['vehicle_was_damaged'] = "Pojazd został uszkodzony (%s/%s)",
        ['exceeded_error_limit'] = "Przekroczyłeś limit błędów, musisz wrócić do szkoły lotniczej.",
        ['started_practical'] = "Rozpocząłeś egzamin praktyczny, postępuj zgodnie z instrukcjami egzaminatora.",
        ['complete_practical'] = "Naciśnij ~INPUT_CONTEXT~, aby zakończyć egzamin praktyczny.",

        ['success_practical'] = "Gratulacje, uzyskałeś licencję.",
        ['failed_practical'] = "Niestety nie udało ci się uzyskać licencji.",

        ['the_start_area_is_occupied'] = "Obszar startowy jest zajęty.",

        ['not_enough_cash'] = "Nie masz wystarczająco gotówki na ten egzamin",
        ['not_enough_cash_and_bank'] = "Nie masz wystarczająco gotówki ani środków na koncie bankowym na ten egzamin.",

        ['3dtext.checking_left_wheel'] = "Sprawdzasz stan lewego koła...",
        ['3dtext.checking_right_wheel'] = "Sprawdzasz stan prawej koła...",
        ['3dtext.checking_left_engine'] = "Sprawdzasz stan lewego silnika...",
        ['3dtext.checking_right_engine'] = "Sprawdzasz stan prawego silnika...",
        ['3dtext.refuelling_the_plane'] = "Tankujesz samolot...",

        ['help.check_left_wheel'] = "Naciśnij ~INPUT_CONTEXT~, aby sprawdzić lewe koło",
        ['notify.checked_left_wheel'] = "Sprawdziłeś lewe koło.",
        ['help.check_right_wheel'] = "Naciśnij ~INPUT_CONTEXT~, aby sprawdzić prawe koło",
        ['notify.checked_right_wheel'] = "Sprawdziłeś prawe koło.",
        ['help.check_left_engine'] = "Naciśnij ~INPUT_CONTEXT~, aby sprawdzić lewy silnik",
        ['notify.checked_left_engine'] = "Sprawdziłeś lewy silnik",
        ['help.check_right_engine'] = "Naciśnij ~INPUT_CONTEXT~, aby sprawdzić prawy silnik",
        ['notify.checked_right_engine'] = "Sprawdziłeś prawy silnik",
        ['notify.vehicle_is_damaged'] = "Pojazd jest uszkodzony, musisz go naprawić.",
        ['help.refuel_the_plane'] = "Naciśnij ~INPUT_CONTEXT~, aby zatankować samolot",
        ['notify.refuelled_the_plane'] = "Zatankowałeś samolot.",
    },
    ['IT'] = {
        ['open_menu'] = "Premi ~INPUT_CONTEXT~ per aprire il menu",
        ['menu.title'] = "Seleziona il tipo di esame",
        ['menu.theory_helicopter'] = "Teoria Elicottero (%s$)",
        ['menu.practical_helicopter'] = "Pratica Elicottero (%s$)",
        ['menu.theory_plane'] = "Teoria Aereo (%s$)",
        ['menu.practical_plane'] = "Pratica Aereo (%s$)",

        ['vehicle_was_damaged'] = "Il veicolo è stato danneggiato (%s/%s)",
        ['exceeded_error_limit'] = "Hai superato il limite di errori, devi tornare alla scuola di volo.",
        ['started_practical'] = "Hai iniziato l'esame pratico, segui le istruzioni degli esaminatori.",
        ['complete_practical'] = "Premi ~INPUT_CONTEXT~ per completare l'esame pratico.",

        ['success_practical'] = "Congratulazioni, hai ottenuto la licenza.",
        ['failed_practical'] = "Purtroppo, non sei riuscito a ottenere la licenza.",

        ['the_start_area_is_occupied'] = "L'area di partenza è occupata.",

        ['not_enough_cash'] = "Non hai abbastanza denaro per questo esame",
        ['not_enough_cash_and_bank'] = "Non hai abbastanza denaro e denaro nel tuo conto in banca per questo esame",


        ['3dtext.checking_left_wheel'] = "Stai controllando la condizione della ruota sinistra...",
        ['3dtext.checking_right_wheel'] = "Stai controllando la condizione della ruota destra...",
        ['3dtext.checking_left_engine'] = "Stai controllando la condizione del motore sinistro...",
        ['3dtext.checking_right_engine'] = "Stai controllando la condizione del motore destro...",
        ['3dtext.refuelling_the_plane'] = "Stai rifornendo l'aereo...",

        ['help.check_left_wheel'] = "Premi ~INPUT_CONTEXT~ per controllare la ruota sinistra",
        ['notify.checked_left_wheel'] = "Hai controllato la ruota sinistra.",
        ['help.check_right_wheel'] = "Premi ~INPUT_CONTEXT~ per controllare la ruota destra",
        ['notify.checked_right_wheel'] = "Hai controllato la ruota destra.",
        ['help.check_left_engine'] = "Premi ~INPUT_CONTEXT~ per controllare il motore sinistro",
        ['notify.checked_left_engine'] = "Hai controllato il motore sinistro",
        ['help.check_right_engine'] = "Premi ~INPUT_CONTEXT~ per controllare il motore destro",
        ['notify.checked_right_engine'] = "Hai controllato il motore destro",
        ['notify.vehicle_is_damaged'] = "Il veicolo è danneggiato, devi ripararlo.",
        ['help.refuel_the_plane'] = "Premi ~INPUT_CONTEXT~ per rifornire l'aereo",
        ['notify.refuelled_the_plane'] = "Hai rifornito l'aereo.",
    },
    ['CZ'] = {
        ['open_menu'] = "Stiskněte ~INPUT_CONTEXT~, abyste otevřeli menu",
        ['menu.title'] = "Vyberte typ zkoušky",
        ['menu.theory_helicopter'] = "Teorie Vrtulník (%s$)",
        ['menu.practical_helicopter'] = "Praktický Vrtulník (%s$)",
        ['menu.theory_plane'] = "Teorie Letadlo (%s$)",
        ['menu.practical_plane'] = "Praktický Letadlo (%s$)",

        ['vehicle_was_damaged'] = "Vozidlo bylo poškozeno (%s/%s)",
        ['exceeded_error_limit'] = "Překročili jste povolený počet chyb, musíte se vrátit do letecké školy.",
        ['started_practical'] = "Zahájili jste praktickou zkoušku, postupujte podle pokynů zkoušejícího.",
        ['complete_practical'] = "Stiskněte ~INPUT_CONTEXT~, abyste dokončili praktickou zkoušku.",

        ['success_practical'] = "Gratulujeme, získali jste licenci.",
        ['failed_practical'] = "Bohužel se vám nepodařilo získat licenci.",

        ['the_start_area_is_occupied'] = "Startovací oblast je obsazená.",

        ['not_enough_cash'] = "Nemáte dostatek hotovosti na tuto zkoušku",
        ['not_enough_cash_and_bank'] = "Nemáte dostatek hotovosti a peněz na účtu pro tuto zkoušku",

        ['3dtext.checking_left_wheel'] = "Kontrolujete stav levého kola...",
        ['3dtext.checking_right_wheel'] = "Kontrolujete stav pravého kola...",
        ['3dtext.checking_left_engine'] = "Kontrolujete stav levého motoru...",
        ['3dtext.checking_right_engine'] = "Kontrolujete stav pravého motoru...",
        ['3dtext.refuelling_the_plane'] = "Tankujete letadlo...",

        ['help.check_left_wheel'] = "Stiskněte ~INPUT_CONTEXT~, abyste zkontrolovali levé kolo",
        ['notify.checked_left_wheel'] = "Zkontrolovali jste levé kolo.",
        ['help.check_right_wheel'] = "Stiskněte ~INPUT_CONTEXT~, abyste zkontrolovali pravé kolo",
        ['notify.checked_right_wheel'] = "Zkontrolovali jste pravé kolo.",
        ['help.check_left_engine'] = "Stiskněte ~INPUT_CONTEXT~, abyste zkontrolovali levý motor",
        ['notify.checked_left_engine'] = "Zkontrolovali jste levý motor",
        ['help.check_right_engine'] = "Stiskněte ~INPUT_CONTEXT~, abyste zkontrolovali pravý motor",
        ['notify.checked_right_engine'] = "Zkontrolovali jste pravý motor",
        ['notify.vehicle_is_damaged'] = "Vozidlo je poškozené, musíte ho opravit.",
        ['help.refuel_the_plane'] = "Stiskněte ~INPUT_CONTEXT~, abyste natankovali letadlo",
        ['notify.refuelled_the_plane'] = "Natankovali jste letadlo.",
    },
    ['SV'] = {
        ['open_menu'] = "Tryck på ~INPUT_CONTEXT~ för att öppna menyn",
        ['menu.title'] = "Välj Typ av Examen",
        ['menu.theory_helicopter'] = "Teori Helikopter (%s$)",
        ['menu.practical_helicopter'] = "Praktisk Helikopter (%s$)",
        ['menu.theory_plane'] = "Teori Flygplan (%s$)",
        ['menu.practical_plane'] = "Praktisk Flygplan (%s$)",

        ['vehicle_was_damaged'] = "Fordonet var skadat (%s/%s)",
        ['exceeded_error_limit'] = "Du har överskridit felgränsen, du behöver gå tillbaka till flygskolan.",
        ['started_practical'] = "Du har påbörjat det praktiska provet, följ examinatorns instruktioner.",
        ['complete_practical'] = "Tryck på ~INPUT_CONTEXT~ för att slutföra det praktiska provet.",

        ['success_practical'] = "Grattis, du har fått ditt körkort.",
        ['failed_practical'] = "Tyvärr, du misslyckades att få ditt körkort.",

        ['the_start_area_is_occupied'] = "Startområdet är upptaget.",

        ['not_enough_cash'] = "Du har inte tillräckligt med kontanter för detta prov.",
        ['not_enough_cash_and_bank'] = "Du har inte tillräckligt med kontanter och pengar på ditt bankkonto för detta prov.",

        ['3dtext.checking_left_wheel'] = "Du kontrollerar vänster hjul...",
        ['3dtext.checking_right_wheel'] = "Du kontrollerar höger hjul...",
        ['3dtext.checking_left_engine'] = "Du kontrollerar vänster motor...",
        ['3dtext.checking_right_engine'] = "Du kontrollerar höger motor...",
        ['3dtext.refuelling_the_plane'] = "Du tankar flygplanet...",

        ['help.check_left_wheel'] = "Tryck på ~INPUT_CONTEXT~ för att kontrollera vänster hjul",
        ['notify.checked_left_wheel'] = "Du har kontrollerat vänster hjul.",
        ['help.check_right_wheel'] = "Tryck på ~INPUT_CONTEXT~ för att kontrollera höger hjul",
        ['notify.checked_right_wheel'] = "Du har kontrollerat höger hjul.",
        ['help.check_left_engine'] = "Tryck på ~INPUT_CONTEXT~ för att kontrollera vänster motor",
        ['notify.checked_left_engine'] = "Du har kontrollerat vänster motor",
        ['help.check_right_engine'] = "Tryck på ~INPUT_CONTEXT~ för att kontrollera höger motor",
        ['notify.checked_right_engine'] = "Du har kontrollerat höger motor",
        ['notify.vehicle_is_damaged'] = "Fordonet är skadat, du behöver reparera det.",
        ['help.refuel_the_plane'] = "Tryck på ~INPUT_CONTEXT~ för att tanka flygplanet",
        ['notify.refuelled_the_plane'] = "Du har tankat flygplanet.",
    },
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