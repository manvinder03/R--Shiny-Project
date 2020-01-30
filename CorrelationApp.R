##########################################
##                                      ##
##  Correlation App                     ##
##                                      ##
##########################################
library(shiny)
library(readxl)
library(dplyr)
library(ggplot2)
w <- getwd()
print(w)

mydata <- as.data.frame(read_excel("Correlation.xlsx", sheet = 1))
mydatacorr <- mydata[,c(2,3,4,5,6)]

ui <- fluidPage("Correlation", 
                selectInput(inputId = 'xData', label = "Select x-axis data:", 
                            choices = names(mydatacorr)),
                selectInput(inputId = 'yData', label = "Select y-axis data:", 
                            choices = names(mydatacorr),
                            selected = names(mydatacorr)[[2]]),
                plotOutput(outputId = 'scatterPlot', width = "40%", height = "600px")
)
server <- function(input, output) {
  
  output$scatterPlot <- renderPlot({
    title = "Correlation Between viewer, Love-it, Downloads, Sprites, Scripts"
    ggplot(mydatacorr, aes(mydatacorr[,input$xData], mydatacorr[,input$yData])) +
      geom_point( colour = 'blue') +
      geom_smooth(method = lm, se = FALSE, col = "red") +
      ggtitle("Plot of Correlation with Trend- line") +
      xlab(input$xData) + ylab(input$yData)
    
  })
}

shinyApp(ui = ui, server = server)



