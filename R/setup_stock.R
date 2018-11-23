setup_stock <- function(name = "0Base") {

  oldwd <- getwd()

  # Setup directories with files
  system(paste0("cp -rp ", system.file("Plaice/Files", package = "rmuppet"), " ."))
  system("mkdir z_admb-model")

  system(paste0("cp -rp ", system.file("Model", package = "rmuppet"), "/muppet.tpl z_admb-model/."))
  system(paste0("cp -rp ", system.file("Model", package = "rmuppet"), "/muppet z_admb-model/."))

  system(paste0("cp -rp ", system.file("Plaice/HockeyEstAcf", package = "rmuppet"), " ", name))

  # Compile the admb program
  #compiling using system("admb muppet") does not work
  #system("cd z_admb-model")
  #system("admb muppet")
  #system("rm muppet.cpp")
  #system("rm muppet.htp")
  #system("rm muppet.obj")
  #system("cd ..")

  # Copy program into base
  system(paste0("cp -p z_admb-model/muppet ", name, "/", "."))

  # Copy the biorule into folder
  system(paste0("cp -p Files/plaiceprognosis.dat.biorule ", name, "/plaiceprognosis.dat"))

}