## code to prepare `spatial_risp` dataset goes here

sf::st_read('data-raw/shp_risp/Limite_RISP_WGS.shp') |>
  janitor::clean_names() |>
  dplyr::select(risp, geometry) |>
  sf::st_write("inst/extdata/spatial_risp.gpkg", compress = "deflate", append = F)
