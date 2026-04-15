# metill -- CLAUDE.md

ggplot2 themes and Icelandic number formatting for Metill data products.

## Commands

```r
devtools::load_all()      # Load for interactive testing
devtools::document()      # Regenerate NAMESPACE + man/
devtools::test()          # Run testthat suite
devtools::check()         # R CMD check (must pass: 0 errors, 0 warnings)
```

## Exported functions (10)

### Themes

| Function                  | Purpose                                                                          |
| ------------------------- | -------------------------------------------------------------------------------- |
| `theme_metill(type)`      | Main ggplot2 theme. `type = "standalone"` (default) or `"blog"` (transparent bg) |
| `theme_visbending()`      | Theme for Visbending academic publication                                        |
| `theme_gimaldid()`        | Theme for Gimaldid project (IBM Plex Serif + Roboto)                             |
| `metill_ggplotly(p, ...)` | Convert ggplot2 to plotly with Metill styling                                    |

### Icelandic number formatting

| Function                             | Purpose                                | Example                                    |
| ------------------------------------ | -------------------------------------- | ------------------------------------------ |
| `isk(x, scale, suffix)`              | Format as ISK currency                 | `isk(1500000)` -> `"1.500.000 kr"`         |
| `label_isk(scale, suffix, accuracy)` | ggplot2 scale labeller for ISK         | `scale_y_continuous(labels = label_isk())` |
| `hlutf(x, accuracy)`                 | Format as percentage                   | `hlutf(0.156)` -> `"15,6%"`                |
| `label_hlutf(accuracy)`              | ggplot2 scale labeller for percentages |                                            |
| `tala(x, accuracy)`                  | Format number (Icelandic separators)   | `tala(1234567)` -> `"1.234.567,0"`         |
| `label_tala(accuracy)`               | ggplot2 scale labeller for numbers     |                                            |

Icelandic conventions: `.` for thousands separator, `,` for decimal.

## Architecture

- `R/ggplot.R` -- theme functions (uses `@importFrom ggplot2`)
- `R/scales.R` -- number formatting (wraps `scales::number` / `scales::percent`)
- `R/plotly.R` -- plotly conversion (`@import plotly`)
- `R/zzz.R` -- package load hook
- `tests/testthat/` -- testthat edition 3 tests
- `man/` -- auto-generated roxygen2 docs (do not edit)
- `NAMESPACE` -- auto-generated (do not edit)

## Dependencies

**Depends:** ggplot2, scales
**Imports:** plotly
**Suggests:** testthat (>= 3.0.0)

## Conventions

- Non-ASCII in R code uses `\uxxxx` escapes (R CMD check requirement)
- Roxygen2 comments use ASCII-only text
- All theme functions return ggplot2 `theme` objects
- Scale functions delegate to `scales::` -- do not reimplement formatting logic

## Development status

- Version: 0.0.0.9000
- Tests: 30 passing (scales + themes)
- CI: GitHub Actions R-CMD-check
- GitHub: metill-is/metill

## Cross-project impact

Changes propagate to other projects only after push + `remotes::install_github("metill-is/metill")`. Verify theme changes don't break Sports plots, Website visuals, or Kosningaspa styling.
