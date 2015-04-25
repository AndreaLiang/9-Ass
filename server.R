library(shiny)
shinyServer(
        function(input, output) {
                output$outputno <- renderText({
                        input$goButton
                        isolate(9-as.numeric(input$inputno)%%9) 
                })
        }
)
