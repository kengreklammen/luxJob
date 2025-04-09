library(glue)
library(DBI)
library(RPostgres)

#' Logging user search queries in the database.
#'
#' @param user_id A numeric type user ID.
#' @param query The search string entered by the user.
#'
#' @returns Nothing.
#' @export
#'
#' @examples
#' \dontrun{
#' log_search(12, "Python jobs")
#' log_search(user_id = 12, "Python jobs")
#' log_search(user_id = 12, query = "Python jobs")
#' }
log_search <- function(user_id = NULL, query = NULL){
	if(!is.numeric(user_id) || is.null(user_id) || is.numeric(query) || is.null(query)){stop("Missing parameter, or wrong parameter type!")}
	con <- connect_db()
	sql <- glue::glue_sql("insert into student_arpad.search_logs (user_id, query) values({user_id}, {query});", .con = con)
	DBI::dbExecute(con, "SET search_path TO student_arpad")
	df <- DBI::dbExecute(con, sql)
	DBI::dbDisconnect(con)
	return(df)
}
