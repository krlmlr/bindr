create_env <- function(names, fun, ..., .envir = parent.frame(), .enclos = parent.frame()) {
  env <- new.env(parent = .enclos, size = length(names))
  populate_env(env = env, names = names, fun = fun, ..., .envir = .envir)
  env
}

populate_env <- function(env, names, fun, ..., .envir = parent.frame()) {
  if (!all(vapply(names, is.name, logical(1L)))) {
    stop("Expecting a list of names", call. = FALSE)
  }

  lapply(names, function(name) {
    makeActiveBinding(name, new_active_binding_fun(name, fun, ..., .envir = .envir), env)
  })

  invisible(env)
}

new_active_binding_fun <- function(name, fun, ..., .envir) {
  force(name)
  list(...)
  binding_fun <- function(value) {
    if (!missing(value)) {
      stop("Binding is read-only.", call. = FALSE)
    }
    fun(name, ...)
  }
  environment(binding_fun) <- envir
  binding_fun
}
