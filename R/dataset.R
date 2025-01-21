if (!exists("cached_map_df")) cached_map_df <- NULL
if (!exists("cached_graphic_df")) cached_graphic_df <- NULL

order_days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

data <- read.csv("inst/data/RoadAccident.csv")
total_data <- read.csv("inst/data/accidents_2012_to_2014.csv")

map_df <- data |>
  select(Year, lat = Latitude, long = Longitude)

graphic_df <- total_data |>
  select(Day_of_Week, Junction_Control, Light_Conditions, Year) |>
  mutate(Day_of_Week  = case_when(
    total_data$Day_of_Week == 1 ~ 'Sunday',
    total_data$Day_of_Week == 2 ~ 'Monday',
    total_data$Day_of_Week == 3 ~ 'Tuesday',
    total_data$Day_of_Week == 4 ~ 'Wednesday',
    total_data$Day_of_Week == 5 ~ 'Thursday',
    total_data$Day_of_Week == 6 ~ 'Friday',
    total_data$Day_of_Week == 7 ~ 'Saturday',
  )) |>
  mutate(Day_of_Week = factor(Day_of_Week, levels = order_days))



resp <- read.csv("inst/data/global air pollution dataset.csv")

df <- resp |>
  select(Country, City, AQI.Value, AQI.Category) |>
  mutate(AQI.Category = case_when(
    AQI.Category == 'Unhealthy for Sensitive Groups' ~ 'Unhealthy',
    TRUE ~ AQI.Category
  ))
