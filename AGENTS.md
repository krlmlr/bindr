# AI Agent Development Guidelines for bindr

> **Note**: For GitHub Copilot-specific instructions, see [`.github/copilot-instructions.md`](.github/copilot-instructions.md).

## Project Overview

bindr is an R package that provides a simple interface for creating parametrized active bindings.
Active bindings in R are similar to properties in other languages - they look like variables but trigger function calls when queried or set.
This package extends R's `makeActiveBinding()` to support functions that receive the binding name and additional arguments.

## Key Technologies

- **Language**: R
- **Testing**: testthat framework
- **Documentation**: roxygen2 with Markdown syntax
- **Build System**: R CMD, devtools
- **CI/CD**: GitHub Actions

## Development Setup

### Installation and Dependencies

```r
# Install all dependencies
pak::pak()
```

### Install and run R

- When run on GitHub Actions, assume that R, the package in its current state and all dependencies are installed.
- Only install new packages when needed for implementing new features or tests.
- Run `R -q -e 'devtools::check()'` to execute all checks as a final step.

### Building and Testing

- Load package for development: `pkgload::load_all()`
- Run tests: `devtools::test()` or `testthat::test_local()`
- Build package: `devtools::build()`
- Check package: `devtools::check()`
- Update `.Rd` documentation: `devtools::document()`

## Code Style and Documentation

### PR and Commit Style

- PR titles and commit messages should be clear and descriptive
- Reference issue numbers when applicable
- Keep commits focused on single logical changes

### Comment Style

- Prefer expressive code over comments where possible
- Add comments to utility functions that cannot be made immediately obvious
- Focus comments on explaining the "why" and "how", the "what" should be clear from the code itself

### R Code Conventions

- Follow standard R package conventions
- Use `snake_case` for functions and arguments
- Maintain consistent indentation (2 spaces)
- Use meaningful variable names that reflect context
- Keep functions focused and well-documented

### Documentation

- Use roxygen2 with Markdown syntax for all function documentation
- Document all exported functions completely
- Document all arguments and return values
- Include examples in function documentation
- Keep each sentence on its own line in roxygen2 comments for better readability
- Always run `devtools::document()` after updating documentation

### New functions

All new exported functions must include:

- Examples
- Tests
- Proper documentation, including arguments and return values
- roxygen2 `@export` tag

## File Structure and Organization

### Core Files

- `R/populate.R`: Core functions `create_env()` and `populate_env()`
- `R/utils.R`: Utility functions
- `R/bindr-package.R`: Package documentation

### Test Files

- Test files should align with source files
- `R/populate.R` → `tests/testthat/test-populate.R`
- `R/create.R` functionality → `tests/testthat/test-create.R`

## Testing

- Add test cases for all new functionality
- Test file naming should mirror source file naming
- Run tests frequently during development: `devtools::test()`
- Run `devtools::check()` as a final step to ensure all checks pass

## Important Constraints

- **All bindings are read-only**: Attempting to assign values to active bindings throws an error with message "Binding is read-only."
- **No overwrites**: Existing variables or bindings are never overwritten. The package throws an error if a collision is detected.
- **Encoding**: Character vectors for names are mangled to native encoding if needed, with a warning
- **Environment evaluation**: Functions are evaluated in a specified environment (`.envir` parameter)
- **Backward compatibility**: Maintain backward compatibility for this stable package
