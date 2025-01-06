

ui <- page_sidebar(
  title = "Interactive Map Module",
  sidebar = sidebar (title = "About",
                     "This is a reusable module map with leaflet."
  ),

  md.map_UI()
)
