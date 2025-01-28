ui <- page_navbar(

  title = "World Air Quality",

  nav_panel(
    title = "View Map",
    sidebar = md.card,
    md.map_UI()
  ),

  nav_panel(
    title = "Graphics",
    sidebar = md.card_map,
    md.graphic_UI()
  )
)

