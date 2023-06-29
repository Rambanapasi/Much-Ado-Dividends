Date_wragler_Year <- function(df) {
  df %>% 
    arrange(Date) %>% 
    mutate(Year  = format(Date, "%Y")) %>% select(Date, Year, 2:24)}

Tidy_Monthly_returns_year <- function (Date_wrangled_df){ 
  df <- Date_wrangled_df%>%
    group_by(Year) %>%
    summarise(across(.cols = 3:24, .fns = ~last(.) / first(.) - 1, .names = "R_{.col}")) %>% 
    gather(key = Index , value = Return, -Year) %>%
    arrange(Year) 
  df 
}


cumulative_returns_year <- function(df) {
  df <- df %>%
    group_by(Year, Index) %>%
    summarise(Cumulative_Return = cumprod(1 + Return) - 1)
    df 
}
Date_wragler <- function(df) {
  df %>% 
    arrange(Date) %>% 
    mutate(MonthYear  = format(Date, "%b%y")) %>% select(Date, MonthYear, 2:24)}

Tidy_Monthly_returns <- function (Date_wrangled_df){ 
  df <- Date_wrangled_df%>%
    group_by(MonthYear) %>%
    summarise(across(.cols = 3:24, .fns = ~last(.) / first(.) - 1, .names = "R_{.col}")) %>% 
    gather(key = Index , value = Return, -MonthYear) %>%
    arrange(MonthYear) 
  df 
}


plot <- function(df, x, y, Varible){
  ggplot(df, aes(x = x, y =y, color = Index , group = Index)) +
    geom_line() +
    facet_wrap(~ Index, scales = "free_y") +
    xlab("x") +
    ylab("y") +
    ggtitle("Monthly Returns") +
    scale_color_discrete()+theme(
      legend.position = "none",  # Remove the legend
      strip.background = element_blank(),  # Remove the facet labels background
      strip.text = element_blank()) } # Remove the facet labels

cumulative_returns <- function(df) {
  df <- df %>%
    group_by( MonthYear, Index) %>%
    summarise(Cumulative_Return = cumprod(1 + Return) - 1)
  df}
