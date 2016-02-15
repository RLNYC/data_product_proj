library(shiny)

shinyUI(fluidPage(
  titlePanel("Stock Price Graph and Return"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input a valid stock symbol and date range to examine the price (adjusted for splits and dividends) trend and monthly return."),
      helpText("Information source is from yahoo finance."),
      
      textInput("symb", "Symbol", "NLY"),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2015-01-01", 
                     end = as.character(Sys.Date())),
      
      
      br(),
      br(),
      
      checkboxInput("SMA90","90 Days Simple Moving Average",value=TRUE)
  
    ),
    
    mainPanel(tabsetPanel(type = "tabs", 
                          tabPanel("Plot", plotOutput("plot")),  
                          tabPanel("Monthly Return Table", plotOutput("plot_return"))
    )
    )
  )))