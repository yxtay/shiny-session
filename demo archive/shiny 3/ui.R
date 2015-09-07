library(shiny)

# tabset demo

shinyUI(fluidPage(
    
    titlePanel("Shiny Demo 3"),
    
    sidebarLayout(
        
        sidebarPanel(
            
            sliderInput("n", 
                        "Number of observations:", 
                        value = 500,
                        min = 1, 
                        max = 1000),
            
            radioButtons("dist", "Distribution type:",
                         c("Normal" = "norm",
                           "Lognormal" = "lnorm",
                           "Cauchy" = "cauchy")),
            
            numericInput("par1", "Location",
                         value = 0, 
                         min = 0,
                         step = 0.01),
            
            numericInput("par2", "Scale",
                         value = 1, 
                         min = 0,
                         step = 0.01),
            
            actionButton("sample", "New Sample")
        ),
        
        mainPanel(
            
            tabsetPanel(
                
                tabPanel("Plot",
                    plotOutput("plot")
                ),
                
                tabPanel("Summary",
                    verbatimTextOutput("summary")
                ),
                
                tabPanel("Table",
                    dataTableOutput("table")
                ),
                
                type = "pills" # also try pills
            )
            
        )
    )
))