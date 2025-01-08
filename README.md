# Traffic Accident Dashboard
> _This application was made with [Shiny](https://shiny.rstudio.com/), a web framework for R and Python._

## About 

The UK government amassed traffic data from 2000 and 2014, recording over **1.5 million** accidents in the process and making this one of the most comprehensive traffic data sets out there. It's a huge picture of a country undergoing change. All the contained accident data comes from police reports, so this data does not include minor incidents.

The Traffic Accident Dashboard was made at first to learn specific features like map creation with **Leaflet** and apps creation with **Shiny**, in addition the
dashboard help to visualize a serious problem, witch is the traffic accidents, in this case we look only to UK, even though it is possible to see that the cases continue to grow all over the years, for many different factor. To have a idea of bad this situation is, the combined number of accidents all over the year displayed in the application is 1.504.150. This number is almost all the Northern Ireland in numbers of population.

Besides the data part of the accidents, the application can be used like a model for many other data type that uses a map and a generic input, you just need to change the plot in the data, the input values and then you will have a complete dashboard, for any purpose you want.

The dataset that was used in this project is available at [Kaggle](https://www.kaggle.com/datasets) website, they have different datasets of all niches. I used the [UK Traffic Accidents](https://www.kaggle.com/datasets/daveianhickey/2000-16-traffic-flow-england-scotland-wales), but they have many others car crash datasets.

## Production

To create the map, the [Leaflet](https://github.com/Leaflet/Leaflet) package was used, a framework that helps and make easier to create maps or graphics.  

Leaflet installation:
```r
install.packages("leaflet")
```

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
}
```

Now your map is already working, the only thing that we have to do is to plot the data, that we collect. In this case de _Australian Fatal Road Accident_ data. To plot it, was used a reactive ambient inside the server function, then when the user changes the year input, the plot will change "automatically".

Ploting the data:
```r
observe({

  data <- input$year

  leafletProxy("map") %>%
    clearMarkers() %>%
      addCircleMarkers(
      data = data,
      lng = ~long,
      lat = ~lat,
      popup = ~city,
      radius = ~n,
      label = ~paste(city, ":", n),
      weight = 0,
      fillColor = "red",
      fillOpacity = 0.5
      )
})
```
Now you have the map with the plots you want,and it changes accordingly with the user input. 

Have fun :smiley:
















