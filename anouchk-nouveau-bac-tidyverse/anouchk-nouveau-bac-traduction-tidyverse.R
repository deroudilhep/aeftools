library(tidyverse)

data1 <- read_delim("fr-esr-parcoursup-enseignements-de-specialite-bacheliers-generaux.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE) %>% 
  rename("doublette" = "Enseignements de spécialité", "formation" = "Formation", "candidats" = "Nombre de candidats bacheliers ayant confirmé au moins un vœu", "recus" = "Nombre de candidats bacheliers ayant reçu au moins une proposition d'admission", "admis" = "Nombre de candidats bacheliers ayant accepté une proposition d'admission")
view(data1) 

total_admis <- data1 %>%
  group_by(formation) %>%
  summarise(candidats = sum(candidats), recus = sum(recus), admis = sum(admis))

top5 <- data1 %>%
  group_by(formation) %>%
  arrange(formation, desc(admis)) %>%
  slice_head(n = 5)