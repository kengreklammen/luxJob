library(glue)
library(DBI)
library(RPostgres)

#' Returns a list of registered skills from the database.
#' Using the function without the limit parameter the function will return all registered skills from the database.
#'
#' @param limit A numeric type that limits the maximum number of results.
#'
#' @returns A data frame with a list of skills.
#' @export
#'
#' @examples
#' \dontrun{
#' get_skills()
#' get_skills(12)
#' get_skills(limit = 20)
#' }
get_skills <- function(limit = 100){
	if(!is.numeric(limit)){limit = 100}
	con <- connect_db()
	sql <- glue::glue_sql("select * from adem.skills limit {limit};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	return(df)
	}
