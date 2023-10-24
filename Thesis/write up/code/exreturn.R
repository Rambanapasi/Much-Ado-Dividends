excess_return <- function(df, index_name, benchmark_name) {
  df <- df %>% arrange(Date) %>%
    
    # Rename columns
    rename(Index = index_name, Benchmark = benchmark_name) %>%
    
    # Select relevant columns
    select(Date, Index, Benchmark) %>%
  gather(index, px, -Date) %>%
    
    # Format Date into a new column Y
    mutate(Y = format(Date, "%Y %B")) %>%
    
    # Calculate returns
    group_by(index) %>%
    mutate(ret = px / lag(px)- 1) %>%
    ungroup() %>%
    
    # Spread data back to wide format
    spread(index, ret) %>%
    
    # Calculate ex column
    mutate(ex = Index - Benchmark) %>%
    
    # Calculate cumulative product
    mutate(ex = cumprod(1 + ex))
  
  df <- df %>%
    rename(!!glue::glue("{index_name}") := ex)
  
  # Show the modified data frame
  df
  
}