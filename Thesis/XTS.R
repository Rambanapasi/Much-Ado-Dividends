data %>% names %>%  unique

interest <- c("GDDUK", "M2JPDY")
#  Some loadings 

pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue", "extrafont")

# The XTS package, its a complement to PerformanceAnalytics and 

data <- readxl::read_xlsx("data/MAD Dividend index series-2.xlsx")

#  Using the xts package to manipulate the data

xts.data <- tbl_xts(data)

covid_hyper_data <- xts.data["2019-3/2021-4"]

# This package is very useful is subsetting dates, consider the following should consider deep analysis on certain securities

xts.data[.indexwday(xts.data) == 1]  # Mondays only

xts.data[.indexmon(xts.data) == 0]  # Date's in Jan in all years

xts.data[.indexmday(xts.data) == 1]  # First day of every month

xts.data[endpoints(xts.data, "months", k = 3)]  # Last day of every quarter (hence k = 3)


# Plotting with default lables is simple


plot(xts.data[, "FUDP"], major.ticks = "years", minor.ticks = FALSE, 
     main = "", col = 3, ylab = "")

#  If dates have no values which happens all the time the best thing to do is use the code below
xts.data[150, "FUP"] <- NA


#  Sometimes we have NA and we can just pad them which returns values of the previous trading day, in the code it gives a max of 5 days 

xts.data.padded <- na.locf(xts.data, na.rm = F, maxgap = 10)

# To get say quarterly dates for the securties we hold you easily just, 

xts.data.padded.monthly <- xts.data.padded[endpoints(xts.data.padded, 
                                                     "months", k = 3)]

# The actual work




