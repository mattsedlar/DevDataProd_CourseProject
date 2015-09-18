source("scripts/cleaning.R")

library(ggplot2)
library(googleVis)

shinyServer(function(input,output){

  output$plot <- renderGvis({
    
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

    bar <- gvisColumnChart(results.df,
                        options = list(hAxes="[{textStyle:{fontSize:11,auraColor:'none'},
                                       textPosition:'out'}]",
                                       vAxes="[{title:'Percentage'}]",
                                       legend="none",
                                       width=550))
    geo <- gvisGeoChart(state.df,
                        'state',
                        options=list(region="US",
                                     displayMode="regions",
                                     resolution="provinces",
                                     width=250))
    
    bargeo <- gvisMerge(geo,bar,horizontal=TRUE)
    bargeo
  })
  
  output$state <- renderGvis({

  })

})