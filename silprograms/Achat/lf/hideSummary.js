function HideSummary(){
    AJS.$("#summary").val("Achat");
    AJS.$("#summary").parent().addClass("hidden");
    AJS.$("#opsbar-opsbar-operations").remove();
}

JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e,context){HideSummary()});
HideSummary();


