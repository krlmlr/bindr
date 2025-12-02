<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# bindr 0.1.3.9000 (2025-12-02)

## fledge

- CRAN release v0.1.3 (#58).


# bindr 0.1.3 (2025-12-01)

## Chore

- Migrate from defunct `with_mock()` to `with_mocked_bindings()` (#45, #54).


# bindr 0.1.2 (2024-11-21)

## Feature

- The call stack for a failure in an active binding now contains a reference to `bindr_fun()` instead of `fun()`, to hint at what might have went wrong.


# bindr 0.1.1 (2018-03-13)

- Improve performance for very large environments for `create_env()` and `populate_env()`.

- Force the `fun` argument just to be sure.


# bindr 0.1 (2016-11-12)

Initial release.

- Functions `create_env()` and `populate_env()`.
    - Create or populate an environment with one or more active bindings, where the value is computed by calling a function and passing the name of the binding, and an arbitrary number of additional arguments (named or unnamed).
    - Not overwriting existing bindings or variables.
    - Names can be passed as symbols (`name`) or character strings (`character`), with warning if the conversion fails.
