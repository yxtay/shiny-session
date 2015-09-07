library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output, session) {
    
#     observeEvent(input$dist, {
#         v1 <- switch(input$dist,
#                      norm = 0,
#                      lnorm = 0,
#                      cauchy = 0,
#                      beta = 0.5,
#                      f = 2,
#                      gamma = 0.5,
#                      unif = 0,
#                      weibull = 0.5,
#                      binom = 10,
#                      nbinom = 10)
#         
#         v2 <- switch(input$dist,
#                      norm = 1,
#                      lnorm = 1,
#                      cauchy = 1,
#                      beta = 1.5,
#                      f = 5,
#                      gamma = 1.5,
#                      unif = 1,
#                      weibull = 1.5,
#                      binom = 0.2,
#                      nbinom = 0.2)
#         
#         updateNumericInput(session,
#                            "par1", "Parameter 1",
#                            value = v1,
#                            min = 0,
#                            step = 0.01)
#         
#         updateNumericInput(session,
#                            "par2", "Parameter 2",
#                            value = v2,
#                            min = 0,
#                            step = 0.01)
#     })
    
    data <- reactive({
        input$sample
        
        n <- input$n
        dist <- switch(input$dist,
                       norm = rnorm,
                       lnorm = rlnorm,
                       cauchy = rcauchy,
                       beta = rbeta,
                       f = rf,
                       gamma = rgamma,
                       unif = runif,
                       weibull = rweibull,
                       binom = rbinom,
                       nbinom = rnbinom)
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
        session
    })
})