# Roadmap

The goal is to assess the performance of dividend yield as an investment
strategy. I plan to use optimized portfolios of the highest paying
dividend stock and/or highest growth in dividends for a group of assets.
However, first I want to calculate all cumulative returns for all
indexes and their benchmarks.

## Approach to Use

Passive equity investment offers transparent, investable and a
rules-based approach, avoiding the need to identify mispriced securities
commonly associated with active portfolio construction. Before we build
our own portfolios I will compare performance indexes against their
benchmarks across the globally.

I will present this in tabular form showing a comparison between index
and benchmark.

After this I will build global dividend portfolios by sector and assess
whether there performance offers superior excess return over the generic
geographical option that we often see practitioners construct.

# Instruments

``` r
library(knitr)
Table_data <- readxl::read_xlsx("data/Systematic Indices and Benchmarks.xlsx")
knitr::kable(Table_data) 
```

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

# Portfolios

``` r
pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue")
library(tbl2xts)
library(tidyverse)
library(xts)


data <- readxl::read_xlsx("data/Benckmarks.xlsx")

#  Mutate_at replaces all the previous columns
d1 <- 
  data %>% 
  arrange(Date) %>% 
  mutate_at(.vars = vars(-Date), ~log(.)-log(lag(.)))

# Just to make some things much simplier
d2 <- data %>% 
  gather(Index, Value, -Date) %>% 
  mutate(Return = Value/lag(Value)-1) %>% 
  ungroup()


#  Lets get log returns using the dplyr, no long format just yet

Year_Month <- function(x) format(as.Date(x), "%Y_%B") 

#  Now to do this using the tidy mannaer 

d2 <- data %>% 
  arrange(Date) %>% 
  mutate(YM = Year_Month(Date)) %>% 
  gather(index, value, -Date) %>% 
  group_by(index) 

#  Just converting it to be numeric

d2$value <- as.numeric(d2$value)
```

    ## Warning: NAs introduced by coercion

``` r
#  These are just the normal componded returns
compounded_returns <- d2 %>%
  mutate(YM = Year_Month(Date)) %>% 
  mutate(dailyReturn = value/lag(value) - 1) %>% 
  filter(Date >= lubridate::ymd(20130128)) %>% 
  # coalesce returns NULL or NA 
  mutate(daliyReturn = coalesce(dailyReturn, 0)) %>% 
  mutate(dailyIndex = cumprod(1 + dailyReturn)) %>% 
  group_by(YM) %>% 
  filter(Date == last(Date)) %>% 
  group_by(index) %>% 
  mutate(MonthlyReturn = dailyIndex/lag(dailyIndex) - 1) %>% 
  select(Date, index, dailyIndex)

compounded_returns %>% tbl_xts(., cols_to_xts = dailyIndex, spread_by = index)
```

    ## Warning: object timezone (UTC) is different from system timezone ()
    ##   NOTE: set 'options(xts_check_TZ = FALSE)'to disable this warning
    ##     This note is displayed once per session

    ##                 FUDP    M2EFDY     TUKXG   GDUEEGF M2GBDY    GDDUUK   M2JPDY
    ## 2013-01-31 0.9908422 0.9985851 0.9987969 1.0004008     NA 1.0020210 1.039402
    ## 2013-02-28 1.0213106 0.9792622 1.0165873 0.9879760     NA 0.9770850 1.056993
    ## 2013-03-29 1.0174703 0.9624359 1.0300108 0.9711735     NA 0.9887045 1.086702
    ## 2013-04-30 1.0346992 0.9775913 1.0357796 0.9788741     NA 1.0191670 1.163184
    ## 2013-05-31 1.0785199 0.9418538 1.0651799 0.9542212     NA 1.0205138 1.057698
    ## 2013-06-28 1.0251992 0.8850598 1.0091518 0.8939277     NA 0.9674709 1.066695
    ## 2013-07-31 1.0933697 0.9024777 1.0757767 0.9037512     NA 1.0312190 1.074495
    ## 2013-08-30 1.0574388 0.8979633 1.0494452 0.8885848     NA 1.0268759 1.053783
    ## 2013-09-30 1.0723973 0.9590961 1.0587259 0.9466518     NA 1.0840850 1.120059
    ## 2013-10-31 1.1193619 0.9951356 1.1046297 0.9927835     NA 1.1220542 1.135757
    ##        ...                                                                  
    ## 2022-09-30        NA 0.8958681        NA 1.0752239     NA 1.1207299 1.601293
    ## 2022-10-31        NA 0.8809875        NA 1.0419818     NA 1.1883053 1.623030
    ## 2022-11-30        NA 1.0090088        NA 1.1966864     NA 1.3162402 1.794077
    ## 2022-12-30        NA 0.9880809        NA 1.1805139     NA 1.3110485 1.804425
    ## 2023-01-31        NA 1.0462083        NA 1.2738411     NA 1.3964057 1.888080
    ## 2023-02-28        NA 1.0121501        NA 1.1913377     NA 1.3998874 1.839208
    ## 2023-03-31        NA 1.0435759        NA 1.2279327     NA 1.3911626 1.913145
    ## 2023-04-28        NA 1.0559914        NA 1.2142505     NA 1.4650995 1.943998
    ## 2023-05-31        NA 1.0294927        NA 1.1942065     NA 1.3688955 1.966559
    ## 2023-06-28        NA 1.0670537        NA 1.2418520     NA 1.4041899 2.101290
    ##             GDDUE15X  M2USADVD    GDDUUS M2WDHDVD   GDDUWI   SPDAEET  SPTR350E
    ## 2013-01-31 0.9972674 0.9979792 0.9970812 1.004313 1.000252 0.9918711 0.9914506
    ## 2013-02-28 0.9687651 1.0203834 1.0098937 1.007735 1.002404 1.0256633 0.9997583
    ## 2013-03-29 0.9607710 1.0657900 1.0478811 1.036159 1.026401        NA        NA
    ## 2013-04-30 1.0114866 1.0957393 1.0686063 1.083367 1.059453        NA        NA
    ## 2013-05-31 1.0162846 1.0961767 1.0911238 1.050537 1.060796        NA        NA
    ## 2013-06-28 0.9696064 1.0872944 1.0765753 1.025549 1.035081        NA        NA
    ## 2013-07-31 1.0450175 1.1338873 1.1332200 1.074932 1.089875        NA        NA
    ## 2013-08-30 1.0273870 1.0986649 1.1019571 1.049468 1.067142        NA        NA
    ## 2013-09-30 1.1099447 1.1168165 1.1384571 1.100835 1.120931        NA        NA
    ## 2013-10-31 1.1618596 1.1739906 1.1890012 1.145828 1.165074        NA        NA
    ##        ...                                                                    
    ## 2022-09-30 1.3992526 2.4522711 2.8584445 1.780078 2.133558        NA        NA
    ## 2022-10-31 1.5049135 2.6944696 3.0853588 1.914319 2.287355        NA        NA
    ## 2022-11-30 1.6789268 2.8896831 3.2532231 2.068559 2.447525        NA        NA
    ## 2022-12-30 1.6819048 2.8001367 3.0619434 2.040042 2.344512        NA        NA
    ## 2023-01-31 1.8394391 2.8487805 3.2634052 2.097713 2.511038        NA        NA
    ## 2023-02-28 1.8235487 2.7549413 3.1855002 2.029593 2.451649        NA        NA
    ## 2023-03-31 1.8863557 2.7800298 3.2986444 2.079430 2.529186        NA        NA
    ## 2023-04-28 1.9621760 2.7915762 3.3405066 2.120187 2.574814        NA        NA
    ## 2023-05-31 1.8559168 2.6695721 3.3622349 2.027909 2.551076        NA        NA
    ## 2023-06-28 1.9233448 2.7792054 3.5279550 2.104895 2.667464        NA        NA
    ##            SPJXDAJT   SPDAUDT      SPXT  TPXDDVD  SPSADAZT     JALSH    TJDIVD
    ## 2013-01-31 1.016614 0.9956832 0.9971684 1.025302 0.9789806 0.9986176 0.9884201
    ## 2013-02-28       NA        NA        NA       NA 0.9712837 0.9795407 0.9753095
    ## 2013-03-29       NA        NA        NA       NA        NA        NA        NA
    ## 2013-04-30       NA        NA        NA       NA        NA        NA        NA
    ## 2013-05-31       NA        NA        NA       NA        NA        NA        NA
    ## 2013-06-28       NA        NA        NA       NA        NA        NA        NA
    ## 2013-07-31       NA        NA        NA       NA        NA        NA        NA
    ## 2013-08-30       NA        NA        NA       NA        NA        NA        NA
    ## 2013-09-30       NA        NA        NA       NA        NA        NA        NA
    ## 2013-10-31       NA        NA        NA       NA        NA        NA        NA
    ##        ...                                                                    
    ## 2022-09-30       NA        NA        NA       NA        NA        NA        NA
    ## 2022-10-31       NA        NA        NA       NA        NA        NA        NA
    ## 2022-11-30       NA        NA        NA       NA        NA        NA        NA
    ## 2022-12-30       NA        NA        NA       NA        NA        NA        NA
    ## 2023-01-31       NA        NA        NA       NA        NA        NA        NA
    ## 2023-02-28       NA        NA        NA       NA        NA        NA        NA
    ## 2023-03-31       NA        NA        NA       NA        NA        NA        NA
    ## 2023-04-28       NA        NA        NA       NA        NA        NA        NA
    ## 2023-05-31       NA        NA        NA       NA        NA        NA        NA
    ## 2023-06-28       NA        NA        NA       NA        NA        NA        NA
    ##            YM
    ## 2013-01-31 NA
    ## 2013-02-28 NA
    ## 2013-03-29 NA
    ## 2013-04-30 NA
    ## 2013-05-31 NA
    ## 2013-06-28 NA
    ## 2013-07-31 NA
    ## 2013-08-30 NA
    ## 2013-09-30 NA
    ## 2013-10-31 NA
    ##        ...   
    ## 2022-09-30 NA
    ## 2022-10-31 NA
    ## 2022-11-30 NA
    ## 2022-12-30 NA
    ## 2023-01-31 NA
    ## 2023-02-28 NA
    ## 2023-03-31 NA
    ## 2023-04-28 NA
    ## 2023-05-31 NA
    ## 2023-06-28 NA

``` r
compounded_returns %>%
  ggplot(aes(Date, dailyIndex, color = index, group = index)) +
  geom_line()
```

    ## Warning: Removed 1491 rows containing missing values (`geom_line()`).

![](README_files/figure-markdown_github/Cumulative%20Return-1.png)

``` r
  # facet_wrap(~ index) +
  # theme(legend.position = "none")
```
