library(glue)
library(DBI)
library(RPostgres)

#' Returns full vacancy info and the required skills for that particular job vacancy.
#'
#' @param vacancy_id A numeric type ID of a vacancy.
#'
#' @returns A list type value with the vacancy info and the required skills for that particular job vacancy.
#' @export
#'
#' @examples
#' \dontrun{
#' get_vacancy_by_id(45)
#' get_vacancy_by_id(vacancy_id = 45)
#' }
get_vacancy_by_id <- function(vacancy_id = NULL){
	if(is.null(vacancy_id) || !is.numeric(vacancy_id)){stop("Missing or wrong type of vacancy_id!")}
	con <- connect_db()
	sql1 <- glue::glue_sql("select * from adem.vacancies where vacancy_id = {vacancy_id};", .con = con)
	sql2 <- glue::glue_sql("select * from adem.vacancy_skills left join adem.skills using (skill_id) where vacancy_id = {vacancy_id};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df1 <- DBI::dbGetQuery(con, sql1)
	df2 <- DBI::dbGetQuery(con, sql2)
	l1 = split(df1, seq(nrow(df1)))
	l2 = split(df2, seq(nrow(df2)))
	l <- append(l1, l2)
	if(length(l$`1`$vacancy_id) == 0){l <- NULL}
	DBI::dbDisconnect(con)
	return(l)
}
