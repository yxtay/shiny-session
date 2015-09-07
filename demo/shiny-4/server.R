library(shiny)

shinyServer(function(input, output, session) {
    
    data <- reactive({
        n <- input$n
        mu <- input$mu
        sigma <- input$sigma
        x <- rnorm(n, mu, sigma)
        
        # list(x, n, mu, sigma)
        # list(x = x, n = n, mu = mu, sigma = sigma)
    })
    
    output$plot <- renderPlot({
        x <- data()
        # x <- data()$x
        
        # title <- paste0("rnorm(", data()$n, ", ", data()$mu, ", ", data()$sigma, ")")
        hist(x, freq = F)
        lines(density(x, bw = "nrd"))
    })
    
    output$test <- renderPrint({
        data()
    })
    
    output$summary <- renderPrint({
        x <- data()
        # x <- data()$x
        
        summary(x)
    })
    
    output$table <- renderDataTable({
        x <- data()
        # x <- data()$x
        
        data.frame(x)
    })
    
})