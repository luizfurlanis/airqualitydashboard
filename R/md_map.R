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
      leaflet() %>%
        addTiles() %>%
        setView(133.7751, -30.6753, zoom = 4)
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
          popup = ~city,
          radius = ~n,
          label = ~paste(city, ":", n),
          labelOptions = labelOptions(
            textsize = "12px",
            opacity = 0.8
          ),
          weight = 0,
          fillColor = "red",
          fillOpacity = 0.5
        )
    })
  })
}
