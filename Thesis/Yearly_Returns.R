Dividend_portfolios$Date <- as.Date(Dividend_portfolios$Date)

# Some initial wrangling 
Date_wragler_Year <- function(df) {
  df %>% 
    arrange(Date) %>% 
    mutate(Year  = format(Date, "%Y")) %>% select(Date, Year, 2:24)}

df_1 <- Date_wragler_Year(df = Dividend_portfolios)

# Some further cleaning 

Tidy_Monthly_returns_year <- function (Date_wrangled_df){ 
  df <- Date_wrangled_df%>%
    group_by(Year) %>%
    summarise(across(.cols = 3:24, .fns = ~last(.) / first(.) - 1, .names = "R_{.col}")) %>% 
    gather(key = Index , value = Return, -Year) %>%
    arrange(Year) 
  df 
}

# Make it be recognized as a date
Monthly_return_tidy_year <- Tidy_Monthly_returns_year(df_1)
Monthly_return_tidy_year$Year <- as.Date(paste0(Monthly_return_tidy_year$Year, "-12-31"))

# Get cummulative returns 

cumulative_returns_year <- function(df) {
  df <- df %>%
    group_by(Year, Index  ) %>%
    summarise(Cumulative_Return = cumprod(1 + Return) - 1)
  ungroup()
  df}

Index_cumulative_return <- cumulative_returns_year(Monthly_return_tidy_year)

ggplot(Index_cumulative_return, aes(x = MonthYear, y = Cumulative_Return, color = Index, group = Index)) +
  geom_line() +
  facet_wrap(~ Index, scales = "free_y") +
  xlab("MonthYear") +
  ylab("Cumulative Return") +
  ggtitle("Cumulative Returns by Index") +
  scale_color_discrete()  # Optional: Use a discrete color scale

# A bit more color

g <- ggplot(Index_cumulative_return, aes(x = MonthYear, y = Cumulative_Return, color = Index, group = Index)) +
  geom_line() +
  geom_text(data = subset(Index_cumulative_return, MonthYear == max(MonthYear)), 
            aes(label = round(Cumulative_Return, 2)), 
            hjust = 1.2, vjust = 0.5, color = "black") +
  geom_text(data = subset(Index_cumulative_return, MonthYear == max(MonthYear)), 
            aes(label = Index), hjust = -1, vjust = -0.5, color = "black") +
  facet_wrap(~ Index, scales = "free_y") +
  xlab("MonthYear") +
  ylab("Cumulative Return") +
  ggtitle("Cumulative Returns by Index") +
  scale_color_discrete() +
  scale_x_discrete(labels = Index_cumulative_return$Index)



g %+% subset()