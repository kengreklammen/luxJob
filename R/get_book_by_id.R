library(glue)
library(DBI)
library(RPostgres)

#' Returns a list of recommended books.
#' The parameter is a numeric type that represents a book ID number.
#' Calling the function without parameter will return a data frame with all recommended books.
#'
#' @param book_id A numeric type data that represents the ID of a book.
#'
#' @returns A data frame with the recommended books.
#' @export
#'
#' @examples
#' \dontrun{
#' get_book_by_id()
#' get_book_by_id(12)
#' get_book_by_id(book_id = 34)
#' }
get_book_by_id <- function(book_id = NULL){
	if(is.null(book_id) || !is.numeric(book_id)){stop("Missing book_id, or wrong parameter type!")}
	con <- connect_db()
	sql <- glue::glue_sql("select * from adem.book_recommendations where book_id = {book_id};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- DBI::dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	return(df)
}
