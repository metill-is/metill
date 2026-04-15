test_that("isk() formats currency with Icelandic conventions", {
  expect_equal(isk(1500000), "1.500.000 kr")
  expect_equal(isk(1500000, scale = 1e-6), "2 m.kr")
  expect_equal(isk(3000000000, scale = 1e-9), "3 ma.kr")
})

test_that("isk() thousands scale uses correct suffix", {
  result <- isk(2500, scale = 1e-3)
  expect_true(grepl("^2 ", result))
  expect_true(grepl("s\\.kr$", result))
})

test_that("isk() uses custom suffix when provided", {
  expect_equal(isk(1500, suffix = " ISK"), "1.500 ISK")
})

test_that("isk() handles vector input", {
  result <- isk(c(1000, 2000, 3000))
  expect_length(result, 3)
  expect_type(result, "character")
})

test_that("label_isk() returns a labelling function", {
  labeller <- label_isk(scale = 1e-6)
  expect_type(labeller, "closure")
  result <- labeller(c(1000000, 2000000))
  expect_length(result, 2)
  expect_true(all(grepl("m\\.kr", result)))
})

test_that("hlutf() formats percentages with Icelandic conventions", {
  expect_equal(hlutf(0.156), "15,6%")
  expect_equal(hlutf(0.5), "50,0%")
  expect_equal(hlutf(1), "100,0%")
})

test_that("hlutf() respects accuracy parameter", {
  expect_equal(hlutf(0.1567, accuracy = 0.01), "15,67%")
  expect_equal(hlutf(0.1567, accuracy = 1), "16%")
})

test_that("label_hlutf() returns a labelling function", {
  labeller <- label_hlutf()
  expect_type(labeller, "closure")
})

test_that("tala() formats numbers with Icelandic separators", {
  expect_equal(tala(1234567), "1.234.567,0")
  expect_equal(tala(0.5), "0,5")
})

test_that("tala() respects accuracy parameter", {
  expect_equal(tala(1234, accuracy = 1), "1.234")
  expect_equal(tala(1234.567, accuracy = 0.01), "1.234,57")
})

test_that("label_tala() returns a labelling function", {
  labeller <- label_tala()
  expect_type(labeller, "closure")
})

test_that("Icelandic separators are consistent across all functions", {
  isk_result <- isk(1234567)
  tala_result <- tala(1234567)
  expect_true(grepl("\\.", isk_result))
  expect_true(grepl("\\.", tala_result))
})
