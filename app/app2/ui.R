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
  titlePanel("单房型核算"),
  
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
       numericInput("landvalue",
                    "土地价格",
                    min = 0,
                    max = 2000,
                    value = 1000),
       selectInput("type",
                   "房型",
                   choices = c("普通宅", "非普通宅", "其他")),
       selectInput("devcost",
                   "是否允许扣除开发成本",
                   choices = c("允许扣除", "不允许扣除")
                   ),
       numericInput("area",
                    "房型面积",
                    min = 0,
                    max = 250,
                    value = 100),
       numericInput("num",
                    "建房套数",
                    min = 0,
                    max = 500, step =1,
                    value = 100),
       numericInput("cost",
                    "开发成本",
                    min = 0,
                    max = 10000,
                    value = 1000),
       numericInput("price",
                    "售价",
                    min = 0,
                    max = 100000,
                    value = 1000)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       tableOutput("results")
    )
  )
))
