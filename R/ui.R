ui <- page_navbar(

  title = "UK Traffic Accidents",
  sidebar = md.card,

  nav_panel(
    title = "View Map",
    md.map_UI()
  ),

  nav_panel(
    title = "Graphics",
    md.graphic_UI()
  )
)

