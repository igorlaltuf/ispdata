if (Sys.getenv('USERNAME') == 'igorl') {
df <- upp_data(data = 'stats')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 7637)
  expect_equal(ncol(df), 42)
})


df <- upp_data(data = 'dates')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 37)
  expect_equal(ncol(df), 7)
})

df <- upp_data(data = 'area_m2')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 37)
  expect_equal(ncol(df), 4)
})
}
