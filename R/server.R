server <- function(input, output, session) {

  select_year <- reactive({
    req(input$year)
    as.numeric(input$year)
  })

  md.map(select_year = select_year, map_df = map_df)

}
