// AJS.toInit(function() {
//     AJS.$('label[for="customfield_10408"]').attr('id', 'nfeed-label');
//     AJS.$('label[for="customfield_10408"]').attr('style', 'visibility:none !important');
//     AJS.$("#nfeed-label").show();
// });




AJS.toInit(function() {
    
    // Sélectionnez le label avec l'attribut "for" égal à "customfield_10216"
    var label = AJS.$('label[for="customfield_10408"]');

    if (label.length > 0) {
        // Obtenez le parent du label qui a la classe "field-group"
        var fieldGroup = label.closest('.field-group');

        if (fieldGroup.length > 0) {
            // Ajoutez un ID au div parent avec la classe "field-group"
            fieldGroup.attr('id', 'fournisseur');

            // Cachez l'élément
            fieldGroup.show();
        }
    }
    
});