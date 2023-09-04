MY_excess_return_2 <- function(df, index_name, benchmark_name) {
  df <- df %>%
    dplyr::rename(Index = index_name, Benchmark = benchmark_name) %>% 
    select(Date, Index, Benchmark) %>% 
    gather(Vehicle, Value, -Date) %>%  
    mutate(Return = Value / lag(Value) - 1) %>%
    mutate(Return = coalesce(Return, 0)) %>% 
    tbl_xts(., cols_to_xts = Return, spread_by = Vehicle) %>% 
    xts_tbl() %>% 
    mutate(ex.ret = Index - Benchmark) %>% 
    mutate(cum_return = cumprod(1 + ex.ret)) %>% 
    select(cum_return)
  
  colnames(df)[2] = index_name
  df
}
