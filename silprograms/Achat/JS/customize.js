function hideSuite(){
    
//   AJS.$('#opsbar-operations_more').parent().addClass("hidden");  
   
  //bouton modifier
   AJS.$('#edit-issue').parent().addClass("hidden");
   
   //bouton commentaire
   AJS.$('#comment-issue').parent().addClass("hidden");
   
   // button hipchat
   AJS.$('#hipchat-viewissue-panel_heading').parent().addClass("hidden");
    
   AJS.$('#aui-sidebar-wrapper').parent().addClass("hidden");
   
   AJS.$('#opsbar-admin_more').parent().addClass("hidden");
   
   
   
    //share bouton
   AJS.$('#jira-share-trigger').addClass("hidden");  
   
   //transmettre à
   AJS.$('#action_id_111').addClass("hidden"); 
   
   //m'affecter un ticket
   AJS.$('#assign-to-me').addClass("hidden"); 
   
//   AJS.$('#issuelinks-issues, #issuelinks-linktype').addClass("hidden"); 
   
//   issuelinks-linktype
   
   //Renvoyer ppour réexamination
   // AJS.$('#action_id_71').addClass("hidden"); 
   
   //$('#jira.issueviews:issue-word').css({"color": "red"});
   
   //AJS.$('#jira.issueviews:issue-word').append('<i class="far fa-file-word"></i>');
//   AJS.$("#logo").css({"width": "200px"});
  }
   

JIRA.bind(JIRA.Events.NEW_CONTENT_ADDED, function(e,context){
    hideSuite()
});

 hideSuite();
 