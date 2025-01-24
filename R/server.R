server <- function(input, output, session) {

  level <- reactiveVal("Country")
  observeEvent(input$toggle, {
    if (level() == "Country") {
      level("City")
    } else {
      level("Country")
    }
  })

  md.map(map_country = df.count_contry, map_city = df.air_pollution, level = level)
  md.graphic(data_table = df.count_category)
  # md.second_graphics()
}
