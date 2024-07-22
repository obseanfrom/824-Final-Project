library(shiny)
covid_19 <<- read.csv("covid_19.csv")[,c(1,6,8)]


ui <- fluidPage(
  covid_19 <- read.csv("covid_19.csv")[,c(1,6,8)],
  titlePanel("Covid 19 cases"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("country","cases", 0, 100000, c(25, 40)),
      selectInput("countryInput","country",
                  choices = covid_19$country)
    )
  )
)

#create server function
server <- function(input, output) {}

shinyApp(ui = ui, server = server)