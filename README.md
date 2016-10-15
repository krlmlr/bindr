
<!-- README.md is generated from README.Rmd. Please edit that file -->
bindr [![Travis-CI Build Status](https://travis-ci.org/krlmlr/bindr.svg?branch=master)](https://travis-ci.org/krlmlr/bindr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/krlmlr/bindr?branch=master&svg=true)](https://ci.appveyor.com/project/krlmlr/bindr) [![Coverage Status](https://img.shields.io/codecov/c/github/krlmlr/bindr/master.svg)](https://codecov.io/github/krlmlr/bindr?branch=master)
========================================================================================================================================================================================================================================================================================================================================================================================================================================

Active bindings in R are much like properties in other languages: They look like a variable, but querying or setting the value triggers a function call. They can be created in R via [`makeActiveBinding()`](https://www.rdocumentation.org/packages/base/versions/3.3.1/topics/bindenv), but with this API the function used to compute or change the value of a binding cannot take additional arguments. The `bindr` package faciliates the creation of active bindings that are linked to a function that receives the binding name, and an arbitrary number of additional arguments.

Installation
------------

You can install `bindr` from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("krlmlr/bindr")
```

Example
-------

For illustration, the `append_random()` function is used. This function appends a separator (a dash by default) and a random letter to its input, and talks about it, too.

``` r
set.seed(20161510)
append_random <- function(x, sep = "-") {
  message("Evaluating append_random(sep = ", deparse(sep), ")")
  paste(x, sample(letters, 1), sep = sep)
}

append_random("a")
#> Evaluating append_random(sep = "-")
#> [1] "a-k"
append_random("X", sep = "+")
#> Evaluating append_random(sep = "+")
#> [1] "X+u"
```

In this example, we create an environment that contains bindings for all lowercase letters, which are evaluated with `append_random()`. As a result, a dash and a random letter are appended to the name of the binding:

``` r
library(bindr)
env <- create_env(letters, append_random)
ls(env)
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q"
#> [18] "r" "s" "t" "u" "v" "w" "x" "y" "z"
env$a
#> Evaluating append_random(sep = "-")
#> [1] "a-p"
env$a
#> Evaluating append_random(sep = "-")
#> [1] "a-j"
env$a
#> Evaluating append_random(sep = "-")
#> [1] "a-b"
env$c
#> Evaluating append_random(sep = "-")
#> [1] "c-b"
env$Z
#> NULL
```

Bindings can also be added to existing environments:

``` r
populate_env(env, LETTERS, append_random, "+")
env$a
#> Evaluating append_random(sep = "-")
#> [1] "a-z"
env$Z
#> Evaluating append_random(sep = "+")
#> [1] "Z+j"
```

Both named and unnamed arguments are supported:

``` r
create_env("binding", paste, "value", sep = "-")$binding
#> [1] "binding-value"
```

A parent environment can be specified for creation:

``` r
env2 <- create_env("a", identity, .enclos = env)
env2$a
#> a
env2$b
#> NULL
get("b", env2)
#> Evaluating append_random(sep = "-")
#> [1] "b-m"
```

The bindings by default have access to the calling environment:

``` r
create_local_env <- function(names) {
  paste_with_dash <- function(...) paste(..., sep = "-")
  binder <- function(name, append) paste_with_dash(name, append)
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

Existing variables or bindings are not overwritten:

``` r
env4 <- as.environment(list(a = 5))
populate_env(env4, quote(b), identity)
ls(env4)
#> [1] "a" "b"
populate_env(env4, letters, identity)
#> Error in populate_env(env4, letters, identity): Not creating bindings for existing variables: a, b
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

License
-------

MIT (c) 2016 Kirill Müller.
