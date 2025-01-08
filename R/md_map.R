md.map_UI <- function(id = 'map') {
  ns <- NS(id)

    leafletOutput(ns("leaflet"))
}



md.map <- function(id = 'map', select_year, map_df) {
  moduleServer(id,function(input, output, session) {

    filtered <- reactive({
      map_df |>
        filter(Year == select_year())
    })

    output$leaflet <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 4)) %>%
        addTiles() %>%
        setView(-4.5511, 54.2378, zoom = 5)
    })

    observe({
      req(filtered())
      data <- filtered()

      leafletProxy(session$ns("leaflet")) %>%
        clearMarkers() %>%
        addCircleMarkers(
          data = data,
          lng = ~long,
          lat = ~lat,
          weight = 0,
          color = "red",
          opacity = 1.0,
          clusterOptions = markerClusterOptions(),
        )
    })
  })
}
