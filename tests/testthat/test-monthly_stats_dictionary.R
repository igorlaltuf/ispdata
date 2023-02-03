# Tests for the function monthly_stats_dictionary

df <- monthly_stats_dictionary(by = 'police_station_area')

test_that("Total de linhas e colunas", {
  expect_equal(nrow(df), 63)
  expect_equal(ncol(df), 5)
})

df <- monthly_stats_dictionary(by = 'municipality', value = 'standard')

test_that("Total de linhas e colunas", {
  expect_equal(nrow(df), 60)
  expect_equal(ncol(df), 5)
})

df <- monthly_stats_dictionary(by = 'municipality', value = 'per_100k')

test_that("Total de linhas e colunas", {
  expect_equal(nrow(df), 58)
  expect_equal(ncol(df), 5)
})

df <- monthly_stats_dictionary(by = 'state', value = 'standard')

test_that("Total de linhas e colunas", {
  expect_equal(nrow(df), 56)
  expect_equal(ncol(df), 6)
})

df <- monthly_stats_dictionary(by = 'state', value = 'per_100k')

test_that("Total de linhas e colunas", {
  expect_equal(nrow(df), 56)
  expect_equal(ncol(df), 5)
})
