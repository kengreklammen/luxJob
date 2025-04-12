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
	expect_equal(get_skills()[1:1,], data.frame(skill_id="http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9", skill_label="guide operation of heavy construction equipment"))
})
