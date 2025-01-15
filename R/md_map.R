md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"))
}

md.map <- function(id = 'map', select_year, map_df) {
  moduleServer(id,function(input, output, session) {

    filtered <- reactive({
      map_df |>
        filter(Year == select_year())
    }) |>
      bindCache(select_year())

    output$leaflet <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 4)) %>%
        addTiles() %>%
        setView(-4.5511, 54.2378, zoom = 6)
    })

    observe({
      req(filtered())
      data <- filtered()

      leafletProxy(session$ns("leaflet")) %>%
        clearMarkers() %>%
        addCircleMarkers(
          data = data,
          lng = ~long,
          color = "darkred",
          opacity = 0.78,
          weight = 0,
          lat = ~lat,
          clusterOptions = markerClusterOptions(
            spiderfyOnMaxZoom = FALSE,
            removeOutsideVisibleBounds = TRUE,
            disableClusteringAtZoom = 15,
          ),
        )
    }) |>
      bindEvent(filtered(), ignoreNULL = FALSE)
  })
}
