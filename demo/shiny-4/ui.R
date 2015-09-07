library(shiny)

# reactive
# debugging

shinyUI(
    
    fluidPage(
        
        titlePanel("Shiny Demo 4"),
        
        sidebarLayout(
            
            sidebarPanel(
                
                sliderInput("n", 
                            "Number of observations:", 
                            value = 500, min = 0, max = 1000),
                
                numericInput("mu", "Mean",
                             value = 0),
                
                numericInput("sigma", "Standard Deviation",
                             value = 1)
            ),
            
            mainPanel(
                
                tabsetPanel(
                    
                    tabPanel(
                        "Plot",
                        
                        plotOutput("plot"),
                        
                        verbatimTextOutput("summary")
                        
                        # verbatimTextOutput("test")
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