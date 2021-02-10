
##Create a log reactive variable to keep track of user log in and log out status
UserLog <- reactiveValues(Logged=FALSE);

##LOGIN PANNEL####
##IF USER LOG IS FALSE, THEN SHOW THE LOGIN PANNEL###
output$uiLoginPage <- renderUI(
  if(UserLog$Logged == FALSE){
    fixedPage(title=paste0("Log-in"), 
       fixedRow(
         column(width=4, offset=4, style="background-color: white; border: 1px solid black; border-radius: 25px;
                       box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.2);
                       font-size: 14px; text-align: center; padding: 20px 20px 20px 20px;",
                
                fixedRow(
                  column(width=12,
                         img(src="Logo.png", width="100%", height="100px", style="margin-bottom: 30px;")
                  ),
                  
                  column(width=12,
                         div(id="userPass",
                             div(id="v-align1", 
                                 p(strong(id="LabelFont", "Username:"), textInput(inputId="userName", label=NULL, value=UserLogin$Username[1], width="100%")),
                                 br(),
                                 p(strong(id="LabelFont", "Password:"), passwordInput(inputId="passWord", label=NULL, value=UserLogin$Password[1], width="100%"))
                             )
                         )
                  ),
                  column(width=12,
                      actionButton(inputId="SignInButton", label=strong("Sign In"), width="auto"),
                      textOutput(outputId="LogInErrorMessage"),
                      p("Copyright ", icon("copyright"), paste0(as.numeric(format(Sys.Date(), "%Y"))," NCCPA Inc. All rights reserved."), style="font-size: 12px;")
                  )
            )
         ) 
       )
    )
  }
)

###LOG-IN ERROR MESSAGE#####
##VALIDATE WHETHER THE USER LOGIN INFOMATION IS CORRECT###
##IF YES, CHANGE THE USER LOG TO TRUE TO ACCESS THE MAINPAGE###
output$LogInErrorMessage <- renderText({
  if(UserLog$Logged == FALSE){
    if(!is.null(input$SignInButton)) {
      if(input$SignInButton > 0){
        
        Usernme <- isolate(input$userName)
        Passwd <- isolate(input$passWord)
        Username <- which(UserLogin$Username == Usernme)
        Password <- which(UserLogin$Password == Passwd)
        
        if(length(Username) > 0 & length(Password) > 0){
          if(Username == Password){
            UserLog$Logged <- TRUE
            paste0("")
          }else{ 
            UserLog$Logged <- FALSE
            paste0("Incorrect username or password.") 
          }
        }else{
          paste0("Incorrect username or password.")
        }
      } 
    }
  }
})



