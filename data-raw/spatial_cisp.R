## code to prepare `spatial_cisp` dataset goes here

spatial_cisp <- sf::st_read('data-raw/shp_cisp/lm_dp_2019.shp') |>
  janitor::clean_names() |>
  dplyr::select(dp, aisp, geometry)

usethis::use_data(spatial_cisp, overwrite = TRUE)
