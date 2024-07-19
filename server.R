library(shiny)
data(data)
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bin <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "$007bc2", border = "white", 
         xlab = "Waiting time to next eruption (mins)",
         main = "histogram of wait time")
  })
}