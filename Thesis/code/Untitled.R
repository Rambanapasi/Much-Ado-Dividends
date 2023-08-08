part  <-  function(df, index_name, benchmark_name) {
  df = df %>%
    rename(Index = "index_name", Benchmark = "benchmark_name")}
  