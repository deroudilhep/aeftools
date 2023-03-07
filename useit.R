# Packages
if(!require(pacman)) install.packages("pacman")
pacman::p_load("tidyverse", "devtools", "janitor", "jsonlite", "devtools", "roxygen2", "testthat")

# French News Agency AEF info Color Palette
main <- c("#e4032d", "#000000")
secondary <- c("#59536d", "#5e6169", "#908e95", "#b0b4b6", "#f3f3f4")
recommend <- c("#e4032d", "#fe7f2d", "#fcca46", "#579c87", "#0e3d59", "#59536d")
gradients <- list(
    red = c("#ff9d92", "#ff7e78", "#ff5e5e", "#ff3c45", "#e4032d"),
    orange = c("#f3d54d", "#f1ab20", "#f18520", "#db5625", "#a62120"),
    green = c("#75b98d", "#579c87", "#387d69", "#155f4c", "#004232"),
    blue = c("#b3d8fb", "#89aed0", "#6186a6", "#3a607f", "#0e3d59"),
    violet = c("#dfd7f5", "#bbb4d2", "#9992af", "#78728d", "#59536d")
)
divergent <- c("#e4032d", "#ff6261", "#87aee1", "#154975")
big_palette <- c("#e4032d", "#ff5e5e", "#ff9d92", "#bf777f", "#794d52", "#492228", "#a93900", "#fe7f2d", "#fcca46", "#9cb557", "#579c87", "#0b7879", "#0e3d59", "#6186a6", "#a8cdf0", "#59536d", "#9174a2", "#ff88b3", "#ab3b69", "#650030")

# Functions
# Export Any Graph Under Three Formats
export_graph <- function(graph) {
    library(ggplot2)
    ggsave(file = paste(deparse(substitute(graph)), ".svg", sep = ""), plot = graph, width = 10, height = 8)
    ggsave(file = paste(deparse(substitute(graph)), ".png", sep = ""), plot = graph, width = 10, height = 8)
    ggsave(file = paste(deparse(substitute(graph)), ".jpg", sep = ""), plot = graph, width = 10, height = 8)
}