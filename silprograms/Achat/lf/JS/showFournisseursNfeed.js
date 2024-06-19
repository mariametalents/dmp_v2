// AJS.toInit(function() {
//     // Select the <div> element by its inline style
//     var divElement = AJS.$('div[class="css-2b097c-container"]');

//     // Add the "id" attribute to the <div>
//     divElement.attr('id', 'nfeed-container');
    
//     AJS.$('div[class="css-2b097c-container"]').attr('style', 'display:block !important')
    
//     AJS.$("#nfeed-container").show();
// });


AJS.toInit(function() {
    
    // Sélectionnez le label avec l'attribut "for" égal à "customfield_10216"
    var label = AJS.$('label[for="customfield_10216"]');

    if (label.length > 0) {
        // Obtenez le parent du label qui a la classe "field-group"
        var fieldGroup = label.closest('.field-group');

        if (fieldGroup.length > 0) {
            // Ajoutez un ID au div parent avec la classe "field-group"
            fieldGroup.attr('id', 'fournisseurs');

            // Cachez l'élément
            fieldGroup.show();
        }
    }
    
});