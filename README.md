
<!-- README.md is generated from README.Rmd. Please edit that file -->
bindr [![Travis-CI Build Status](https://travis-ci.org/krlmlr/bindr.svg?branch=master)](https://travis-ci.org/krlmlr/bindr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/krlmlr/bindr?branch=master&svg=true)](https://ci.appveyor.com/project/krlmlr/bindr) [![Coverage Status](https://img.shields.io/codecov/c/github/krlmlr/bindr/master.svg)](https://codecov.io/github/krlmlr/bindr?branch=master)
========================================================================================================================================================================================================================================================================================================================================================================================================================================

Active bindings can be created in R via [`makeActiveBinding()`](https://www.rdocumentation.org/packages/base/versions/3.3.1/topics/bindenv), but the function used to compute the value of a binding cannot take additional arguments. This package faciliates the creation of active bindings that are linked to a function that receives the binding name, and an arbitrary number of additional arguments.

Installation
------------

You can install `bindr` from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("krlmlr/bindr")
```

Example
-------

In this example, we create an environment that contains bindings for all lowercase letters; this bindings evaluate to the letter with `"-lowercase"` appended.

``` r
library(bindr)
env <- create_env(letters, paste0, "-lowercase")
env$a
#> [1] "a-lowercase"
env$c
#> [1] "c-lowercase"
env$Z
#> NULL
```

Bindings can also be added to existing environments:

``` r
populate_env(env, LETTERS, paste0, "-uppercase")
env$a
#> [1] "a-lowercase"
env$Z
#> [1] "Z-uppercase"
```

A parent environment can be specified for creation:

``` r
env2 <- create_env("a", identity, .enclos = env)
env$a
#> [1] "a-lowercase"
env$b
#> [1] "b-lowercase"
```

The bindings by default have access to the calling environment:

``` r
create_local_env <- function(names) {
  binder <- function(name, append) paste(name, append, sep = "-")
  create_env(names, binder, append = "appending")
}

env3 <- create_local_env("a")
env3$a
#> [1] "a-appending"
```

All bindings are read-only:

``` r
env3$a <- NA
#> Error: Binding is read-only.
env3$a <- NULL
#> Error: Binding is read-only.
```

Because active bindings must be R functions, a native C++ interface is not very useful. Instead, use an exported Rcpp function, possibly with `rng = false` if performance matters. The following C++ module exports a function `change_case(to_upper = FALSE)`, which is bound against in R code later.

``` cpp
#include <Rcpp.h>

#include <algorithm>
#include <string>

using namespace Rcpp;

// [[Rcpp::export(rng = FALSE)]]
SEXP change_case(Symbol name, bool to_upper = false) {
  std::string name_string = name.c_str();
  std::transform(name_string.begin(), name_string.end(),
                 name_string.begin(), to_upper ? ::toupper : ::tolower);
  return CharacterVector(name_string);
}
```

Binding from R:

``` r
env <- create_env(as.name("__ToLower__"), change_case)
populate_env(env, as.name("__tOuPPER__"), change_case, TRUE)
ls(env)
#> [1] "__ToLower__" "__tOuPPER__"
env$`__ToLower__`
#> [1] "__tolower__"
get("__tOuPPER__", env)
#> [1] "__TOUPPER__"
```
