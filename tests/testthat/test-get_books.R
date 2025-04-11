test_that("throwing error for a numeric argument works", {
	expect_error(get_books(65))
})

test_that("it returns a list type", {
	expect_type(get_books(), "list")
})

test_that("it returns the correct columns from the database", {
	expect_equal(get_books()[1:1,], data.frame(book_id=1, title="Book Title 1", author="Author 1"))
})

test_that("it returns the correct record from the database when giving a skill argument", {
	expect_equal(get_books("show initiative"), data.frame(book_id=c(216, 408), title=c("Book Title 216", "Book Title 408"), author=c("Author 216", "Author 408")))
})

