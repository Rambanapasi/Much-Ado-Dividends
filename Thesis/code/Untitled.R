pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue")
library(tbl2xts)
library(tidyverse)
library(xts)

# Load the data 

raw.indexes <- readxl::read_xlsx("data/Benckmarks.xlsx")

# Tidy the data and get simple returns

simple_return <- raw.indexes %>%
  arrange(Date) %>%
  filter(Date >= lubridate::ymd(20140102)) %>%
  gather(key = Index, value = Price, -Date) %>% 
  group_by(Index) %>%
  mutate(across(.cols = Price, .fns = ~./lag(.), .names = "{.col}_return")) %>% 
  select(Date, Index, Price_return)
  
#  Graph it to see if everything is in order
ggplot(simple_return, aes(x = Date, y = Price_return, group = Index)) +
  geom_line() +
  facet_wrap(~ Index) +
  labs(x = "Date", y = "Price Return", title = "Price Returns for Indexes") +
  theme_minimal() +
  theme(legend.position = "none")

# Cumulative returns 


Cum_returns <- simple_return %>% 
  filter(Date>first(Date)) %>%
  mutate(DaliyIndex = cumprod(1 + Price_return), YM = format(Date, "%B_%y")) %>% 
  group_by(YM) %>% 
  filter(Date==last(Date)) %>%
  ungroup() %>% 
  select(Date, Index, DaliyIndex)

# PLot 

ggplot(Cum_returns, aes(x = Date, y = DaliyIndex)) +
  geom_line() +
  facet_wrap(~ Index) +
  labs(x = "Date", y = "Cumulative Return", title = "Cumulative Returns for Indexes") +
  theme_minimal() +
  theme(legend.position = "none")
  
  

