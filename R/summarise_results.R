#' Title
#'
#' @param d A dataframe, normally that returned by gather_results
#' @param n A value, indicating the number of "last years" used in the summarisation
#'
#' @return A tibble
#' @export
summarise_results <- function(d, n = 5) {
  d %>%
    filter(year %in% c(max(year):(max(year) - n))) %>%
    summarise(catchmean = mean(catch),
              catch10 = quantile(catch, 0.10),
              catch05=quantile(catch,   0.05),
              catchmed=median(catch),
              ssbmean=mean(ssb),
              ssb10=quantile(ssb, 0.10),
              ssb05=quantile(ssb, 0.05),
              meanrec=mean(rec),
              rec05=quantile(rec, 0.05),
              meanF=mean(refF)) %>%
    return()
}