library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output, session) {
    
    output$plot <- renderPlot({
        input$sample
        
        n <- input$n
        mu <- input$mu
        sigma <- input$sigma
        x <- rlnorm(n, mu, sigma)
        
        hist(x, breaks = 30, freq = F,
             main = "Normal Distribution")
        # lines(density(x, bw = "nrd"))
        
    })
    
})