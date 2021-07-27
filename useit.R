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

framboiseGradiant <- c("#FFDFD6", "#FDCCC7", "#FFA7A3", "#FE8E8D", "#F76566", "#E75059", "#E1414D", "#D12030", "#D0222C", "#C00E28", "#8B131C", "#591E1A", "#461916", "#3A1816", "#1B1B1B")

myrtilleGradiant <- c("#E1E2E6", "#D7DADF", "#CAD0DC", "#BFC7DA", "#A7B8D6", "#8CA8D0", "#6F96CF", "#6388CF", "#3E6DC9", "#0355C5", "#0243BB", "#033EBC", "#003E9D", "#153D78", "#1C1C1C")