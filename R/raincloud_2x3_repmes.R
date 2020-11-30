#' 2 x 3 repeated measures raincloud
#'
#' This function visualizes a 2x3 repeated measures raincloud.
#' @name raincloud_2x3_repmes
#' @param data_2x2 <data.frame> the array of datapoints to be plotted
#' @param colors <string> concatenated string of the colors
#' @param fills <string> concatenated string of the fills
#' @param size <numeric> data size
#' @param alpha <numeric> data alpha
#' @importFrom ggplot2 aes geom_point geom_line
#' @importFrom gghalves geom_half_boxplot geom_half_violin
#' @importFrom magrittr %>%
#' @importFrom dplyr filter group_by mutate
#'
#'
#' @examples
#' \dontrun{
#' # Using an example dataset
#' raincloud_2x3_repmes <- function(data_2x2,
#'                                  colors = (c('dodgerblue, 'darkorange', 'dodgerblue',
#'                                  'darkorange', 'dodgerblue', 'darkorange')),
#'                                  fills = (c('dodgerblue', 'darkorange', dodgerblue',
#'                                  'darkorange', 'dodgerblue', 'darkorange')),
#'                                  size = 1.5,
#'                                  alpha = .6,
#'                                  ort = 'v')
#'}
#'@export

globalVariables(c("ggplot", "aes", "geom_point", "geom_line",
                  "geom_half_boxplot", "geom_half_violin",
                  "position_nudge", "%>%", "position"))

raincloud_2x3_repmes <- function(data_2x2,
                                 colors = (c('dodgerblue', 'darkorange', 'dodgerblue',
                                             'darkorange', 'dodgerblue', 'darkorange')),
                                 fills = (c('dodgerblue', 'darkorange', 'dodgerblue',
                                            'darkorange', 'dodgerblue', 'darkorange')),
                                 size = 1.5,
                                 alpha = .6,
                                 ort = 'v') {
  if (ort == 'v') {
    figure_2x3 <- ggplot(data = data_2x2) +

      #Add geom_() objects
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], fill = fills[1], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1.01"), aes(x = jit, y = y_axis), color = colors[2], fill = fills[2], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[3], fill = fills[3], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2.01"), aes(x = jit, y = y_axis), color = colors[4], fill = fills[4], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="3"), aes(x = jit, y = y_axis), color = colors[5], fill = fills[5], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="3.01"), aes(x = jit, y = y_axis), color = colors[6], fill = fills[6], size = size,
                 alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1.01"), aes(x=x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2.01"), aes(x=x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="3"), aes(x=x_axis, y = y_axis), color = colors[5], fill = fills[5], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="3.01"), aes(x=x_axis, y = y_axis), color = colors[6], fill = fills[6], position = position_nudge(x = .3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +


      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1.01"),aes(x = x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2.01"),aes(x = x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="3"),aes(x = x_axis, y = y_axis), color = colors[5], fill = fills[5], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="3.01"),aes(x = x_axis, y = y_axis), color = colors[6], fill = fills[6], position = position_nudge(x = .45),
        side = "r", alpha = alpha)

  } else if (ort == 'h') {

    figure_2x3 <- ggplot(data = data_2x2) +

      #Add geom_() objects
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1"), aes(x = jit, y = y_axis), color = colors[1], fill = fills[1], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="1.01"), aes(x = jit, y = y_axis), color = colors[2], fill = fills[2], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2"), aes(x = jit, y = y_axis), color = colors[3], fill = fills[3], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="2.01"), aes(x = jit, y = y_axis), color = colors[4], fill = fills[4], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="3"), aes(x = jit, y = y_axis), color = colors[5], fill = fills[5], size = size,
                 alpha = alpha) +
      geom_point(data = data_2x2 %>% dplyr::filter(x_axis =="3.01"), aes(x = jit, y = y_axis), color = colors[6], fill = fills[6], size = size,
                 alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"), aes(x=x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="1.01"), aes(x=x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"), aes(x=x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="2.01"), aes(x=x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="3"), aes(x=x_axis, y = y_axis), color = colors[5], fill = fills[5], position = position_nudge(x = .2),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +

      geom_half_boxplot(
        data = data_2x2 %>% dplyr::filter(x_axis=="3.01"), aes(x=x_axis, y = y_axis), color = colors[6], fill = fills[6], position = position_nudge(x = .3),
        side = "r",outlier.shape = NA, center = TRUE, errorbar.draw = FALSE, width = .2, alpha = alpha) +


      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1"),aes(x = x_axis, y = y_axis), color = colors[1], fill = fills[1], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="1.01"),aes(x = x_axis, y = y_axis), color = colors[2], fill = fills[2], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2"),aes(x = x_axis, y = y_axis), color = colors[3], fill = fills[3], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="2.01"),aes(x = x_axis, y = y_axis), color = colors[4], fill = fills[4], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="3"),aes(x = x_axis, y = y_axis), color = colors[5], fill = fills[5], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      geom_half_violin(
        data = data_2x2 %>% dplyr::filter(x_axis=="3.01"),aes(x = x_axis, y = y_axis), color = colors[6], fill = fills[6], position = position_nudge(x = .45),
        side = "r", alpha = alpha) +

      coord_flip()

  }

  return(figure_2x3)
}
