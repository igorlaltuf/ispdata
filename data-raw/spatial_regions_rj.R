## code to prepare `spatial_regions_rj` dataset goes here

spatial_regions_rj <- sf::st_read('data-raw/grandes_regioes/LM_REGIAO_SESEG.shp') |>
  janitor::clean_names() |>
  dplyr::select(id1, regiao, geometry)|>
  sf::st_as_sf()

usethis::use_data(spatial_regions_rj, overwrite = TRUE)
