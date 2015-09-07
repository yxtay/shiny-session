library(shiny)

# showcase mode
# layout
# widgets: sliderInput vs numericInput
# slider animate
# action button

shinyUI(
    
    fluidPage(
        
        titlePanel("Shiny Demo 1"),
        
        sidebarLayout(
            
            sidebarPanel(
                
                sliderInput("n", 
                            "Number of observations:", 
                            value = 500,
                            min = 0, 
                            max = 1000),
                
                actionButton("button", "Sample"),
                
                h1("Heading 1"),
                
                h2("Heading 2"),
                
                h3("Heading 3"),
                
                h4("Heading 4"),
                
                h5("Heading 5"),
                
                h6("Heading 6"),
                
                a("Shiny website", href = "http://shiny.rstudio.com/")
                
            ),
            
            mainPanel(
                
                plotOutput("plot"),
                
                hr(),
                
                p("This is a paragraph."),
                
                strong("This is bold."),
                
                em("This is italicised."),
                
                "This is a text with no markup."
            )
        )
    )
)