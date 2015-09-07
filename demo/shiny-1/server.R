library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output, session) {
    
    output$plot <- renderPlot({
        input$button
        
        n <- input$n
        x <- rnorm(n)
        
        hist(x, freq = F)
        lines(density(x, bw = "nrd"))
    })
    
})