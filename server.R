source("scripts/cleaning.R")

library(ggplot2)

shinyServer(function(input,output){

  output$prob <- renderText({
    state.df <- subset(tidydata, state == input$state)
    age <-as.numeric(input$age)
    income <- input$income
    
    totaldrovealone <- state.df$drovealone16yearsandover[1] * state.df[,age]
    totalcarpool <- state.df$carpooled16yearsandover[1] * state.df[,age+7]
    totalpublictrans <- state.df$publictrans16yearsandover[1] * state.df[,age+14]

    sum <- sum(totaldrovealone,totalcarpool,totalpublictrans)
    
    
  })

})