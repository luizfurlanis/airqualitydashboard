library(dplyr)

data <- read.csv("data/RoadAccident.csv")

map_df <- data |>
  select(Year, lat = Latitude, long = Longitude)


