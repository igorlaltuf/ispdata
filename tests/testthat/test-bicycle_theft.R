# Tests for the function bicycle_theft

if (Sys.getenv('USERNAME') == 'igorl') {
df <- bicycle_theft()

test_that("Total de roubos ", {
  expect_gt(sum(df$roubo_de_bicicleta), 1384)
})

test_that("Total de furtos", {
  expect_gt(sum(df$furto_de_bicicleta), 16248)
})

test_that("Total de linhas", {
  expect_gt(nrow(df), 13199)
})

test_that("Total de colunas", {
  expect_equal(ncol(df), 5)
})
}
