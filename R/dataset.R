resp <- read.csv("inst/data/global.AQI.csv")
df.count_country <- read.csv('inst/data/df.count_country')

df.air_pollution <- resp |>
  select(Country, City, AQI.Value, AQI.Category, lat, long) |>
  mutate(AQI.Category = case_when(
    AQI.Category == 'Unhealthy for Sensitive Groups' ~ 'Unhealthy',
    TRUE ~ AQI.Category
  ))

df.categories <- df.air_pollution |>
  select(AQI.Category) |>
  group_by(AQI.Category) |>
  summarise(Total = n()) |>
  distinct(AQI.Category, .keep_all = TRUE)

df.media <- resp |>
  select(Country, AQI.Value) |>
  group_by(Country) |>
  mutate(country_number = n()) |>
  mutate(Average = (sum(AQI.Value) / country_number)) |>
  distinct(Country, Average, country_number)


df.second_graph <- df.media |>
  left_join(df.count_country) |>
  summarise(Country, Average) |>
  arrange(Average)


# df.count_country <- df.air_pollution |>
#   select(Country, AQI.Value) |>
#   group_by(Country) |>
#   summarise(AQI.Value = sum(AQI.Value))
