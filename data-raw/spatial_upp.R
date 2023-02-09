## code to prepare `spatial_upp` dataset goes here

sf::st_read('data-raw/limite_upp_shp/lm_upp_edit.shp') |>
  janitor::clean_names() |>
  dplyr::select(nome, nomeabrev, id_upp, datacriaca, resolucaoc) |>
  dplyr::rename(data_criacao = datacriaca) |>
  sf::st_write("inst/extdata/spatial_upp.gpkg", compress = "deflate", append = F)
