

##LOG OUT PANNEL###
##IF USER LOG IS TRUE, ALSO SHOW THE LOG OUT PANNEL###
output$uiLogOutPage <- renderUI({
  if(UserLog$Logged==TRUE){
    Username <- isolate(input$userName)
    
    span(id="Signout",
        p(icon("user"), paste0("Hi ", Username, "!"), style="color: #00008B; font-weight: bold; display: inline-block;"),
        actionLink(inputId="LogOut", icon=icon("sign-out"), strong("Log Out"))
    )
  }  
})

##CLICKING THE LOG-OUT BUTTON####
##CHANGE USER LOG TO FALSE AND LEAD THEM BACK TO LOG IN PAGE###
observeEvent(input$LogOut, {
  
  UserTab$Tab <- input$NavPage
  UserLog$Logged <- FALSE;
  
})


