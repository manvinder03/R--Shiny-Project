##########################################
##                                      ##
##        Bar App                       ##
##                                      ##
##########################################

library(shiny)
library(readxl)
app <- as.data.frame(read_excel("TB_Burden_Country(2).xlsx", sheet = 1))
dataPoints <- app[, 28:30]
ui <- fluidPage("Bar Graphs", 
                sliderInput(inputId = "sliderVal", label = "Select value", 
                            min = 1, max = 500, value = 100, step = 1, ticks = TRUE),
                selectInput(inputId = 'xData', label = "Please select a Variable", 
                            choices = names(dataPoints),
                            selected = names(dataPoints)),
                plotOutput(outputId = 'appPlot', width = "100%", height = "500px")
)
server <- function(input, output) {
  output$appPlot <- renderPlot({
    title <- "Bar Graphs"
    hist(dataPoints[,input$xData], main = title, xlab = input$xData,
         breaks = input$sliderVal)
  })
}

shinyApp(ui = ui, server = server)
