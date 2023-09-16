

stratifier <- function(raw_df , Index , Benchmark, Date_vector, Description ) {
  
  Mk_df <- raw_df %>% filter(Date %in% Date_vector) %>% 
    MY_excess_return(., Index, Benchmark) %>%
    gather(Index , ret, -date) %>% 
    mutate(Count = n()) %>% 
    group_by(Index)  %>% 
    summarize("Market Period" = Description , Months = n() , annualized_return = mean (last(ret) ^ (12/(Count)) -1))
  
  Mk_df }