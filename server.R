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
    totalincomelevel.carpool <- state.df$carpooled16yearsandoverwithearnings * state.df[,income + 17]
    totalincomelevel.publictrans <- state.df$publictrans16yearsandoverwithearnings * state.df[,income + 34]
    
    # sum of above methods
    sum.income <- sum(totalincomelevel.drovealone,totalincomelevel.carpool,totalincomelevel.publictrans)
    
    # upper and lower margins
    uppermargin.drovealone <- state.df$drovealone16yearsandoverwithearnings * (state.df[,income] + state.df[,income + 1])
    lowermargin.drovealone <- state.df$drovealone16yearsandoverwithearnings * (state.df[,income] - state.df[,income + 1])

    uppermargin.carpooled <- state.df$carpooled16yearsandoverwithearnings * (state.df[,income + 17] + state.df[,income + 18])
    lowermargin.carpooled <- state.df$carpooled16yearsandoverwithearnings * (state.df[,income + 17] - state.df[,income + 18])
    
    uppermargin.publictrans <- state.df$publictrans16yearsandoverwithearnings * (state.df[,income + 34] + state.df[,income + 35])
    lowermargin.publictrans <- state.df$publictrans16yearsandoverwithearnings * (state.df[,income + 34] - state.df[,income + 35])
    
    # create a dataframe with method, percentage and margins for plotting
    results.df <- data.frame(Method = as.factor(c("Drive Alone*","Carpool","Public Transportation**")),
                             Percentage = c((totalincomelevel.drovealone/sum.income),
                                            (totalincomelevel.carpool/sum.income),
                                            (totalincomelevel.publictrans/sum.income)),
                             `Upper Margin` = c((uppermargin.drovealone/sum.income),
                                                (uppermargin.carpooled/sum.income),
                                                (uppermargin.publictrans/sum.income)),
                             `Lower Margin` = c((lowermargin.drovealone/sum.income),
                                                (lowermargin.carpooled/sum.income),
                                                (lowermargin.publictrans/sum.income)))
    # refactor levels
    results.df$Method <- factor(results.df$Method, levels=c("Drive Alone*",
                                                            "Carpool",
                                                            "Public Transportation**"))
    # plot
    p <- ggplot(results.df, aes(fill=Percentage, y=Percentage, x=Method)) + 
      geom_bar(position="dodge", stat="identity") +
      geom_errorbar(aes(ymin=Lower.Margin,ymax=Upper.Margin)) +
      ggtitle("Methods of Commuting with Margin of Error as Error Bars")
    print(p)
  }, height=350)  
})