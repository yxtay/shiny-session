library(shiny)

# showcase mode
# layout
# widgets: sliderInput vs numericInput
# slider animate
# action button

shinyUI(fluidPage(
    
    titlePanel("Shiny Demo 1"),
    
    sidebarLayout(
        
        sidebarPanel(
            
            sliderInput("n", 
                        "Number of observations:", 
                        value = 500,
                        min = 1, 
                        max = 1000),
            
            sliderInput("mu", "Mean",
                        min = -10, max = 10, 
                        value = 0, step = 0.1,
                        animate = T), # animate
            
#             sliderInput("sigma", "Sigma",
#                         min = 0, max = 10, 
#                         value = 1, step = 0.1)
            
            numericInput("sigma", "Sigma",
                         value = 1, 
                         min = 0, 
                         step = 0.1)
            
            # actionButton("sample", "New Sample")
        ),
        
        mainPanel(
            
            plotOutput("plot")
            
        )
    )
))