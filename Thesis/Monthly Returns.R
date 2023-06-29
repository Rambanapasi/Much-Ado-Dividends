

# Change for it to be recognized as date
Dividend_portfolios$Date <- as.Date(Dividend_portfolios$Date)

# Some initial wrangling 
Date_wragler <- function(df) {
  df %>% 
  arrange(Date) %>% 
  mutate(MonthYear  = format(Date, "%b%y")) %>% select(Date, MonthYear, 2:24)}

df_1 <- Date_wragler(df = Dividend_portfolios)

# Some further cleaning 

Tidy_Monthly_returns <- function (Date_wrangled_df){ 
  df <- Date_wrangled_df%>%
  group_by(MonthYear) %>%
  summarise(across(.cols = 3:24, .fns = ~last(.) / first(.) - 1, .names = "R_{.col}")) %>% 
  gather(key = Index , value = Return, -MonthYear) %>%
  arrange(MonthYear) 
  df 
}

Monthly_return_tidy <- Monthly_returns(df_1)

# Get cummulative returns 

cumulative_returns <- function(df) {
  df <- df %>%
       group_by( MonthYear, Index  ) %>%
       summarise(Cumulative_Return = cumprod(1 + Return) - 1)
       ungroup()
       df}

Index_cumulative_return <- cumulative_returns(Monthly_return_tidy)

ggplot(Index_cumulative_return, aes(x = MonthYear, y = Cumulative_Return, color = Index, group = Index)) +
  geom_line() +
  facet_wrap(~ Index, scales = "free_y") +
  xlab("MonthYear") +
  ylab("Cumulative Return") +
  ggtitle("Cumulative Returns by Index") +
  scale_color_discrete()  # Optional: Use a discrete color scale

# A bit more color

ggplot(Index_cumulative_return, aes(x = MonthYear, y = Cumulative_Return, color = Index, group = Index)) +
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
  scale_x_discrete(labels = Index_cumulative_returns$Index)
