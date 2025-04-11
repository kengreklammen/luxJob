test_that("throwing error for a non-numeric argument works", {
	expect_error(get_learning_track_by_id("28"))
})

test_that("it returns a list type", {
	expect_type(get_learning_track_by_id(13), "list")
})

test_that("it returns a list type for a named (track_id) parameter", {
	expect_type(get_learning_track_by_id(track_id = 13), "list")
})

# test_that("it returns the correct track from the database", {
# 	expect_equal(get_learning_track_by_id(13)[1][1], list(track_id=13, title="Learning Track 13", description="Description for learning track 13", url="https://dlh.lu/learning-track/13"))
# })

test_that("it returns the correct length of list", {
	expect_equal(length(get_learning_track_by_id(13)), 57)
})

test_that("it works with a parameter: book_id = 28", {
	expect_type(get_learning_track_by_id(track_id = 28), "list")
})

# Megirni a NULL vizsgalatat.
