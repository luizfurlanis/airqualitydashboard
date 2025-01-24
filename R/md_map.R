md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"))
}

md.map <- function(id = 'map', map_country, map_city, level) {
  moduleServer(id,function(input, output, session) {

    output$leaflet <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 3)) %>%
        addTiles() %>%
        setView(-29.8517, 7.6488, zoom = 4)
    })

    label <- if(level() == "Country") {
      ~sprintf("%s : %g", Country, AQI.Value)
    } else {
      ~sprintf("%s : %g", City, AQI.Value)
    }
    map <- if(level() == "Country") map_country else map_city
    radius_scale <- sqrt(map_df$AQI.Value) * 0.25

    leafletProxy(session$ns("leaflet")) %>%
      clearMarkers() %>%
      addCircleMarkers(
        data = map,
        lat = ~lat,
        lng = ~long,
        radius = radius_scale,
        color = "red",
        fillOpacity = 0.55,
        weight = 0,
        label = label,
        labelOptions = labelOptions(
          style = list("font-weight" = 'normal', padding = '5px 10px'),
          textsize = '15px',
          direction = 'auto'
        )
      )
  })
}
