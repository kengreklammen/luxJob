library(glue)
library(DBI)
library(RPostgres)

#' Returns all company information and all the vacancies from that company.
#' If no parameter is given, it returns NULL.
#'
#' @param company_id A numeric type parameter that represents a company ID.
#'
#' @returns A list data type with all company info and the related job vacancies.
#' @export
#'
#' @examples
#' \dontrun{
#' get_company_details()
#' get_company_details(12)
#' }
get_company_details <- function(company_id = NULL){
	if(is.null(company_id)){return(NULL)}
		 else {
			if(!is.numeric(company_id)){stop("Missing company_id value, or wrong parameter type!")}
		 }
	con <- connect_db()
	sql1 <- glue::glue_sql("select * from adem.companies where company_id = {company_id};", .con = con)
	sql2 <- glue::glue_sql("select from adem.vacancies where company_id = {company_id};", .con = con)
	DBI::dbExecute(con, "SET search_path TO adem")
	df1 <- dbGetQuery(con, sql1)
	df2 <- dbGetQuery(con, sql2)
	DBI::dbDisconnect(con)
	l1 = split(df1, seq(nrow(df1)))
	l2 = split(df2, seq(nrow(df2)))
	return(append(l1, l2))
}
