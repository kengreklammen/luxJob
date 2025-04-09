library(glue)
library(DBI)
library(RPostgres)

#' Returns learning tracks. If the skill_id parameter is given, then it returns only tracks teaching that particular skill.
#'
#' @param skill A character type parameter representing a skill.
#'
#' @returns A data frame with a learning track data.
#' @export
#'
#' @examples
#' \dontrun{
#' get_learning_tracks()
#' get_learning_tracks("show initiative")
#' get_learning_tracks(skill = "show initiative")
#' }
get_learning_tracks <- function(skill = NULL){
	if(is.numeric(skill)){stop("Wrong parameter type!")}
	if(is.null(skill)){skill <- "%"}
	con <- connect_db()
	sql <- glue::glue_sql("select t.track_id, t.title, t.description, t.url from adem.learning_tracks as t inner join adem.track_skills using (track_id) inner join adem.skills using (skill_id) where skill_label ilike {skill};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	return(df)
}
