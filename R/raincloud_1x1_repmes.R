#' 1 x 1 repeated measures raincloud
#'
#' This function visualizes a 1x1 repeated measures raincloud.
#' @name raincloud_1x1_repmes
#' @param data_1x1 <data.frame> the array of datapoints to be plotted
#' @param colors <string> concatenated string for both colors
#' @param fills <string> concatenated string for both fills
#' @param line_color <string> color of the lines
#' @param line_alpha <numeric> alpha of the lines
#' @param size <numeric> data size
#' @param alpha <numeric> data alpha
#' @param align_clouds <bool> FALSE if spreaded, TRUE if aligned
#' @importFrom ggplot2 aes geom_point geom_line
#' @importFrom gghalves geom_half_boxplot geom_half_violin
#' @importFrom magrittr %>%
#' @importFrom dplyr filter
#'
#'
#' @examples
#' \dontrun{
#' # Using an example dataset
#' raincloud_1x1_repmes <- function(data_1x1,
#'                                  colors = (c('dodgerblue','darkorange')),
#'                                  fills = (c('dodgerblue', 'darkorange')),
#'                                  line_color = 'gray',
#'                                  line_alpha = .3,
#'                                  size = 1.5,
#'                                  alpha = .6,
#'                                  align_clouds = FALSE)
#'
#'}
#'@export

globalVariables(c("ggplot", "aes", "geom_point", "geom_line",
                  "geom_half_boxplot", "geom_half_violin",
                  "position_nudge", "%>%", "position", "id"))

raincloud_1x1_repmes <- function(data_1x1,
                                 colors = (c('dodgerblue', 'darkorange')),
                                 fills = (c('dodgerblue', 'darkorange')),
                                 line_color = 'gray',
                                 line_alpha = .3,
                                 size = 1.5,
                                 alpha = .6,
                                 align_clouds = FALSE) {


  if (align_clouds == FALSE) {
    figure_1x1 <- ggplot(data = data_1x1) +

      #Add geom_() objects
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], size = size,
                 alpha = alpha, show.legend = FALSE) +
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[2], size = size,
                 alpha = alpha, show.legend = FALSE) +
      geom_line(aes(x = jit, y = y_axis, group = id), color = line_color, alpha = line_alpha, show.legend = FALSE) +


      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = -.3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha, show.legend = FALSE) +

      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha, show.legend = FALSE) +

      geom_half_violin(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = -.35),
        side = "l", alpha = alpha, show.legend = FALSE) +

      geom_half_violin(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .35),
        side = "r", alpha = alpha, show.legend = FALSE)

  } else if (align_clouds == TRUE) {
    figure_1x1 <- ggplot(data = data_1x1) +

      #Add geom_() objects
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], fill = fills[1], size = size,
                 alpha = alpha, show.legend = FALSE) +
      geom_point(data = data_1x1 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[2], fill = fills[2], size = size,
                 alpha = alpha, show.legend = FALSE) +
      geom_line(aes(x = jit, y = y_axis, group = id), color = line_color, alpha = line_alpha, show.legend = FALSE) +

      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = 1.3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2,
        alpha = alpha, show.legend = FALSE) +

      geom_half_boxplot(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2,
        alpha = alpha, show.legend = FALSE) +

      geom_half_violin(
        data = data_1x1 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = 1.43),
        side = "r", alpha = alpha, show.legend = FALSE) +

      geom_half_violin(
        data = data_1x1 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .43),
        side = "r", alpha = alpha, show.legend = FALSE)

  }

  return(figure_1x1)

}
