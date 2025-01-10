ui <- page_navbar(

  title = "UK Traffic Accidents",

  nav_panel(
    title = "View Map",
    page_sidebar(
      sidebar = md.card,
      md.map_UI()
    )
  ),

  nav_panel(
    title = "Graphics",
    page_sidebar(
      sidebar = md.card,
      md.graphic_UI()
    )

  )
)

