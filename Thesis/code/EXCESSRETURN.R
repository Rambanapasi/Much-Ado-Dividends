My_excess_return <- function(df, index_name, benchmark_name) {
  df <- df %>%
    dplyr::rename(Index = index_name, Benchmark = benchmark_name) %>% 
    select(Date, Index, Benchmark) %>% 
    gather(Vehicle, Value, -Date) %>%
    mutate(YM = format(Date, "%b %y")) %>% 
    group_by(YM, Vehicle) %>% 
    filter(Date == last(Date)) %>% 
    group_by(Vehicle) %>% 
    mutate(Return = Value / lag(Value) - 1) %>%
    mutate(Return = coalesce(Return, 0)) %>% 
    tbl_xts(., cols_to_xts = Return, spread_by = Vehicle) %>% 
    xts_tbl() %>% 
    mutate(ex.ret = Index - Benchmark) %>% 
    mutate(ret  = cumprod(1 + ex.ret)) %>% 
    mutate(ret  = ret/first(ret)) %>% 
    select(date, ret) %>% 
    ungroup()
  
  df <- df %>%  rename(!!sym(glue::glue("Cumulative_Excess_of_{index_name}")) := ret)
  
  df
}