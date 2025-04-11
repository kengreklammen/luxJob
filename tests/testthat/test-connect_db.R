test_that("connection works", {
	expect_s4_class(connect_db(), "PqConnection")
})
