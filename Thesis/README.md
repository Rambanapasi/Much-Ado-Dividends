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

<div id="uqxiinyqir" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#uqxiinyqir table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#uqxiinyqir thead, #uqxiinyqir tbody, #uqxiinyqir tfoot, #uqxiinyqir tr, #uqxiinyqir td, #uqxiinyqir th {
  border-style: none;
}

#uqxiinyqir p {
  margin: 0;
  padding: 0;
}

#uqxiinyqir .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#uqxiinyqir .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#uqxiinyqir .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#uqxiinyqir .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#uqxiinyqir .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#uqxiinyqir .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uqxiinyqir .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#uqxiinyqir .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#uqxiinyqir .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#uqxiinyqir .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#uqxiinyqir .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#uqxiinyqir .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#uqxiinyqir .gt_spanner_row {
  border-bottom-style: hidden;
}

#uqxiinyqir .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#uqxiinyqir .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#uqxiinyqir .gt_from_md > :first-child {
  margin-top: 0;
}

#uqxiinyqir .gt_from_md > :last-child {
  margin-bottom: 0;
}

#uqxiinyqir .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#uqxiinyqir .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#uqxiinyqir .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#uqxiinyqir .gt_row_group_first td {
  border-top-width: 2px;
}

#uqxiinyqir .gt_row_group_first th {
  border-top-width: 2px;
}

#uqxiinyqir .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#uqxiinyqir .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#uqxiinyqir .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#uqxiinyqir .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uqxiinyqir .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#uqxiinyqir .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#uqxiinyqir .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#uqxiinyqir .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#uqxiinyqir .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#uqxiinyqir .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#uqxiinyqir .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#uqxiinyqir .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#uqxiinyqir .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#uqxiinyqir .gt_left {
  text-align: left;
}

#uqxiinyqir .gt_center {
  text-align: center;
}

#uqxiinyqir .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#uqxiinyqir .gt_font_normal {
  font-weight: normal;
}

#uqxiinyqir .gt_font_bold {
  font-weight: bold;
}

#uqxiinyqir .gt_font_italic {
  font-style: italic;
}

#uqxiinyqir .gt_super {
  font-size: 65%;
}

#uqxiinyqir .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#uqxiinyqir .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#uqxiinyqir .gt_indent_1 {
  text-indent: 5px;
}

#uqxiinyqir .gt_indent_2 {
  text-indent: 10px;
}

#uqxiinyqir .gt_indent_3 {
  text-indent: 15px;
}

#uqxiinyqir .gt_indent_4 {
  text-indent: 20px;
}

#uqxiinyqir .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="TICKER">TICKER</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="NAME">NAME</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Benchmark Ticker">Benchmark Ticker</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Benchmark Name">Benchmark Name</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="TICKER" class="gt_row gt_left">FUDP</td>
<td headers="NAME" class="gt_row gt_left">FTSE UK Dividend+ Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">TUKXG</td>
<td headers="Benchmark Name" class="gt_row gt_left">FTSE 100 Total Return Index GBP</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">M2EFDY</td>
<td headers="NAME" class="gt_row gt_left">MSCI EM Emerging Markets High Dividend Yield Gross Total Return USD Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">GDUEEGF</td>
<td headers="Benchmark Name" class="gt_row gt_left">MSCI Daily TR Gross EM USD</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">M2GBDY</td>
<td headers="NAME" class="gt_row gt_left">MSCI United Kingdom High Dividend Yield Gross Total Return USD Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">GDDUUK</td>
<td headers="Benchmark Name" class="gt_row gt_left">MSCI UK Gross Total Return USD Index</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">M2JPDY</td>
<td headers="NAME" class="gt_row gt_left">MSCI Japan High Dividend Yield Gross Total Return USD</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">TPXDDVD</td>
<td headers="Benchmark Name" class="gt_row gt_left">Topix Total Return Index JPY</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">M2USADVD</td>
<td headers="NAME" class="gt_row gt_left">MSCI USA Hdy Gross Total Return USD Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">GDDUUS</td>
<td headers="Benchmark Name" class="gt_row gt_left">MSCI Daily TR Gross USA USD</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">M2WDHDVD</td>
<td headers="NAME" class="gt_row gt_left">MSCI World HIGH DIVIDEND YIELD Gross Total Return Total Return USD Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">GDDUWI</td>
<td headers="Benchmark Name" class="gt_row gt_left">MSCI Daily TR Gross World USD</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">SPDAEET</td>
<td headers="NAME" class="gt_row gt_left">S&amp;P Europe 350 Dividends Aristocrats Total Return Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">SPTR350E</td>
<td headers="Benchmark Name" class="gt_row gt_left">S&amp;P Europe 350 Gross Total Return Index</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">SPJXDAJT</td>
<td headers="NAME" class="gt_row gt_left">S&amp;P/JPX Dividend Aristocrats Total Return Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">SPXT</td>
<td headers="Benchmark Name" class="gt_row gt_left">S&amp;P 500 Total Return Index</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">SPDAUDT</td>
<td headers="NAME" class="gt_row gt_left">S&amp;P 500 Dividend Aristocrats Total Return Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">SPXT</td>
<td headers="Benchmark Name" class="gt_row gt_left">S&amp;P 500 Total Return Index</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">SPSADAZT</td>
<td headers="NAME" class="gt_row gt_left">S&amp;P South Africa Dividend Aristocrats Index ZAR Gross TR</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">JALSH</td>
<td headers="Benchmark Name" class="gt_row gt_left">FTSE/JSE Africa All Share Index</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">TJDIVD</td>
<td headers="NAME" class="gt_row gt_left">FTSE/JSE Dividend+ Index Total Return Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">JALSH</td>
<td headers="Benchmark Name" class="gt_row gt_left">FTSE/JSE Africa All Share Index</td></tr>
    <tr><td headers="TICKER" class="gt_row gt_left">M2EUGDY</td>
<td headers="NAME" class="gt_row gt_left">MSCI Europe Ex UK High Dividend Yield Gross Total Return USD Index</td>
<td headers="Benchmark Ticker" class="gt_row gt_left">GDDUE15X</td>
<td headers="Benchmark Name" class="gt_row gt_left">MSCI Daily TR Gross Europe Ex UK USD</td></tr>
  </tbody>
  
  
</table>
</div>

## Excess Return

I calculate excess returns as the monthly difference return for index
and benchmark, then calculate cumulative returns for the result.

The indices across regions have different inception dates therefore not
purely comparable across regions.

From the figure below, results of dividend strategies (High Yield or
Dividend Growth) at different inception dates have been consistently
returned a positive excess over the market index, even though sometimes
volatile. This shows full sample performance.

-   consider the mix between high dividend yield versus dividend growth
    portfolios, so color coordinate the different strategies?

``` r
# loadings 
pacman::p_load("xts", "tidyverse", "tbl2xts", "PerformanceAnalytics", 
               "lubridate", "glue")
library(tbl2xts)
library(tidyverse)
library(xts)
source("code/EXCESSRETURN.R")
source("code/EXCESSRETURN2.R")
library(quantmod)

df <- readxl::read_xlsx("data/MAD .xlsx") 

# get all permutatation 
A <- df %>% MY_excess_return(.,"FUDP", "TUKXG") 
B <- df %>% MY_excess_return(., "M2EFDY", "GDUEEGF") 
C <- df %>% MY_excess_return(., "M2EUGDY", "GDDUE15X") 
D <- df %>% MY_excess_return(., "M2GBDY", "GDDUUK") 
E <- df %>% MY_excess_return(., "M2JPDY", "TJDIVD") 
F1 <- df %>% MY_excess_return(., "M2USADVD", "GDDUUS") 
G <- df %>% MY_excess_return(., "M2WDHDVD", "GDDUWI") 
H <- df %>% MY_excess_return(., "SPDAEET", "SPTR350E") 
I <- df %>% MY_excess_return(., "SPDAUDT", "SPXT") 
J <- df %>% MY_excess_return(., "SPJXDAJT", "TPXDDVD") 
K <- df %>% MY_excess_return(., "SPSADAZT", "JALSH") 
L <- df %>% MY_excess_return(., "TJDIVD", "JALSH")

#  cumulative excess returns in a single data frame
compare <- list(A, B, C, D, E, F1, G,H,J, K, L) %>%
  reduce(inner_join, by='date') %>% gather(ticker, excess, -date)

plot <- compare %>% ggplot(aes(x = date, y = excess)) +
  geom_line() +
  labs(x = "Date", y = "Return") +
  theme_minimal() +
  facet_wrap(~ ticker, scales = "free_y", ncol = 4)

plot
```

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png)

## Stratification

Applying a top down approach means that it would be prudent to consider
returns of the dividend portfolios under different time periods

I will use volatility and interest rate cycles.

-   For volatility I will use the historical series for the CBOE VIX
    index. I will get the roll standard deviation and separate values
    according to their percentile to get periods that expirienced the
    most volatility during the period. then bucket the two periods in
    either low or high vol So periods of high volatility and low
    volatility.

-   then annulized measure to get out excess returns on a three, five
    and ten year basis.

-   For interest rate cycles use periods of interest cutting and hiking.

``` r
# get vol data from yahoo 
library(quantmod)
library(tidyverse)

source("code/uncompoundedexcess.R")
source("code/simpleexcessreturn.R")
vix <- getSymbols("VIX")
VIX <- VIX %>% tbl2xts::xts_tbl(.)
VIX <- VIX %>% select(date, VIX.Close)

# get rolling sd for the volatility index 

Roll.sd <- VIX%>% rename(Close = VIX.Close) %>% 
  mutate(Ret = log(Close)- lag (log(Close))) %>% 
  filter(date > first(date)) %>% 
  mutate(RollSD = RcppRoll::roll_sd(1 + Ret, 12, fill = NA, align = "right") * 
    sqrt(12))

Roll.sd <- Roll.sd %>% filter(!is.na(RollSD))

# get the top quartile and bottom quartile

strat_df <- 
Roll.sd %>% mutate(topQ = quantile(RollSD, probs = 0.8), 
              botQ = quantile(RollSD, probs = 0.2),
              Strat = ifelse(RollSD >= topQ, "HiVol", 
                          ifelse(RollSD <= botQ, "LowVol", "Normal_Vol")))

hivol_per_vector <- strat_df %>% filter(Strat %in% "HiVol") %>% pull(date)
lovol_per_vector <- strat_df %>% filter(Strat %in% "LowVol") %>% pull(date)


# get entire returns and apply the vector above 
# voldata <-df %>% monthlyret(.) 

# get all permutatation 
A <- df %>% simple_excess_return(.,"FUDP", "TUKXG") 
B <- df %>% simple_excess_return(., "M2EFDY", "GDUEEGF") 
C <- df %>% simple_excess_return(., "M2EUGDY", "GDDUE15X") 
D <- df %>% simple_excess_return(., "M2GBDY", "GDDUUK") 
E <- df %>% simple_excess_return(., "M2JPDY", "TJDIVD") 
F1 <- df %>% simple_excess_return(., "M2USADVD", "GDDUUS") 
G <- df %>% simple_excess_return(., "M2WDHDVD", "GDDUWI") 
H <- df %>% simple_excess_return(., "SPDAEET", "SPTR350E") 
I <- df %>% simple_excess_return(., "SPDAUDT", "SPXT") 
J <- df %>% simple_excess_return(., "SPJXDAJT", "TPXDDVD") 
K <- df %>% simple_excess_return(., "SPSADAZT", "JALSH") 
L <- df %>% simple_excess_return(., "TJDIVD", "JALSH")

#  cexcess returns in a single data frame
excessreturns <- list(A, B, C, D, E, F1, G,H,J, K, L) %>%
  reduce(inner_join, by='date') %>% gather(ticker, excess, -date)

# hivol <- voldata %>%
#   filter(Date %in% hivol_per_vector) %>% 
#   filter(Date >= fmxdat::safe_month_min(last(Date), N = 36)) %>%
#   group_by(Tickers) %>% 
#   summarise(Hivol_return = prod(1+ret, na.rm=T) ^ (12/(36)) -1 ) 
# 
# lovol <-  voldata %>%
#   filter(Date %in% lovol_per_vector) %>% 
#   filter(Date >= fmxdat::safe_month_min(last(Date), N = 36)) %>%
#   group_by(Tickers) %>% 
#   summarise(Lovol_return = prod(1+ret, na.rm=T) ^ (12/(36)) -1 ) 

hivol <- excessreturns %>%
  filter(date %in% hivol_per_vector) %>% 
  filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
  group_by(ticker) %>% 
  summarise(Hivol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 ) 

lovol <-  excessreturns%>%
  filter(date %in% lovol_per_vector) %>% 
  filter(date >= fmxdat::safe_month_min(last(date), N = 36)) %>%
  group_by(ticker) %>% 
  summarise(lovol_return = prod(1+excess, na.rm=T) ^ (12/(36)) -1 ) 

volreturns <- left_join(hivol, lovol, by = "ticker") %>% 
  mutate(trend = case_when(
    Hivol_return > lovol_return ~ "higher",
    TRUE ~ "lower"
  ))

suppressMessages({
  vol_table <- volreturns %>%
    gt::gt() %>%
    fmt_number(
      columns = everything(),
      decimals = 2,
      use_seps = FALSE
    )
})

 
 vol_table
```

<div id="aiabmjxqmu" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#aiabmjxqmu table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#aiabmjxqmu thead, #aiabmjxqmu tbody, #aiabmjxqmu tfoot, #aiabmjxqmu tr, #aiabmjxqmu td, #aiabmjxqmu th {
  border-style: none;
}

#aiabmjxqmu p {
  margin: 0;
  padding: 0;
}

#aiabmjxqmu .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#aiabmjxqmu .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#aiabmjxqmu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#aiabmjxqmu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#aiabmjxqmu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#aiabmjxqmu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#aiabmjxqmu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#aiabmjxqmu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#aiabmjxqmu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#aiabmjxqmu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#aiabmjxqmu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#aiabmjxqmu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#aiabmjxqmu .gt_spanner_row {
  border-bottom-style: hidden;
}

#aiabmjxqmu .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#aiabmjxqmu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#aiabmjxqmu .gt_from_md > :first-child {
  margin-top: 0;
}

#aiabmjxqmu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#aiabmjxqmu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#aiabmjxqmu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#aiabmjxqmu .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#aiabmjxqmu .gt_row_group_first td {
  border-top-width: 2px;
}

#aiabmjxqmu .gt_row_group_first th {
  border-top-width: 2px;
}

#aiabmjxqmu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#aiabmjxqmu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#aiabmjxqmu .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#aiabmjxqmu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#aiabmjxqmu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#aiabmjxqmu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#aiabmjxqmu .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#aiabmjxqmu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#aiabmjxqmu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#aiabmjxqmu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#aiabmjxqmu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#aiabmjxqmu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#aiabmjxqmu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#aiabmjxqmu .gt_left {
  text-align: left;
}

#aiabmjxqmu .gt_center {
  text-align: center;
}

#aiabmjxqmu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#aiabmjxqmu .gt_font_normal {
  font-weight: normal;
}

#aiabmjxqmu .gt_font_bold {
  font-weight: bold;
}

#aiabmjxqmu .gt_font_italic {
  font-style: italic;
}

#aiabmjxqmu .gt_super {
  font-size: 65%;
}

#aiabmjxqmu .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#aiabmjxqmu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#aiabmjxqmu .gt_indent_1 {
  text-indent: 5px;
}

#aiabmjxqmu .gt_indent_2 {
  text-indent: 10px;
}

#aiabmjxqmu .gt_indent_3 {
  text-indent: 15px;
}

#aiabmjxqmu .gt_indent_4 {
  text-indent: 20px;
}

#aiabmjxqmu .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ticker">ticker</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Hivol_return">Hivol_return</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="lovol_return">lovol_return</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="trend">trend</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="ticker" class="gt_row gt_left">FUDP</td>
<td headers="Hivol_return" class="gt_row gt_right">0.01</td>
<td headers="lovol_return" class="gt_row gt_right">0.03</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">M2EFDY</td>
<td headers="Hivol_return" class="gt_row gt_right">0.01</td>
<td headers="lovol_return" class="gt_row gt_right">−0.01</td>
<td headers="trend" class="gt_row gt_left">higher</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">M2EUGDY</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">0.00</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">M2GBDY</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">0.01</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">M2JPDY</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">0.01</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">M2USADVD</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">0.00</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">M2WDHDVD</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">0.00</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">SPDAEET</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">−0.02</td>
<td headers="trend" class="gt_row gt_left">higher</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">SPJXDAJT</td>
<td headers="Hivol_return" class="gt_row gt_right">−0.03</td>
<td headers="lovol_return" class="gt_row gt_right">0.01</td>
<td headers="trend" class="gt_row gt_left">lower</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">SPSADAZT</td>
<td headers="Hivol_return" class="gt_row gt_right">0.00</td>
<td headers="lovol_return" class="gt_row gt_right">0.00</td>
<td headers="trend" class="gt_row gt_left">higher</td></tr>
    <tr><td headers="ticker" class="gt_row gt_left">TJDIVD</td>
<td headers="Hivol_return" class="gt_row gt_right">0.02</td>
<td headers="lovol_return" class="gt_row gt_right">−0.02</td>
<td headers="trend" class="gt_row gt_left">higher</td></tr>
  </tbody>
  
  
</table>
</div>
