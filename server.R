library(tidyverse)
library(ggplot2)
#create server function
function(input, output) {
  output$caseplot <- renderPlot(
    hist(mpg$hwy[mpg$class==input$Class],
         main = input$Class,
         ylab = "Frequency",
         xlab = "Highway miles per gallon")
)}