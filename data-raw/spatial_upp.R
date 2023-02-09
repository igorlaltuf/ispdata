## code to prepare `spatial_upp` dataset goes here

spatial_upp <- sf::st_read('data-raw/limite_upp_shp/lm_upp_edit.shp') |>
  janitor::clean_names() |>
  dplyr::select(nome, nomeabrev, id_upp, datacriaca, resolucaoc) |>
  dplyr::rename(data_criacao = datacriaca)

usethis::use_data(spatial_upp, overwrite = TRUE)
