# Objective

The goal is to assess the performance of dividend yield as an investment
strategy. I plan to optimize portfolios of the highest paying dividend
stock and/or highest growth in dividends for a group of assets.

-   First calculate the excess returns for indices and their benchmarks
-   Explain relationships within the return series for each region with
    and without stratifying the sample.
-   Then maybe look to build own dividend portfolios to see how that
    would have performed.

# Instruments

To investigate the performance of dividend paying strategies, either
dividend yield or dividend growth I will consider globally traded
indices and their benchmarks. For concreteness, I will look at those
prescribed in literature. From this I will find the excess return.

| TICKER   | NAME                                                                      | Benchmark Ticker | Benchmark Name                          |
|:-----|:------------------------------------|:---------|:--------------------|
| FUDP     | FTSE UK Dividend+ Index                                                   | TUKXG            | FTSE 100 Total Return Index GBP         |
| M2EFDY   | MSCI EM Emerging Markets High Dividend Yield Gross Total Return USD Index | GDUEEGF          | MSCI Daily TR Gross EM USD              |
| M2GBDY   | MSCI United Kingdom High Dividend Yield Gross Total Return USD Index      | GDDUUK           | MSCI UK Gross Total Return USD Index    |
| M2JPDY   | MSCI Japan High Dividend Yield Gross Total Return USD                     | TPXDDVD          | Topix Total Return Index JPY            |
| M2USADVD | MSCI USA Hdy Gross Total Return USD Index                                 | GDDUUS           | MSCI Daily TR Gross USA USD             |
| M2WDHDVD | MSCI World HIGH DIVIDEND YIELD Gross Total Return Total Return USD Index  | GDDUWI           | MSCI Daily TR Gross World USD           |
| SPDAEET  | S&P Europe 350 Dividends Aristocrats Total Return Index                   | SPTR350E         | S&P Europe 350 Gross Total Return Index |
| SPJXDAJT | S&P/JPX Dividend Aristocrats Total Return Index                           | SPXT             | S&P 500 Total Return Index              |
| SPDAUDT  | S&P 500 Dividend Aristocrats Total Return Index                           | SPXT             | S&P 500 Total Return Index              |
| SPSADAZT | S&P South Africa Dividend Aristocrats Index ZAR Gross TR                  | JALSH            | FTSE/JSE Africa All Share Index         |
| TJDIVD   | FTSE/JSE Dividend+ Index Total Return Index                               | JALSH            | FTSE/JSE Africa All Share Index         |
| M2EUGDY  | MSCI Europe Ex UK High Dividend Yield Gross Total Return USD Index        | GDDUE15X         | MSCI Daily TR Gross Europe Ex UK USD    |

## Excess Return

I calculate excess returns as the monthly difference return for index
and benchmark, then calculate cumulative returns for the result.

The indices across regions have different inception dates therefore not
purely comparable across regions.

From the figure below, results of dividend strategies (High Yield or
Dividend Growth) all over the world have been consistently returned a
positive excess over the market index, even though sometimes volatile.

-   consider the mix between high dividend yield versus dividend growth
    portfolios, so color coordinate the different strategies?

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png) \##
Stratification

``` r
# retrieve from yahoo
vix <- getSymbols("VIX")
```

    ## Warning: VIX contains missing values. Some functions will not work if objects
    ## contain missing values in the middle of the series. Consider using na.omit(),
    ## na.approx(), na.fill(), etc to remove or replace them.

``` r
# Turn to tibble 
VIX <- VIX %>%
  tbl2xts::xts_tbl(.)
  
VIX <- VIX %>% select(date, VIX.Close) %>% 
  rename(., close = VIX.Close)
# get rolling volatilty 

RollSD <- VIX %>%  arrange(date) %>%
  mutate(YM = format(date, "%Y-%b")) %>% 
  group_by(YM) %>% 
  mutate(ret = log(close)- lag(log(close))) %>% 
  mutate(ret = coalesce(ret, 0)) %>% 
  mutate(RollSD = RcppRoll::roll_sd(1+ret, 12, fill = NA, align = "right") * 
           sqrt(12)) %>% 
  ungroup() %>% 
  filter(!is.na(RollSD)) %>% 
  select(date, RollSD)
# label and pull dates 
strat_df <- 
  RollSD %>% mutate(topQ = quantile(RollSD, probs = 0.8), 
                botQ = quantile(RollSD, probs = 0.2),
                Strat = ifelse(RollSD >= topQ, "HiVol", 
                               ifelse(RollSD <= botQ, "LowVol", "Normal_Vol")))
#  lets pull dates for the high vol period
hivol_per_vector <- strat_df %>% filter(Strat %in% "HiVol") %>% pull(date)

# use dates to get returns for indexes and benchamrks, I will use the comparison dataframe, that has excess returns to do a crude analysis on excess returns during these periods 

df %>% filter(Date %in% hivol_per_vector) %>% MY_excess_return(.,"FUDP", "TUKXG") 
```

    ## # A tibble: 207 × 2
    ##    date                 FUDP
    ##    <dttm>              <dbl>
    ##  1 2014-12-19 00:00:00 0.998
    ##  2 2014-12-22 00:00:00 0.996
    ##  3 2014-12-23 00:00:00 0.997
    ##  4 2014-12-24 00:00:00 0.997
    ##  5 2014-12-26 00:00:00 0.998
    ##  6 2014-12-29 00:00:00 0.996
    ##  7 2014-12-30 00:00:00 0.995
    ##  8 2014-12-31 00:00:00 0.993
    ##  9 2015-01-20 00:00:00 0.994
    ## 10 2015-01-21 00:00:00 0.990
    ## # ℹ 197 more rows

``` r
A <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(.,"FUDP", "TUKXG") 
B <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "M2EFDY", "GDUEEGF") 
C <- df %>% filter(Date %in% hivol_per_vector) %>% MY_excess_return(., "M2EUGDY", "GDDUE15X") 
D <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "M2GBDY", "GDDUUK") 
E <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "M2JPDY", "TJDIVD") 
F1 <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "M2USADVD", "GDDUUS") 
G <- df %>% filter(Date %in% hivol_per_vector) %>% MY_excess_return(., "M2WDHDVD", "GDDUWI") 
H <- df %>% filter(Date %in% hivol_per_vector) %>% MY_excess_return(., "SPDAEET", "SPTR350E") 
I <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "SPDAUDT", "SPXT") 
J <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "SPJXDAJT", "TPXDDVD") 
K <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "SPSADAZT", "JALSH") 
L <- df %>%filter(Date %in% hivol_per_vector) %>%  MY_excess_return(., "TJDIVD", "JALSH")
  
joined_df <- bind_cols(A, B, C, D, E, F1, G, H, I, J, K, L) 
```

    ## New names:
    ## • `date` -> `date...1`
    ## • `date` -> `date...3`
    ## • `date` -> `date...5`
    ## • `date` -> `date...7`
    ## • `date` -> `date...9`
    ## • `date` -> `date...11`
    ## • `date` -> `date...13`
    ## • `date` -> `date...15`
    ## • `date` -> `date...17`
    ## • `date` -> `date...19`
    ## • `date` -> `date...21`
    ## • `date` -> `date...23`

``` r
compare <- joined_df %>% select(date...1, FUDP, M2EFDY, M2EUGDY, M2GBDY, M2JPDY, M2USADVD, M2WDHDVD, SPDAEET, SPDAUDT, SPJXDAJT, SPSADAZT, TJDIVD) %>% gather(Index , Return , -date...1)

g <- compare %>% ggplot(., aes(x = date...1, y = Return)) +
geom_line() +
labs(x = "Date", y = "Return") +
theme_minimal() +
facet_wrap(~ Index, scales = "free_y", ncol = 4)

g
```

![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)
