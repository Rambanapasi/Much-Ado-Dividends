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

The global dividend portfolios considered in the table below are sourced
from various literature from a practitioner perspective. They represent
stylized portfolio constructed from respective market indexes.

Using a similar approach I will consider broad market indices that are
used to construct the dividend portfolios listed below.

| Index Ticker      | Index Name                   | Benchmark                                                       | Ticker         | Description                                                                                                                                                                                                                                                                                                                                                                              |
|:---|:----|:---------|:--|:--------------------------------------------------|
| DASHDVD CH Equity | DACHENG CSI DVD INDEX FUND A | CSI Dividend Index                                              | SH000922 Index | Dacheng CSI Dividend Index Fund s an open-ended fund incorporated in China. The Fund’s objective is to closely replicates the performance of the CSI Dividend Index and minimizing the tracking error. The fund invests at least 90% of it’s total asset in the members of the tracking index.                                                                                           |
| SAMEUVK FH Equity | DANSKE INVEST- EUR HI DIV -G | MSCI EMU Value -index                                           | MXEM000V Index | Danske Invest Europe High Dividend Fund is an open-end fund registered in Finland. The Fund invests in equities and equity-related securities of value companies in Europe. The Fund’s aim is to exceed the performance of MSCI EMU Value -index in the long term.                                                                                                                       |
| 2236 JP Equity    | GX S&P 500 DVD ARISTOCRATS   | S&P 500 Dividend Aristocrats Price Index                        | SPDAUDP Index  | Global X S&P 500 Dividend Aristocrats ETF is an exchange-traded fund incorporated in Japan. The objective is to provide investment results that corresponds to the performance of S&P 500 Dividend Aristocrats Price Index.                                                                                                                                                              |
| TVEAX US Equity   | GUGGENHEIM RBP DIVIDEND-A    | Dow Jones RBP U.S. Dividend Index                               | INDU Index     | Guggenheim RBP Dividend Fund seeks investment results that correspond generally to the total return performance of the Dow Jones RBP U.S. Dividend Index by investing all of the securities comprising the Index in proportion to the weightings in the Index.                                                                                                                           |
| GVIYX US Equity   | GUIDESTONE VAL EQTY INDX-INS | Russell 1000 Value Index                                        | RU10VATR Index | Guidestone Value Equity Index Fund aims to provide investment results approximating the aggregate price and dividend performance of the securities included in the Russell 1000 Value Index. The Fund invests in equity securities in the Russell 1000 Value Index, in weightings that approximate the relative composition of the securities contained in the Russell 1000 Value Index. |
| 315960 KS Equity  | KBSTAR LC HIGH DVD 10 TR ETF | WISE Large Cap High Dividend 10 Total Return Index              | WFNILCHD Index | KB KBSTAR Large Cap High Dividend10TR ETF is an exchange-traded fund established in South Korea. The fund’s objective is to provide investment return that tracks the performance of WISE Large Cap High Dividend 10 Total Return Index.                                                                                                                                                 |
| SIMDPB1 SJ Equity | SATRIX DIVIDEND+ INDEX FU A2 | FTSE/ JSE Top 40 and FTSE/JSE Mid Cap Index (excl. Real Estate) | NA             | Satrix Dividend+ Index Fund is an open-end fund incorporated in South Africa. The Fund’s objective is to replicate the FTSE/JSE Dividend+ Index. The index consists of 30 high dividend yielding companies within the universe of the FTSE/ JSE Top 40 and FTSE/JSE Mid Cap Index (excl. Real Estate) that are expected to pay the best normal dividends over the forthcoming year.      |
| LGSEADV FP Equity | STRATEGIE EUROACTION DIV     | MSCI EMU High Dividend Yield en Euro                            | MXEMHDVD Index | Strategie EuroActions Dividendes is an open-end fund registered in France. The objective of the Fund is to obtain an performance at least equal to its index: MSCI EMU High Dividend Yield en Euro. The Fund invest at least 75 percent of its assets in securities listed on that index.                                                                                                |
| TISCOHD TB Equity | TISCO HIGH DIVIDEND EQUITY   | SET High Dividend 30 Index                                      | SETHDTR Index  | TISCO High Dividend Equity Fund is an open-end fund incorporated in Thailand. The Fund invests at least 80% of its portfolio in the members of the SET High Dividend 30 Index.                                                                                                                                                                                                           |
| VHYAX US Equity   | VANGUARD HI DVD YLD INDX-ADM | FTSE High Dividend Yield                                        | TGPVAN Index   | Vanguard High Dividend Yield Index Fund seeks the performance of the FTSE High Dividend Yield Index which consists of common stocks of companies that pay higher than average dividends by replicating the index by investing it assets the stocks that make up the index at the same proportion as its weighting in the index.                                                          |
| VIAAX US Equity   | VANGUARD INTL DVD AP IDX-ADM | Nasdaq International Dividend Achievers Select Index            | DVGITR Index   | Vanguard International Dividend Appreciation Index Fund aims to track the performance of the Nasdaq International Dividend Achievers Select Index. The Fund focuses on high quality companies located in developed and emerging markets that have both the ability and the commitment to grow their dividends over time.                                                                 |
| VIHAX US Equity   | VANGUARD INTL HI DVD YLD-ADM | FTSE All-World ex U.S. High Dividend Yield Index                | GPVAN0TR Index | Vanguard International High Dividend Yield Index Fund aims to track the performance of the FTSE All-World ex U.S. High Dividend Yield Index by focusing on companies located in developed and emerging markets that are forecasted to have above-average dividend yields.                                                                                                                |

## Excess Return

Excess returns here are calculated as the difference between cumulative
index return and benchmark return of several globally traded dividend
investment portfolios. All of the indexes considered gross total return
and are compared to the performance of the relevant universe benchmark
in the same currency.

Cumulative returns are not comparable across different indexes for the
different durations. Mind that in the analysis.

From the results dividend strategies all over the world have been
consistently giving a positive premium over the market index. Some
indices have been more successful that others, FUDP giving the highest
cumulative return amongst all of them.

-   consider the mix between high dividend yield versus dividend growth
    portfolios.

-   make the inception date the same just to get comparability across
    different markets

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png) \##
Stratification

If we stratify these samples into different equity market stability
cycles, we can then dichipher when these dividend strategies really
work.

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

plot <- compare %>% ggplot(aes(x = date...1, y = Return, color = Index)) +
  geom_line() +
  labs(x = "Date", y = "Return", color = "Index") +
  theme_minimal() +
  facet_wrap(~ Index, scales = "free_y", ncol = 4)
```
