library(readr)
library(tidyverse)

data <- read_delim("viz-tableau4.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

parts <- data %>%
  mutate("Filles parmi les admis" = `Dont nombre d'admises`*100/Admis,
         "Filles parmi les candidats" = `Dont nombre de candidates`*100/Candidats)

pivot <- parts %>%
  rename("admis_tous" = Admis, 
         "candidats_tous" = Candidats, 
         "admis_filles" = `Dont nombre d'admises`, 
         "candidats_filles" = `Dont nombre de candidates`,
         "admis_part" = `Filles parmi les admis`,
         "candidats_part" = `Filles parmi les candidats`) %>% 
  pivot_longer(cols = c(admis_tous, candidats_tous, admis_filles, candidats_filles, admis_part, candidats_part), 
               names_to = c("Type", ".value"), 
               names_pattern = "(.+)_(.+)")

write_delim(rename(pivot, "Tous" = tous, "Filles" = filles, "% des filles" = part), delim = ";", "viz-tableau-5-delim.csv")
