monthlyret <- function(df) {
  g <- df %>% 
    gather(Tickers, Price, -Date) %>%
    mutate(YM = format(Date, "%b %y")) %>%
    arrange(Date) %>% 
    group_by(YM, Tickers) %>% 
    filter(Date == last(Date))%>%
    group_by(Tickers) %>% 
    mutate(ret = Price / lag(Price) - 1)%>%
    mutate(ret = coalesce(ret, 0)) %>% 
    ungroup() %>% 
    select(Date, Tickers, ret)
  g
}