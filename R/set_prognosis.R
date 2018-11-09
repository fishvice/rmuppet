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

  txt <- readLines(infile)
  txt <- lh(txt, fbar,'# FishingMortality')
  txt <- lh(txt, hr,'# HarvestRate')
  txt <- lh(txt, w.rho,'# WeightCorr')
  txt <- lh(txt, w.cv,'# WeightCV')
  txt <- lh(txt, rec.rho,'# RecrCorr')
  txt <- lh(txt, ass.cv,"# AssessmentCV")
  txt <- lh(txt, ass.rho,"# AssessmentCorr")
  txt <- lh(txt, ass.bias,"# AssessmentBias")
  txt <- lh(txt, Btrigger,"# Btrigger")
  txt <- lh(txt, MaxChange,"# MaxChange")
  txt <- lh(txt, mW.years,"# Meanwtyears")
  txt <- lh(txt, LastYearsTacRatio,"# LastYearsTacRatio")

  write.table(txt, file = outfile,
              row.names = F, col.names = F, quote = F)

}