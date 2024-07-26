# Cyclistic Bike-Share Analysis Case Study

This is Cyclistic bike-share analysis Case Study! In this project, there is a fictional company, Cyclistic and to navigate there speedy success, analysis is done using their Bike-Share data. This analysis follows the six steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Table of Contents

- [Cyclistic Bike-Share Analysis Case Study](#cyclistic-bike-share-analysis-case-study)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Data Analysis Process](#data-analysis-process)
    - Ask
    - Prepare
    - Process
    - Analyze
    - Share
    - Act
  - [Libraries](#libraries)
  - [Results](#results)
  - [Conclusion](#conclusion)

## Introduction

This case study analyzes Cyclistic's bike-share data to uncover insights that can help the company improve its services and attract more users. The data analysis aims to understand trends, user behavior, and preferences.

- _**This analyis is done in 'R' using 'RStudio'**_

## Data Analysis Process

### 1. Ask

**Key Questions:**

- How do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders buy Cyclistic annual memberships?
- When will the demand for memberships increase?
- Who will use bikes more often and for what purpose?

### 2. Prepare

The dataset includes bike trip data for the period from August 2023 to July 2024. The data is stored in multiple CSV files, one for each month. All these files are combined to a single dataset `data_total`.

- **Data Source:** The datasets are taken from the months of August 2023 to July 2024 from [Cyclistic Bike Data](https://divvy-tripdata.s3.amazonaws.com/index.html) website.  The datasets have a different name because Cyclistic is a fictional company. The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).


### 3. Process

The data is cleaned and transformed to remove unnecessary columns and handle missing values. The datasets are merged into a single dataframe for analysis.

### 4. Analyze

Data analysis is performed using various techniques, including aggregation and visualization, to identify patterns and trends.

### 5. Share

Visualizations and summaries of key insights are created and shared to communicate findings effectively.

### 6. Act

Based on the analysis, actionable recommendations are provided to help Cyclistic improve its services and marketing strategies.

## Libraries

```
library(tidyverse)
library(janitor)
library(ggplot2)
library(lubridate)
library(dplyr)
```
- All the remaining code for analysis is explained in HTML file.

## Results
- **Rides per Day of Week:** Visualized the total number of rides per day of the week, broken down by membership type.

- **Rides per Month:** Analyzed the total number of rides and average ride duration per month, segmented by membership type.

- **Bike Popularity among Member Types:** Examined the popularity of different bike types among casual and member riders.

- **Rides by Member Type and Day of Week:** Summarized the number of rides and average ride duration by membership type and day of the week.

## Conclusion

The analysis provided insights into how different user groups interact with the Cyclistic bike-share service. These findings can help Cyclistic tailor its marketing strategies to convert casual riders into annual members and optimize its services for better user satisfaction.