md.card <- sidebar(
  width = 400,
  card(

    card_title(h3(strong("About"))),
    card_header(p("This app gives a overview of road accidents that have occured in the United Kingdom over the years")),
    card_body(
      p("Please choose the map visualization type on the button below"),
      actionButton("toggle", label = "Visualization")
    ),
    card_title(h3(strong("Dataset Information"))),
    card_body(
      p('On this dashboard we show the number of occurences per local in the map at the inicial page and at the graphic page the occurences per day of the week,
      that allows us to crate "rules" or patterns about this data visualization. Then this ideas can be used for any porpouse, like data study or even a solution
      for this accidents problems.')
    )
  )
)
#
# md.card_map <- sidebar(
#   width = 400,
#   card(
#
#     card_title(h3(strong("About"))),
#     card_header(p("This app gives a overview of road accidents that have occured in the United Kingdom over the years")),
#     card_body(
#       p("Please choose the slider input below to adjust the data set in the map."),
#       selectInput('pollution', "Select the Air Quality Index level", choices = df.air_pollution$AQI.Category)
#     ),
#     card_title(h3(strong("Dataset Information"))),
#     card_body(
#       p('On this dashboard we show the number of occurences per local in the map at the inicial page and at the graphic page the occurences per day of the week,
#       that allows us to crate "rules" or patterns about this data visualization. Then this ideas can be used for any porpouse, like data study or even a solution
#       for this accidents problems.')
#     )
#   )
# )
