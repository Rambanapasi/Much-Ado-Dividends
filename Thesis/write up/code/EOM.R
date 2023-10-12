#  this just takes the end of month dates

Make_calendar_EOM <- function(df){
  df <- df %>% mutate(YM = format(date, "%b %y")) %>% group_by(YM) %>% filter(date == last(date))
  df}