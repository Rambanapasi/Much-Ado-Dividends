Get_dat <- function( Nam,
                    Port,
                    Which){

    locr <- glue("J433_J406/Divi/{Nam}/{Port}") %>% list.files(., full.names = T)
    locr_bm <- glue("J433_J406/Capped_SWIX") %>% list.files(., full.names = T)
    
    source("code/EOM.R")

    Which <- match.arg(Which)
    if(Which == "Holds_") dfl <- locr[grepl("Holds_", locr)] %>% read_rds(.) %>% rename(Name = `Asset Name`) %>% select(date, Tickers, Name, Weight) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "Holds_BM") dfl <- locr_bm[grepl("Holdings.rds", locr_bm)] %>% read_rds(.) %>% select(date, Tickers, Name, BM_Weight = Weight, Sector ) %>% mutate(Sector = gsub("N/A", NA, Sector)) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "Factors_BM") dfl <- locr_bm[grepl("Holdings.rds", locr_bm)] %>% read_rds(.) %>% select(date, Tickers, Name, ESG, DY, ends_with(" Exp")  ) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "TO") dfl <- locr[grepl("BTDetails", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)

    if(Which == "Ret") dfl <- locr[grepl("Returns.rds", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "Ret_BM") dfl <- locr[grepl("Returns_BM.rds", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "Ret_Uni") dfl <- locr[grepl("Returns_Uni", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "ARC") dfl <- locr[grepl("ARC_Port", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "ARC_BM") dfl <- locr[grepl("ARC_BM", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)
    if(Which == "ARC_Uni") dfl <- locr[grepl("ARC_Uni", locr)] %>% read_rds(.) %>% Make_calendar_EOM() %>% arrange(date)
    dfl
}


