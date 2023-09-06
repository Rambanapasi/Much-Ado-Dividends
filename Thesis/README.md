# Cleaning

self explanotory, but incase you change the dataset be mindful of the
number of columns and change in the names accordingly.

``` r
# loadings
pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue")

original_df <- readxl::read_xlsx("data/MAD .xlsx")

#  change the column names for ease of analysis

geographical_codenames <- c("UK_HY", "EM_HY", "UK", "EM", "UK_HY_B", "UK_B", "JP_HY", "EU", "US_HY", "US", "W_HY", "W", "EU_DG", "EU_2", "JP_DG", "US_DG", "US_2", "JP", "SA_DG", "SA", "SA_HY", "EU_HY")

colnames(original_df)[2:23] <- geographical_codenames

#  lets get different regional data sets to analysze independently then later join

UK_df <- original_df %>% .[, grepl("UK|Date", colnames(.)) ]
US_df <- original_df %>% .[, grepl("US|Date", colnames(.)) ]
EU_df <- original_df %>% .[, grepl("EU|Date", colnames(.)) ]
EM_df <- original_df %>% .[, grepl("EM|Date", colnames(.)) ]
JP_df <- original_df %>% .[, grepl("JP|Date", colnames(.)) ]
SA_df <- original_df %>% .[, grepl("SA|Date", colnames(.)) ]

#  Lets start the analyses
```

# Purpose

We want to investigate the performance of dividend paying portfolios
across different regions. We look at index construction, dynamic
performance measures and risk analysis of these portfolios. in essence,
why do these portfolios work or not and when they seem to add value to a
portfolio. We also high the distinction in growth versus HY performance.

Diversification, Return and Risk (Sd and MaxDrawdowns) and a combination
of the two.

# Objective

Provide an analysis into dividend portfolios. Literature has shown that
they provide greater excess return over time versus the s&p because the
dividend component over and above the capital gains. We expand this to
other indices, FTSE, MSCI.

-   So its risk and return that we need to evaluate, so do they provide
    that excess return over time that is significantly better than its
    parent index.

-   If they do what are the drivers, we note the construction of the
    indexes by the different providers. are they exposed to higher risk
    assets. lets mention the composition of different sectors in the
    index. are some sectors prone to paying higher dividend than others
    and what is the relationship between return and dividend paynig
    stock.

-   if they do provide more return do they give more risk. what measure
    of risk can we give to illustrate this and how do these indexes
    cover against these risks of the value trap. What other measures of
    risk will be important to measure over time for these portfolios in
    the various regions. Mentioning the correlations to market is
    important

-   finally we consider south African portfolios, are they able to
    consistently give a return. Lets use the sharpe ratios to determine
    the consistency of the portfolios.

-   Show the trailing performances in one graph, ie 2, 3, 5, 10 and
    since inception. \# Instruments

Dividend portfolios are usually constructed using either a high yeild or
a growth in dividend signal.

## Compounding Returns, Aggregate effects of Portfolios

I calculate excess returns as the monthly difference return for index
and benchmark, then geometrically chain the excess return to compute the
cumulative excess returns. The indices across regions have different
inception dates therefore not purely comparable across regions. To
correct for this we start the series will start from the first date for
all indices and standardized to 1, ie all indices start from the same
point. However these indices are not purely comparable, inceptions date
may lead to differing momentum effects.

With that caveat, lets start the analysis.

``` r
source("code/simpleexcessreturn.R")
source("code/EXCESSRETURN.R")
library(glue)

#  just simple excess returns

A <- UK_df %>% MY_excess_return(., "UK_HY", "UK") 
B <- UK_df %>% MY_excess_return(., "UK_HY_B", "UK_B")

UK <- left_join(A, B, "date")


A <- US_df %>% MY_excess_return(., "US_HY", "US")
B <- US_df %>% MY_excess_return(., "US_DG", "US_2")

US <- left_join(A, B, "date")

A <- EU_df %>% MY_excess_return(., "EU_HY", "EU")
B <- EU_df %>% MY_excess_return(., "EU_DG", "EU_2")

EU <- left_join(A, B, "date")

A <- JP_df %>% MY_excess_return(., "JP_HY", "JP")
B <- JP_df %>% MY_excess_return(., "JP_DG", "JP")

JP <- left_join(A, B, "date")

EM <- EM_df %>% MY_excess_return(., "EM_HY", "EM")

A <- SA_df %>% MY_excess_return(., "SA_HY", "SA")
B <- SA_df %>% MY_excess_return(., "SA_DG", "SA")

SA <- left_join(A, B, "date")
```

## Stratification

Next I stratifying the sample period between periods of different market
cycles and volatility.

For volatility I will use the historical series for the CBOE VIX index
in the US, V2 X in the euro, and JALSH VR for SA. EM market volatility
will be proxies by the VIX index. I will get the rolling standard
deviation bucket the data two in either low, mid or high vol. 

After stratification, chain the excess returns for the different periods
before annualizing. This ensures that we can compare performance
according to different periods.

-   Make sure to separate according to region tables accroding to
    region.

-   State the geometic mean and median for the return and include the
    compounding periods

-   for somereason dates are not at monthend

``` r
# get vol data from yahoo 

# vol_data <- readxl::read_xlsx("data/volatility.xlsx")
# VIX <- vol_data %>% select(Date, VIX)
# V2X <- vol_data %>% select(Date, V2X)
# JSV <- vol_data %>% select(Date, JALSHVOL)
# get rolling sd for the volatility index 

# source("code/rollingstarnddev.R")

# US 

# Vixroll <- Rolling_sd(VIX ,"VIX")
# 
# # get the top quartile and bottom quartil
# 
# strat_df <- Vixroll %>% mutate(topQ = quantile(RollSD, probs = 0.8), 
#               botQ = quantile(RollSD, probs = 0.2),
#               Strat = ifelse(RollSD >= topQ, "HiVol", 
#                           ifelse(RollSD <= botQ, "LowVol", "Normal_Vol")))
# 
# # US strat
# 
# hivol_per_vector_us <- strat_df %>% filter(Strat %in% "HiVol") %>% pull(Date)
# lovol_per_vector_us <- strat_df %>% filter(Strat %in% "LowVol") %>% pull(Date)
# 
# # Europe strat 
# 
# Vixroll <- Rolling_sd(V2X ,"V2X")
# 
# # get the top quartile and bottom quartil
# 
# strat_df <- Vixroll %>% mutate(topQ = quantile(RollSD, probs = 0.8), 
#               botQ = quantile(RollSD, probs = 0.2),
#               Strat = ifelse(RollSD >= topQ, "HiVol", 
#                           ifelse(RollSD <= botQ, "LowVol", "Normal_Vol")))
# 
# hivol_per_vector_eu  <- strat_df %>% filter(Strat %in% "HiVol") %>% pull(Date)
# lovol_per_vector_eu  <- strat_df %>% filter(Strat %in% "LowVol") %>% pull(Date)
# 
# # SA 
# 
# Vixroll <- Rolling_sd(JSV ,"JALSHVOL")
# 
# # get the top quartile and bottom quartil
# 
# strat_df <- Vixroll %>% mutate(topQ = quantile(RollSD, probs = 0.8), 
#               botQ = quantile(RollSD, probs = 0.2),
#               Strat = ifelse(RollSD >= topQ, "HiVol", 
#                           ifelse(RollSD <= botQ, "LowVol", "Normal_Vol")))
# 
# hivol_per_vector_sa <- strat_df %>% filter(Strat %in% "HiVol") %>% pull(Date)
# lovol_per_vector_sa <- strat_df %>% filter(Strat %in% "LowVol") %>% pull(Date)
# 
# 
# # get entire returns and apply the vector above 
# # ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
# # get all permutatation 
# A <- df %>% simple_excess_return(.,"FUDP", "TUKXG") 
# B <- df %>% simple_excess_return(., "M2EFDY", "GDUEEGF") 
# C <- df %>% simple_excess_return(., "M2EUGDY", "GDDUE15X") 
# D <- df %>% simple_excess_return(., "M2GBDY", "GDDUUK") 
# E <- df %>% simple_excess_return(., "M2JPDY", "TJDIVD") 
# F1 <- df %>% simple_excess_return(., "M2USADVD", "GDDUUS") 
# G <- df %>% simple_excess_return(., "M2WDHDVD", "GDDUWI") 
# H <- df %>% simple_excess_return(., "SPDAEET", "SPTR350E") 
# I <- df %>% simple_excess_return(., "SPDAUDT", "SPXT") 
# J <- df %>% simple_excess_return(., "SPJXDAJT", "TPXDDVD") 
# K <- df %>% simple_excess_return(., "SPSADAZT", "JALSH") 
# L <- df %>% simple_excess_return(., "TJDIVD", "JALSH")
# 
# #  US excess return
# excessreturns_us <- list( F1, I ,J) %>%
#   reduce(inner_join, by='date') %>% gather(ticker, excess, -date)
# 
# # EU  excess return 
# excessreturns_eu <- list(A, C, D, H) %>%
#   reduce(inner_join, by='date') %>% gather(ticker, excess, -date)
# 
# #  SA excess returns in a single data frame
# excessreturns_em <- list(B, K, L) %>%
#   reduce(inner_join, by='date') %>% gather(ticker, excess, -date)
#  
# 
# # US stat df
# 
# hivol <- excessreturns_us %>%
#   filter(date %in% hivol_per_vector_us) %>% 
#   filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
#   group_by(ticker) %>% 
#   summarise(Hivol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 ) 
# 
# lovol <-  excessreturns_us %>%
#   filter(date %in% lovol_per_vector_us) %>% 
#   filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
#   group_by(ticker) %>% 
#   summarise(lovol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 ) 
# 
# Usvolcom <- left_join(hivol, lovol, by = "ticker")
# 
# EU strat df
# hivol <- excessreturns_eu %>%
#   filter(date %in% hivol_per_vector_eu) %>%
#   filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
#   group_by(ticker) %>%
#   summarise(Hivol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 )
# 
# lovol <-  excessreturns_eu %>%
#   filter(date %in% lovol_per_vector_eu) %>%
#   filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
#   group_by(ticker) %>%
#   summarise(lovol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 )
# 
# euvolcom <- left_join(hivol, lovol, by = "ticker")
# 
# # EM strat df
# hivol <- excessreturns_em %>%
#   filter(date %in% hivol_per_vector_sa) %>%
#   filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
#   group_by(ticker) %>%
#   summarise(Hivol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 )
# 
# lovol <-  excessreturns_em %>%
#   filter(date %in% lovol_per_vector_sa) %>%
#   filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
#   group_by(ticker) %>%
#   summarise(lovol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 )
# 
# emvolcom <- left_join(hivol, lovol, by = "ticker")
# 
# divi_vol_df <- bind_rows(Usvolcom, euvolcom, emvolcom)
# 
# divi_vol_df  <- divi_vol_df %>%
#   mutate(Volatility_Protection = case_when(
#     Hivol_return > lovol_return ~ "higher",
#     TRUE ~ "lower"
#   ))
# 
```

# Interest rate cycles

Given a series of central bank interest rates. I want to get dates of n
consecutive interest rate changes.

-   I will create a column that conditions if there was a rate change or
    nt.
-   if there has been a change for more than 4 quarters take the date.

Can I seggregate the hiking and cutting cycles using the one inrest rate
data series from the US.

## notes

-   SA doesn’t enough “periods” for cutting

``` r
# interest <- readxl::read_xlsx("data/Interest Rates.xlsx")
# 
# 
# # lets create a data frame that gives the interest rate cycles 
# 
#   interest <- interest %>% 
#     gather(Bank, Rate, -Date) %>% 
#     mutate( Month = format(Date, "%b"), YM = format(Date, "%b %y")) %>% 
#     arrange(Date) %>% 
#     group_by(Bank) %>% 
#     ungroup()
#   
#   #  subset dates to just consider the quarterly figures
#   
#   quarters <- c("Mar", "Jun", "Sep", "Dec")
#   
#   #  With that subset of interest rates now use if else and group by date to count times when there was a hiking or cutting 
#   rateschanges <- tidy_interest %>%
#     group_by (YM, Bank) %>% 
#     filter(Date == last(Date)) %>% 
#     filter(Month %in% quarters) %>% 
#     arrange(Date) %>% 
#     group_by(Bank) %>% 
#     mutate(diff = Rate - lag(Rate)) %>% 
#     mutate(Year = format(Date, "%Y")) %>% 
#     group_by(Year) %>% 
#     mutate(
#       Changes = case_when(
#         sum(diff > 0) > 3 ~ "Hiking",
#         sum(diff < 0) > 3 ~ "Cutting",
#         TRUE ~ "Hold"
#       )
#     ) %>% 
#     ungroup() 
# rateschanges
#   
#   
# ```
# 
# # rolling returns 
# 
# these will measure returns for rolling periods similar to those held by a typical institutional investor.
# ```{r echo=TRUE, message=FALSE, warning=FALSE}
# # rolling returns 
# 
# plotdf <- combined_simple %>% 
#   group_by(ticker) %>% 
#   mutate(RollRets = RcppRoll::roll_prod(1 + excess, 36, fill = NA, 
#     align = "right")^(12/36) - 1) %>% 
#   group_by(date) %>% filter(any(!is.na(RollRets))) %>% 
#   ungroup()
# 
# g <- ggplot(plotdf, aes(date, RollRets, color = ticker)) +
#   geom_line(alpha = 0.5, size = 1) +
#   labs(
#     title = "Rolling 3 Year Annualized Returns",
#     subtitle = "",
#     x = "",
#     y = "Rolling 3 year Returns (Ann.)",
#     caption = "Source: Bloomberg"
#   )
# g
```

# rolling standard deviatio

# source of volatility

# Observations

-   we have dividend portfolios of HY and DGPS in US, UK, JAPAN, EM and
    SA.

## Cumulative returns

-   FUDP-UK (HY) had the most impressive

These next two show marginal improvements over market indices -
M2EUGDY-EU (HY) - M2GBDY-UK (HY)

Overall a positive excess return does show some gain to harvesting such
portfolios.

## Stratification analysis

If we just consider the level of volatility in global financial markets.
we can see a clear trend.

-   most portfolios give lower returns when in high vol versus low vol
-   except for SPSADAZT-SA (DGPS), TJDIVD-SA(HY), SPDAEET-EU(DGPS) and
    M2EFDY (HY)-EM.

## Rolling returns

Overall, massive divergence followed by a convergence in rolling excess
returns. There is some divergence towards the end of the sample period.

-   FUDP-UK (HY), SPSADAZT-SA (DGPS), TJDIVD-SA (HY) visually have
    massive variance in their rolling excess returns.

-   Others don’t have erratic movements in rolling returns.

# Analysis

Dividend portfolios either HY or DGPS have overtime give some level of
positive return, as measured by the cumulative return. However, HY
indexes give above average excess return for the sample period. Overtime
however, most portfolios have choppy excess cumulative returns. There is
no super convincing signal that these portfolios give some consistent
excess return.

The moment we stratifying according to different periods of volatility
we notice that during periods of high volatility, its less the type of
signal and more of the region that plays a big part in explaining the
performance. in that case emerging market assets perform better than in
low volatility environments. Unusual given in this time there is a
flight to safety and EM will be risky at this time. During periods of
low vol, advanced market portfolios generally give higher returns that
in high vol conditions.

When we consider rolling returns, excess returns for most portfolios
move in a similar direction, generally there are part of the same asset
class, exposed to the same risk factors and should behave the same way.
with the exception the SA portfolios. we notice that over three years,
it has great variance in excess returns. This too can be said about the
UK high yield portfolio.

So what I can pick out is that dividend portfolios in EM behave
different from advanced economies.

To do - Will stratifying further, look at mid vol, inflation and
interest rates?

Working on the data section, where i describe the portfolios and their
return signalling,

Looked at cumulative excess return. no clear signal but for two HY
portfolios. stratification, all portfolios perform as expected

# Questions and some thoughts

-   There is some story but can be substantiated by looking at the
    constituents.

-   I fear that this can turn into an opinion piece, so some direction,
    should i just make conclusions based on the data and the
    graphs/stats that i provide.

-   can i see what you consider to be a good thesis for me to model.
