server <- function(input, output, session) {

  md.map(map_country = df.count_country)
  md.graphic(data = df.categories)
  # md.second_graphics()
}
