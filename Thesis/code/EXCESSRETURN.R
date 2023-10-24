My_excess_return <- function(df, index_name, benchmark_name) {
  df <- df %>% arrange(Date) %>% 
    dplyr::rename(Index = index_name, Benchmark = benchmark_name) %>% 
    select(Date, Index, Benchmark) %>% 
    gather(index, px, -Date) %>% 
    mutate(Y = format(Date, "%Y %B")) %>% 
    group_by(Y, index) %>%
    mutate(ret = px/lag(px) - 1) %>% 
    mutate(ret = coalesce(ret, 0)) %>% 
    filter(Date == last(Date)) %>% 
    ungroup()

  Act_ret <-  PerformanceAnalytics::ActivePremium(df %>% filter(index == "Index")%>% tbl_xts(., cols_to_xts = ret),
  df %>% filter(index == "Benchmark") %>% tbl_xts(., cols_to_xts = ret), scale= 12)
  
  SD <- PerformanceAnalytics::sd.annualized(df %>% filter(index == "Index")%>% tbl_xts(., cols_to_xts = ret), scale = 12)
  
  Drwdowns <- PerformanceAnalytics::maxDrawdown(df %>% filter(index == "Index")%>% tbl_xts(., cols_to_xts = ret),geometric = T)
  
  Cum_ret <- PerformanceAnalytics::Return.cumulative(df %>% filter(index == "Index")%>% tbl_xts(., cols_to_xts = ret),geometric = T)
  
  summary <- data.frame(
    Measure = c("Ann Excess Return", "Std dev", "Max Drawdowns", "Cumulative Return"),
    Value = c(Act_ret, SD, Drwdowns, Cum_ret)
    
    
  )

summary <- summary %>% rename(!!glue::glue("{index_name}") := Value)

summary


}
 