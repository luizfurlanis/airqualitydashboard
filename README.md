# Traffic Accident Dashboard
> _This application was made with [Shiny](https://shiny.rstudio.com/), a web framework for R and Python. This app is available at: [TrafficAccidentDashboard](https://furlanis.shinyapps.io/TrafficAccident/)_

## About 

The UK government amassed traffic data from 2000 and 2014, recording over **1.5 million** accidents in the process and making this one of the most comprehensive traffic data sets out there. It's a huge picture of a country undergoing change. All the contained accident data comes from police reports, so this data does not include minor incidents.

The Traffic Accident Dashboard was made at first to learn specific features like map creation with **Leaflet** and apps creation with **Shiny**, in addition the
dashboard help to visualize a serious problem, witch is the traffic accidents, in this case we look only to UK, even though it is possible to see that the cases continue to grow all over the years, for many different factor. To have a idea of bad this situation is, the combined number of accidents all over the year displayed in the application is 1.504.150. This number is almost all the Northern Ireland in numbers of population.

Besides the data part of the accidents, the application can be used like a model for many other data type that uses a map and a generic input, you just need to change the plot in the data, the input values and then you will have a complete dashboard, for any purpose you want.

The dataset that was used in this project is available at [Kaggle](https://www.kaggle.com/datasets) website, they have different datasets of all niches. I used the [UK Traffic Accidents](https://www.kaggle.com/datasets/daveianhickey/2000-16-traffic-flow-england-scotland-wales), but they have many others car crash datasets.

## Production

To create the map, the [Leaflet](https://github.com/Leaflet/Leaflet) and the [echarts4r](https://echarts4r.john-coene.com) package was used, both framework helps and make easier to create interactive maps and graphics.  

Leaflet and echarts4r installation:
```r
install.packages("leaflet")
install.packages("echarts4r")
```

### Leaflet

To create the map, the package has it own function, so you just need to call this function and write the parameter that you want.

Map creation:
```r
ui <- fluidPage(

  leafletOutput("map")
)

server <- function(input,output,session) {

  output$leaflet <- renderLeaflet({
      leaflet() %>%
      addTiles() %>%
      setView(latitude = 133.7751, longitude = -30.6753, zoom = 4)
  })
}
```

Now your map is already working, the only thing that we have to do is to plot the data, that we collect. In this case de _Australian Fatal Road Accident_ data. To plot it, was used a reactive ambient inside the server function, then when the user changes the year input, the plot will change "automatically".

Ploting the data:
```r
observe({

  leafletProxy(session$ns("leaflet")) %>%
      clearMarkers() %>%
      addCircleMarkers(
        data = map_country,
        lat = ~lat,
        lng = ~long,
        radius = pmax(radius, 7),
        color = "red",
        fillOpacity = 0.55,
        weight = 0,
        label = ~sprintf("%s : %g", Country, AQI.Value),
        labelOptions = labelOptions(
          style = list("font-weight" = 'normal', padding = '5px 10px'),
          textsize = '15px',
          direction = 'auto'
        )
      )
})
```
Now you have the map with the plots you want. It is possible to make it changes with the user input using reactivity, this is why the observe is there,
but in this dashboard case we will not use it. 

### echarts4r

Now, to create the graphics using echarts4r, just like leaflet it has the function to do it, in this specific case we are using the pie chart.

Pie chart creation:
```r
ui <- fluidPage(

  echarts4rOutput('chart')
)

server <- function(input,output,session) {

    output$chart <- renderEcharts4r({
      data |>
        e_charts(AQI.Category) |>
        e_pie(Total, roseType = 'radius') |>
        e_title("World Air Quality") |>
        e_tooltip()
    })
}
```
As you can see, differently that leaflet map, the plots are not needed here, because it is only a chart, not a map or a tribble that need a ploting functions,
so with only these simple commands you already create your pie chart, to use whatever you want.

To create the second graphic we use echart4r again, but now it is another function. We will use 

Now that you have your map and graphic, you can combine them in a Shiny app like this one, or use how you desire to. Have fun :smiley:
















