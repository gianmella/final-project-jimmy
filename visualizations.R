# visualizations

library(tidyverse)

load(file = "data/processed/bball_data1.rda")

# first plot

quartile_rank <- function(x = 0:99) {
  # Set quartile
  quart_breaks <- c(
    -Inf,
    quantile(x,
             probs = c(.25, .5, .75),
             na.rm = TRUE
    ),
    Inf
  )
  cut(x = x, breaks = quart_breaks, labels = FALSE)
}

jimmy_circle_adv <- bball_data1 %>%
  mutate(
    per_quant = quartile_rank(per),
    vorp_quant = quartile_rank(vorp),
    bpm_quant = quartile_rank(bpm),
    o_rtg_quant = quartile_rank(o_rtg),
    d_rtg_quant = quartile_rank(d_rtg)
  ) %>%
  select(player, contains("_quant")) %>%
  pivot_longer(
    cols = -player,
    names_to = "variable",
    values_to = "value"
  ) %>%
  arrange(player)
  


  