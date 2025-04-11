test_that("it is able to return all skills from the database", {
	expect_equal(nrow(get_skills(100000)), 3452)
})

test_that("the results contain exactly 100 records if called without parameter", {
	expect_equal(nrow(get_skills()), 100)
})

test_that("it returns 100 records if called with a character type parameter", {
	expect_equal(nrow(get_skills("something")), 100)
})

test_that("it returns the correct amount of records when using the 'limit' parameter", {
	expect_equal(nrow(get_skills(83)), 83)
})

test_that("it returns the correct amount of records when using named 'limit' parameter", {
	expect_equal(nrow(get_skills(limit=83)), 83)
})

test_that("the results contain all the expected columns", {
	expect_equal(get_skills()[1:1,], data.frame(skill_id="http://data.europa.eu/esco/skill/00735755-adc6-4ea0-b034-b8caff339c9f", skill_label="install heat pump"))
})
