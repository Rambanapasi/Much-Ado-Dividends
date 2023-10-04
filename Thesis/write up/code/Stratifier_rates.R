stratifier_rates <- function(raw_df, index_name, benchmark_name, Date_vector, Description) {
  
  Mk_df <- raw_df %>%
    dplyr::rename(Index = index_name, Benchmark = benchmark_name) %>% 
    select(Date, Index, Benchmark) %>% 
    gather(Vehicle, Value, -Date) %>%
    arrange(Date) %>% 
    filter(Date %in% Date_vector) %>%
    group_by(Vehicle) %>% 
    mutate(Return = Value / lag(Value) - 1) %>%
    mutate(Return = coalesce(Return, 0))%>%
    mutate(YM = format(Date, "%y %b")) %>% 
    group_by(YM) %>% 
    filter(Date == last(Date)) %>% 
    tbl_xts(cols_to_xts = Return, spread_by = Vehicle) %>%
    xts_tbl() %>%
    mutate(ex.ret = Index - Benchmark)  %>% 
    select(date, ex.ret)  %>% 
    mutate(Return = cumprod(1 + ex.ret)) %>% 
    summarize(Name = !!glue("{index_name}"), "Market Period" = Description, Months = n(), "Annualized Return (%)" = mean(last(Return) ^ (4/Months) - 1)*100)
  
  Mk_df
}
