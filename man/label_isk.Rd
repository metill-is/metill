% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales.R
\name{label_isk}
\alias{label_isk}
\title{Crate a Labeller to Format Numbers as Icelandic Krona}
\usage{
label_isk(scale = 1, suffix = NULL, accuracy = 1, ...)
}
\arguments{
\item{scale}{A scaling factor: x will be multiplied by scale before formatting.}

\item{suffix}{If NULL the suffix will try to be decided based on the scale.}

\item{x}{The number to be formatted as ISK}
}
\value{
A characted vector version of the input number formatted as ISK
}
\description{
Crate a Labeller to Format Numbers as Icelandic Krona
}
