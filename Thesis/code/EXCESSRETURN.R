MY_excess_return <- function(df, index_name, benchmark_name) {
  df = df %>%
    rename(Index = "index_name", Benchmark = "benchmark_name") %>%
    mutate(Return = Index / lag(Index)) %>%
    mutate(Return = replace(Return, is.na(Return), 0)) %>%
    mutate(Excess_Return = Index - Benchmark) %>%
    mutate(YM = format(index, "%Y-%b")) %>%
    group_by(YM) %>%
    filter(index == last(index)) %>%
    mutate(Cumulative_Excess_Return = cumprod(1 + Excess_Return))
  df
}
