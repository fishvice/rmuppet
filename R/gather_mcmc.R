gather_mcmc <- function(dir_path) {

  if(missing(dir_path)) dir_path <- "./"

  files <- dir(path = dir_path, pattern = ".mcmc", full.names = TRUE)
  # strip .mcmc here, gets added again in read_mcmc!
  files <- str_replace(files, ".mcmc", "")
  cn <- basename(files)
  cn <- str_replace(cn, "assessmenterror", "assCV")
  cn <- str_replace(cn, "n1st", "rec")
  cn <- str_replace(cn, "refbio1", "bio")
  cn <- str_replace(cn, "f", "fbar")

  d <- map(files, read_mcmc)
  names(d) <- cn

  d <-
    d %>%
    bind_rows(.id = "variable") %>%
    spread(variable, value)


  return(d)

}
