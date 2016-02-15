library(quantmod)
#scales is used to plot return in percentage
library(ggplot2)

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    data <- getSymbols(input$symb, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
    #adjusted <- paste(input$symb,".Adjusted",sep="")
    #volume <- paste(input$symb,".Volume",sep="")
    #data <- data[, c(adjusted,volume), drop=F]
    
    chartSeries(data,theme=chartTheme("white"),name=input$symb,
                type="candle",TA=ifelse(input$SMA90==TRUE,"addSMA(90)","NULL"))
    #addSMA(n = 90, on = 1, with.col = Cl, overlay = TRUE, col = "red")
    addVo()
    
    
    
    
  })
  output$plot_return <- renderPlot({
    data <- getSymbols(input$symb, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
    adjusted <- paste(input$symb,".Adjusted",sep="")
    data <- data[, adjusted, drop=F]
    
    plot(x=round(monthlyReturn(data)*100,2),ylim=c(-10,10),ylab="Return Percentage", main="Monthly Return")
  })
  
  
})