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
        e_tooltip(
          formatter = htmlwidgets::JS("
            function(params) {
            return 'Condition: ' + '<b>' + params.name + '</b><br/>' +
            'Number of Cities: ' + '<b>' + params.value + '</b>'
            }
          ")
        )
    })
  })
}


# second graphic ----------------------------------------------------------

md.second_graphics_UI <- function(id = 'linegraphic') {
  ns <- NS(id)

  echarts4rOutput(ns('barchart'))
}

md.second_graphics <- function(id = 'linegraphic', data) {
  moduleServer(id, function(input, output, session) {

    output$barchart <- renderEcharts4r({
      data |>
        e_charts(Country) |>
        e_bar(Average) |>
        e_tooltip() |>
        e_legend(show = FALSE) |>
        e_title("Average AQI") |>
        e_datazoom(
          type = 'slider'
        )
    })
  })
}
