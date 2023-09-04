market_cycle_df <- function(df){
  
  interest <- df %>% 
    rename(., "Fed" = "US Federal Funds Effective Rate (continuous series)" , "ECB" = "ECB Main Refinancing Operations Announcement Rate", "SA" = "South Africa Repo Avg Rate")
  
  #  tidy it up first
  
  tidy_interest <- interest %>% 
    gather(Bank, Rate, -Date) %>% 
    mutate( Month = format(Date, "%b"), YM = format(Date, "%b %y")) %>% 
    arrange(Date) %>% 
    group_by(Bank) %>% 
    ungroup()
  
  #  subset dates to just consider the quarterly figures
  
  quarters <- c("Mar", "Jun", "Sep", "Dec")
  
  #  With that subset of interest rates now use if else and group by date to count times when there was a hiking or cutting 
  rateschanges <- tidy_interest %>%
    group_by (YM, Bank) %>% 
    filter(Date == last(Date)) %>% 
    filter(Month %in% quarters) %>% 
    arrange(Date) %>% 
    group_by(Bank) %>% 
    mutate(diff = Rate - lag(Rate)) %>% 
    mutate(Year = format(Date, "%Y")) %>% 
    group_by(Year) %>% 
    mutate(
      Changes = case_when(
        sum(diff > 0, na.rm = TRUE) > 4 ~ "Hiking",
        sum(diff < 0, na.rm = TRUE) > 4 ~ "Cutting",
        TRUE ~ "Hold"
      )
    ) %>% 
    ungroup() 
rateschanges
}
