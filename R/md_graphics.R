md.graphic_UI <- function(id = 'graphic') {
  ns <- NS(id)

  echarts4rOutput(ns('plot'))
}

md.graphic <- function(id = 'graphic', data_table) {
  moduleServer(id, function(input, output, session) {

    output$plot <- renderEcharts4r({
      data_table |>
        e_charts(AQI.Category) |>
        e_pie(Total, roseType = 'radius') |>
        e_title("World Air quality") |>
        e_tooltip()
    })
  }
  )
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
