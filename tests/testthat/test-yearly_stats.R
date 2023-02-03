# test yearly stats

df <- yearly_stats(by = 'state')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 216)
  expect_equal(ncol(df), 57)
})

df <- yearly_stats(by = 'municipality')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 643)
  expect_equal(ncol(df), 57)
})
