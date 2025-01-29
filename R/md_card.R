md.card <- sidebar(
  width = 400,
  card(
    card_title(h3(strong("About"))),
    card_header(p("This map gives a overview of the pollution per country based on the Air Quality Index(AQI)")),
    card_body(
      p("The air quality index is based in the concentration of three element, the Ozone, the Nitrogen dioxide and the Carbon oxide,
        if you add them, you will get the AQI")),
    card_title(h3(strong("Dataset Information"))),
    card_body(
      p('The data used was calculated per city, so to make the visualization easy in the map you will see the country value with is
      all values from the cities added. The bigger the number, the worse it is.
      In addiction it is possible to see that where the populations is bigger,the air quality value is bigger too,
      showing that it is caused by the polution produced and the distruction of the local nature.')
    )
  )
)

md.card_map <- sidebar(
  width = 400,
  card(
    card_title(h3(strong("About"))),
    card_header(p("This app gives a overview of the pollution per country based on the Air Quality Index(AQI)")),
    card_body(
      p("The air quality index is based in the concentration of three element, the Ozone, the Nitrogen dioxide and the Carbon oxide,
        if you add them, you will get the AQI"),
      includeMarkdown("inst/www/RMarkdown.md")),
    card_title(h3(strong("Graphics Information"))),
    card_body(
      p('The pie chart shows the total number of cities that are on each Air Quality level.'),
      p('In addiction, the bars chart displays the average Air Quality Level,
        which is calculated by adding all the AQI value from the accounted cities and dividing by their total number.')
    )
  )
)
