
Regime_change_df <-function(df, Rolling_frequency){
  # this function hard sets quarterly dates
  df %>% 
    mutate( YM = format ( Date , "%Y %b"), Quarter = format(Date,"%b"))
  
  Quarters <- c("Mar", "Jun", "Sep", "Dec")
  
  library(zoo)
  
  # we now want to apply our criteria for getting hiking and cutting regimes and make a df that we will extract dates from
  
  extract_df <- Rate_change %>% 
    arrange(Date) %>%
    filter(Quarter %in% Quarters) %>%
    group_by(YM) %>% 
    filter(Date == last(Date)) %>% 
    ungroup() %>% 
    mutate(chg = US - lag(US)) %>% 
    mutate(Year = format(Date, "%Y")) %>% 
    group_by(Year) %>%
    mutate(pos = rollapply(chg, width = Rolling_frequency, FUN = function(x) any(x > 0), fill = NA),
           neg = rollapply(chg, width = Rolling_frequency, FUN = function(x) any(x < 0), fill = NA)) %>%
    mutate(regime = case_when(
      any(pos, na.rm = TRUE) ~ "Hiking",
      any(neg, na.rm = TRUE) ~ "Cutting",
      TRUE ~ "Neutral"))
  
  extract_df
}