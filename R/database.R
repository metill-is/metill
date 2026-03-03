#' Initialize the Metill Database
#'
#' Creates helper functions in the global environment, one per table
#' in the Metill S3 bucket.
#'
#' @return Invisibly returns a list of created helper function names.
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
#' @return Creates a single helper function named `mtl_<table>`
#' in the global environment.
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
#' @param dataset A data frame or tibble to upload.
#' @param dataset_name Name to use in the S3 database path. If `NULL`,
#' the function tries to infer a name from the currently open RStudio file.
#'
#' @return Invisibly returns the uploaded dataset name.
#' @export
upload_to_database <- function(dataset, dataset_name = NULL) {

    if (is.null(dataset_name)) {
        if (!rstudioapi::isAvailable()) {
            stop("Please provide `dataset_name` when not running in RStudio.", call. = FALSE)
        }

        file_name <- rstudioapi::documentPath()
        dataset_name <- stringr::str_match(file_name, "/([a-zA-Z_]*).R$")[, 2]
    }

    if (is.na(dataset_name) || identical(dataset_name, "")) {
        stop("Could not determine dataset name. Provide `dataset_name` explicitly.", call. = FALSE)
    }

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

    invisible(dataset_name)
}
