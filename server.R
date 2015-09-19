source("scripts/cleaning.R")

library(ggplot2)
library(googleVis)

shinyServer(function(input,output){

  output$map <- renderGvis({
      state.df <- subset(tidydata, state == input$state)    
      geo <- gvisGeoChart(state.df,
                          'state',
                          options=list(region="US",
                                       displayMode="regions",
                                       resolution="provinces"))
      geo      

      })

  output$plot <- renderPlot({
    state.df <- subset(tidydata, state == input$state)    
    income <- as.numeric(input$income)
    
    # method of commute by income
    totalincomelevel.drovealone <- state.df$drovealone16yearsandoverwithearnings * state.df[,income]
    totalincomelevel.carpool <- state.df$drovealone16yearsandoverwithearnings * state.df[,income + 9]
    totalincomelevel.publictrans <- state.df$drovealone16yearsandoverwithearnings * state.df[,income + 18]
    
    # sum of above methods
    sum.income <- sum(totalincomelevel.drovealone,totalincomelevel.carpool,totalincomelevel.publictrans)
    
    results.df <- data.frame(Method = c("Drive Alone*","Carpool","Public Transportation**"),
                             Percentage = c((totalincomelevel.drovealone/sum.income),
                                            (totalincomelevel.carpool/sum.income),
                                            (totalincomelevel.publictrans/sum.income)))
    p <- ggplot(results.df) + geom_bar(aes(Method,Percentage, fill=Percentage), stat="identity")
    print(p)
  }, height=350)  
})