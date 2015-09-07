library(shiny)

shinyServer(function(input, output, session) {
    
    output$plot <- renderPlot({
        n <- input$n
        mu <- input$mu
        sigma <- input$sigma
        
        x <- rnorm(n, mu, sigma)
        
        hist(x, freq = F)
        lines(density(x, bw = "nrd"))
    })
    
    output$caption <- renderText({
        input$caption
    })
    
    output$x <- renderPrint({
        rnorm(10)
    })
    
    output$table <- renderDataTable({
        mtcars
    })
    
})