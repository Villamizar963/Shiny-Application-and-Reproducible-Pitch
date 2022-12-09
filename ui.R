#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#
shinyUI(fluidPage(

    # Application title
    titlePanel(h1(strong("Summary for numerical variables in some R datasets"), align = "center")),
        
        HTML('<center><img src="summary.jpg" width="220"></center>'),
    
        br(),
    
    # Sidebar
    sidebarLayout(
        sidebarPanel(
                
                img(src="choose.jpg", height=100, width=100),
                
                # Input: Selector for choosing dataset ----
                selectInput(inputId = "dataset",
                            label = "Choose a dataset:",
                            choices = c("CO2", "airquality", "BOD")),
                
        
                # Input: Numeric entry for number of obs to view ----
                numericInput(inputId = "obs",
                             label = "Number of observations to view:",
                             value = 10)
        ),
        
        # Show
        mainPanel(
                h3(textOutput("text1")),
                # Output: Verbatim text for data summary ----
                h3(strong("Data Summary:")),
                verbatimTextOutput("summary"),
                
                # Output: HTML table with requested number of observations ----
                h3(em("Data Table with number of observations:")),
                tableOutput("view")
                
        )
    )
))
