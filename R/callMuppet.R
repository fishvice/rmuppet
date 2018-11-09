#' callMuppet
#'
#' @param ... commandline arguments to the Muppet program
#'
#' @return
#' @export
callMuppet <- function(...){
  
  args <- c(...)
  
  if('run_dir' %in% names(args)){
    old.dir <- getwd()
    setwd(tmp[['run_dir']])
    tmp[['run_dir']] <- NULL
  }
  
  run.string <- 
    stringr::str_c('muppet ',
                   stringr::str_c(names(args),args) %>% 
                     stringr::str_trim() %>% 
                     stringr::str_c('-',.,collapse = ' '))
  res <- tryCatch(system(run.string,
                         ignore.stdout = TRUE,
                         ignore.stderr = FALSE,
                         intern = TRUE),
                  error=function(e) sprintf(''))
  if(exists('old.dir')){
    setwd(old.dir)
  }
}