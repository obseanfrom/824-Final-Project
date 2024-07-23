library(tidyverse)
library(ggplot2)
library(shiny)
library(DT)
library(ggthemes)

vars <- setdiff(unique(mpg$class), "Class")
vars.2 <- setdiff(unique(mpg$manufacturer), "Manufacturer")

#create server function
server <- function(input, output, session) {
  current.data <- reactive({
    data.1 <- subset(mpg, class == input$Class & manufacturer == input$Manufacturer)
  })
  current.data.2 <- reactive({
    data.1 <- subset(mpg, manufacturer == input$Manufacturer)
  })
  output$table <- renderDT({
    as.data.frame(table(mpg$class, mpg$manufacturer, dnn = c("class","manufacturer")))
  })
  output$hist <- renderPlot(
    ggplot(current.data()) + 
      geom_histogram(aes(x = hwy)) +
      ggtitle(paste(input$Class, "highway miles per gallon built by", input$Manufacturer)) +
      xlab("Highway miles per gallon") +
      theme_stata() +
      theme(legend.position = "none")
  )
  output$bar <- renderPlot(
    ggplot(current.data.2()) +
      geom_bar(aes(x = class, fill = class)) +
      ggtitle("Class distribution by selected manufacturer") +
      xlab("Class") +
      theme_stata() +
      theme(legend.position = "none")
  )
}

ui <- fluidPage(
  titlePanel("Highway MPG by Class"),
  fluidRow(
    column(3,
      selectInput("Class","class", vars),
      selectInput("Manufacturer","manufacturer", vars.2)),
    column(9,
      plotOutput('hist'),
      plotOutput('bar'),
      DTOutput('table')
      )
    )
)

shinyApp(ui = ui, server = server)