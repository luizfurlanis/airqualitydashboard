ui <- page_navbar(

  title = "World Air Quality",

  nav_panel(
    title = "View Map",
    page_sidebar(
      sidebar = md.card,
      md.map_UI()
    ),
  ),

  nav_panel(
    title = "Graphics",
    page_sidebar(
      sidebar = md.card_map,
      layout_column_wrap(
        width = 1,
        md.graphic_UI(),
        md.second_graphics_UI()
      )
    )
  )
)

