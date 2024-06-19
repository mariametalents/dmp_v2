function hideCreate(){
    AJS.$('#issue-create').parent().addClass("hidden");
    AJS.$('#issue-create-submit').addClass("hidden");
}

JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e,context){hideCreate()});



