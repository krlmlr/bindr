#' Create or populate an environment with parametrized active bindings
#'
#' Leverages [makeActiveBinding()][base::bindenv]
#' by allowing parametrized functions
#' that take the name of the binding and an arbitrary number of additional arguments.
#'
#' @param names A [name], or a list of names, or a character vector; in the latter case
#'   the names are mangled if they are not representable in the native encoding
#' @param fun A [function] with at least one argument, which will be called
#'   to compute the value of a binding.  The function will be called with the
#'   binding name as first argument (unnamed), and `...` as additional arguments
#' @param ... Additional arguments to `fun`
#' @param .envir The [environment] in which `fun` will be executed,
#'   important if `fun` calls other functions that are not globally visible
#' @param .enclos The enclosing environment (`parent.env`) for the newly created environment
#' @export
#'
#' @examples
#' env <- create_env(letters, paste0, "-lowercase")
#' env$a
#' env$c
#' env$Z
#' populate_env(env, LETTERS, paste0, "-uppercase")
#' env$a
#' env$Z
create_env <- function(names, fun, ..., .envir = parent.frame(), .enclos = parent.frame()) {
  env <- new.env(parent = .enclos, size = length(names))
  populate_env(env = env, names = names, fun = fun, ..., .envir = .envir)
  env
}

#' @param env An [environment]
#' @rdname create_env
#' @export
populate_env <- function(env, names, fun, ..., .envir = parent.frame()) {
  names <- check_names(names)

  existing <- vapply(names, function(x) !is.null(env[[as.character(x)]]), logical(1L))
  if (any(existing)) {
    stop("Not creating bindings for existing variables: ", paste(names[existing], collapse = ", "))
  }

  make_active_binding_fun <- make_make_active_binding_fun(.envir)

  lapply(names, function(name) {
    makeActiveBinding(name, make_active_binding_fun(name, fun, ...), env)
  })

  invisible(env)
}

check_names <- function(names) {
  if (is.character(names)) {
    enc_names <- to_symbol_encoding(names)
    diff <- names != enc_names
    if (any(diff)) {
      warning("Mangling the following names: ",
              paste0(names[diff], " -> ", enc_names[diff], collapse = ", "),
              ". Use enc2native() to avoid the warning.", call. = FALSE)
    }
    lapply(enc_names, as.name)
  } else if (all(vapply(names, is.name, logical(1L)))) {
    names
  } else {
    stop("Expecting a list of names or a character vector", call. = FALSE)
  }
}

to_symbol_encoding <- function(x) enc2native(x)

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
