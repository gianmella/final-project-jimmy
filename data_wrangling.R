# data wrangling

# load packages

library(tidyverse)
library(janitor)
library(skimr)

# Import Data

bball_data <- read_csv("data/unprocessed/Bball_data.txt") %>%
  clean_names()

skim_without_charts(bball_data)

# Deleting Columns I don't need
bball_data <-
  bball_data %>%
  select(-c(rk, ws_10, season, mp_16, x9999, age))

# Renaming Certain Columns/turning decimals into percentages
bball_data1 <- rename(bball_data, `win_shares` = `ws_3`, `mins` = `mp_4`, `games_played` = `g`, `games_started` = `gs`, `2p` = `x2p`, `2pa` = `x2pa`, `3p` = `x3p`, `3pa` = `x3pa`, `fouls` = `pf`, `2p_percent` = `x2p_percent`, `3p_percent` = `x3p_percent`, `efg_percent` = `e_fg_percent`, `position` = `pos`) %>%
mutate(
  `fg_percent` = `fg_percent` * 100,
  `2p_percent` = `2p_percent` * 100,
  `3p_percent` = `3p_percent` * 100,
  `ft_percent` = `ft_percent` * 100,
  `ts_percent` = `ts_percent` * 100,
  `efg_percent` = `efg_percent` * 100
  )

# saving cleaned data
save(bball_data1, file = "data/processed/bball_data1.rda")

