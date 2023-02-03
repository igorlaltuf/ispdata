
df <- gun_seizure_historical(by = 'state')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 83)
  expect_equal(ncol(df), 3)
})

df <- gun_seizure_historical(by = 'police_station_area')

test_that("Total de linhas e colunas", {
  expect_gt(nrow(df), 6205)
  expect_equal(ncol(df), 10)
})
