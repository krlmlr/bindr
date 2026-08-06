<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# bindr 0.1.3.9013 (2026-08-06)

## Continuous integration

- Add sharded `revdep2` workflow.

## Uncategorized

- Ci: Harden `workflow_run` workflows against untrusted pull requests (#106).

- Ci: Pin third-party actions to commits and let Renovate keep them pinned (#105).


# bindr 0.1.3.9012 (2026-08-05)

## Chore

- Auto-update from GitHub Actions (#81).

## Continuous integration

- Remove unused pr-commands workflow.

## Uncategorized

- Ci: Give every workflow and job an explicit `permissions` block (#103).

- Ci: Pass workflow context through the environment, not into script text (#102).

- Ci: Add a Windows arm64 (`windows-11-arm`) check on R-release (#99).


# bindr 0.1.3.9011 (2026-07-28)

- Ci: Run all smoke-test checks even when one fails (#97).

- Ci: Apply matrix `env` vars in the workflow, not in custom actions (#95).

- Ci: Link the responsible workflow run in snapshot update PRs (#96).


# bindr 0.1.3.9010 (2026-07-25)

## Continuous integration

- Lock down `format-suggest` egress (audit → block).


# bindr 0.1.3.9009 (2026-07-24)

## Bug fixes

### ci

- Emit empty package matrix when there are no (rev)deps.

## Uncategorized

- Ci: Harden `format-suggest` against `pull_request_target` pwn requests (#93).


# bindr 0.1.3.9008 (2026-07-22)

## Continuous integration

- Run on Ubuntu 26.04.

- Align workflows with template.


# bindr 0.1.3.9007 (2026-05-24)

## Continuous integration

- Update ccache-action reference.

- Bump action version.


# bindr 0.1.3.9006 (2026-05-16)

- Ci: Unify fledge.yaml across cynkratemplate and fledge (#86).


# bindr 0.1.3.9005 (2026-05-14)

## Chore

- Add ccache to `.gitignore` and `.Rbuildignore`.

## Continuous integration

- Create snapshot update PR against correct branch.

- Add reference to `/apply-patch` workflow in commit message.

- Clarify rationale for not deploying on schedule.

- Only run fledge on pushes to main.

- Tweak fledge workflow and ccache action.


# bindr 0.1.3.9004 (2026-05-06)

## Continuous integration

- Cosmetics.

- Bump action versions.

- Install clang-format-21.

- Align fledge workflow.

- Harmonize.


# bindr 0.1.3.9003 (2026-05-04)

## Chore

- Auto-update from GitHub Actions (#66).


# bindr 0.1.3.9002 (2026-03-08)

## Chore

- Auto-update from GitHub Actions (#64).


# bindr 0.1.3.9001 (2026-01-14)

## Continuous integration

- Fix comment (#62).

- Tweaks (#61).

- Test all R versions on branches that start with cran- (#60).


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
