function hideSuite(){
   AJS.$('#opsbar-operations_more').parent().addClass("hidden");  
  
   AJS.$('#edit-issue').parent().addClass("hidden");
   //bouton modifier
   
   AJS.$('#comment-issue').parent().addClass("hidden");
   //bouton commentaire
   }

JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e,context){
    hideSuite()
});

hideSuite();



