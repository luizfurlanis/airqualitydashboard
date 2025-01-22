resp <- read.csv("inst/data/global air pollution dataset.csv")

df.air_pollution <- resp |>
  select(Country, City, AQI.Value, AQI.Category) |>
  mutate(AQI.Category = case_when(
    AQI.Category == 'Unhealthy for Sensitive Groups' ~ 'Unhealthy',
    TRUE ~ AQI.Category
  )) |>
  group_by(AQI.Category) |>
  mutate(contagem = n()) |>
  geocode(City, method = "osm")



