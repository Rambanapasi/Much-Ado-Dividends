Rolling_sd <- function(df, name) {
  df <-  df%>% rename(Close = name) %>% arrange(Date) %>% 
    mutate(Ret = log(Close)- lag (log(Close))) %>% 
    filter(Date > first(Date)) %>% 
    mutate(RollSD = RcppRoll::roll_sd(1 + Ret, 12, fill = NA, align = "right") * 
             sqrt(12)) %>% 
    filter(!is.na(RollSD))
  df}