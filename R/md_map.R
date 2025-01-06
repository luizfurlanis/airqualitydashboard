md.map_UI <- function(id = 'map') {
  ns <- NS(id)

  leafletOutput(ns("leaflet"), width = "50%", heigth = "100%")

}



md.map <- function(id = 'map') {
  moduleServer(id,function(input, output, session) {

    output$leaflet <- renderLeaflet({
      leaflet() |>
        addTiles() |>
        setView(lng = , lat =, zoom = 5)
    })
    }
  )
}
