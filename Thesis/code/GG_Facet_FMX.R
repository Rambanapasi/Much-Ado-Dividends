gg_extension_facet <- function(data, x_axis, y_axis, identifier){  
   data %>%   ggplot() + 
    geom_line(aes(x =x_axis , y = y_axis, color = "steelblue"), size = 1.1, alpha = 0.8) + 
    facet_wrap(~identifier) + 
    labs(x = "", y = "Information Ratio", title = "Performance Consistency", subtitle = "", caption = "Source: Bloomberg and authors own calculations ") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))+ theme(
      panel.background = element_rect(fill = "white", color = "black", size = 0.5),
      plot.background = element_rect(fill = "white", color = "black", size = 0.5),
      panel.grid.major = element_line(color = "gray", size = 0.2),
      panel.grid.minor = element_line(color = "gray", size = 0.0))}