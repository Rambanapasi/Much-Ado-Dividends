Get_dat <-my_function <- function(link_1, link_2, Port,  Which) {
  locr <- list.files(glue("{Loc}/{Port}"), pattern = "\\.rds$", full.names = TRUE)
  locr_bm <- list.files(link_2, pattern = "\\.rds$", full.names = TRUE)
    if(Which == "Holds") dfl <- locr[grepl("Holds_", locr)] %>% read_rds(.) %>% rename(Name = `Asset Name`) %>% select(date, Tickers, Name, Weight) %>% Make_calendar_EOM(.) %>%arrange(date) %>% select(-YM)
    if(Which == "Holds_BM") dfl <- locr_bm[grepl("Holdings.rds", locr_bm)] %>% read_rds(.) %>% select(date, Tickers, Name, BM_Weight = Weight, Sector ) %>% mutate(Sector = gsub("N/A", NA, Sector))  %>% Make_calendar_EOM(.)%>% arrange(date) %>% select(-YM)
    if(Which == "Factors_BM") dfl <- locr_bm[grepl("Holdings.rds", locr_bm)] %>% read_rds(.) %>% select(date, Tickers, Name, ESG, DY, ends_with(" Exp")  )  %>% Make_calendar_EOM(.)%>% arrange(date) %>% select(-YM)
    if(Which == "TO") dfl <- locr[grepl("BTDetails", locr)] %>% read_rds(.) %>% Make_calendar_EOM(.)  %>% arrange(date) %>% select(-YM)

    if(Which == "Returns") dfl <- locr[grepl("Returns.rds", locr)] %>% read_rds(.) %>% Make_calendar_EOM(.)  %>% arrange(date) %>% select(-YM)
    if(Which == "Returns_BM") dfl <- locr[grepl("Returns_BM.rds", locr)] %>% read_rds(.) %>% Make_calendar_EOM(.)  %>% arrange(date) %>% select(-YM)
    if(Which == "Returns_Uni") dfl <- locr[grepl("Returns_Uni", locr)] %>% read_rds(.) %>%  Make_calendar_EOM(.) %>% arrange(date) %>% select(-YM)
    if(Which == "ARC") dfl <- locr[grepl("ARC_Port", locr)] %>% read_rds(.)  %>%  Make_calendar_EOM(.) %>%  arrange(date) %>% select(-YM)
    if(Which == "ARC_BM") dfl <- locr[grepl("ARC_BM", locr)] %>% read_rds(.)  %>%  Make_calendar_EOM(.) %>% arrange(date) %>% select(-YM)
    if(Which == "ARC_Uni") dfl <- locr[grepl("ARC_Uni", locr)] %>% read_rds(.)  %>%  Make_calendar_EOM(.) %>% arrange(date) %>% select(-YM)
    
  dfl
}
