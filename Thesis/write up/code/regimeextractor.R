regime_date_extractor <- function(df, Regime, Bank){
  df <- df %>% 
    filter(Bank %in% Bank ) %>% 
    filter(Changes %in% Regime) %>% 
    pull(Date) %>% 
    as.Date()
  df
}