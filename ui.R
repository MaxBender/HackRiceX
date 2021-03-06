library(shiny)
library(shinythemes)

# Define UI for application that plots random distributions 
shinyUI(fluidPage(
  theme = shinytheme("superhero"),
  
  # Application title
  headerPanel("Hello Shiny!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1,
                max = 1000, 
                value = 500)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("distPlot")),
      tabPanel("Data", dataTableOutput('data')),
      tabPanel("Short-Term Liabilities", "SHORT")
      
    )
  )
))