library(bslib)

vars <- setdiff(unique(mpg$class), "Class")

fluidPage(
  titlePanel("Highway MPG by Class"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Class","class", vars)),
    mainPanel(
      plotOutput("caseplot")
  ))
)