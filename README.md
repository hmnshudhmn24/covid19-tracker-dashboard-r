
# 🧬 COVID-19 Tracker & Dashboard

An interactive COVID-19 Tracker & Dashboard built with R and Shiny that visualizes live pandemic data using interactive charts.

## 🚀 Features

- 📊 Real-time COVID-19 data from Our World In Data
- 🌐 Country selection dropdown
- 📈 Total cases and new daily cases charts
- 🔍 Interactive and zoomable plots using Plotly
- 🧩 Easy to deploy with `shiny::runApp()`

## 🛠️ Tech Stack

- R
- Shiny (for dashboard UI)
- httr & jsonlite (for API calls)
- Plotly (for interactive visualizations)

## 📦 Setup Instructions

1. Clone or download this repo:

```bash
git clone https://github.com/yourusername/covid19-dashboard.git
```

2. Open R or RStudio and install required libraries:

```r
install.packages(c("shiny", "httr", "jsonlite", "plotly"))
```

3. Run the app:

```r
shiny::runApp("path/to/covid19-dashboard")
```

## 📌 Notes

- Data Source: [Our World In Data COVID-19 Dataset](https://covid.ourworldindata.org/)
- Default country code is set to `"IND"` (India). You can change it in the dropdown.

## 📸 Screenshots

> Add screenshots here after running the dashboard!


##🔌 Data Source
This dashboard uses the free and open COVID-19 API provided by:

🔗 disease.sh - Open Disease Data API
