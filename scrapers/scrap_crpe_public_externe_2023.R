setwd() # set working directory
library(RSelenium) # nécessite java installé, voir https://www.youtube.com/watch?v=GnpJujF9dBw
library(rvest)
library(wdman)
library(netstat) # sous Linux, requiert le paquet net-tools
library(tidyverse)

selenium_object <- selenium(retcommand = T, check = F) # à partir des chemins donnés, aller supprimer les fichiers de license chromedriver à chaque fois qu'une nouvelle version est installée
selenium()

### REGLER LES VARIABLES ICI ###
browser <- "chrome" # moteur de recherche ("chrome", "firefox", "phantomjs", ...)
installed_chromever <- "113" # à vérifier à l'adresse chrome://version
url <- read_csv("academie_list_links_2023.csv") # liste d'URL vers les pages de résultats aux concours
### FIN DE REGLER LES VARIABLES ICI ###

# définit automatiquement la version du chromedriver la plus récente correspondant à la version vérifiée du navigateur Chrome installé
if (browser == "chrome") {
  for (i in 1:length(binman::list_versions("chromedriver")[[1]])) {
    if (binman::list_versions("chromedriver")[[1]][i] %>% str_extract("^\\d{3}") == installed_chromever) {
      chromever <- binman::list_versions("chromedriver")[[1]][i]
    }
  }
} else {
  chromever <- NULL
}

# initialise un client
remote_driver <- rsDriver(browser = browser, chromever = chromever, verbose = F, port = free_port())

# initialise une liste vide
tables_list <- list()

# vérifie les académies marquées comme à ne pas scraper (étoile * à la fin du nom de l'académie) sinon scrap à partir de l'URL donné
for (i in 1:length(url$lien)) {
  if (grepl("\\*$", url$academie[i])) {
    print(paste0(url$academie[i], " était marquée comme à ne pas scraper et ne sera donc pas traitée."))
  } else {
    remote_driver$client$navigate(url$lien[i])
    Sys.sleep(2) # sleep pour laisser la page charger (résultats d'un filtre ?)
    crpe_public_externe_link <- remote_driver$client$findElement(using = "link text", "CRPE Public Externe")
    crpe_public_externe_link$clickElement()
    Sys.sleep(3) # sleep pour laisser la page charger (tableau des résultats)
    table <- remote_driver$client$getPageSource()[[1]] %>%
      read_html() %>%
      html_table()
    table[[1]] <- table[[1]] %>%
      mutate("Académie" = url$academie[i]) # ajouter le nom de l'académie aux résultats scrapés
    tables_list <- append(tables_list, table)
  }
}

### TOUJOURS FERMER LE SERVEUR ###
remote_driver$server$stop()
### FIN DE TOUJOURS FERMER LE SERVEUR ###

crpe_public_externe <- bind_rows(tables_list) # assemble tous les tableaux scrapés

write_delim(crpe_public_externe, "crpe_public_externe_2023.csv", delim = ";")
