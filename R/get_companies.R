library(glue)
library(DBI)
library(RPostgres)

#' Returns all companies listed in the database.
#' Optionally the limit parameter can be set to control the number of results.
#' Calling the function without parameter will return the first 100 companies.
#'
#' @param limit A numeric data type to limit the number of results.
#'
#' @returns A data frame with all companies.
#' @export
#'
#' @examples
#' \dontrun{
#' get_companies()
#' get_companies(200)
#' get_companies(limit = 20)
#' }
get_companies <- function(limit = 100){
	if(!is.numeric(limit)){limit = 100}
	con <- connect_db()
	sql <- glue_sql("select * from adem.companies limit {limit};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	return(df)
}
