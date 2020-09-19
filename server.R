library(shiny)
library(DT)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  
  gdf <- reactive({
    read.csv("/Users/maxbender/Documents/GitHub/HackRiceX/Respitory\ Symptoms.csv")
  })
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$distPlot <- renderPlot({
    # generate an rnorm distribution and plot it
    dist <- rnorm(input$obs)
    hist(dist)
  })
  
  output$data = renderDataTable(
    gdf(),
    options = list(
      pageLength = 25,
      lengthMenu = c(10,25,50,100,300)
    ))
  
})