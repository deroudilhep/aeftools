packages <- c("tidyverse", "readr", "readxl", "lubridate", "devtools", "janitor")
lapply(packages, library, character.only = T)
make_names <- function(names) {
  names <- names %>%
    str_trim() %>%
    tolower() %>%
    str_replace_all(" ", "_") %>%
    str_replace_all("[àâä]", "a") %>%
    str_replace_all("[éèêë]", "e") %>%
    str_replace_all("[ïî]", "i") %>%
    str_replace_all("[ôö]", "o") %>%
    str_replace_all("[ùûü]", "u") %>%
    str_replace_all("[ÿ]", "y") %>%
    str_replace_all("[ç]", "c")
  return(names)
}