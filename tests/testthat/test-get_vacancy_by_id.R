test_that("it throws an error when calling with non-numeric parameter", {
	expect_error(get_vacancy_by_id("34"))
})

test_that("it returns NULL when not finding any vacancies", {
	expect_null(get_vacancy_by_id(156489))
})

test_that("it returns the correct vacancy for a valid parameter", {
	expect_equal(get_vacancy_by_id(-1867865091)$`1`, data.frame(vacancy_id=-1867865091, company_id=33, canton="Capellen", occupation="Action sociale", year=2022, month=11))
})

test_that("it returns the correct vacancy for a valid named parameter", {
	expect_equal(get_vacancy_by_id(vacancy_id = -1867865091)$`1`, data.frame(vacancy_id=-1867865091, company_id=33, canton="Capellen", occupation="Action sociale", year=2022, month=11))
})
