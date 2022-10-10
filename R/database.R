#' R7 Class Representing a Connection to our database
#'
metill_db <- R7::new_class(
    "metill_db",
    properties = list(
        tables = R7::class_character,
        con_info = R7::new_property(
            R7::class_list,
            default = list(
                dbname = "bggj",
                host = "165.22.193.93",
                port = 5432,
                username = "bggj",
                password = "DominoCable.90"
            )
        ),
        connection = R7::class_any
    )
)

#' Generic for connect() function
connect <- R7::new_generic("connect", "db", function(db) {
    R7::R7_dispatch()
})

#' Connect an Initiated R7 Database Object to the Remote Database
#'
#' @param db
#'
#' @return
#' @export
#'
#' @examples
R7::method(connect, metill_db) <- function(db) {

    info <- R7::prop(db, "con_info")

    R7::prop(db, "connection") <- DBI::dbConnect(
        RPostgres::Postgres(),
        dbname = info$dbname,
        host = info$host,
        port = info$port,
        user = info$username,
        password = info$password
    )

    R7::prop(db, "tables") <- DBI::dbListTables(
        R7::prop(db, "connection")
    )

    db


}



#' Generic for list_tables() function
#' @param db
#' @return
#' @export
list_tables <- R7::new_generic("list_tables", "db", function(db) {
    R7::R7_dispatch()
})

#' List the Tables in our Remote Database
#'
#' @param db
#'
#' @return
#' @export
#'
#' @examples
R7::method(list_tables, metill_db) <- function(db) {
    R7::prop(db, "tables")
}


#' Initialize the Metill Database
#'
#' @return
#' @export
#'
#' @examples
init_db <- function() {

    db <- metill_db() |>
        connect()

    con <- R7::prop(db, "connection")
    tables <- R7::prop(db, "tables")

    invisible(purrr::map(
        tables,
        make_table_functions,
        con = con
    ))
}


#' Title
#'
#' @param table
#' @param con
#'
#' @return
#'
#' @examples
make_table_functions <- function(table, con) {
    fun <- function() dplyr::tbl(con, table)
    attr(fun, 'connection') <- con
    attr(fun, 'table') <- table

    clean_name <- snakecase::to_snake_case(table)
    function_name <- paste0("mtl_", clean_name)

    assign(function_name, fun, pos = globalenv())
}
