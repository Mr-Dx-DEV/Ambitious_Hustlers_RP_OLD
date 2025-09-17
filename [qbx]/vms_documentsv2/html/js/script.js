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


// UI Variables:
let currentMenu = null;
let currentSubMenu = null;
var isMenuOpened = false;

let documentsList = null;
let photosList = null;
let ownedDocumentsList = null;
let isSelectingPhoto = false;
let canPressAgain = true;

let licensesNames = [];


$(document).on('keydown', 'body', function(e) {
    if (e.which == 27) {
        if (isSelectingPhoto) {
            isSelectingPhoto = false;
            $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').removeAttr('style');
            $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').removeAttr('style');
            
            $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
                'opacity': '1.0',
                'filter': 'blur(0px)'
            });

            $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
                'opacity': '1.0',
                'filter': 'blur(0px)'
            });

            $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').hide();
            $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').fadeIn(120);
            return;
        }
        
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({menu: currentMenu}));
        isMenuOpened = false;
    }
})

window.addEventListener("load", function() {
    $.post(`https://${GetParentResourceName()}/loaded`)
})

window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.action == "loaded") {
        let lang = item.lang;

        licensesNames = item.documentsNames;

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
                
                $('.documents > #header .title').html(translation.document_title);
                $('.badges > #header > .title').html(translation.document_title);

                $('.help').html(translation.hint_close);
                
                $('.documents-menu .header > .name').text(translation.documents_menu.menu_title);

                $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] .header').text(translation.documents_menu.documents_list.header);
                $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] .title').text(translation.documents_menu.documents_list.title);

                $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .header').text(translation.documents_menu.photos_list.header);
                $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .title').text(translation.documents_menu.photos_list.title);

                $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"] .header').text(translation.documents_menu.owned_documents_list.header);
                $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"] .title').text(translation.documents_menu.owned_documents_list.title);

                $('.check_document_menu .header > .name').text(translation.check_document.header);
                $('.check_document_menu #find > span').text(translation.check_document.enter_serial);
                $('.check_document_menu #find > .search > p').text(translation.check_document.search_btn);
                $('.check_document_menu #loading > p').text(translation.check_document.searching_for_information);
            }
        });
    } else if (item.action == "compressPhoto") {
        var base64Image = item.base64;
        convertPngToWebp(base64Image).then(webpBase64 => {
            $.post(`https://${GetParentResourceName()}/compressedPhoto`, JSON.stringify({compressedBase64: webpBase64, documentName: item.documentName, cancelCurrentActive: item.cancelCurrentActive}));
        }).catch(error => {
            console.error(error);
        });
    } else if (item.action == "showDocument") {
        let loadedData = documentValues(item.name, item.data);
        
        let data = ''
        let data2 = ''
        let signature = ''
        let document_name = ''

        loadedData.forEach(val => {
            if (val.type == "data") {
                if (item.type == "badge") {
                    data += `
                        <div>
                            <div class="value">${val.value}</div>
                            <div class="label">${val.label}</div>
                        </div>
                    `
                } else {
                    data += `
                        <div>
                            <div class="label">${val.label}</div>
                            <div class="value">${val.value}</div>
                        </div>
                    `
                }
            } else if (val.type == "data2") {
                data2 += `
                    <div>
                        <div class="label">${val.label}</div>
                        <div class="value">${val.value}</div>
                    </div>
                `
            } else if (val.type == "signature") {
                signature = val.value
            } else if (val.type == "document_name") {
                document_name = val.value
            }
        });
        
        if (item.type == "document") {
            $(".documents > #header > .document_name").html(document_name)
            $(".documents > #data").html(data)
            $(".documents > #signature > p").html(signature)
    
            $(".documents > #document-photo").attr("src", item.photo);
            $(".documents > #document-photo-mini").attr("src", item.photo);
            $(".documents > #document-image").attr("src", `./images/${item.image}`);
            
            $('.help').css({
                top: '33.5em',
                width: '30em',
            })

            $('.documents').fadeIn(120);
        } else if (item.type == "badge") {
            $(".badges > #header > .badge_name").html(document_name)
            $(".badges > #data").html(data)
            $(".badges > #data2").html(data2)
            $(".badges > #signature > p").html(signature)
            $(".badges > .badge-icon").attr("src", `./images/${item.badgeImage}`);
            $(".badges > #badge-photo").attr("src", item.photo);
            $(".badges > #document-image").attr("src", `./images/${item.image}`);
            
            $('.help').css({
                top: '44.5em',
                width: '45em',
            })

            $('.badges').fadeIn(120);
        }
        $('.help').fadeIn(120);

    } else if (item.action == "closeDocument") {
        $('.documents').fadeOut(120);
        $('.badges').fadeOut(120);
        $('.help').fadeOut(120);
    } else if (item.action == "openDocumentsMenu") {
        currentMenu = 'documents_menu';

        documentsList = item.documentsList;

        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"] div[class="licenses-list"] > div').html(LoadLicenses(documentsList));
        photosList = item.ownedPhotos;
        ownedDocumentsList = item.ownedDocuments;
        LoadOwnedDocumentPhotos(photosList);
        LoadOwnedDocuments(ownedDocumentsList);
        $('.documents-menu').css('display', 'flex');
        $('.documents-menu > div').fadeIn(120);

    } else if (item.action == "closeDocumentsMenu") {
        $('.documents-menu > div').fadeOut(120);
        
        isSelectingPhoto = false;
        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').removeAttr('style');
        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').removeAttr('style');
        
        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
            'opacity': '1.0',
            'filter': 'blur(0px)'
        });

        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
            'opacity': '1.0',
            'filter': 'blur(0px)'
        });

        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').hide();
        $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').fadeIn(120);

        currentMenu = null;

    } else if (item.action == "updateDocumentsMenu") {
        if (item.ownedPhotos) {
            photosList = item.ownedPhotos;
            LoadOwnedDocumentPhotos(photosList);
        }
        if (item.ownedDocuments) {
            ownedDocumentsList = item.ownedDocuments;
            LoadOwnedDocuments(ownedDocumentsList);
        }
    } else if (item.action == "openCheckDocumentsMenu") {
        currentMenu = 'check_document_menu';

        $('.check_document_menu #find input').val('');
        $('.check_document_menu #find').show();
        $('.check_document_menu #loading').hide();

        $('.check_document_menu').css('display', 'flex');
        $('.check_document_menu > div').fadeIn(120);

    } else if (item.action == "closeCheckDocumentsMenu") {
        $('.check_document_menu').fadeOut(120);
        currentMenu = null;
        
    } else if (item.action == "updateCheckDocumentsMenu") {
        $('.check_document_menu #find input').val('');

    }
});

$(".close").click(() => {
    $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({menu: currentMenu}));
    isMenuOpened = false;
    currentMenu = null;
    currentSubMenu = null;
})

function convertPngToWebp(pngBase64, quality = 1.0) {
    return new Promise((resolve, reject) => {
        const img = new Image();
        img.src = pngBase64;

        img.onload = () => {
            const canvas = document.createElement('canvas');
            canvas.width = img.width;
            canvas.height = img.height;

            const ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0);

            const webpBase64 = canvas.toDataURL('image/webp', quality);
            resolve(webpBase64);
        };

        img.onerror = reject;
    });
}

function orderDocument(name) {
    if (isSelectingPhoto) return;
    if (!canPressAgain) return;
    canPressAgain = false;
    
    isSelectingPhoto = name;
    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
        'opacity': '0.1',
        'filter': 'blur(2px)'
    });

    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
        'opacity': '0.1',
        'filter': 'blur(2px)'
    });

    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').fadeIn(120);
    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').hide();


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
    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').removeAttr('style');
    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').removeAttr('style');
    
    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="documents"]').css({
        'opacity': '1.0',
        'filter': 'blur(0px)'
    });

    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="owned-documents"]').css({
        'opacity': '1.0',
        'filter': 'blur(0px)'
    });

    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #select-photo').hide();
    $('.documents-menu div[data-type="licenses"]>div>.side-boxes>.box[data-type="photos"] .photos-list #remove-photo').fadeIn(120);
}

function invalidateDocument(serialNumber) {
    if (isSelectingPhoto) return;
    $.post(`https://${GetParentResourceName()}/invalidateDocument`, JSON.stringify({serialNumber: serialNumber}));
}

$(".check_document_menu #find .search").click(() => {
    $('.check_document_menu #find').hide();
    $('.check_document_menu #loading').fadeIn(120);

    setTimeout(() => {
        if (currentMenu && currentMenu == 'check_document_menu') {
            let serialNumber = $('.check_document_menu .menu > #find > input').val();
            $.post(`https://${GetParentResourceName()}/getInfoBySerialNumber`, JSON.stringify({serialNumber: serialNumber}), function(info) {
                $('.check_document_menu #find').show();
                $('.check_document_menu #loading').hide();
            });
        }
    }, 4000);
})