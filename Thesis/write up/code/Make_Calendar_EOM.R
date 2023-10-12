
Make_calendar_EOM <- function(df){
  df <- df %>% mutate(YM = format(date, "%y %b")) %>% group_by(YM) %>% filter(date == last(date))
  df
}