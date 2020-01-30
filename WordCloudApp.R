
##########################################
##                                      ##
##  Word-Cloud of Countries with highest 
##  Number of users                     ##
##                                      ##
##########################################
library(shiny)
library(readxl)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(memoise)

w <- getwd()
print(w)

mydata <- as.data.frame(read_excel("Correlation.xlsx", sheet = 1))
myCloud <- mydata[,c(4)]
ui <- fluidPage("Countries with Highest number of users", 
                
                plotOutput(outputId = 'scatterPlot', width = "60%", height = "700px")
)
server <- function(input, output) {
  
  output$scatterPlot <- renderPlot({
    wordcloud(myCloud, ,c(8,.7),2,,TRUE,TRUE,.15,)
    
  })
}

shinyApp(ui = ui, server = server)

