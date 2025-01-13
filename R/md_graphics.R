md.graphic_UI <- function(id = 'graphic') {
  ns <- NS(id)
  tagList(

    echarts4rOutput(ns('plot'))
  )
}

md.graphic <- function(id = 'graphic', data_table, select_year) {
  moduleServer(id, function(input, output, session) {

    summarise <- reactive({
      data_table |>
        filter(Year == select_year()) |>
        count(Day_of_Week, name = "Total")
    })

    output$plot <- renderEcharts4r({
      summarise() |>
        e_charts(Day_of_Week) |>
        e_bar(Total) |>
        e_title("Quantidade de Ocorrencias por dia da semana") |>
        e_x_axis(name ="Dia da Semana", type = "category") |>
        e_tooltip(trigger = "axis")
    })
  }
  )
}







