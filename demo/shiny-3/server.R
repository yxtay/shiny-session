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
    
    output$summary <- renderPrint({
        n <- input$n
        mu <- input$mu
        sigma <- input$sigma
        x <- rnorm(n, mu, sigma)
        
        summary(x)
    })
    
    output$table <- renderDataTable({
        n <- input$n
        mu <- input$mu
        sigma <- input$sigma
        x <- rnorm(n, mu, sigma)
        
        data.frame(x)
    })
    
})