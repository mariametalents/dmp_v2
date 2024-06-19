function hideSuite(){
    AJS.$('#opsbar-operations_more').parent().addClass("hidden");
    AJS.$('#opsbar-opsbar-operations').addClass("hidden");
}

JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e,context){hideSuite()});




