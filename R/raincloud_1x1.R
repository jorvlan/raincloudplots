#' 1 x 1 comparison
#'
#'
#' This function visualizes a 1x1 repeated measures raincloud.
#' @name raincloud_1x1
#' @param data_1x1 <data.frame> the array of datapoints to be plotted
#' @param colors <string> concatenated string for both colors
#' @param fills <string> concatenated string both both fills
#' @param size <numeric> data size
#' @param alpha <numeric> data alpha
#' @param ort <string> vertical or horizontal display of plot
#' @importFrom ggplot2 ggplot aes geom_point geom_line position_nudge layer
#' @importFrom gghalves geom_half_boxplot geom_half_violin
#' @importFrom magrittr %>%
#' @importFrom dplyr filter group_by mutate
#'
#'
#' @examples
#' \dontrun{
#' # Using an example dataset
#'raincloud_1x1 <- function(data_1x1,
#'                          colors = (c('dodgerblue','darkorange')),
#'                          fills = (c('dodgerblue', 'darkorange')),
#'                          size = 1.5,
#'                          alpha = .6,
#'                          ort = 'v')
#'
#'}
#'@export

globalVariables(c("ggplot",  "geom_point", "geom_line",
                  "geom_half_boxplot", "geom_half_violin",
                  "position_nudge", "%>%", "position", "coord_flip", "geom_flat_violin",
                  "x_axis", "y_axis", "jit"))

raincloud_1x1 <- function(data_1x1,
                          colors = (c('dodgerblue','darkorange')),
                          fills = (c('dodgerblue','darkorange')),
                          size = 1.5,
                          alpha = .6,
                          ort = 'v') {

  if (ort == 'v') {
    figure_1x1_vertical <- ggplot(data = data_1x1) +

      #Add geom_() objects
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], alpha = alpha, show.legend = FALSE, position = position_nudge(x = .2),
                 size = size) +
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[2], alpha = alpha, show.legend = FALSE, position = position_nudge(x = .2),
                 size = size) +

      geom_half_violin(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), fill = fills[1], color = colors[1], position = position_nudge(x = .35),
        side = "r", alpha = alpha, show.legend = FALSE) +

      geom_half_violin(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), fill = fills[2], color = colors[2], position = position_nudge(x = .35),
        side = "r", alpha = alpha, show.legend = FALSE) +

      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), fill = fills[1], color = colors[1], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha, show.legend = FALSE) +

      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), fill = fills[2], color = colors[2], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha, show.legend = FALSE)

    return(figure_1x1_vertical)

  } else if (ort == 'h') {

    figure_1x1_horizontal <- ggplot(data = data_1x1) +

      #Add geom_() objects
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis=="1"), aes(x = jit, y = y_axis), color = colors[1], alpha = alpha, show.legend = FALSE, position = position_nudge(x = .2),
                 size = size) +
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis=="2"), aes(x = jit, y = y_axis), color = colors[2], alpha = alpha, show.legend = FALSE, position = position_nudge(x = .2),
                 size = size) +

      geom_flat_violin(data = data_1x1 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), fill = fills[1], color = colors[1],
                       position = position_nudge(x = .35), alpha = alpha, show.legend = FALSE) +
      geom_flat_violin(data = data_1x1 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), fill = fills[2], color = colors[2],
                       position = position_nudge(x = .35), alpha = alpha, show.legend = FALSE) +
      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), fill = fills[1], color = colors[1], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha, show.legend = FALSE) +

      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), fill = fills[2], color = colors[2], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha, show.legend = FALSE) +

      coord_flip()

    return(figure_1x1_horizontal)

  }
}

