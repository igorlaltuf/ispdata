if (Sys.getenv('USERNAME') == 'igorl') {
df <- population(data = 'cisp_monthly')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 31533)
  expect_equal(ncol(df), 4)
})

df <- population(data = 'cisp_yearly')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 3064)
  expect_equal(ncol(df), 3)
})

df <- population(data = 'muni_monthly')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 17308)
  expect_equal(ncol(df), 5)
})

df <- population(data = 'muni_yearly')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 1065)
  expect_equal(ncol(df), 3)
})

df <- population(data = 'state_monthly')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 234)
  expect_equal(ncol(df), 3)
})

df <- population(data = 'state_yearly')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 31)
  expect_equal(ncol(df), 2)
})

df <- population(data = 'upp_projection')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 14)
  expect_equal(ncol(df), 4)
})

df <- population(data = 'upp_2010')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 37)
  expect_equal(ncol(df), 3)
})
}
