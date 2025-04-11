test_that("it throws an error when calling with a numeric 'skill' parameter", {
	expect_error(get_vacancies(skill = 34))
})

test_that("it throws an error when calling with a numeric 'company' parameter", {
	expect_error(get_vacancies(company = 34))
})

test_that("it throws an error when calling with a numeric 'canton' parameter", {
	expect_error(get_vacancies(canton = 34))
})

test_that("it returns the correct amount of results when not providing filtering parameters, but providing 'limit=100000' parameter.", {
	expect_equal(nrow(get_vacancies(limit=100000)), 14822)
})

test_that("the 'limit' parameter works", {
	expect_equal(nrow(get_vacancies(limit=1000)), 1000)
})

test_that("it returns the correct results when providing the 'skill' parameter, even if it is a partial string", {
	expect_equal(nrow(get_vacancies(skill = "show initia")), 30)
})

test_that("it returns the correct results when providing the 'company' parameter, even if it is a partial string", {
	expect_equal(nrow(get_vacancies(company = "Company_8")), 30)
})

test_that("it returns the correct results when providing the 'canton' parameter, even if it is a partial string", {
	expect_equal(nrow(get_vacancies(canton = "Mersc")), 100)
})

test_that("it returns the correct results when providing complex filters with the 'skill', 'canton' 'company' parameters, even if they are partial strings", {
	expect_equal(nrow(get_vacancies(skill="programming", company="Company_5", canton = "Di")), 1)
})
