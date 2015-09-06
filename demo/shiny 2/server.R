library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output, session) {
    
    output$plot <- renderPlot({
        input$sample
        
        n <- input$n
        dist <- switch(input$dist,
                       norm = rnorm,
                       lnorm = rlnorm,
                       cauchy = rcauchy)
        par1 <- input$par1
        par2 <- input$par2
        
        x <- dist(n, par1, par2)
        
        hist(x, breaks = 30, freq = F,
             main = paste0("r", input$dist, "(", n, ", ", par1, ", ", par2, ")"))
        lines(density(x, bw = "nrd"))
    })
    
    output$summary <- renderPrint({
        input$sample
        
        n <- input$n
        dist <- switch(input$dist,
                       norm = rnorm,
                       lnorm = rlnorm,
                       cauchy = rcauchy)
        par1 <- input$par1
        par2 <- input$par2
        
        x <- dist(n, par1, par2)
        summary(x)
    })

    output$table <- renderDataTable({
        input$sample
        
        n <- input$n
        dist <- switch(input$dist,
                       norm = rnorm,
                       lnorm = rlnorm,
                       cauchy = rcauchy)
        par1 <- input$par1
        par2 <- input$par2
        
        x <- dist(n, par1, par2)
        data.frame(x)
    })
})