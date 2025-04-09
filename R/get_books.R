library(glue)
library(DBI)
library(RPostgres)

#' Returns all recommended books.
#' The parameter is a character type that represents a skill label.
#' Calling the function without parameter will return a data frame with all recommended books.
#'
#' @param skill A string that represents a skill.
#'
#' @returns A data frame with info about the recommended books.
#' @export
#'
#' @examples
#' \dontrun{
#' get_books()
#' get_books("show initiative")
#' get_books(skill = "show initiative")
#' }
get_books <- function(skill = NULL){
	if(is.numeric(skill)){stop("The skill parameter cannot be numeric!")}
	else{
		if(is.null(skill)){skill <- "%"}
		}
	con <- connect_db()
	sql <- glue_sql("select ab.book_id, ab.title, ab.author from adem.skills left join adem.book_recommendations as ab using (skill_id) where skill_label ilike {skill};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	return(df)
}
