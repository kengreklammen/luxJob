library(glue)
library(DBI)
library(RPostgres)

#' Returns a single skill based on its ID.
#'
#' @param skill_id The ID of a skill (character type).
#'
#' @returns A data frame with a skill information.
#' @export
#'
#' @examples
#' \dontrun{
#' get_skill_by_id(12)
#' get_skill_by_id(skill_id = 34)
#' }
get_skill_by_id <- function(skill_id = NULL){
	if(is.null(skill_id) || is.numeric(skill_id)){stop("Missing skill_id value, or wrong type of parameter!")}
	con <- connect_db()
	sql <- glue::glue_sql("select * from adem.skills where skill_id ilike {skill_id};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- DBI::dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	if(nrow(df)==0){return(NULL)}
	return(df)
}
