#' read_mcmc
#'
#' @param file A character vector, the prefix to the .mcmc file to read
#' @param cn Name of the variable
#'
#' @return a tibble
#' @export
read_mcmc <- function(file, cn = "value") {

  d <-
    suppressMessages(readr::read_delim(paste0(file, ".mcmc"), delim = " "))
  colnames(d) <- stringr::str_sub(colnames(d), stringr::str_locate(colnames(d), "\\.")[,1] + 1)
  d <-
    d %>%
    mutate(iter = 1:n()) %>%
    gather(year, value, -iter, convert = TRUE)
  colnames(d)[3] <- cn

  return(d)

}

