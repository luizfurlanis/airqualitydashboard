ui <- page_navbar(

  title = "World Air Quality",
  sidebar = md.card,

  nav_panel(
    title = "View Map",
    md.map_UI()
  ),

  nav_panel(
    title = "Graphics",
    md.graphic_UI()
    # md.second_graphics_UI()
  )
)

