md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"))

}



md.map <- function(id = 'map', data) {
  moduleServer(id,function(input, output, session) {

    output$leaflet <- renderLeaflet({
      leaflet(map_df) %>%
        addTiles() %>%
        addCircleMarkers(
          lng = ~long,
          lat = ~lat,
          popup = ~city,
          radius = ~sqrt(n) * 3,
          label = ~paste(city, ":", n),
          labelOptions = labelOptions(
            textsize = "12px",
            opacity = 0.8
          ),
          weight = 0,
          fillColor = "red",
          fillOpacity = 0.5
        ) %>%
        setView(133.7751, -30.6753, zoom = 4)
    })
    }
  )
}
