## code to prepare `spatial_aisp` dataset goes here

sf::st_read('data-raw/shp_aisp/lm_aisp_2019.shp') |>
  janitor::clean_names() |>
  dplyr::select(aisp, risp, geometry) |>
  sf::st_write("inst/extdata/spatial_aisp.gpkg", compress = "deflate", append = F)
