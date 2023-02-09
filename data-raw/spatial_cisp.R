## code to prepare `spatial_cisp` dataset goes here

sf::st_read('data-raw/shp_cisp/lm_dp_2019.shp') |>
  janitor::clean_names() |>
  dplyr::select(dp, aisp, geometry) |>
  sf::st_write("inst/extdata/spatial_cisp.gpkg", compress = "deflate", append = F)
