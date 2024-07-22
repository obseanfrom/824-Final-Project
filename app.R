library(tidyverse)
library(ggplot2)
library(bslib)
library(shiny)

vars <- setdiff(unique(mpg$class), "Class")
vars.2 <- setdiff(unique(mpg$manufacturer), "Manufacturer")

#create server function
server <- function(input, output, session) {
  
  output$table <- renderTable(
    mpg %>% count(manufacturer, class)
  )
  output$hist <- renderPlot(
    hist(mpg$hwy[(mpg$class==input$Class) & (mpg$manufacturer==input$Manufacturer)],
         main = paste(input$Manufacturer,"", input$Class),
         ylab = "Frequency",
         xlab = "Highway miles per gallon")
  )}

ui <- fluidPage(
  titlePanel("Highway MPG by Class"),
  fluidRow(
    column(2,
      selectInput("Class","class", vars),
      selectInput("Manufacturer","manufacturer", vars.2)),
    column(5,
      plotOutput('hist'),
      tableOutput('table')
      )
    )
)

shinyApp(ui = ui, server = server)