
##Create reactive values to keep track of which tab is selected;
UserTab <- reactiveValues(Tab="Tab1");

###MAIN PAGE#####
##IF USER LOG IS TRUE, SHOW MAIN PAGE PANNEL###
output$uiMainPage <- renderUI({
  if(UserLog$Logged==TRUE) {
    
    updateNavbarPage(session, inputId="NavPage", selected=UserTab$Tab)
    
    navbarPage(strong("Navigation Page"), id="NavPage",
        tabPanel(title="Tab1",
           h4(strong("Welcome! You have successfully log in! Want to log out? Click the log out button at the top!"), icon("hand-pointer-o"), style="text-align:center;")
        ),
        tabPanel(title="Tab2",
           "Tab Content 2"
        ),
        navbarMenu(title="Tab3",
           tabPanel("Tab3 Menu 1", "Tab3 Content 1"),
           tabPanel("Tab3 Menu 2", "Tab3 Content 2")
        )
    )      
  }    
})

