function HideNfeed() {
    AJS.toInit(function(){
        console.log("HHEHEHEHEHEHE");
    })
};

JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e, context){
    HideSummary();
})

HideNfeed();