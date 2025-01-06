md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"), width = "50%")

}



md.map <- function(id = 'map') {
  moduleServer(id,function(input, output, session) {

    output$leaflet <- renderLeaflet({
      leaflet() %>%
        addTiles() %>%
        setView(-47.6493, -22.7253, zoom = 12)
    })
    }
  )
}
