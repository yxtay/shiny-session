library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output, session) {
    
    data <- reactive({
        input$sample
        
        n <- input$n
        dist <- switch(input$dist,
                       norm = rnorm,
                       lnorm = rlnorm,
                       cauchy = rcauchy)
        par1 <- input$par1
        par2 <- input$par2
        
        x <- dist(n, par1, par2)
        
        # list(x, n, par1, par2)
        list(x = x, n = n, par1 = par1, par2 = par2)
    })
    
    output$plot <- renderPlot({
        x <- data()$x
        
        hist(x, breaks = 30, freq = F,
             main = paste0("r", input$dist, "(", data()$n, ", ", data()$par1, ", ", data()$par2, ")"))
        lines(density(x, bw = "nrd"))
    })
    
    output$summary <- renderPrint({
        x <- data()$x
        summary(x)
    })
    
    output$table <- renderDataTable({
        x <- data()$x
        data.frame(x)
    })
    
    output$download <- downloadHandler(
        filename = function() {"sample.csv"},
        content = function(file) {write.csv(data()$x, file, quote = F, row.names = F)}
    )
    
    output$test <- renderPrint({
        data()
    })
})