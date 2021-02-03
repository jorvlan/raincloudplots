#' Repeated measures data structure
#'
#' This function transforms your data array('s) into the data structure that is needed to visualize a 1x1 repeated measure.
#'
#' @name data_1x1
#' @param array_1 <numeric> the array of datapoints to be plotted
#' @param array_2 <numeric> the array of datapoints to be plotted
#' @param jit_distance <numeric> the amount of distance between jittered datapoints (0 by default)
#' @param jit_seed <numeric> the amount used in set.seed() (321 by default)
#' @return data_1x1
#'
#' @examples
#' \dontrun{
#' # Using an example dataset
#' data_1x1 <- data_1x1(
#'                     array_1 = Sepal.Length[1:50],
#'                     array_2 = Sepal.Length[51:100],
#'                     jit_distance = .09,
#'                     jit_seed = 321)
#'
#'}
#'@export
data_1x1 <- function(array_1, array_2, jit_distance = .09, jit_seed = 321) {

  # check arguments
  if (!is.numeric(array_1) & !is.numeric(array_2))
    stop("Input an array of integers as your data")

  if (!is.numeric(jit_distance))
    stop("Input an integer value for the amount of jitter")

  if(!is.numeric(jit_seed))
    stop("Input an integer value for the set.seed() function")

  #if (length(array_1) > length(array_2)) {
   # n <- length(array_1)
  #}  else if (length(array_1) == length(array_2)) {
  #  n <- length(array_1)
  #}  else {
  #  n <- length(array_2)
  #}

  n <- max(length(array_1), length(array_2))
  length(array_1) <- n
  length(array_2) <- n


  if (jit_distance > .2)
    stop("The maximum amount of jitter is 0.2, please specify a lower amount.")

  # set seed generator
  set.seed(jit_seed)

  # create dataframe
  #df_y_axis_1x1 <- c(array_1, array_2)
  data_1x1 <- data.frame(y_axis = c(array_1, array_2),
                         x_axis = rep(c(1,2), each=n),
                         id = factor(rep(1:n,2)))

  data_1x1$jit <- jitter(data_1x1$x_axis, amount = jit_distance)

  #remove potential NA's
  if (any(is.na(data_1x1)))
    data_1x1 <- stats::na.omit(data_1x1)

  # return dataframe
  return(data_1x1)


}
