source("scripts/cleaning.R")

library(ggplot2)

shinyServer(function(input,output){

  output$prob <- renderText({
    state.df <- subset(tidydata, state == input$state)
    age <- as.numeric(input$age)
    income <- as.numeric(input$income)
    
    # method of commute by age
    totaldrovealone <- state.df$drovealone16yearsandover[1] * state.df[,age]
    totalcarpool <- state.df$carpooled16yearsandover[1] * state.df[,age+7]
    totalpublictrans <- state.df$publictrans16yearsandover[1] * state.df[,age+14]
    
    # sum of above methods
    sum <- sum(totaldrovealone,totalcarpool,totalpublictrans)
    
    # method of commute by income
    totalincomelevel.drivealone <- state.df$drovealone16yearsandoverwithearnings * state.df[,income]
    totalincomelevel.carpool <- state.df$drovealone16yearsandoverwithearnings * state.df[,income + 9]
    totalincomelevel.publictrans <- state.df$drovealone16yearsandoverwithearnings * state.df[,income + 18]
    
  })

})