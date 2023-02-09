## code to prepare `spatial_aisp` dataset goes here

spatial_aisp <- sf::st_read('data-raw/shp_aisp/lm_aisp_2019.shp') |>
  janitor::clean_names() |>
  dplyr::select(aisp, risp, geometry) |>
  sf::st_as_sf()


usethis::use_data(spatial_aisp, overwrite = TRUE)
