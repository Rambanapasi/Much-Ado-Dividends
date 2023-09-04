Moments_comp <- function(funds, BM, Yrs_LookBack, NA_Check){
  
  funds_considered <- 
    funds %>% filter(Date >= fmxdat::safe_year_min(datesel = last(Date), N = Yrs_LookBack))
  
  Funds_Cons <- 
    funds_considered %>% 
    group_by(Tickers) %>% 
    summarise(N_noNA = sum(!is.na(Ret)) / length(unique(funds_considered$Date)) ) %>% 
    filter(N_noNA > NA_Check) %>% pull(Tickers)
  
  Fundxts <- 
    funds_considered %>% filter(Tickers %in% Funds_Cons) %>% 
    tbl2xts::tbl_xts(cols_to_xts = Ret, spread_by = Tickers, Colnames_Exact = T)
  
  BMxts <- 
    funds_considered %>% filter(Tickers %in% BM) %>% 
    tbl_xts(cols_to_xts = Ret, Colnames_Exact = T) 
  
  library(PerformanceAnalytics)
  
  Moms <- 
    bind_rows(
      data.frame(Return.cumulative(Fundxts) ) %>% round(., 3),
      data.frame(Return.annualized(Fundxts, scale = 12, geometric = T)) %>% round(., 3),
      data.frame(PerformanceAnalytics::Return.annualized.excess(Fundxts, BMxts) ) %>% round(., 3),
      data.frame(sd.annualized(Fundxts, scale = 12, geometric = T)) %>% round(., 3),
      
      data.frame(PerformanceAnalytics::AdjustedSharpeRatio( Fundxts ) ) %>% round(., 3),
      data.frame(AverageDrawdown(Fundxts, scale = 12)) %>% round(., 3),
    ) %>% 
    
    tibble::rownames_to_column("Info") %>%
    mutate(Period = glue::glue("Last {Yrs_LookBack} Years"), Info = c("Cum Returns", "Returns (Ann.)", "Returns Excess (Ann.)", "SD (Ann.)", "Adj. Sharpe Ratio", 
                                                                      "Avg DD")) %>% 
    relocate(Period, .before = Info) %>% as_tibble() 
  
  # This line replaces the `.` with a space.
  # Note the forward slashes, as `.` there means everything, `\\.` means a full-stop
  colnames(Moms) <- gsub("\\.", " ", colnames(Moms))
  
  Moms
}


