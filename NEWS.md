<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# bindr 0.1.2.9011 (2024-12-08)

## Continuous integration

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#30).


# bindr 0.1.2.9010 (2024-12-07)

## Continuous integration

- Use larger retry count for lock-threads workflow (#28).


# bindr 0.1.2.9009 (2024-12-01)

## Continuous integration

- Ignore errors when removing pkg-config on macOS (#23).

- Explicit permissions (#21).

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9008 (2024-11-30)

## Continuous integration

- Ignore errors when removing pkg-config on macOS (#23).

- Explicit permissions (#21).

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9007 (2024-11-29)

## Continuous integration

- Ignore errors when removing pkg-config on macOS (#23).

- Explicit permissions (#21).

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9006 (2024-11-28)

## Continuous integration

- Ignore errors when removing pkg-config on macOS (#23).

- Explicit permissions (#21).

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9005 (2024-11-27)

## Continuous integration

- Explicit permissions (#21).

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9004 (2024-11-26)

## Continuous integration

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9003 (2024-11-25)

## Continuous integration

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

## fledge

- Bump version to 0.1.2.9002 (#14).


# bindr 0.1.2.9002 (2024-11-24)

## fledge

  - Bump version to 0.1.2.9001 (#13).


# bindr 0.1.2.9001 (2024-11-23)

## fledge

  - Bump version to 0.1.2.9000 (#12).


# bindr 0.1.2.9000 (2024-11-22)

## Documentation

  - Dev mode.


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
