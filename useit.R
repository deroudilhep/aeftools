# packages
packages <- c("tidyverse", "readr", "readxl", "lubridate", "devtools", "janitor", "jsonlite", "svglite", "hrbrthemes", "extrafont", "mdthemes")
lapply(packages, library, character.only = T)

# couleurs AEF
identitaires_principales <- c("#e4032d", "#000000")
secondaires_accompagnement <- c("#59536d", "#5e6169", "#908e95", "#b0b4b6", "#f3f3f4")
palette_recommandee <- c("#e4032d", "#fe7f2d", "#fcca46", "#579c87", "#0e3d59", "#59536d")
degrades <- list(
    rouge = c("#ff9d92", "#ff7e78", "#ff5e5e", "#ff3c45", "#e4032d"),
    orange = c("#f3d54d", "#f1ab20", "#f18520", "#db5625", "#a62120"),
    vert = c("#75b98d", "#579c87", "#387d69", "#155f4c", "#004232"),
    bleu = c("#b3d8fb", "#89aed0", "#6186a6", "#3a607f", "#0e3d59"),
    violet = c("#dfd7f5", "#bbb4d2", "#9992af", "#78728d", "#59536d")
)
divergent <- c("#e4032d", "#ff6261", "#87aee1", "#154975")
mega_palette <- c("#e4032d", "#ff5e5e", "#ff9d92", "#bf777f", "#794d52", "#492228", "#a93900", "#fe7f2d", "#fcca46", "#9cb557", "#579c87", "#0b7879", "#0e3d59", "#6186a6", "#a8cdf0", "#59536d", "#9174a2", "#ff88b3", "#ab3b69", "#650030")

# fonctions
# exporter un graph sous trois formats
export_graph <- function(graph) {
    library(ggplot2)
    ggsave(file = paste(deparse(substitute(graph)), ".svg", sep = ""), plot = graph, width = 10, height = 8)
    ggsave(file = paste(deparse(substitute(graph)), ".png", sep = ""), plot = graph, width = 10, height = 8)
    ggsave(file = paste(deparse(substitute(graph)), ".jpg", sep = ""), plot = graph, width = 10, height = 8)
}