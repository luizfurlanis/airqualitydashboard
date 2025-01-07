# Road Accident Dashboard
> _This application was made with [Shiny](https://shiny.rstudio.com/), a web framework for R and Python._

## About 

The Road Accident Dashboard was made at first to learn specific features like map creation with **Leaflet** and apps creation with **Shiny**, in addition the
dashboard help to visualize a serious problem, witch is the road accidents, in this case we look only to Australia, even though it is possible to see that the cases continue to grow all over the years, for many different factor. 
Besides it, the application can be used like a model for many other data type, you just need to change the plot in the data, the input values and then you will have a complete dashboard, for any purpose you want.

### Data

The Australian Road Deaths Database provides basic details of road transport crash fatalities in Australia as reported by the police year to the State and Territory road safety authorities. Road deaths from recent months are preliminary and the series is subject to revision. 

The dataset that was used in this project is available at [Kaggle](https://www.kaggle.com/datasets) website, they have different datasets of all niches. I used the [Australian Fatal Road Accident](https://www.kaggle.com/datasets/deepcontractor/australian-fatal-car-accident-data-19892021), but they have many others car crash datasets.

## Production

To create the map, the [Leaflet](https://github.com/Leaflet/Leaflet) package was used, to use this package you just need to install it in your workbench.  

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
```
Now you have the map with the plots, that change accordingly with the user input. Have fun :smiley:
















