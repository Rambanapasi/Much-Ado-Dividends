monthly_excess_return <- function(df, Index, BM, impute = "Drawn_Distribution_Collective" ){
  source("code/impute.R")
  fact_df <- df %>% rename(index = Index, bm = BM, date = Date) %>%
    gather(vars, px, -date) %>% 
    filter( vars %in% c("index", "bm")) %>% 
    arrange(date) %>% spread(vars, px)  %>% 
    mutate_at(vars(-date), ~log(.)-lag(log(.)))  %>%
    impute_missing_returns(., "Drawn_Distribution_Collective") %>%
    mutate(exret = index - bm, YM = format(date, "%Y %b")) %>%
    group_by(YM) %>% 
    filter(date == last(date)) %>% 
    ungroup() %>% 
    select(-YM, -index, -bm) %>% rename(!!glue("{Index}_exs") := exret)
   }