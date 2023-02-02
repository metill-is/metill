#' Íslenskar þýðingar á enskum nöfnum á löndum
#'
#' @return A tibble with two columns: country (english name), and land (icelandic name)
#' @export
country_names <- function() {
    tibble::tribble(
        ~country, ~land,
        "Australia", "Ástralía",
        "Belgium", "Belgía",
        "Bulgaria", "Búlgaría",
        "Canada", "Kanada",
        "Czech Republic", "Tékkland",
        "Denmark", "Danmörk",
        "Estonia", "Eistland",
        "Finland", "Finnland",
        "France", "Frakkland",
        "Germany", "Þýskaland",
        "Greece", "Grikkland",
        "Hungary", "Ungverjaland",
        "Iceland", "Ísland",
        "Ireland", "Írland",
        "Israel", "Ísrael",
        "Italy", "Ítalía",
        "Latvia", "Latvía",
        "Luxembourg", "Lúxemborg",
        "New Zealand", "Nýja Sjáland",
        "Norway", "Noregur",
        "Netherlands", "Holland",
        "Poland", "Pólland",
        "Portugal", "Portúgal",
        "Slovak Republic", "Slóvakía",
        "Slovenia", "Slóvenía",
        "Spain", "Spánn",
        "Sweden", "Svíþjóð",
        "Switzerland", "Sviss",
        "United Kingdom", "Bretland",
        "United States", "Bandaríkin"
    )
}
