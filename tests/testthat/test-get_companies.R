test_that("it returns the correct amount of results when not passing any parameter", {
	expect_equal(nrow(get_companies()), 100)
})

test_that("it is able to return all company records from the database", {
	expect_equal(nrow(get_companies(1000000)), 100)
})

test_that("it returns the correct amount of results from the database when using a numeric parameter", {
	expect_equal(nrow(get_companies(28)), 28)
})

test_that("it returns the correct amount of results with a correctly named parameter", {
	expect_equal(nrow(get_companies(limit=28)), 28)
})

test_that("it returns a limited 100 element company list when using character type parameter", {
	expect_equal(nrow(get_companies("28")), 100)
})

test_that("it returns all details of the companies", {
	expect_equal(get_companies(10)[1:1,], data.frame(company_id=42, name="Company_42", sector="IT"))
})
