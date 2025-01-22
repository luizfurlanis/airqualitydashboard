md.graphic_UI <- function(id = 'graphic') {
  ns <- NS(id)

  echarts4rOutput(ns('plot'))
}

md.graphic <- function(id = 'graphic', data_table) {
  moduleServer(id, function(input, output, session) {

    output$plot <- renderEcharts4r({
      data_table |>
        e_charts(AQI.Category) |>
        e_bar(Total) |>
        e_title("Air quality") |>
        e_x_axis(name ="Air level")
    })
  }
  )
}

md.second_graphics_UI <- function(id = 'linegraphic') {
  ns <- NS(id)


}

md.second_graphics <- function(id = 'linegraphic') {
  moduleServer(id, function(input, output, session) {

    }
  )
}
