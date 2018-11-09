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

  lh <- function(txt, parameter, pattern){
    if(!missing(parameter)){
      i <- grep(pattern,txt)
      if(!any(i)){
        print(paste("   ",pattern,"   ","does not exist"))
        break()
      }
      txt[i] <- paste(as.character(parameter),"\t",pattern)
    }
    return(txt)
  }

  readLines(infile) %>% 
    lh(txt, fbar,'# FishingMortality') %>% 
    lh(txt, hr,'# HarvestRate') %>% 
    lh(txt, w.rho,'# WeightCorr') %>% 
    lh(txt, w.cv,'# WeightCV') %>% 
    lh(txt, rec.rho,'# RecrCorr') %>% 
    lh(txt, ass.cv,"# AssessmentCV") %>% 
    lh(txt, ass.rho,"# AssessmentCorr") %>% 
    lh(txt, ass.bias,"# AssessmentBias") %>% 
    lh(txt, Btrigger,"# Btrigger") %>% 
    lh(txt, MaxChange,"# MaxChange") %>% 
    lh(txt, mW.years,"# Meanwtyears") %>% 
    lh(txt, LastYearsTacRatio,"# LastYearsTacRatio") %>% 
    write.table(file = outfile,
                row.names = F, col.names = F, quote = F)

}