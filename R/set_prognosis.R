#' set_prognosis
#'
#' @param infile
#' @param outfile
#' @param fbar
#' @param hr
#' @param w.rho
#' @param w.cv
#' @param rec.rho
#' @param ass.cv
#' @param ass.rho
#' @param ass.bias
#' @param Btrigger
#' @param MaxChange
#' @param mW.years
#' @param LastYearsTacRatio
#'
#' @export
set_prognosis <- function(infile,
                          outfile,
                          fbar,
                          hr,
                          w.rho,
                          w.cv,
                          rec.rho,
                          ass.cv,
                          ass.rho,
                          ass.bias,
                          Btrigger,
                          MaxChange,
                          mW.years,
                          LastYearsTacRatio) {



  readLines(infile) %>% 
    line_replace(txt, fbar,'# FishingMortality') %>% 
    line_replace(txt, hr,'# HarvestRate') %>% 
    line_replace(txt, w.rho,'# WeightCorr') %>% 
    line_replace(txt, w.cv,'# WeightCV') %>% 
    line_replace(txt, rec.rho,'# RecrCorr') %>% 
    line_replace(txt, ass.cv,"# AssessmentCV") %>% 
    line_replace(txt, ass.rho,"# AssessmentCorr") %>% 
    line_replace(txt, ass.bias,"# AssessmentBias") %>% 
    line_replace(txt, Btrigger,"# Btrigger") %>% 
    line_replace(txt, MaxChange,"# MaxChange") %>% 
    line_replace(txt, mW.years,"# Meanwtyears") %>% 
    line_replace(txt, LastYearsTacRatio,"# LastYearsTacRatio") %>% 
    write.table(file = outfile,
                row.names = F, col.names = F, quote = F)

}
 

line_replace <- function(txt, parameter, pattern){
  if(!missing(parameter)){
    i <- grep(pattern,txt)
    #if(!any(i)){
    #  print(paste("   ",pattern,"   ","does not exist"))
    #  break()
    #}
    txt[i] <- paste(as.character(parameter),"\t",pattern)
  }
  return(txt)
}