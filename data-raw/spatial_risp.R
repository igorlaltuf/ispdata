## code to prepare `spatial_risp` dataset goes here

spatial_risp <- sf::st_read('data-raw/shp_risp/Limite_RISP_WGS.shp') |>
  janitor::clean_names() |>
  dplyr::select(risp, geometry)

usethis::use_data(spatial_risp, overwrite = TRUE,
                  compress = "xz")
