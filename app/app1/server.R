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
source('caculate.R')
res = caculate("方案一")
ROI_1 = res$ROI
res = caculate("方案二")
ROI_2 = res$ROI
res = caculate("方案三")
ROI_3 = res$ROI
res = caculate("方案四")
ROI_4 = res$ROI

ROI = c(ROI_1[[1]], ROI_2[[1]], ROI_3[[1]], ROI_4[[1]])
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  res = reactive({caculate(input$scheme)  })
  df = reactive({res()$df})
  #ROI = reactive({res()$ROI})
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    x = df()$NetProfit
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    par(mfrow = c(1,2))
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = rainbow(sample(24, 2)), border = 'white', main = "Histogram of NetProfit")
    x = df()$TotalCost
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = rainbow(sample(24, 2)), border = 'white', main = "Histogram of TotalCost")
  })
  output$piePlot <- renderPlot(
    {
      slices <- df()$Suite
      lbls <- paste0("Suite_", 1:11)
      pie3D(slices, labels=lbls, explode=input$explode,
            main="3D Pie Chart ", col = rainbow(sample(24, length(lbls))))
    }
  )
  output$ROIPlot <- renderPlot(
    {
      par(mfrow = c(1, 2))
      plot(c(1:4), ROI, "l", xlab = "Scheme", main = "different schemes")
      lbls <- paste0("Scheme_", 1:4)
      fan.plot(ROI, labels = lbls, main = "Fan Plots", col = rainbow(input$color*sample(24, 2)))
    }
  )
  
})
