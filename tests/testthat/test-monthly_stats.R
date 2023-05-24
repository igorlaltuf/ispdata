# Tests for the function monthly_stats
if (Sys.getenv('USERNAME') == 'igorl') {
df <- monthly_stats(by = 'cisp')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 32244)
  expect_equal(ncol(df), 63)
})

df <- monthly_stats(by = 'municipality', value = 'standard')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 9935)
  expect_equal(ncol(df), 60)
})

df <- monthly_stats(by = 'municipality', value = 'per_100k')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 7359)
  expect_equal(ncol(df), 60)
})

df <- monthly_stats(by = 'state', value = 'standard')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 383)
  expect_equal(ncol(df), 56)
})

df <- monthly_stats(by = 'state', value = 'per_100k')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 239)
  expect_equal(ncol(df), 57)
})
}
