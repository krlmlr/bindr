<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# bindr 0.1.3 (2025-12-01)

## fledge

- Bump version to 0.1.2.9002 (#14).

- Bump version to 0.1.2.9001 (#13).

- Bump version to 0.1.2.9000 (#12).

## Chore

- Set up Copilot instructions following rigraph pattern (#55, #56).

- Migrate from defunct `with_mock()` to `with_mocked_bindings()` (#45, #54).

- Auto-update from GitHub Actions (#46).

## Continuous integration

- Install binaries from r-universe for dev workflow (#52).

- Fix reviewdog and add commenting workflow (#50).

- Use workflows for fledge (#49).

- Sync (#48).

- Use reviewdog for external PRs (#47).

- Cleanup and fix macOS (#44).

- Format with air, check detritus, better handling of `extra-packages` (#43).

- Enhance permissions for workflow (#42).

- Permissions, better tests for missing suggests, lints (#41).

- Only fail covr builds if token is given (#40).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#39).

- Correct installation of xml2 (#38).

- Explain (#37).

- Add xml2 for covr, print testthat results (#36).

- Sync (#35).

- Avoid failure in fledge workflow if no changes (#32).

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#30).

- Use larger retry count for lock-threads workflow (#28).

- Ignore errors when removing pkg-config on macOS (#23).

- Explicit permissions (#21).

- Use styler from main branch (#19).

- Need to install R on Ubuntu 24.04 (#17).

- Fix macOS (#16).

- Use Ubuntu 24.04 and styler PR (#15).

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
