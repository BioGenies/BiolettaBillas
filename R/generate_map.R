#' Package returns The Map
#' @return The Map
#'
#' @details It's fantastic!
#'
#' @importFrom ggplot2 ggplot aes geom_polygon geom_point coord_fixed theme_void map_data
#' @importFrom dplyr filter `%>%`
#' @importFrom ggrepel geom_label_repel
#'
#' @export
generate_map <- function() {
  ggplot(data.frame(
    x = c(21.8770607, 18.9477382, 19.0073881, 15.4991446, 17.0083946, 17.0083946,
          18.3233971, 15.9403997, 19.81778, 23.0860264),
    y = c(51.4912658, 50.9120858, 49.9113361, 51.9589444, 51.0761667, 51.0761667,
          54.5037439, 54.0103299, 49.394039, 53.1276047),
    lab = c("Gołąb", "Kłobuck", "Czechowice-Dziedzice", "Zielona Góra",
            "Wrocław Północny", "Wrocław Południowy", "Gdynia", "Białogard",
            "Koniówka", "Białystok")
  ), aes(x = x, y = y)) +
    geom_polygon(data = map_data("world") %>%
                   filter(region == "Poland"),
                 mapping = aes(x = long, y = lat),
                 fill = "pink", colour = "violet") +
    geom_point(color = "red") +
    geom_label_repel(aes(label = lab)) +
    coord_fixed(ratio = 1.4) +
    theme_void()
}
