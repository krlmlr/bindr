pkgname <- "bindr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('bindr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("create_env")
### * create_env

flush(stderr()); flush(stdout())

### Name: create_env
### Title: Create or populate an environment with parametrized active
###   bindings
### Aliases: create_env populate_env

### ** Examples

env <- create_env(letters, paste0, "-lowercase")
env$a
env$c
env$Z
populate_env(env, LETTERS, paste0, "-uppercase")
env$a
env$Z



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
