library(bslib)
library(shiny)
library(leaflet)

ui <- page_sidebar(

  title = "Australian Road Accidents",
  theme = bs_theme(bootswatch = "flatly"),

  sidebar = sidebar(
    width = 400,
    card(

      card_title(h3(strong("About"))),
      card_header(h6("This app gives a visual overview of road accidents that occures in Australia over the years")),
      card_body(
        p("Please choose the slider input below to adjust the data set in the map."),

        sliderInput('year', "Select Year",
                    min = min(map_df$Year), max = max(map_df$Year), value = min(map_df$Year),
                    step = 1, sep = ""
        )
      ),
      h3(strong("Dataset Information")),
      p("The map and the graphics, shows road accidents over the years in th coutrys of Australia,
        this app was design to study and observe patern between this accidents."),
      p("more that i do not know what can i write, so i am writing anything to fill off the part that i want,
        probably no one will know that it is not important writen here, bacause they will not lost their time reading something stupid.")

    )
  ),

  md.map_UI()
)
