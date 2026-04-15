#' Metill ggplot2 theme
#'
#' @param type Theme type: "standalone" (default, with background) or
#'   "blog" (transparent backgrounds for web embedding)
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @importFrom ggplot2 theme_classic %+replace% theme element_text
#'   element_rect element_line element_blank margin
theme_metill <- function(type = "standalone") {
  title <- "#484D6D"
  subtitle <- "#525252"
  caption <- "#36383A"
  axis_text <- "#4A4C45"
  strip_background <- "#e0e0e0"
  background <- "#fdfcfc"
  main_font <- "Lato"
  axis_title_font <- NULL
  axis_line_col <- "#403d39"
  strip_text <- "#2E2E2E"
  base_size <- 14

  out <- theme_classic() %+replace%
    theme(
      text = element_text(family = main_font, size = base_size),
      plot.title = element_text(
        face = "bold", colour = title, size = base_size * 1.4,
        hjust = 0, margin = margin(t = 5, r = 0, b = 5, l = 0)
      ),
      plot.subtitle = element_text(
        colour = subtitle, size = base_size,
        hjust = 0, margin = margin(t = 0, r = 0, b = 5, l = 5)
      ),
      plot.caption = element_text(
        colour = caption, hjust = 1, size = 0.5 * base_size,
        margin = margin(t = 7, r = 5, b = 5, l = 5)
      ),
      plot.caption.position = "panel",
      panel.background = element_rect(fill = background, colour = NA),
      plot.background = element_rect(fill = background, colour = NA),
      panel.grid = element_blank(),
      axis.title = element_text(
        size = base_size, family = axis_title_font, color = "black",
        vjust = 1, margin = margin(t = 0, r = 0, b = 0, l = 0)
      ),
      axis.text = element_text(size = base_size * 0.7, colour = axis_text),
      axis.line = element_line(colour = "black"),
      axis.ticks = element_line(linewidth = 0.6, colour = axis_line_col),
      strip.background = element_rect(
        fill = strip_background, colour = axis_line_col, linewidth = 0.8
      ),
      strip.text = element_text(
        size = 0.7 * base_size,
        margin = margin(t = 2, r = 3, b = 2, l = 3), colour = strip_text
      ),
      plot.margin = margin(t = 5, r = 5, b = 5, l = 5),
      legend.background = element_rect(fill = background, colour = NA)
    )

  if (type == "standalone") {
    return(out)
  } else if (type == "blog") {
    out <- out %+replace%
      theme(
        plot.background = element_blank(),
        panel.background = element_blank(),
        legend.background = element_blank()
      )
  }

  out
}

#' Theme for Visbending
#'
#' @return A ggplot2 theme object
#' @export
theme_visbending <- function() {
  title <- "#003f4a"
  subtitle <- "#525252"
  caption <- "#36383A"
  axis_text <- "#003f4a"
  axis_title <- "#003f4a"
  strip_background <- "#e0e0e0"
  background <- "#ffffff"
  main_font <- "Lato"
  axis_title_font <- NULL
  axis_line_col <- "#403d39"
  strip_text <- "#003f4a"
  base_size <- 14

  out <- theme_classic() %+replace%
    theme(
      text = element_text(family = main_font, size = base_size),
      plot.title = element_text(
        face = "bold", colour = title, size = base_size * 1.4,
        hjust = 0, margin = margin(t = 5, r = 0, b = 5, l = 0)
      ),
      plot.subtitle = element_text(
        colour = subtitle, size = base_size,
        hjust = 0, margin = margin(t = 0, r = 0, b = 5, l = 5)
      ),
      plot.caption = element_text(
        colour = caption, hjust = 1, size = 0.5 * base_size,
        margin = margin(t = 7, r = 5, b = 5, l = 5)
      ),
      plot.caption.position = "panel",
      panel.background = element_rect(fill = background, colour = NA),
      plot.background = element_rect(fill = background, colour = NA),
      panel.grid = element_blank(),
      axis.title = element_text(
        size = base_size, family = axis_title_font, color = axis_title,
        vjust = 1, margin = margin(t = 0, r = 0, b = 0, l = 0)
      ),
      axis.text = element_text(size = base_size * 0.7, colour = axis_text),
      axis.line = element_line(colour = "black"),
      axis.ticks = element_line(linewidth = 0.6, colour = axis_line_col),
      strip.background = element_rect(
        fill = strip_background, colour = axis_line_col, linewidth = 0.8
      ),
      strip.text = element_text(
        size = 0.7 * base_size,
        margin = margin(t = 2, r = 3, b = 2, l = 3), colour = strip_text
      ),
      plot.margin = margin(t = 5, r = 5, b = 5, l = 5),
      legend.background = element_rect(fill = background, colour = NA)
    )

  out
}

#' Theme for Gimaldid
#'
#' @return A ggplot2 theme object
#' @export
theme_gimaldid <- function() {
  title <- "#111827"
  subtitle <- "#111827"
  caption <- "#374151"
  axis_text <- "#374151"
  strip_background <- "#e0e0e0"
  background <- "#F8F7EF"
  header_font <- "IBM Plex Serif"
  body_font <- "Roboto"
  axis_title_font <- NULL
  axis_line_col <- "#374151"
  strip_text <- "#111827"
  base_size <- 14

  out <- theme_classic() %+replace%
    theme(
      text = element_text(family = body_font, size = base_size),
      plot.title = element_text(
        face = "bold", family = header_font, colour = title,
        size = base_size * 1.4,
        hjust = 0, margin = margin(t = 5, r = 0, b = 5, l = 0)
      ),
      plot.subtitle = element_text(
        colour = subtitle, size = base_size,
        hjust = 0, margin = margin(t = 0, r = 0, b = 5, l = 5)
      ),
      plot.caption = element_text(
        colour = caption, hjust = 1, size = 0.5 * base_size,
        margin = margin(t = 7, r = 5, b = 5, l = 5)
      ),
      plot.caption.position = "panel",
      panel.background = element_rect(fill = background, colour = NA),
      plot.background = element_rect(fill = background, colour = NA),
      panel.grid = element_blank(),
      axis.title = element_text(
        size = base_size, family = axis_title_font, color = "black",
        vjust = 1, margin = margin(t = 0, r = 0, b = 0, l = 0)
      ),
      axis.text = element_text(size = base_size * 0.7, colour = axis_text),
      axis.line = element_line(colour = "black"),
      axis.ticks = element_line(linewidth = 0.6, colour = axis_line_col),
      strip.background = element_rect(
        fill = strip_background, colour = axis_line_col, linewidth = 0.8
      ),
      strip.text = element_text(
        size = 0.7 * base_size,
        margin = margin(t = 2, r = 3, b = 2, l = 3), colour = strip_text
      ),
      plot.margin = margin(t = 5, r = 5, b = 5, l = 5),
      legend.background = element_rect(fill = background, colour = NA)
    )

  out
}
