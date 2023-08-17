rawexcess <- function(df, index_name, benchmark_name) {
  g <- df %>%
    rename(Index = index_name, Benchmark = benchmark_name) %>% 
    gather(Tickers, Price, -Date) %>%
    mutate(YM = format(Date, "%b %y")) %>%
    group_by(YM, Tickers) %>% 
    filter(Date == last(Date))%>%
    group_by(Tickers) %>% 
    mutate(ret = Price / lag(Price) - 1)  %>%
    tbl_xts(cols_to_xts = ret, spread_by = Tickers) %>%
    xts_tbl() %>%
    mutate(excess = Index - Benchmark) %>% 
    select(date, excess) %>% 
    ungroup()
  
  colnames(g)[2] = index_name
  g
}
