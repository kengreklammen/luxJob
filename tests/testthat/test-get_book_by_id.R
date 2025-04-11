test_that("throwing error for get_book_by_id() works", {
  expect_error(get_book_by_id())
})

test_that("throwing error for get_book_by_id('name') works", {
	expect_error(get_book_by_id("name"))
})

test_that("get_book_by_id(34) works", {
	expect_type(get_book_by_id(34), "list")
})

test_that("it returns the correct record from the database", {
	expect_equal(get_book_by_id(34), data.frame(book_id=34, title="Book Title 34", author="Author 34", skill_id="http://data.europa.eu/esco/skill/519e801b-3cc4-44d4-bcf1-32fdb9a77e51"))
})

test_that("get_book_by_id(book_id = 34) works", {
	expect_type(get_book_by_id(book_id = 34), "list")
})

