#' Initialize the Metill Database
#'
#' @return
#' @export
init_db <- function() {

    b <- arrow::s3_bucket(
        "metill/metill_db"
    )

    tables <- b$ls()

    invisible(purrr::map(
        tables,
        make_table_functions
    ))
}


#' Title
#'
#' @param table
#'
#' @return
make_table_functions <- function(table) {
    fun <- function() {
        arrow::open_dataset(
            arrow::s3_bucket(
                paste(
                    "metill",
                    "metill_db",
                    table,
                    sep = "/"
                )
            )
        ) |>
            arrow::to_duckdb()
    }

    function_name <- paste0("mtl_", table)

    assign(function_name, fun, pos = globalenv())
}

#' Title
#'
#' @param dataset
#'
#' @return
#' @export
upload_to_database <- function(dataset) {

    file_name <- rstudioapi::documentPath()
    dataset_name <- stringr::str_match(file_name, "/([a-zA-Z_]*).R$")[, 2]

    out_string <- stringr::str_c(
        "\n",
        "Dataset was uploaded to database with name: ", dataset_name,
        "\n"
    )
    writeLines(out_string)

    b <- arrow::s3_bucket("metill/metill_db")

    if (dataset_name %in% b$ls()) b$DeleteDir(dataset_name)
    b$CreateDir(dataset_name)

    dataset |>
        arrow::write_dataset(
            b$path(dataset_name),
            format = "parquet"
        )
}
