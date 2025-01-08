library(dplyr)

data <- read.csv("C:/Users/LuizOctavioFurlanis/Documents/GitHub/Luiz Furlanis/roadaccidentdashboard/data/RoadAccident.csv")

map_df <- data |>
  select(Year, lat = Latitude, long = Longitude)


