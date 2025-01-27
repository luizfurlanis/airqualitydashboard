md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"))
}

md.map <- function(id = 'map', map_country) {
  moduleServer(id,function(input, output, session) {

    output$leaflet <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 3)) %>%
        addTiles() %>%
        setView(-29.8517, 7.6488, zoom = 4)
    })

    radius = sqrt(map_country$AQI.Value) * 0.2

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
}
