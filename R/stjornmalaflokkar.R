#' Icelandic political party colour palette
#'
#' @return A tibble containing the name of the party, it's abbreviation and it's colour in hex-code
#' @export
#'
#' @examples
flokkar_palette <- function() {

    tibble::tribble(
        ~flokkur, ~merki, ~litur,
        "Sjálfstæðisflokkur", "xD", "#377eb8",
        "Framsóknarflokkur", "xB", "#41ab5d",
        "Samfylkingin", "xS", "#e41a1c",
        "Vinstrihreyfingin - grænt framboð", "xV", "#00441b",
        "Viðreisn", "xC", "#ff7d14",
        "Píratar", "xP", "#984ea3",
        "Miðflokkurinn", "xM", "#08306b",
        "Flokkur fólksins", "xF", "#FBB829"
    )
}

#' Title
#'
#' @return
#' @export
#'
#' @examples
gogn_kosningarannsokn <- function() {
    Sys.setenv("DATAVERSE_SERVER" = "dataverse.rhi.hi.is")

    doi <- c("doi:10.34881/1.00011",
             "doi:10.34881/1.00010",
             "doi:10.34881/1.00009",
             "doi:10.34881/1.00008",
             "doi:10.34881/1.00007",
             "doi:10.34881/1.00006")
    filename <- c("ICENES_2017_Open_access_english_1release.tab",
                  "ICENES_2016_Open_access_english_2release.tab",
                  "ICENESS_2013_open_access_english_1release.tab",
                  "ICENES_2009_open_access_english_3release.tab",
                  "ICENES_2007_open_access_english_3release.tab",
                  "ICENES_2003_open_access_english_4release.tab")
    year <- c(2017,
              2016,
              2013,
              2009,
              2007,
              2003)

    d_retention <- purrr::pmap(list(doi = doi, filename = filename, year = year), preprocess_data_attrition) |>
        purrr::reduce(bind_rows) |>
        dplyr::mutate_at(vars(current, former), as.character) |>
        dplyr::mutate_at(vars(current, former), translate_parties) |>
        dplyr::mutate(type = "retention")


    d_recruitment <- purrr::pmap(list(doi = doi, filename = filename, year = year), preprocess_data_recruitment) |>
        purrr::reduce(bind_rows) |>
        dplyr::mutate_at(vars(current, former), as.character) |>
        dplyr::mutate_at(vars(current, former), translate_parties) |>
        mutate(type = "recruitment")

    dplyr::bind_rows(
        d_retention,
        d_recruitment
    )
}


#' Title
#'
#' @param doi
#' @param filename
#' @param year
#'
#' @return
#' @import dplyr
#'
#' @examples
preprocess_data_attrition <- function(doi, filename, year) {
    dataverse::get_dataframe_by_name(filename,
                                     doi,
                                     original = TRUE,
                                     .f = haven::read_sav) |>
        select(current = starts_with("prtvote"), former = starts_with("prtfvote"), age) |>
        mutate_at(vars(everything(), -age), forcats::as_factor) |>
        filter(
            !as.character(current) %in% c(
                "No, did not vote",
                "Not applicable",
                "Don‘t remember what I voted",
                "95",
                "Cast a blank or invalid ballot",
                "Voted, refuses to say for what party",
                "Other party, what party",
                "Refuses to answer (volunteered)",
                "Don’t know (volunteered)",
                "Voted, does not want to say which party",
                "Cast a blank ballot",
                "Cast an invalid vote",
                "Missing",
                "Voted, doesn‘t want to say for what party",
                "Another party or party list, which?",
                "Refuses to answer")
        ) |>
        tidyr::drop_na(current) |>
        group_by(current, former) |>
        summarise(n = n(),
                  age = mean(age),
                  .groups = "drop") |>
        arrange(former, desc(n)) |>
        group_by(former) |>
        mutate(p = n / sum(n),
               cum_p = cumsum(p)) |>
        ungroup() |>
        mutate(year = year)
}


#' Title
#'
#' @param doi
#' @param filename
#' @param year
#'
#' @return
#' @import dplyr
#'
#' @examples
preprocess_data_recruitment <- function(doi, filename, year) {
    dataverse::get_dataframe_by_name(
        filename,
        doi,
        original = TRUE,
        .f = haven::read_sav
    ) |>
        select(
            current = starts_with("prtvote"),
            former = starts_with("prtfvote"),
            age
        ) |>
        mutate_at(vars(everything(), -age), forcats::as_factor) |>
        filter(
            !as.character(former) %in% c("No, did not vote",
                                         "Not applicable",
                                         "Don‘t remember what I voted",
                                         "95",
                                         "Cast a blank or invalid ballot",
                                         "Voted, refuses to say for what party",
                                         "Other party, what party",
                                         "Refuses to answer (volunteered)",
                                         "Don’t know (volunteered)",
                                         "Voted, does not want to say which party",
                                         "Cast a blank ballot",
                                         "Cast an invalid vote",
                                         "Missing",
                                         "Voted, doesn‘t want to say for what party",
                                         "Another party or party list, which?",
                                         "Refuses to answer")
        ) |>
        tidyr::drop_na(former) |>
        group_by(current, former) |>
        summarise(n = n(),
                  age = mean(age),
                  .groups = "drop") |>
        arrange(current, desc(n)) |>
        group_by(current) |>
        mutate(p = n / sum(n),
               cum_p = cumsum(p)) |>
        ungroup() |>
        mutate(year = year)
}

#' Title
#'
#' @param name
#'
#' @return Character vector of translated party names
#'
#' @examples
translate_parties <- function(name) {
    parties <- c(
        "Independence Party" = "Sjálfstæðisflokkur",
        "Progressive Party" = "Framsóknarflokkur",
        "Social Democratic Alliance" = "Samfylkingin",
        "Left Green Movement" = "Vinstrihreyfingin - grænt framboð",
        "Pirate Party" = "Píratar",
        "Reform Party" = "Viðreisn",
        "Centre Party" = "Miðflokkurinn",
        "Bright Future" = "Björt framtíð",
        "Peoples party" = "Flokkur fólksins",
        "Civic Movement" = "Borgarahreyfingin",
        "Dawn" = "Dögun",
        "Liberal Party" = "Frjálslyndi flokkurinn",
        "Cast a blank or invalid ballot" = "Skilaði auðu",
        "95" = "Nýr kjósandi"
    )

    ifelse(name %in% names(parties), parties[name], name)
}
