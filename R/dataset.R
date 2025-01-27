resp <- read.csv("inst/data/global.AQI.csv")
df.count_country <- read.csv('inst/data/df.count_country')

df.air_pollution <- resp |>
  select(Country, City, AQI.Value, AQI.Category, lat, long) |>
  mutate(AQI.Category = case_when(
    AQI.Category == 'Unhealthy for Sensitive Groups' ~ 'Unhealthy',
    TRUE ~ AQI.Category
  ))

df.categories <- df.air_pollution |>
  select(AQI.Category, AQI.Value) |>
  group_by(AQI.Category) |>
  mutate(Total = sum(AQI.Value)) |>
  distinct(AQI.Category, .keep_all = TRUE)

# df.count_country <- df.air_pollution |>
#   select(Country, AQI.Value) |>
#   group_by(Country) |>
#   summarise(AQI.Value = sum(AQI.Value))



