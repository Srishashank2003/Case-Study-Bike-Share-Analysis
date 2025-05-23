
#libraries

library(tidyverse)
library(janitor)
library(ggplot2)
library(lubridate)
library(dplyr)

#Load datasets

aug23 <- read.csv("../Datasets/aug23.csv")
oct23 <- read.csv("../Datasets/oct23.csv")
nov23 <- read.csv("../Datasets/nov23.csv")
dec23 <- read.csv("../Datasets/dec23.csv")
jan24 <- read.csv("../Datasets/jan24.csv")
feb24 <- read.csv("../Datasets/feb24.csv")
mar24 <- read.csv("../Datasets/mar24.csv")
apr24 <- read.csv("../Datasets/apr24.csv")
may24 <- read.csv("../Datasets/may24.csv")
jun24 <- read.csv("../Datasets/jun24.csv")
jul24 <- read.csv("../Datasets/jul24.csv")

# Combine data into one dataframe

data_total <- rbind(aug23,oct23,nov23,dec23,jan24,feb24,mar24,apr24,may24,jun24,jul24)
rm(aug23,oct23,nov23,dec23,jan24,feb24,mar24,apr24,may24,jun24,jul24)

# Data cleaning
data_total <- select(data_total, -c(start_lat, start_lng, end_lat, end_lng, start_station_id,end_station_id, end_station_name))

summary(data_total)
dim(data_total)
str(data_total)

# Data transformation
data_total$date <- as.Date(data_total$started_at) # give date from datetime string to date format
data_total$month <- format(as.Date(data_total$date), "%m") #date should be date object
data_total$day_of_week <- format(as.Date(data_total$date), "%A")

data_total$ride_length <- (as.double(difftime(data_total$ended_at, data_total$started_at)))/60
data_total$ride_length <- as.numeric(as.character(data_total$ride_length))

data_temp<- data_total[!(data_total$start_station_name == "" | data_total$ride_length<0),]

# Summary statistics
summary(data_total$ride_length)
aggregate(data_total$ride_length ~ data_total$member_casual, FUN = mean)
aggregate(data_total$ride_length ~ data_total$member_casual, FUN = median)
aggregate(data_total$ride_length ~ data_total$member_casual, FUN = max)
aggregate(data_total$ride_length ~ data_total$member_casual, FUN = min)

data_total$day_of_week <- format(as.Date(data_total$date), "%A")

data_total$day_of_week <- ordered(data_total$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
str(data_total)

# Visualization: Rides per Day of Week
data_total$day_of_week  <- format(as.Date(data_total$date), "%A")
data_total %>%                              #total rides broken down by weekday
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n()) %>% 
  arrange(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_casual)) + geom_col(position = "dodge", color = "black") + theme_minimal() +
  labs(x='Day of Week', y='Total Number of Rides', title='Rides per Day of Week', fill = 'Type of Membership') + 
  scale_y_continuous(breaks = c(100000, 250000, 400000, 550000), labels = c("100k", "250K", "400K", "550K"))

# Visualization: Rides per Month
data_total %>%   #total rides broken down by month
  group_by(member_casual, month) %>%  
  summarise(total_rides = n(),`average_duration_(mins)` = mean(ride_length)) %>% 
  arrange(member_casual) %>% 
  ggplot(aes(x=month, y=total_rides, fill = member_casual)) + geom_col(position = "dodge", color = "black") +theme_minimal() +
  labs(x= "Month", y= "Total Number of Rides", title = "Rides per Month", fill = "Type of Membership") + 
  scale_y_continuous(breaks = c(100000, 200000, 300000, 400000, 500000, 600000, 700000, 800000), 
                     labels = c("100K", "200K", "300K", "400K", "500K", "600K", "700K", "800K")) + theme(axis.text.x = element_text(angle = 45))

data_total %>% 
  group_by(member_casual, month ) %>%
  summarise(number_of_rides = n())

# Visualization: Bike Popularity among Member Types
data_total %>% 
  ggplot(aes(x = rideable_type, fill = member_casual)) +
  geom_bar(position = "dodge", color = "black")+ theme_minimal() + labs(x = "Type of Bikes", y = "Number of Bikes Taken", 
                                      title='Bike Populairity among Member types', fill = 'Type of Membership') +
  scale_y_continuous(breaks = c(500000, 1000000, 1500000), labels = c("500K", "1M", "1.5M"))

data_total %>% 
  group_by(member_casual, rideable_type ) %>%
  summarise(number_of_rides = n())

data_total %>% 
  group_by(member_casual, day_of_week ) %>%
  summarise(number_of_rides = n())

# Summary: Rides by Member Type and Day of Week
data_total %>%
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, day_of_week)  %>% 
  ggplot(aes(x = day_of_week, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge", color = "black") + theme_minimal() +labs(x='Days of the week', y='Average duration - Hrs', 
                                      title='Average ride time per week', fill='Type of Membership')

















