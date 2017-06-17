#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("核算"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("explode",
                  "Explode",
                  min = 0,
                  max = 1,
                  value = 0.1),
      sliderInput("color",
                  "Color",
                  min = 0,
                  max = 1,
                  value = 0.1),
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       selectInput("scheme",
                    "方案",
                    choices = c("方案一","方案二", "方案三", "方案四")),
      checkboxInput(inputId = "compare",
                    label = strong("Show comparison"),
                    value = FALSE)
      
       
       # selectInput("fangxing",
       #             "房型",
       #             min = 1,
       #             max = 11),
       # numericInput("num",
       #              "建房套数",
       #              min = 0,
       #              max = 500),
       # numericInput("price",
       #              "售价",
       #              min = 0,
       #              max = 20000)
    ),
    
    # Show a plot of the generated distribution\
    mainPanel(
       conditionalPanel(condition = "input.compare == false",
                        plotOutput("distPlot"),
                        plotOutput("piePlot")),
       conditionalPanel(condition = "input.compare == true",
                        plotOutput("ROIPlot")
                        )
    )
  )
))
