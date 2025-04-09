library(glue)
library(DBI)
library(RPostgres)

#' Returns a list of job vacancies.
#' Optionally filters can be given as parameters. These optional parameters:
#'	skill -> a skill in character format
#'	company -> a name of a company
#'	canton -> the job location
#'	limit -> limit for the size of search results
#'
#' @param skill The name of the skill.
#' @param company The ID of the company.
#' @param canton The name of a canton.
#' @param limit the maximum number of results from the query.
#'
#' @returns A data frame with the list of job vacancies.
#' @export
#'
#' @examples
#' \dontrun{
#' get_vacancies()
#' get_vacancies(skill = "show initiative")
#' get_vacancies(canton = "Mersch")
#' get_vacancies(skill = "show initiative", canton = "Mersch", limit = 3)
#' get_vacancies(canton = "Mersch", limit = 12)
#' }
get_vacancies <- function(skill = NULL, company = NULL, canton = NULL, limit = 100){
	if(is.numeric(skill) || is.numeric(company) || is.numeric(canton)){stop("Wrong parameter type!")}
	if(is.null(skill)){skill <- "%"}
	if(is.null(company)){company <- "%"}
	if(is.null(canton)){canton <- "%"}
	con <- connect_db()
	sql <- glue::glue_sql("select v.vacancy_id, v.company_id, v.canton, v.occupation, v.year, v.month from adem.vacancies as v inner join adem.vacancy_skills using (vacancy_id) inner join adem.skills using (skill_id) where skill_label ilike {skill} and canton ilike {canton} limit {limit};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df <- dbGetQuery(con, sql)
	DBI::dbDisconnect(con)
	return(df)
}
