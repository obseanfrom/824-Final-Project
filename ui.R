library(shiny)
library(bslib)
data(data)
ui <- page_sidebar(
  title = "test Shiny",
  sidebar = sidebar(
    sliderInput(
      inputId = "deaths",
      label = "number of deaths:",
      min = 0,
      max = max(data$Deaths),
      value = 21
    )
  ),
  plotOutput(outputId = "distPlot")
)