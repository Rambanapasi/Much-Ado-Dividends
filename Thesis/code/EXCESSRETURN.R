MY_excess_return <- function(df, index_name, benchmark_name) {
  df = df %>%
    rename(Index = "index_name", Benchmark = "benchmark_name") %>%
    select(Date, Index, Benchmark) %>% 
    mutate(Return = Index / lag(Index)) %>%
    mutate(Return = replace(Return, is.na(Return), 0)) %>%
    mutate(Excess_Return = Index - Benchmark) %>%
    mutate(YM = format(index, "%Y-%b")) %>%
    group_by(YM) %>%
    filter(index == last(index)) %>%
    mutate(Cumulative_Excess_Return = cumprod(1 + Excess_Return))
  df
}

part  <-  function(df, index_name, benchmark_name) {
  df = df %>%
    dplyr::rename(Index = index_name, Benchmark = benchmark_name) %>% 
    select(Date, Index, Benchmark) %>% gather(Vehicle, Value, -Date) %>% 
    mutate(Return = Value / lag(Value)-1) %>%
    mutate(Return = coalesce(Return, 0)) %>%
    tbl2xts::tbl_xts(.,cols_to_xts = Value, spread_by = Vehicle ) %>% 
    tbl2xts::xts_tbl
  df
}

b <- df %>% part(., "FUDP", "M2EFDY")