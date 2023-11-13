df = read.csv("Desktop/Rscripts/DATA/WorldCupMatches.csv", header=T)
head(df)
summary(df)

world_cup_data <- read.csv("Desktop/Rscripts/DATA/WorldCupMatches.csv", header = TRUE, stringsAsFactors = FALSE)

# (a) Find the size of the dataframe
n_rows <- nrow(world_cup_data)
n_cols <- ncol(world_cup_data)
cat("Number of rows:", n_rows, "\n")
cat("Number of columns:", n_cols, "\n")

# (b) Use summary function to report the statistical summary of your data
summary_data <- summary(world_cup_data)
print(summary_data)

# (c) Find how many unique locations Olympics were held at
unique_locations <- length(unique(world_cup_data$City))
cat("Number of unique locations:", unique_locations, "\n")

# (d) Find the average attendance
average_attendance <- mean(world_cup_data$Attendance, na.rm = TRUE)
cat("Average Attendance:", average_attendance, "\n")

# (e) For each Home Team, what is the total number of goals scored?
total_goals_by_home_team <- world_cup_data %>%
  group_by(`Home Team Name`) %>%
  summarize(TotalGoals = sum(`Home Team Goals`, na.rm = TRUE))
print(total_goals_by_home_team)

# (f) What is the average number of attendees for each year?
average_attendance_by_year <- world_cup_data %>%
  group_by(Year) %>%
  summarize(AverageAttendance = mean(Attendance, na.rm = TRUE))
print(average_attendance_by_year)

