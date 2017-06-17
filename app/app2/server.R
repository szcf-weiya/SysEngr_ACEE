#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotrix)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  source('caculate_single.R')
  res = reactive({
    caculate_single(input$num,
                    input$price,
                    input$cost,
                    input$area,
                    input$type,
                    input$devcost,
                    input$landvalue)
  })
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    slices <- c(res()$AllDevCost, res()$ValueofLand, res()$TransferTax,res()$AllDevSpence )
    lbls <- c("AllDevCost", "ValueofLand", "TransferTax", "AllDevSpence")
    set.seed(input$color*999)
    pie3D(slices, labels=lbls, explode=input$explode,
          main="3D Pie Chart ", col = rainbow(sample(12, length(lbls))))
    # draw the histogram with the specified number of bins
    
  })
  output$results <- renderTable(
    {
      res()
    }
  )
})
