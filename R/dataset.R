if (!exists("cached_map_df")) cached_map_df <- NULL
if (!exists("cached_graphic_df")) cached_graphic_df <- NULL


data <- read.csv("inst/data/RoadAccident.csv")
total_data <- read.csv("inst/data/accidents_2012_to_2014.csv")

map_df <- data |>
  select(Year, lat = Latitude, long = Longitude)

graphic_df <- total_data |>
  select(Day_of_Week, Junction_Control, Light_Conditions, Year) |>
  mutate(Day_of_Week  = case_when(
    total_data$Day_of_Week == 1 ~ 'Domingo',
    total_data$Day_of_Week == 2 ~ 'Segunda',
    total_data$Day_of_Week == 3 ~ 'Terça',
    total_data$Day_of_Week == 4 ~ 'Quarta',
    total_data$Day_of_Week == 5 ~ 'Quinta',
    total_data$Day_of_Week == 6 ~ 'Sexta',
    total_data$Day_of_Week == 7 ~ 'Sabado',
  ))
