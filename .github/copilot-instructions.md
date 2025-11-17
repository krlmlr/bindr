# Copilot Instructions for bindr

## Repository Overview

The `bindr` package provides a simple interface for creating parametrized active bindings in R. Active bindings in R are similar to properties in other languages - they look like variables but trigger function calls when queried or set. This package extends R's `makeActiveBinding()` to support functions that receive the binding name and additional arguments.

## Technology Stack

- **Language**: R
- **Package Type**: R package
- **Testing Framework**: testthat
- **Documentation**: roxygen2 for function documentation, pkgdown for website
- **CI/CD**: GitHub Actions with R-CMD-check workflows

## Repository Structure

```
bindr/
├── R/                      # R source code
│   ├── bindr-package.R    # Package documentation
│   ├── populate.R         # Core functions: create_env(), populate_env()
│   └── utils.R            # Utility functions
├── tests/testthat/        # Test files
├── man/                   # Generated documentation
├── .github/workflows/     # CI/CD workflows
└── DESCRIPTION            # Package metadata
```

## Key Components

### Core Functions

- `create_env()`: Creates a new environment with parametrized active bindings
- `populate_env()`: Adds active bindings to an existing environment
- Active bindings are read-only and call a user-provided function with the binding name and additional arguments

### Important Patterns

- All bindings are read-only (attempting to assign values throws an error)
- Existing variables/bindings are never overwritten (throws error if collision detected)
- Character vectors for names are mangled to native encoding if needed
- Functions are evaluated in a specified environment (`.envir` parameter)

## Building and Testing

### Running Tests

```r
# Install dependencies
install.packages("testthat")

# Run tests
devtools::test()
# or
testthat::test_dir("tests/testthat")
```

### R CMD Check

```r
devtools::check()
```

### Building Documentation

```r
# Rebuild documentation
devtools::document()

# Build pkgdown site
pkgdown::build_site()
```

## Code Style

- Follow standard R package conventions
- Use roxygen2 comments for documentation
- Keep functions focused and well-documented
- Include examples in function documentation
- Test edge cases (name collisions, read-only enforcement, etc.)

## Development Workflow

1. Make changes to R source files in `R/`
2. Update documentation with roxygen2 comments
3. Add or update tests in `tests/testthat/`
4. Run `devtools::document()` to update man pages
5. Run `devtools::test()` to ensure tests pass
6. Run `devtools::check()` before submitting changes

## Important Constraints

- Bindings must always be read-only
- Never overwrite existing variables or bindings
- Maintain backward compatibility for this stable package
- All exported functions must have complete documentation
- Changes should include appropriate tests

## Common Tasks

### Adding a New Function

1. Add function to appropriate R file in `R/`
2. Include roxygen2 documentation with `@export` if public
3. Add examples to documentation
4. Create tests in `tests/testthat/`
5. Run `devtools::document()` and `devtools::test()`

### Fixing a Bug

1. Add a failing test that reproduces the bug
2. Fix the bug in the source code
3. Ensure the test now passes
4. Verify no other tests are broken
5. Update documentation if behavior changes
