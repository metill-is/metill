#' Íslenskar þýðingar á enskum nöfnum á löndum
#'
#' @return A tibble with two columns: country (english name), and land (icelandic name)
#' @export
country_names <- function() {
    tibble::tribble(
        ~country, ~land,
        "Austria", "Austurríki",
        "Australia", "Ástralía",
        "Belgium", "Belgía",
        "Bulgaria", "Búlgaría",
        "Canada", "Kanada",
        "Croatia", "Króatía",
        "Czech Republic", "Tékkland",
        "Czechia", "Tékkland",
        "Cyprus", "Kýpur",
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
        "Latvia", "Lettland",
        "Liechtenstein", "Liechtenstein",
        "Lithuania", "Litáen",
        "Luxembourg", "Lúxemborg",
        "Malta", "Malta",
        "Netherlands", "Holland",
        "New Zealand", "Nýja Sjáland",
        "Norway", "Noregur",
        "Poland", "Pólland",
        "Portugal", "Portúgal",
        "Romania", "Rúmenía",
        "Slovak Republic", "Slóvakía",
        "Slovakia", "Slóvakía",
        "Slovenia", "Slóvenía",
        "Spain", "Spánn",
        "Sweden", "Svíþjóð",
        "Switzerland", "Sviss",
        "United Kingdom", "Bretland",
        "United States", "Bandaríkin"
    )
}
