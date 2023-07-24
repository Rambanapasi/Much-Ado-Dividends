if (!require("rmsfuns")) install.packages("rmsfuns")

pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue")
library(tbl2xts)
library(tidyverse)
library(xts)
# load any data just amek sure that the date is in the first column, this will be foe easy use of the xts package

data <- readxl::read_xlsx("data/MAD Dividend index series-2.xlsx")

#  Mutate_at replaces all the previous columns
d1 <- 
  data %>% 
  arrange(Date) %>% 
  mutate_at(.vars = vars(-Date), ~log(.)-log(lag(.)))

# Just to make some things much simplier
d2 <- data %>% 
  gather(Index, Value, -Date) %>% 
  mutate(Return = Value/lag(Value)-1) %>% 
  ungroup()
# Lets understand the xts package and what we can do with it 

#  Lets get log returns using the dplyr, no long format just yet

Year_Month <- function(x) format(as.Date(x), "%Y_%B") 

cumdata_Logret_Monthly <- 
  cumdata %>% 
  arrange(Date) %>% 
  filter(Date >= lubridate::ymd(20130128)) %>% 
  group_by(YM) %>% filter(Date == last(Date)) %>% 
  ungroup() %>% 
  mutate(across(.cols = where(is.numeric), .fns = ~log(.) - lag(log(.)))) %>% 
  
  filter(Date > first(Date)) %>% mutate(Year = format(Date, "%Y")) %>% 
  
  group_by(Year) %>% 
  # Now we can sum to get to annual returns:
  summarise(across(.cols = where(is.numeric), .fns = ~sum(.)))


#  Now to do this using the tidy mannaer 

d2 <- data %>% 
  arrange(Date) %>% 
  gather(index, value, -Date) %>% 
  group_by(index)  

#  Just converting it to be numeric

d2$value <- as.numeric(d2$value)

#  These are just the normal componded returns
compounded_returns <- d2 %>%
  arrange(Date) %>% 
  mutate(dailyReturn = value/lag(value) - 1) %>% 
  filter(Date >= lubridate::ymd(20130128))%>%
  group_by(index) %>% 
  mutate(daliyReturn = coalesce(dailyReturn, 0)) %>% 
  mutate(dailyIndex = cumprod(1 + dailyReturn)) %>% 
  mutate(YM = format(Date, "%y%b")) %>%
  group_by(YM) %>% 
  filter(Date == last(Date)) %>% 
  group_by(index) %>% 
  mutate(MonthlyReturn = dailyIndex/lag(dailyIndex) - 1) %>% 
  select(Date, index, dailyIndex)

compounded_returns %>% tbl_xts(., cols_to_xts = dailyIndex, spread_by = index)


compounded_returns %>%
  ggplot(aes(Date, dailyIndex, color = index, group = index)) +
  geom_line() 
  # # facet_wrap(~ index) +
  # theme(legend.position = "none")


  

