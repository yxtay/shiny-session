library(shiny)

# widgets
# render and output functions
# tabsetPanel()

shinyUI(
    
    fluidPage(
        
        titlePanel("Shiny Demo 2"),
        
        sidebarLayout(
            
            sidebarPanel(
                
                sliderInput("n", 
                            "Number of observations:", 
                            value = 500, min = 0, max = 1000),
                
                sliderInput("mu", "Mean",
                            value = 0, min = -5, max = 5),
                
                numericInput("sigma", "Standard Deviation",
                             value = 1),
                
                textInput("caption", "Plot Caption",
                          "Some caption here.")
            ),
            
            mainPanel(
                
                tabsetPanel(
                    
                    tabPanel(
                        "Plot",
                        
                        plotOutput("plot"),
                        
                        textOutput("caption")
                    ),
                    
                    tabPanel(
                        "Print",
                        
                        verbatimTextOutput("x")
                    ),
                    
                    tabPanel(
                        "Table",
                        
                        dataTableOutput("table")
                    )
                )
            )
        )
    )
)