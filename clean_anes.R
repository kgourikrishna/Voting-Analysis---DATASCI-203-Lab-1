library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
library(readr)

anes <- read_csv('~/lab-1-kushal_annie_mike_wello/anes_timeseries_2020_csv_20220210.csv')

anes <- anes %>% 
  mutate(
    party = case_when(
      V201231x == 1 ~ 'D', 
      V201231x == 2 ~ 'D', 
      V201231x == 3  ~ 'D',
      V201231x == 4 ~ 'I', 
      V201231x == 5 ~ 'R', 
      V201231x == 6  ~ 'R',
      V201231x == 7  ~ 'R'),
    had_difficulty = case_when(
      (V202120a == 0 & V202120b == 0 & V202120c == 0 & V202120d == 0 
       & V202120e == 0 & V202120f == 0 & V202120g == 0 & 
         V202120h == 0 & V202120i == 0 & V202120j == 0 & 
         V202120k == 1) ~ 'No',
      (V202120a == 1 | V202120b == 1 | V202120c == 1 | V202120d == 1 
       |V202120e == 1 |V202120f == 1 | V202120g == 1 | 
        V202120h == 1 | V202120i == 1 | V202120j == 1) ~ 'Yes')
    )

write_csv(anes, file = '~/lab-1-kushal_annie_mike_wello/anes_clean_2020.csv')
anes_new <- read_csv('~/lab-1-kushal_annie_mike_wello/anes_clean_2020.csv')
