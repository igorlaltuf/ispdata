
df <- crimes_against_life(type = "violent_lethality")

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 367)
  expect_equal(ncol(df), 6)
})

df <- crimes_against_life(type = "violent_lethality_elucidation_rate")

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 15)
  expect_equal(ncol(df), 8)
})

df <- crimes_against_life(type = "officers_killed_on_duty")

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 32244)
  expect_equal(ncol(df), 5)
})

df <- crimes_against_life(type = "femicide")

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 10301)
  expect_equal(ncol(df), 6)
})
