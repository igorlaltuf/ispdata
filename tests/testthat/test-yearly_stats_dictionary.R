# test yearly stats

df <- yearly_stats_dictionary(by = 'state')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 53)
  expect_equal(ncol(df), 6)
})

df <- yearly_stats_dictionary(by = 'municipality')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 55)
  expect_equal(ncol(df), 5)
})




