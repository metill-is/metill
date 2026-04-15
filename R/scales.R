#' Format Numbers as Icelandic Kr<U+00F3>na
#'
#' @param x The number to be formatted as ISK
#' @param scale A scaling factor: x will be multiplied by scale before
#'   formatting.
#' @param suffix If NULL the suffix will try to be decided based on
#'   the scale.
#' @param ... Other inputs passed on to scales::number()
#'
#' @return A character vector version of the input number formatted as ISK
#' @export
#'
#' @importFrom scales number percent label_number label_percent
isk <- function(x, scale = 1, suffix = NULL, ...) {
  if (is.null(suffix)) {
    scaling <- c(
      " kr" = 1,
      " \u00fe\u00fas.kr" = 1e-3,
      " m.kr" = 1e-6,
      " ma.kr" = 1e-9
    )
    suffix <- names(scaling[scaling == scale])
  }

  scales::number(
    x,
    suffix = suffix, big.mark = ".", decimal.mark = ",",
    accuracy = 1, scale = scale, ...
  )
}

#' Create a Labeller to Format Numbers as Icelandic Kr<U+00F3>na
#'
#' @param scale A scaling factor: x will be multiplied by scale before
#'   formatting.
#' @param suffix If NULL the suffix will try to be decided based on
#'   the scale.
#' @param accuracy A number to round to.
#' @param ... Other inputs passed on to scales::label_number()
#'
#' @return A labelling function for use with ggplot2 scales
#' @export
label_isk <- function(scale = 1, suffix = NULL, accuracy = 1, ...) {
  if (is.null(suffix)) {
    scaling <- c(
      " kr" = 1,
      " \u00fe\u00fas.kr" = 1e-3,
      " m.kr" = 1e-6,
      " ma.kr" = 1e-9
    )
    suffix <- names(scaling[scaling == scale])
  }

  scales::label_number(
    suffix = suffix, big.mark = ".", decimal.mark = ",",
    accuracy = accuracy, scale = scale, ...
  )
}

#' Format Numbers as Percentages with Icelandic Standards
#'
#' @param x Numeric vector to be formatted as percentage
#' @param accuracy A number to round to. E.g. 0.01 shows 2 decimal places.
#' @param ... Other inputs passed on to scales::percent()
#'
#' @return A character vector formatted as percentage with Icelandic
#'   localisation
#' @export
hlutf <- function(x, accuracy = 0.1, ...) {
  scales::percent(
    x,
    big.mark = ".", decimal.mark = ",", accuracy = accuracy, ...
  )
}

#' Create a Labeller to Format Percentages with Icelandic Standards
#'
#' @param accuracy A number to round to. E.g. 0.01 shows 2 decimal places.
#' @param ... Other inputs passed on to scales::label_percent()
#'
#' @return A labelling function for use with ggplot2 scales
#' @export
label_hlutf <- function(accuracy = 0.1, ...) {
  scales::label_percent(
    big.mark = ".", decimal.mark = ",", accuracy = accuracy, ...
  )
}

#' Format Numbers with Icelandic Standards
#'
#' @param x Numeric vector to be formatted
#' @param accuracy A number to round to. E.g. 0.01 shows 2 decimal places.
#' @param ... Other inputs passed on to scales::number()
#'
#' @return A character vector formatted with Icelandic number conventions
#' @export
tala <- function(x, accuracy = 0.1, ...) {
  scales::number(
    x,
    big.mark = ".", decimal.mark = ",", accuracy = accuracy, ...
  )
}

#' Create a Labeller to Format Numbers with Icelandic Standards
#'
#' @param accuracy A number to round to. E.g. 0.01 shows 2 decimal places.
#' @param ... Other inputs passed on to scales::label_number()
#'
#' @return A labelling function for use with ggplot2 scales
#' @export
label_tala <- function(accuracy = 0.1, ...) {
  scales::label_number(
    big.mark = ".", decimal.mark = ",", accuracy = accuracy, ...
  )
}
