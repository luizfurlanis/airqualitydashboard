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

df <- data.frame(
  Category = c("Good","Moderate", "Unhealthy", "Very Unhealthy", "Hazardous"),
  Value = c("0 - 50", "50 - 100", "100 - 200", "200 - 300", "300 - 500")
)

# df.count_country <- df.air_pollution |>
#   select(Country, AQI.Value) |>
#   group_by(Country) |>
#   summarise(AQI.Value = sum(AQI.Value))

