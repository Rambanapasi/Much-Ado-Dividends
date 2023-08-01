pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue")

library(lubridate)


data<- readxl::read_xlsx("data/Benckmarks.xlsx")


indexes <- data %>%
  select(Date, FUDP,M2EFDY, GDUEEGF)
Benchmarks <- data %>% select(Date, FUDP, TUKXG, M2GBDY)

#  Wrangle them 

index.returns <- indexes %>%  gather(Index, Value, -Date) %>% 
  group_by(Index) %>% 
  arrange(Date) %>% 
  mutate(Returns = Value/ lag(Value)-1) %>% 
  mutate(Returns = coalesce(Returns, 0)) %>% 
  ungroup()
  # Turn that to xts to use Performance Analytics
  # tbl_xts(., cols_to_xts = Returns, spread_by = Index)

benchmark.returns <- Benchmarks %>%  gather(Benchmark, Value, -Date) %>% 
  group_by(Benchmark) %>% 
  arrange(Date) %>% 
  mutate(Returns = Value/ lag(Value)-1) %>% 
  mutate(Returns = coalesce(Returns, 0)) %>% 
  ungroup()
  # Turn that to xts to use Performance Analytics
  # tbl_xts(., cols_to_xts = Returns, spread_by = Benchmark)

# Excess Return 

Excess.return <- PerformanceAnalytics::Return.annualized.excess(Rp = index.returns, 
                                                                Rb = benchmark.returns, geometric = T, )

# Calculate the excess return series for each pair of index and benchmark

excess.return <- function(index_df, benchmark_df, index_name, benchmark_name){
  Date <- index_df$Date
  Xreturn <- index_df[[index_name]] - benchmark_df[[benchmark_name]]
  Names <- paste0("Excess of ", index_name)
  xdf <- data.frame(Date = Date, Names = Names, Xreturn = Xreturn)
  return(xdf)
}

#  lets create a list of indexes and their benchmark names 
index.names <- index.returns %>% distinct(Index) %>% pull()
benchmark.names <- benchmark.returns %>% distinct(Benchmark) %>% pull()

#  the excess list 
excess_returns_list <- lapply(1:length(index_names), function(i) {
  excess.return(index_datasets[[i]], benchmark_datasets[[i]], index_names[i], benchmark_names[i])
})

# 