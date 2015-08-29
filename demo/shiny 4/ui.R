library(shiny)

# reactivity demo

shinyUI(fluidPage(
    
    titlePanel("Shiny Demo 4"),
    
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
            
            actionButton("sample", "New Sample"),
            
            br(),
            
            downloadButton("download", "Download Sample")
        ),
        
        mainPanel(
            
            tabsetPanel(
                
                tabPanel("Plot",
                    plotOutput("plot")
                    
                    # verbatimTextOutput("test")
                ),
                
                tabPanel("Summary",
                    verbatimTextOutput("summary")
                ),
                
                tabPanel("Table",
                    dataTableOutput("table")
                ),
                
                type = "tabs" # also try pills
            )
            
        )
    )
))