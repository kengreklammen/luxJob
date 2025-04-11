test_that("it throws an error when calling without parameter", {
	expect_error(get_company_details())
})

test_that("it throws an error when calling with non-numeric parameter", {
	expect_error(get_company_details("34"))
})

test_that("it returns NULL when not finding any company", {
	expect_null(get_company_details(156489))
})

test_that("it returns the correct company data for a valid parameter", {
	expect_equal(get_company_details(15)$`1`, data.frame(company_id=15, name="Company_15", sector="Healthcare"))
})

test_that("it returns the correct company data for a valid named parameter", {
	expect_equal(get_company_details(company_id = 15)$`1`, data.frame(company_id=15, name="Company_15", sector="Healthcare"))
})
