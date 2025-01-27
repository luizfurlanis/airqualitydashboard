md.graphic_UI <- function(id = 'graphic') {
  ns <- NS(id)

  echarts4rOutput(ns('plot'))
}

md.graphic <- function(id = 'graphic', data) {
  moduleServer(id, function(input, output, session) {

    output$plot <- renderEcharts4r({
      data |>
        e_charts(AQI.Category) |>
        e_pie(AQI.Value, roseType = "radius") |>
        e_title("teste")
    })
  })
}

# md.second_graphics_UI <- function(id = 'linegraphic') {
#   ns <- NS(id)
#
#
# }
#
# md.second_graphics <- function(id = 'linegraphic') {
#   moduleServer(id, function(input, output, session) {
#
#     }
#   )
# }
