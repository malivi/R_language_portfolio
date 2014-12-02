# server.R


library(quantmod)
library(lubridate)
library(forecast)

weeks_back <- 16

shinyServer(function(input, output) {
     
     dataInput <- reactive({  
          getSymbols(input$select, src = "yahoo",
                             from = Sys.Date() - weeks_back*7 -
                                  wday(Sys.Date()) + 2,
                             to = Sys.Date() - wday(Sys.Date()) - 1,
                             auto.assign = FALSE)
     })
     
  
     output$plot1 <- renderPlot({
          chartSeries(dataInput(), theme = chartTheme("white"))
     })
     output$plot2 <- renderPlot({
          data <- dataInput()
          fit1 <<- ets(ts(data[, 4], frequency = 5),
                       model = "AAA")
          fit2 <<- arima(ts(data[, 4], frequency = 5),order = c(1, 1, 0),
                         seasonal = list(order = c(1, 1, 0), period = 5))
          par(mfrow = c(1, 2), cex.main = 0.7, cex.axis = 0.7)
          plot(forecast(fit1, h = 20), xlim = c(13, 20),
               ylab = "stock price", xlab = "week number")
          plot(forecast(fit2, h = 20), xlim = c(13, 20),
               ylab = "stock price", xlab = "week number")
     })
     output$gains_losses <- renderPrint({
          data <- dataInput()
          if (input$radio == 1) {
               fit_plot <- fit1
          }
          else {
               fit_plot <- fit2
          }
          cat(paste(round(input$stocks_number*(as.data.frame(
               forecast(fit_plot,
                        h = 5*input$weeks_held))[5*input$weeks_held,
                              c(2, 1, 3)] - as.numeric(
                                   data[nrow(data), 4])),
                                   digits = 2), " "))
     })
})     
                                           