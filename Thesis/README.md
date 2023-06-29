# Intro

For my thesis my ultimate aim is to find out the signalling of returns
by dividend portfolios. To find out, one could use an active or passive
approach to portfolio construction. I will be considering a passive
approach because in its methodology of construction is transparent and
systematic. This means a lot of the human error such as bias component
dissipates therefore I can get a true/ organic reflection of dividend
signalling to returns.

# Dividend Growth and High Yield Portfloios

Passive equity investment offers transparent, investable and a
rules-based approach, avoiding the need to identify mispriced securities
commonly associated with active portfolio construction. To construct an
index or portfolio, there are two main approaches to consider: passive
factor strategies and market-cap weighted indexing. Both strategies aim
to replicate the activity of the desired asset class while minimizing
unsystematic risk. Factor-based strategies seek to improve the risk and
return characteristics of the market-cap weighted index. They achieve
this through selective exposure or factor tilts, focusing on factors
like growth, value, size, yield, momentum, quality, and volatility.
Within factor-based strategies, there are different methods to achieve
desired returns being return, risk and diversification strategies.
First, return-oriented strategies can focus on dividend yield which can
be captured by growth and/or absolute value, while risk-oriented
strategies may employ volatility weighting or minimum variance
investing. Diversification strategies can use equally weighted indexes
or maximum diversification techniques. This leads to a natural
conclusion of using a return-oriented approach in studying the
predictive power of dividends to returns.

## Dividend As Proxy For Value

Dividends are a capital budgeting decision and indirectly implies that
investors could infer about management quality overtime by studying
dividend yield. Management quality here refers to cash flow management
and management skill in identifying and monetizing investment
opportunities. Therefore, considering the dividend yield equation below
and assuming that the dividend payout ratio (DPR) is constant we notice
that dividend yield (DY) becomes a function of the earnings yield
(EPS/Price). Figure 1, shows the 12 month net trailing dividend yield of
Standard Bank relative to the log of the price since 2010. It shows the
clear and expected negative correlation between DY and price over time
(during a period where the dividend per share payment increased at best
uniformly and moderately. Since value investing is concerned with
identifying stocks that are priced below their market value, studies
that confirm the existence of dividend signalling predicting power of
returns validate that the existence of a value signal and dividends can
be used as a proxy. This conclusion is important for establishing the
portfolio construction.

*D**Y* = *E**P**S*/*P**r**i**c**e* \* *D**P**R*

# When Dividends Matter

Studying whether dividend payments as a signal can have informative
return predictive value we consider excess banchmark returns of several
gloablly traded dividend investment portfolios. Taking note of the
criteria required for selected appropriate benchmarks and indices, we
also note that all of the studied indexes are considered gross total
return and are in the same currency benchmark in the same currency:

-   Standard and Poor’s Dividend Aristocrats indexes: these indexes
    measure the performance of companies that have a history of
    consistently increasing dividends on an equal weighted basis; years
    of required dividend growth varies across countries.

-   MSCI High Dividend Yield indexes: the MSCI high dividend yield
    indexes are designed to measure the performanceof companies with
    high dividend yields. The indexes exclude companies that do not
    exhibit dividend sustainability, persistence and quality.
    Constituents are first screened for deteriorating fundamentals, thus
    attempting to explicitly avoid associated ‘yield traps’.
    Constituents are then weighted by size.

-   FTSE Dividend Plus indexes (UK and SA only): the constituents of the
    Divi Plus indexes are chosen based on the one-year dividend per
    share forecast and are sourced from a third party data provider
    (INET in South Africa). Constituent weights are determined by
    forward dividend yields. The UK index comprises of 50 constituents
    whereas the SA index comprises of 30 constituents.

The Dividend Aristocrats indexes are thus constructed using DPSG
strategies, whereas both the MSCI and FTSE indexes use measures of
yield. Figure 3 shows the cumulative monthly excess returns of the
selected indexes relative to the universe benchmark from which
constituents are chosen. The indexes start on the date of inception,
therefore cumulative excess returns for the period are not comparable
across all indexes for the respective plot durations. Details of the
benchmarks as well as the dividend index start dates can be found in
Table 7 below. For the South African Dividend Aristocrats index, the
benchmark is replaced with the JSE All Share Index as Bloomberg’s
pricing data of the actual benchmark (S&P SA Composite Index) only
begins in 2014.

# Cumulative Returns

The cumulative monthly excess returns of each of these indexes relative
to their respective benchmarks can be seen below.

``` r
# # Date wrangling
# df_1 <- Date_wragler(Dividend_portfolios)
# 
# # get tidy monthly returns
# 
# df_2 <- Tidy_Monthly_returns(df_1)
# 
# # get cum returns 
# 
# df_3 <- cumulative_returns(df_2) %>% ungroup()
# 
# df_3 <- df_3 %>% filter(MonthYear > "Dec19")
```

``` r
#  graphing 

# df_3 %>%
#   ggplot() +
#   geom_smooth(aes(MonthYear,Cumulative_Return, group = Index , color = Index )) +
#   facet_wrap(~ Index, scales = "free_y") +
#   xlab("MonthYear") +
#   ylab("Cumulative Return") +
#   ggtitle("Cumulative Returns by Index")+
#   theme(legend.position = "none")
```

The figure above is not entirely suggestive of a clear and consistent
outperformance or underperformance of dividend strategies over the
entire considered period, whether using DY or DPSG, globally.
