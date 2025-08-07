
library(shiny)
library(httr)
library(jsonlite)
library(plotly)

# Fetch COVID-19 data from Our World in Data
url <- "https://covid.ourworldindata.org/data/owid-covid-data.json"
response <- GET(url)
data_json <- content(response, "text")
data_list <- fromJSON(data_json)

# Extract countries and basic case info
get_country_data <- function(country_code) {
  country_data <- data_list[[country_code]]$data
  df <- data.frame(
    date = as.Date(sapply(country_data, function(x) x$date)),
    total_cases = sapply(country_data, function(x) ifelse(is.null(x$total_cases), NA, x$total_cases)),
    new_cases = sapply(country_data, function(x) ifelse(is.null(x$new_cases), NA, x$new_cases))
  )
  return(df)
}

ui <- fluidPage(
  titlePanel("🧬 COVID-19 Tracker Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("country", "Select a Country:", choices = names(data_list), selected = "IND")
    ),
    mainPanel(
      plotlyOutput("cases_plot"),
      plotlyOutput("new_cases_plot")
    )
  )
)

server <- function(input, output) {
  selected_data <- reactive({
    get_country_data(input$country)
  })

  output$cases_plot <- renderPlotly({
    plot_ly(selected_data(), x = ~date, y = ~total_cases, type = 'scatter', mode = 'lines+markers',
            name = 'Total Cases') %>%
      layout(title = "Total COVID-19 Cases Over Time", xaxis = list(title = "Date"), yaxis = list(title = "Cases"))
  })

  output$new_cases_plot <- renderPlotly({
    plot_ly(selected_data(), x = ~date, y = ~new_cases, type = 'scatter', mode = 'lines+markers',
            name = 'New Daily Cases') %>%
      layout(title = "New Daily COVID-19 Cases", xaxis = list(title = "Date"), yaxis = list(title = "Cases"))
  })
}

shinyApp(ui = ui, server = server)
