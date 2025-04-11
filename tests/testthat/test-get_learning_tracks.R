test_that("it returns error when calling with a numeric parameter", {
	expect_error(get_learning_tracks(34))
})

test_that("it returns all learning tracks when calling without parameter", {
	expect_equal(nrow(get_learning_tracks()), 6956)
})

test_that("it accepts a named parameter (skill), and that it is case-insensitive", {
	expect_equal(get_learning_tracks(skill = "haskell"), data.frame(track_id=c(40, 65, 83, 85), title=c("Learning Track 40", "Learning Track 65", "Learning Track 83", "Learning Track 85"), description=c("Description for learning track 40", "Description for learning track 65", "Description for learning track 83", "Description for learning track 85"), url=c("https://dlh.lu/learning-track/40", "https://dlh.lu/learning-track/65", "https://dlh.lu/learning-track/83", "https://dlh.lu/learning-track/85" )))
})

test_that("it returns the correct records from the database", {
	expect_equal(get_learning_tracks("haskell"), data.frame(track_id=c(40, 65, 83, 85), title=c("Learning Track 40", "Learning Track 65", "Learning Track 83", "Learning Track 85"), description=c("Description for learning track 40", "Description for learning track 65", "Description for learning track 83", "Description for learning track 85"), url=c("https://dlh.lu/learning-track/40", "https://dlh.lu/learning-track/65", "https://dlh.lu/learning-track/83", "https://dlh.lu/learning-track/85" )))
})
