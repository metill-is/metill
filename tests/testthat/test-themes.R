test_that("theme_metill() returns a ggplot2 theme", {
  th <- theme_metill()
  expect_s3_class(th, "theme")
})

test_that("theme_metill() standalone vs blog type", {
  standalone <- theme_metill(type = "standalone")
  blog <- theme_metill(type = "blog")
  expect_s3_class(standalone, "theme")
  expect_s3_class(blog, "theme")
  # Blog type should have transparent backgrounds
  expect_true(inherits(blog$plot.background, "element_blank"))
})

test_that("theme_visbending() returns a ggplot2 theme", {
  th <- theme_visbending()
  expect_s3_class(th, "theme")
})

test_that("theme_gimaldid() returns a ggplot2 theme", {
  th <- theme_gimaldid()
  expect_s3_class(th, "theme")
})
