-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄
Config.Language = 'EN' -- 'EN' / 'DE' / 'FR' / 'ES' / 'PT' / 'PL' / 'IT' / 'CZ' / 'SV'

Config.Translate = {
    ['EN'] = {
        ['notify.wait'] = "Try again in a while...",
        ['notify.no_money'] = "You don't have enough money...",
        ['notify.photographer_is_busy'] = "The photographer is currently serving a customer, wait a moment....",
        ['notify.take_of_head_accessories'] = "To use the services of a photographer, you need to take the accessories off your head",
        ['notify.reached_photos_limit'] = "You have reached the limit of photos you have.",
        ['notify.received'] = "You have received the document.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "You are not allowed to use it.",
        ['notify.you_dont_have_required_job'] = "You are not eligible to apply for this document.",
        ['notify.you_already_have_valid_document'] = "You already have a valid document.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Photographer",
        ['textui.photographer_free'] = "[E] Photographer",
        ['3dtext.photographer_free'] = "[E] Photographer",
        ['target.photographer_free'] = "Photographer",

        ['help.photographer'] = "~INPUT_CONTEXT~ Photographer $%s",
        ['textui.photographer'] = "[E] Photographer $%s",
        ['3dtext.photographer'] = "[E] Photographer $%s",
        ['target.photographer'] = "Photographer $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Documents Menu",
        ['textui.documents_menu'] = "[E] Documents Menu",
        ['3dtext.documents_menu'] = "[E] Documents Menu",
        ['target.documents_menu'] = "Documents Menu",

        ['textui.selecting_menu'] = "[E] Change Player\n[ENTER] Show Document\n[BACKSPACE] Cancel",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Change Player\n~INPUT_FRONTEND_ACCEPT~ Show Document\n~INPUT_FRONTEND_RRIGHT~ Cancel",

        ['notify.didnt_found'] = "Document not found.",
        ['notify.found_invalid'] = "The document has been marked as invalid.",
        ['notify.found_valid'] = "The document has been found and is active."
    },
    ['DE'] = {
        ['notify.wait'] = "Versuchen Sie es später erneut...",
        ['notify.no_money'] = "Sie haben nicht genug Geld...",
        ['notify.photographer_is_busy'] = "Der Fotograf bedient gerade einen Kunden, bitte warten Sie einen Moment....",
        ['notify.take_of_head_accessories'] = "Um die Dienstleistungen eines Fotografen zu nutzen, müssen Sie die Accessoires von Ihrem Kopf abnehmen",
        ['notify.reached_photos_limit'] = "Sie haben das Limit der Fotos erreicht, die Sie haben.",
        ['notify.received'] = "Sie haben die %s erhalten.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Sie dürfen es nicht verwenden.",
        ['notify.you_dont_have_required_job'] = "Sie sind nicht berechtigt, dieses Dokument zu beantragen.",
        ['notify.you_already_have_valid_document'] = "Sie haben bereits ein gültiges Dokument.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotograf",
        ['textui.photographer_free'] = "[E] Fotograf",
        ['3dtext.photographer_free'] = "[E] Fotograf",
        ['target.photographer_free'] = "Fotograf",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotograf $%s",
        ['textui.photographer'] = "[E] Fotograf $%s",
        ['3dtext.photographer'] = "[E] Fotograf $%s",
        ['target.photographer'] = "Fotograf $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Dokumentenmenü",
        ['textui.documents_menu'] = "[E] Dokumentenmenü",
        ['3dtext.documents_menu'] = "[E] Dokumentenmenü",
        ['target.documents_menu'] = "Dokumentenmenü",

        ['textui.selecting_menu'] = "[E] Spieler ändern\n[ENTER] Dokument anzeigen\n[BACKSPACE] Abbrechen",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Spieler ändern\n~INPUT_FRONTEND_ACCEPT~ Dokument anzeigen\n~INPUT_FRONTEND_RRIGHT~ Abbrechen",

        ['notify.didnt_found'] = "Dokument nicht gefunden.",
        ['notify.found_invalid'] = "Das Dokument wurde als ungültig markiert.",
        ['notify.found_valid'] = "Das Dokument wurde gefunden und ist aktiv."
    },
    ['FR'] = {
        ['notify.wait'] = "Réessayez dans un moment...",
        ['notify.no_money'] = "Vous n'avez pas assez d'argent...",
        ['notify.photographer_is_busy'] = "Le photographe est actuellement au service d'un client, attendez un instant....",
        ['notify.take_of_head_accessories'] = "Pour utiliser les services d'un photographe, vous devez enlever les accessoires de votre tête",
        ['notify.reached_photos_limit'] = "Vous avez atteint la limite de photos que vous avez.",
        ['notify.received'] = "Vous avez reçu le %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Vous n'êtes pas autorisé à l'utiliser.",
        ['notify.you_dont_have_required_job'] = "Vous n'êtes pas éligible pour demander ce document.",
        ['notify.you_already_have_valid_document'] = "Vous avez déjà un document valide.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Photographe",
        ['textui.photographer_free'] = "[E] Photographe",
        ['3dtext.photographer_free'] = "[E] Photographe",
        ['target.photographer_free'] = "Photographe",

        ['help.photographer'] = "~INPUT_CONTEXT~ Photographe $%s",
        ['textui.photographer'] = "[E] Photographe $%s",
        ['3dtext.photographer'] = "[E] Photographe $%s",
        ['target.photographer'] = "Photographe $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Menu des documents",
        ['textui.documents_menu'] = "[E] Menu des documents",
        ['3dtext.documents_menu'] = "[E] Menu des documents",
        ['target.documents_menu'] = "Menu des documents",

        ['textui.selecting_menu'] = "[E] Changer de joueur\n[ENTRER] Afficher le document\n[EFFACER] Annuler",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Changer de joueur\n~INPUT_FRONTEND_ACCEPT~ Afficher le document\n~INPUT_FRONTEND_RRIGHT~ Annuler",

        ['notify.didnt_found'] = "Document non trouvé.",
        ['notify.found_invalid'] = "Le document a été marqué comme invalide.",
        ['notify.found_valid'] = "Le document a été trouvé et est actif."
    },
    ['ES'] = {
        ['notify.wait'] = "Intenta de nuevo en un rato...",
        ['notify.no_money'] = "No tienes suficiente dinero...",
        ['notify.photographer_is_busy'] = "El fotógrafo está atendiendo a un cliente en este momento, espera un momento...",
        ['notify.take_of_head_accessories'] = "Para usar los servicios de un fotógrafo, necesitas quitarte los accesorios de la cabeza.",
        ['notify.reached_photos_limit'] = "Has alcanzado el límite de fotos que tienes.",
        ['notify.received'] = "Has recibido el %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "No tienes permiso para usarlo.",
        ['notify.you_dont_have_required_job'] = "No cumples los requisitos para solicitar este documento.",
        ['notify.you_already_have_valid_document'] = "Ya tienes un documento válido.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotógrafo",
        ['textui.photographer_free'] = "[E] Fotógrafo",
        ['3dtext.photographer_free'] = "[E] Fotógrafo",
        ['target.photographer_free'] = "Fotógrafo",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotógrafo $%s",
        ['textui.photographer'] = "[E] Fotógrafo $%s",
        ['3dtext.photographer'] = "[E] Fotógrafo $%s",
        ['target.photographer'] = "Fotógrafo $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Menú de Documentos",
        ['textui.documents_menu'] = "[E] Menú de Documentos",
        ['3dtext.documents_menu'] = "[E] Menú de Documentos",
        ['target.documents_menu'] = "Menú de Documentos",

        ['textui.selecting_menu'] = "[E] Cambiar Jugador\n[ENTER] Mostrar Documento\n[BACKSPACE] Cancelar",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Cambiar Jugador\n~INPUT_FRONTEND_ACCEPT~ Mostrar Documento\n~INPUT_FRONTEND_RRIGHT~ Cancelar",

        ['notify.didnt_found'] = "Documento no encontrado.",
        ['notify.found_invalid'] = "El documento ha sido marcado como inválido.",
        ['notify.found_valid'] = "Se ha encontrado el documento y está activo."
    },
    ['PT'] = {
        ['notify.wait'] = "Tente novamente mais tarde...",
        ['notify.no_money'] = "Você não tem dinheiro suficiente...",
        ['notify.photographer_is_busy'] = "O fotógrafo está atualmente atendendo um cliente, espere um momento....",
        ['notify.take_of_head_accessories'] = "Para usar os serviços de um fotógrafo, você precisa tirar os acessórios da cabeça",
        ['notify.reached_photos_limit'] = "Você atingiu o limite de fotos que possui.",
        ['notify.received'] = "Você recebeu o %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Você não está autorizado a usar isso.",
        ['notify.you_dont_have_required_job'] = "Você não está qualificado para solicitar este documento.",
        ['notify.you_already_have_valid_document'] = "Você já possui um documento válido.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotógrafo",
        ['textui.photographer_free'] = "[E] Fotógrafo",
        ['3dtext.photographer_free'] = "[E] Fotógrafo",
        ['target.photographer_free'] = "Fotógrafo",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotógrafo $%s",
        ['textui.photographer'] = "[E] Fotógrafo $%s",
        ['3dtext.photographer'] = "[E] Fotógrafo $%s",
        ['target.photographer'] = "Fotógrafo $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Menu de Documentos",
        ['textui.documents_menu'] = "[E] Menu de Documentos",
        ['3dtext.documents_menu'] = "[E] Menu de Documentos",
        ['target.documents_menu'] = "Menu de Documentos",

        ['textui.selecting_menu'] = "[E] Trocar Jogador\n[ENTER] Mostrar Documento\n[BACKSPACE] Cancelar",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Trocar Jogador\n~INPUT_FRONTEND_ACCEPT~ Mostrar Documento\n~INPUT_FRONTEND_RRIGHT~ Cancelar",

        ['notify.didnt_found'] = "Documento não encontrado.",
        ['notify.found_invalid'] = "O documento foi marcado como inválido.",
        ['notify.found_valid'] = "O documento foi encontrado e está ativo."
    },
    ['PL'] = {
        ['notify.wait'] = "Spróbuj ponownie za chwilę...",
        ['notify.no_money'] = "Nie masz wystarczającej ilości pieniędzy...",
        ['notify.photographer_is_busy'] = "Fotograf obsługuje obecnie klienta, poczekaj chwilę...",
        ['notify.take_of_head_accessories'] = "Aby skorzystać z usług fotografa, musisz zdjąć akcesoria z głowy",
        ['notify.reached_photos_limit'] = "Osiągnąłeś limit posiadanych zdjęć.",
        ['notify.received'] = "Otrzymałeś %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Nie masz pozwolenia, aby tego użyć.",
        ['notify.you_dont_have_required_job'] = "Nie spełniasz wymagań, aby ubiegać się o ten dokument.",
        ['notify.you_already_have_valid_document'] = "Masz już ważny dokument.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotograf",
        ['textui.photographer_free'] = "[E] Fotograf",
        ['3dtext.photographer_free'] = "[E] Fotograf",
        ['target.photographer_free'] = "Fotograf",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotograf $%s",
        ['textui.photographer'] = "[E] Fotograf $%s",
        ['3dtext.photographer'] = "[E] Fotograf $%s",
        ['target.photographer'] = "Fotograf $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Menu Dokumentów",
        ['textui.documents_menu'] = "[E] Menu Dokumentów",
        ['3dtext.documents_menu'] = "[E] Menu Dokumentów",
        ['target.documents_menu'] = "Menu Dokumentów",

        ['textui.selecting_menu'] = "[E] Wybierz Gracza\n[ENTER] Pokaż Dokument\n[BACKSPACE] Anuluj",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Wybierz Gracza\n~INPUT_FRONTEND_ACCEPT~ Pokaż Dokument\n~INPUT_FRONTEND_RRIGHT~ Anuluj",

        ['notify.didnt_found'] = "Dokument nie znaleziony.",
        ['notify.found_invalid'] = "Dokument został oznaczony jako nieważny.",
        ['notify.found_valid'] = "Dokument został znaleziony i jest aktywny."
    },
    ['IT'] = {
        ['notify.wait'] = "Riprova tra un po'...",
        ['notify.no_money'] = "Non hai abbastanza soldi...",
        ['notify.photographer_is_busy'] = "Il fotografo sta attualmente servendo un cliente, aspetta un momento...",
        ['notify.take_of_head_accessories'] = "Per utilizzare i servizi di un fotografo, devi togliere gli accessori dalla testa",
        ['notify.reached_photos_limit'] = "Hai raggiunto il limite di foto che hai.",
        ['notify.received'] = "Hai ricevuto il %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Non ti è permesso utilizzarlo.",
        ['notify.you_dont_have_required_job'] = "Non sei idoneo a richiedere questo documento.",
        ['notify.you_already_have_valid_document'] = "Hai già un documento valido.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotografo",
        ['textui.photographer_free'] = "[E] Fotografo",
        ['3dtext.photographer_free'] = "[E] Fotografo",
        ['target.photographer_free'] = "Fotografo",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotografo $%s",
        ['textui.photographer'] = "[E] Fotografo $%s",
        ['3dtext.photographer'] = "[E] Fotografo $%s",
        ['target.photographer'] = "Fotografo $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Menu Documenti",
        ['textui.documents_menu'] = "[E] Menu Documenti",
        ['3dtext.documents_menu'] = "[E] Menu Documenti",
        ['target.documents_menu'] = "Menu Documenti",

        ['textui.selecting_menu'] = "[E] Cambia Giocatore\n[ENTER] Mostra Documento\n[BACKSPACE] Annulla",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Cambia Giocatore\n~INPUT_FRONTEND_ACCEPT~ Mostra Documento\n~INPUT_FRONTEND_RRIGHT~ Annulla",

        ['notify.didnt_found'] = "Documento non trovato.",
        ['notify.found_invalid'] = "Il documento è stato contrassegnato come non valido.",
        ['notify.found_valid'] = "Il documento è stato trovato ed è attivo."
    },
    ['CZ'] = {
        ['notify.wait'] = "Zkus to znovu za chvíli...",
        ['notify.no_money'] = "Nemáš dost peněz...",
        ['notify.photographer_is_busy'] = "Fotograf právě obslouží zákazníka, počkej chvíli....",
        ['notify.take_of_head_accessories'] = "Pro použití služeb fotografa musíš sundat příslušenství z hlavy",
        ['notify.reached_photos_limit'] = "Dosáhl jsi limitu fotografií.",
        ['notify.received'] = "Obdržel(a) jsi %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Nemáš povoleno to používat.",
        ['notify.you_dont_have_required_job'] = "Nejsi oprávněn(a) žádat o tento dokument.",
        ['notify.you_already_have_valid_document'] = "Máš již platný dokument.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotograf",
        ['textui.photographer_free'] = "[E] Fotograf",
        ['3dtext.photographer_free'] = "[E] Fotograf",
        ['target.photographer_free'] = "Fotograf",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotograf $%s",
        ['textui.photographer'] = "[E] Fotograf $%s",
        ['3dtext.photographer'] = "[E] Fotograf $%s",
        ['target.photographer'] = "Fotograf $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Menu Dokumentů",
        ['textui.documents_menu'] = "[E] Menu Dokumentů",
        ['3dtext.documents_menu'] = "[E] Menu Dokumentů",
        ['target.documents_menu'] = "Menu Dokumentů",

        ['textui.selecting_menu'] = "[E] Změnit Hráče\n[ENTER] Zobrazit Dokument\n[BACKSPACE] Zrušit",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Změnit Hráče\n~INPUT_FRONTEND_ACCEPT~ Zobrazit Dokument\n~INPUT_FRONTEND_RRIGHT~ Zrušit",

        ['notify.didnt_found'] = "Dokument nenalezen.",
        ['notify.found_invalid'] = "Dokument byl označen jako neplatný.",
        ['notify.found_valid'] = "Dokument byl nalezen a je platný."
    },
    ['SV'] = {
        ['notify.wait'] = "Försök igen om en stund...",
        ['notify.no_money'] = "Du har inte tillräckligt med pengar...",
        ['notify.photographer_is_busy'] = "Fotografen serverar för närvarande en kund, vänta en stund....",
        ['notify.take_of_head_accessories'] = "För att använda fotografens tjänster måste du ta av accessoarerna från ditt huvud",
        ['notify.reached_photos_limit'] = "Du har nått gränsen för antalet foton du har.",
        ['notify.received'] = "Du har fått %s.",
        ['notify.you_have_no_license'] = "You don't have any license, which is required this document.",
        ['notify.you_are_not_allowed'] = "Du har inte tillåtelse att använda det.",
        ['notify.you_dont_have_required_job'] = "Du är inte berättigad att ansöka om detta dokument.",
        ['notify.you_already_have_valid_document'] = "Du har redan ett giltigt dokument.",

        ['help.photographer_free'] = "~INPUT_CONTEXT~ Fotograf",
        ['textui.photographer_free'] = "[E] Fotograf",
        ['3dtext.photographer_free'] = "[E] Fotograf",
        ['target.photographer_free'] = "Fotograf",

        ['help.photographer'] = "~INPUT_CONTEXT~ Fotograf $%s",
        ['textui.photographer'] = "[E] Fotograf $%s",
        ['3dtext.photographer'] = "[E] Fotograf $%s",
        ['target.photographer'] = "Fotograf $%s",

        ['help.documents_menu'] = "~INPUT_CONTEXT~ Dokumentmeny",
        ['textui.documents_menu'] = "[E] Dokumentmeny",
        ['3dtext.documents_menu'] = "[E] Dokumentmeny",
        ['target.documents_menu'] = "Dokumentmeny",

        ['textui.selecting_menu'] = "[E] Byt spelare\n[ENTER] Visa dokument\n[BACKSPACE] Avbryt",
        ['help.selecting_menu'] = "~INPUT_CONTEXT~ Byt spelare\n~INPUT_FRONTEND_ACCEPT~ Visa dokument\n~INPUT_FRONTEND_RRIGHT~ Avbryt",

        ['notify.didnt_found'] = "Dokumentet hittades inte.",
        ['notify.found_invalid'] = "Dokumentet har markerats ogiltigt.",
        ['notify.found_valid'] = "Dokumentet har hittats och är aktivt."
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
