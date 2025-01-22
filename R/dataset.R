resp <- read.csv("inst/data/global air pollution dataset.csv")

df.air_pollution <- resp |>
  select(Country, City, AQI.Value, AQI.Category) |>
  mutate(AQI.Category = case_when(
    AQI.Category == 'Unhealthy for Sensitive Groups' ~ 'Unhealthy',
    TRUE ~ AQI.Category
  )) |>
  geocode(City, method = "osm")

df.count_category <- df.air_pollution |>
  select(AQI.Category) |>
  mutate(Total = n()) |>
  distinct()

