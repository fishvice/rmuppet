calc_percentiles <- function(d) {
  d %>%
    summarise(q05=quantile(value, 0.05),
              q10=quantile(value, 0.10),
              q25=quantile(value, 0.25),
              q50=quantile(value, 0.50),
              q75=quantile(value, 0.75),
              q90=quantile(value, 0.90),
              q95=quantile(value, 0.95),
              m=mean(value))
}
