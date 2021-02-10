
# R Packages
library(shinydashboard)
library(shinythemes)
library(shiny)
library(DT)

# Global dataset that stores user login information
UserLogin <- data.frame(Username="User", Password="Password")

# Define UI for applications
ui <- bootstrapPage(
  
  title = paste0("User Login and Log out"),
  
  tagList(
    tags$head(
      tags$link(type="text/css", rel="stylesheet", href="OverallStyle.css"),
      tags$link(type="text/css", rel="stylesheet", href="LogInStyle.css"),
      tags$link(type="text/css", rel="stylesheet", href="LogOutStyle.css"),
      tags$link(type="text/css", rel="stylesheet", href="MainPageStyle.css")
    )
  ),
  
  # Define Login Page;
  div(class="signInPage",
      uiOutput("uiLoginPage")
  ),
  
  # Define Logout page;
  div(class="logOutPage",
      uiOutput("uiLogOutPage")
  ),
  
  # Define Main page;
  div(class="mainPage", 
      uiOutput("uiMainPage")
  )
)

# Define Server Logic
server <- function(input, output, session) {
  
  ##Define all the source files;
  source("LoginPage.R", local=TRUE) 
  source("MainPage.R", local=TRUE)
  source("LogoutPage.R", local=TRUE)
  
}

shinyApp(ui=ui, server=server)
