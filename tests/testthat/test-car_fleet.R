
df <- car_fleet(by = 'month')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 239)
  expect_equal(ncol(df), 3)
})

df <- car_fleet(by = 'year')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 30)
  expect_equal(ncol(df), 2)
})
