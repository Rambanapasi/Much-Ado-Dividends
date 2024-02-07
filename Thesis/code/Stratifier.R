stratifier <- function(raw_df, index_name, Date_vector, Description) {

  Mk_df <- raw_df %>%
    filter(Date %in% Date_vector) %>%
    group_by(index) %>%
    mutate(Return = cumprod(1 + Excess)) %>%
    summarize(Name = !!glue("{index_name}"), "Market Period" = Description, Days = n(), "Annualized Return (%)" = mean(last(Return) ^ (12/Days) - 1)*100)

  Mk_df
}

