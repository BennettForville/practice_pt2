# Installing hector from github
remotes::install_github("jgcri/hector")
write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)

library(hector)
ini_file <- system.file("input/hector_rcp45.ini", package = "hector") 

core <- newcore(ini_file)
core 
run(core) 
results <- fetchvars(core, 1745:2300)
head(results) 


library(ggplot2)

ggplot(results) +
  aes(x = year, y = value) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y")+
  geom_vline(xintercept = 2004, color = "blue")


BETA()
beta <- fetchvars(core, NA, BETA())
beta 
setvar(core, NA, BETA(), 0.40, "(unitless)") 
fetchvars(core, NA, BETA()) 
core
reset(core)
run(core)
results_40 <- fetchvars(core, 2000:2300)
head(results_40) 

results[["beta"]] <- 0.36
results_40[["beta"]] <- 0.40
compare_results <- rbind(results, results_40)

ggplot(compare_results) +
  aes(x = year, y = value, color = factor(beta)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  guides(color = guide_legend(title = expression(beta)))
shutdown(core)
