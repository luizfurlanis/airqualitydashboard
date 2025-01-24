server <- function(input, output, session) {

  md.map(map_df = df.count_contry)
  md.graphic(data_table = df.count_category)
  # md.second_graphics()
}
