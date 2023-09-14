Information_Ratio_Roll <- function (raw_df , index_name, benchmark_name, start_date, roll_period){
  print(" This function gives monthly returns, that are geometrically chained")
  if (!"Date" %in% colnames(df)) message("Change name to Date in the original df")
  
  returndf <- raw_df %>% gather(index, px, -Date) %>% 
    filter(index %in% c(index_name, benchmark_name)) %>%
    mutate(YM = format(Date, "%b %y")) %>% 
    arrange(Date) %>% 
    filter(Date >= ymd(start_date))%>% 
    group_by(YM, index) %>% 
    filter(Date == last(Date)) %>% 
    group_by(index) %>% 
    mutate(ret = px / lag(px) - 1) %>%
    mutate(ret = coalesce(ret, 0)) %>% 
    ungroup() %>% 
    tbl_xts(., cols_to_xts = ret, spread_by = index) %>% 
    xts_tbl() %>%
    rename(Index = index_name , Benchmark = benchmark_name) %>% 
    mutate(ret = Index - Benchmark) %>% 
    mutate(Rollret = RcppRoll::roll_prod(1 + ret, roll_period, fill = NA, 
                                         align = "right")^(12/roll_period) - 1) %>% 
    filter(!is.na(Rollret)) %>% select(date, Rollret)
  
  
  sddf <- raw_df %>% gather(index, px, -Date) %>% 
    filter(index %in% c(index_name, benchmark_name)) %>%
    mutate(YM = format(Date, "%b %y")) %>% 
    arrange(Date) %>% 
    filter(Date >= ymd(start_date))%>% 
    group_by(YM, index) %>% 
    filter(Date == last(Date)) %>% 
    group_by(index) %>% 
    mutate(ret = px / lag(px) - 1) %>%
    mutate(ret = coalesce(ret, 0)) %>% 
    ungroup() %>% 
    tbl_xts(., cols_to_xts = ret, spread_by = index) %>% 
    xts_tbl() %>%
    rename(Index = index_name , Benchmark = benchmark_name) %>% 
    mutate(ret = Index - Benchmark) %>% 
    mutate(RollSD = RcppRoll::roll_sd(1+ret , roll_period, fill = NA, align = "right") * 
             sqrt(12) )%>% 
    filter(!is.na(RollSD)) %>% select(date, RollSD)
  
  informatio_ratio <- left_join(returndf, sddf, by = "date") %>% mutate(IR = Rollret/RollSD) %>% 
    select(date, IR) %>%  rename(!!paste0(index_name, "_IR") := "IR")
}


