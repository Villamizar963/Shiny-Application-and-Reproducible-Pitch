#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {

        # Return the requested dataset ----
        datasetInput <- reactive({
                switch(input$dataset,
                       "CO2" = CO2,
                       "airquality" = airquality,
                       "BOD" = BOD)
        })
        
        # Generate a summary of the dataset ----
        output$summary <- renderPrint({
                dataset <- datasetInput()
                summary(dataset)
        })
        
        output$text1 <- renderText({
                paste("You have selected: ", input$dataset)
        })
        
        # Show the first "n" observations ----
        output$view <- renderTable({
                head(datasetInput(), n = input$obs)
        })

})
