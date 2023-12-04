1A

load("/Users/kevin/Downloads/house_prices.rda")
library(ggplot2)
library(lubridate)

house_prices$date <- as.Date(house_prices$date)

ggplot(house_prices, aes(x = date, y = house_price_index, group = state, color = state)) +
  geom_line() +
  
  scale_x_date(breaks = as.Date(c("1980-01-01", "2000-01-01", "2020-01-01")), 
               labels = c("'80", "'00", "'20"), date_labels = "'%y") +

  labs(title = "House Price Index Trend Over Years for All States",
       x = "Date",
       y = "House Price Index") +
  
  theme_minimal()

##############################
B


library(tidyr)


house_reshaped <- gather(house_prices, key = "measure", value = "value", -date, -state)


head(house_reshaped)



########################################
C


load("/Users/kevin/Downloads/house_prices.rda")
library(ggplot2)
library(lubridate)
library(tidyr)

house_prices$date <- as.Date(house_prices$date)

house_reshaped <- gather(house_prices, key = "measure", value = "value", -date, -state)

ggplot(house_reshaped, aes(x = date, y = value, group = state, color = state)) +
  geom_line() +
  
  scale_x_date(breaks = as.Date(c("1980-01-01", "2000-01-01", "2020-01-01")), 
               labels = c("'80", "'00", "'20"), date_labels = "'%y") +
  

  labs(title = "House Price Index and Unemployment Percentage Trend Over Years for All States",
       x = "Date",
       y = "Value") +
  
  theme_minimal()


################################
#2

load("/Users/kevin/Downloads/house_prices.rda")
library(ggplot2)
library(lubridate)

ggplot(house_prices, aes(x = date, y = value, color = measurement)) +
  geom_line() +
  facet_wrap(~ state, nrow = 1) +
  scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")),
                     labels = c("80", "00", "20")) +
  labs(title = "Facet Wrap Plot for each State",
       x = "Date",
       y = "Value") +
  theme_minimal()


