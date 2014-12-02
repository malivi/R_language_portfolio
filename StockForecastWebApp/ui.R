library(shiny)

choices_companies <- list("Apple Inc." = "AAPL",
                          "Microsoft Corp" = "MSFT",
                          "Intel Corp" = "INTC",
                          "Google Inc A" = "GOOGL",
                          "Google Inc C" = "GOOG",
                          "Facebook Inc" = "FB",
                          "Intl Business Machines Corp" = "IBM",
                          "QUALCOMM Inc" = "QCOM",
                          "Oracle Corp" = "ORCL",
                          "Cisco Systems Inc" = "CSCO")

shinyUI(navbarPage("Forecast",
 tabPanel("App",
  titlePanel("Stock gains/losses forecast for the largest IT companies with entrance last Friday and exit after a few weeks"),
  sidebarLayout(

    sidebarPanel(
      selectInput("select", label = h5("Select a company from the list:"),
                  choices = choices_companies, 
                  selected = "APPL"),
      br(),
      numericInput("stocks_number", label = h5("Number of stocks bought:"),
                   value = 100),
      br(),
      numericInput("weeks_held", label = h5("Number of weeks held :"),
                   value = 1),
      br(),
      radioButtons("radio", label = h5("Select model:"),
                   choices = list("ETS(A, A, A)" = 1, "ARIMA(1, 1, 0)(1, 1, 0) [5]" = 2), 
                   selected = 1),
      br(),
      tags$style(type='text/css', '#gains_losses { color: red;}'),
      h5("Gains/losses forecast in dollars (lower/mean/upper with 80% CI):"),
      verbatimTextOutput("gains_losses")),
      
    mainPanel(plotOutput("plot1"), plotOutput("plot2"))
                )
         ),
  
 tabPanel("Documentation",
     h3("Stock gains/losses forecast for the largest IT companies with entrance last Friday and exit after a few weeks"),
     p("The application fetch historical stock prices (last 16 weeks) of the selected IT company from YAHOO finance, then fits two forecast models with the use of previous closing prices. A model is chosen from each of the two most known forecast model families."),
     p("The first is a state space model with additive error, trend and seasonality: ETS(A, A, A)."),
     p("The second is an ARIMA model with seasonality: ARIMA(1, 1, 0)(1, 1, 0)[5]"),
     p("It must be noted that the specific models were chosen intuitively and only for plotting purposes and to demonstrate the application functionality."),
     br(),
     h4("Input from the user"),
     strong("Select a company from the list: "),
     p("Choose one of the largest IT companies for analysis"),
     strong("Number of stocks bought:"),
     p("Give the number of stocks that were bought last Friday (entrance day)"),
     strong("Number of weeks held:"),
     p("The number of weeks that the stocks will be held, current week included"),
     strong("Select model"),
     p("Select the forecast model that you want to use for the calculation of gain/losses"),
     br(),
     h4("Output plots and values"),
     strong("dataInput plot:"),
     p("The plot of values fetched from YAHOO (all the daily prices for the last 16 weeks)"),
     strong("Two forecast plots, one for each model:"),
     p("The forecast plots of the two models for a month are presented"),
     strong("Gains/losses forecast in dollars (lower/mean/upper with 80% CI):"),
     p("Forecast of gain or losses in dollars. Three values are shown: a) the lower bound, b) mean and c) the upper bound of the expected value with the use of 80% Confidence Interval")
  )
))
