test_that("successful insert works", {
	expect_true(log_search(4, "menuisier"))
})

test_that("unsuccessful insert works", {
	expect_false(log_search(32, "menuisier"))
})
