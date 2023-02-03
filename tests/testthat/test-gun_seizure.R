
df <- gun_seizure(gun_type = "firearms" )

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 26447)
  expect_equal(ncol(df), 17)
})

df <- gun_seizure(gun_type = "edged_weapons")

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 11543)
  expect_equal(ncol(df), 6)
})
