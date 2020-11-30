#' 2 x 2 repeated measures raincloud
#'
#' This function visualizes a 2x2 repeated measures raincloud.
#' @name raincloud_2x2_repmes
#' @param data_2x2 <data.frame> the array of datapoints to be plotted
#' @param colors <string> concatenated string for both colors
#' @param fills <string> concatenated string for both fills
#' @param line_color <string> color lines
#' @param line_alpha <numeric> alpha lines
#' @param size <numeric> data size
#' @param alpha <numeric> data alpha
#' @param spread_x_ticks <bool> TRUE if 4 x ticks, FALSE if 2 x ticks
#' @importFrom ggplot2 aes geom_point geom_line
#' @importFrom gghalves geom_half_boxplot geom_half_violin
#' @importFrom magrittr %>%
#' @importFrom dplyr filter
#'
#'
#' @examples
#' \dontrun{
#' # Using an example dataset
#' raincloud_2x2_repmes <- function(data_2x2,
#'                                 colors = (c('dodgerblue', 'darkorange',
#'                                 'dodgerblue', 'darkorange')),
#'                                 fills = (c('dodgerblue', 'darkorange',
#'                                 'dodgerblue', 'darkorange')),
#'                                 line_color = 'gray',
#'                                 line_alpha = .3,
#'                                 size = 1.5,
#'                                 alpha = .6,
#'                                 spread_x_ticks = TRUE)
#'
#'}
#'@export

globalVariables(c("ggplot", "aes", "geom_point", "geom_line",
                  "geom_half_boxplot", "geom_half_violin",
                  "position_nudge", "%>%", "position", "id"))

raincloud_2x2_repmes <- function(data_2x2,
                                 colors = (c('dodgerblue', 'darkorange', 'dodgerblue', 'darkorange')),
                                 fills = (c('dodgerblue', 'darkorange', 'dodgerblue', 'darkorange')),
                                 line_color = 'gray',
                                 line_alpha = .3,
                                 size = 1.5,
                                 alpha = .6,
                                 spread_x_ticks = TRUE) {

  if (spread_x_ticks == TRUE) {
    figure_2x2 <- ggplot(data = data_2x2) +

      #Add geom_() objects
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], fill = fills[1], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[2], fill = fills[2], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="3"), aes(x = jit, y = y_axis), color = colors[3], fill = fills[3], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="4"), aes(x = jit, y = y_axis), color = colors[4], fill = fills[4], size = size,
                 alpha = alpha) +

      #geom_line(aes(x=jit, y = y_axis, group=id), color = 'lightgray') +
      geom_line(data = data_2x2 %>% dplyr::filter(x_axis %in% c("1", "2")), aes(x = jit, y = y_axis, group = id), color = line_color, alpha = alpha) +
      geom_line(data = data_2x2 %>% dplyr::filter(x_axis %in% c("3", "4")), aes(x = jit, y = y_axis, group = id), color = line_color, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = -.37),
        side = "l",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = -1.23),
        side = "l",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="3"), aes(x=x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = 1.23),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="4"), aes(x=x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .37),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = -.5),
        side = "l", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = -1.5),
        side = "l", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="3"),aes(x = x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = 1.5),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="4"),aes(x = x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .5),
        side = "r", alpha = alpha)


  } else if (spread_x_ticks == FALSE) {
    figure_2x2 <- ggplot(data = data_2x2) +

      #Add geom_() objects
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], fill = fills[1], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1.01"), aes(x = jit, y = y_axis), color = colors[2], fill = fills[2], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[3], fill = fills[3], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2.01"), aes(x = jit, y = y_axis), color = colors[4], fill = fills[4], size = size,
                 alpha = alpha) +

      geom_line(data = data_2x2 %>% dplyr::filter(x_axis %in% c("1", "2")), aes(x = jit, y = y_axis, group = id), color = colors[1], alpha = alpha) +
      geom_line(data = data_2x2 %>% dplyr::filter(x_axis %in% c("1.01", "2.01")), aes(x = jit, y = y_axis, group = id), color = colors[2], alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = -.35),
        side = "l",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1.01"), aes(x=x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = -.23),
        side = "l",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = .20),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2.01"), aes(x=x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .32),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = -.5),
        side = "l", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1.01"),aes(x = x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = -.51),
        side = "l", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = .5),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2.01"),aes(x = x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .49),
        side = "r", alpha = alpha)
  }

  return(figure_2x2)


}
