#' A customized ggplotly function to fit with Metill's visual theme
#'
#' @param plot A ggplot2 object to be converted to a plotly object
#' @param ... Other inputs to ggplotly, layout or config from the plotly package
#'
#' @return
#' @export
#' @import plotly
#'
#' @examples
metill_ggplotly <- function(plot, ...) {
    ggplotly(
        plot,
        ...
    ) |>
        layout(
            hoverlabel = list(align = "left"),
            plot_bgcolor  = "rgba(0, 0, 0, 0)",
            paper_bgcolor = "rgba(0, 0, 0, 0)",
            yaxis = list(
                linewidth = 1.5,
                tickfont = list(
                    color = "#4A4C45",
                    size = 12,
                    font = "Lato"
                )
            ),
            xaxis = list(
                linewidth = 1.5,
                tickfont = list(
                    color = "#4A4C45",
                    size = 12,
                    font = "Lato"
                )
            ),
            ...
        ) |>
        config(
            displayModeBar = FALSE,
            ...
            )
}
