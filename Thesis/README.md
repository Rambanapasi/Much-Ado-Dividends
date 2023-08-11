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

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
funds <- readxl::read_xlsx("data/MAD .xlsx")
source("code/Statistics.R")

funds <- funds %>% 
  gather(Tickers, Value, -Date) %>% 
  arrange(Date) %>% group_by(Tickers) %>%
  mutate(Ret = Value/lag(Value)-1) %>% 
  mutate(Ret =coalesce(Ret,0)) %>% 
  ungroup()

BM <- "TUKXG"

funds %>% Moments_Comp(., BM = BM, Yrs_LookBack = 1, NA_Check = 0.9)
```

    ## # A tibble: 14 × 24
    ##    Period      Info    FUDP M2EFDY   TUKXG GDUEEGF M2GBDY GDDUUK M2JPDY GDDUE15X
    ##    <glue>      <chr>  <dbl>  <dbl>   <dbl>   <dbl>  <dbl>  <dbl>  <dbl>    <dbl>
    ##  1 Last 1 Yea… Cum … -0.04   0.133   0.078   0.052  0.128  0.166  0.219    0.277
    ##  2 Last 1 Yea… Retu… -0.002  0.006   0.004   0.003  0.006  0.008  0.01     0.012
    ##  3 Last 1 Yea… Retu… -0.113  0.053   0      -0.024  0.048  0.085  0.136    0.191
    ##  4 Last 1 Yea… SD (…  0.033  0.029   0.026   0.035  0.05   0.04   0.038    0.044
    ##  5 Last 1 Yea… Adj.… -0.271  1.00    0.581   0.344  0.561  0.806  1.26     1.30 
    ##  6 Last 1 Yea… Pain…  0.057  0.026   0.021   0.052  0.066  0.031  0.022    0.029
    ##  7 Last 1 Yea… Avg …  0.033  0.024   0.021   0.057  0.04   0.031  0.024    0.036
    ##  8 Last 1 Yea… Trac…  0.016  0.032   0       0.037  0.038  0.026  0.045    0.031
    ##  9 Last 1 Yea… Info… -1.61   0.388 NaN      -0.156  0.295  0.755  0.718    1.44 
    ## 10 Last 1 Yea… Beta   1.11   0.363   1       0.397  1.27   1.16   0.09     1.20 
    ## 11 Last 1 Yea… Beta…  1.16   0.311   1       0.345  1.38   1.17   0.117    1.28 
    ## 12 Last 1 Yea… Beta…  1.07   0.282   1       0.283  1.14   1.16   0.111    1.12 
    ## 13 Last 1 Yea… Up-D…  0.469  0.383   0       0.391  0.57   0.586  0.422    0.586
    ## 14 Last 1 Yea… Modi… -0.022 -0.015  -0.023  -0.017 -0.032 -0.03  -0.022   -0.026
    ## # ℹ 14 more variables: M2USADVD <dbl>, GDDUUS <dbl>, M2WDHDVD <dbl>,
    ## #   GDDUWI <dbl>, SPDAEET <dbl>, SPTR350E <dbl>, SPJXDAJT <dbl>, SPDAUDT <dbl>,
    ## #   SPXT <dbl>, TPXDDVD <dbl>, SPSADAZT <dbl>, JALSH <dbl>, TJDIVD <dbl>,
    ## #   M2EUGDY <dbl>

``` r
funds %>% Moments_Comp(., BM = BM, Yrs_LookBack = 3, NA_Check = 0.9)
```

    ## # A tibble: 14 × 24
    ##    Period      Info    FUDP M2EFDY   TUKXG GDUEEGF M2GBDY GDDUUK M2JPDY GDDUE15X
    ##    <glue>      <chr>  <dbl>  <dbl>   <dbl>   <dbl>  <dbl>  <dbl>  <dbl>    <dbl>
    ##  1 Last 3 Yea… Cum …  0.136  0.154   0.347   0.004  0.288  0.371  0.376    0.255
    ##  2 Last 3 Yea… Retu…  0.002  0.002   0.005   0      0.004  0.005  0.005    0.004
    ##  3 Last 3 Yea… Retu… -0.055 -0.05    0      -0.092 -0.015  0.006  0.007   -0.023
    ##  4 Last 3 Yea… SD (…  0.035  0.03    0.031   0.036  0.047  0.041  0.036    0.043
    ##  5 Last 3 Yea… Adj.…  0.265  0.345   0.647   0.008  0.39   0.535  0.666    0.387
    ##  6 Last 3 Yea… Pain…  0.07   0.113   0.021   0.179  0.077  0.046  0.063    0.084
    ##  7 Last 3 Yea… Avg …  0.03   0.034   0.023   0.037  0.042  0.033  0.028    0.029
    ##  8 Last 3 Yea… Trac…  0.014  0.032   0       0.037  0.033  0.022  0.045    0.028
    ##  9 Last 3 Yea… Info… -0.915 -0.372 NaN      -0.604 -0.108  0.064  0.037   -0.199
    ## 10 Last 3 Yea… Beta   1.02   0.417   1       0.464  1.11   1.14   0.119    1.05 
    ## 11 Last 3 Yea… Beta…  0.992  0.256   1       0.255  1.02   1.12   0.087    1.00 
    ## 12 Last 3 Yea… Beta…  1.02   0.532   1       0.57   1.13   1.20   0.17     1.12 
    ## 13 Last 3 Yea… Up-D…  0.449  0.336   0       0.366  0.53   0.571  0.328    0.505
    ## 14 Last 3 Yea… Modi… -0.025 -0.022  -0.024  -0.022 -0.033 -0.032 -0.021   -0.029
    ## # ℹ 14 more variables: M2USADVD <dbl>, GDDUUS <dbl>, M2WDHDVD <dbl>,
    ## #   GDDUWI <dbl>, SPDAEET <dbl>, SPTR350E <dbl>, SPJXDAJT <dbl>, SPDAUDT <dbl>,
    ## #   SPXT <dbl>, TPXDDVD <dbl>, SPSADAZT <dbl>, JALSH <dbl>, TJDIVD <dbl>,
    ## #   M2EUGDY <dbl>

``` r
funds %>% Moments_Comp(., BM = BM, Yrs_LookBack = 5, NA_Check = 0.9)
```

    ## # A tibble: 14 × 24
    ##    Period      Info    FUDP M2EFDY   TUKXG GDUEEGF M2GBDY GDDUUK M2JPDY GDDUE15X
    ##    <glue>      <chr>  <dbl>  <dbl>   <dbl>   <dbl>  <dbl>  <dbl>  <dbl>    <dbl>
    ##  1 Last 5 Yea… Cum … -0.257  0.078   0.182   0.107  0.11   0.202  0.3      0.368
    ##  2 Last 5 Yea… Retu… -0.003  0.001   0.002   0.001  0.001  0.002  0.002    0.003
    ##  3 Last 5 Yea… Retu… -0.087 -0.018   0      -0.013 -0.012  0.003  0.019    0.029
    ##  4 Last 5 Yea… SD (…  0.045  0.034   0.038   0.038  0.053  0.046  0.039    0.044
    ##  5 Last 5 Yea… Adj.… -0.272  0.095   0.182   0.114  0.084  0.167  0.294    0.283
    ##  6 Last 5 Yea… Pain…  0.152  0.108   0.057   0.134  0.109  0.075  0.078    0.077
    ##  7 Last 5 Yea… Avg …  0.471  0.049   0.04    0.043  0.078  0.058  0.045    0.038
    ##  8 Last 5 Yea… Trac…  0.02   0.033   0       0.036  0.035  0.022  0.049    0.026
    ##  9 Last 5 Yea… Info… -0.989 -0.122 NaN      -0.079 -0.079  0.033  0.087    0.251
    ## 10 Last 5 Yea… Beta   1.06   0.51    1       0.547  1.07   1.08   0.204    0.948
    ## 11 Last 5 Yea… Beta…  1.08   0.427   1       0.444  1.09   1.11   0.266    0.903
    ## 12 Last 5 Yea… Beta…  1.10   0.611   1       0.633  1.14   1.11   0.257    0.983
    ## 13 Last 5 Yea… Up-D…  0.442  0.339   0       0.36   0.5    0.521  0.31     0.48 
    ## 14 Last 5 Yea… Modi… -0.037 -0.033  -0.04   -0.033 -0.043 -0.04  -0.025   -0.049
    ## # ℹ 14 more variables: M2USADVD <dbl>, GDDUUS <dbl>, M2WDHDVD <dbl>,
    ## #   GDDUWI <dbl>, SPDAEET <dbl>, SPTR350E <dbl>, SPJXDAJT <dbl>, SPDAUDT <dbl>,
    ## #   SPXT <dbl>, TPXDDVD <dbl>, SPSADAZT <dbl>, JALSH <dbl>, TJDIVD <dbl>,
    ## #   M2EUGDY <dbl>

## Stratification
