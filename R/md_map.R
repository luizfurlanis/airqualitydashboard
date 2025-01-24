md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"))
}

md.map <- function(id = 'map', map_df) {
  moduleServer(id,function(input, output, session) {

    output$leaflet <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 2)) %>%
        addTiles() %>%
        setView(-29.8517, 7.6488, zoom = 4)
    })

    radius_scale <- sqrt(map_df$AQI.Value) * 0.25

    leafletProxy(session$ns("leaflet")) %>%
      clearMarkers() %>%
      addCircleMarkers(
        data = map_df,
        lat = ~lat,
        lng = ~long,
        radius = radius_scale,
        color = "darkred",
        weight = 0,
        label = ~sprintf("%s : %g", Country, AQI.Value),
        labelOptions = labelOptions(
          style = list("font-weight" = 'normal', padding = '5px 10px'),
          textsize = '15px',
          direction = 'auto'
        )
      )
  })
}
