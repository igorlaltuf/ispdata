## code to prepare `spatial_regions_rj` dataset goes here

sf::st_read('data-raw/grandes_regioes/LM_REGIAO_SESEG.shp') |>
  janitor::clean_names() |>
  dplyr::select(id1, regiao, geometry) |>
  sf::st_write("inst/extdata/spatial_regions_rj.gpkg", compress = "deflate", append = F)
