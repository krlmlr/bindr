create_env <- function(names, fun, ..., .envir = parent.frame(), .enclos = parent.frame()) {
  env <- new.env(parent = .enclos, size = length(names))
  populate_env(env = env, names = names, fun = fun, ..., .envir = .envir)
  env
}

populate_env <- function(env, names, fun, ..., .envir = parent.frame()) {
  if (!all(vapply(names, is.name, logical(1L)))) {
    stop("Expecting a list of names", call. = FALSE)
  }

  make_active_binding_fun <- make_make_active_binding_fun(.envir)

  lapply(names, function(name) {
    makeActiveBinding(name, make_active_binding_fun(name, fun, ...), env)
  })

  invisible(env)
}

make_make_active_binding_fun <- function(.envir) {
  make_active_binding_fun <- function(name, fun, ...) {
    force(name)
    list(...)
    function(value) {
      if (!missing(value)) {
        stop("Binding is read-only.", call. = FALSE)
      }
      fun(name, ...)
    }
  }

  environment(make_active_binding_fun) <- .envir
  make_active_binding_fun
}
