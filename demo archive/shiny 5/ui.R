library(shiny)
library(shinythemes)

# dynamic UI demo
# session
# shinytheme

shinyUI(fluidPage(
    
    titlePanel("Shiny Demo 5"),
    
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
                           "Cauchy" = "cauchy",
                           "Beta" = "beta",
                           "F" = "f",
                           "Gamma" = "gamma",
                           "Uniform" = "unif",
                           "Weibull" = "weibull",
                           "Binomial" = "binom",
                           "Negative Binomial" = "nbinom")),
            
            numericInput("par1", "Parameter 1",
                         value = 0, 
                         min = 0,
                         step = 0.01),
            
            numericInput("par2", "Parameter 2",
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
    
    # theme = shinytheme("cosmo") # cerulean, cosmo, flatly, journal, readable, spacelab, united
))