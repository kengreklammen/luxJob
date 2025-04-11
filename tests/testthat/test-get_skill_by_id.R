test_that("it throws an error when calling it without parameter", {
	expect_error(get_skill_by_id())
})

test_that("it throws an error when calling it with a numeric", {
	expect_error(get_skill_by_id(15))
})

test_that("it returns NULL when not finding any skill record", {
	expect_null(get_skill_by_id("fibytfiytf"))
})

test_that("it returns the correct skill for a valid parameter", {
	expect_equal(get_skill_by_id("http://data.europa.eu/esco/skill/00735755-adc6-4ea0-b034-b8caff339c9f"), data.frame(skill_id="http://data.europa.eu/esco/skill/00735755-adc6-4ea0-b034-b8caff339c9f", skill_label="install heat pump"))
})
