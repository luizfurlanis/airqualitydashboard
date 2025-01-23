server <- function(input, output, session) {

  md.map(select_year = select_year, map_df = map_df)
  md.graphic(data_table = df.count_category)
  md.second_graphics()
}
