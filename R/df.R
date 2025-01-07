data <- read.csv("C:/Users/LuizOctavioFurlanis/Documents/GitHub/Luiz Furlanis/roadaccidentdashboard/data/RoadAccidentData.csv")

map_df <- data |>
  select(Year, city, lat, long) |>
  group_by(city, Year) |>
  mutate(n = n()) |>
  distinct(Year, city, .keep_all = TRUE)


