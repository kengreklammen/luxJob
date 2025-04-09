library(glue)
library(DBI)
library(RPostgres)

#' Returns one learning track and all its linked skills as a list.
#' If no parameter is given, then it returns NULL.
#'
#' @param track_id The ID of an ADEM learning track (numeric type).
#'
#' @returns A list with a learning track with its linked skills.
#' @export
#'
#' @examples
#' \dontrun{
#' get_learning_track_by_id()
#' get_learning_track_by_id(28)
#' get_learning_track_by_id(track_id = 28)
#' }
get_learning_track_by_id <- function(track_id = NULL){
	if(is.null(track_id)){return(NULL)}
	else {
		if(!is.numeric(track_id)){stop("Wrong track_id parameter type!")}
	}
	con <- connect_db()
	sql1 <- glue::glue_sql("select * from adem.learning_tracks where track_id = {track_id};", .con = con)
	sql2 <- glue::glue_sql("select skill_label from adem.track_skills left join adem.skills using (skill_id) where track_id = {track_id};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df1 <- DBI::dbGetQuery(con, sql1)
	df2 <- DBI::dbGetQuery(con, sql2)
	DBI::dbDisconnect(con)
	l1 = split(df1, seq(nrow(df1)))
	l2 = split(df2, seq(nrow(df2)))
	return(append(l1, l2))
}
