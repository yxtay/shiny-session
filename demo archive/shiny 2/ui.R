library(shiny)

# widgets
# render output
# table vs data table

shinyUI(fluidPage(
    
    titlePanel("Shiny Demo 2"),
    
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
                         value = 0, step = 0.01),
            
            numericInput("par2", "Scale",
                         value = 1, step = 0.01),
            
            actionButton("sample", "New Sample")
        ),
        
        mainPanel(
            
            plotOutput("plot"),
            
            verbatimTextOutput("summary"),
            
            dataTableOutput("table")
            
        )
    )
))