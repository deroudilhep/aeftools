packages <- c("tidyverse", "readr", "readxl", "sf", "cowplot", "RColorBrewer", "lubridate", "data.table", "datapasta", "devtools", "forcats", "geofacet", "gghighlight", "janitor", "hexbin", "rmapshaper", "scales", "svglite", "extrafont", "slider", "units", "udunits2")

extrafont::loadfonts()

`%!in%` = function(x,y) !(x %in% y)

lapply(packages, library, character.only = TRUE)

communes <- function() {
  communes <- sf::st_read("~/JOURNALISME/APPEL_CARTES_R/ADMIN-EXPRESS/1_DONNEES_LIVRAISON_2021-03-29/ADE_2-5_SHP_LAMB93_FR/COMMUNE.shp")
}

deps <- function() {
  deps <- sf::st_read("~/JOURNALISME/APPEL_CARTES_R/ADMIN-EXPRESS/1_DONNEES_LIVRAISON_2021-03-29/ADE_2-5_SHP_LAMB93_FR/DEPARTEMENT.shp")
}

paris <- function() {
  paris <- sf::st_read("https://raw.githubusercontent.com/deroudilhep/data/main/arrondissements-paris.geojson")
}

jpegPlease <- function(x,y,z,titre) {
  jpeg(filename = paste0(titre,".jpg"), width = y, height = z, quality = 100, units  = "px",type = "cairo")
  plot(x)
  dev.off()
}

svgPlease <- function(x,y,z,titre) {
  svglite::svglite(file = paste0(titre,".svg"),width = y,height = z,bg = "white",standalone = T)
  plot(x)
  dev.off()
}