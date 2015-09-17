source("scripts/cleaning.R")

library(ggplot2)

shinyServer(function(input,output){

  output$plot <- renderPlot({
    
  })
  output$prob <- renderTable({
    
    state.df <- subset(tidydata, state == input$state)    
    income <- as.numeric(input$income)
    
    # method of commute by income
    totalincomelevel.drovealone <- state.df$drovealone16yearsandoverwithearnings * state.df[,income]
    totalincomelevel.carpool <- state.df$drovealone16yearsandoverwithearnings * state.df[,income + 9]
    totalincomelevel.publictrans <- state.df$drovealone16yearsandoverwithearnings * state.df[,income + 18]
    
    # sum of above methods
    sum.income <- sum(totalincomelevel.drovealone,totalincomelevel.carpool,totalincomelevel.publictrans)
    
    results.df <- data.frame(Method = c("Drive Alone*","Carpool","Public Transportation**"),
                             Probability = c((totalincomelevel.drovealone/sum.income),
                                             (totalincomelevel.carpool/sum.income),
                                             (totalincomelevel.publictrans/sum.income)))
    results.df
    
  })

})