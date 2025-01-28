md.graphic_UI <- function(id = 'graphic') {
  ns <- NS(id)

  echarts4rOutput(ns('chart'))
}

md.graphic <- function(id = 'graphic', data) {
  moduleServer(id, function(input, output, session) {

    output$chart <- renderEcharts4r({
      data |>
        e_charts(AQI.Category) |>
        e_pie(Total, roseType = 'radius') |>
        e_title("Cities Indexes") |>
        e_tooltip()
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
