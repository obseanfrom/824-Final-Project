data(covid_19) #input data here may not be necessary.

#create server function
function(input, output) {
  #create data frame based on intended data
  selectedData <- reactive({
    covid_19[,c(input$xcol, input$ycol)]
  })
#create plot
  output$plot1 <- renderPlot({
    plot(selectedData())
  })
