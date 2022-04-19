library(readr)
library(tidyverse)

data <- read_delim("data-viz-tableau-no-pivot.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE) %>%
  select(-candidats_part, -admis_part)

parts <- data %>%
  mutate(candidats_part = candidats_filles*100/candidats_tous,
         admis_part = admis_filles*100/admis_tous)

pivot <- parts %>%
  pivot_longer(cols = c(admis_tous, candidats_tous, admis_filles, candidats_filles, admis_part, candidats_part), 
               names_to = c("Type", ".value"), 
               names_pattern = "(.+)_(.+)")

write_delim(rename(pivot, "Tous" = tous, "Filles" = filles, "% des filles" = part), delim = ";", "viz-tableau1.csv")
