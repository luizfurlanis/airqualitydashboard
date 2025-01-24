resp <- read.csv("inst/data/global.AQI.csv")
df.count_contry <- read.csv('inst/data/df.count_country')

df.air_pollution <- resp |>
  select(Country, City, AQI.Value, AQI.Category, lat, long) |>
  mutate(AQI.Category = case_when(
    AQI.Category == 'Unhealthy for Sensitive Groups' ~ 'Unhealthy',
    TRUE ~ AQI.Category
  ))

df.count_category <- df.air_pollution |>
  select(AQI.Category) |>
  group_by(AQI.Category) |>
  mutate(Total = n()) |>
  distinct()

# df.count_country <- df.air_pollution |>
#   select(Country, AQI.Value) |>
#   group_by(Country) |>
#   summarise(AQI.Value = sum(AQI.Value))



